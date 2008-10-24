# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "codeGen_i386.hh"
# pragma implementation "codeGen_inline_i386.hh"

# include "_codeGen_i386.cpp.incl"

# ifdef FAST_COMPILER

CodeGen* theCodeGen;


void CodeGen::genCountCode(int32* counter) {
  a.Comment("count # calls");
  a.Untested("genCountCode");
  a.incl( no_reg, (int32)counter, VMAddressOperand);
}

  
void CodeGen::testStackOverflow(RegisterState* s) {
  a.Comment("stack overflow/interrupt check");
  a.cmpl( no_reg, int32(&SPLimit), VMAddressOperand, esp);
  Label ok;
  // jump if no preempt, if esp > SPLimit, remember asm is backwards from intel, sigh
  a.ja(&ok); 

  (void)cPrimCall(intrCheck(), s, true, true, 0);

  ok.define();
}


void CodeGen::testStackOverflowForLoop( Label*& dst,  Label*& nlr, RegisterState* s) {
  //    cmp sp, splimit
  //    bge dst
  //    nop
  //    <cPrimCall interruptCheck>
   
  // (this code lifted from what used to be restart)
  
  a.Comment("stack overflow/interrupt check for loop");
  a.cmpl( no_reg, int32(&SPLimit), VMAddressOperand, esp);
  dst = new Label(a.printing);
  a.ja(dst); // ok
  nlr = cPrimCall(intrCheck(), s, false, true, 0);
}

# define LRCVR_BDT  leaf_rcvr_base, leaf_rcvr_disp, leaf_rcvr_type

void CodeGen::smiOop_prologue() {
  a.testl( Tag_Mask, NumberOperand, LRCVR_BDT);
  a.jne((int32)SendMessage_stub, PVMAddressOperand);
}


void CodeGen::floatOop_prologue() {
  a.btl( Float_Tag_bit_i386, LRCVR_BDT);
  // if bit set must be hit, otherwise is mark
  a.jnc( (int32)SendMessage_stub, PVMAddressOperand);
}


void CodeGen::memOop_prologue() {
  a.movl(LRCVR_BDT, Temp1);
  a.btl(Mem_Tag_bit_i386, Temp1);
  // if bit set must be hit, otherwise is mark
  a.jnc( (int32)SendMessage_stub, PVMAddressOperand);

  // check_map:
  a.movl( Temp1, map_offset(), NumberOperand, ebx);
  a.cmpl( (int32)L->receiverMapOop(), OopOperand, ebx);
  a.jne((int32)SendMessage_stub, PVMAddressOperand);
}


void CodeGen::checkOop(Label& general_miss, oop what, Location loc_to_check) {
  a.Comment("checkOop");
  assert(isRegister(loc_to_check), "must be reg");
  a.cmpl( (int32)what, OopOperand, loc_to_check);
  a.jne( (int32)SendMessage_stub, PVMAddressOperand );
}


