# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.18 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "codeGen_ppc.hh"
# pragma implementation "codeGen_inline_ppc.hh"

# include "_codeGen_ppc.cpp.incl"

# ifdef FAST_COMPILER

CodeGen* theCodeGen;

void CodeGen::moveComplicated(Location dest, Location src, bool set_cc) {
  // dest may be R0
  assert(!(isRegister(src) && isRegister(dest)), "shouldn't call this");
  Location t;
  if (isRegister(dest)) {
    t = dest;
  } else if (isRegister(src)) {
    t = src;
  } else {
    t = Temp1;
  }
  if (isRegister(src)) {
    // already in register
  } else {
    fint offset = getOffset_in_my_frame(src);
    a.lwz(t, offset, NumberOperand, SP);
  }
  
  if (set_cc)
    a.cmpwi(t, 0, NumberOperand); // set the cond codes
    
  if (isRegister(dest)) {
    // already in register
  } else {
    fint offset = getOffset_in_my_frame(dest);
    a.stw(t, offset, NumberOperand, SP);
  }
}

void CodeGen::genCountCode(int32* counter) {
  a.Comment("count # calls");
  a.load_from_address(Temp1, counter, VMAddressOperand, Temp2);
  a.addi(Temp1, Temp1, 1, NumberOperand);
  int32 lo, hi;
  a.break_up_word_for_adding((int32)counter, lo, hi);
  a.stw(Temp1, lo, VMAddressOperand, Temp2);
}


Location CodeGen::get_SPLimit(Location temp) {
  if (!UseSPLimitReg) {
    a.load_from_address( Temp1, &SPLimit, VMAddressOperand, Temp1);
    return Temp1;
  }
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      a.load_from_address( Temp1, &SPLimit, VMAddressOperand, Temp1);
      a.cmpw(Temp1, SPLimitReg);
      Label ok(a.printing);
      a.beq(ok, predict_weird);
      a.load_immediate(CReceiverReg, (int)"CodeGen::get_SPLimit: SPLimitReg != SPLimit", VMAddressOperand);
      a.branch_to(first_inst_addr(lprint_error), VMAddressOperand, temp, true);
      ok.define();        
    }
  # endif

  return SPLimitReg;
}
  
  
void CodeGen::testStackOverflow(RegisterState* s) {
  a.Comment("stack overflow/interrupt check");
  a.cmplw(SP, get_SPLimit(Temp1));  // test for stack overflow
  Label L;
  a.bge(L, predict_weird); // branch if no overflow
  assert(s->mask() != 0, "should have non-zero mask");
  assert((s->allocated & nthBit(IReceiverReg)) != 0,
         "should have at least IReceiverReg allocated");
  (void)cPrimCall(intrCheck(), s, true, true, 0);
  L.define();
}


void CodeGen::testStackOverflowForLoop( Label*& dst,  Label*& nlr, RegisterState* s) {
  //    cmp sp, splimit
  //    bge dst
  //    nop
  //    <cPrimCall interruptCheck>
   
  // (this code lifted from what used to be restart)
  
  a.Comment("stack overflow/interrupt check for loop");
  a.cmplw(SP, get_SPLimit(Temp1));  // test for stack overflow
  dst = new Label(a.printing);
  a.bge(*dst);    
  nlr = cPrimCall(intrCheck(), s, false, true, 0);
}


void CodeGen::smiOop_prologue() {
  //  andi. R0, ReceiverReg, Tag_Mask (if tag is zero is smi)
  //  beq+  cache_hit
  //  bla  missHandler 
  //   <or>
  //    li R0, low(missHandler)
  //    oris r0, r0, hi(misHandler)
  //    mtlr r0
  //    balwlrl
  // cache_hit:
  a.andi_(R0, ReceiverReg, Tag_Mask, NumberOperand);
  Label hit;
  a.beq(hit, predict_weird); // cause it's taken
  jumpTo(Memory->code->trapdoors->SendMessage_stub_td(R0), R0, UnAllocated);
  hit.define();
}

void CodeGen::floatOop_prologue() {
  // andi. R0, ReceiverReg, Float_Tag
  // bne+ cache_hit // if bit is set it is a hit
  // <call missHandler>
  // hit:
  a.andi_(R0, ReceiverReg, Float_Tag, NumberOperand);
  Label hit;
  a.bne(hit, predict_weird); // cause it's taken
  jumpTo(Memory->code->trapdoors->SendMessage_stub_td(R0), R0, UnAllocated);
  hit.define();
}

void CodeGen::memOop_prologue() {
  //   andi. R0, ReceiverReg, Mem_Tag
  //   bne+  check_map
  //   <call missHandler>
  // check_map:
  //   lw R0, map_offset - Mem_Tag(ReceiverReg)
  //   loadOop Temp1, receiver_map
  //   cmpw R0, Temp1
  //   beq+  hit
  //   <call missHandler>
  // hit:
  a.andi_(R0, ReceiverReg, Mem_Tag, NumberOperand);
  Label check_map;
  a.bne(check_map, predict_weird); // cause it's taken
  DefinedLabel miss(a.printing);
  jumpTo(Memory->code->trapdoors->SendMessage_stub_td(R0), R0, UnAllocated);
  check_map.define();
  a.lwz(R0, map_offset(), NumberOperand, ReceiverReg);
  loadOop( Temp1, L->receiverMapOop()); // load customized map
  a.cmpw(R0, Temp1);
  a.bne(miss, predict_weird); // backwards, will fall through usually
}

void CodeGen::checkOop(Label& general_miss, oop what, Location loc_to_check) {
  // test for inline cache hit (selector, delegatee)
  loadOop(Temp1, what); // load hard-wired value
  move(Temp2, loc_to_check);
  a.cmplw( Temp1, Temp2);    // compare against actual value
  if (general_miss.isDefined())  // reuse miss handler
    a.bne(general_miss, predict_weird); // is back, but will fall through
  else {
    Label hit(a.printing);
    a.beq(hit, predict_weird); // is fwd, but will go
    general_miss.define(); // define miss
    jumpTo(Memory->code->trapdoors->SendMessage_stub_td(R0), R0, UnAllocated);
    hit.define();
  }      
}

