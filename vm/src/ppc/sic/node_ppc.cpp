# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.21 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "node_ppc.hh"

# include "_node_ppc.cpp.incl"

# if defined(SIC_COMPILER)

  void BasicNode::genBranch() {
    Label* l2 = new Label(theAssembler->printing);
    theAssembler->b(*l2, NumberOperand);
    l = l->unify(l2);
  }

  void BasicNode::resetSP() {
    theAssembler->la(SP, thisFrameSize * oopSize, NumberOperand, SP);
  }

  void BasicNode::restoreNonVolatileRegisters() {
    theAssembler->lmw( Location(32 - theSIC->number_of_saved_nonvolatile_registers()), 
                       -oopSize * theSIC->number_of_saved_nonvolatile_registers(),
                       NumberOperand, SP);
  }

  void BasicNode::doReturn(fint offset) {
    theAssembler->lwz(Temp1, saved_pc_offset * oopSize, NumberOperand, SP);
    if (offset)
      theAssembler->addi(Temp1, Temp1, offset, NumberOperand);
    theAssembler->mtlr(Temp1);
  }

  void BasicNode::restoreFrameAndReturn(bool haveStackFrame, fint offset) {
    if (haveStackFrame) {
      resetSP();
      restoreNonVolatileRegisters();
      doReturn(offset);
    }
    else if (offset != 0) {
      theAssembler->mflr(Temp1);
      theAssembler->addi(Temp1, Temp1, offset, NumberOperand);
      theAssembler->mtlr(Temp1);
    }
    else {
      // do nothing here; balwlr below is enough
    }
    theAssembler->balwlr();
  }

  void PrologueNode::saveReturnPC() {
    theAssembler->mflr(R0);
    theAssembler->stw(R0, saved_pc_offset * oopSize, NumberOperand, SP);
  }

  void PrologueNode::saveNonVolatileRegisters() {
    theAssembler->stmw( Location(32 - theSIC->number_of_saved_nonvolatile_registers()),
                           -oopSize * theSIC->number_of_saved_nonvolatile_registers(), 
                        NumberOperand,
                        SP);
  }

  void PrologueNode::copyIncomingRegisterArgsToNonVolatileRegisters() {
    theAssembler->Comment("flush incoming args to non-vol regs");
    int32 r = LReceiverReg;
    int32 num_reg_args_and_rcvr = theSIC->numberOfIncomingArgsAndRcvrInRegisters();
    for (int32 i = 0; i < num_reg_args_and_rcvr; ++i, ++r)
      theAssembler->mr(Location( IReceiverReg - (r - LReceiverReg)), Location(r));
  }

  void PrologueNode::saveIncomingRegisterArgsOnStackIfNecessary() {
    // Save args on stack in case they are uplevel-accessed by a block
    // (since they cannot be changed this is just a copy).
    // A faster approach would be to only save the args that are actually
    // uplevel-accessed.  The SIC has the infrastructure in place to already do this.
    // See the comment in FlushNode::gen below to see why this adds complications
    // to the stack frame traversal during GC.
    // So, we stick with the simple approach: flush all incoming arguments to the
    // stack if we have any subblocks. -mabdelmalek 11/02
    if (theSIC->are_register_arguments_saved_on_stack()) {
      int32 num_reg_args_and_rcvr = theSIC->numberOfIncomingArgsAndRcvrInRegisters();
      theAssembler->Comment("save incoming register args on stack if necessary");
      theAssembler->la(Temp1, rcvr_and_argument_offset(0) * oopSize, NumberOperand, SP);
      theAssembler->stswi(LReceiverReg, Temp1, num_reg_args_and_rcvr * oopSize);
    }
  }

  void PrologueNode::actuallyCreateStackFrame() {
    theAssembler->stwu(SP, thisFrameSize * -oopSize, NumberOperand, SP);
    theSIC->_frameCreationOffset = theAssembler->offset();
  }

  void PrologueNode::clearStackLocations() {
    theAssembler->Comment("clear stack locations");
    if (theSIC->number_of_memory_locals() == 0)
      return;
    theAssembler->li(R0, 0, NumberOperand);
    for (int32 i = 0; i < theSIC->number_of_memory_locals(); ++i) {
      fint offset = stackLocation_offset(i, theSIC->max_no_of_outgoing_args_and_rcvr());
      theAssembler->stw(R0, oopSize * offset, NumberOperand, SP);
    }
  }

  void PrologueNode::createStackFrame() {
    assert(haveStackFrame(), "shouldn't be creating a stack frame");

    thisFrameSize = theSIC->frameSize();

    saveReturnPC();
    saveNonVolatileRegisters();
    copyIncomingRegisterArgsToNonVolatileRegisters();
    saveIncomingRegisterArgsOnStackIfNecessary();
    actuallyCreateStackFrame();
    clearStackLocations();
  }

  void PrologueNode::prePrologue() { }

  void PrologueNode::postPrologue() { }

  void LoadIntNode::gen() {
    BasicNode::gen();
    if (isRegister(_dest->loc)) {
      theAssembler->load_immediate(_dest->loc, (int32)value, NumberOperand);
    }
    else {
      theAssembler->load_immediate(Temp2, (int32)value, NumberOperand);
      theAssembler->stw(Temp2, spOffset(_dest->loc), NumberOperand, SP);
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
      assert(b != t, "must be different");
      t = genHelper->loadImmediateOop(value, t, false);
      theAssembler->stw(t, offset, NumberOperand, b);
    } else  {
      if (isRegister(_src->loc)) {
        theAssembler->stw(_src->loc, offset, NumberOperand, b);
      } else {
        theAssembler->lwz(t, spOffset(_src->loc), NumberOperand, SP);
        theAssembler->stw(t, offset, NumberOperand, b);
      }
    }
    if (needCheckStore) {
      theAssembler->Comment("record store");
      // do a check-store
      assert(isRegister(b), "base reg of check_store must be in a register");

      if (offset > card_size || !AllowOffsetCheckStores) {
        // use slow check-store sequence
        // (marked card may be off by one, but not more)
        theAssembler->addi(Temp1, b, offset, NumberOperand);
        b = Temp1;
      }

      theAssembler->srwi(Temp1, b, card_shift);  // shift target addr
      theAssembler->li(R0, 0, NumberOperand);

      if (!UseByteMapBaseReg) {
        theAssembler->load_from_address(Temp2, &byte_map_base, VMAddressOperand, Temp2);
        theAssembler->stbx(R0, Temp1, Temp2);
      }
      else {
        theAssembler->stbx(R0, Temp1, ByteMapBaseReg);  // set byte in map
      }
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
      oop c = value->constant;
      genHelper->loadImmediateOop(c, Temp1);
      theAssembler->stw(Temp1, spOffset(_dest->loc), NumberOperand, SP);
    }
  }
  
  void CallNode::nlrCode() {
    if (nlrPoint()) {
      // branch to NLR code
      Label* l_ = new Label(theAssembler->printing);
      theAssembler->b(*l_, NumberOperand);
      nlrPoint()->l = l_->unify(nlrPoint()->l);
    } else {
      if (!theSIC->nlrLabel)
        theSIC->nlrLabel = new Label(theAssembler->printing);
      theAssembler->b(*theSIC->nlrLabel, NumberOperand);
    }
  }

  void SendNode::gen() {
    BasicNode::gen();
    assert(bci() != IllegalBCI, "should have legal bci");
    genPcDesc();
    genBreakpointBeforeCall();
    // WARNING: following code sequence is known to get_target_of_Self_call_site() & set_target_of_Self_call_site()
    theAssembler->branch_to(Memory->code->trapdoors->SendMessage_stub_td(R0),
                            BPVMAddressOperand, R0, true);
    offset = theAssembler->offset();
    Label past_send_desc(theAssembler->printing);
    theAssembler->b(past_send_desc, NumberOperand);
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
    if (theSIC->nlrLabel && !theSIC->nlrLabel->isDefined()) {
      theSIC->nlrLabel->define();
      restoreFrameAndReturn(true, sendDesc::non_local_return_offset);
    }
    past_send_desc.define();
  }
  

  void reload_ByteMapBaseReg(PrimDesc* pd) {
    if (UseByteMapBaseReg && pd->canScavenge()) {
      // any prim that can scavenge, may expand heap,so need to reload this reg
     theAssembler->load_from_address(ByteMapBaseReg, &byte_map_base, VMAddressOperand, ByteMapBaseReg);
    }
  }


    // may need to call theSIC->allocateArgs in PrimNode::PrimNode, much like BlockCloneNode
  void PrimNode::gen() {
    BasicNode::gen();
    assert(bci() != IllegalBCI, "should have legal bci");
    if (pd->canWalkStack()) genPcDesc();

    if (!pd->canScavenge()) {
      genHelper->jumpTo(first_inst_addr(pd->fn()), Temp1, LinkRegister); // do the call
    }
    else {
      // must save nonvols on way to C to enable stack walking for OOPS
      theAssembler->li(SaveSelfNonVolRegs_arg_count_register, argc + 1, NumberOperand);
      theAssembler->load_immediate( R0,
                                    (int32) Memory->code->trapdoors->SaveSelfNonVolRegs_td(R0),
                                    VMAddressOperand );
      // WARNING: this code sequence is known by get_target_of_Self_call_site(inst_t* instp)
      theAssembler->load_immediate(SaveSelfNonVolRegs_entry_point_register, (int32) first_inst_addr(pd->fn()), PVMAddressOperand);
      theAssembler->mtctr(R0);
      theAssembler->balwctrl();
    }

    // skip over inline cache:
    Label past_nlr(theAssembler->printing); 
    theAssembler->b(past_nlr, NumberOperand);  // skip over mask and nlr code

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


  Location get_SPLimit() {
    if (UseSPLimitReg)
      return SPLimitReg;
    else {
      theAssembler->load_from_address(Temp1, &SPLimit, VMAddressOperand, Temp1);
      return Temp1;
    }
  }

  void InterruptCheckNode::gen() {
    BasicNode::gen();
    genPcDesc();
    theAssembler->Comment("stack overflow/interrupt check");
    theAssembler->cmplw(SP, get_SPLimit());  // test for stack overflow
    Label l_(theAssembler->printing);
    theAssembler->bge(l_, predict_weird);    // no overflow, fwd will branch
    PrimNode::gen();
    l_.define();
  }

  void RestartNode::gen() {
    genPcDesc();
    theAssembler->Comment("stack overflow/interrupt check");
    theAssembler->cmplw(SP, get_SPLimit());  // test for stack overflow
    Label* dest = new Label(theAssembler->printing);
    theAssembler->bge(*dest);
    loopStart->l = loopStart->l->unify(dest);
    PrimNode::gen();
    theAssembler->b(*loopStart->l, NumberOperand);
  }

  void BlockCloneNode::genCall() {
    theAssembler->Comment("block clone");
    Location dest = block()->loc;
    genHelper->loadImmediateOop(block()->block, CReceiverReg); // load block Oop
    theAssembler->mr(Arg1, SP);                       // load home frame
    theAssembler->branch_to( first_inst_addr(blockClone->fn()), PVMAddressOperand, Temp1, true);
    assert(!blockClone->canScavenge() && !blockClone->needsNLRCode(),
           "need to rewrite this");
    genHelper->moveRegToLoc(ResultReg, dest);
    if (CheckAssertions && block()->uplevelR && isRegister(dest)) {
      // flush to stack
      fatal1("because i'm not handling register-flushing on PPC, need this register "
             "to be stack-allocated: %d\n"
             "(SIC should not have allocated this to a register since it is up-level accessed)",
             dest);
      // theAssembler->stw(dest, spOffset(dest), NumberOperand, SP);
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
      theAssembler->cmplw(t, t2);
      Label done;
      theAssembler->bne(done, predict_weird); // optimize fast case, so predict-weird
      genCall();
      done.define();
    } else {
      // block has already been created (by initial BlockClone node)
    }
  }
  
  void NonLocalReturnNode::gen() {
    BasicNode::gen();
    restoreFrameAndReturn(true, sendDesc::non_local_return_offset);
  }


  void MethodReturnNode::gen() {
    BasicNode::gen();

    // move result to resultReg
    Location res = genHelper->moveToReg(_src, Temp1);
    theAssembler->mr(ResultReg, res);

    restoreFrameAndReturn(haveStackFrame, 0);
  }
  

  Location arith_genHelper(PReg* sreg, PReg* oper, PReg* dest,
                           ArithOpCode op,
                           Location& t1, Location& t2, bool& reversed) {
    bool haveImmediate = false;
    reversed = false;
    oop immediate;
    bool immedIsSigned = 
          op == AddArithOp  ||  op == AddCCArithOp  ||  op == TAddCCArithOp
      ||  op == SubArithOp  ||  op == SubCCArithOp  ||  op == TSubCCArithOp
      ||  op == MulArithOp  ||  op == TMulCCArithOp
      ||  op == DivArithOp  ||  op == TDivCCArithOp
      ||  op == TModCCArithOp;
    if (sreg->isConstPReg()) {
      oop val = ((ConstPReg*)sreg)->constant;
      if (val->is_smi()
      && (immedIsSigned ? fits_within_si(int32(val)) : fits_within_ui(int32(val)))) {
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
          // commutative operator, no problem
          sreg = oper; immediate = val; haveImmediate = reversed = true;
          break;
          
          // would need to reverse non-const operand/operation for subtract,
          // so no savings
         case SubArithOp:
         case SubCCArithOp:             
         case TSubCCArithOp:
          break;
          //  PPC lacks immed/ovfl, so cannot check for ovfl with immed
         case TAddCCArithOp:
         case TMulCCArithOp:
         case TDivCCArithOp:
         case TModCCArithOp:
          break;

           // not commutative
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
    }
    else if (oper->isConstPReg()) {
      switch (op) {
        // no overflow-immedates
        case TAddCCArithOp:
        case TSubCCArithOp:
        case TMulCCArithOp:
        case TDivCCArithOp:
        case TModCCArithOp:
          break;
        default:
         oop val = ((ConstPReg*)oper)->constant;
         if (val->is_smi()
         && (immedIsSigned ? fits_within_si(int32(val)) : fits_within_ui(int32(val)))) {
           immediate = val; haveImmediate = true; 
         }
      }
    }
    
    Location src = genHelper->moveToReg(sreg, Temp1);
    Location dst = isRegister(dest->loc) ? dest->loc : Temp3;
  
    if (haveImmediate) {
      t1 = src; t2 = R0;
      int opn = (int)immediate; // for better switch formatting
      switch (op) {
       case AddArithOp:    theAssembler->addi  (dst, src, opn, NumberOperand); break;
       case SubArithOp:    theAssembler->subi  (dst, src, opn, NumberOperand); break;
       case AndArithOp:    fatal("no and-immediate that does NOT sets CC on PPC"); break;
       case OrArithOp:     theAssembler->ori   (dst, src, opn, NumberOperand); break;
       case XOrArithOp:    theAssembler->xori  (dst, src, opn, NumberOperand); break;
       case ArithmeticLeftShiftArithOp:
       case LogicalLeftShiftArithOp:
                           theAssembler->slwi  (dst, src, opn);                break;
       case ArithmeticRightShiftArithOp:
                           theAssembler->srawi (dst, src, opn);                break;
       case LogicalRightShiftArithOp:
                           theAssembler->srwi  (dst, src, opn);                break;
       // Don't have to worry about memOops, cause this platform only does ints as immediates -- dmu 4/07
       case SubCCArithOp:  opn = -opn; // use addic_ with negative operand
       case AddCCArithOp:  theAssembler->addic_(dst, src, opn, NumberOperand); break;
       case AndCCArithOp:  theAssembler->andi_ (dst, src, opn, NumberOperand); break;
       case OrCCArithOp:   fatal("no OR-immediate that sets CC on PPC");       break;
       
       case TAndCCArithOp: theAssembler->andi_(dst, src, opn, NumberOperand); break;
       case TOrCCArithOp:  theAssembler->ori  (dst, src, opn, NumberOperand); break;
       case TXorCCArithOp: theAssembler->xori (dst, src, opn, NumberOperand); break;

       case TALShiftCCArithOp:
       case TLLShiftCCArithOp: theAssembler->slwi (dst, src, opn >> Tag_Size);
                               break;
       
       case TARShiftCCArithOp: theAssembler->srawi(dst, src, opn >> Tag_Size); 
                               theAssembler->clrrwi_(dst, dst, Tag_Size);
                               break;
                               
       case TLRShiftCCArithOp: theAssembler->srwi (dst, src, opn >> Tag_Size); 
                               theAssembler->clrrwi_(dst, dst, Tag_Size);
                               break;

       default:            ShouldNotReachHere(); // unexpected arith type
      }
    } else {
      Location src2 = genHelper->moveToReg(oper, Temp2);
      t1 = src; t2 = src2;
      switch (op) {
       case AddArithOp:         theAssembler->add (dst, src, src2);            break;
       case SubArithOp:         theAssembler->sub (dst, src, src2);            break;
       case AndArithOp:         theAssembler->And (dst, src, src2);            break;
       case OrArithOp:          theAssembler->Or  (dst, src, src2);            break;
       case XOrArithOp:         theAssembler->Xor (dst, src, src2);            break;
       case ArithmeticLeftShiftArithOp:
       case LogicalLeftShiftArithOp:
                                theAssembler->slw (dst, src, src2);            break;
       case ArithmeticRightShiftArithOp:
                                theAssembler->sraw(dst, src, src2);            break;
       case LogicalRightShiftArithOp:
                                theAssembler->srw (dst, src, src2);            break;

       case AddCCArithOp:       theAssembler->add_(dst, src, src2);            break;
       case SubCCArithOp:       theAssembler->sub_(dst, src, src2);            break;
       case AndCCArithOp:       theAssembler->And_(dst, src, src2);            break;
       case OrCCArithOp:        theAssembler->Or_ (dst, src, src2);            break;

       case TAddCCArithOp:      theAssembler->addo_(dst, src, src2);           break;
       case TSubCCArithOp:      theAssembler->subo_(dst, src, src2);           break;

       case TAndCCArithOp:      theAssembler->And_(dst, src, src2);            break;
       case TOrCCArithOp:       theAssembler->Or_ (dst, src, src2);            break;
       case TXorCCArithOp:      theAssembler->Xor_ (dst, src, src2);           break;
       
       case TMulCCArithOp:      theAssembler->srawi(R0, src2, Tag_Size);
                                theAssembler->mullwo_(dst, src, R0); 
                                break;

       case TDivCCArithOp:      theAssembler->srawi(R0, src2, Tag_Size);
                                theAssembler->srawi(dst, src, Tag_Size);
                                theAssembler->divwo_(R0, dst, R0);
                                theAssembler->slwi(dst, R0, Tag_Size); 
                                break;
       
       case TModCCArithOp:      theAssembler->divwo_(R0, src, src2); 
                                theAssembler->mullw( R0,  R0, src2);
                                theAssembler->sub_(dst, src, R0);
                                break;

       case TARShiftCCArithOp:  theAssembler->srawi(R0, src2, Tag_Size);
                                theAssembler->sraw(dst, src, R0); 
                                theAssembler->clrrwi_(dst, dst, Tag_Size);
                                break;
       case TALShiftCCArithOp:
       case TLLShiftCCArithOp:  theAssembler->srawi(R0, src2, Tag_Size);
                                theAssembler->slw_(dst, src, R0); 
                                break;
       case TLRShiftCCArithOp:  theAssembler->srawi(R0, src2, Tag_Size);
                                theAssembler->srw(dst, src, R0); 
                                theAssembler->clrrwi_(dst, dst, Tag_Size);
                                break;
       
       default:                 ShouldNotReachHere(); // unexpected arith type
      }
    }
    return dst;
  }


  static void taggedArithCheckHelper(Location t1, Location t2, bool reversed,
                                     bool arg1IsInt, bool arg2IsInt,
                                     Location dest,
                                     Node* failNode, bool canOverflow, ArithOpCode op) {

    if (failNode == NULL)
      return;

    bool skipCheck = false;

    Location arg1 = reversed ? t2 : t1;
    Location arg2 = reversed ? t1 : t2;
    Label* l_ = new Label(theAssembler->printing);
    
    // check the rcvr and args' tags
    if (arg1IsInt  &&  arg2IsInt)
      skipCheck = true;
    else if (arg1IsInt) {
      // only need to check arg2
      assert(arg2 != dest, "need to check arg2, but dest is there");
      theAssembler->andi_(R0, arg2, Tag_Mask, NumberOperand);
    }
    else if (arg2IsInt) {
      // only need to check arg1
      assert(arg1 != dest, "need to check arg1, but dest is there");
      theAssembler->andi_(R0, arg1, Tag_Mask, NumberOperand);
    }
    else {
      // check both tags at the same time
      assert(t1 != dest  &&  t2 != dest, "need to check t1 and t2, but dest is there");
      theAssembler->Or   (Temp1, t1, t2);
      theAssembler->andi_(R0, Temp1, Tag_Mask, NumberOperand);
    }
    if (!skipCheck )  theAssembler->bne(*l_, predict_usual); // expect fall through, not br (fwd)

    if (canOverflow)  {
      if (skipCheck)
        theAssembler->crset(cond_eq); // set eq bit so caller will load OVERFLOWERROR
      theAssembler->bso(*l_, predict_usual); // expect fall through, not br (fwd)
    }
    if (op == TALShiftCCArithOp
    ||  op == TDivCCArithOp     )  {
      // overflow if sign bit changed for shift or
      // for divide: check for left shift of result overflowing, e.g. minSmallInt / -1 --- dmu 3/06
      if (op == TALShiftCCArithOp)  theAssembler->Xor_(R0, dest, arg1);
      else                          theAssembler->Xor_(R0, dest, R0);
      // move neg CC bit into EQ CC bit, so caller will load OVERFLOWERROR
      theAssembler->crmove(cond_eq, cond_lt);
      theAssembler->beq(*l_, predict_usual); // expect fall through, not br (fwd)
    }
    failNode->l = l_->unify(failNode->l);
  }
  
// Next two routines are placeholders in case
// any operations need Temp3, etc. -- dmu 1/03

  void TArithRRNode::markAllocated(fint* use_count, fint* def_count) {
    U_CHECK(_src); D_CHECK(_dest); U_CHECK(oper);
    switch (op) {
     default: break;
    }
    // Use Temp3 so that result does not overwrite args, so we can check args -- dmu 3/04
    // Actually, ops where you can check the result instead of the operands can
    // probably get by without using Temp3, because even if operation is in Temp2,
    // the result will just get checked instead (if result is in Temp2).
    // So, maybe Temp3 should only be used for Mul and Mod or Div and just use Temp2 instead
    // for the others. But, I'm not going to try it. -- dmu 3/04
    use_count[Temp3]++; def_count[Temp3]++;       // (potentially) uses Temp3
  }
      
  bool TArithRRNode::canCopyPropagateFrom(PReg* d) {
    switch (op) {
      default: break;
    }
    return d->loc != Temp3; // prevent local cp of Temps
  }

  bool TArithRRNode::isOpInlinable( ArithOpCode op ) {
    return  op != NilArithOp;
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

      bool canOverflow =    
              op == TAddCCArithOp
          ||  op == TSubCCArithOp
          ||  op == TMulCCArithOp
          ||  op == TDivCCArithOp
          ||  op == TModCCArithOp /* if 2nd arg is 0 */;

      if (canOverflow  &&  next1())
        theAssembler->mcrxr(0); // clear summary overflow bit

      // we should check tags first to ensure rcvr and arg are smiOop's.
      // but they might not be in registers, and we'd have to move them
      // to registers first to do the tag check.
      // BUT arith_genHelper already moves them to registers...
      // So let's just do the addition/subtraction using arith_genHelper
      // and, after that, we'll do the tag check since we know rcvr and
      // arg are in registers now.
      Location dest = arith_genHelper(_src, oper, _dest, op, 
                                      t1, t2, reversed);

      taggedArithCheckHelper(t1, t2, reversed, arg1IsInt, arg2IsInt, dest, next1(), canOverflow, op);

      if (dest != _dest->loc) {
        // store result on stack (success case)
        theAssembler->stw(dest, spOffset(_dest->loc), NumberOperand, SP);
      }
    }
  }

  
  void ArithRCNode::gen() {
    BasicNode::gen();
    Location src  = genHelper->moveToReg(_src, Temp1);
    Location dest = isRegister(_dest->loc) ? _dest->loc : Temp2;
    switch (op) {
     case AddArithOp:   theAssembler->addi (dest, src, oper, NumberOperand);   break;
     // Use NumberOperand below because this is used with arbitrary numbers, not oops; see
     //   SPrimScope::genPrimFailure -- dmu 4/07
     case SubArithOp:   theAssembler->subi (dest, src, oper, NumberOperand);   break;

     // there's no and-immediate that does NOT set the CC, which is what AndArithOp
     // is supposed to do.  for now, in the only place where AndArithOp is used,
     // it's ok if the CC is set.  -mabdelmalek 11/23/02
     case AndArithOp:   theAssembler->andi_(dest, src, oper, NumberOperand);   break;
     case OrArithOp:    theAssembler->ori  (dest, src, oper, NumberOperand);   break;
     case XOrArithOp:   theAssembler->xori (dest, src, oper, NumberOperand);   break;
     case ArithmeticLeftShiftArithOp:
     case LogicalLeftShiftArithOp:
                        theAssembler->slwi (dest, src, oper);                  break;
     case ArithmeticRightShiftArithOp:
                        theAssembler->srawi(dest, src, oper);                  break;
     case LogicalRightShiftArithOp:
                        theAssembler->srwi (dest, src, oper);                  break;

     // Use NumberOperand below because this is used with arbitrary numbers, not oops; see
     //   SPrimScope::genPrimFailure -- dmu 4/07
     case SubCCArithOp: oper = -oper;
     case AddCCArithOp: theAssembler->addic_(dest, src, oper, NumberOperand);  break;
     case AndCCArithOp: theAssembler->andi_ (dest, src, oper, NumberOperand);  break;
     case OrCCArithOp:  fatal("no OR-immediate that sets CC on PPC");          break;

     default:           ShouldNotReachHere(); // unexpected arith type
    }
    if (dest != _dest->loc) {
      theAssembler->stw(dest, spOffset(_dest->loc), NumberOperand, SP);
    }
  }


  void BranchNode::gen() {
    BasicNode::gen();
    Label* l_ = new Label(theAssembler->printing);
    switch (op) {
     case ALBranchOp:   theAssembler->b  (*l_, NumberOperand); break;
     case EQBranchOp:   theAssembler->beq(*l_);                break;
     case NEBranchOp:   theAssembler->bne(*l_);                break;
     case LTBranchOp:   theAssembler->blt(*l_);                break;
     case LEBranchOp:   theAssembler->ble(*l_);                break;
     case LTUBranchOp:  fatal("not available on PPC");         break;
     case LEUBranchOp:  fatal("not available on PPC");         break;
     case GTBranchOp:   theAssembler->bgt(*l_);                break;
     case GEBranchOp:   theAssembler->bge(*l_);                break;
     case GTUBranchOp:  fatal("not available on PPC");         break;
     case GEUBranchOp:  fatal("not available on PPC");         break;
     case VSBranchOp:   theAssembler->bso(*l_);                break; // SUMMARY on PPC
     case VCBranchOp:   theAssembler->bns(*l_);                break;
     default:           ShouldNotReachHere(); // unexpected branch type
    }
    Node* n = next1();
    n->l = l_->unify(n->l);
  }


  void TBranchNode::genCompare(bool haveImmediate,
                               Location rcvrReg, Location argReg) {
    if (!intRcvr) {
      // check that rcvr is a smiOop
      theAssembler->andi_(R0, rcvrReg, Tag_Mask, NumberOperand);
      Label*& primFailure = ((MergeNode*)nexti(2))->l;
      Label* l = new Label(theAssembler->printing);
      theAssembler->bne(*l, predict_usual); // will not fail, will fall through fwd, so normal
      primFailure = primFailure->unify(l);
    }
    if (!intArg) {
      // check that arg is a smiOop
      theAssembler->andi_(R0, argReg, Tag_Mask, NumberOperand);
      Label*& primFailure = ((MergeNode*)nexti(2))->l;
      Label* l = new Label(theAssembler->printing);
      theAssembler->bne(*l, predict_usual); // will not fail, will fall through fwd, so normal
      primFailure = primFailure->unify(l);
    }

    // we're here iff arg and rcvr are smiOop's.  do the actual comparision
    if (haveImmediate) {
      oop val = ((ConstPReg*)arg)->constant;
      theAssembler->cmpwi(rcvrReg,(int32)val, NumberOperand);
    }
    else {
      theAssembler->cmpw(rcvrReg, argReg);
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
    a->andi_(R0, rcvr, Tag_Mask, NumberOperand);
    Label* label1 = new Label(a->printing);
    a->beq(*label1);
    define(smiIndex, label1);
  }

  void TypeTestNode::br_if_float(Assembler* a, Location rcvr, fint floatIndex) {
    a->andi_(R0, rcvr, Float_Tag, NumberOperand);
    Label* label2 = new Label(a->printing);
    a->bne(*label2);
    define(floatIndex, label2);
  }
  
  void TypeTestNode::br_to_unknown_case(Assembler* a) {
    Label* unknownCase = new Label(a->printing);
    a->b(*unknownCase, NumberOperand);
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
           
    if (needMapLoad  &&  FastMapTest  &&  !smiIndex  &&  !floatIndex)
      return 0; // 0 for no match, caller will load map

    if (!needMapLoad) {
      // no map load needed; no mem maps to test, rcvr could be memOop at this point
      if (  smiIndex)  br_if_smi  (a, rcvr,   smiIndex);
      if (floatIndex)  br_if_float(a, rcvr, floatIndex);
      return 0; // will be no more testing, so can fall-through to unknown
    }
     
    a->andi_(R0, rcvr, Mem_Tag, NumberOperand);
    loadMapAfterHandlingImmediates = new Label(a->printing);
    a->bne(*loadMapAfterHandlingImmediates, predict_weird); // fewer selectors have int cases, so probably goes
      
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
    Location maploc = genHelper->loadImmediateOop(pr, MapReg, false);  // load map
    theAssembler->cmpw(maploc, RcvrMapReg);                   // compare
    Label* match = new Label(theAssembler->printing);
    theAssembler->beq(*match, predict_weird);                 // branch if match
    define(index, match);
  }
  
  void TypeTestNode::testOop(ConstPReg* pr, fint index) {
    assert(!pr->constant->is_map(), "should be oop");
    Location loc = genHelper->loadImmediateOop(pr, RcvrMapReg, false); // load oop
    theAssembler->cmpw(loc, r);                              // compare
    Label* match = new Label(theAssembler->printing);
    theAssembler->beq(*match, predict_weird);                // branch if match
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
      theAssembler->b(*match, NumberOperand);
      define(ntests + 1, match);
      return;           // done -- tested all constants
    }

    Label* loadMapAfterHandlingImmediates = NULL;
    fint n = prologue(theAssembler, r, smiIndex, floatIndex, immediateOnly, loadMapAfterHandlingImmediates);

    if (n) {
      Label* match = new Label(theAssembler->printing);
      theAssembler->b(*match, NumberOperand);
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
      theAssembler->lwz(RcvrMapReg, map_offset(), NumberOperand, r);
    }
    for (fint i = firstMem; i < ntests; i++) {
      ConstPReg* pr = mapPRs->nth(i);
      if (pr->constant->is_map()) testMap(pr, i + 1);
    }
    if (!hasUnknown) {
      // last case; should omit branch
      Label* match = new Label(theAssembler->printing);
      theAssembler->b(*match, NumberOperand);
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
      theAssembler->andi_(R0, r, Mem_Tag, NumberOperand);
      theAssembler->bne(end);
    }

    // check bounds
    genHelper->loadImmediateOop(as_smiOop(nCases), BoundsReg, true);
    theAssembler->cmplw(BoundsReg, r);   // use unsigned comp to catch negative number
    theAssembler->ble(end); // goto end if index is out of bounds
  
    Label L(theAssembler->printing);
    theAssembler->bl(L, NumberOperand); // get pc of next inst into link
    pc_t link_reg_value = theAssembler->addr();
    L.define();
  
    const int32 indexShift = 2 - Tag_Size;
    assert(indexShift == 0, "no shift needed");
    theAssembler->mflr(R0);
    theAssembler->add(Temp1, R0, r); // and displacement to link
    const int32 bytes_from_link_value_to_jumps = 20;
    theAssembler->addi(Temp1, Temp1, bytes_from_link_value_to_jumps, NumberOperand); // add in bytes from link setting to first jump
    theAssembler->mtlr(Temp1);
    theAssembler->balwlr();
    pc_t start_of_jumps= theAssembler->addr();
    assert( bytes_from_link_value_to_jumps == start_of_jumps - link_reg_value, "recount");

    for (fint i = 0;  i < nCases;  ++i) {
      Label* nthCase = new Label(theAssembler->printing);
      theAssembler->b(*nthCase, NumberOperand);
      Node* n = nexti(i + 1);
      n->l = nthCase->unify(n->l);
    }
    end.define();
  }


  void BlockZapNode::gen() {
    BasicNode::gen();
    Location t = genHelper->moveToReg(block(), Temp1);
    theAssembler->li(R0, 0, NumberOperand);
    theAssembler->stw(R0, scope_offset(), NumberOperand, t);
  }

  void AbstractArrayAtNode::markAllocated(fint* use_count, fint* def_count) {
    U_CHECK(_src); D_CHECK(_dest); U_CHECK(arg);
    if (error) D_CHECK(error);
    // Would not have to do this for Temp[12], but since Temp3 and 4 are really
    // r3 and r4 (not dedicated temps) these are needed. -- dmu 12/02
    use_count[Temp3]++; def_count[Temp3]++;       // (potentially) uses Temp3
    use_count[Temp4]++; def_count[Temp4]++;       // (potentially) uses Temp4
  }
  
    
  bool AbstractArrayAtNode::canCopyPropagateFrom(PReg* d) {
    return d->loc != Temp3  &&  d->loc != Temp4; // prevent local cp of Temps
  }


  // We have 4 temp registers on SPARC.  On PPC, we only have 2 temp registers (and R0
  // sometimes, but often it's not useful because of its 0-nature).
  // I tried writing the array primitives using only 2 temporary registers.  I almost
  // had everything done.  But in the end I realized it's just not possible to do this
  // with 2.5 temp registers.  So I'm using R3 and R4 as temp registers as well.
  // I don't think there's a problem with doing this.  I added Temp3 and Temp4 to
  // regs_ppc.hh.  But if you use these register, you must reserve them, through
  // the markAllocated function (see above).  There's a comment about this as well
  // in regs_ppc.hh.  -mabdelmalek 12/02
  //
  // Also need to define canCopyPropagateFrom to prevent local cp,
  // see canCopyPropagateFrom in node.hh. -- dmu 1/03
  void AbstractArrayAtNode::gen() {
    BasicNode::gen();
    Assembler* a = theAssembler;
    Label* argFail = NULL;          // if arg isn't a smi
    Label* indexFail = new Label(a->printing);  // if arg is out of bounds
    assert(_src->loc != Temp3  &&  _src->loc != Temp4, "_src should not be in temps");
    assert( arg->loc != Temp3  &&   arg->loc != Temp4,  "arg should not be in temps");
    Location arr = genHelper->moveToReg(_src, Temp2);
    Location index = genHelper->moveToReg(arg, Temp1);
    // load array size
    Location size = Temp3;
    a->lwz(size, sizeOffset, NumberOperand, arr);
    if (!intArg) {
      // CP may have propagated a constant into arg
      intArg = arg->isConstPReg() && ((ConstPReg*)arg)->constant->is_smi();
    }
    if (!intArg) {
      // test arg for smiOop
      a->andi_(R0, index, Tag_Mask, NumberOperand);
      Label* failLabel = new Label(a->printing);
      a->bne(*failLabel);
      argFail = argFail->unify(failLabel);
    }
    argFail = argFail->unify(testArg2());
    a->cmplw(index, size);
    a->bge(*indexFail, predict_usual); // likely to fall through
    Location res = isRegister(_dest->loc) ? _dest->loc : Temp1;
    bool needDestStore = genAccess(arr, index, res);
    if (needDestStore && !isRegister(_dest->loc)) {
      genHelper->moveRegToLoc(res, _dest->loc);
    }
    Label* done = new Label(a->printing);
    a->b(*done, NumberOperand);
    MergeNode* failMerge = (MergeNode*)next1();
    if (argFail) {
      argFail->define();
      if (error) {
        Location err = isRegister(error->loc) ? error->loc : Temp1;
        genHelper->loadImmediateOop(VMString[BADTYPEERROR], err);
        if (err != error->loc) genHelper->moveRegToLoc(err, error->loc);
      }
      if (failMerge) { // test added by dmu 4/27/96
        Label* L = new Label(a->printing);
        a->b(*L, NumberOperand);
        failMerge->l = failMerge->l->unify(L);
      }
    }
    indexFail->define();
    if (error) {
      Location err = isRegister(error->loc) ? error->loc : Temp1;
      genHelper->loadImmediateOop(VMString[BADINDEXERROR], err);
      if (err != error->loc) genHelper->moveRegToLoc(err, error->loc);
    }
    if (failMerge) { // test added by dmu 4/27/96
      Label* L = new Label(a->printing);
      a->b(*L, NumberOperand);
      failMerge->l = failMerge->l->unify(L);
    }
    done->define();
  }

  // gen array access; Temp3/4 are available, Temp1 may hold index, Temp2
  // may hold array
  bool ArrayAtNode::genAccess(Location arr, Location index, Location dest) {
    theAssembler->add(Temp3, arr, index);
    theAssembler->lwz(dest, dataOffset, NumberOperand, Temp3);
    return true;
  }

  bool ByteArrayAtNode::genAccess(Location arr, Location index, Location dest) {
    theAssembler->lwz(Temp3, dataOffset, NumberOperand, arr);
    theAssembler->srwi(Temp4, index, Tag_Size);
    theAssembler->add(Temp3, Temp3, Temp4);
    theAssembler->lbz(dest, 0, NumberOperand, Temp3);
    theAssembler->slwi(dest, dest, Tag_Size);
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
      assert(elem->loc != Temp3  &&  elem->loc != Temp4, "elem should not be in Temp3 or Temp4");
      el = genHelper->moveToReg(elem, Temp3);
      needCheckStore = true;
    }
    theAssembler->add(Temp4, arr, index);
    theAssembler->stw(el, dataOffset, NumberOperand, Temp4);
    if (needCheckStore) {
      theAssembler->addi(Temp4, Temp4, dataOffset, NumberOperand);
      theAssembler->srwi(Temp4, Temp4, card_shift);  // shift target addr
      theAssembler->li(R0, 0, NumberOperand);
      if (!UseByteMapBaseReg) {
        theAssembler->load_from_address(Temp3, &byte_map_base, VMAddressOperand, Temp3);
        theAssembler->stbx(R0, Temp4, Temp3);
      }
      else {
        theAssembler->stbx(R0, Temp4, ByteMapBaseReg);  // set byte in map
      }
    }
    // ignore dest and handle result assignment here (saves one instruction)
    if (_dest != _src) genHelper->moveRegToLoc(arr, _dest->loc);
    return false;
  }

  Label* ByteArrayAtPutNode::testArg2() {
    // check if arg is 0..255
    if (elem->isConstPReg()) {
      if (((ConstPReg*)elem)->constant->is_smi()) {
        // no run-time check required
        return NULL;
      } else {
        // primitive will always fail
        Label* L = new Label(theAssembler->printing);
        theAssembler->b(*L, NumberOperand);
        return L;
      }
    } else {
      assert(elem->loc != Temp3  &&  elem->loc != Temp4, "elem should not be in Temp3 or Temp4");
      Location e = genHelper->moveToReg(elem, Temp4);
      Label* fail = NULL;
      if (!intElem) {
        // check for int
        theAssembler->andi_(R0, e, Tag_Mask, NumberOperand);
        fail = new Label(theAssembler->printing);
        theAssembler->bne(*fail);
      }
      theAssembler->cmplwi(e, 256 << Tag_Size, NumberOperand);
      Label* fail2 = new Label(theAssembler->printing);
      theAssembler->bgt(*fail2);
      return fail->unify(fail2);
    }
  }
  
  bool ByteArrayAtPutNode::genAccess(Location arr,
                                     Location index, Location dest) {
    Unused(dest);
    theAssembler->lwz(Temp4, dataOffset, NumberOperand, arr);
    theAssembler->srwi(Temp1, index, Tag_Size);
    theAssembler->add(Temp4, Temp4, Temp1);
    if (elem->isConstPReg()) {
      // storing a constant - may be non-smi, but then this code will never
      // be executed anyway because the primitive fails
      ConstPReg* value = (ConstPReg*)elem;
      if (value->constant->is_smi()) {
        theAssembler->load_immediate(Temp3, smiOop(value->constant)->value(), NumberOperand);
      } else {
        fatal("ByteArrayAtPutNode::genAccess: what to do?");
      }
    } else {
      assert(elem->loc != Temp3  &&  elem->loc != Temp4, "elem should not be in Temp3 or Temp4");
      Location el = genHelper->moveToReg(elem, Temp3);
      theAssembler->srwi(Temp3, el, Tag_Size);  // convert to char
    }
    theAssembler->stb(Temp3, 0, NumberOperand, Temp4); // store in byte array
    // ignore dest and handle result assignment here (saves one instruction)
    if (_dest != _src) genHelper->moveRegToLoc(arr, _dest->loc);
    return false;           // result already handled here
  }

  void FlushNode::flushRegister(PReg* pr) {
    Location loc = pr->loc;
    assert(isRegister(loc), "inconsistency: FlushNode::gen should only call me with a register");
    theSIC->check_flushability(pr);


    if (theSIC->are_register_arguments_saved_on_stack() &&
        theSIC->is_incoming_register_arg_or_rcvr(loc)) {
      #if 1
        // Ordinarily, we'd flush the incoming argument.  But to make things simple
        // for GC, in the method prologue we flush _all_ incoming arguments if we
        // have any subblocks.
      #else
        // To illustrate where we'll save the argument, suppose we're asked to flush
        // the second argument.  The second argument is saved in register R29 in the
        // prologue, and so we'll be passed the R29 location.  So to find the argument
        // index, subtract the register from R31.  Then, since arguments are saved on
        // the calleR's stack frame, we add our frame size to the offset returned by the
        // helper function rcvr_and_argument_offset.
        fint argIndex = R31 - loc;
        fint spOffset = thisFrameSize + rcvr_and_argument_offset(argIndex);
        theAssembler->stw(loc, spOffset * oopSize, NumberOperand, SP);
      #endif
    }
  }

  void DeadBlockNode::gen() {
    BasicNode::gen();
    genPcDesc();
    theAssembler->Comment("dead block code");
    Label next(theAssembler->printing);
    theAssembler->bl(next, NumberOperand); // prim needs some PC in this method
    next.define();
    theAssembler->mflr(CReceiverReg);
    PrimNode::gen();
  }
  
  void DeadEndNode::gen() {
    // this node is unreachable - generate a trap for debugging
#if 0
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      BasicNode::gen();
      theAssembler->trap();
    }
#   endif
#endif
  }

  // XXX: how to catch illegal instructions on Mac OS X?  Unlike SPARC, an illegal
  // instruction does not generate a SIGILL signal.  Instead, a Mach exception is
  // raised apparently.  For now, uncommon nodes are turned off on PPC.
   void UncommonNode::gen() {
     BasicNode::gen();
     genPcDesc();
     fatal("UncommonNode::gen: on PPC, illegal instructions don't generate SIGILL");
     //    theAssembler->unimp(0, restartSend);
  }

# endif  // sic
# endif // TARGET_ARCH == PPC_ARCH