void CodeGen::checkRecompilation() {

  a.Comment("checkRecompilation");
  // di recompilation doesn't work right now - see recompile.c
  if (diLink) return;

  a.Comment("test for recompilation");
  int32 countID = theCompiler->countID;
  void* counter = &useCount[countID];
  a.leal(no_reg, int32(counter), VMAddressOperand, Temp2);
  a.movl(Temp2, 0, NumberOperand, Temp1);
  a.incl(Temp1);
  a.movl(Temp1, Temp2, 0, NumberOperand);

  fint limit = recompileLimit(theCompiler->level());
  // compare to limit
  a.cmpl(limit, NumberOperand, Temp1);
  Label ok;
  a.jne(&ok);


  // (no frame yet)
  
  // Pass a link to caller's sendDesc in LinkReg.
  // Pass a link to callee (i.e. this code being generated) in RecompileLinkReg
  
  // pass original return pc in normal place, push extra return pc on stack

  // call recompiler
  int32 fnaddr = diLink 
               ?   (int32)DIRecompile_stub 
               :   (int32)Recompile_stub;
  a.call(fnaddr, PVMAddressOperand);
  a.hlt();

  // we don't return here from Recompile_stub.  Recompile_stub jumps to new method if
  // we do on-stack replacement.  if we don't do on-stack replacement, it returns directly
  // to the verified entry point in the nmethod.  -mabdelmalek 12/5/2002

  ok.define();
}

  
void CodeGen::prologue(bool isAccessMethod, fint nargs) {
  /*
    ; make stack
    enter 1-last_extra_offset*4, $0 // make space for current_pc nmethod_frame_chain
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
  

  a.Comment("prologue");
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
      Location t = loadPath(Temp2, target, LReceiverReg, Temp1);
      count = verifyParents(target, t, count);
    }
  }

  bool recomp = needRecompileCode(theCompiler->level());
  if (recomp) checkRecompilation();

  if (!haveStackFrame) {
     prologueAddr = NULL;
  }
  else {
    a.Comment("make stack frame (next instruction will be backpatched)");
    a.enter(-0 * oopSize); // will be backpatched for locals
    prologueAddr = a.addr(); // will be used to patch enter with right frame size
    frameCreationOffset = a.offset(); // used by nmethod to find save instr, must have frame by this point  XXXintel really?
    callPatchAddr = a.addr();
    a.nop(); a.nop(); a.nop(); a.nop(); a.nop(); 
    endCallPatchAddr = a.addr();
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
      a.movl(0, NumberOperand, no_reg, int32(unused_addr), VMAddressOperand);
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
  assert(is_end_of_enter(prologueAddr), "enter?");  

  // must include permanents and stack: local slots, blocks and stack
  _number_of_memory_locals                = s->stackDepth;  

  fint    min_space_to_reserve = s->stackDepth + s->argDepth + s->rcvrDepth + num_extra_locals_for_runtime;
  fint    min_space_from_incoming_rcvr_to_outgoing_rcvr = min_space_to_reserve + ircvr_offset /*pc, ebp*/;
  fint actual_space_from_incoming_rcvr_to_outgoing_rcvr = roundTo(min_space_from_incoming_rcvr_to_outgoing_rcvr, frame_word_alignment);
  fint actual_space_to_reserve = min_space_to_reserve 
                               + actual_space_from_incoming_rcvr_to_outgoing_rcvr
                                  - min_space_from_incoming_rcvr_to_outgoing_rcvr;
  frameSize = actual_space_from_incoming_rcvr_to_outgoing_rcvr;
  assert((frameSize & (frame_word_alignment - 1))  == 0, "alignment");
  set_space_reserved_by_enter_instruction(prologueAddr, actual_space_to_reserve);
  
  if (number_of_memory_locals()  >  sizeof(RegisterString) * BitsPerByte) {
    // must clear extra stack locations:
    Label patches(a.printing);
    a.saveExcursion( callPatchAddr );
    a.jmp(&patches);
    DefinedLabel return_from_patches(a.printing);
    assert(a.addr() == endCallPatchAddr, "???");
    a.endExcursion();
    
    a.Comment("zero locations not in mask()");
    patches.define();
    for ( fint i = sizeof(RegisterString) * BitsPerByte;  i < number_of_memory_locals();  ++i) {
      Location r;  int32 d;  OperandType t;
      reg_disp_type_of_loc(&r, &d, &t, StackLocation_for_index(i));
      a.movl(0, NumberOperand, r, d, t);
    }
    a.jmp(&return_from_patches);
  }
}