void CodeGen::checkRecompilation() {
  // di recompilation doesn't work right now - see recompile.c
  if (diLink) return;
  a.Comment("test for recompilation");
  int32 countID = theCompiler->countID;
  void* counter = &useCount[countID];
  a.load_from_address(Temp2, counter, VMAddressOperand, Temp1);
  a.addi(Temp2, Temp2, 1, NumberOperand);
  int32 lo, hi;
  a.break_up_word_for_adding((int32)counter, lo, hi);
  a.stw(Temp2, lo, VMAddressOperand, Temp1);

  fint limit = recompileLimit(theCompiler->level());
  // compare to limit
  if (fits_within_si(limit)) {
    a.cmpwi( Temp2, limit, NumberOperand );
   }
   else {
     a.load_immediate( R0, limit, NumberOperand);
     a.cmpw( Temp2, R0);
  }
  Label ok;
  a.bne(ok, predict_weird); // likely to go

  // following code modelled after call to SendDIMessage_stub; see
  // CodeGen::verifyParents.  -mabdelmalek 12/02

  // Pass a link to caller's sendDesc in LinkReg.
  // Pass a link to callee (i.e. this code being generated) in RecompileLinkReg
  
  // save link so can use link to get address of this code
  a.mflr(RecompileTempReg);
  a.stw(RecompileTempReg, saved_pc_offset * oopSize, NumberOperand, SP);
  Label next;
  a.bl(next, NumberOperand); // needed to get addr of this code
  next.define();
  a.mflr(RecompileLinkReg);
  a.mtlr(RecompileTempReg);

  // call recompiler
  char* fnaddr = diLink 
               ? Memory->code->trapdoors->DIRecompile_stub_td(R0) 
               : Memory->code->trapdoors->  Recompile_stub_td(R0);
  a.branch_to(fnaddr, PVMAddressOperand, R0, false);

  // we don't return here from Recompile_stub.  Recompile_stub jumps to new method if
  // we do on-stack replacement.  if we don't do on-stack replacement, it returns directly
  // to the verified entry point in the nmethod.  -mabdelmalek 12/5/2002
  ok.define();
}

  
void CodeGen::prologue(bool isAccessMethod, fint nargs) {
  /*
    ; save PC link
    
    mflr    r0
    stw      r0, LinkageArea.savedPC(sp); save PC link (pc to return to)
  */
  /*      
    stmw    r28, -reg_save_len(sp) ; save 4 nonvol regs
    
    ; save non volatile int regs
    
    li      scr_a, 8 + (LinkageArea.size + reg_save_len); 2 words of args, in bytes = 8 bytes
    sub     scr_a,  sp, scr_a       ; scr_a now has sp - arg length - linkage area len - reg_save_len
    li      r0, 15
    andc    scr_a, scr_a, r0  ; round down
    stw     sp, 0(scr_a)  ; save soon-to-be-old sp
    mr      sp, scr_a ; setup sp for new frame
  */
  
  // *if not DI child
  //    <smi/float/memOop prologue>
  // _verified:                       (entry point from PICs)
  //    if necessary <check selector>
  //    if necessary <check delegatee>
  // *endif DI
  
  // _diCheck:                        (entry point after recompile)
  //    <verify assignable parents>
  
  // *if using recompilation
  //    <checkRecompilation>
  // *endif
  
  // *if haveStackFrame
  //    save sp, -frameSize*oopSize, sp
  // *endif
  
  // <clear stack temporaries and excess argument locations

  // CAUTION: use only Temp1/4 for temps in prologue; other temps
  // may contain lookup parameters.
  
  fint assignableParents = L->adeps->length();
  MethodKind kind =
    isAccessMethod ? MethodKind(-1) : theCompiler->method()->kind();
  _incoming_arg_count = nargs; // for eventual putting into nmethod
  
  if (diLink == 0) {
    if (!L->isReceiverStatic()) {
      // test receiver map
#       if GENERATE_DEBUGGING_AIDS
        if (CheckAssertions)
          switch (L->lookupType()) {
           case NormalLookupType:  break;
           case StaticNormalLookupType:
           case ImplicitSelfLookupType:
           case ResendLookupType:
           case DirectedResendLookupType: fatal("shouldn't miss"); break;
           default: break;
          }
#       endif
      Map* m = L->receiverMap();
      bool imm = m == Memory->smi_map || m == Memory->float_map;
      if (m == Memory->smi_map) {
        smiOop_prologue();
      } else if (m == Memory->float_map) {
        floatOop_prologue();
      } else {
        memOop_prologue();
      }
    }
    
    verifiedOffset = a.offset();
    Label generalMiss(a.printing, NULL);
    a.Comment("verified entry point:");
    
    if (L->isPerform()) {
      a.Comment("check selector");
      checkOop(generalMiss, L->selector(), PerformSelectorLoc);
    }
    
    if (needsDelegatee(L->lookupType()) && !L->isDelegateeStatic()) {
      a.Comment("check delegatee");
      checkOop(generalMiss, L->delegatee(), PerformDelegateeLoc);
    }
  } else {
    // don't check receiver map, selector, delegatee if a DI cache miss
    assert(assignableParents > 0, "should have some di parents to check");
  }
  
  diCheckOffset = a.offset();
  a.Comment("DI entry point:");
  
  if (assignableParents > 0) {
    a.Comment("verify state of assignable parents");
    fint count = 0;
    for (fint i = 0; i < assignableParents; i ++) {
      objectLookupTarget* target = L->adeps->start()[i];
      Location t = loadPath(Temp2, target, ReceiverReg, Temp1);
      count = verifyParents(target, t, count);
    }
  }

  bool recomp = needRecompileCode(theCompiler->level());
  if (recomp) checkRecompilation();

  if (!haveStackFrame) {
     prologueAddr = NULL;
  }
  else {
    a.mflr(R0);
    prologueAddr = a.addr(); // will be used to patch stmw, and stwu below:
    a.stmw(Location(R31), -4 * 1, NumberOperand, SP);         // save nonvol registers, WILL BE PATCHED
    a.stw(R0, saved_pc_offset * oopSize, NumberOperand, SP);
    
    _need_to_save_args_on_stack = ((methodMap*) theCompiler->method()->map())->hasSubBlocks();
    // Also copy args to nonvol regs
    a.Comment("copying args to nonvol regs");
    fint r = ReceiverReg;
    num_reg_args_and_rcvr = min(nargs, NumArgRegisters) + 1; // for rcvr
    for (fint i = 0;  i < num_reg_args_and_rcvr;  ++i, ++r) {
      a.mr(Location( IReceiverReg - (r - ReceiverReg)), Location(r));
    }
    // save args on stack in case they are uplevel-accessed by a block
    // (since they cannot be changed this is just a copy).
    // really, we only need to save the arguments that are uplevel-accessed.
    // but the NIC doesn't look at _which_ arguments need to be saved: it saves
    // them all if there are any subblocks.  the SIC does better :)  -mabdelmalek 11/02
    if ( need_to_save_args_on_stack() ) {
      a.Comment("flush incoming args to stack");
      a.la(Temp1, rcvr_and_argument_offset(0) * oopSize, NumberOperand, SP);
      a.stswi( ReceiverReg, Temp1, num_reg_args_and_rcvr * oopSize);
    }
    a.Comment("next instruction will be patched by subtracting frame size");
    frame_size_neg_patchees->append(a.addr()); // will have to decrease imm field in stwu
    prologueEndAddr = a.addr(); // may be needed to add instructions to clear extra stack locations
    a.stwu(SP, -0, NumberOperand, SP); // correct frame size is patched in later
    frameCreationOffset = a.offset(); // used by nmethod to find save instr, must have frame by this point
  }
  if (GenerateCountCode) {
    int32* counter;
    if (assignableParents != 0) {
      counter = &NumberOfDIMethodCalls;
    } else if (isAccessMethod) {
      counter = &NumberOfAccessMethodCalls;
    } else if (kind == BlockMethodType) {
      counter = &NumberOfBlockMethodCalls;
    } else {
      counter = &NumberOfMethodCalls;
    }
    genCountCode(counter);
  }

  if (!isAccessMethod) {
    if (!recomp && GenerateLRUCode) {
      // this code is rarely generated in practice (recomp is usually true)
      a.Comment("reset unused bit");
      void* unused_addr = &LRUflag[Memory->code->nextNMethodID()];
      a.li(R0, 0, NumberOperand);
      a.store_to_address(R0, unused_addr, VMAddressOperand, Temp2);
    }
  
    // don't keep uplevel-accessed names in regs
    // (for now, just flush everything)
    assert(haveStackFrame, "just checking");
  }
  else {
    assert(!haveStackFrame, "just checking");
  }    
  a.Comment("End Prologue");
}


