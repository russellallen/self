/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "codeGen_sparc.hh"
# pragma implementation "codeGen_inline_sparc.hh"

# include "_codeGen_sparc.cpp.incl"

# ifdef FAST_COMPILER

  CodeGen* theCodeGen;
  
  void CodeGen::moveComplicated(Location dest, Location src, bool delay) {
    Unused(delay);
    assert(!(isRegister(src) && isRegister(dest)), "shouldn't call this");
    Location t;
    if (isRegister(dest)) {
      t = dest;
    } else if (isRegister(src)) {
      t = src;
    } else {
      assert(! delay, "cannot fit move in delay slot");
      t = Temp1;
    }
    if (isRegister(src)) {
      // already in register
    } else {
      Location base;
      fint offset = getOffset(src, base);
      a.LoadI(base, offset, t);
    }
    if (isRegister(dest)) {
      // already in register
    } else {
      Location base;
      fint offset = getOffset(dest, base);
      a.StoreI(base, offset, t);
    }
  }
  
  void CodeGen::genCountCode(int32* counter) {
    a.Comment("count # calls");
    a.SetHiA((void*)counter, Temp2);
    a.LoadA(Temp2, (void*)counter, Temp1);
    a.AddI(Temp1, 1, Temp1);
    a.StoreA(Temp2, (void*)counter, Temp1);
  }
    
  void CodeGen::testStackOverflow(RegisterState* s) {
    a.Comment("stack overflow/interrupt check");
    a.SubCCR(SP, SPLimitReg, G0);    // test for stack overflow
    Label* l = a.BgeForward(false);            // no overflow
    a.Nop();
    assert(s->mask() != 0, "should have non-zero mask");
    assert((s->allocated & nthBit(IReceiverReg)) != 0,
           "should have at least ReceiverReg allocated");
    (void)cPrimCall(intrCheck(), s, true, true, 0);
    l->define();
  }


  void CodeGen::testStackOverflowForLoop( Label*& dst,  Label*& nlr, RegisterState* s) {
    //    cmp sp, splimit
    //    bge dst
    //    nop
    //    <cPrimCall interruptCheck>
     
    // (this code lifted from what used to be restart)
    
    a.Comment("stack overflow/interrupt check for loop");
    a.SubCCR(SP, SPLimitReg, G0);            // test for interrupt
    dst = a.BgeForward( false);                // no overflow
    a.Nop();  // can't use annulled branch! back-to-back CTIs
    nlr = cPrimCall(intrCheck(), s, false, true, 0);
  }


  void CodeGen::smiOop_prologue(pc_t missHandler) {
    //   andcc rr, Tag_Mask, g0
    //   beq   _cache_hit
    //   sethi missHandler, t
    //   jmpl t, missHandler, g0
    //   nop
    // _cache_hit:

    if (SICCountIntTagTests) a.markTagTest(1);
    a.AndCCI(ReceiverReg, Tag_Mask, G0);    // test for integer tag
    Label* hit = a.BeqForward(false);       // branch if receiver is an integer
    jumpTo(missHandler, Temp1, G0);
    if (SICCountTypeTests) {
      a.endTypeTest();
    } else {
      a.Nop();
    }
    hit->define();
  }

  void CodeGen::floatOop_prologue(pc_t missHandler) {
    //   andcc rr, Float_Tag, g0
    //   bne  _cache_hit
    //   sethi missHandler, t
    //   jmpl t, missHandler, g0
    //   nop
    // _cache_hit:

    a.AndCCI(ReceiverReg, Float_Tag, G0);    // test for float tag
    Label* hit = a.BneForward(false);        // branch if receiver is a float
    jumpTo(missHandler, Temp1, G0);
    if (SICCountTypeTests) {
      a.endTypeTest();
    } else {
      a.Nop();
    }
    hit->define();
  }

  void CodeGen::memOop_prologue(pc_t missHandler) {
    //   andcc rr, Mem_Tag, g0
    //   bne,a _check_receiver_map
    //   load rr, map_offset - Mem_Tag, t3
    // _miss:
    //   sethi missHandler, t3
    //   jmpl t3, missHandler, g0
    // _check_receiver_map:
    //   <loadOop receiver_map, t4>
    //   subcc t3, t4, g0
    //   bne  _miss
    //   nop
    // _cache_hit:

    if (FastMapTest) {
      a.LoadI(ReceiverReg, map_offset(), Temp1);  // load map
      loadOop(Temp2, L->receiverMapOop());        // load customization map
      a.SubCCR(Temp1, Temp2, G0);                 // compare against actual map
      Label* ok = a.BeqForward(false);            // jump to body of nmethod
      jumpTo(missHandler, Temp2, G0);
      if (SICCountTypeTests) {
        a.endTypeTest();
      } else {
        a.Nop();
      }
      ok->define();
    } else {
      a.AndCCI(ReceiverReg, Mem_Tag, G0);         // test for mem tag
      Label* checkMap = a.BneForward(true);       // branch if rcvr is mem oop
      a.LoadI(ReceiverReg, map_offset(), Temp1);  // load map in delay slot
      DefinedLabel miss(a.printing);
      jumpTo(missHandler, Temp2, G0);
      checkMap->define();
      loadOop(Temp2, L->receiverMapOop());      // load customized map
      a.SubCCR(Temp1, Temp2, G0);               // compare against actual map
      a.Bne(&miss, false);                      // jump to miss if no match
      if (SICCountTypeTests) {
        a.endTypeTest();
      } else {
        a.Nop();
      }
    }
  }

  void CodeGen::checkOop(Label& general, oop what, Location reg) {
    // test for inline cache hit (selector, delegatee)
    assert(Temp1 !=   PerformSelectorLoc   && Temp1 !=    PerformDelegateeLoc
        && isRegister(PerformSelectorLoc)  &&  isRegister(PerformDelegateeLoc),
           "wrong register setup");
    loadOop(Temp1, what);                       // load hard-wired value
    a.SubCCR(reg, Temp1, G0);                   // compare against actual value
    if (general.isDefined()) {
      a.Bne(&general, false);                   // reuse miss handler
      a.Nop();
    } else {
      Label* hit = a.BeqForward(false);
      general.define();
      jumpTo(Memory->code->trapdoors->SendMessage_stub_td(), Temp1, G0);
      a.Nop();
      hit->define();
    }
  }

  void CodeGen::checkRecompilation() {
    // test for recompilation
    //   sethi &counter, t3
    //   load  [t3 + lo%(&counter)], t4
    //   add t4, 1, t4
    //   cmp t4, recompileLimit
    //   bne ok
    //   store t4, [t3 + lo%(&counter)]
    //   <jumpTo recompiler>
    //   nop
    // ok:

    // di recompilation doesn't work right now - see recompile.c
    if (diLink) return;

    a.Comment("test for recompilation");
    int32 countID = theCompiler->countID;
    void* counter = &useCount[countID];
    a.SetHiA(counter, Temp3);
    a.LoadA(Temp3, counter, Temp2);
    a.AddI(Temp2, 1, Temp2);
    fint limit = recompileLimit(theCompiler->level());
    if (limit < maxImmediate) {
      a.SubCCI(Temp2, limit, G0);
    } else {
      a.SetHiI2(limit, Temp1);      // limit is multiple of 1024
      a.SubCCR(Temp2, Temp1, G0);
    }
    Label* ok = a.BneForward(false);
    // call recompiler
    void* fnaddr = diLink 
                 ? Memory->code->trapdoors->DIRecompile_stub_td() 
                 : Memory->code->trapdoors->  Recompile_stub_td();
    Location linkReg = diLink ? DIRecompileLinkReg : RecompileLinkReg;
    jumpTo(fnaddr, linkReg, linkReg);
    // The store below is always executed so that we will call the recompiler 
    // exactly once (even if it cannot recompile for some reason).
    ok->define();
    assert(Temp3 != linkReg, "counter addr reg will be trashed by jump");
    a.StoreA(Temp3, counter, Temp2);
  }
    
  void CodeGen::prologue(bool isAccessMethod, fint nargs ) {
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
    
    // <flush register windows if neceessary>
    // <clear stack temporaries and excess argument locations

    // CAUTION: use only Temp1/4 for temps in prologue; other temps
    // may contain lookup parameters.
    assert(Temp1 != PerformSelectorLoc && Temp1 != PerformDelegateeLoc,
           "will trash lookup parameters");
    assert(Temp2 != PerformSelectorLoc && Temp2 != PerformDelegateeLoc,
           "will trash lookup parameters");

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
        if (SICCountTypeTests) {
          a.startTypeTest(1, true, imm);
          a.doOneTypeTest();
        }
        if (m == Memory->smi_map) {
          smiOop_prologue(Memory->code->trapdoors->SendMessage_stub_td());
        } else if (m == Memory->float_map) {
          floatOop_prologue(Memory->code->trapdoors->SendMessage_stub_td());
        } else {
          memOop_prologue(Memory->code->trapdoors->SendMessage_stub_td());
        }
      }
      
      verifiedOffset = a.offset();
      if (SICCountTypeTests) a.endTypeTest();
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

    if (haveStackFrame) {
      prologueAddr = a.addr();
      a.SaveI(SP, -1, SP);     // correct frame size is patched in later
      frameCreationOffset = a.offset();
    } else {
      prologueAddr = NULL;
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
        a.SetHiA(unused_addr, Temp2);
        a.StoreA(Temp2, unused_addr, G0);
      }
    
      // don't keep uplevel-accessed names in regs
      // (for now, just flush everything)
      if (nargs > NumIArgRegisters) nargs = NumIArgRegisters;
      a.Comment("flush incoming args to stack");
      for (fint i = 0; i < nargs; i++) {
        flushToStack(IArgLocation(i), NULL);
      }
      flushToStack(IReceiverReg, NULL);       // flush receiver to stack

      switch (kind) {
       case BlockMethodType:
        if (theCompiler->needRegWindowFlushes) flushRegisterWindows();
        break;
       case OuterMethodType:
        if (needToFlushRegWindow) {     // we inlined the receiver block
          if (theCompiler->needRegWindowFlushes) flushRegisterWindows();
        } else {
          // receiver is parent, do nothing
        }
        break;
       default:
        fatal1("unknown kind: %ld", kind);
        break;
      }
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
    } else {
      testStackOverflow(s);
    }
    return l;
  }

  void CodeGen::fixupFrame(RegisterState* s) {
    // window size adjustment
    assert(haveStackFrame, "should have stack frame");
    fint stackTempCount = s->stackDepth + s->argDepth;
    if (stackTempCount & 1) ++stackTempCount;
    frameSize = stackTempCountToFrameSize(stackTempCount);
    assert((frameSize & (frame_word_alignment-1))  ==  0, "frame size must be even");

    a.Comment("patching stack frame creation code");
    // The mask in the inline cache marks the regs + the first ntemps stack locs.
    // If we have fewer than ntemps temps and have extra args, the bits for the
    // extra args must be set.
    // All stack locations beyond the first ntemps have to be cleared.
    
    fint ntemps = BitsPerWord - (NumInRegisters + NumLocalRegisters);
    if (stackTempCount - s->argDepth  <  ntemps   &&  s->argDepth > 0) {
      s->fixupMasks(stackTempCount);
    }
    a.saveExcursion(prologueAddr);
    if (stackTempCount <= ntemps && !s->argDepth) {
      // no need to init anything on the stack - just patch frameSize
      a.SaveI(SP, frameSize * -oopSize, SP);    // make new register window
      a.endExcursion();
    } else {
      // need to initialize extra stack locations and/or extra args
      Label* l = a.BraForward(true);
      DefinedLabel cont(a.printing);
      a.endExcursion();
      l->define();
      a.SaveI(SP, frameSize * -oopSize, SP);    // make new register window
      // clear locations beyond first ntemps 
      fint i;
      for ( i = max(ntemps, s->initStackTemps); 
            i < stackTempCount; 
            i++) {
        a.StoreI(FP, (local_slots_offset - i) * oopSize, G0);
      }
      // clear extra args marked "live" by fixupMasks
      // (necessary because the simple fixup scheme marks them as live
      // for the entire method, not only after they're used)
      for ( i = 1; 
            i <= s->argDepth; 
            i++) {
        fint bitNo = stackTempCount - i;
        if (bitNo < ntemps) {
          a.StoreI(FP, (local_slots_offset - bitNo) * oopSize, G0);
        }
      }
      a.Bra(&cont, true);
    }
  }
  
  fint CodeGen::verifyParents(objectLookupTarget* target, Location t,
                              fint count) {
    assignableSlotLink* l = target->links;
    assert(l != 0, "expecting an assignable parent link");
      
    for (;;) {
      a.LoadI(t, smiOop(l->slot->data)->byte_count() - Mem_Tag, Temp1);
      // load assignable parent slot value
      Label* ok;
      Map* targetMap = l->target->obj->map();
      if (l->target->value_constrained) {
        // constraint for a particular oop (ambiguity resolution)
        loadOop(Temp2, l->target->obj);         // load assumed value
        a.SubCCR(Temp1, Temp2, G0);             // compare values
        ok = a.BeqForward(false);               // branch if value OK
        if (l->target->links) a.Nop();
      } else {
        // check if map of parent is correct
        if (targetMap == Memory->smi_map) {
          a.AndCCI(Temp1, Tag_Mask, G0);        // test for integer tag
          ok = a.BeqForward(false);             // branch if parent is integer
          if (l->target->links) a.Nop();
        } else if (targetMap == Memory->float_map) {
          a.AndCCI(Temp1, Float_Tag, G0);       // test for float tag
          ok = a.BneForward(false);             // branch if parent is a float
          if (l->target->links) a.Nop();
        } else {
          Label* miss = NULL;
          if (!FastMapTest) {
            a.AndCCI(Temp1, Mem_Tag, G0);       // test for mem tag
            Label* mem = a.BneForward(true);    // branch if parent is mem oop
            a.LoadI(Temp1, map_offset(), Temp2); // load receiver map
            miss = a.BraForward(true);          // branch to diLookup section
            mem->define();
          } else {
            a.LoadI(Temp1, map_offset(), Temp2); // load receiver map
          }
          loadOop(Temp3, targetMap->enclosing_mapOop()); // load map constraint
          a.SubCCR(Temp2, Temp3, G0);   // compare w/ parent's map
          ok = a.BeqForward(false);     // correct
          if (l->target->links) a.Nop();
          if (miss) miss->define();
        }
      }
      void* addr = Memory->code->trapdoors->SendDIMessage_stub_td();
      a.SetHiD(addr, Temp1);
      a.JmpLD(Temp1, addr, DILinkReg);
      loadImmediate(DICountReg, count);         // count of parents verified
      a.Data(0);                                // first part of DI nmln
      a.Data(0);                                // second part of DI nmln
      ok->define();
      
      count ++;
      if (l->target->links) count = verifyParents(l->target, Temp1, count);
      
      l = l->next;
      if (l == 0) break;
      // if multiple dynamic parents, reload slot holder before looping (HACK!)
      t = loadPath(Temp1, target, ReceiverReg, Temp1);
    }
    
    return count;
  }
    
  void CodeGen::epilogue(Location what) {
    // <moveToReg what, t>
    // jmpl rt, INLINE_cache_end_offset, g0
    // restore what/t, g0, rr
    
    if ( what == IllegalLocation )
      what = IReceiverReg;

    Location t = moveToReg(what, Temp1);
    
    fint offset = send_desc->endOffset(theCompiler->L->lookupType());
    if (haveStackFrame) {
      a.JmpLI(ReturnAddr, offset, G0);    // return
      a.RestoreR(t, G0, ResultReg);    // restore register window
    } else {
      a.JmpLI(CalleeReturnAddr, offset, G0);    // return
      move(ResultReg, t, true);
    }
  }

  Location CodeGen::flushToStack(Location reg, RegisterState*) {
    // flush register to its corresponding location on the stack
    if (isRegister(reg)) {
      Location breg;
      fint offset = getOffset(reg, breg);
      assert(breg == SP, "should be SP-relative");
      a.StoreI(SP, offset, reg);                // flush reg to stack
    }
    return reg; // just the same on SPARC, different when we have a machine where there is no fixed mapping
  }

  Label* CodeGen::cPrimCall(PrimDesc* p, RegisterState* s,
                            bool continueNLR, bool /*trust_fn_arg_count */, fint /* arg_and_rcvr_count */) {
    //   call <primitive>
    //   add o7, oopSize, o7            // so C skips the mask
    //   .data mask                     // need mask for scavenging
    // *if needsNLRCode
    //   <continueNonLocalReturn>       // for prims like AbortProcess
    // *endif
    
    a.CallP( first_inst_addr( p->fn() ) );
    a.AddI(CalleeReturnAddr, 
           p->needsNLRCode()
              ? sendDesc::abortable_prim_end_offset - sendDesc::nonabortable_prim_end_offset + oopSize
              : oopSize, 
           CalleeReturnAddr);
    // skip register mask upon return
    s->genMask();    // used register mask
    
    if ( !p->needsNLRCode()) {
      return NULL;
    }
    else if (continueNLR) {
      continueNonLocalReturn();
      return NULL;
    } 
    else {
      Label* l = a.BraForward(true);
      a.Nop();
      return l;
    }
  }

  Label* CodeGen::primFailure(Location failReceiver, Location self,
                              oop failSelector, oop selector, 
                              Location successLoc, blockOop failBlock,
                              RegisterState* s) {
                              
    s->allocateArgs(2, true); // will be passing out 2 args

    // *if CResultReg contains a markOop
    //    sub  ResultReg, Mark_Tag - Mem_Tag, arg2
    //    <loadOop selector, arg1>
    //    <clone fail block if necessary>
    //    <selfCall>
    // *endif

    a.AndI(CResultReg, Tag_Mask, Temp1);        // extract result's tag field
    a.SubCCI(Temp1, Mark_Tag, G0);              // test for mark tag 
    Label* success = a.BneForward(true);
    move(successLoc, CResultReg, true);         // move to right place
    // clone failure block if necessary
    if (failBlock == NULL) {
      // block already exists
      a.SubI(CResultReg, Mark_Tag - Mem_Tag, Arg1);// mask mark bit
    } else {
      // NOTE: this will break if blockOop::clone scavenges!
#     if GENERATE_DEBUGGING_AIDS
        if (CheckAssertions) {
          PrimDesc* pd = blockClone();
          assert(! pd->canScavenge(), "rewrite this");
        }
#     endif
      // need to save error string
      Location saved = s->pickLocal();
      if (isRegister(saved)) {
        a.SubI(CResultReg, Mark_Tag - Mem_Tag, saved);// save and mask mark bit
      } else {
        a.SubI(CResultReg, Mark_Tag - Mem_Tag, CResultReg);
        move(saved, CResultReg, false);
      }
      loadBlockOop(failReceiver, failBlock, s);
      move(Arg1, saved, false);                 // move it to right place
      s->deallocate(saved);
    }
    loadOop(Arg2, selector);
    Label* l = selfCall(s, NormalLookupType, failReceiver, self, 
                        failSelector, NULL, 2);
    move(successLoc, ResultReg);
    success->define();
    return l;
  }
    
  void CodeGen::recordStore(Location dst) {
    // srl dst, card_shift, dst
    // stb g0, [dst + byte_map_base]
      
    a.Comment("recordStore");
    assert(isRegister(dst), "receiver to check_store must be in a register");
    a.SrlI(dst, card_shift, dst);    // shift target addr 
    a.StoreBR(dst, ByteMapBaseReg, G0);    // set byte in map
  }
    
    
  Label* CodeGen::selfCall(RegisterState* s, LookupType lookupType,
                           Location receiver, Location self,
                           oop selector, oop delegatee, fint argc) {
    // call lookup
    // mov  receiver, ReceiverReg
    // <rest of inline cache>

    Unused(self);
    a.CallB(Memory->code->trapdoors->SendMessage_stub_td());
    move(ReceiverReg, receiver, true);
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
    // <move arg, t>
    // store [receiver/rr, offset - Mem_Tag], t
    // <check_store>
    assert( isRegister(receiver), "receiver must be a register");
    a.Comment("Begin Simple Assignment");
    Location t;
    if (isRegister(val) && val != CReceiverReg) {
      t = val;
    } else {
      t = Temp1;
      move(t, val);    // load argument
    }
    int32 offset = smiOop(s->data)->byte_count() - Mem_Tag;
    a.StoreI(receiver, offset, t); // store object data slot contents
    a.AddI(receiver, offset, Temp1); // compute store address
    recordStore(Temp1);

    a.Comment("End Simple Assignment");
  }

  void CodeGen::assignment(Location receiver,
                           realSlotRef* path, Location val,
                           bool isMem) {
    // <move arg, t>
    // <loadPath rr, path, receiver>
    // store receiver/rr, offset - Mem_Tag, arg/t
    // <check_store>
      
    a.Comment("Begin Assignment");
    Location t;
    if (isRegister(val) && val != CReceiverReg) {
      t = val;
    } else {
      t = Temp1;
      move(t, val);    // load argument
    }
    assert(t != Temp2, "register conflict");
    int32 offset = smiOop(path->desc->data)->byte_count() - Mem_Tag;
    if (path->holder->is_object_or_map()) {
      Location t1 = loadPath(CReceiverReg, path->holder, receiver, Temp1);
      a.StoreI(t1, offset, t);    // store object data slot contents
      if (isMem) {
        a.AddI(t1, offset, Temp1);    // compute store address
        recordStore(Temp1);
      }
    } else {
      fatal("don't support vframe lookups yet");
    }
    a.Comment("End Assignment");
  }

  void CodeGen::loadBlockParent(Location block, Location dst) {
    // given a location containing a block, get sp of frame creating the block
    // will load an invalid address for non-LIFO blocks

    // load [block+scope_offset], dst
    block = moveToReg(block, dst);
    a.LoadI(block, scope_offset(), dst);
  }
  
  fint CodeGen::getOffset(Location src, Location& baseReg) {
    // compute location (base register + offset) of saved reg src
    fint offset;
    if (isRegister(src)) {
      baseReg = SP;
      offset =
        (first_register_offset - StackFromRegister[src]) * oopSize;
    } else if (src >= StackLocations) {
      baseReg = FP;
      offset = (local_slots_offset - (src - StackLocations)) * oopSize;
    } else if (src <= ExtraArgLocations) {
      baseReg = SP;
      offset = (extra_arg_offset + (ExtraArgLocations - src)) * oopSize;
      assert(offset >= extra_arg_offset * oopSize, "should be above");
    } else if (src <= ExtraIArgLocations) {
      baseReg = FP;
      offset = (arg_bottom_offset - (src - ExtraIArgLocations)) * oopSize;
    } else {
      fatal("source cannot be a pseudo-register");
    }
    assert((offset & 3) == 0, "should be word-aligned");
    return offset;
  }

  void CodeGen::loadSaved(Location dest, Location src,
                          Location sp, compiled_vframe* dst_vf) {
    fint frameSz = dst_vf->code->frameSize();
    // Load location from a frame on the stack; sp is that frame's 
    // block home (SP on Sparc) and frameSz its size.
    Location baseReg;
    fint sp_offset = getOffset(src, baseReg);
    if (baseReg != SP) {
      // The source is addressed off FP, not SP; convert fp-relative
      // offset into sp-relative.
      assert(frameSz > WindowSize, "frame size too small");
      sp_offset += frameSz * oopSize;
    }
    if (isRegister(dest)) {
      a.LoadI(sp, sp_offset, dest);
    } else {
      a.LoadI(sp, sp_offset, Temp1);
      move(dest, Temp1);
    }
  }
    
  void CodeGen::storeSaved(Location src, Location sp,
                           compiled_vframe* src_vf, Location value) {
    fint frameSz = src_vf->code->frameSize();
    Location baseReg;
    assert(isRegister(sp), "must be a register");
    assert(src > ExtraArgLocations, "shouldn't assign to args");
    fint sp_offset = getOffset(src, baseReg);
    if (baseReg != SP) {
      // The source is addressed off FP, not SP; convert fp-relative
      // offset into sp-relative.
      assert(frameSz > WindowSize, "frame size too small");
      sp_offset += frameSz * oopSize;
    }
    assert(sp != Temp3, "messed up register assignment");
    Location t = moveToReg(value, Temp3);
    a.StoreI(sp, sp_offset, t);
  }