fint CodeGen::verifyParents(objectLookupTarget* target, Location t, fint count) {
  
  
  a.Comment("verify");
  assert(target->links != NULL, "expecting an assignable parent link");
    
  for ( assignableSlotLink* l = target->links; ; ) {
    // load assignable parent slot value
    a.movl(t, smiOop(l->slot->data)->byte_count() - Mem_Tag, VMAddressOperand,  Temp1);
    Label ok;
    Label miss;
    Map* targetMap = l->target->obj->map();
    
    if (l->target->value_constrained) {
      // constraint for a particular oop (ambiguity resolution)
      loadOop(Temp2, l->target->obj);         // load assumed value
      a.cmpl(Temp1, Temp2);                   // compare values
      a.je(&ok);               // will branch
    } 
    // check if map of parent is correct
    else if (targetMap == Memory->smi_map) {
      a.testl(Tag_Mask, NumberOperand, Temp1);        // test for integer tag
      a.je( &ok );                                     // branch if parent is integer
    } 
    else if (targetMap == Memory->float_map) {
      a.btl( Float_Tag_bit_i386, Temp1);
      // if bit set must be hit, otherwise is mark
      a.jc(&ok);             // branch if parent is a float
    }
    else {                                  // must be mem tag
      a.btl(Mem_Tag_bit_i386, Temp1);
      // if bit set must be hit, otherwise is mark
      a.jnc(&miss);                          // branch if parent is not mem oop

      a.movl(Temp1, map_offset(), NumberOperand, Temp2);    // load receiver map
      a.cmpl((int32)targetMap->enclosing_mapOop(), OopOperand, Temp2); // cmp to map constraint
      a.je(&ok);               // correct
    }
    
    miss.define();
    // This will be backpatched to call an nmethod, so need to leave incoming link alone.
    // Must look like the original call to me plus extra info in regs
    // Pass a link to the branch and nmln in the DILinkReg.
    a.movl(count, NumberOperand, DICountReg);  // count of parents verified
    
    // must align nmln to follow
    // There is a call coming, each 5 bytes, so want pc + 5 to be 0 mod 4.
    // See align * in asmDefs_gcc_i386.s
    // get ic value to pass in, cannot use call cause of backpatching, etc.
    Label next;
    a.call(&next);
    next.define(); 

    // two tasks: compute amount to add to savedPC so it simulates a call: must point to after the jmp below
    // Also, just add enough nops so that nmln after call is word-alligned
    
    fint bytes_from_here_to_after_jmp_before_alignment = 1 /* popl */ + 3 /* addl */ + 5 /* jmp */;
    int32 here = a.offset();
    fint word_fraction_from_here_to_after_jmp_before_alignment = (here + bytes_from_here_to_after_jmp_before_alignment ) & 3;    
    fint num_nops = (BytesPerWord - word_fraction_from_here_to_after_jmp_before_alignment) & (BytesPerWord-1);
    fint bytes_from_here_to_after_jmp = bytes_from_here_to_after_jmp_before_alignment + num_nops;
    
    for (fint i = 0;  i < num_nops; ++i) a.nop();
    

    a.popl(DIInlineCacheReg); // 1 byte, prepare to calculate IC addr below
    a.addl(bytes_from_here_to_after_jmp, NumberOperand, DIInlineCacheReg);  // 3 bytes, finish calc IC addr below
    // following must be parsable to set_target_of_Self_call_site
    a.jmp( (int32)SendDIMessage_stub, DIVMAddressOperand);
    assert( a.offset() == here + bytes_from_here_to_after_jmp, "checking");
    assert((a.offset() & (BytesPerWord-1)) == 0, "must be aligned");
    a.Data(0);                                // first  part of DI nmln
    a.Data(0);                                // second part of DI nmln
    
    a.hlt();
          
    ok.define();
    
    ++count;
    if (l->target->links) count = verifyParents(l->target, Temp1, count);
    
    l = l->next;
    if (l == 0)
      break;
    // if multiple dynamic parents, reload slot holder before looping (HACK!)
    t = loadPath(Temp1, target, LReceiverReg, Temp1);
  }
  
  return count;
}
  
  
void CodeGen::epilogue(Location what) {
  a.Comment("epilogue");
  move(ResultReg, what);
  restore_frame_and_return(0);
}


// factored out of epilogue for continuing NLR, too
void CodeGen::restore_frame_and_return(fint byte_offset) {
  a.Comment("restore_frame_and_return");
  if (haveStackFrame)
    a.leave();

  if (byte_offset != 0)
    a.addl(byte_offset, NumberOperand,  esp, leaf_pc_offset, NumberOperand);

  a.ret();
}