Label* CodeGen::postPrologue(RegisterState* s, bool frequentPreemption) {
  // returns address of stack overflow test
  Label* l = new DefinedLabel(a.printing);
  if (frequentPreemption) {
    // no stack test necessary: have explicit check at bci 0
    // (actually I think it is more accurate to say have
    //  frequent checks -- dmu )
  } 
  else {
    testStackOverflow(s);
  }
  return l;
}


void CodeGen::fixupFrame(RegisterState* s) {
  // window size adjustment
  assert(haveStackFrame, "should have stack frame");
  
  _number_of_saved_nonvolatile_registers  = s->number_of_saved_nonvolatile_registers();
  _number_of_memory_locals                = s->stackDepth;  // extra stack locations needed (ran out of registers)
   _max_no_of_outgoing_args_and_rcvr       = s->argDepth + 1; /* for rcvr */
  if (_includes_call_to_untrusted_C) {
    // It is possible to call a C routine that expects more arguments
    // than we actually give it.
    // In that case, the C routine will save as many as 8 registers into
    // my frame, so allocate enough space in my frame.
    _max_no_of_outgoing_args_and_rcvr = max( _max_no_of_outgoing_args_and_rcvr, NumRcvrAndArgRegisters);
  }
  frameSize = number_of_saved_nonvolatile_registers()
            + number_of_memory_locals()
            + max_no_of_outgoing_args_and_rcvr()
            + linkage_area_size                         // space for saved sp, pc, etc.
            + num_extra_locals_for_runtime;            // nmethod frame chain offset
            
  frameSize = roundTo(frameSize, frame_word_alignment); // round up to quadword boundary, so load/store multiples go as fast as possible

  
  // must fixup save/restore instructions:
  
  a.Comment("going back to load/store multiple instructions to patch them");
  a.saveExcursion( prologueAddr );
  assert(is_stmw(a.addr()), "");
  a.stmw( Location(32 - number_of_saved_nonvolatile_registers()),
                   -oopSize * number_of_saved_nonvolatile_registers(), 
                   NumberOperand, SP);
  a.endExcursion();
  
  // fixup each lmw that restores the non-vol-regs
  fint n = lmw_patchees->length();
  for (fint i = 0;  i < n;  ++i) {
    a.saveExcursion( lmw_patchees->nth(i) );
    assert(is_lmw(a.addr()), "");
    a.lmw( Location(32 - number_of_saved_nonvolatile_registers()), 
                    -oopSize * number_of_saved_nonvolatile_registers(),
                    NumberOperand, SP);
    a.endExcursion();
  }
  
  a.Comment("patching instructions that need to know frame size");
  if (PrintCompiledCode) {
    lprintf("(frame size is %d words, # rcvr & outgoing args is %d words)\n", frameSize, 
           _max_no_of_outgoing_args_and_rcvr);
  }

  // patch immediate field of each instruction in this list
  a.increase_all_immediate_fields(frame_size_patchees,      oopSize *  frameSize );
  a.increase_all_immediate_fields(frame_size_neg_patchees,  oopSize * -frameSize );
  a.increase_all_immediate_fields(outgoing_arg_patchees,    oopSize *  _max_no_of_outgoing_args_and_rcvr);

  if (s->stackDepth > 0) {
    // must clear extra stack locations:
    a.saveExcursion( prologueEndAddr );
    inst_t sp_setting_inst = *(inst_t*)a.addr();
    assert( is_stwu(sp_setting_inst), "");
    Label stack_clearing_code(a.printing);
    a.b(stack_clearing_code, NumberOperand);
    DefinedLabel back_to_the_start(a.printing);
    a.endExcursion();
    
    stack_clearing_code.define();
    a.Data(sp_setting_inst); // do the sp setting
    
    // now clear all the extra stack locations
    // not strictly necessary, but simpler this way
    
    a.li(R0, 0, NumberOperand);
    for (int i = 0;  i < s->stackDepth; ++i)
      a.stw(R0, oopSize * stackLocation_offset(i, max_no_of_outgoing_args_and_rcvr()), NumberOperand, SP);
            
    a.b(back_to_the_start, NumberOperand);
  }
}


