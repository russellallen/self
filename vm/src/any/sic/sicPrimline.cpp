/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// primitive inlining in the SIC


# pragma implementation "sicPrimline.hh"

# include "_sicPrimline.cpp.incl"

# ifdef SIC_COMPILER

SExpr* SPrimScope::tryConstantFold() {
    const fint MaxPrimArgs = 5; // fix switch stmt below when increasing this
    if (!pd->canBeConstantFolded() || nargs > MaxPrimArgs) return NULL;
    oop a[MaxPrimArgs];         // argument oops
    if (!receiver->isConstantSExpr()) return NULL;
    oop r = receiver->constant();
    // get arguments (NB: args is in reverse order)
    fint i;
    for (i = 0; i < nargs; i++) {
      if (!args->nth(i)->isConstantSExpr()) return NULL;
      a[nargs - i - 1] = args->nth(i)->constant();
    };
    // ok, all args are consts: call the primitive
    oop res;
    fntype f = pd->fn();
    switch(nargs) {
     case 0:    res = f(r); break;
     case 1:    res = f(r, a[0]); break;
     case 2:    res = f(r, a[0], a[1]); break;
     case 3:    res = f(r, a[0], a[1], a[2]); break;
     case 4:    res = f(r, a[0], a[1], a[2], a[3]); break;
     case 5:    res = f(r, a[0], a[1], a[2], a[3], a[4]); break;
     default:   ShouldNotReachHere();
    }

    if (PrintInlining) {
      char buf[1024];
      char* b = buf;
      mysprintf(b, "%*s*constant-folding %s %s ", (void*)depth, "",
                r->debug_print(), pd->name());
      for (i = 0; i < nargs; i++) {
        mysprintf(b, "%s ", a[i]->debug_print());
      }
      mysprintf(b, "--> %s\n", res->debug_print());
      lprintf(buf);
    }

    // should scan backwards here and discard all nodes computing the args

    if (res->is_mark()) {
      // primitive will always fail
      ConstPReg* error = new_ConstPReg(_sender, res->memify());
      Node* dummy;
      MergeNode* mdummy = NULL;
      SExpr* failExpr =
        genPrimFailure(NULL, error, dummy, mdummy, resultPR, false);
      return failExpr;
    } else {
      theNodeGen->loadOop(res, resultPR);
      return new ConstantSExpr(res, resultPR, theNodeGen->current);
    }
  }

# define CHECK_INT(r)                                                         \
    ((r)->hasMap() && (r)->map() != Memory->smi_map)

# define CHECK_FLOAT(r)                                                       \
    ((r)->hasMap() && (r)->map() != Memory->float_map)