Location CodeGen::flushToStack(Location src, RegisterState* s) {
  return src;
}

   
void CodeGen::reload_ByteMapBaseReg(PrimDesc* p) {
  if (UseByteMapBaseReg && p->canScavenge()) {
    a.leal(no_reg, (int32)&byte_map_base, VMAddressOperand, ByteMapBaseReg);
  }
}



Label* CodeGen::cPrimCall(PrimDesc* p, RegisterState* s,
                          bool continueNLR, bool trust_fns_arg_count, fint arg_and_rcvr_count) {

  a.Comment("cPrimCall");
  Label* where_nlr_jumps_to = NULL;
  // WARNING: following code sequences are known to get_target_of_Self_call_site
  // and set_target_of_Self_call_site
  // Also, getPrimCallEndOffset assumes continuation is right after sequence.

  a.call( (int32) first_inst_addr(p->fn()), PVMAddressOperand );
  
  // inline cache:
  Label past_nlr(a.printing); 
  a.jmp(&past_nlr);  // skip over mask and nlr code
  s->genMask(); // used register mask for GC
   
  if ( p->needsNLRCode() ) {
    if (continueNLR) { // NLR returns from this method, up NLR chain (only for calling intr check after stack overflow & nonLifo trap)
      continueNonLocalReturn();
    } 
    else { // do the NLR bit
      where_nlr_jumps_to = new Label(a.printing);
      a.jmp(where_nlr_jumps_to);
    }
  }
  past_nlr.define(); 

  return where_nlr_jumps_to;
}


Label* CodeGen::primFailure(Location failReceiver, Location self,
                            oop failSelector, oop selector, 
                            Location successLoc, blockOop failBlock,
                            RegisterState* s) {
  a.Comment("primFailure");
  s->allocateArgs(2, true); // will be passing out 2 args; must keep track of these for frame construction
  
  assert(CResultReg == ResultReg, "for next instruction; may be SelfABI or C ABI");
  Location result = CResultReg;
  assert(result != Temp2, "???");
  
  a.movl(result, Temp2);
  a.andl(Tag_Mask, NumberOperand, Temp2);   // test result's tag
  a.cmpl(Mark_Tag, NumberOperand, Temp2);
  Label success(a.printing);
  a.jne(&success);      // jump to success if not

  a.subl( Mark_Tag - Mem_Tag, NumberOperand, result );

  // clone failure block if necessary
  if (failBlock == NULL) {
    // block already exists
    move(ArgLocation(0), result);
  }
  else {
    Location saved = s->pickLocal();
    move(saved, result); // save error string
    loadBlockOop(failReceiver, failBlock, s);
    move(ArgLocation(0), saved);
    s->deallocate(saved);
  }
  
  loadOop(ArgLocation(1), selector); 
  
  // now invoke the fail block
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
  assert(isRegister(dst), "receiver to check_store must be in a register");
  a.shrl(card_shift, NumberOperand, dst); // shift target addr
  a.addl(no_reg, (int32)&byte_map_base, VMAddressOperand, dst); // add start of map to dst
  a.movb(0, dst, 0, VMAddressOperand);
}
  
  
Label* CodeGen::selfCall(RegisterState* s, LookupType lookupType,
                         Location receiver, Location self,
                         oop selector, oop delegatee, fint argc) {

  a.Comment("selfCall");
  Unused(self);

  move( ReceiverReg, receiver, Temp1);

  // WARNING: following code sequences are known to get_target_of_Self_call_site
  // and set_target_of_Self_call_site
  
  // must align nmln to follow
  // There are a call and two jumps coming, each 5 bytes, so want pc to be 1 mod 4.
  // See align * in asmDefs_gcc_i386.s
  fint x = ((fint)a.offset() - 1) & 3;
  fint num_nops = (4 - x) & 3;
  for (fint i = 0;  i < num_nops; ++i) a.nop();
  a.call((int32)SendMessage_stub, BPVMAddressOperand);
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
  // this one called for impl self, arg on stack
  a.Comment("Begin Simple Assignment");
  assert(!isRegister(receiver) && !isRegister(val), 
    "called from genReceiverDataAccess, rcvr is self, val is arg or local, check this so I can use Temp[12]");
  move(Temp2, receiver);
  int32 offset = smiOop(s->data)->byte_count() - Mem_Tag;
  a.leal(Temp2, offset, NumberOperand, Temp2); // store object data slot contents
  move(Temp1, val);
  a.movl(Temp1, Temp2, 0, NumberOperand); // store object data slot contents
  recordStore(Temp2); // NB: recordStore will clobber Temp2 till I put in ByteMapBaseReg
  a.Comment("End Simple Assignment");
}