fint CodeGen::verifyParents(objectLookupTarget* target, Location t,
                            fint count) {
  
  assignableSlotLink* l = target->links;
  assert(l != 0, "expecting an assignable parent link");
    
  for (;;) {
    // load assignable parent slot value
    a.lwz(Temp1, smiOop(l->slot->data)->byte_count() - Mem_Tag, VMAddressOperand, t);
    Label ok;
    Label miss;
    Map* targetMap = l->target->obj->map();
    
    if (l->target->value_constrained) {
      // constraint for a particular oop (ambiguity resolution)
      loadOop(Temp2, l->target->obj);         // load assumed value
      a.cmpw(Temp1, Temp2);                   // compare values
      a.beq(ok, predict_weird);               // will branch
    } 
    // check if map of parent is correct
    else if (targetMap == Memory->smi_map) {
      a.andi_(R0, Temp1, Tag_Mask, NumberOperand);        // test for integer tag
      a.beq( ok, predict_weird );           // branch if parent is integer
    } 
    else if (targetMap == Memory->float_map) {
      a.andi_(R0, Temp1, Float_Tag, NumberOperand);        // test for float tag
      a.bne(ok, predict_weird);             // branch if parent is a float
    }
    else {                                  // must be mem tag
      a.andi_(R0, Temp1, Mem_Tag, NumberOperand);           // test for mem tag
      a.beq(miss);                          // branch if parent is not mem oop

      a.lwz(Temp2, map_offset(), NumberOperand, Temp1);    // load receiver map
      loadOop(R0, targetMap->enclosing_mapOop());    // load map constraint
      a.cmpw(Temp2, R0);                    // compare w/ parent's map
      a.beq(ok, predict_weird);               // correct
    }
    
    miss.define();
    // This will be backpatched to call an nmethod, so need to leave incoming link alone.
    // Pass a link to the branch and nmln in the DILinkReg.
    // Since 3 registers are needed DILink, DITemp, DICount need to use either R0 or 
    // the counter register. Since branch_to uses the count register, we use R0 here.
    
    // save link so can use link to pass nmln addr
    a.mflr(DITempReg);
    a.stw(DITempReg, saved_pc_offset * oopSize, NumberOperand, SP); // save link for stack-crawling
    Label next;
    a.bl(next, NumberOperand); // need to get addr of nmln
    next.define();
    fint link_contents = a.offset(); // where the link reg points to
    a.mflr(DILinkReg);
    a.mtlr(DITempReg);
    
    pc_t link_incr_addr = a.addr();
    assert(DILinkReg != R0, "addi will break");
    a.addi(DILinkReg, DILinkReg, 0, NumberOperand); // will come back and backpatch
    
    loadImmediate(DICountReg, count);  // count of parents verified
    // following must be parsable to set_target_of_Self_call_site
    a.branch_to( Memory->code->trapdoors->SendDIMessage_stub_td(DITempReg), 
                 DIVMAddressOperand, DITempReg, false);
    assert(DITempReg != R0, "callee needs a nonzero reg here");
    
    fint desired_link_contents = a.offset(); // where the link would be if we could use it
    a.saveExcursion(link_incr_addr);         // go back and get the increment right
    a.addi(DILinkReg, DILinkReg, desired_link_contents - link_contents, NumberOperand);
    a.endExcursion();
    a.Data(0);                                // first  part of DI nmln
    a.Data(0);                                // second part of DI nmln
    
          
    ok.define();
    
    ++count;
    if (l->target->links) count = verifyParents(l->target, Temp1, count);
    
    l = l->next;
    if (l == 0) break;
    // if multiple dynamic parents, reload slot holder before looping (HACK!)
    t = loadPath(Temp1, target, ReceiverReg, Temp1);
  }
  
  return count;
}
  
  
void CodeGen::epilogue(Location what) {
  if ( what == IllegalLocation )
    what = IReceiverReg;

  move(ReceiverReg, what, false);
  
  restore_frame_and_return(0);
}


// factored out of epilogue for continuing NLR, too
void CodeGen::restore_frame_and_return(fint byte_offset) {
  if (haveStackFrame) {
  
    a.Comment("next instruction patched by adding frame size");
    frame_size_patchees->append(a.addr());
    a.la(SP,      saved_sp_offset * oopSize, NumberOperand, SP);  // reset SP
    a.lwz(Temp1,  saved_pc_offset * oopSize, NumberOperand, SP);             // get return link
    lmw_patchees->append(a.addr()); // so we can patch next instruction
    a.lmw(Location(R31), -4 * 1, NumberOperand, SP);         // restore nonvol registers
    if (byte_offset != 0)
      a.addi(Temp1, Temp1, byte_offset, NumberOperand);
     a.mtlr(Temp1);
  }
  else if (byte_offset != 0) {
    a.mflr(Temp1);
    a.addi(Temp1, Temp1, byte_offset, NumberOperand);
    a.mtlr(Temp1);
  } 
  a.balwlr();
}


Location CodeGen::flushToStack(Location src, RegisterState* s) {
  // flush register to its corresponding location on the stack
  // For PPC, we must allocate one. (used only for block's self)
  if (isRegister(src)) {
    Location mem_loc = s->pickPermanentStackTemp();
    fint offset = getOffset_in_my_frame(mem_loc);
    a.stw(src, offset, NumberOperand, SP);
    return mem_loc;
  }
  return src;
}


void CodeGen::reload_ByteMapBaseReg(PrimDesc* p) {
  if (UseByteMapBaseReg && p->canScavenge()) {
    // any prim that can scavenge, may expand heap,so need to reload this reg
    a.load_from_address(ByteMapBaseReg, &byte_map_base, VMAddressOperand, ByteMapBaseReg);
  }
}

