/* Sun-$Revision: 30.21 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# pragma implementation "node_sparc.hh"

# include "_node_sparc.cpp.incl"

# if defined(SIC_COMPILER)

  void BasicNode::genBranch() {
    l = l->unify(theAssembler->BraForward(true));
  }

#if TARGET_OS_VERSION == NETBSD_VERSION
/* XXX: where does sunos get trap.h included? */
#include <sparc/trap.h>
#define ST_FLUSH_WINDOWS ST_FLUSHWIN
#endif

  void PrologueNode::flushRegisterWindows() {
    // ta g0, ST_FLUSH_WINDOWS
    theAssembler->TrapI(G0, ST_FLUSH_WINDOWS);    // flush register windows
  }

  void PrologueNode::clearStackLocations() {
    // The mask in the inline cache marks the regs + the first ntemps stack 
    // locs.  Clear stack locations beyond the first ntemps.
    
    fint ntemps = BitsPerWord - (NumInRegisters + NumLocalRegisters);
    fint extraFrameSize = frameSizeToStackTempCount(thisFrameSize);
    // initialize extra stack locations 
    // potential inefficiency: if local is allocated to the stack, it need
    // not be initialized here.
    // NB: all FP offsets are negative 
    if (extraFrameSize > ntemps) {
      // initialize extra stack locations [start, end)
      // try to use std instructions for smaller code
      // After much head-scratching, I have concluded that Urs
      // adds 1 because local_slots_offset points to where the
      // "first" (topmost) local slot is, as opposed to beyond it.
      // For example if ntemps is 0, and extraFrameSize is 2,
      // we would want to zap local_slots_offset-1, and local_slots_offset.
      // Note that the loop goes [start, end). -- dmu
      fint start = ( local_slots_offset - extraFrameSize ) + 1;
      fint end   = ( local_slots_offset - ntemps         ) + 1;
      assert(start < end, "oops");
      if (start & 1) {
        // first word is unaligned
        theAssembler->StoreI(FP, start * oopSize, G0);
        start++;
      }
      if (end & 1) {
        // last doubleword store would overwrite one word too much
        theAssembler->StoreI(FP, (end - 1) * oopSize, G0);
        end--;
      }
      if (start < end) {
        theAssembler->OrR(G0, G0, G1);                // clear g1
        for (fint i = start; i < end; i += 2)
          theAssembler->StoreDI(FP, i * oopSize, G0);
      }
    }
  }

  void PrologueNode::createStackFrame() {
    assert(haveStackFrame(), "shouldn't be creating a stack frame");

    thisFrameSize = theSIC->frameSize(); 
    assert((thisFrameSize & (frame_word_alignment-1)) == 0, "frame size must be even");

    theAssembler->SaveI(SP, thisFrameSize * -oopSize, SP); // create stack frame
    theSIC->_frameCreationOffset = theAssembler->offset();
    
    clearStackLocations();
  }

  void PrologueNode::prePrologue() {
    // CAUTION: use only Temp1/4 for temps in prologue; other temps
    // may contain lookup parameters.
    assert(Temp1 != PerformSelectorLoc && Temp1 != PerformDelegateeLoc,
           "will trash lookup parameters");
    assert(Temp2 != PerformSelectorLoc && Temp2 != PerformDelegateeLoc,
           "will trash lookup parameters");
  }

  void PrologueNode::postPrologue() {
    MethodKind kind = isAccessMethod ? MethodKind(-1) : theSIC->method()->kind();
    switch (kind) {
    case BlockMethodType:
      if (theSIC->needRegWindowFlushes) flushRegisterWindows();
      break;
    case OuterMethodType:
      if (needToFlushRegWindow) {     // we inlined the receiver block
        if (theSIC->needRegWindowFlushes) flushRegisterWindows();
      } else {
        // receiver is parent, do nothing
      }
      break;
    default:
      fatal1("unknown kind: %ld", kind);
      break;
    }
  }
  
  void LoadIntNode::gen() {
    BasicNode::gen();
    if (isRegister(_dest->loc) && isImmediate(smiOop(value))) {
      theAssembler->OrI(G0, value, _dest->loc); // common case
    }
    else if (isRegister(_dest->loc)) {
      theAssembler->SetHiI(value, _dest->loc);
      theAssembler->AddI(_dest->loc, value, _dest->loc);
    }
    else {
      theAssembler->SetHiI(value, Temp1);
      theAssembler->AddI(Temp1, value, Temp1);
      theAssembler->StoreI(SP, spOffset(_dest->loc), Temp1);
    }
  }
  
  void StoreOffsetNode::gen() {
    BasicNode::gen();
    Location b = genHelper->moveToReg(base, Temp1);
    Location t = Temp2;
    if (_src->isConstPReg()) {
      // store constant
      ConstPReg* value = (ConstPReg*)_src;
      oop p = value->constant;
      // don't need to check-store if oop is old - old objs will never become
      // new again
      needCheckStore = needCheckStore && p->is_new(); // ints/floats aren't new
      if (p == 0) {
        theAssembler->StoreI(b, offset, G0);
      } else {
        assert(b != t, "must be different");
        t = genHelper->loadImmediateOop(value, t, false);
        theAssembler->StoreI(b, offset, t);
      }
    } else  {
      if (isRegister(_src->loc)) {
        theAssembler->StoreI(b, offset, _src->loc);
      } else {
        theAssembler->LoadI(SP, spOffset(_src->loc), t);
        theAssembler->StoreI(b, offset, t);
      }
    }
    if (needCheckStore) {
      // do a check-store
      assert(isRegister(b), "base reg of check_store must be in a register");
      if (offset > card_size || !AllowOffsetCheckStores) {
        // use slow check-store sequence
        // (marked card may be off by one, but not more)
        theAssembler->AddI(b, offset, Temp1);
        b = Temp1;
      }
      theAssembler->SrlI(b, card_shift, Temp1);         // shift target addr 
      theAssembler->StoreBR(Temp1, ByteMapBaseReg, G0); // set byte in map
    }
  }
  
  void AssignNode::genOop() {
    ConstPReg* value = (ConstPReg*)_src;
    Location src = value->loc;
    if (src != UnAllocated) {
      // value is already in src register
      genHelper->moveRegToLoc(src, _dest->loc);
    } else if (isRegister(_dest->loc)) {
      genHelper->loadImmediateOop(value->constant, _dest->loc);
    } else {
      Location t = Temp1;
      oop c = value->constant;
      if (c) {
        genHelper->loadImmediateOop(c, t);
      } else {
        t = G0;
      }
      theAssembler->StoreI(SP, spOffset(_dest->loc), t);
    }
  }
  
  void CallNode::nlrCode() {
    if (nlrPoint()) {
      // branch to NLR code
      Label* l_ = theAssembler->BraForward(true);
      nlrPoint()->l = l_->unify(nlrPoint()->l);
      theAssembler->Nop();
    } else {
      // continue NLR (return through caller's inline cache)
      theAssembler->JmpLI(ReturnAddr, sendDesc::non_local_return_offset, G0);
      theAssembler->RestoreR(G0, G0, G0); 
    }
  }
  
  void SendNode::gen() {
    BasicNode::gen();
    offset = theAssembler->offset();
    assert(bci() != IllegalBCI, "should have legal bci");
    genPcDesc();
    genBreakpointBeforeCall();
    theAssembler->CallB(Memory->code->trapdoors->SendMessage_stub_td());
    theAssembler->Nop();
    theAssembler->Data(mask());
    nlrCode();
    theAssembler->Zero();       // nmlns
    theAssembler->Zero();
    if (sel != badOop) {
      if (isPerformLookupType(l)) {
        assert_smi(sel, "should be an integer argcount");
        theAssembler->Data(smiOop(sel)->value());       // really arg count
      } else {
        assert_string(sel, "should be a string constant");
        theAssembler->Data(sel);                        // constant selector
      }
    }
    if ((l & UninlinableSendMask) == 0) theSIC->noInlinableSends = false;
    theAssembler->Data(l);
    verifySendInfo();
    if (del) {
      assert(needsDelegatee(l), "shouldn't have a delegatee");
      theAssembler->Data(del);
    }
  }
  
  void PrimNode::gen() {
    BasicNode::gen();
    assert(bci() != IllegalBCI, "should have legal bci");
    if (pd->canWalkStack()) genPcDesc();
    theAssembler->CallP(first_inst_addr(pd->fn()));
    fint skip = pd->canScavenge() ? oopSize : 0;      // reg. mask
    if (pd->needsNLRCode()) skip += sendDesc::abortable_prim_end_offset - sendDesc::nonabortable_prim_end_offset;
    if (skip) {
      // skip register mask / NLR code upon return
      theAssembler->AddI(CalleeReturnAddr, skip, CalleeReturnAddr);
      theAssembler->Data(mask());
      if (pd->needsNLRCode()) nlrCode();
    } else {
      theAssembler->Nop();
    }
  }
  
  void InterruptCheckNode::gen() {
    BasicNode::gen();
    genPcDesc();
    theAssembler->Comment("stack overflow/interrupt check");
    theAssembler->SubCCR(SP, SPLimitReg, G0);     // test for stack overflow
    Label* l_ = theAssembler->BgeForward(false);        // no overflow
    theAssembler->Nop();
    PrimNode::gen();
    l_->define();
  }

  void RestartNode::gen() {
    genPcDesc();
    theAssembler->Comment("stack overflow/interrupt check");
    theAssembler->SubCCR(SP, SPLimitReg, G0);     // test for stack overflow
    // with the advent of branch bcs, the loop start's label may be zero,
    // so replace:
    //    theAssembler->Bge(loopStart->l, false);     // no overflow
    // with:
    loopStart->l = loopStart->l->unify( theAssembler->BgeForward(false) );
    theAssembler->Nop();
    PrimNode::gen();
    theAssembler->Bra(loopStart->l, true);
  }

  void BlockCloneNode::genCall() {
    Location dest = block()->loc;
    genHelper->loadImmediateOop(block()->block, CReceiverReg);   // load block Oop
    theAssembler->CallP(first_inst_addr(blockClone->fn()));
    theAssembler->OrR(SP, G0, Arg1);                    // load home frame
    assert(!blockClone->canScavenge() && !blockClone->needsNLRCode(),
           "need to rewrite this");
    genHelper->moveRegToLoc(ResultReg, dest);
    if (block()->uplevelR && isRegister(dest)) {
      // flush to stack
      theAssembler->StoreI(SP, spOffset(dest), dest);
    }
  }
  
  void BlockCreateNode::gen() {
    BasicNode::gen();
    if (block()->primFailBlockScope) {
      // must generate block (in primitive fail branch)
      assert(!isMemoized(), "shouldn't be memoized");
      genCall();
    } else if (isMemoized()) {
      // test if already created
      theAssembler->Comment("test memoized block");
      Location t = genHelper->moveToReg(block(), Temp1);
      Location t2 = genHelper->loadImmediateOop(deadBlockPR, Temp2, false);
      theAssembler->SubCCR(t, t2, G0);
      Label* done = theAssembler->BneForward(false);
      genCall();
      done->define();
    } else {
      // block has already been created (by initial BlockClone node)
    }
  }
  
  void NonLocalReturnNode::gen() {
    BasicNode::gen();
    theAssembler->JmpLI(ReturnAddr, sendDesc::non_local_return_offset, G0);
    theAssembler->RestoreR(G0, G0, G0);
  }
  
  void MethodReturnNode::gen() {
    BasicNode::gen();
    Location res = genHelper->moveToReg(_src, Temp1);
    if (haveStackFrame) {
      theAssembler->JmpLI(ReturnAddr, offset, G0);
      theAssembler->RestoreR(res, G0, ResultReg);
    } else {
      theAssembler->JmpLI(CalleeReturnAddr, offset, G0);
      theAssembler->OrR(res, G0, ResultReg);
    }
  }
  
  Location arith_genHelper(PReg* sreg, PReg* oper, PReg* dest,
                           ArithOpCode op,
                           Location& t1, Location& t2, bool& reversed) {
    bool haveImmediate = false;
    reversed = false;
    oop immediate;
    if (sreg->isConstPReg()) {
      oop val = ((ConstPReg*)sreg)->constant;
      if (val->is_smi() && isImmediate(smiOop(val))) {
        // try to reverse the sense of the operation
        switch (op) {
         case AddArithOp:       
         case AddCCArithOp:             
         case TAddCCArithOp:    
         case AndArithOp:               
         case AndCCArithOp:             
         case OrArithOp:                
         case OrCCArithOp:              
         case XOrArithOp:
          // commutative operator, no problem
          sreg = oper; immediate = val; haveImmediate = reversed = true;
          break;
          
          // would need to reverse non-const operand/operation for subtract,
          // so no savings
         case SubArithOp:
         case SubCCArithOp:             
         case TSubCCArithOp:
          break;

         case ArithmeticLeftShiftArithOp:
         case LogicalLeftShiftArithOp:
         case ArithmeticRightShiftArithOp:
         case LogicalRightShiftArithOp:
          // don't bother
          break;
         default:       ShouldNotReachHere(); // unexpected arith type
        }
      }
    } else if (oper->isConstPReg()) {
      oop val = ((ConstPReg*)oper)->constant;
      if (val->is_smi() && isImmediate(smiOop(val))) {
        immediate = val; haveImmediate = true; 
      }
    }   
        
    Location src  = genHelper->moveToReg(sreg, Temp1);
    Location dst = isRegister(dest->loc) ? dest->loc : Temp2;
    if (haveImmediate) {
      t1 = src; t2 = G0;
      int opn = (int)immediate; // for better switch formatting
      switch (op) {
       case AddArithOp:    theAssembler->AddI(src, opn, dst);   break;
       case SubArithOp:    theAssembler->SubI(src, opn, dst);   break;
       case AndArithOp:    theAssembler->AndI(src, opn, dst);   break;
       case OrArithOp:     theAssembler->OrI (src, opn, dst); break;
       case XOrArithOp:    theAssembler->XorI(src, opn, dst); break;
       case ArithmeticLeftShiftArithOp:
       case LogicalLeftShiftArithOp:
                           theAssembler->SllI(src, opn, dst);   break;
       case ArithmeticRightShiftArithOp:
                           theAssembler->SraI(src, opn, dst);   break;
       case LogicalRightShiftArithOp:
                           theAssembler->SrlI(src, opn, dst);           break;
       case AddCCArithOp:  theAssembler->AddCCI(src, opn, dst); break;
       // Do not have to worry about immed being oop (for _Eq:) because SPARC does not
       // do immediate oops. -- dmu 4/07
       case SubCCArithOp:  theAssembler->SubCCI(src, opn, dst); break;
       case AndCCArithOp:  theAssembler->AndCCI(src, opn, dst); break;
       case OrCCArithOp:   theAssembler->OrCCI (src, opn, dst); break;
       case TAddCCArithOp: theAssembler->TAddCCI(src, opn, dst);        break;
       case TSubCCArithOp: theAssembler->TSubCCI(src, opn, dst);        break;
       default:         ShouldNotReachHere(); // unexpected arith type
      }
    } else {
      Location src2 = genHelper->moveToReg(oper, Temp2);
      t1 = src; t2 = src2;
      switch (op) {
       case AddArithOp:         theAssembler->AddR(src, src2, dst);     break;
       case SubArithOp:         theAssembler->SubR(src, src2, dst);     break;
       case AndArithOp:         theAssembler->AndR(src, src2, dst);     break;
       case OrArithOp:          theAssembler->OrR (src, src2, dst);     break;
       case XOrArithOp:         theAssembler->XorR(src, src2, dst);     break;
       case ArithmeticLeftShiftArithOp:
       case LogicalLeftShiftArithOp:
                                theAssembler->SllR(src, src2, dst);     break;
       case ArithmeticRightShiftArithOp:
                                theAssembler->SraR(src, src2, dst);     break;
       case LogicalRightShiftArithOp:
                                theAssembler->SrlR(src, src2, dst);     break;

       case AddCCArithOp:       theAssembler->AddCCR(src, src2, dst);   break;
       case SubCCArithOp:       theAssembler->SubCCR(src, src2, dst);   break;
       case AndCCArithOp:       theAssembler->AndCCR(src, src2, dst);   break;
       case OrCCArithOp:        theAssembler->OrCCR (src, src2, dst);   break;
       case TAddCCArithOp:      theAssembler->TAddCCR(src, src2, dst);  break;
       case TSubCCArithOp:      theAssembler->TSubCCR(src, src2, dst);  break;

       default:                 ShouldNotReachHere(); // unexpected arith type
      }
    }
    return dst;
  }


  void TArithRRNode::markAllocated(fint* use_count, fint* def_count) {
    U_CHECK(_src); D_CHECK(_dest); 
    U_CHECK(oper); 
  }

  bool TArithRRNode::canCopyPropagateFrom(PReg* ) {
    return true;
  }


  bool TArithRRNode::isOpInlinable( ArithOpCode op ) {
    return   op == TAddCCArithOp
        ||   op == TSubCCArithOp;
  }


  void TArithRRNode::gen() {
    BasicNode::gen();
    if (constResult) {
      Location dest = isRegister(_dest->loc) ? _dest->loc : Temp2;
      Location l_ = genHelper->moveToReg(constResult, dest);
      if (l_ != _dest->loc) genHelper->moveRegToLoc(dest, _dest->loc);
    } else {
      Location t1, t2;
      bool reversed;
      if (SICCountIntTagTests)
        theAssembler->markTagTest(arg1IsInt ? 1 : 2);
      Location dest = arith_genHelper(_src, oper, _dest, op,
                                      t1, t2, reversed);

      Node* n= next1();
      if (n) {
        Label* l_= theAssembler->BvsForward(false);
        n->l= l_->unify(n->l);
      }
      
      // fill delay slot with tag test
      // caution: code below depends on temp reg assignments in arith_genHelper
      // also, the code in sicPrimline.c depends on Temp1 being set correctly
      if (arg1IsInt) {
        // only need to check arg2
        Location t = reversed ? t1 : t2;
        if (t == G0) {
          theAssembler->Nop();
        } else {
          theAssembler->AndCCI(t, Tag_Mask, Temp1);
        }
      } else {
        theAssembler->OrR(t1, t2, Temp1);
      }
      
      if (dest != _dest->loc) {
        // store result on stack (success case)
        theAssembler->StoreI(SP, spOffset(_dest->loc), dest);
      }
    }
  }
  
  void ArithRCNode::gen() {
    BasicNode::gen();
    Location src  = genHelper->moveToReg(_src, Temp1);
    Location dest = isRegister(_dest->loc) ? _dest->loc : Temp2;
    switch (op) {
     case AddArithOp:   theAssembler->AddI(src, oper, dest);    break;
     case SubArithOp:   theAssembler->SubI(src, oper, dest);    break;
     case AndArithOp:   theAssembler->AndI(src, oper, dest);    break;
     case OrArithOp:    theAssembler->OrI (src, oper, dest);    break;
     case XOrArithOp:   theAssembler->XorI(src, oper, dest);    break;
     case ArithmeticLeftShiftArithOp:
     case LogicalLeftShiftArithOp:
                        theAssembler->SllI(src, oper, dest);    break;
     case ArithmeticRightShiftArithOp:
                        theAssembler->SraI(src, oper, dest);    break;
     case LogicalRightShiftArithOp:
                        theAssembler->SrlI(src, oper, dest);    break;

     case AddCCArithOp: theAssembler->AddCCI(src, oper, dest);  break;
     case SubCCArithOp: theAssembler->SubCCI(src, oper, dest);  break;
     case AndCCArithOp: theAssembler->AndCCI(src, oper, dest);  break;
     case OrCCArithOp:  theAssembler->OrCCI (src, oper, dest);  break;

     default:           ShouldNotReachHere(); // unexpected arith type
    }
    if (dest != _dest->loc) {
      theAssembler->StoreI(SP, spOffset(_dest->loc), dest);
    }
  }
  
  void BranchNode::gen() {
    BasicNode::gen();
    Label* l_;
    switch (op) {
     case ALBranchOp:   l_ = theAssembler->BraForward(false);   break;
     case EQBranchOp:   l_ = theAssembler->BeqForward(false);   break;
     case NEBranchOp:   l_ = theAssembler->BneForward(false);   break;
     case LTBranchOp:   l_ = theAssembler->BltForward(false);   break;
     case LEBranchOp:   l_ = theAssembler->BleForward(false);   break;
     case LTUBranchOp:  l_ = theAssembler->BltuForward(false);  break;
     case LEUBranchOp:  l_ = theAssembler->BleuForward(false);  break;
     case GTBranchOp:   l_ = theAssembler->BgtForward(false);   break;
     case GEBranchOp:   l_ = theAssembler->BgeForward(false);   break;
     case GTUBranchOp:  l_ = theAssembler->BgtuForward(false);  break;
     case GEUBranchOp:  l_ = theAssembler->BgeuForward(false);  break;
     case VSBranchOp:   l_ = theAssembler->BvsForward(false);   break;
     case VCBranchOp:   l_ = theAssembler->BvcForward(false);   break;
     default:           ShouldNotReachHere(); // unexpected branch type
    }
    theAssembler->Nop();
    Node* n = next1();
    n->l = l_->unify(n->l);
  }
  
  
  void TBranchNode::genCompare(bool haveImmediate,
                                Location rcvrReg, Location argReg) {
    if (haveImmediate) {
      oop val = ((ConstPReg*)arg)->constant;
      theAssembler->TSubCCI(rcvrReg, (int)val, G0);
    }
    else {
      theAssembler->TSubCCR(rcvrReg, argReg, G0);
    }
  }


  void TBranchNode::testTagsIfNecessary(bool haveImmediate, Location rcvrReg, Location argReg) {
    // test both tags (overflow might be false alarm)
    if (SICCountTypeTests) {
      // not sure if type test counting stuff is right anymore -- dmu
      theAssembler->startTypeTest(2, false, true);
      theAssembler->doOneTypeTest();
    }
    if (SICCountIntTagTests) theAssembler->markTagTest(2);
    Label* noPrimFailure = theAssembler->BvcForward(false);
    theAssembler->Nop();
    Label*& ovflLabel = ((MergeNode*)nexti(2))->l;
    if (!intRcvr) {
      theAssembler->TAddCCI(rcvrReg, 0, G0);
      ovflLabel = ovflLabel->unify(theAssembler->BvsForward(false));
    }
    if (!intArg) { 
      theAssembler->TAddCCI(argReg, 0, G0);
      ovflLabel = ovflLabel->unify(theAssembler->BvsForward(false));
    }
    if (SICCountTypeTests) theAssembler->endTypeTest();
    genCompare(haveImmediate, rcvrReg, argReg);
    noPrimFailure->define(); // define no non-int destination    
  }
  

  // helper functions for n-way type test; similar to PIC code (cacheStub.c)

  // Next three are for PPC, someday could refactor SPARC to use them -- dmu 10/03
  
  void TypeTestNode::br_if_smi(Assembler* , Location , fint ) {
    fatal("not used on SPARC");
  }

  void TypeTestNode::br_if_float(Assembler* , Location , fint ) {
    fatal("not used on SPARC");
  }
  
  void TypeTestNode::br_to_unknown_case(Assembler* a) {
    fatal("not used on SPARC");
  }


  fint TypeTestNode::prologue(Assembler* a, Location rcvr, fint smiIndex,
                              fint floatIndex, bool immediateOnly,
                              Label*& firstMemOopTest) {
    // handle immediate cases of type test and load map if necessary
    // smiIndex/Float are the indices of the smi/float case in the map list
    // (+ 1, so that "not present" == 0)
    // returns the index (+ 1) of the fall-through case 
    assert(((Float_Tag | Int_Tag) & Mem_Tag) == 0, "tagging scheme changed");
    assert(!immediateOnly || !needMapLoad,
           "immediateOnly implies !needMapLoad");
    fint fallThrough = 0;
    
    if (needMapLoad) {
      if (!FastMapTest || smiIndex || floatIndex) {
        a->AndCCI(rcvr, Mem_Tag, G0);
        firstMemOopTest = a->BneForward(true);
      }
      a->LoadI(rcvr, map_offset(), RcvrMapReg);
    }
    if (smiIndex) {
      a->AndCCI(rcvr, Tag_Mask, G0);
      if (SICCountTypeTests) theAssembler->doOneTypeTest();
      if (SICCountIntTagTests && immediateOnly) {
        // check if this tag test is on behalf of integer arithmetic
        methodMap* mm = (methodMap*)scope()->method()->map();
        stringOop sel = mm->get_selector_at(bci());
        bool isArith = (sel == VMString[PLUS] || sel == VMString[MINUS]);
        theAssembler->markTagTest(1, isArith);
      }
      define(smiIndex, a->BeqForward(SICCountTypeTests));
      if (SICCountTypeTests) a->endTypeTest();
      if (floatIndex) {
        a->AndCCI(rcvr, Float_Tag, G0); // test for float (delay slot)
        if (needMapLoad && !FastMapTest) {
          // already tested for memTag, so it must be a float
          fallThrough = floatIndex;
        } else {
          // need to test float tag
          // andcc rcvr, Float_Tag  (done in delay slot of prev. test)
          if (SICCountTypeTests) theAssembler->doOneTypeTest();
          define(floatIndex, a->BneForward(true));
          if (SICCountTypeTests) {
            a->endTypeTest();
          } else {
            a->Nop();       // must be here because next instr could be unimp
          }
        }
      } else {
        if (SICCountTypeTests) {
          // already filled delay slot
        } else {
          a->Nop();         // must be here because next instr could be unimp
        }
      }
    } else if (floatIndex) {
      a->AndCCI(rcvr, Float_Tag, G0); 
      if (SICCountTypeTests) theAssembler->doOneTypeTest();
      define(floatIndex, a->BneForward(true));
      if (SICCountTypeTests) {
        a->endTypeTest();   // only executed in success case
      } else {
        a->Nop();           // must be here because next instr could be unimp
      }
      // if we get here, it must be an int (if needMapLoad) or a memOop (if
      // !needMapLoad), but we didn't expect this so jump to the unknown case
      define(0, a->BraForward(!SICCountTypeTests));
      if (SICCountTypeTests) a->endTypeTest();
    } else if (needMapLoad) {
      // neither int nor float case
      assert(maps->length(), "should have at least one memOop case");
      if (FastMapTest) {
        // no test for memOop-ness, i.e. just fall through to first memOop case
      } else {
        // it's not a memOop and we have no immediate case, so jump to unknown
        assert(fallThrough == 0, "shouldn't have a fall-through");
        define(0, a->BraForward(true));
      }
    } else {
      // neither int not float nor mapLoad - empty prologue
    }
    return fallThrough;
  }
  
  void TypeTestNode::testMap(ConstPReg* pr, fint index) {
    assert(pr->constant->is_map(), "should be map");
    assert(needMapLoad, "need to load receiver map");
    Location maploc = genHelper->loadImmediateOop(pr, MapReg, false);    // load map
    theAssembler->SubCCR(maploc, RcvrMapReg, G0);               // test
    if (SICCountTypeTests) theAssembler->doOneTypeTest();
    define(index, theAssembler->BeqForward(SICCountTypeTests));
    if (SICCountTypeTests) theAssembler->endTypeTest();         // delay slot
  }
  
  void TypeTestNode::testOop(ConstPReg* pr, fint index) {
    assert(!pr->constant->is_map(), "should be oop");
    Location loc = genHelper->loadImmediateOop(pr, MapReg, false);       // load oop
    theAssembler->SubCCR(loc, r, G0);                           // test
    if (SICCountTypeTests) theAssembler->doOneTypeTest();
    define(index, theAssembler->BeqForward(SICCountTypeTests));
    if (SICCountTypeTests) theAssembler->endTypeTest();         // delay slot
  }
  
  void TypeTestNode::gen() {
    // generates n-way type test; fall-through code is "unknown" case
    BasicNode::gen();
    r = genHelper->moveToReg(_src, Temp3);
    fint smiIndex = 0;
    fint floatIndex = 0;
         if (maps->nth(0) == Memory->smi_map  ->enclosing_mapOop()) smiIndex   = 1;
    else if (maps->nth(0) == Memory->float_map->enclosing_mapOop()) floatIndex = 1;
    if (maps->length() > 1) {
           if (maps->nth(1) == Memory->smi_map  ->enclosing_mapOop()) smiIndex   = 2;
      else if (maps->nth(1) == Memory->float_map->enclosing_mapOop()) floatIndex = 2;
    }
    fint nconstants = 0;
    fint ntests = maps->length();
    fint firstMem = max(smiIndex, floatIndex);
    bool immediateOnly = firstMem == maps->length();
    fint i;
    for (i = firstMem; i < ntests; i++) {
      ConstPReg* pr = mapPRs->nth(i);
      if (!pr->constant->is_map()) nconstants++;
    }

    if (SICCountTypeTests) {
      theAssembler->startTypeTest(ntests, false, immediateOnly);
    }

    // first test against all constants
    if (!hasUnknown && nconstants == ntests) {
      // don't need to check for last constant
      ntests--;
    }
    for (i = firstMem; i < ntests; i++) {
      ConstPReg* pr = mapPRs->nth(i);
      if (!pr->constant->is_map()) testOop(pr, i + 1);
    }

    if (!hasUnknown && nconstants >= ntests) {
      // last case; should omit branch
      if (SICCountTypeTests) {
        theAssembler->endTypeTest();
      } else {
        theAssembler->Nop();    // fill delay slot of last test
      }
      define(ntests + 1, theAssembler->BraForward(true));
      return;           // done -- tested all constants
    }
    

    Label* firstMemOopTest = NULL;
    fint n = prologue(theAssembler, r, smiIndex, floatIndex, immediateOnly,
                      firstMemOopTest);

    if (n) define(n, theAssembler->BraForward(true));
    if (firstMemOopTest) {
      if (immediateOnly) {
        define(0, firstMemOopTest);     // no memOop tests
      } else {
        firstMemOopTest->define();
      }
    }
    if (!hasUnknown) ntests--;      // all maps known, can omit last test
    // test against all maps
    for (i = firstMem; i < ntests; i++) {
      ConstPReg* pr = mapPRs->nth(i);
      if (pr->constant->is_map()) testMap(pr, i + 1);
    }
    if (!immediateOnly) theAssembler->Nop();// fill delay slot of last map test
    if (SICCountTypeTests) theAssembler->endTypeTest();
    if (!hasUnknown) {
      // last case; should omit branch
      define(ntests + 1, theAssembler->BraForward(true));
    }
  }

  void IndexedBranchNode::gen() {
    // generates n-way indexed branch;
    // fall-through code is non-int or out of bounds
    BasicNode::gen();
    r = genHelper->moveToReg(_src, IndexReg);
    
    // check bounds
    genHelper->loadImmediateOop(as_smiOop(nCases), BoundsReg, true);
    theAssembler->TSubCCR( BoundsReg, r, G0);
    Label* end = theAssembler->BleuForward(false);
    theAssembler->Nop();
    
    // check tag (reuse bounds cmp)
    if (!srcMustBeSmi) {
      end->unify( theAssembler->BvsForward(false));
      theAssembler->Nop();
    }
    char* cra= theAssembler->addr();
    const int32 bytesFromCallToJump = 4 * sizeof(int32);
    const int32 bytesFromCallToInstAfterDelay  = 2 * sizeof(int32);
    // only on V9: theAssembler.ReadPC(Temp2); 
    theAssembler->CallN( theAssembler->addr() + bytesFromCallToInstAfterDelay);
    const int32 indexShift = 2 - Tag_Size;
    assert(indexShift == 0, "no shift needed");
    theAssembler->AddR( r, CalleeReturnAddr, BoundsReg); // delay slot
    assert( theAssembler->addr() - cra  == bytesFromCallToInstAfterDelay,
            "recount instructions");
    theAssembler->JmpLI( BoundsReg, bytesFromCallToJump - (Int_Tag << indexShift), G0);
    theAssembler->Nop(); // delay slot for jmp, cannot have branch here
    assert( theAssembler->addr() - cra  == bytesFromCallToJump,  
             "recount instructions");
    for (fint i = 0;  i < nCases;  ++i) {
      Label* l_ = theAssembler->BraForward(true);
      Node* n = nexti(i + 1);
      n->l = l_->unify(n->l);      
    }
    end->define();
  }
      
    
  void BlockZapNode::gen() {
    BasicNode::gen();
    Location t = genHelper->moveToReg(block(), Temp1);
    theAssembler->StoreI(t, scope_offset(), G0); 
  }
  

  void AbstractArrayAtNode::markAllocated(fint* use_count, fint* def_count) {
    U_CHECK(_src); D_CHECK(_dest); U_CHECK(arg);
    if (error) D_CHECK(error);
    use_count[Temp4]++; def_count[Temp4]++;       // (potentially) uses Temp4
  }
  
  bool AbstractArrayAtNode::canCopyPropagateFrom(PReg* d) {
    return d->loc != Temp4; // prevent local cp of Temp4
  }

  void AbstractArrayAtNode::gen() {
    BasicNode::gen();
    Label* argFail = NULL;          // if arg isn't a smi
    Label* indexFail = NULL;        // if arg is out of bounds
    Assembler* a = theAssembler;
    Location arr = genHelper->moveToReg(_src, Temp2);
    Location index = genHelper->moveToReg(arg, Temp1);
    Location size = Temp3;
    // load array size now (avoids load interlock for range check)
    a->LoadI(arr, sizeOffset, size);  
    if (!intArg) {
      // CP may have propagated a constant into arg
      intArg = arg->isConstPReg() && ((ConstPReg*)arg)->constant->is_smi();
    }
    if (!intArg) {
      // test arg for smiOop
      if (SICCountTypeTests) {
        a->startTypeTest(1, false, true);
        a->doOneTypeTest();
      }
      if (SICCountIntTagTests) a->markTagTest(1);
      a->AndCCI(index, Tag_Mask, G0);
      argFail = argFail->unify(a->BneForward(false));
      if (SICCountTypeTests) a->endTypeTest();
    }
    argFail = argFail->unify(testArg2());
    a->SubCCR(index, size, G0);
    indexFail = a->BgeuForward(false);
    Location res = isRegister(_dest->loc) ? _dest->loc : Temp1;
    bool needDestStore = genAccess(arr, index, res);
    if (needDestStore && !isRegister(_dest->loc)) {
      genHelper->moveRegToLoc(res, _dest->loc);
    }
    Label* done = a->BraForward(true);
    MergeNode* failMerge = (MergeNode*)next1();
    if (argFail) {
      argFail->define();
      if (error) {
        Location err = isRegister(error->loc) ? error->loc : Temp1;
        genHelper->loadImmediateOop(VMString[BADTYPEERROR], err);
        if (err != error->loc) genHelper->moveRegToLoc(err, error->loc);
      }
      if (failMerge) // test added by dmu 4/27/96
        failMerge->l = failMerge->l->unify(a->BraForward(true));
    }
    indexFail->define();
    if (error) {
      Location err = isRegister(error->loc) ? error->loc : Temp1;
      genHelper->loadImmediateOop(VMString[BADINDEXERROR], err);
      if (err != error->loc) genHelper->moveRegToLoc(err, error->loc);
    }
    if (failMerge) // test added by dmu 4/27/96
      failMerge->l = failMerge->l->unify(a->BraForward(true));
    done->define();
  }

  // gen array access; Temp3/4 are available, Temp1 may hold index, Temp2
  // may hold array
  bool ArrayAtNode::genAccess(Location arr, Location index, Location dest) {
    theAssembler->AddI(index, dataOffset, Temp1);
    theAssembler->LoadR(arr, Temp1, dest);
    return true;
  }

  bool ByteArrayAtNode::genAccess(Location arr, Location index, Location dest){
    theAssembler->LoadI(arr, dataOffset, Temp3);
    theAssembler->SrlI(index, Tag_Size, Temp1); // convert index to int
    theAssembler->LoadUBR(Temp3, Temp1, dest);  // load byte
    theAssembler->SllI(dest, Tag_Size, dest);   // convert to smi
    return true;
  }

  bool ArrayAtPutNode::genAccess(Location arr, Location index, Location dest) {
    Unused(dest);
    Location el;
    bool needCheckStore;
    if (elem->isConstPReg()) {
      ConstPReg* value = (ConstPReg*)elem;
      el = genHelper->loadImmediateOop(value, Temp3, false);
      needCheckStore = value->constant->is_new();
    } else {
      el = genHelper->moveToReg(elem, Temp3);
      needCheckStore = true;
    }
    theAssembler->AddI(index, dataOffset, Temp1);
    theAssembler->StoreR(arr, Temp1, el);
    if (needCheckStore) {
      theAssembler->AddR(arr, Temp1, Temp1);
      theAssembler->SrlI(Temp1, card_shift, Temp1);     // shift target addr 
      theAssembler->StoreBR(Temp1, ByteMapBaseReg, G0); // set byte in map
    }
    // ignore dest and handle result assignment here (saves one instruction)
    if (_dest != _src) genHelper->moveRegToLoc(arr, _dest->loc);
    return false;       
  }

  // check value; Temp3 holds array size, Temp1 may hold index, Temp2
  // may hold array; Temp4 is available
  Label* ByteArrayAtPutNode::testArg2() {
    // check if arg is 0..255
    if (elem->isConstPReg()) {
      if (((ConstPReg*)elem)->constant->is_smi()) {
        // no run-time check required
        return NULL;
      } else {
        // primitive will always fail
        return theAssembler->BraForward(false);
      }
    } else {
      Location e = genHelper->moveToReg(elem, Temp4);
      Label* fail = NULL;
      if (!intElem) {
        // check for int
        if (SICCountTypeTests) {
          theAssembler->startTypeTest(1, false, true);
          theAssembler->doOneTypeTest();
        }
        if (SICCountIntTagTests) theAssembler->markTagTest(1);
        theAssembler->AndCCI(e, Tag_Mask, G0);
        fail = theAssembler->BneForward(false);
        if (SICCountTypeTests) theAssembler->endTypeTest();
      }
      theAssembler->SubCCI(e, 256 << Tag_Size, G0);
      return fail->unify(theAssembler->BgtuForward(false));
    }
  }
  
  bool ByteArrayAtPutNode::genAccess(Location arr,
                                     Location index, Location dest) {
    Unused(dest);
    theAssembler->LoadI(arr, dataOffset, Temp4);
    theAssembler->SrlI(index, Tag_Size, Temp1); // convert index to int
    if (elem->isConstPReg()) {
      // storing a constant - may be non-smi, but then this code will never
      // be executed anyway because the primitive fails
      ConstPReg* value = (ConstPReg*)elem;
      if (value->constant->is_smi()) {
        theAssembler->OrI(G0, smiOop(value->constant)->value(), Temp3);
      } else {
        theAssembler->Unimp(1111, false);               // cause trap
      }
    } else {
      Location el = genHelper->moveToReg(elem, Temp3);
      theAssembler->SrlI(el, Tag_Size, Temp3);  // convert to char
    }
    theAssembler->StoreBR(Temp4, Temp1, Temp3); // store in byte array
    // ignore dest and handle result assignment here (saves one instruction)
    if (_dest != _src) genHelper->moveRegToLoc(arr, _dest->loc);
    return false;           // result already handled here 
  }

  void FlushNode::flushRegister(PReg* pr) {
    Location l = pr->loc;
    assert(l >= L0 && l <= I7, "not a local register");
    theAssembler->StoreI(SP, spOffset(l), l);
  }
  
  void DeadBlockNode::gen() {
    BasicNode::gen();
    theAssembler->TrapI(G0, SignalInterface::ST_UpLevel);
  }
  
  void DeadEndNode::gen() {
    // this node is unreachable - generate a trap for debugging
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      BasicNode::gen();
      theAssembler->TrapI(G0, SignalInterface::ST_ShouldNeverHappen);
    }
#   endif
  }
  
  void UncommonNode::gen() {
    BasicNode::gen();
    genPcDesc();
    theAssembler->Unimp(0, restartSend);
  }
  

# endif  // sic