void CodeGen::assignment(Location receiver,
                         realSlotRef* path, Location val,
                         bool isMem) {
  a.Comment("Begin Assignment");
  // called from assignmentCode; real assignment method
  int32 offset = smiOop(path->desc->data)->byte_count() - Mem_Tag;
  if (path->holder->is_object_or_map()) {
    Location tmp = val == Temp1 ? Temp2 : Temp1;
    bool yipes = tmp == receiver;
    if (yipes) a.pushl(val);
    
    Location tr = loadPath(tmp, path->holder, receiver, tmp);
    a.leal(tr, offset, NumberOperand, tr);

    Location r; int32 d; OperandType t;
    Location other_temp = tr == Temp1 ? Temp2 : Temp1;
    if (yipes) a.popl(other_temp);
    else if (val != other_temp) {
      reg_disp_type_of_loc(&r, &d, &t, val);
      a.movl(r, d, t, other_temp);
    }
    a.movl(other_temp, tr, 0, NumberOperand);

    if (isMem) {
      recordStore(tr);
    }
  } else {
    fatal("don't support vframe lookups yet");
  }
  a.Comment("End Assignment");
}

void CodeGen::loadBlockParent(Location block, Location dst) {
  a.Comment("loadBlockParent");
  // load [block+scope_offset], dst
  block = moveToReg(block, dst);
  a.movl(block, scope_offset(), NumberOperand, dst);
}


void CodeGen::loadSaved(Location dest, Location src,
                        Location frames_bp, compiled_vframe* src_vf) {
  a.Comment("loadSaved");
  // Load location from a frame on the stack; sp is that frame's 
  // block home (BP on Intel) and frameSz its size.
  assert(isRegister(frames_bp), "???");
  fint frameSz = src_vf->code->frameSize();
  Location r; int32 d; OperandType t;
  reg_disp_type_of_loc(&r, &d, &t, src);
  assert(t == NumberOperand, "???");
  Location tr = isRegister(dest) ? dest : Temp1;
  // I don't think the following untested case would ever happen, but put the code in anyway. -- dmu 5/06
  # if GENERATE_DEBUGGING_AIDS
    if (r != ebp  &&  CheckAssertions) warning("untested loadSaved from outgoing arg");
  # endif
  a.movl(frames_bp, d - (r == ebp ? 0 : (frameSz - linkage_area_size) * oopSize), NumberOperand,  tr);
  move(dest, tr);
}

  
void CodeGen::storeSaved(Location         dst,    Location frames_bp,
                              compiled_vframe* dst_vf, Location src) {
  a.Comment("storeSaved");
  assert(isRegister(frames_bp), "???");
  fint frameSz = dst_vf->code->frameSize();
  Location r;  int32 d;  OperandType t;
  reg_disp_type_of_loc(&r, &d, &t, dst);
  assert(t == NumberOperand, "???");
  Location tr = isRegister(src) ? src 
             :  isRegister(dst) ? dst
             : frames_bp == Temp1 ? Temp2 : Temp1;
  if (tr == src) a.Untested("storeSaved1");
  move(tr, src);
  // I don't think the following untested case would ever happen, but put the code in anyway. -- dmu 5/06
  # if GENERATE_DEBUGGING_AIDS
    if (r != ebp  &&  CheckAssertions) warning("untested loadSaved from outgoing arg");
  # endif
  a.movl(tr, frames_bp,  r == ebp ?  d  :  d - (frameSz - linkage_area_size) * oopSize, NumberOperand);
}

