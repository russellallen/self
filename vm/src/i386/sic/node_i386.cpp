# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.5 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "node_i386.hh"

# include "_node_i386.cpp.incl"

# if defined(SIC_COMPILER)

  void BasicNode::genBranch() {
    Label* l2 = new Label(theAssembler->printing);
    theAssembler->jmp(l2);
    l = l->unify(l2);
  }


  void BasicNode::restoreFrameAndReturn(bool haveStackFrame, fint offset) {
    theAssembler->Comment("restoreFrameAndReturn");

    if (haveStackFrame)
      theAssembler->leave();

    if (offset != 0)
      theAssembler->addl(offset, NumberOperand, esp, leaf_pc_offset*oopSize, NumberOperand);

    theAssembler->ret();
  }


  void PrologueNode::actuallyCreateStackFrame() {
    // The next three instructions are supposed to be faster than this:
    //   theAssembler->enter( (thisFrameSize - linkage_area_size) * oopSize);
    //    -- dmu 5/06
    theAssembler->pushl(ebp);
    theAssembler->movl(esp, ebp);
    assert((thisFrameSize & (frame_word_alignment - 1)) == 0, "frame size check");
    theAssembler->subl((thisFrameSize - linkage_area_size) * oopSize, NumberOperand, esp);

    theSIC->_frameCreationOffset = theAssembler->offset();
  }


  void PrologueNode::clearStackLocations() {
    theAssembler->Comment("clear stack locations");
    // do not have to clear outgoing args
    for ( fint i = sizeof(RegisterString) * BitsPerByte;  i < theSIC->number_of_memory_locals();  ++i) {
      Location r;  int32 d;  OperandType t;
      reg_disp_type_of_loc(&r, &d, &t, StackLocation_for_index(i));
      theAssembler->movl(0, NumberOperand, r, d, t);
    }
  }


  void PrologueNode::createStackFrame() {
    assert(haveStackFrame(), "shouldn't be creating a stack frame");

    thisFrameSize = theSIC->frameSize();

    actuallyCreateStackFrame();
    clearStackLocations();
  }

  void PrologueNode::prePrologue() { }

  void PrologueNode::postPrologue() { }

  void LoadIntNode::gen() {
    BasicNode::gen();
    if (isRegister(_dest->loc)) {
      theAssembler->movl((int32)value, NumberOperand, _dest->loc);
    }
    else {
      theAssembler->Untested("loadIntNode");
      theAssembler->movl((int32)value, NumberOperand, Temp2);
      Location b;  int32 d;  OperandType t;
      reg_disp_type_of_loc(&b, &d, &t, _dest->loc);
      theAssembler->movl(Temp2, b, d, t);
    }
  }
  

  void StoreOffsetNode::gen() {
    BasicNode::gen();
    Location dstBase = genHelper->moveToReg(base, Temp1);
    Location t = Temp2;
    if (_src->isConstPReg()) {
      // store constant
      ConstPReg* value = (ConstPReg*)_src;
      oop p = value->constant;
      // don't need to check-store if oop is old - old objs will never become
      // new again
      needCheckStore = needCheckStore && p->is_new(); // ints/floats aren't new
      assert(dstBase != t, "must be different");
      theAssembler->movl((int32)p, OopOperand, dstBase, offset, NumberOperand);
    }
    else if (isRegister(_src->loc)) {
      theAssembler->movl(_src->loc, dstBase, offset, NumberOperand);
    }
    else {
      Location b;  int32 d;  OperandType tt;
      reg_disp_type_of_loc(&b, &d, &tt, _src->loc);
      theAssembler->movl(b, d, tt, t);
      theAssembler->movl(t, dstBase, offset, NumberOperand);
    }
    if (needCheckStore) {
      theAssembler->Comment("record store");
      // do a check-store
      assert(isRegister(dstBase), "base reg of check_store must be in a register");

      if (offset > card_size || !AllowOffsetCheckStores) {
        // use slow check-store sequence
        // (marked card may be off by one, but not more)
        theAssembler->leal(dstBase, offset, NumberOperand, Temp1);
        dstBase = Temp1;
      }

      if (dstBase != Temp1) theAssembler->movl(dstBase, Temp1);
      theAssembler->shrl(card_shift, NumberOperand, Temp1);  // shift target addr

      if (!UseByteMapBaseReg) {
        theAssembler->addl(no_reg, (int32)&byte_map_base, VMAddressOperand, Temp1);
        theAssembler->movb(0, Temp1, 0, VMAddressOperand);
      }
      else 
        theAssembler->movb(0, ByteMapBaseReg, 0, NumberOperand, Temp1, Assembler::by_one);
    }
  }
  

  void AssignNode::genOop() {
    ConstPReg* value = (ConstPReg*)_src;
    Location src = value->loc;
    if (src != UnAllocated) {
      // value is already in src register
      theAssembler->Untested("genOop");
      genHelper->moveRegToLoc(src, _dest->loc);
    }
    else if (isRegister(_dest->loc)) {
      genHelper->loadImmediateOop(value->constant, _dest->loc);
    }
    else {
      oop c = value->constant;
      Location b;  int32 d;  OperandType t;
      reg_disp_type_of_loc(&b, &d, &t, _dest->loc);
      if (b == ebp && d >= 0)
        theAssembler->Untested("genOop");
      theAssembler->movl((int32)c, OopOperand, b, d, t);
    }
  }

  
  void CallNode::nlrCode() {
    theAssembler->Comment("nlrCode");
    if (nlrPoint()) {
      // branch to NLR code
      Label* l_ = new Label(theAssembler->printing);
      theAssembler->jmp(l_);
      nlrPoint()->l = l_->unify(nlrPoint()->l);
    } 
    else {
      if (!theSIC->nlrLabel)
        theSIC->nlrLabel = new Label(theAssembler->printing);
      theAssembler->jmp(theSIC->nlrLabel);
    }
  }
  

  void SendNode::gen() {
    BasicNode::gen();
    assert(bci() != IllegalBCI, "should have legal bci");
    genPcDesc();
    genBreakpointBeforeCall();
    // WARNING: following code sequence is known to get_target_of_Self_call_site() & set_target_of_Self_call_site()
    
    // must align nmln to follow
    // There are a call and two jumps coming, each 5 bytes, so want pc to be 1 mod 4.
    // See align * in asmDefs_gcc_i386.s
    fint x = ((fint)theAssembler->offset() - 1) & 3;
    fint num_nops = (4 - x) & 3;
    for (fint i = 0;  i < num_nops; ++i) theAssembler->nop();

    theAssembler->call((int32)SendMessage_stub, BPVMAddressOperand);
    offset = theAssembler->offset();
    Label past_send_desc(theAssembler->printing);
    theAssembler->jmp(&past_send_desc);
    theAssembler->Data(mask());
    nlrCode();
    assert((theAssembler->offset() & Tag_Mask) == 0, "must be aligned");
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
    if (theSIC->nlrLabel && !theSIC->nlrLabel->isDefined()) {
      theAssembler->Untested("SendNode::gen");
      theSIC->nlrLabel->define();
      restoreFrameAndReturn(true, sendDesc::non_local_return_offset);
    }
    past_send_desc.define();
  }
  

  void reload_ByteMapBaseReg(PrimDesc* pd) {
    if (UseByteMapBaseReg && pd->canScavenge()) {
      // any prim that can scavenge, may expand heap,so need to reload this reg
      theAssembler->movl(no_reg, (int32)&byte_map_base, VMAddressOperand, ByteMapBaseReg);
    }
  }


    // may need to call theSIC->allocateArgs in PrimNode::PrimNode, much like BlockCloneNode
  void PrimNode::gen() {
    BasicNode::gen();
    assert(bci() != IllegalBCI, "should have legal bci");
    if (pd->canWalkStack()) genPcDesc();

    theAssembler->call((int32)first_inst_addr(pd->fn()), PVMAddressOperand); // do the call

    // skip over inline cache:
    Label past_nlr(theAssembler->printing); 
    theAssembler->jmp(&past_nlr);  // skip over mask and nlr code

    if (pd->canScavenge() || pd->needsNLRCode())
      theAssembler->Data(mask());              // used register mask for GC
  
    if (pd->needsNLRCode()) {
      reload_ByteMapBaseReg(pd);
      nlrCode();
      if (theSIC->nlrLabel && !theSIC->nlrLabel->isDefined()) {
        theSIC->nlrLabel->define();
        restoreFrameAndReturn(true, sendDesc::non_local_return_offset);
      }
    }
    past_nlr.define(); 
    reload_ByteMapBaseReg(pd);
  }


  void InterruptCheckNode::gen() {
    BasicNode::gen();
    genPcDesc();
    theAssembler->Comment("stack overflow/interrupt check");
    theAssembler->cmpl(no_reg, int32(&SPLimit), VMAddressOperand, esp); // test for stack overflow
    Label l_(theAssembler->printing);
    theAssembler->ja(&l_); // ok
    PrimNode::gen();
    l_.define();
  }

  void RestartNode::gen() {
    genPcDesc();
    theAssembler->Comment("stack overflow/interrupt check");
    theAssembler->cmpl(no_reg, int32(&SPLimit), VMAddressOperand, esp);
    Label* dest = new Label(theAssembler->printing);
    theAssembler->ja(dest);
    loopStart->l = loopStart->l->unify(dest);
    PrimNode::gen();
    theAssembler->jmp(loopStart->l);
  }

  void BlockCloneNode::genCall() {
    theAssembler->Comment("block clone");
    Location dest = block()->loc;

    genHelper->loadImmediateOop(block()->block, Temp1); // load block Oop
    theAssembler->movl(Temp1, esp, rcvr_offset * oopSize, NumberOperand);
    theAssembler->movl(ebp, esp, first_arg_offset * oopSize, NumberOperand);

    theAssembler->call( (int32)first_inst_addr(blockClone->fn()), PVMAddressOperand);
    assert(!blockClone->needsNLRCode(),  "need to rewrite this");
    genHelper->moveRegToLoc(ResultReg, dest);
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
      theAssembler->cmpl((int32)deadBlockPR->constant, OopOperand, Temp1);
      Label done;
      theAssembler->jne(&done); // optimize fast case, so predict-weird
      genCall();
      done.define();
    } else
      ; // block has already been created (by initial BlockClone node)
  }
  
  void NonLocalReturnNode::gen() {
    BasicNode::gen();
    restoreFrameAndReturn(true, sendDesc::non_local_return_offset);
  }


  void MethodReturnNode::gen() {
    BasicNode::gen();
    if (_src->isNoPReg()) {
      // control should never reach here; only happens after a non-lifo abort
      // i.e. a zapped block method. -- dmu 5/06
      theAssembler->hlt();
      return;
    }
    // move result to resultReg
    genHelper->moveToExactlyThisReg(_src, ResultReg);
    restoreFrameAndReturn(haveStackFrame, 0);
  }
  
  
  static void force_overflow(Node* failNode) {
    if (failNode == NULL)
      return;
    // The SIC uses the eq condition code bit to decide if this is overflow error
    // or operand type error, sigh. See sicPrimline.cpp.
    // So, force cond code to say equals here. -- dmu 5/06
    // If the failNode checked for overflow instead of eq, we could do this MUCH more directly
    // sicPrimline.cpp:295
    theAssembler->cmpl(eax, eax); 
    // And if the label does not exist yet, do this hooha so that it works anyway.
    Label* L = new Label(theAssembler->printing);
    theAssembler->jmp(L); // have to do it ones before the left shift
    failNode->l = L->unify(failNode->l);
  }
  
  
  static void check_overflow(Node* failNode) {
    if (failNode == NULL)
      return;
    Label ok(theAssembler->printing);
    theAssembler->jno(&ok);
    force_overflow(failNode);
    ok.define();
  }


  static void reverse_if_helpful(PReg*& sreg, PReg*& oper, ArithOpCode op, bool& srcIsInt, bool& operIsInt) {
   if (!sreg->isConstPReg())
     return;

   PReg* r; bool b;
    // try to reverse the sense of the operation
    switch (op) {
     case AddArithOp:       
     case AddCCArithOp:             
     case AndArithOp:               
     case AndCCArithOp:             
     case OrArithOp:                
     case OrCCArithOp:              
     case XOrArithOp:
     case TAndCCArithOp:
     case TOrCCArithOp:
     case TXorCCArithOp:
     case TAddCCArithOp:
     case TMulCCArithOp:
      // commutative operator, no problem
      r = sreg;  sreg = oper;  oper = r; 
      b = srcIsInt; srcIsInt = operIsInt;  operIsInt = b;
      break;
      
     // not commutative
     case SubArithOp:
     case SubCCArithOp:             
     case TSubCCArithOp:
     case TDivCCArithOp:
     case TModCCArithOp:
     case ArithmeticLeftShiftArithOp:
     case LogicalLeftShiftArithOp:
     case ArithmeticRightShiftArithOp:
     case LogicalRightShiftArithOp:
     case TALShiftCCArithOp:
     case TARShiftCCArithOp:
     case TLLShiftCCArithOp:
     case TLRShiftCCArithOp:
      break;
     default:       ShouldNotReachHere(); // unexpected arith type
    }
  }
  


  // ABI constraints:
  // add: none
  // sub: none
  // imul: none (use two addr)
  // idiv: dst must be eax (Temp1)
  // s[al][lr]: opn must be in Temp2
  // and, or, xor: none
  
  static Location arith_genHelper_move_src_to_reg(PReg* sreg, bool srcIsInt, PReg* oper, ArithOpCode op, Node* failNode) {
    assert(Temp3 == eax, "for idiv");
    assert(Temp2 == ecx, "for shifts");
    switch (op) {
     default: 
      assert(oper->loc != Temp1, "going to clobber it");
      return genHelper->moveToReg(sreg, Temp1);
      
     case DivArithOp:  case TDivCCArithOp:  case TModCCArithOp:
      assert(oper->loc != eax, "going to clobber it");
      genHelper->moveToExactlyThisReg(sreg, eax);
      // Set up edx:
      //  idiv instruction needs the high order 32-bits of 64-bit
      //  signed dividend in edx. -- dmu 5/06
      assert(oper->loc != edx && Temp4 == edx, "divide uses edx");
      theAssembler->movl(0, NumberOperand, edx);
      Label pos;
      theAssembler->testl(eax, eax);
      theAssembler->jge(&pos);
      theAssembler->notl(edx);
      pos.define();
      return eax;
    }
  }
  
  static Location arith_genHelper_move_oper_to_reg(Location& dst, PReg* oper, ArithOpCode op) {
    switch (op) {
     case DivArithOp:  case TDivCCArithOp:  case TModCCArithOp:
      assert(oper->loc != edx, "remainder, etc.");
      assert(Temp1 != edx  &&  Temp2 != edx, "");
      // Fall Through
     default: 
      return genHelper->moveToReg(oper, dst == Temp1 ? Temp2 : Temp1);
    
     case ArithmeticLeftShiftArithOp:   case LogicalLeftShiftArithOp:
     case ArithmeticRightShiftArithOp:  case LogicalRightShiftArithOp:
     case TALShiftCCArithOp:  case TLLShiftCCArithOp:  case TARShiftCCArithOp:  case TLRShiftCCArithOp:
      assert(ecx == Temp2, "???");
      if (dst == ecx) {
        theAssembler->Untested("moving dst->Temp1 for shift");
        theAssembler->movl(dst, Temp1);
        dst = Temp1;
      }
      genHelper->moveToExactlyThisReg(oper, ecx);
      return ecx;
    }
  }
  
  static Location arith_genHelper_do_immediate(Location dst, int32 opn, ArithOpCode op, bool ccOnly, Node* failNode) {
    Location t = dst == Temp1 ? Temp2 : Temp1;
    # define XX(op) case op: theAssembler->Untested("immed:" STR(op)); break;
    switch (op) {
      default: break;
      XX(NilArithOp) XX(AddArithOp) XX(SubArithOp) XX(MulArithOp) XX(DivArithOp) XX(AndArithOp) XX(OrArithOp)
      XX(XOrArithOp) XX(ArithmeticLeftShiftArithOp) XX(LogicalLeftShiftArithOp) XX(ArithmeticRightShiftArithOp)
      XX(LogicalRightShiftArithOp) XX(AddCCArithOp) XX(AndCCArithOp) XX(OrCCArithOp)
      XX(TALShiftCCArithOp) XX(TARShiftCCArithOp)
    }
    # undef XX
    switch (op) {
       case TAddCCArithOp:
       case AddCCArithOp:
       case AddArithOp: 
        if (ccOnly  &&  opn != 0x80000000)  {theAssembler->cmpl(-opn, NumberOperand, dst);  return no_reg;}
        else                                {theAssembler->addl( opn, NumberOperand, dst);  return dst;}

       case TSubCCArithOp:
       case SubCCArithOp:
       case SubArithOp: 
        // Following was wrong because _Eq: inlining uses SubCCArithOp, and needs to be OopOperand.
        // That's OK because SubCCArithOp is never used with funny numbers like TagMask -- dmu 4/07
        // Really, these nodes should carry the info along
        
        // if (ccOnly)       {theAssembler->cmpl(opn, op == TSubCCArithOp ? OopOperand : NumberOperand, dst);  return no_reg;}
        // else              {theAssembler->subl(opn, op == TSubCCArithOp ? OopOperand : NumberOperand, dst);  return dst;}

        if (ccOnly)       {theAssembler->cmpl(opn, op == SubArithOp ? NumberOperand : OopOperand, dst);  return no_reg;}
        else              {theAssembler->subl(opn, op == SubArithOp ? NumberOperand : OopOperand, dst);  return dst;}
        
       case TMulCCArithOp:  opn >>= Tag_Size; // FALL THROUGH
       case MulArithOp:     theAssembler->imull(opn, NumberOperand, dst, dst); return dst;
       
       case DivArithOp:     assert(dst == eax, "idiv");
                            theAssembler->movl(opn, NumberOperand, t);
                            theAssembler->idivl(t);
                            return dst;
       
       case TDivCCArithOp:  theAssembler->sarl(Tag_Size, NumberOperand, dst);
                            assert(dst == eax, "idiv");
                            theAssembler->movl(opn >> Tag_Size, NumberOperand, t);
                            theAssembler->idivl(t);
                            check_overflow(failNode);
                            theAssembler->sall(Tag_Size - 1, NumberOperand, dst);
                            // use one-bit shifts so overflow will be set
                            theAssembler->sall(1, NumberOperand, dst);
                            return dst;
                            
       case TModCCArithOp:  assert(dst == eax, "idiv");
                            theAssembler->movl(opn, NumberOperand, t);
                            theAssembler->idivl(t);
                            return edx;
                            /*  alternatively:
                                theAssembler->pushl(dst);
                                theAssembler->imull(t, dst);
                                theAssembler->popl(t);
                                theAssembler->subl(dst, t);
                                return t;
                            */

       case TAndCCArithOp:
       case AndCCArithOp:
       case AndArithOp:
        if (ccOnly)       {theAssembler->testl(opn, NumberOperand, dst);  return no_reg;}
        else              {theAssembler->andl( opn, NumberOperand, dst);  return dst;}
        
       case TOrCCArithOp:
       case OrCCArithOp:
       case OrArithOp:     theAssembler->orl( opn, NumberOperand, dst);  return dst;

       case TXorCCArithOp:
       case XOrArithOp:    theAssembler->xorl(opn, NumberOperand, dst);  return dst;

       case TALShiftCCArithOp:
       case TLLShiftCCArithOp:
                           opn >>= Tag_Size; // FALL THROUGH
       case ArithmeticLeftShiftArithOp:
       case LogicalLeftShiftArithOp:
                           theAssembler->sall(opn, NumberOperand, dst);  return dst; // must use arith shift for overflow checking
                           
       case ArithmeticRightShiftArithOp:
                           theAssembler->sarl(opn, NumberOperand, dst);  return dst;
                           
       case LogicalRightShiftArithOp:
                           theAssembler->shrl(opn, NumberOperand, dst);  return dst;
                                        
       case TARShiftCCArithOp: theAssembler->sarl(opn >> Tag_Size, NumberOperand, dst);
                               theAssembler->andl(~Tag_Mask, NumberOperand, dst);
                               return dst;
                               
       case TLRShiftCCArithOp: theAssembler->shrl(opn >> Tag_Size, NumberOperand, dst);
                               theAssembler->andl(~Tag_Mask, NumberOperand, dst);
                               return dst;
                               
       default:            ShouldNotReachHere(); // unexpected arith type
      }
      ShouldNotReachHere();
      return no_reg;
  }
  
  
  static Location arith_genHelper_do_reg_reg(Location dst, Location opn, ArithOpCode op, bool ccOnly, Node* failNode) {
    # define XX(op) case op: theAssembler->Untested("reg:" STR(op)); break;
    switch (op) {
      default: break;
      XX(NilArithOp) XX(AddArithOp) XX(SubArithOp) XX(MulArithOp) XX(DivArithOp) XX(AndArithOp) XX(OrArithOp)
      XX(XOrArithOp) XX(ArithmeticLeftShiftArithOp) XX(LogicalLeftShiftArithOp) XX(ArithmeticRightShiftArithOp)
      XX(LogicalRightShiftArithOp) XX(AddCCArithOp) XX(AndCCArithOp) XX(OrCCArithOp)
    }
    int foo = 0;
    # undef XX
    switch (op) {
     case AddArithOp:
     case AddCCArithOp:
     case TAddCCArithOp:      theAssembler->addl(opn, dst);            return dst;
     
     case SubArithOp:
     case SubCCArithOp:
     case TSubCCArithOp:
      if (ccOnly)          {  theAssembler->cmpl(opn, dst);            return no_reg; }
      else                 {  theAssembler->subl(opn, dst);            return dst; }
      
     case TMulCCArithOp:      theAssembler->sarl(Tag_Size, NumberOperand, opn);  // FALL THROUGH
     case MulArithOp:         theAssembler->imull(opn, dst);           return dst;
     
     case DivArithOp:      assert(dst == eax, "idiÂv");
                           theAssembler->idivl(opn);                   return dst;
     
     case TDivCCArithOp:      theAssembler->sarl(Tag_Size, NumberOperand, opn);
                              theAssembler->sarl(Tag_Size, NumberOperand, dst);
                              assert(dst == eax, "idiv");
                              theAssembler->idivl(opn);
                              check_overflow(failNode);
                              theAssembler->sall(Tag_Size - 1, NumberOperand, dst);
                              // use one-bit shifts so overflow will be set
                              theAssembler->sall(1, NumberOperand, dst);
                              return dst;
                              
     case TModCCArithOp:      assert(dst == eax, "idiv");
                              theAssembler->idivl(opn);
                              return edx;
                              /* alternatively could:
                                  theAssembler->push(dst);
                                  theAssembler->imull(opn, dst);
                                  theAssembler->popl(opn);
                                  theAssembler->subl(dst, opn);
                                  return opn;
                              */
                              
     case AndArithOp:
     case AndCCArithOp:
     case TAndCCArithOp:
       if (ccOnly)          { theAssembler->testl(opn, dst);         return no_reg; }
       else                 { theAssembler->andl(opn, dst);          return dst; }

     case OrArithOp:
     case OrCCArithOp:
     case TOrCCArithOp:       theAssembler->orl(opn, dst);           return dst;

     case TXorCCArithOp:
     case XOrArithOp:         theAssembler->xorl(opn, dst);          return dst;
     
     case TALShiftCCArithOp:
     case TLLShiftCCArithOp:  theAssembler->sarl(Tag_Size, NumberOperand, opn); // fall through
     case ArithmeticLeftShiftArithOp:
     case LogicalLeftShiftArithOp:
                              assert(opn == ecx, "checking");
                              theAssembler->sall(Assembler::shift_by_count_reg, NumberOperand, dst); 
                              return dst;
                              
                              

     case    LogicalRightShiftArithOp: 
                              assert(opn == ecx, "checking");
                              theAssembler->shrl(Assembler::shift_by_count_reg, NumberOperand, dst); 
                              return dst;
     case ArithmeticRightShiftArithOp: 
                              assert(opn == ecx, "checking");
                              theAssembler->sarl(Assembler::shift_by_count_reg, NumberOperand, dst);     
                              return dst;


     case TARShiftCCArithOp:  theAssembler->sarl(Tag_Size, NumberOperand, opn);
                              assert(opn == ecx, "checking");
                              theAssembler->sarl(Assembler::shift_by_count_reg, NumberOperand, dst);
                              theAssembler->andl(~Tag_Mask, NumberOperand, dst);
                              return dst;
     case TLRShiftCCArithOp:  theAssembler->sarl(Tag_Size, NumberOperand, opn);
                              assert(opn == ecx, "checking");
                              theAssembler->shrl(Assembler::shift_by_count_reg, NumberOperand, dst);
                              theAssembler->andl(~Tag_Mask, NumberOperand, dst);
                              return dst;
     
     default:                 ShouldNotReachHere(); // unexpected arith type
    }
    ShouldNotReachHere();
    return no_reg;
  }

  
  static Location arith_genHelper(PReg* sreg, bool srcIsInt, PReg* oper, bool operIsInt, PReg* dest,
                           ArithOpCode op, Node* failNode) {

    reverse_if_helpful(sreg, oper, op, srcIsInt, operIsInt);
    Location dst = arith_genHelper_move_src_to_reg(sreg, srcIsInt, oper, op, failNode);
    if (!srcIsInt && failNode) {
      theAssembler->testl(Tag_Mask, NumberOperand, dst);
      Label* L = new Label(theAssembler->printing);
      theAssembler->jnz(L);
      failNode->l = L->unify(failNode->l);
    }

    if (oper->isConstPReg()) { 
       oop val = ((ConstPReg*)oper)->constant;
       if (!val->is_smi()  && failNode  &&  !operIsInt) {
         theAssembler->Untested("arith_genHelper");
         theAssembler->testl(0, NumberOperand, esp); // set ne cc for fail node
         Label* L = new Label(theAssembler->printing);
         theAssembler->jmp(L);
         failNode->l = L->unify(failNode->l);
         return NoReg;
       }
       return arith_genHelper_do_immediate(dst, int32(val), op, dest->isNoPReg(), failNode);
    }
       
    Location opr = arith_genHelper_move_oper_to_reg(dst, oper, op);
    if (!operIsInt && failNode) {
        theAssembler->testl(Tag_Mask, NumberOperand, opr);
        Label* L = new Label(theAssembler->printing);
        theAssembler->jnz(L);
        failNode->l = L->unify(failNode->l);
    }
    return arith_genHelper_do_reg_reg(dst, opr, op, dest->isNoPReg(), failNode);
  }        
  

  Location arith_genHelper(PReg* sreg, PReg* oper, PReg* dest,
                           ArithOpCode op,
                           Location& t1, Location& t2, bool& reversed) {
    // used elsewhere in the compiler for ArithRRNode
    assert(op != DivArithOp,
           "would have to do markAllocated and canCopyPropagate for ArithRRNode, will use eax");
    return arith_genHelper( sreg, true /* no check */, oper, true, dest, op, NULL);
  }    
  
  