Label* CodeGen::cPrimCall(PrimDesc* p, RegisterState* s,
                          bool continueNLR, bool trust_fns_arg_count, fint arg_and_rcvr_count) {
  if (!trust_fns_arg_count)
    _includes_call_to_untrusted_C = true;
  Label* where_nlr_jumps_to = NULL;
  // WARNING: following code sequences are known to get_target_of_Self_call_site
  // and set_target_of_Self_call_site
  // Also, getPrimCallEndOffset assumes continuation is right after sequence.
  if (p->canScavenge()) {
    // must save nonvols on way to C to enable stack walking for OOPS
    // Note: AddrDesc::offset_to_call_inst needs a simple constant distance from
    // lis instruction to actual branch instruction. 
    // (this is 3 in the else case.)
    // So, we cannot simply do:
    //    a.load_immediate( SaveSelfNonVolRegs_entry_point_register, (int32) first_inst_addr(p->fn()), PVMAddressOperand );
    //    a.branch_to( Memory->code->trapdoors->SaveSelfNonVolRegs_td(R0), VMAddressOperand, R0, true);
    // -- dmu 7/99
    a.li(SaveSelfNonVolRegs_arg_count_register, arg_and_rcvr_count, NumberOperand);
    a.load_immediate(    R0, (int32) Memory->code->trapdoors->SaveSelfNonVolRegs_td(R0), VMAddressOperand );
    // WARNING: this code sequence is known to get_target_of_Self_call_site(inst_t* instp)
    a.load_immediate( SaveSelfNonVolRegs_entry_point_register, (int32) first_inst_addr(p->fn()), PVMAddressOperand );
    a.mtctr(R0);
    a.balwctrl();
  }
  else
    a.branch_to( first_inst_addr(p->fn()), PVMAddressOperand, Temp1, true); // do the call
  
  // inline cache:
  Label past_nlr(a.printing); 
  a.b(past_nlr, NumberOperand);  // skip over mask and nlr code
  s->genMask(); // used register mask for GC
  
  if ( p->needsNLRCode() ) {
    reload_ByteMapBaseReg(p);  
    if (continueNLR) { // NLR returns from this method, up NLR chain (only for calling intr check after stack overflow & nonLifo trap)
      continueNonLocalReturn();
    }
    else { // do the NLR bit
      where_nlr_jumps_to = new Label(a.printing);
      a.b(*where_nlr_jumps_to, NumberOperand);
    }
  }
  past_nlr.define(); 
  reload_ByteMapBaseReg(p);
  return where_nlr_jumps_to;
}


Label* CodeGen::primFailure(Location failReceiver, Location self,
                            oop failSelector, oop selector, 
                            Location successLoc, blockOop failBlock,
                            RegisterState* s) {
  
  s->allocateArgs(2, true); // will be passing out 2 args; must keep track of these for frame construction
 
  a.andi_(R0, CResultReg, Tag_Mask, NumberOperand);   // test result's tag
  a.cmpwi(R0, Mark_Tag, NumberOperand);               // test for mark tag
  Label success(a.printing); 
  a.bne(success, predict_weird);      // jump to success if not
  
  // clone failure block if necessary
  if (failBlock == NULL) {
    // block already exists
    a.subi( Arg1, CResultReg, Mark_Tag - Mem_Tag, NumberOperand); // mask mark bit
  }
  else {
    // NOTE: this will break if blockOop::clone scavenges!
    assert(!blockClone()->canScavenge(), "rewrite this");
    
    // need to save error string
    Location saved = s->pickLocal();
    if (isRegister(saved)) {
      a.subi( saved, CResultReg, Mark_Tag - Mem_Tag, NumberOperand); // save & mask mark bit
    }
    else {
      a.subi( CResultReg, CResultReg, Mark_Tag - Mem_Tag, NumberOperand); // mask mark bit
      move(saved, CResultReg);
    }
    
    loadBlockOop(failReceiver, failBlock, s);
    move(Arg1, saved); // move err str to right place
    s->deallocate(saved);
  }
  
  // now invoke the fail block
  loadOop(Arg2, selector);
  Label* l = selfCall(s, NormalLookupType, failReceiver, self, 
                      failSelector, NULL, 2);

  assert(ResultReg == CResultReg, "exploit move after success.define");    
  
  success.define();
  move(successLoc, CResultReg);       // move result to right place
  return l;
}

  
void CodeGen::recordStore(Location dst) {
  // NB: when fixed to use register revisit call sites
  a.Comment("recordStore");
  Location t = dst == Temp1  ?  Temp2  : Temp1;
  assert(isRegister(dst), "receiver to check_store must be in a register");
  a.srwi(dst, dst, card_shift);  // shift target addr 
  a.li(R0, 0, NumberOperand);
  
  if (!UseByteMapBaseReg) {
    a.load_from_address(t, &byte_map_base, VMAddressOperand, t);
    a.stbx(R0, dst, t);
  }
  else {    
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        a.load_from_address(t, &byte_map_base, VMAddressOperand, t);
        a.cmpw(t, ByteMapBaseReg);
        Label ok(a.printing);
        a.beq(ok, predict_weird);
        a.load_immediate(CReceiverReg, (int)"CodeGen::recordStore: ByteMapBaseReg != byte_map_base", VMAddressOperand);
        a.branch_to(first_inst_addr(lprint_error), VMAddressOperand, t, true);
        ok.define();
      }
    # endif
    a.stbx(R0, dst, ByteMapBaseReg);  // set byte in map
  }
}
  
  
Label* CodeGen::selfCall(RegisterState* s, LookupType lookupType,
                         Location receiver, Location self,
                         oop selector, oop delegatee, fint argc) {


  Unused(self);
  move( ReceiverReg, receiver);
  // WARNING: following code sequences are known to get_target_of_Self_call_site
  // and set_target_of_Self_call_site
  a.branch_to(Memory->code->trapdoors->SendMessage_stub_td(R0), BPVMAddressOperand, R0, true);
  Label* l = SendDesc(s, lookupType, selector,
                      delegatee ? oop(delegatee) : oop(badOop));
  return l;
}
  
Label* CodeGen::perform(RegisterState* s, LookupType lookupType,
                        Location receiver, Location self, fint argc,
                        oop delegatee) {
  a.Comment("_Perform Primitive");
  return selfCall(s, lookupType, receiver, self,
                  as_smiOop(argc), delegatee, argc);
}