#ifdef UNUSED
void CodeGen::loadSender(Location dest, Location sp) {
  // load frame's sender
  a.movl(ebp, dest);
}
#endif

  
void CodeGen::lookup(Location dest, realSlotRef* path, Location receiver) {
  a.Comment("lookup");
  // <loadPath dest, path, receiver>
  // load receiver/dest/t, offset - Mem_Tag, dest/t
  // <move t, dest>
  
  // Since called from CodeGen::loadPath, cannot clobber Temp2
    
  assert(isRegister(dest), "is always a register");

  if (path->holder->is_object_or_map()) {
    Location t1 = loadPath(dest, path->holder, receiver, Temp1);
    // load data slot
    a.movl( t1, smiOop(path->desc->data)->byte_count() - Mem_Tag, NumberOperand, dest);
  } else {
    fatal("don't support vframe lookups");
  }
}
  
      
// load NLR registers
void CodeGen::prepareNLR(Location result, Location scope, smi homeID) {
  // <move scope, NLRHomeReg>
  // <loadImmediate homeID, NLRHomeIDReg>
  // <move result, NLRResultReg>
  a.Comment("prepareNLR");
  assert(result != NLRHomeReg, "checking clobbering");
  move(NLRHomeReg, scope);
  move(NLRResultReg, result);
  a.movl(homeID, NumberOperand, NLRHomeIDReg);
}


void CodeGen::testAndContinueNLR(smi homeID) {
  a.Comment("testAndContinueNLR");
  Label cont(a.printing);
  Label doNLR(a.printing);
  if (homeID) {       // note: will be 0 if no inlining
    a.Untested("CodeGen::testAndContinueNLR1"); // need SIC to test this
    a.cmpl( homeID, NumberOperand, NLRHomeIDReg);
    a.jne(&doNLR);
  }
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      // frames actually quad word + 8 aligned, so use xor trick
      a.testl(NLRHomeReg, NLRHomeReg);
      Label ok(a.printing);
      a.jz(&ok);
      a.xorl(frame_alignment_offset * oopSize, NumberOperand, NLRHomeReg);
      a.testl(frame_word_alignment*oopSize - 1, NumberOperand, NLRHomeReg);
      a.je(&ok);
      a.hlt(); // bad NLRHome
      a.Data((int32)"bad NLRHome", true);
      ok.define();
      a.xorl(frame_alignment_offset * oopSize, NumberOperand, NLRHomeReg);
    }
  # endif
  a.cmpl(ebp, NLRHomeReg);
  a.je(&cont);
  doNLR.define();
  continueNonLocalReturn();
  cont.define();
  epilogue(NLRResultReg);
}

// continue NLR (return through caller's inline cache)
void CodeGen::continueNonLocalReturn() {
  a.Comment("continueNonLocalReturn");
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
    t = NLRTempReg;
    assert(t != block  &&  t != NLRResultReg  && t != NLRHomeReg && t != NLRHomeIDReg, "");
  }
  move(t, block, no_reg, memoized); // set cc if memoized: was block generated?
  Label done;
  if (memoized)
    a.je(&done);     // br if no block, otherwize zap, the no block case probably likely
  a.movl(0, NumberOperand, t, scope_offset(), NumberOperand);    // zap the block
  done.define();
}

  
Label* CodeGen::SendDesc(RegisterState* s, LookupType lookupType,
                         oop selector, oop delegatee) {
  a.Comment("begin SendDesc");
  Label past_send_desc(a.printing);
  a.jmp(&past_send_desc);
  s->genMask();                               // mask of used regs
  Label* l = new Label(a.printing);
  a.jmp(l);                      // non-local return code
  assert((a.offset() & Tag_Mask) == 0, "must be aligned");
  a.Zero();   // nmlns
  a.Zero();
  if (selector != badOop) {
    if (isPerformLookupType(lookupType)) {
      assert_smi(selector, "should be an integer argcount");
      a.Data(smiOop(selector)->value(), true);      // really arg count
    } else {
      assert_string(selector, "should be a string constant");
      a.Data(selector, true);                       // constant selector
    }
  }
  
#   ifdef SIC_COMPILER
  if (theCompiler->containsLoop) {
    // need counters for the sends to know how often the loop executes
    a.Data(withCountBits(lookupType, Counting), true);
  } 
  else {
    a.Data(lookupType, true);
  }
#   else
    a.Data(lookupType, true);
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
    a.Data(delegatee, true);
  }
  past_send_desc.define();
  a.Comment("end SendDesc");
  return l;
}