#ifdef UNUSED
  void CodeGen::loadSender(Location dest, Location sp) {
    // load frame's sender
    a.LoadI(sp, frame_offset * oopSize, dest);
  }
#endif

    
  void CodeGen::lookup(Location dest, realSlotRef* path, Location receiver) {
    // <loadPath dest, path, receiver>
    // load receiver/dest/t, offset - Mem_Tag, dest/t
    // <move t, dest>
      
    Location t;
    if (isRegister(dest)) {
      t = dest;
    } else {
      t = Temp1;
    }
    if (path->holder->is_object_or_map()) {
      Location t1 = loadPath(t, path->holder, receiver, Temp1);
      a.LoadI(t1, smiOop(path->desc->data)->byte_count() - Mem_Tag, t);
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

    assert(result != NLRHomeIDReg && result != NLRHomeReg, "wrong reg alloc");
    result = moveToReg(result, NLRTempReg);
    move(NLRHomeReg, scope);
    loadImmediate(NLRHomeIDReg, homeID);
    move(NLRResultReg, result);
  }

  void CodeGen::testAndContinueNLR(smi homeID) {
    //   <loadImmediate homeID, NLRTempReg>   
    //   cmp NLRTempReg, NLRHomeIDReg           
    //   bne doNLR
    //   cmp NLRHomeReg, sp
    //   beq continue
    //   nop
    // doNLR:
    //   <continueNLR>
    // continue:
    //   <epilogue>

    Label* cont, *doNLR = NULL;
    if (homeID) {       // note: will be 0 if no inlining
      if (homeID < maxImmediate) {
        a.SubCCI(NLRHomeIDReg, homeID, G0);
      } else {
        loadImmediate(NLRTempReg, homeID);
        a.SubCCR(NLRHomeIDReg, NLRTempReg, G0);
      }
      doNLR = a.BneForward(false);
    }
    a.SubCCR(FrameReg, NLRHomeReg, G0);
    cont = a.BeqForward(false);
    a.Nop();
    if (doNLR) doNLR->define();
    continueNonLocalReturn();
    cont->define();
    epilogue(NLRResultReg);
  }
  
  // continue NLR (return through caller's inline cache)
  void CodeGen::continueNonLocalReturn() {
    // jmpl rt, non_local_return_offset, g0
    // restore dest/t, g0, rr

    assert(haveStackFrame, "should have stack frame");
    a.JmpLI(ReturnAddr, sendDesc::non_local_return_offset, G0);    // return
    a.RestoreR(G0, G0, G0);             // restore register window
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
      move(t, block);
    }
    Label* done;
    if (memoized) {
      a.SubCCI(t, 0, G0);               // was block generated?
      done = a.BneForward(true);        // branch and zap if yes
    }
    a.StoreI(t, scope_offset(), G0);    // zap the block
    if (memoized) done->define();
  }
    
  Label* CodeGen::SendDesc(RegisterState* s, LookupType lookupType,
                           oop selector, oop delegatee) {
    s->genMask();                               // mask of used regs
    Label* l = a.BraForward(true);              // non-local return code
    a.Nop();
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
    
    if (theCompiler->containsLoop) {
      // need counters for the sends to know how often the loop executes
      a.Data(withCountBits(lookupType, Counting));
    } else {
      a.Data(lookupType);
    }
    
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
    return l;
  }
  
  Label* CodeGen::branch() {
    // bra,a ??
    return a.BraForward(true);
  }


  Label* CodeGen::unconditionalBranchCode( Label* dst,  
                                           bool allowPreemption, 
                                           RegisterState* s) {
    //    if allowPreemption <cPrimCall interruptCheck>
    //    bra,a dst
    
    // (this code lifted from what used to be restart)
    
    Label* nlr;
    if ( !allowPreemption) { 
      nlr = NULL;
    } 
    else {
      Label* dst1;
      testStackOverflowForLoop(dst1, nlr, s);
      dst->unify( dst1 );
    }
    a.Bra(dst, true);
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
    a.SubCCR( Temp1, Temp2, G0);

    if ( !allowPreemption ) {
      a.Beq(dst, false);
      a.Nop(); // delay slot
      return NULL; // no nlr
    }
    Label* end = a.BneForward(false);
    a.Nop();
    Label* nlr = unconditionalBranchCode( dst, true, s);
    end->define();
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
      Label* afterTest;
      testStackOverflowForLoop( afterTest, nlr, s );
      afterTest->define();
    }
    
    move( Temp1, testMe, false);
    loadOop( Temp2, as_smiOop(labels->length()));
    a.TSubCCR( Temp2, Temp1, G0);
    Label* end = a.BvsForward(false);
    a.Nop();
    end->unify( a.BleuForward(false) );
    a.Nop();
    
    pc_t cra= a.addr();
    const int32 bytesFromCallToJump = 4 * sizeof(int32);
    const int32 bytesFromCallToInstAfterDelay  = 2 * sizeof(int32);
    // only on V9: a.ReadPC(Temp2); 
    a.CallN( a.addr() + bytesFromCallToInstAfterDelay);
    const int32 indexShift = 2 - Tag_Size;
    assert(indexShift == 0, "no shift needed");
    a.AddR( Temp1, CalleeReturnAddr, Temp1); // in the delay slot
    assert( a.addr() - cra  == bytesFromCallToInstAfterDelay,
      "recount instructions");
    a.JmpLI( Temp1, bytesFromCallToJump - (Int_Tag << indexShift), G0);
    a.Nop(); // delay slot for jmp, cannot have branch here
    assert( a.addr() - cra  == bytesFromCallToJump,  "recount instructions");
    for (fint i = 0;  i < labels->length(); ++i) {
      a.Bra(labels->nth(i), true);
    }
    end->define();
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
    
    Location t;
    if (isRegister(dest)) {
      t = dest;
    } else {
      t = Temp1;
    }
    if (value == 0) {
      t = G0;
    } else if (value < maxImmediate &&
               value > -maxImmediate) {
      a.OrI(G0, value, t);
    } else {
      if (value & LOWMASK) {
        a.SetHiI(value, t);     // load high part of value
        a.AddI(t, value, t);    // add low part if nonzero
      } else {
        a.SetHiI2(value, t);    // low 10 bits are zero
      }
    }
    move(dest, t);
  }
  
  void CodeGen::loadArg(fint argNo, Location from, bool isPrimCall) {
    Unused(isPrimCall);
    if (argNo == -1) {
      // weird arg numbering - 0 is 1st arg
      move(ReceiverReg, from);
    } else {
      move(ArgLocation(argNo), from);
    }
  }

  void CodeGen::loadOop(Location dest, Location src_register, slotDesc* s) {
    Location t = isRegister(dest) ? dest : Temp1;
    int32 offset = smiOop(s->data)->byte_count() - Mem_Tag;
    a.LoadI(src_register, offset, t);
    if (dest != t)
      move(dest, t);
  }

  void CodeGen::loadOop(Location dest, oop p) {
    // *if p is 0...
    //    <move g0, dest>
    // *else...
    //    *if p is a small smiOop...
    //       or g0, p, t/dest
    //    *else...
    //       sethi p, t/dest
    //       add dest, p, t/dest
    //    *end
    //    <move t, dest>
    // *end
    
    Location t;
    if (isRegister(dest)) {
      t = dest;
    } else {
      t = Temp1;
    }
    if (p == 0) {
      t = G0;
#     ifdef TRUE_FALSE_REGISTERS
      } else if (p == Memory->trueObj) {
        t = TrueReg;
      } else if (p == Memory->falseObj) {
        t = FalseReg;
#     endif
    } else if (! p->is_mem() &&
               int32(p) < maxImmediate &&
               int32(p) > -maxImmediate) {
      a.OrO(G0, p, t);
    } else {
      a.SetHiO(p, t);                           // load high part of value
      a.AddO(t, p, t);                          // add low part 
    }
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
    move(Arg1, SP);                     // load frame oop for block
    PrimDesc* pd = blockClone();
    assert(! pd->needsNLRCode(), "rewrite this - must backpatch NLR code");
    Label* l = cPrimCall(pd, s, false, true, 2 /* 1 arg + rcvr */);
    assert(l == NULL, "shouldn't need a label");
    move(dest, ResultReg);
  }
  
  void CodeGen::nonLifoTrap(RegisterState*) {
    // trap g0, ST_UpLevel
    a.TrapI(G0, SignalInterface::ST_UpLevel);
  }
  
  void CodeGen::initialize_for_platform() {}
  
  
  void CodeGen::assignmentCode(realSlotRef* dataRef) {
    prologue(true, 0);
    move(Temp2, ReceiverReg);
    assignment(ReceiverReg, dataRef, ArgLocation(0));
    epilogue(Temp2);
  }


# endif // FAST_COMPILER