void CodeGen::assignment(Location receiver, slotDesc* s, Location val) {
  assert( isRegister(receiver), "receiver must be a register");
  a.Comment("Begin Simple Assignment");
  Location t;
  if (isRegister(val) && val != CReceiverReg) {
     t = val;
  } 
  else {
    t = Temp1;
    move(t, val);    // load argument
  }
  int32 offset = smiOop(s->data)->byte_count() - Mem_Tag;
  a.stw(t, offset, NumberOperand, receiver); // store object data slot contents
  a.addi(Temp1, receiver, offset, NumberOperand); // compute store address
  recordStore(Temp1); // NB: recordStore will clobber Temp2 till I put in ByteMapBaseReg

  a.Comment("End Simple Assignment");
}


void CodeGen::assignment(Location receiver,
                         realSlotRef* path, Location val,
                         bool isMem) {
  // Hackyness inherited from SPARC:
  // I am only called from CodeGen::assignmentCode, and he caches receiver reg in Temp2,
  // so I CANNOT clobber Temp2.
  a.Comment("Begin Assignment");
  Location t;
  if (isRegister(val) && val != CReceiverReg) {
    t = val;
  } 
  else {
    assert(receiver != Temp1, "");
    t = Temp2;
    move(t, val);    // load argument
  }
  int32 offset = smiOop(path->desc->data)->byte_count() - Mem_Tag;
  if (path->holder->is_object_or_map()) {
    Location t1 = loadPath(CReceiverReg, path->holder, receiver, Temp1); // clobbers CReceiverReg
    a.stw(t, offset, NumberOperand, t1);    // store object data slot contents
    if (isMem) {
      a.addi(Temp1, t1, offset, NumberOperand);    // compute store address
      if (t == Temp2)
        fatal("NB: recordStore will clobber Temp2 till I put in ByteMapBaseReg");
      recordStore(Temp1); 
    }
  } else {
    fatal("don't support vframe lookups yet");
  }
  a.Comment("End Assignment");
}

void CodeGen::loadBlockParent(Location block, Location dst) {
  // load [block+scope_offset], dst
  block = moveToReg(block, dst);
  a.lwz(dst, scope_offset(), NumberOperand, block);
}

fint CodeGen::getOffset_in_my_frame(Location src) {
  if ( is_ArgStackLocation(src) ) {
    fint i = arg_index_for_ArgStackLocation(src) + 1 /* rcvr */;
    return rcvr_and_argument_offset(i) * oopSize;
  }
  if ( is_IArgStackLocation(src) ) {
    fint i = arg_index_for_IArgStackLocation(src) + 1 /* rcvr */;
    a.Comment("next instruction patched by adding frame size");
    frame_size_patchees->append(a.addr()); // caller's sp, will have to add in frame size
    return rcvr_and_argument_offset(i) * oopSize;
  }
  if (is_StackLocation(src)) {
    // src is a stack location, allocated after linkage area and outgoing args
    // (will need patching)
    a.Comment("next instruction will be increased by # of rcvr + outgoing args");
    outgoing_arg_patchees->append(a.addr());
    return rcvr_and_argument_offset(index_for_StackLocation(src)) * oopSize;
  }
  if (src == PerformSelectorLoc)   return PerformSelectorLoc_sp_offset;  
  if (src == PerformDelegateeLoc)  return PerformDelegateeLoc_sp_offset; 
  ShouldNotReachHere();
  return 0;
}


void CodeGen::loadSaved(Location dest, Location src,
                        Location sp, compiled_vframe* src_vf) {
  // Load location from a frame on the stack; sp is that frame's 
  // block home (SP on PPC) and frameSz its size.
  
  // PPC version caches rcvr and args in IRegisters
  // Only works for loading, so put this here:
  fint frameSz = src_vf->code->frameSize();
  fint sp_offset;
  if (isIArgRegister(src)) {
    // incoming args are saved in sender's frame after link area
    sp_offset = frameSz + rcvr_and_argument_offset(R31 - src);
  }
  else if (is_StackLocation(src)) {
    // src is a stack location, allocated after linkage area and outgoing args
    sp_offset =  stackLocation_offset(index_for_StackLocation(src), src_vf->code->max_no_of_outgoing_args_and_rcvr());
  }
  else if (isExtraIArgRegister(src)) {
    // stored in incoming arguments area, based on CALLER's sp
    sp_offset = frameSz + rcvr_and_argument_offset(1 /*rcvr*/ + arg_index_for_IArgStackLocation(src));
  }
  else
    ShouldNotReachHere();
  sp_offset *= oopSize;
  if (isRegister(dest)) {
    a.lwz(dest, sp_offset, NumberOperand, sp);
  } 
  else {
    a.lwz(Temp1, sp_offset, NumberOperand, sp);
    move(dest, Temp1);
  }
}

  
void CodeGen::storeSaved(Location         dst,    Location sp,
                         compiled_vframe* dst_vf, Location value) {
  fint frameSz = dst_vf->code->frameSize();
  assert(isRegister(sp), "must be a register");
  assert(is_StackLocation(dst), ""); // all up-level stored locs are stack-locations (mach stack, not expr stack)
  // dst is a stack location, allocated after linkage area and outgoing args
  fint sp_offset =  stackLocation_offset(index_for_StackLocation(dst), dst_vf->code->max_no_of_outgoing_args_and_rcvr());
  sp_offset *= oopSize;
  assert(sp != R0, "messed up register assignment");
  Location t = moveToReg(value, R0);
  a.stw(t, sp_offset, NumberOperand, sp);
}

#ifdef UNUSED
void CodeGen::loadSender(Location dest, Location sp) {
  // load frame's sender
  a.lwz(dest, saved_sp_offset * oopSize, NumberOperand, sp);
}
#endif

  
void CodeGen::lookup(Location dest, realSlotRef* path, Location receiver) {
  // <loadPath dest, path, receiver>
  // load receiver/dest/t, offset - Mem_Tag, dest/t
  // <move t, dest>
  
  // Since called from CodeGen::loadPath, cannot clobber Temp2
    
  Location t;
  if (isRegister(dest)) {
    t = dest;
  } else {
    t = Temp1;
  }
  if (path->holder->is_object_or_map()) {
    Location t1 = loadPath(t, path->holder, receiver, Temp1);
    a.lwz(t, smiOop(path->desc->data)->byte_count() - Mem_Tag, NumberOperand, t1);
    // load data slot
  } else {
    fatal("don't support vframe lookups");
  }
  move(dest, t);
}
  
      
static int32 nrOfRestarts = 0;