Label* CodeGen::branch() {
  a.Comment("branch");
  Label* L = new Label(a.printing);
  a.jmp(L);
  return L;
}


Label* CodeGen::unconditionalBranchCode( Label* dst,  
                                         bool allowPreemption, 
                                         RegisterState* s) {
  //    if allowPreemption <cPrimCall interruptCheck>
  //    bra,a dst
  
  // (this code lifted from what used to be restart)
  
  a.Comment("unconditionalBranchCode");
  Label* nlr = NULL;
  if ( !allowPreemption) { 
    nlr = NULL;
  } 
  else {
    Label* dst1 = NULL;
    testStackOverflowForLoop(dst1, nlr, s); // allocs label and sets dst1
    dst->unify( dst1 );
  }
  a.jmp(dst);
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
   
  a.Comment("conditionalBranchCode");
  move(Temp1, testMe);
  a.cmpl((int32)target, OopOperand, Temp1);

  if ( !allowPreemption ) {
    a.je(dst);
    return NULL; // no nlr
  }
  Label end;
  a.jne(&end);
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
  
  a.Comment("indexedBranchCode");
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
  
  move(Temp1, testMe);
  
  a.testl( Tag_Mask, NumberOperand, Temp1);
  Label end;
  a.jne( &end ); // goto end if not int
  a.cmpl((int32)as_smiOop(labels->length()), OopOperand, Temp1);   // use unsigned comp to catch negative number
  a.jnb(&end); // goto end if index is out of bounds, if Temp1 is not below Temp2
  
  Label L(a.printing);
  a.call(&L); // get pc of next inst onto stack
  pc_t link_reg_value= a.addr();
  L.define();
  
  const int32 indexShift = 2 - Tag_Size;
  assert(indexShift == 0, "no shift needed");
  
  a.popl(Temp2);
  const int32 bytes_from_link_value_to_jumps = 7;
  // indexing is by_two because index is ALREADY 4x value because of tagging
  a.leal(Temp2,  bytes_from_link_value_to_jumps, NumberOperand, Temp1, Assembler::by_two, Temp2);

  a.jmp(Temp2);

  pc_t start_of_jumps= a.addr();
  assert( bytes_from_link_value_to_jumps == start_of_jumps - link_reg_value, "recount");

  for (fint i = 0;  i < labels->length(); ++i) {
    a.jmp(labels->nth(i)); a.hlt(); a.hlt(); a.hlt(); // 8 bytes
  }
  pc_t end_of_jumps= a.addr();
  assert(end_of_jumps - start_of_jumps == 8 * labels->length(), "8?");
  end.define();
  return nlr;
}


void CodeGen::loadImmediate(Location dest, int32 value) {
  a.Comment("loadImmediate");
  Location r; int32 d; OperandType t;
  reg_disp_type_of_loc(&r, &d, &t, dest);
  a.movl(value, NumberOperand, r, d, t);
}


// -1 = recvr, 0 = first arg
// move data from "from" to outgoing arg location for argNo
void CodeGen::loadArg(fint argNo, Location from, bool isPrimCall) {
  a.Comment("loadArg");
  Unused(isPrimCall); // no diff
  move(ArgLocation(argNo), from, Temp1);
}


void CodeGen::loadOop(Location dest, Location src, slotDesc* s) {
  a.Comment("loadOop1");
  int32 offset = smiOop(s->data)->byte_count() - Mem_Tag;
  Location t  = isRegister(src)  ? src  :  dest != Temp1 ? Temp1 : Temp2;
  Location tt = isRegister(dest) ? dest :  src  != Temp1 ? Temp1 : Temp2;
  move(t, src);
  a.movl(t, offset, NumberOperand, tt);
  move(dest, tt);
}