# define TYPECHECK(r, expr)                                                   \
    ((r)->hasMap() && !(r)->map()->expr)

  SExpr* SPrimScope::tryTypeCheck() {
    // for inlined prims, try to see if primitive will always fail
    if (!InlinePrimitives) return NULL;
    
    bool fail = false;
    switch (pd->type()) {
     case NotReallyAPrimitive:
     case InternalPrimitive:
      fatal("cannot call an internal primitive from Self code");
      return NULL;
     case IntComparisonPrimitive:
     case IntArithmeticPrimitive:
      // must have two smis
      fail = CHECK_INT(receiver) || CHECK_INT(args->last());
      break;

     case FloatArithmeticPrimitive:
     case FloatComparisonPrimitive:
      // must have two floats
      fail = CHECK_FLOAT(receiver) || CHECK_FLOAT(args->last());
      break;
      
     case AtPrimitive:
     case AtPutPrimitive:
      // must have array rcvr and smi arg
      fail = TYPECHECK(receiver, is_objVector()) || CHECK_INT(args->last());
      break;
     case SizePrimitive:
      // must have array rcvr
      fail = TYPECHECK(receiver, is_objVector());
      break;

     case ByteAtPutPrimitive:
      // stored value must be 0..255; for now, test only for integer
      fail = CHECK_INT(args->nth(0));
      // fall through
     case ByteAtPrimitive:
      // must have array rcvr and smi arg
      fail |= TYPECHECK(receiver, is_byteVector()) || CHECK_INT(args->last());
      break;
     case ByteSizePrimitive:
      // must have array rcvr
      fail = TYPECHECK(receiver, is_byteVector());
      break;

     default:
      return NULL;          
    }
    
    if (fail) {
      // primitive will always fail
      ConstPReg* error = new_ConstPReg(_sender, VMString[BADTYPEERROR]);
      Node* dummy;
      MergeNode* mdummy = NULL;
      return genPrimFailure(NULL, error, dummy, mdummy, resultPR, false);
    } else {
      return NULL;
    }
  }

  SExpr* SPrimScope::tryInline() {
    if (!InlinePrimitives) return NULL;
    switch (pd->type()) {
     case NotReallyAPrimitive:
     case InternalPrimitive:
      fatal("cannot call an internal primitive from Self code");
      return NULL;
     case ClonePrimitive:
      return inlineClone(); break;
     case IntComparisonPrimitive:
      return inlineIntComparison(); break;
     case IntArithmeticPrimitive:
      return inlineIntArithmetic(); break;
     case EQPrimitive:
      return inlineEQ(); break;
     case AtPrimitive:
      return inlineAt(true);
     case AtPutPrimitive:
      return inlineAtPut(true);
     case SizePrimitive:
      return inlineVectorSize(true);  
     case ByteAtPrimitive:
      return inlineAt(false);
     case ByteAtPutPrimitive:
      return inlineAtPut(false);
     case ByteSizePrimitive:
      return inlineVectorSize(false);  
     case RestartPrimitive:
      fatal("shouldn't call this for _Restart");
      break;
     case CloneVectorPrimitive:     // not worth inlining
     case UnwindProtectPrimitive:   // not worth inlining (yet)
     case FloatArithmeticPrimitive:
     case FloatComparisonPrimitive:
     case ExternalPrimitive:        // can't inline these
     default:
      return NULL;          
    }
    return NULL;
  }

  ConstPReg* SPrimScope::truePR() {
    return new_ConstPReg(_sender, Memory->trueObj);
  }
  ConstPReg* SPrimScope::falsePR() {
    return new_ConstPReg(_sender, Memory->falseObj);
  }
    

  SExpr* SPrimScope::inlineEQ() {
    if (PrintInlining) lprintf("%*s*inlining _Eq\n", (void*)(depth-1), ""); 
    NodeGen* ng = theNodeGen;
    if (SICDebug) ng->comment("inlined _Eq");
    SExpr* arg = args->top();
    PReg* r  = receiver->preg();
    PReg* ar = arg->preg();
    ng->append(new ArithRRNode(SubCCArithOp, r, ar, ng->noPR));
    Node* test = ng->append(new BranchNode(EQBranchOp));
    Node* falseNode;
    test->append(falseNode = new AssignNode(falsePR(), resultPR));
    SExpr* e1 = new ConstantSExpr(Memory->falseObj, resultPR, falseNode);
    MergeNode* merge = new MergeNode("inlineEQ merge");
    falseNode->append(merge);
    Node* trueNode = new AssignNode(truePR(), resultPR);
    ng->current = test->append1(trueNode);
    SExpr* e2 = new ConstantSExpr(Memory->trueObj, resultPR, trueNode);
    ng->branch(merge);
    SExpr* res = e1->copyMergeWith(e2, resultPR, ng->current);
    return res;
  }

  SExpr* SPrimScope::inlineClone() {
    // clones aren't really inlined, but can call specialized version if size
    // is known
    if (!receiver->hasMap()) return NULL;

    Map* map = receiver->map();
    if (map->is_smi() || map->is_float() || map->is_string()) {
      // cloning is a no-op
      if (PrintInlining) {
        lprintf("%*s*constant-folding (eliminating) _Clone\n",
                (void*)(depth-1), "");
      }
      return receiver;
    }

    if ( map->empty_object_size() != EMPTY_SLOTS_OOP_SIZE  // inlined clone method assumes this
    ||  !map->can_inline_clone())
      return NULL;

    fint slotCount = map->length_obj_slots();
    if (slotCount < 10) {
      // replace with specialized Clone primitive
      pd = getPrimDescOfSelector(VMString[_CLONE_0 + slotCount], true);
      assert(pd->type() == InternalPrimitive, "should be internal");
    }
    return NULL;
  }


  SExpr* SPrimScope::inlineIntArithmetic() {
    ArithOpCode op = opcode_for_selector(_selector);
      
    bool intRcvr =
      receiver->hasMap() && receiver->map() == Memory->smi_map;
    SExpr* arg = args->nth(0);
    bool intArg = arg->hasMap() && arg->map() == Memory->smi_map;
    if ( intArg
    &&   arg->isConstantSExpr()
    &&   intRcvr
    &&   arg->constant() == as_smiOop(0)
    &&   can_fold_rcvr_op_zero_to_zero(op)) {
      if (PrintInlining)
        lprintf("%*s*constant-folding %s: 0\n", (void*)(depth-1), "", ArithOpName[op]);
      return receiver;
    }
    if (PrintInlining) lprintf("%*s*inlining %s:\n", (void*)(depth-1),
                               "", ArithOpName[op]);

    if (!TArithRRNode::isOpInlinable(op))
      return NULL;
      
    NodeGen* n = theNodeGen;
    Node* arith = n->append(new TArithRRNode(op, receiver->preg(), arg->preg(),
                                             resultPR, intRcvr, intArg));

    // success case - no overflow, int tags
    MergeNode* ok = (MergeNode*)n->append(new MergeNode("inlineIntArithmetic ok"));
    SExpr* succExpr = new MapSExpr(Memory->smi_map->enclosing_mapOop(), resultPR, ok);
    // merge of success & failure branches
    MergeNode* done = (MergeNode*)ok->append(new MergeNode("inlineIntArithmetic done"));

    // failure case
    n->current = arith->append1(new NopNode);
    if (theSIC->useUncommonTraps &&
        sender()->rscope->isUncommonAt(sender()->bci(), true)) {
      n->uncommonBranch(currentExprStack(0), true);
      n->current = done;
      if (PrintInlining) {
        lprintf("%*s*making arithmetic failure uncommon\n", (void*)(depth-1),
                "");
      }
      return succExpr;
    } else {
      fint b = bci();
      PReg* error = new SAPReg(_sender, b, b);
      if (intRcvr && intArg) {
        // must be overflow
        n->loadOop(VMString[OVERFLOWERROR], error);
      } else {
        arith->hasSideEffects_now = true;    // may fail, so can't eliminate
        if (intRcvr || TARGET_ARCH == I386_ARCH) {
          // arg & TagMask already done by TArithRRNode
          // I386 does 'em all
        } else {
          PReg* t = new TempPReg(this, Temp1, false, true);
          n->append(new ArithRCNode(AndCCArithOp, t, Tag_Mask, t));
          n->current->hasSideEffects_now = true;
        }
        // Note: this code assumes that condcode EQ means overflow
        Node* branch = n->append(new BranchNode(EQBranchOp));
        // no overflow, must be type error
        n->loadOop(VMString[BADTYPEERROR], error);
        MergeNode* cont = (MergeNode*)n->append(
          new MergeNode("inlineIntArithmetic cont"));
        // overflow error
        PReg* err = new_ConstPReg(_sender, VMString[OVERFLOWERROR]);
        n->current = branch->append1(new AssignNode(err, error));
        n->branch(cont);
      }
      Node* dummy;
      SExpr* failExpr = genPrimFailure(NULL, error, dummy, done, resultPR);
      assert(done, "merge should always exist");
      return succExpr->mergeWith(failExpr, done);
    }
  }

  SExpr* SPrimScope::inlineIntComparison() {
    BranchOpCode cond;
           if (_selector == VMString[_INT_EQ_]) {
      cond = EQBranchOp;
    } else if (_selector == VMString[_INT_LT_]) {
      cond = LTBranchOp;
    } else if (_selector == VMString[_INT_LE_]) {
      cond = LEBranchOp;
    } else if (_selector == VMString[_INT_GT_]) {
      cond = GTBranchOp;
    } else if (_selector == VMString[_INT_GE_]) {
      cond = GEBranchOp;
    } else if (_selector == VMString[_INT_NE_]) {
      cond = NEBranchOp;
    } else {
      return NULL;
    }

    bool intRcvr =
      receiver->hasMap() && receiver->map() == Memory->smi_map;
    SExpr* arg = args->nth(0);
    bool intArg = arg->hasMap() && arg->map() == Memory->smi_map;
    if (PrintInlining)
      lprintf("%*s*inlining int comparison prim\n", (void*)(depth-1), "");

    NodeGen* n = theNodeGen;
    Node* branch = n->append(new TBranchNode(cond, receiver->preg(), intRcvr,
                                             arg->preg(), intArg));

    // false branch
    n->move(falsePR(), resultPR);
    SExpr* falseExpr= new ConstantSExpr(Memory->falseObj, resultPR, n->current);
    MergeNode* done = (MergeNode*)n->append(
      new MergeNode("inlineIntComparison done"));

    // true branch
    n->current = branch->append1(new AssignNode(truePR(), resultPR));
    SExpr* trueExpr = new ConstantSExpr(Memory->trueObj, resultPR, n->current);
    n->branch(done);

    SExpr* res = trueExpr->copyMergeWith(falseExpr, resultPR, done);
    // failure branch
    if (!intRcvr || !intArg) {
      branch->hasSideEffects_now = true;
      if (theSIC->useUncommonTraps &&
          sender()->rscope->isUncommonAt(sender()->bci(), true)) {
        n->current = branch->append(2, new NopNode);
        n->uncommonBranch(currentExprStack(0), true);
        n->current = done;
        if (PrintInlining) {
          lprintf("%*s*making int comparison failure uncommon\n",
                  (void*)(depth-1), "");
        }
      } else {
        fint b = bci();
        PReg* error = new SAPReg(_sender, b, b);
        PReg* err = new_ConstPReg(_sender, VMString[BADTYPEERROR]);
        n->current = branch->append(2, new AssignNode(err, error));
        Node* dummy;
        SExpr* failExpr = genPrimFailure(NULL, error, dummy, done, resultPR);
        assert(done, "merge should always exist");
        res = (MergeSExpr*)res->mergeWith(failExpr, done);
      }
    }
    return res;
  }

  SExpr* SPrimScope::inlineVectorSize(bool objVector) {
    bool okRcvr = receiver->hasMap();
    Map* rm;
    if (okRcvr) {
      rm = receiver->map();
      if (objVector) {
        okRcvr = rm->is_objVector();
      } else {
        okRcvr = rm->is_byteVector();
      }
    }
    if (!okRcvr) {
      // receiver type not known statically
      return NULL;
    }
    if (PrintInlining)
      lprintf("%*s*inlining %s\n", (void*)(depth-1), "",
             objVector ? "_Size:" : "_ByteSize:");
    
    NodeGen* n = theNodeGen;
    if (SICDebug) n->comment("inlined _Size:/_ByteSize:");
    fint offset = objVector ? objVector_len_offset() : byteVector_len_offset();
    n->append(new LoadOffsetNode(receiver->preg(), offset, resultPR));
    return new MapSExpr(Memory->smi_map->enclosing_mapOop(), resultPR, n->current);
  }

  SExpr* SPrimScope::inlineAt(bool objVector) {
    assert(_selector == VMString[objVector ? _AT_ : _BYTE_AT_],
           "bad selector");
    bool okRcvr = receiver->hasMap();
    Map* rm;
    if (okRcvr) {
      rm = receiver->map();
      if (objVector) {
        okRcvr = rm->is_objVector();
      } else {
        okRcvr = rm->is_byteVector();
      }
    }
    if (!okRcvr) {
      // receiver type not known statically
      return NULL;
    }
    if (PrintInlining)
      lprintf("%*s*inlining %s\n", (void*)(depth-1), "",
              objVector ? "_At:" : "_ByteAt:");
    
    SExpr* arg = args->nth(0);
    NodeGen* ng = theNodeGen;
    if (SICDebug) ng->comment("inlined _At:/_ByteAt:");
    fint b = bci();
    bool intArg   = arg->hasMap() && arg->map() == Memory->smi_map;
    bool willFail = arg->hasMap() && arg->map() != Memory->smi_map;
    bool useUncommonTrap = !willFail && theSIC->useUncommonTraps &&
      sender()->rscope->isUncommonAt(sender()->bci(), true);
    // optimization: don't set error reg if using uncommon trap
    // (primitive will be reexecuted anyway)
    PReg* errorPR = useUncommonTrap ? NULL : new SAPReg(_sender, b, b);
    Node* at;
    if (objVector) {
      fint size = ((slotsMap*)rm)->empty_vector_object_size();
      at = new ArrayAtNode(receiver->preg(), arg->preg(), intArg,
                           resultPR, errorPR, size * oopSize - Mem_Tag);
                           
    } else {
      at = new ByteArrayAtNode(receiver->preg(), arg->preg(), intArg,
                               resultPR, errorPR);
    }
    ng->append(at);
    
    // success case - int index, in bounds
    NopNode* ok = (NopNode*)ng->append(new NopNode);
    // merge of success & failure branches
    MergeNode* done = (MergeNode*)ok->append(new MergeNode("inlineAt done"));

    // failure case
    ng->current = at->append1(new NopNode);
    if (useUncommonTrap) {
      if (PrintInlining) {
        lprintf("%*s*making at: failure uncommon\n", (void*)(depth-1), "");
      }
      ng->uncommonBranch(currentExprStack(0), true);
      ng->current = done;
    } else {
      Node* dummy;
      SExpr* failExpr = genPrimFailure(NULL, errorPR, dummy, done, resultPR);
      assert(done, "merge should exist");
    }
    return new UnknownSExpr(resultPR, ok);
  }

  SExpr* SPrimScope::inlineAtPut(bool objVector) {
    assert(_selector == VMString[objVector ? _AT_PUT_ : _BYTE_AT_PUT_],
           "bad selector");
    bool okRcvr = receiver->hasMap();
    Map* rm;
    if (okRcvr) {
      rm = receiver->map();
      if (objVector) {
        okRcvr = rm->is_objVector();
      } else {
        okRcvr = rm->is_byteVector();
      }
    }
    if (!okRcvr) {
      // receiver type not known statically
      return NULL;
    }
    if (PrintInlining)
      lprintf("%*s*inlining _%sAtPut:\n", (void*)(depth-1),
              "", objVector ? "" :"Byte");
    
    SExpr* arg = args->nth(1);
    NodeGen* ng = theNodeGen;
    if (SICDebug) ng->comment("inlined _At:Put:/_ByteAt:Put:");
    fint b = bci();
    bool intArg   = arg->hasMap() && arg->map() == Memory->smi_map;
    bool willFail = arg->hasMap() && arg->map() != Memory->smi_map;
    bool useUncommonTrap = !willFail && theSIC->useUncommonTraps &&
      sender()->rscope->isUncommonAt(sender()->bci(), true);
    PReg* errorPR = useUncommonTrap ? NULL : new SAPReg(_sender, b, b);
    Node* at;
    if (objVector) {
      PReg* elementArgPR = args->nth(0)->preg();
      
      // materialize value arg
      theNodeGen->materializeBlock(elementArgPR, _sender->sig, new PRegBList(1));
      
      fint size = ((slotsMap*)rm)->empty_vector_object_size();
      at = new ArrayAtPutNode(receiver->preg(), arg->preg(), intArg,
                              elementArgPR, resultPR, errorPR,
                              size * oopSize - Mem_Tag);
    } 
    else {
      SExpr* value = args->nth(0);
      bool intVal = value->hasMap() && value->map() == Memory->smi_map;
      willFail   |= value->hasMap() && value->map() != Memory->smi_map;
      at = new ByteArrayAtPutNode(receiver->preg(), arg->preg(), intArg, 
                                  value->preg(), intVal, resultPR, errorPR);
    }
    ng->append(at);
    
    // success case - int index, in bounds
    MergeNode* ok = (MergeNode*)ng->append(new NopNode);
    // merge of success & failure branches
    MergeNode* done = (MergeNode*)ok->append(new MergeNode("inlineAtPut done"));

    // failure case
    SExpr* res = receiver->shallowCopy(resultPR, ok);
    ng->current = at->append1(new MergeNode("inlineAtPut current"));
    if (useUncommonTrap) {
      if (PrintInlining) {
        lprintf("%*s*making atPut: failure uncommon\n", (void*)(depth-1), "");
      }
      ng->uncommonBranch(currentExprStack(0), true);
      ng->current = done;
    } else {
      Node* dummy;
      SExpr* failExpr = genPrimFailure(NULL, errorPR, dummy, done, resultPR);
      assert(done, "node should always exist");
      res = res->mergeWith(failExpr, done);
    }
    return res;
  }
  
  SExpr* SPrimScope::genPrimFailure(PrimNode* call, PReg* errorReg,
                                    Node*& test, MergeNode*& merge,
                                    PReg* resultReg, bool failure) {
    // generate primitive failure code
    // two modes:
    //    if call == NULL, omit the test for failure because it's already
    //          been generated (inlined prim.); in this case, errorReg
    //          must be set
    //    if call != NULL, generate test code (setting test & merge node args)
    // returns the result of the failure branch

    // pop prim args (they're not on the expr stack anymore in the fail branch)
    while (npop-- > 0) exprStack()->pop();
    
    SCodeScope* s = sender();
    NodeGen* ng = theNodeGen;
    if (call) {
      fint b = bci();
      SAPReg* t = new SAPReg(s, b, b);
      // extract tag field and test for mark tag
      ng->append(new ArithRCNode(AndArithOp, call->dest(), Tag_Mask, t));
      ng->append(new ArithRCNode(SubCCArithOp, t, Tag_Mask, ng->noPR));
      test = ng->append(new BranchNode(NEBranchOp));
      // failure branch; load error string
      if (!errorReg) errorReg = new SAPReg(s, b, b);
      ng->current = 
        test->append(new ArithRCNode(SubArithOp, call->dest(),
                                     Mark_Tag-Mem_Tag, errorReg));
    }

    SExpr* failReceiver = hasFailBlock ? failBlock : receiver;
    SendInfo* info = new SendInfo(failReceiver, NormalLookupType, false, false,
                                  (stringOop)failSelector, NULL);
    info->computeNSends(rscope, bci());
    info->primFailure = failure;
    info->restartPrim = call == NULL;   // restart inlined prims (unc. traps)
    s->exprStack->push(failReceiver);
    if (errorReg->isConstPReg()) {
      s->exprStack->push(new ConstantSExpr(((ConstPReg*)errorReg)->constant,
                                           errorReg, ng->current));
    } else {
      s->exprStack->push(new MapSExpr(Memory->stringObj->map()->enclosing_mapOop(),
                                      errorReg, ng->current));
    }
    ConstPReg* failSelReg = new_ConstPReg(s, selector());
    s->exprStack->push(new ConstantSExpr(selector(), failSelReg, NULL));
    SExpr* res = s->inlineSend(info);

    if (res->isNoResultSExpr()) {
      // never returns
      ng->current = merge; // set to NULL if no merge
    } 
    else {
      if (needZap) {
        assert(failBlock->preg()->isBlockPReg(), "should be a block");
        ng->zapBlock((BlockPReg*)failBlock->preg());
      }
      ng->move(res->preg(), resultReg);
      res = res->shallowCopy(resultReg, ng->current);
      // moved creation down from before if res->isNoResult... 
      //   to avoid creating unreachable merge -- dmu
      if (merge == NULL) merge = new MergeNode("genPrimFailure merge"); 
      ng->append(merge);
    }
    return res;
  }

# endif