// load NLR registers
void CodeGen::prepareNLR(Location result, Location scope, smi homeID) {
  // <move scope, NLRHomeReg>
  // <loadImmediate homeID, NLRHomeIDReg>
  // <move result, NLRResultReg>
  assert(scope != NLRResultReg, "wrong reg alloc (scope is always Temp1)");
  move(NLRResultReg, result);
  move(NLRHomeReg, scope);
  loadImmediate(NLRHomeIDReg, homeID);
}

void CodeGen::testAndContinueNLR(smi homeID) {
  Label cont(a.printing);
  Label doNLR(a.printing);
  if (homeID) {       // note: will be 0 if no inlining
    a.Untested("CodeGen::testAndContinueNLR1", Temp1, true); // need SIC to test this
    if (fits_within_ui(homeID) ) {
      a.Untested("CodeGen::testAndContinueNLR2", Temp1, true);  // need SIC to test this
      a.cmplwi( NLRHomeIDReg, homeID, NumberOperand);
    } 
    else {
      a.Untested("CodeGen::testAndContinueNLR3", Temp1, true);  // need SIC to test this
      loadImmediate(Temp1, homeID);
      a.cmplw( NLRHomeIDReg, Temp1);
    }
    a.bne(doNLR);
  }
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      a.andi_(R0, NLRHomeReg, 3, NumberOperand);
      Label ok(a.printing);
      a.beq(ok, predict_weird);
      a.Untested("OOPS: bad NLRHOME", Temp1, true); // need SIC to test this
      ok.define();
    }
  # endif
  a.cmpw(SP, NLRHomeReg);
  a.beq(cont);
  doNLR.define();
  continueNonLocalReturn();
  cont.define();
  epilogue(NLRResultReg);
}

// continue NLR (return through caller's inline cache)
void CodeGen::continueNonLocalReturn() {
  assert(haveStackFrame, "should have stack frame");
  restore_frame_and_return(sendDesc::non_local_return_offset);
}

void CodeGen::zapBlock(Location block, bool memoized) {
  // <move block, t>
  // *if memoized
  //    subcc block/t, 0, g0
  //    bne,a _done           // do work in delay slot
  // *end
  // store block/t, scopeOffset, G0
  // _done: ...
  
  Location t;
  a.Comment("zap block");
  if (isRegister(block)) {
    t = block;
  } else {
    assert(Temp1 != block, "");
    t = Temp1;
  }
  move(t, block, memoized); // set cc if memoized: was block generated?
  Label done;
  if (memoized) {
    a.beq(done, predict_weird);     // br if no block, otherwize zap, the no block case probably likely
  }
  a.li(R0, 0, NumberOperand);
  a.stw(R0, scope_offset(), NumberOperand, t);    // zap the block
  done.define();
}
  
Label* CodeGen::SendDesc(RegisterState* s, LookupType lookupType,
                         oop selector, oop delegatee) {
  Label past_send_desc(a.printing);
  a.b(past_send_desc, NumberOperand);
  s->genMask();                               // mask of used regs
  Label* l = new Label(a.printing);
  a.b(*l, NumberOperand);                      // non-local return code
  a.Zero();   // nmlns
  a.Zero();
  if (selector != badOop) {
    if (isPerformLookupType(lookupType)) {
      assert_smi(selector, "should be an integer argcount");
      a.Data(smiOop(selector)->value());      // really arg count
    } else {
      assert_string(selector, "should be a string constant");
      a.Data(selector);                       // constant selector
    }
  }
  
#   ifdef SIC_COMPILER
  if (theCompiler->containsLoop) {
    // need counters for the sends to know how often the loop executes
    a.Data(withCountBits(lookupType, Counting));
  } 
  else {
    a.Data(lookupType);
  }
#   else
    a.Data(lookupType);
#   endif
  
#   if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions)
    switch (lookupType) {
     case DirectedResendLookupType:
      assert(lookupType & DelegateeStaticBit, "should have static delegatee");
      assert_string(delegatee, "should be a string");
      // fall through
     case ImplicitSelfLookupType:
     case ResendLookupType:
     case StaticNormalLookupType:
     case NormalLookupType:
      assert(!isPerformLookupType(lookupType),
             "should have a static selector");
      assert_string(selector, "should be a string");
      break;
     default: break;
    }
#   endif
  if (delegatee != badOop) {
    assert(needsDelegatee(lookupType), "shouldn't have a delegatee");
    a.Data(delegatee);
  }
  past_send_desc.define();
  return l;
}

Label* CodeGen::branch() {
  Label* L = new Label(a.printing);
  a.b(*L, NumberOperand);
  return L;
}


Label* CodeGen::unconditionalBranchCode( Label* dst,  
                                         bool allowPreemption, 
                                         RegisterState* s) {
  //    if allowPreemption <cPrimCall interruptCheck>
  //    bra,a dst
  
  // (this code lifted from what used to be restart)
  
  Label* nlr = NULL;
  if ( !allowPreemption) { 
    nlr = NULL;
  } 
  else {
    Label* dst1 = NULL;
    testStackOverflowForLoop(dst1, nlr, s); // allocs label and sets dst1
    dst->unify( dst1 );
  }
  a.b(*dst, NumberOperand);
  return nlr;
}


Label* CodeGen::conditionalBranchCode( Location testMe, 
                                       oop target, 
                                       Label* dst, 
                                       bool allowPreemption,  
                                       RegisterState* s) {
  //   <loadOop target_oop t1>
  //   <move    testMe     t2>
  //   cmp  t1, t2
  //   if no allowPreemption:
  //     beq  dst
  //     nop
  //   if allowPreemption:
  //     bne  end
  //     <unconditionalBranch dst>
  //     end:
   
  loadOop( Temp1, target );
  move( Temp2, testMe, false);
  a.cmplw(Temp1, Temp2);

  if ( !allowPreemption ) {
    a.beq(*dst);
    return NULL; // no nlr
  }
  Label end;
  a.bne(end);
  Label* nlr = unconditionalBranchCode( dst, true, s);
  end.define();
  return nlr;
}