// Next two routines are placeholders in case
// any operations need Temp3, etc. -- dmu 1/03

  void TArithRRNode::markAllocated(fint* use_count, fint* def_count) {
    U_CHECK(_src); D_CHECK(_dest); U_CHECK(oper);
    // Only Div-oidal operations use Temp3 (eax)
    switch (op) {
     default: break;
     case DivArithOp:  case TDivCCArithOp:  case TModCCArithOp:
      assert(Temp3 == eax  &&  Temp4 == edx, "used by divide");
      use_count[Temp3]++; def_count[Temp3]++;       // uses Temp3
      use_count[Temp4]++; def_count[Temp4]++;       // remainder -> Temp4
      break;
    }
  }
  
      
  bool TArithRRNode::canCopyPropagateFrom(PReg* d) {
    assert(Temp3 == eax, "???");
    switch (op) {
     default:                                                    return true;
     case DivArithOp:  case TDivCCArithOp:  case TModCCArithOp:  return d->loc != Temp3  &&  d->loc != Temp4;
    }
  }

  bool TArithRRNode::isOpInlinable( ArithOpCode op ) {
    return  op != NilArithOp;
  }
  
  
  void TArithRRNode::gen() {
    // See SPrimScope::inlineIntArithmetic
    BasicNode::gen();
    if (constResult) {
      theAssembler->Untested("TArithRRNode const");
      Location b;  int32 d;  OperandType t;
      reg_disp_type_of_loc(&b, &d, &t, _dest->loc);
      theAssembler->movl((int32)constResult->constant, OopOperand, b, d, t); 
      return;
    }
    // assembler uses large number as shift by ecx, so check for static overflow here
    if (oper->isConstPReg()  &&  (uint32)(((ConstPReg*)oper)->constant) > 32)
      switch (op) {
       default:  break;
      
       case LogicalLeftShiftArithOp:    case TLLShiftCCArithOp:
       case LogicalRightShiftArithOp:   case TLRShiftCCArithOp:
        Location b;  int32 d;  OperandType t;
        reg_disp_type_of_loc(&b, &d, &t, _dest->loc);
        theAssembler->movl(0, NumberOperand, b, d, t); 
        return;

       case ArithmeticLeftShiftArithOp:   case ArithmeticRightShiftArithOp: 
       case TALShiftCCArithOp:            case TARShiftCCArithOp: 
        force_overflow(next1());
        return;
       }
    Location dest = arith_genHelper(_src, arg1IsInt, oper, arg2IsInt, _dest, op, next1());
    bool canOverflow =    
            op == TAddCCArithOp
        ||  op == TSubCCArithOp
        ||  op == TMulCCArithOp
        ||  op == TALShiftCCArithOp
        ||  op == TDivCCArithOp
        ||  op == TModCCArithOp /* if 2nd arg is 0 */;
        
    if (canOverflow)
      check_overflow(next1());

    if (dest != _dest->loc  &&  !_dest->isNoPReg()) {
      // store result on stack (success case)
      assert(dest != no_reg, "???");
      theAssembler->movl(dest, esp, spOffset(_dest->loc), NumberOperand);
    }
  }

  
  void ArithRCNode::gen() {
    BasicNode::gen();
    
    switch (op) {
    # define XX(op) case op: theAssembler->Untested("RC:" STR(op)); break;
      default: break;
      XX(NilArithOp) XX(AddArithOp) XX(MulArithOp) XX(DivArithOp) XX(OrArithOp)
      XX(XOrArithOp) XX(ArithmeticLeftShiftArithOp) XX(LogicalLeftShiftArithOp) XX(ArithmeticRightShiftArithOp)
      XX(LogicalRightShiftArithOp) XX(AddCCArithOp) XX(OrCCArithOp)
      XX(TAddCCArithOp) XX(TSubCCArithOp) XX(TMulCCArithOp) XX(TDivCCArithOp) XX(TALShiftCCArithOp) XX(TARShiftCCArithOp)
      XX(TLLShiftCCArithOp) XX(TLRShiftCCArithOp) XX(TAndCCArithOp) XX(TOrCCArithOp) XX(TXorCCArithOp)
    }
    # undef XX
    
    Location dest;
    if (_dest->isNoPReg()) 
      switch (op) {
        // If only for CC and we do not need a dumping ground, any reg will do
       case SubCCArithOp:  
        dest = genHelper->moveToReg(_src, Temp1);
        // Use NumberOperand below because this is used with arbitrary numbers, not oops; see
        //   SPrimScope::genPrimFailure -- dmu 4/07
        theAssembler->cmpl(oper, NumberOperand, dest);  return;
       case AndCCArithOp:  
        dest = genHelper->moveToReg(_src, Temp1);
        theAssembler->testl(oper, NumberOperand, dest); return;
       default: break;
      }
      
    dest = isRegister(_dest->loc) ? _dest->loc : _src->loc == Temp1 ? Temp2 : Temp1;
         if (!isRegister(_src->loc))   genHelper->moveToReg(_src,      dest);
    else if (_src->loc != dest)         theAssembler->movl( _src->loc, dest);


    switch (op) {
     case AddCCArithOp:
     case AddArithOp:   theAssembler->addl(oper, NumberOperand, dest);         break;
     // Use NumberOperand below because this is used with arbitrary numbers, not oops; see
     //   SPrimScope::genPrimFailure -- dmu 4/07
     case SubCCArithOp:
     case SubArithOp:   theAssembler->subl(oper, NumberOperand, dest);         break;
       
     case AndCCArithOp:
     case AndArithOp:   theAssembler->andl(oper, NumberOperand, dest);         break;
     case OrCCArithOp:
     case OrArithOp:    theAssembler->orl( oper, NumberOperand, dest);         break;
     case XOrArithOp:   theAssembler->xorl(oper, NumberOperand, dest);         break;
     case ArithmeticLeftShiftArithOp:
     case LogicalLeftShiftArithOp:
                        theAssembler->shll(oper, NumberOperand, dest);         break;
     case ArithmeticRightShiftArithOp:
                        theAssembler->sarl(oper, NumberOperand, dest);         break;
     case LogicalRightShiftArithOp:
                        theAssembler->shrl(oper, NumberOperand, dest);         break;

     default:           ShouldNotReachHere(); // unexpected arith type
    }
    if (dest != _dest->loc) {
      theAssembler->movl(dest, esp, spOffset(_dest->loc), NumberOperand);
    }
  }


  void BranchNode::gen() {
    BasicNode::gen();

    Label* l_ = new Label(theAssembler->printing);
    switch (op) {
     case ALBranchOp:   theAssembler->jmp(l_);   break;
     case EQBranchOp:   theAssembler->je( l_);   break;
     case NEBranchOp:   theAssembler->jne(l_);   break;
     case LTBranchOp:   theAssembler->jl( l_);   break;
     case LEBranchOp:   theAssembler->jle(l_);   break;
     case LTUBranchOp:  theAssembler->jb( l_);   break;
     case LEUBranchOp:  theAssembler->jbe(l_);   break;
     case GTBranchOp:   theAssembler->jg( l_);   break;
     case GEBranchOp:   theAssembler->jge(l_);   break;
     case GTUBranchOp:  theAssembler->ja( l_);   break;
     case GEUBranchOp:  theAssembler->jae(l_);   break;
     case VSBranchOp:   theAssembler->jo( l_);   break;
     case VCBranchOp:   theAssembler->jno(l_);   break;
     default:           ShouldNotReachHere(); // unexpected branch type
    }
    Node* n = next1();
    n->l = l_->unify(n->l);
  }


  void TBranchNode::genCompare(bool haveImmediate,
                               Location rcvrReg, Location argReg) {
    Location rb;  int32 rd;  OperandType rt;
    Location ab;  int32 ad;  OperandType at;
    reg_disp_type_of_loc(&rb, &rd, &rt, rcvrReg);
    if (!haveImmediate)
      reg_disp_type_of_loc(&ab, &ad, &at, argReg);
    if (!intRcvr) {
      // check that rcvr is a smiOop
      theAssembler->testl(Tag_Mask, NumberOperand, rb, rd, rt);
      Label*& primFailure = ((MergeNode*)nexti(2))->l;
      Label* l = new Label(theAssembler->printing);
      theAssembler->jnz(l); // will not fail, will fall through fwd, so normal
      primFailure = primFailure->unify(l);
    }
    if (!intArg) {
      assert(!haveImmediate, "???");
      // check that arg is a smiOop
      theAssembler->testl(Tag_Mask, NumberOperand, ab, ad, at);
      Label*& primFailure = ((MergeNode*)nexti(2))->l;
      Label* l = new Label(theAssembler->printing);
      theAssembler->jnz(l); // will not fail, will fall through fwd, so normal
      primFailure = primFailure->unify(l);
    }

    // we're here iff arg and rcvr are smiOop's.  do the actual comparision
    if (haveImmediate) {
      oop val = ((ConstPReg*)arg)->constant;
      theAssembler->cmpl((int32)val, NumberOperand, rb, rd, rt);
    }
    else if (isRegister(rcvrReg)) {
      theAssembler->cmpl(ab, ad, at, rcvrReg);
    }
    else if (isRegister(argReg)) {
      theAssembler->Untested("genCompare");
      theAssembler->cmpl(argReg, rb, rd, rt);
    }
    else {
      theAssembler->Untested("genCompare");
      theAssembler->movl(rb, rd, rt, Temp1);
      theAssembler->cmpl(ab, ad, at, Temp1);
    }
  }


  void TBranchNode::testTagsIfNecessary(bool haveImmediate, Location rcvrReg, Location argReg) {
    // this function doesn't do anything on PPC.  it's needed because on the SPARC,
    // if there's an overflow, we need to check the tag bits to see if the overflow
    // is caused by non-smi arguments, or by an actual integer overflow.
    // but on PPC, we always check the object tags in the beginning, so if an overflow
    // occurs, it's a "real" integer overflow. -mabdelmalek 12/02
  }


  void TypeTestNode::br_if_smi(Assembler* a, Location rcvr, fint smiIndex) {
    Location b;  int32 d;  OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, rcvr);
    theAssembler->testl(Tag_Mask, NumberOperand, b, d, t);
    Label* label1 = new Label(theAssembler->printing);
    theAssembler->jz(label1);
    define(smiIndex, label1);
  }

  void TypeTestNode::br_if_float(Assembler* a, Location rcvr, fint floatIndex) {
    Location b;  int32 d;  OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, rcvr);
    theAssembler->btl( Float_Tag_bit_i386, b, d, t);
    Label* label2 = new Label(theAssembler->printing);
    theAssembler->jc(label2);
    define(floatIndex, label2);
  }
  
  void TypeTestNode::br_to_unknown_case(Assembler* a) {
    Label* unknownCase = new Label(theAssembler->printing);
    theAssembler->jmp(unknownCase);
    define(0, unknownCase);
  }

  // Returns index of case to jump to, or 0 if none chosen.
  // Also returns loadMapAfterHandlingImmediates, label where caller gens code to load map
  // -- dmu 10/03

  fint TypeTestNode::prologue(Assembler* a, Location rcvr, fint smiIndex,
                              fint floatIndex, bool immediateOnly,
                              Label*& loadMapAfterHandlingImmediates) {
    // handle immediate cases of type test and load map if necessary
    // smiIndex/Float are the indices of the smi/float case in the map list
    // (+ 1, so that "not present" == 0)
    // returns the index (+ 1) of the fall-through case 
    assert(((Float_Tag | Int_Tag) & Mem_Tag) == 0, "tagging scheme changed");
    assert(!immediateOnly || !needMapLoad,
           "immediateOnly implies !needMapLoad");
           
    if (!needMapLoad) {
      // no map load needed; no mem maps to test, rcvr could be memOop at this point
      if (  smiIndex)  br_if_smi  (a, rcvr,   smiIndex);
      if (floatIndex)  br_if_float(a, rcvr, floatIndex);
      return 0; // will be no more testing, so can fall-through to unknown
    }
     
    Location b; int32 d; OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, rcvr);
    theAssembler->btl(Mem_Tag_bit_i386, b, d, t);
    loadMapAfterHandlingImmediates = new Label(theAssembler->printing);
    theAssembler->jc(loadMapAfterHandlingImmediates); // fewer selectors have int cases, so probably goes
      
    if (smiIndex  &&  floatIndex) {
      br_if_smi(a, rcvr, smiIndex);
      return floatIndex;
    }
    if (  smiIndex)   br_if_smi  (a, rcvr,   smiIndex);
    if (floatIndex)   br_if_float(a, rcvr, floatIndex);
    br_to_unknown_case(a); // fall-through would fall into mem testing, since n == 0 does not gen branch
    return 0;
  }
  
  
  void TypeTestNode::testMap(ConstPReg* pr, fint index) {
    assert(pr->constant->is_map(), "should be map");
    assert(needMapLoad, "need to load receiver map");
    // if the receiver was moved to MapReg in TypeTestNode (this would
    // happen if it wasn't already in a register), then the following
    // instruction might clober the receiver (if "pr" wasn't already
    // in a register).  but this is ok since we don't need the receiver
    // any more. -mabdelmalek 10/02.
    theAssembler->cmpl((int32)pr->constant, OopOperand, RcvrMapReg);  // compare
    Label* match = new Label(theAssembler->printing);
    theAssembler->je(match);                 // branch if match
    define(index, match);
  }
  
  void TypeTestNode::testOop(ConstPReg* pr, fint index) {
    assert(!pr->constant->is_map(), "should be oop");
    Location b; int32 d; OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, r);
    theAssembler->cmpl((int32)pr->constant, OopOperand, b, d, t);
    Label* match = new Label(theAssembler->printing);
    theAssembler->je(match);                // branch if match
    define(index, match);
  }


  // Shoould be refactored someday ala PICs. -- dmu 2/03
  void TypeTestNode::gen() {
    // generates n-way type test; fall-through code is "unknown" case

    BasicNode::gen();
    r = genHelper->moveToReg(_src, MapReg);
    

    // indexes if smi or float branches if present. Branch index is one more than maps index -- dmu
    // NOTE: index 0 is the no match brach target
    fint   smiIndex = 0;
    fint floatIndex = 0;
         if (maps->nth(0) == Memory->  smi_map->enclosing_mapOop())   smiIndex = 1;
    else if (maps->nth(0) == Memory->float_map->enclosing_mapOop()) floatIndex = 1;
    if (maps->length() > 1) {
           if (maps->nth(1) == Memory->  smi_map->enclosing_mapOop())   smiIndex = 2;
      else if (maps->nth(1) == Memory->float_map->enclosing_mapOop()) floatIndex = 2;
    }


    fint nconstants = 0;
    fint ntests = maps->length();
    fint firstMem = max(smiIndex, floatIndex);
    bool immediateOnly = firstMem == maps->length();

    for (fint i = firstMem; i < ntests; ++i) {
      ConstPReg* pr = mapPRs->nth(i);
      if (!pr->constant->is_map()) ++nconstants;
    }

    // first test against all constants
    if (!hasUnknown  &&  nconstants == ntests) {
      // don't need to check for last constant
      --ntests;
    }
    for (fint i = firstMem;  i < ntests;  ++i) {
      ConstPReg* pr = mapPRs->nth(i);
      if (!pr->constant->is_map())   testOop(pr, i + 1);
    }
    if (!hasUnknown && nconstants >= ntests) {
      // last case; should omit branch
      Label* match = new Label(theAssembler->printing);
      theAssembler->jmp(match);
      define(ntests + 1, match);
      return;           // done -- tested all constants
    }

    Label* loadMapAfterHandlingImmediates = NULL;
    fint n = prologue(theAssembler, r, smiIndex, floatIndex, immediateOnly, loadMapAfterHandlingImmediates);

    if (n) {
      Label* match = new Label(theAssembler->printing);
      theAssembler->jmp(match);
      define(n, match);
    }

    if (!loadMapAfterHandlingImmediates)
      ;
    else if (immediateOnly)
      define(0, loadMapAfterHandlingImmediates);     // no memOop tests
    else
      loadMapAfterHandlingImmediates->define();

    if (!hasUnknown) --ntests;      // all maps known, can omit last test
    // test against all maps
    if (needMapLoad) {
      // load receiver map
      theAssembler->movl(r, map_offset(), NumberOperand, RcvrMapReg);
    }
    for (fint i = firstMem; i < ntests; i++) {
      ConstPReg* pr = mapPRs->nth(i);
      if (pr->constant->is_map()) testMap(pr, i + 1);
    }
    if (!hasUnknown) {
      // last case; should omit branch
      theAssembler->Untested("TypeTestNode::gen");
      Label* match = new Label(theAssembler->printing);
      theAssembler->jmp(match);
      define(ntests + 1, match);
    }
  }

  
  void IndexedBranchNode::gen() {
    // generates n-way indexed branch;
    // fall-through code is non-int or out of bounds
    BasicNode::gen();
    r = genHelper->moveToReg(_src, IndexReg);

    // check tag
    Label end;
    if (!srcMustBeSmi) {
      theAssembler->testl(Tag_Mask, NumberOperand, r);
      theAssembler->jnz(&end);
    }

    // check bounds
    theAssembler->cmpl((int32)as_smiOop(nCases), OopOperand, r);
    theAssembler->jnb(&end); // goto end if index is out of bounds
  
    Label L(theAssembler->printing);
    theAssembler->call(&L); // get pc of next inst into link
    
    pc_t link_reg_value= theAssembler->addr();
    L.define();

    const int32 indexShift = 2 - Tag_Size;
    assert(indexShift == 0, "no shift needed");
    
    Location t = r == Temp1 ? Temp2 : Temp1;

    theAssembler->popl(t);
    const int32 bytes_from_link_value_to_jumps = 7;
    // indexing is by_two because index is ALREADY 4x value because of tagging
    theAssembler->leal(t,  bytes_from_link_value_to_jumps, NumberOperand, r, Assembler::by_two, t);

    theAssembler->jmp(t);

    pc_t start_of_jumps= theAssembler->addr();
    assert( bytes_from_link_value_to_jumps == start_of_jumps - link_reg_value, "recount");


    for (fint i = 0;  i < nCases;  ++i) {
      Label* nthCase = new Label(theAssembler->printing);
      theAssembler->jmp(nthCase); theAssembler->hlt(); theAssembler->hlt(); theAssembler->hlt();
      Node* n = nexti(i + 1);
      n->l = nthCase->unify(n->l);
    }
    end.define();
  }


  void BlockZapNode::gen() {
    BasicNode::gen();
    Location t = genHelper->moveToReg(block(), Temp1);
    theAssembler->movl(0, NumberOperand, t, scope_offset(), NumberOperand);
  }


  void AbstractArrayAtNode::markAllocated(fint* use_count, fint* def_count) {
    U_CHECK(_src); D_CHECK(_dest); U_CHECK(arg);
    if (error) D_CHECK(error);
  }
  
    
  bool AbstractArrayAtNode::canCopyPropagateFrom(PReg* d) {
    // covers AbstractArrayAtPut and both ats
    return true;
  }


  void AbstractArrayAtNode::gen() {
    BasicNode::gen();
    Assembler* a = theAssembler;
    Label* argFail = NULL;          // if arg isn't a smi
    Label* indexFail = new Label(a->printing);  // if arg is out of bounds
    Location arr = genHelper->moveToReg(_src, Temp2);
    Location index = genHelper->moveToReg(arg, Temp1);
    if (!intArg) {
      // CP may have propagated a constant into arg
      intArg = arg->isConstPReg() && ((ConstPReg*)arg)->constant->is_smi();
    }
    if (!intArg) {
      // test arg for smiOop
      a->testl(Tag_Mask, NumberOperand, index);
      Label* failLabel = new Label(a->printing);
      a->jnz(failLabel);
      argFail = argFail->unify(failLabel);
    }
    argFail = argFail->unify(testArg2());
    a->cmpl(arr, sizeOffset, NumberOperand, index);
    a->jae(indexFail); // likely to fall through
    Location res = isRegister(_dest->loc) ? _dest->loc : Temp1;   
    bool needDestStore = genAccess(arr, index, res);
    if (needDestStore && !isRegister(_dest->loc) && !_dest->isNoPReg())
      genHelper->moveRegToLoc(res, _dest->loc);

    Label* done = new Label(a->printing);
    a->jmp(done);
    MergeNode* failMerge = (MergeNode*)next1();

    Location eb; int32 ed; OperandType et;
    if (error)  reg_disp_type_of_loc(&eb, &ed, &et, error->loc);
    if (argFail) {
      argFail->define();
      if (error) {
        a->movl((int32)VMString[BADTYPEERROR], OopOperand, eb, ed, et);
      }
      if (failMerge) { // test added by dmu 4/27/96
        Label* L = new Label(a->printing);
        a->jmp(L);
        failMerge->l = failMerge->l->unify(L);
      }
    }
    indexFail->define();
    if (error) {
      a->movl((int32)VMString[BADINDEXERROR], OopOperand, eb, ed, et);
    }
    if (failMerge) { // test added by dmu 4/27/96
      Label* L = new Label(a->printing);
      a->jmp(L);
      failMerge->l = failMerge->l->unify(L);
    }
    done->define();
  }

  // gen array access; Temp1 may hold index, Temp2
  // may hold array
  bool ArrayAtNode::genAccess(Location arr, Location index, Location dest) {
    theAssembler->movl(arr, dataOffset, NumberOperand, index, Assembler::by_one, dest);
    return true;
  }

  bool ByteArrayAtNode::genAccess(Location arr, Location index, Location dest) {
    assert(index != Temp2, "???");
    theAssembler->movl(arr, dataOffset, NumberOperand, Temp2);
    if (index != Temp1) {
      theAssembler->Untested("ByteArrayAtNode::genAccess");
      theAssembler->movl(index, Temp1);
    }
    theAssembler->sarl(Tag_Size, NumberOperand, Temp1);
    theAssembler->movzbl(Temp1, 0, NumberOperand, Temp2, Assembler::by_one,  dest);
    theAssembler->shll(Tag_Size, NumberOperand, dest);
    return true;
  }

  bool ArrayAtPutNode::genAccess(Location arr, Location index, Location /*dest*/) {
    // ignore dest and handle result assignment here (saves one instruction)
    if (_dest != _src  && !_dest->isNoPReg()) 
      genHelper->moveRegToLoc(arr, _dest->loc);
    
    if (elem->isConstPReg()  &&  ((ConstPReg*)elem)->constant->is_old()) {
      theAssembler->movl((int32)((ConstPReg*)elem)->constant, OopOperand, arr, dataOffset, NumberOperand, index, Assembler::by_one);
    }
    else {
      assert(elem->loc != Temp1, "???");
      theAssembler->leal(arr, dataOffset, NumberOperand, index, Assembler::by_one, Temp1);
      if (elem->isConstPReg())
        theAssembler->movl((int32)((ConstPReg*)elem)->constant, OopOperand, Temp1, 0, NumberOperand);
      else
        theAssembler->movl( genHelper->moveToReg(elem, Temp2), Temp1, 0, NumberOperand);

      theAssembler->shrl(card_shift, NumberOperand, Temp1);
      if (!UseByteMapBaseReg) {
        theAssembler->addl(no_reg, (int32)&byte_map_base, VMAddressOperand, Temp1);
        theAssembler->movb(0, Temp1, 0, NumberOperand);
      }
      else {
        theAssembler->movb(0, ByteMapBaseReg, 0, NumberOperand, Temp1, Assembler::by_one);
      }
    }
    return false;
  }


  Label* ByteArrayAtPutNode::testArg2() {
    // check if arg is 0..255
    if (elem->isConstPReg()) {
      if (((ConstPReg*)elem)->constant->is_smi()) {
        theAssembler->Untested("ByteArrayAtPutNode::testArg2");
        // no run-time check required
        return NULL;
      }
      theAssembler->Untested("ByteArrayAtPutNode::testArg2");
      // primitive will always fail
      Label* L = new Label(theAssembler->printing);
      theAssembler->jmp(L);
      return L;
    } 

    Location b;  int32 d;  OperandType t;
    reg_disp_type_of_loc(&b, &d, &t, elem->loc);
    Label* fail = new Label(theAssembler->printing);
    theAssembler->testl(~(0xff << Tag_Size), NumberOperand, b, d, t);
    theAssembler->jnz(fail);
    return fail;
  }
  
  
  bool ByteArrayAtPutNode::genAccess(Location arr,
                                     Location index, Location /*dest*/) {
    // ignore dest and handle result assignment here (saves one instruction)
    if (_dest != _src && !_dest->isNoPReg())
      genHelper->moveRegToLoc(arr, _dest->loc);

    assert(arr != Temp1, "???");
    if (index != Temp1)  theAssembler->movl(index, Temp1);
    theAssembler->sarl(Tag_Size, NumberOperand, Temp1);
    theAssembler->addl(arr, dataOffset, NumberOperand, Temp1);
    
    if (elem->isConstPReg()) {
      // storing a constant - may be non-smi, but then this code will never
      // be executed anyway because the primitive fails
      ConstPReg* value = (ConstPReg*)elem;
      assert(value->constant->is_smi(), "what to do?");
      theAssembler->Untested("ByteArrayAtPutNode::genAccess");
      theAssembler->movb(smiOop(value->constant)->value(), Temp1, 0, NumberOperand); // store in byte array
    }
    else {
      genHelper->moveToExactlyThisReg(elem, Temp2);
      theAssembler->shrl(Tag_Size, NumberOperand, Temp2);  // convert to char
      theAssembler->movb(Temp2, Temp1, 0, NumberOperand); // store in byte array
    }
    return false;           // result already handled here
  }


  void FlushNode::flushRegister(PReg* pr) {
    // a nop on I386, since args always passed in memory
  }


  void DeadBlockNode::gen() {
    BasicNode::gen();
    genPcDesc();
    theAssembler->Comment("dead block code");
    Label next(theAssembler->printing);
    theAssembler->call(&next); // prim needs some PC in this method
    next.define();
    theAssembler->popl(Temp1);
    theAssembler->movl(Temp1, esp, rcvr_offset*oopSize, NumberOperand);
    PrimNode::gen();
  }
  
  void DeadEndNode::gen() {
    // this node is unreachable - generate a trap for debugging
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      BasicNode::gen();
      theAssembler->hlt();
    }
#   endif
  }


   void UncommonNode::gen() {
     BasicNode::gen();
     genPcDesc();
     theAssembler->unimp(0, restartSend);
  }

# endif  // sic
# endif // TARGET_ARCH == I386_ARCH