void CodeGen::loadOop(Location dest, oop p) {
  a.Comment("loadOop2");
  Location r; int32 d; OperandType t;
  reg_disp_type_of_loc(&r, &d, &t, dest);
  a.movl((int32)p, OopOperand, r, d, t);
}


void CodeGen::loadBlockOop(Location dest, slotsOop p, RegisterState* s) {

  //   <loadOop p, rr>
  //   <move sp, arg1>
  //   <cPrimCall BlockClone>
  //   <move rr, dest>
  
  a.Comment("Begin Block Cloning");
  s->allocateArgs(1, true);                   // track args for frame construction    

  move(ArgLocation(0), ebp);                 // load frame oop for block
  loadOop(ReceiverReg, p);                    // load block to clone
  PrimDesc* pd = blockClone();
  assert(! pd->needsNLRCode(), "rewrite this - must backpatch NLR code");
  Label* l = cPrimCall(pd, s, false, true, 2 /* 1 arg + rcvr */);
  assert(l == NULL, "shouldn't need a label");
  move(dest, CResultReg);
}


void CodeGen::nonLifoTrap(RegisterState* s) {
  a.Comment("nonLifoTrap");
  static PrimDesc* non_lifo_abort = NULL;
  if (non_lifo_abort == NULL)
    non_lifo_abort = getPrimDescOfFunction(
                       fntype(&NLRSupport::non_lifo_abort), 
                       true);
      
  Label next(a.printing);
  a.call(&next); // prim needs some PC in this method
  next.define();
  a.popl(Temp1);
  move(ReceiverReg, Temp1);
  s->allocateArgs(0, true); // for receiver

  Label* nlr_dest = cPrimCall(non_lifo_abort, s, true, true, 1);
  assert(nlr_dest == NULL, "should not need a label");
}


void CodeGen::initialize_for_platform() {
  
  // _max_no_of_outgoing_args_and_rcvr        = 0;
  _number_of_memory_locals                 = 0;
  
  reg_disp_type_of_loc(&leaf_rcvr_base, &leaf_rcvr_disp, &leaf_rcvr_type, LReceiverReg);
}

  

void CodeGen::assignmentCode(realSlotRef* dataRef) {
  prologue(true, 0 );
  move(Temp1, LArgLocation(0));
  assert(!haveStackFrame, "LReceiverReg only for no frame");
  assignment(LReceiverReg, dataRef, Temp1);
  epilogue(LReceiverReg);
}  



void CodeGen::move(Location dest, Location src, Location tempReg, bool setcc) {
  Location b;  int32 d; OperandType t;    
  if (dest == src) {
    if (setcc) {
      reg_disp_type_of_loc(&b, &d, &t, src);
      a.testl(AllBits, NumberOperand, b, d, t);
    }
  }
  else if (isRegister(dest)) {
    reg_disp_type_of_loc(&b, &d, &t, src);
    a.movl(b,d, t, dest);
    if (setcc)  a.testl(dest, dest);
  }
  else if (isRegister(src)) {
    reg_disp_type_of_loc(&b, &d, &t, dest);
    if (setcc)  a.testl(src, src);
    a.movl(src, b,d, t);
  }
  else if (!isRegister(tempReg)) {
    reg_disp_type_of_loc(&b, &d, &t, src);
    a.pushl(b, d, t);
    reg_disp_type_of_loc(&b, &d, &t, dest);
    a.popl(b, d, t);
    if (setcc) a.testl(AllBits, NumberOperand, b, d, t);
  }
  else {
    reg_disp_type_of_loc(&b, &d, &t, src);
    a.movl(b, d, t, tempReg);
    reg_disp_type_of_loc(&b, &d, &t, dest);
    if (setcc) a.testl(tempReg, tempReg);
    a.movl(tempReg, b, d, t);
  }
}


inline Location CodeGen::moveToReg(Location what, Location reg) {
  Location t;
  if (isRegister(what)) {
    t = what;
  } else {
    t = reg;
    move(t, what);
  }
  return t;
}


# endif // FAST_COMPILER
# endif // TARGET_ARCH == I386_ARCH