Label* CodeGen::indexedBranchCode( Location        testMe, 
                                   LabelList*      labels,
                                   bool            allowPreemption,
                                   RegisterState*  s) {
  // if allowPreemption
  //   <testStackOverflowForLoop( afterTest ) >
  // afterTest:
  // 
  //   <move testMe, t1>
  //   <loadOop smiOop of label length, t2>
  //   tcmp t2, t1
  //   bvs end
  //   nop
  //   bleu end
  //   nop
  //   call .+8
  //   add t1, o7, t1
  //   jump t1, 12, g0
  //    bra L1
  //    bra L2
  //    ...
  // end:
  
  Label* nlr= NULL;
  if (allowPreemption) {
    // Ideally would only do this in the arms that actually do
    // branch back.
    // Beware: the stack overflow test could call other code that
    // could clobber Temp1 and Temp2, so it cannot be in the
    // middle somewhere. -- dmu
    Label* afterTest = NULL;
    testStackOverflowForLoop( afterTest, nlr, s ); // sets afterTest
    afterTest->define();
  }
  
  move( Temp1, testMe);
  a.andi_(R0, Temp1, Mem_Tag, NumberOperand); // extract tag
  Label end;
  a.bne( end ); // goto end if not int
  loadOop( Temp2, as_smiOop(labels->length()));
  a.cmplw(Temp2, Temp1);   // use unsigned comp to catch negative number
  a.ble(end); // goto end if index is out of bounds
  
  Label L(a.printing);
  a.bl(L, NumberOperand); // get pc of next inst into link
  pc_t link_reg_value= a.addr();
  L.define();
  
  const int32 indexShift = 2 - Tag_Size;
  assert(indexShift == 0, "no shift needed");
  a.mflr(R0);
  a.add(Temp1, R0, Temp1); // and displacement to link
  const int32 bytes_from_link_value_to_jumps = 20;
  a.addi(Temp1, Temp1, bytes_from_link_value_to_jumps, NumberOperand); // add in bytes from link setting to first jump
  a.mtlr(Temp1);
  a.balwlr();
  pc_t start_of_jumps= a.addr();
  assert( bytes_from_link_value_to_jumps == start_of_jumps - link_reg_value, "recount");

  for (fint i = 0;  i < labels->length(); ++i) {
    a.b(*labels->nth(i), NumberOperand);
  }
  end.define();
  return nlr;
}


void CodeGen::loadImmediate(Location dest, int32 value) {
  // *if p is 0...
  //   <move g0, dest>
  // *else...
  //   *if p is small...
  //      or g0, value, t/dest
  //   *else...
  //      sethi value, t/dest
  //      add t/dest, value, t/dest
  //   *end
  //   <move t, dest>
  // *end
  
  Location t = isRegister(dest) ? dest : Temp1;
  a.load_immediate(t, value, NumberOperand);
  move(dest, t);
}

// -1 = recvr, 0 = first arg
// move data from "from" to outgoing arg location for argNo
void CodeGen::loadArg(fint argNo, Location from, bool isPrimCall) {
  Unused(isPrimCall);
  move( argNo == -1  ?  ReceiverReg  :  ArgLocation(argNo),
        from);
}

void CodeGen::loadOop(Location dest, Location src_register, slotDesc* s) {
  // must be able to cope with loading into R0
  Location t = isRegister(dest) ? dest : Temp1;
  int32 offset = smiOop(s->data)->byte_count() - Mem_Tag;
  a.lwz(t, offset, NumberOperand, src_register);
  if (dest != t) {
    move(dest, t);
  }
}

void CodeGen::loadOop(Location dest, oop p) {
  // must be able to cope with loading into R0
  Location t = isRegister(dest) ? dest : Temp1;
  a.load_immediate(t, (int32)p, OopOperand);
  move(dest, t);
}


void CodeGen::loadBlockOop(Location dest, slotsOop p, RegisterState* s){
  //   <loadOop p, rr>
  //   <move sp, arg1>
  //   <cPrimCall BlockClone>
  //   <move rr, dest>
  
  a.Comment("Begin Block Cloning");
  s->allocateArgs(1, true);                   // track args for frame construction    
  loadOop(CReceiverReg, p);                   // load block to clone
  move(Arg1, SP);                             // load frame oop for block
  PrimDesc* pd = blockClone();
  assert(! pd->needsNLRCode(), "rewrite this - must backpatch NLR code");
  Label* l = cPrimCall(pd, s, false, true, 2 /* 1 arg + rcvr */);
  assert(l == NULL, "shouldn't need a label");
  move(dest, ResultReg);
}


void CodeGen::nonLifoTrap(RegisterState* s) {
  static PrimDesc* non_lifo_abort = NULL;
  if (non_lifo_abort == NULL)
    non_lifo_abort = getPrimDescOfFunction(
                       fntype(&NLRSupport::non_lifo_abort), 
                       true);
  
  Label next(a.printing);
  a.bl(next, NumberOperand); // prim needs some PC in this method
  next.define();
  a.mflr(CReceiverReg);
  Label* nlr_dest = cPrimCall(non_lifo_abort, s, true, true, 1);
  assert(nlr_dest == NULL, "should not need a label");
}


void CodeGen::initialize_for_platform() {
  // only used for instructions that flush arguments
  frame_size_patchees     = new AddressList(1000);
  frame_size_neg_patchees = new AddressList(1000);
  lmw_patchees            = new AddressList(1000);
  outgoing_arg_patchees   = new AddressList(1000);
  
  _max_no_of_outgoing_args_and_rcvr        = 0;
  _number_of_saved_nonvolatile_registers   = 0;
  _number_of_memory_locals                 = 0;
  _need_to_save_args_on_stack              = false;
  _includes_call_to_untrusted_C            = false;  

}

  

void CodeGen::assignmentCode(realSlotRef* dataRef) {
  prologue(true, 0 );
  move(Arg2, ReceiverReg); // GAK: need to return receiver, not parent object holding data slot
  assignment(ReceiverReg, dataRef, ArgLocation(0));
  epilogue(Arg2);
}


# endif // FAST_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
