/* Sun-$Revision: 30.16 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# pragma implementation "node.hh"
# pragma implementation "node_inline.hh"

# include "_node.cpp.incl"

# ifdef SIC_COMPILER

  int32 BasicNode::currentID;
  int32 BasicNode::currentCommentID;
  int32 BasicNode::cumulCost;
  fint BasicNode::lastBCI;
  ScopeInfo BasicNode::lastScopeInfo;
  int32 BasicNode::thisFrameSize;
  PrimDesc* BlockCloneNode::blockClone;
  PrimDesc* InterruptCheckNode::intrCheck;
  ConstPReg* BlockCloneNode::deadBlockPR;
  const Location TypeTestNode::RcvrMapReg = Temp1;
  const Location TypeTestNode::MapReg     = Temp2;
  
  const Location IndexedBranchNode::IndexReg  = Temp1;
  const Location IndexedBranchNode::BoundsReg = Temp2;

  void initNodes() {
    Node::currentID = Node::currentCommentID = Node::cumulCost = 0;
    BlockCloneNode::blockClone
      = getPrimDescOfSelector(VMString[BLOCK_CLONE], true);
    InterruptCheckNode::intrCheck
      = getPrimDescOfSelector(VMString[INTERRUPT_CHECK], true);
    BlockCloneNode::deadBlockPR = NULL;
    Node::lastScopeInfo = (ScopeInfo)-1;  Node::lastBCI = IllegalBCI;
    initDeadBlockNode();
  }

  void BasicNode::setScope(SSelfScope* s) {
    _scope = s; _bci = s ? s->bci() : IllegalBCI;
    assert(!s || !s->isCodeScope() ||
           s->bci() < ((SCodeScope*)s)->ncodes, "illegal bci");
  }

  BasicNode::BasicNode() {
    _id = currentID++; _bb = NULL;
    setScope(theNodeGen->currentScope());       // no scope e.g. for accessors
    _num = -1; _dest = _src = NULL; srcUse = NULL; destDef = NULL;
    hasSideEffects_now = deleted = false; l = NULL;
  }
  
 fint BasicNode::spOffset(Location l) {
   return genHelper->spOffset(l);
 }

 fint BasicNode::spOffset(Location l, nmethod* nm) {
   return genHelper->spOffset(l, nm);
 }

  void BasicNode::eliminateDest(BB* bb) {
    if (hasDest()  &&  canChangeDest())
      setDest(bb, theNodeGen->noPR);
  }



  // Public entry point for eliminateNode
  // This function does full virtual eliminateNode, THEN after
  // all parts gone, calls checkUses once.
  // It saves having to do non-virtual checkUses in an elimNode per class
  // that just resends and calls checkUses.  -- dmu 8/96

  void BasicNode::eliminateNodeAndUsedPRs(BB* bb, PReg* r, bool removing,
                                          void* misc) {
    if (deleted) return;  // prevent recursive deletion
    eliminateNode(bb, r, removing, misc);
    checkUses(r);
  }


  MarkerNode::MarkerNode(SExprStack* es, SplitSig* signat) {
    exprStack = new SExprStack(scope(), es->length());
    exprStack->appendList(es);
    sig = signat;
    theRecompilation->markers->append(this);
    active = invalid = false; locs = NULL;
    // NODE_COST(MarkerNode)
  }
  
  CommentNode::CommentNode(const char* s) {
    comment = s;
    // give all comments negative ids (don't disturb node numbers by turning
    // SICDebug off and on)
    _id = --currentCommentID; currentID--;
    // NODE_COST(CommentNode)
  }

  ArrayAtNode::ArrayAtNode(PReg* r, PReg* idx, bool ia,
                           PReg* res, PReg* err, fint doff)
  : AbstractArrayAtNode(r, idx, ia, res, err, doff, objVector_len_offset()) {
    NODE_COST(ArrayAtNode);    
  }

  ByteArrayAtNode::ByteArrayAtNode(PReg* r, PReg* idx, bool ia,
                                   PReg* res, PReg* err)
  : AbstractArrayAtNode(r, idx, ia, res, err,
                        byteVector_bytes_offset(), byteVector_len_offset()) {
    NODE_COST(ByteArrayAtNode);    
  }

  ArrayAtPutNode::ArrayAtPutNode(PReg* r, PReg* idx, bool ia,
                                 PReg* el, PReg* res, PReg* err, fint doff)
  : AbstractArrayAtPutNode(r, idx, ia, el, res, err, doff,
                           objVector_len_offset()) {
    NODE_COST(ArrayAtPutNode);  
  }

  ByteArrayAtPutNode::ByteArrayAtPutNode(PReg* r, PReg* idx,
                                         bool ia, PReg* el, bool ie,
                                         PReg* res, PReg* err)
  : AbstractArrayAtPutNode(r, idx, ia, el, res, err,
                           byteVector_bytes_offset(),
                           byteVector_len_offset()) {
    intElem = ie; NODE_COST(ByteArrayAtPutNode);    
 }

  TypeTestNode::TypeTestNode(PReg* rr, OopBList* m, bool nml, bool u) {
    _src = rr; maps = m; needMapLoad = nml;  hasUnknown = u;
    fint len = m->length();
    assert(len > 0, "should have at least one thing to test");
    mapPRs = new ConstPRegBList(len);
    fint i;
    for (i = 0; i < len; i++) {
      mapPRs->append(new_ConstPReg(_scope, m->nth(i)));
    }
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      for (i = 0; i < len; i++) {
        if (m->nth(i) == Memory-> true_mapOop() ||
            m->nth(i) == Memory->false_mapOop())
          error( "true/false performance bug");
        for (fint j = i + 1; j < len; j++) {
          assert(m->nth(i) != m->nth(j), "duplicate map");
        }
      }
    }
#   endif
    NODE_COST(TypeTestNode);    
  }

  IndexedBranchNode::IndexedBranchNode(PReg* testPR, int32 n) {
    _src = testPR;  nCases = n;  srcMustBeSmi = false;
    assert(nCases >= 0, "nCases must be non-negative");
    NODE_COST(IndexedBranchNode);    
  }

  TArithRRNode::TArithRRNode(ArithOpCode o, PReg* s, PReg* o2, PReg* d,
                             bool a1, bool a2) {
    op = o; _src = s; oper = o2, _dest = d;
    arg1IsInt = a1; arg2IsInt = a2;
    hasSideEffects_now = true; constResult = NULL;
    // don't eliminate even if result unused because primitive might fail
    NODE_COST(TArithRRNode);    
  }
  
  PReg* BasicNode::dest() {
    if (!hasDest()) fatal("has no dest");
    return _dest;
  }

  void BasicNode::setDest(BB* bb, PReg* d) {
    // bb == NULL means don't update defs
    if (!hasDest()) fatal("has no dest");
    assert(bb || !destDef, "shouldn't have a def");
    if (destDef) _dest->removeDef(bb, destDef);
    _dest = d;
    if (bb) destDef = _dest->addDef(bb, (Node*)this);
  }
  
  PReg* BasicNode::src() {
    if (!hasSrc()) fatal("has no src");
    return _src;
  }

  oop AssignNode::constantSrc() {
    assert(hasConstantSrc(), "no constant src");
    return ((ConstPReg*)_src)->constant;
  }

  BB* PNode::newBB() {
    if (_bb) return _bb;        // already has a BB
    fint len = 0;
    _bb = new BB(this, this, 1);     
    Node *n;
    for (n = this; !n->endsBB() && n->next(); n = n->next()) {
      n->_num = len++; n->_bb = _bb;
    }
    n->_num = len++; n->_bb = _bb;
    _bb->last = n;
    _bb->nnodes = len;
    return _bb;
  }

  MergeNode::MergeNode(Node* prev1, Node* prev2) :
    AbstractMergeNode(prev1, prev2) { _isLoopHead = didStartBB = false; 
                                       why = "beats me"; }
  MergeNode::MergeNode(const char* w) { _isLoopHead = didStartBB = false; 
                                  why = w;
  }

  BB* MergeNode::newBB() {
    if (_bb) {
      // already constructed BB
    } else {
      _bb = PNode::newBB();
    }
    return _bb;
  }
  
  void MergeNode::eliminateUnreachableNodes() {
    for (  int32 i = nPredecessors() - 1;  i >= 0;  --i ) {
      Node* n= prev(i);
      if (!n->isReachable())
        n->removeNext(this);
    }
  }

  MethodReturnNode::MethodReturnNode(fint o, bool hsf, PReg* r)
  : ReturnNode(r, new TempPReg(theNodeGen->currentScope(), ResultReg,
                               false, false)) {
    offset = o; haveStackFrame = hsf; NODE_COST(MethodReturnNode);
  }

  MergeNode* CallNode::nlrPoint() {
    if (nSuccessors() > 1) {
      assert(next1()->isMergeNode(), "should be a merge");
      return (MergeNode*)next1();
    } else {
      return NULL;
    }
  }

  CallNode::CallNode(MergeNode* n, fint nargs, PRegBList* e, SplitSig* s) {
    if (n) append1(n); exprStack = e; argc = nargs; sig = s;
    _dest = new SAPReg(scope(), ResultReg, false, false, _bci, _bci);
  }

  SendNode::SendNode(LookupType lt, oop s, oop d, oop m,
                     MergeNode* n, fint arg_c, PRegBList* e, SplitSig* sg)
  : CallNode(n, arg_c, e, sg) {
    l = lt; sel = s; del = d; mh = m;
    assert(exprStack, "should have expr stack");
    NODE_COST(SendNode);  }

  RegisterString CallNode::mask() {
    RegisterString m = scope()->mask(bci());
    fint stackLocs = theSIC->stackLocCount;
    fint nonRegisterArgs = theSIC->nonRegisterArgCount();
    if (exprStack) {
      for (fint i = exprStack->length() - 1; i >= 0; i--) {
        PReg* r = exprStack->nth(i);
        assert(r->isLiveAt(this), "expr stack elem not live");
        m |= registerMaskBit(r->loc, stackLocs, nonRegisterArgs);
      }
    }
    // add split regs
    for (SCodeScope* s = scope(); s; s = s->sender()) {
      for (fint i = s->splitRegs->length() - 1; i >= 0; i--) {
        PReg* r = s->splitRegs->nth(i);
        if (r->isLiveAt(this)) {
          m |= registerMaskBit(r->loc, stackLocs, nonRegisterArgs);
        }
      }
    }
    // mark ExtraArgRegisters if more than NumArgRegisters-1 args
    // (the -1 is for the receiver, therefore the <= below)
    for (fint i = NumRcvrAndArgRegisters; i <= argc; i++) {
      m |= registerMaskBit(ArgLocation(i), stackLocs, nonRegisterArgs);
    }
    return m;
  }

  PrimNode::PrimNode(PrimDesc* d, MergeNode* n, fint arg_c, PRegBList* e,
                     SplitSig* sg, BlockPReg* failBlock)
  : CallNode(n, arg_c, e, sg) {
    pd = d; primFailBlock = failBlock;
    assert(!failBlock || failBlock->primFailBlockScope,
           "should have primFailBlockScope");
    assert(pd->needsNLRCode() || n == NULL, "no NLR target needed");
    if (d->canScavenge()) {
      assert(e, "should have expr stack");
    } else {
      // the expression stack is only needed if the primitive can walk the
      // stack (then the elements will be debug-visible) or if the primitive
      // can scavenge (then the elems must be allocated to GCable regs)
      exprStack = NULL;        
    }
    NODE_COST(PrimNode);
  }

  RegisterString PrimNode::mask() {
    RegisterString m = CallNode::mask();
    if (primFailBlock && primFailBlock->loc != UnAllocated) {
      // a primFailBlock is live only in the failure branch, i.e. it is *not*
      // live at the call point
      // (the register is maked live for this bci because there is no
      // distinction between the prim call and the failure call -- both
      // have the same bci)
      fint stkLocs   = theSIC->stackLocCount;
      fint nonRegisterArgs = theSIC->nonRegisterArgCount();
      int32 bit = registerMaskBit(primFailBlock->loc, stkLocs, nonRegisterArgs);
      assert(!bit  ||  m & bit, "should be set if is a register");
      m &= ~bit;
    }
    return m;
  }

  UncommonNode::UncommonNode(PRegBList* e, bool r) {
    exprStack = e; restartSend = r; NODE_COST(UncommonNode);
  }

  bool PrimNode::hasSideEffects() {
    return pd->cantBeMovedOrCut() 
    ||     pd->canFail() 
    ||     PNode::hasSideEffects();
  }

  void ConstInitNode::addConstant(ConstPReg* r) {
    assert(!constants.contains(r), "shouldn't be there");
    constants.append(r);
  }

  // uplevel-read vars have to be flushed to the stack after each def
  // (block nodes and array at/atPut handle the flushing themselves)
  // performance bug: FlushNode should have backptr to def node so that
  // it can be eliminated when def gets eliminated  -- fix this

  void BasicNode::addFlushNode(FlushNode* n) {
    bb()->addAfter((Node*)this, n);
  }

  void FlushNode::addFlushNode(FlushNode* n) { Unused(n); } // break recursion
  void BlockCloneNode::addFlushNode(FlushNode* n) { Unused(n); }
  void BlockZapNode::addFlushNode(FlushNode* n) { Unused(n); }

  void AbstractArrayAtNode::addFlushNode(FlushNode* n) {
    if (n->src() == error) {
      // flush along failure branch
      Node* n1 = next1();
      assert(n1->isTrivial(), "unexpected node");
      n1->bb()->addAfter(n1, n);
    } else {
      assert(n->src() == dest(), "what is being defined?");
      BasicNode::addFlushNode(n);
    }
  }

  // cloning: copy the node during splitting
  // only need to copy the basic state; defs, uses etc haven't yet been 
  // computed
  Node* BasicNode::copy(PReg* from, PReg* to) {
    Node* c = clone(from, to);
    if (c) { c->_scope = _scope; c->_bci = _bci; }
    return c;
  }
  Node* PrologueNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* NonLocalReturnNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* MethodReturnNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* BranchNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* TBranchNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* TypeTestNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* IndexedBranchNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* DeadBlockNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* DeadEndNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  Node* RestartNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }
  // flush nodes are created after splitting, so they can't ever be cloned
  Node* FlushNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    ShouldNotCallThis(); return NULL; }

# define TRANSLATE(s) ((s == from) ? to : s)

  Node* ConstInitNode::clone(PReg* from, PReg* to) {
    // need to remember all copies of a ConstInitNode so that the scope can
    // add the constants to be initialized to all copies; otherwise, only
    // one branch of a split would initialize the constant regs
    Unused(from); Unused(to);
    ConstInitNode *n, *newNode = new ConstInitNode;
    for ( n = this;  n->nextCopy;  n = n->nextCopy) 
      ;
    n->nextCopy = newNode;
    return newNode;
  }
  Node* MergeNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to); return NULL; }
  Node* LoadOffsetNode::clone(PReg* from, PReg* to) {
    return new LoadOffsetNode(base, offset, TRANSLATE(_dest)); }
  Node* LoadIntNode::clone(PReg* from, PReg* to) {
    return new LoadIntNode(value, TRANSLATE(_dest)); }
  Node* LoadStackNode::clone(PReg* from, PReg* to) {
    return new LoadStackNode(TRANSLATE(frame), nm, nd,
                             TRANSLATE(_dest), name);
  }
  Node* StoreOffsetNode::clone(PReg* from, PReg* to) {
    return new StoreOffsetNode(TRANSLATE(_src), base, offset, needCheckStore);}
  Node* StoreStackNode::clone(PReg* from, PReg* to) {
    return new StoreStackNode(TRANSLATE(_src), TRANSLATE(frame), nm,
                              nd, name);
  }
  Node* AssignNode::clone(PReg* from, PReg* to) {
    return new AssignNode(TRANSLATE(_src), TRANSLATE(_dest)); }
  Node* ArithRRNode::clone(PReg* from, PReg* to) {
    return new ArithRRNode(op, TRANSLATE(_src), oper, TRANSLATE(_dest)); }
  Node* TArithRRNode::clone(PReg* from, PReg* to) {
    return new TArithRRNode(op, TRANSLATE(_src), oper, TRANSLATE(_dest),
                            arg1IsInt, arg2IsInt);
  }
  Node* ArithRCNode::clone(PReg* from, PReg* to) {
    return new ArithRCNode(op, TRANSLATE(_src), oper, TRANSLATE(_dest)); }
  Node* SendNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    // NB: use current split signature, not the receiver's sig!
    SendNode* n =
      new SendNode(l, sel, del, mh, nlrPoint(), argc, exprStack,
                   theSIC->splitSig);
    n->_dest = _dest;       // don't give it a new dest!
    return n;
  }
    
  Node* PrimNode::clone(PReg* from, PReg* to) {
    // NB: use scope's current sig, not the receiver's sig!
    PrimNode* n = new PrimNode(pd, nlrPoint(), argc, exprStack, scope()->sig, 
                               (BlockPReg*)TRANSLATE(primFailBlock));
    assert(_dest != from, "shouldn't change dest");
    n->_dest = _dest;       // don't give it a new dest!
    return n;
  }
  Node* InterruptCheckNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    // NB: use scope's current sig, not the receiver's sig!
    Node* n = new InterruptCheckNode(exprStack, scope()->sig);
    assert(_dest != from, "shouldn't change dest");
    n->_dest = _dest;       // don't give it a new dest!
    return n;
  }
  Node* BlockCloneNode::clone(PReg* from, PReg* to)  {
    // NB: use scope's current sig, not the receiver's sig!
    Node* n = new BlockCloneNode((BlockPReg*)TRANSLATE(block()), scope()->sig,
                                 clonePrimFailBlock);    
    assert(_dest != from, "shouldn't change dest");
    n->_dest = _dest;       // don't give it a new dest!
    return n;
  }
  Node* BlockCreateNode::clone(PReg* from, PReg* to) {
    // NB: use scope's current sig, not the receiver's sig!
    Node* n = new BlockCreateNode((BlockPReg*)TRANSLATE(block()), scope()->sig);
    assert(_dest != from, "shouldn't change dest");
    n->_dest = _dest;       // don't give it a new dest!
    return n;
  }
  Node* BlockZapNode::clone(PReg* from, PReg* to)    {
    return new BlockZapNode((BlockPReg*)TRANSLATE(block())); }

  Node* ArrayAtNode::clone(PReg* from, PReg* to) {
    return new ArrayAtNode(TRANSLATE(_src), TRANSLATE(arg), intArg,
                           TRANSLATE(_dest), TRANSLATE(error),
                           dataOffset);
  }
  Node* ByteArrayAtNode::clone(PReg* from, PReg* to) {
    return new ByteArrayAtNode(TRANSLATE(_src), TRANSLATE(arg), intArg,
                               TRANSLATE(_dest), TRANSLATE(error));
  }
  Node* ArrayAtPutNode::clone(PReg* from, PReg* to) {
    return new ArrayAtPutNode(TRANSLATE(_src), TRANSLATE(arg), intArg,
                              TRANSLATE(elem), TRANSLATE(_dest),
                              TRANSLATE(error), dataOffset);
  }
  Node* ByteArrayAtPutNode::clone(PReg* from, PReg* to) {
    return new ByteArrayAtPutNode(TRANSLATE(_src), TRANSLATE(arg),
                                  intArg, TRANSLATE(elem), intElem,
                                  TRANSLATE(_dest), TRANSLATE(error));
  }
  Node* UncommonNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);
    return new UncommonNode(exprStack, restartSend); }

  Node* MarkerNode::clone(PReg* from, PReg* to) {
    // code containing a marker is split
    // NB: use scope's current sig, not the receiver's sig!
    Unused(from); Unused(to);
    return new MarkerNode(exprStack, scope()->sig);
  }

  Node* InlinedReturnNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);  return NULL; }
  Node* InlinedNonLocalReturnNode::clone(PReg* from, PReg* to) {
    Unused(from); Unused(to);  return NULL; }
  Node* NopNode::clone(PReg* from, PReg* to) { 
    Unused(from); Unused(to);  return NULL; }
  Node* CommentNode::clone(PReg* from, PReg* to) { 
    Unused(from); Unused(to);  return NULL; }

  // makeUses: construct all uses and defs
  
  void PrologueNode::makeUses(BB* bb) {
    if (isAccessMethod) return;
    // build initial def of incoming args & self
    SCodeScope* s = scope();
    bb->addDef(this, s->receiver->preg());
    if (s->isBlockScope()) bb->addDef(this, s->self->preg());
    for (fint i = 0; i < s->nslots; i++) {
      if (s->args[i]) bb->addDef(this, s->args[i]->preg());
    }
  }    
  
  // removeUses: remove all uses and defs

  void AbstractArrayAtPutNode::removeUses(BB* bb) {
    elem->removeUse(bb, elemUse);
    AbstractArrayAtNode::removeUses(bb);
  }
  
  void CallNode::removeUses(BB* bb) {
    _dest->removeDef(bb, destDef);
    PNode::removeUses(bb);
  }


  // The receiver has been disconnected from its predecessor.
  // Go forward and remove everything reachable only from it.
  // (If it has other predecessors, do nothing.)
  
  // Note: this works for today's restart because the backwards
  // branch is not a normal predecessor of the merge; the restart
  // node just points back to the loop head node.
  // Now not having an explicit link would screw up copy propagation
  // of locals, but locals are not cp'ed anyway. And nothing else
  // survives a restart. -- dmu & urs 8/96
  
  void BasicNode::removeUpToMerge() {
    BB* thisBB = _bb;
    Node* n = (Node*)this;
    
    if ( n->nPredecessors() > 0  ) {
      assert(  n->isMergeNode(),
               "To get here, node must have been unlinked from"
               " some other node, yet have remaining preds."
               " Only merge should have multiple preds.");
      return; // cannot remove, needed by other node
    }
      
    for ( n = (Node*)this; 
          n 
     &&   n->hasSinglePredecessor() // cannot elim if other nodes need n
     &&  !n->isLoopHead(); // hasSinglePred does not count backwards branches
         ) {
      while (n->nSuccessors() > 1) {
        fint i = n->nSuccessors() - 1;
        Node* succ = n->nexti(i);
        n->removeNext(succ);
        succ->removeUpToMerge();
      }
      Node* nextn = n->next();
      if (!n->deleted) n->eliminateNodeAndUsedPRs(thisBB, NULL, true);
      if (nextn) {
        BB* nextBB = nextn->bb();
        if (nextBB != thisBB) {
          if (nextBB->isPredecessor(thisBB)) {
            // cut the link between thisBB and nextBB
            thisBB->removeNext(nextBB);
          }
          if (nextn->nPredecessors() >= 2) {
            // also remove n's successor so that we can delete past merges
            // if all incoming branches of the merges are deleted
            n->removeNext(nextn);
            // nextn had at least 2 predecessors, so must stop deleting here
            // NB: must break here -- if was 2 successors, will now be one
            // and loop would continue (was a bug)  -Urs 8/94
            assert(nextn->isMergeNode(), "oops");
            break;
          }
          thisBB = nextBB;
        }
      }
      n = nextn;
    }
    BB* nextBB = n ? n->bb() : NULL;
    if (nextBB && nextBB != thisBB && nextBB->isPredecessor(thisBB)) {
      // cut the link between thisBB and nextBB
      thisBB->removeNext(nextBB);
    }
  }

  void PrimNode::eliminateNode(BB* bb, PReg* r, bool rem, void* misc) {
    assert(!deleted, "eliminateNodeAndUsedPRs should have caught this");
    assert(rem || !hasSideEffects(), "shouldn't call");
    Node* np = nlrPoint();
    if (np) {
      _nxt->pop();              // remove nlrPoint
      assert(nlrPoint() == NULL, "should be NULL now");
      np->removePrev(this);     // and unlink the pred pointer
    }
    CallNode::eliminateNode(bb, r, rem, misc); 
    // remove all unused nodes along NLR branch
    // performance bug: should also remove computation of args
    // (not done today because %o0 etc have incorrectDU)
    if (np) {
      // must not call removeUpToMerge before CallNode::eliminateNode
      //  because CallNode::elim... will set deleted() predicate
      //  on some nodes and this must be set before nlrPoint->remove...
      np->removeUpToMerge(); 
    }
  }

  // override this to use misc arg to select which type to NOT eliminate
  
  void TypeTestNode::eliminateNode(BB* bb, PReg* r, bool rem, 
                                   void* misc) {
    Unused(rem);
    if (deleted) return;
    mapOop m = mapOop(NULL);
    assert( !m->is_map(),
            "Since NULL is default value of misc, it had better not" 
            "look like a mapOop" );
    assert( misc == NULL  ||  mapOop(misc)->is_map(), "better be a mapOop");
    mapOop theMap = misc == NULL  ?  mapOop(badOop)  :  mapOop(misc);
    // completely eliminate receiver and all successors
    eliminateAllBut(bb, r, (ConstPReg*)NULL, theMap);    
    AbstractBranchNode::eliminateNode(bb, r, true, misc);
  }
  


  // If you need to call this routine, call eliminateNodeAndUsedPRs.
  // That will call eliminateNode, which will call this routine.
  // Then that will call checkUses so that the PR's defs get scorched. -- dmu
    
  void TypeTestNode::eliminateAllBut(BB* bb, PReg* r, ConstPReg* c,
                                     mapOop theMap) {
    // remove node and all successor branches (except for one if rcvr is known)
#    if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
       bool unknownDead = false;
       for (Node* nn = next();  nn; nn = nn->next()) {
         if (nn->isDeadEndNode()) {unknownDead = true; break;}
         if (nn->nSuccessors() != 1)
           break;
         if (nn->isExitNode() && !nn->deleted)
           break;
       }
       if ( theMap == (mapOop)badOop && unknownDead) 
         fatal("about to remove all good cases");
       Node* k = NULL;
       for (fint i = 0;  i < _nxt->length(); i++) {
         if ( c && c->constant == maps->nth(i)  ||  theMap == maps->nth(i)
         || maps->nth(i)->map() == theMap->map_addr())
           if (k) fatal(">1");
           else k = _nxt->nth(i);
       }
       if ( unknownDead && !k) fatal("about to remove all good cases");
    }
#   endif
    
    NodeBList* successors = _nxt;
    _nxt = new NodeBList(1);
    oop constant = c ? c->constant : 0;
    Node* keep = NULL;
    if (PrintSICEliminateUnneededNodes) {
      lprintf("*eliminating tt node %#lx const %#lx map %#lx\n",
              this, constant, theMap);
    }
    Node* un = next();          // save unknown branch
       
    // remove all successor nodes
    for (fint i = 0; i < successors->length(); i++) {
      Node* succ = successors->nth(i);
      succ->removePrev(this);
      oop m = maps->nth(i);
      if ( (c && constant == m)          // have a constant
      ||   theMap == m                 // have a map, found it
      ||   m->map() == theMap->map_addr()  // have an oop, looking for a map
         ) {
        assert(keep == NULL, "shouldn't have more than one match");
        keep = succ;
      } else {
        succ->removeUpToMerge();
      }
    }

    if (keep || theMap == mapOop(badOop)) {
      // found correct prediction, so can delete unknown branch, or
      // delete everything (theMap == badOop)
      removeNext(un);
      un->removeUpToMerge();    // delete unknown branch
    } else {
      // the type tests didn't predict for theMap (e.g. programming change)
      // (performance bug: should inline correct case since it's known now;
      // also, unknown branch may be uncommon)
      if (WizardMode) {
        warning1("SIC: typetest didn't predict map %#lx", theMap);
        lprintf("predicted maps: ");
        maps->print();
      }
    }
    assert(this == bb->last, "should end my BB");
    
    // remove bb links
    while (bb->nSuccessors() > 0) {
      bb->removeNext(bb->nexti(bb->nSuccessors() - 1));
    }

    if (keep) {
      // append remaining case as fall-through
      append(keep);
      bb->append(keep->bb());
    }
  }
    

  void TypeTestNode::eliminateUnnecessary(mapOop m) {
    // eliminate unnecessary type test: receiver is known to have map m
    eliminateNodeAndUsedPRs(bb(), NULL, NULL, (void*)m);
  }


  // override this to use misc arg to select which type to NOT eliminate
  
  void IndexedBranchNode::eliminateNode(BB* bb, PReg* r, bool rem, 
                                        void* misc) {
    Unused(rem);
    if (deleted) return;
    // if misc not null, source is known to be a constant, misc is the oop
    oop constSrc = misc == NULL  ?  badOop  :  ((ConstPReg*)misc)->constant;
    // completely eliminate receiver and all successors
    eliminateAllBut(bb, r, constSrc);    
    AbstractBranchNode::eliminateNode(bb, r, true, misc);
  }
  
  
  // see comment for TypeTestNode::eliminateAllBut
  
  void IndexedBranchNode::eliminateAllBut(BB* bb, PReg* r,
                                          oop constSrc) {
    // remove node and all successor branches (except for one )
    // derived from TypeTestNode::eliminateAllBut -- dmu
    
    NodeBList* successors = _nxt;
    _nxt = new NodeBList(1);
    Node* keep = NULL;
    if (PrintSICEliminateUnneededNodes) {
      lprintf("*eliminating indexed branch node %#lx oop %#lx\n",
              this, constSrc);
    }
    Node* un = next();          // save unknown branch
    assert(un, "must have unknown case");
    // remove all successor nodes
    for (fint i = 0; i < successors->length(); i++) {
      Node* succ = successors->nth(i);
      succ->removePrev(this);
      if (constSrc == as_smiOop(i)) {
        assert(keep == NULL, "shouldn't have more than one match");
        keep = succ;
      } else {
        succ->removeUpToMerge();
      }
    }

    if (keep || constSrc == badOop) {
      // found correct prediction, so can delete unknown branch, or
      // delete everything (constSrc == badOop)
      removeNext(un);           // unlink it
      un->removeUpToMerge();    // delete unknown branch
    } 
    assert(this == bb->last, "should end my BB");

    // remove bb links
    while (bb->nSuccessors() > 0) {
      bb->removeNext(bb->nexti(bb->nSuccessors() - 1));
    }

    if (keep) {
      // append remaining case as fall-through
      append(keep);
      bb->append(keep->bb());
    }
  }


  void AbstractArrayAtNode::eliminateNode(BB* bb, PReg* r, 
                                          bool rem, void* misc) {
    UsedOnlyInAssert(rem);
    assert(rem, "shouldn't eliminate because of side effects (errors)");
    // (It seems to me that despite the above assert, if it could be
    //  established that this operation could never fail, it could be
    //  eliminated if its result were unused. So the assert above
    //  may be bogus.) -- dmu 8/96
    assert(!deleted, "eliminateNodeAndUsedPRs should have caught this");
    // remove fail branch nodes first
    Node* fail = next1();
    // next1 returns NULL if there is no next1
    // NULL test inserted by dmu 4/26/96 to fix a bug
    if (fail != NULL) {
      // eliminateNode assumes single succ, so remove fail first
      fail->removePrev(this); 
    }
    AbstractBranchNode::eliminateNode(bb, r, rem, misc);
    if (fail)
      fail->removeUpToMerge(); // do this AFTER deleted is set by above call
  }

  
  void FlushNode::eliminateNode(BB* bb, PReg* r, bool rem, void* misc) {
    assert(!deleted, "eliminateNodeAndUsedPRs should have caught this");
    // flush nodes are never really eliminated; if the original reg is
    // copy-propagated away, we need to flush another register, but we still
    // need to flush
    if (eliminated) return;
    
    if (rem)  // really remove
      PNode::eliminateNode(bb, r, rem, misc);
    else // see comment above
      removeUses(bb);
  }
  
  
  void FlushNode::eliminateNodeAndUsedPRs(BB* bb, PReg* r, bool rem, void* misc) {
    if (deleted) return;
    PNode::eliminateNodeAndUsedPRs(bb, r, rem, misc);
    eliminated = true;
  }


  void BranchNode::eliminateBranch(int32 op1, int32 op2, int32 res) {
    // the receiver can be eliminated because the result it is testing
    // is a constant (res)
    bool ok;
    switch (op) {
     case ALBranchOp:   ok = true;              break;
     case EQBranchOp:   ok = op1 == op2;        break;
     case NEBranchOp:   ok = op1 != op2;        break;
     case LTBranchOp:   ok = op1 <  op2;        break;
     case LEBranchOp:   ok = op1 <= op2;        break;
     case GTBranchOp:   ok = op1 >  op2;        break;
     case GEBranchOp:   ok = op1 >= op2;        break;
     case LTUBranchOp:  ok = (unsigned)op1 <  (unsigned)op2;    break;
     case LEUBranchOp:  ok = (unsigned)op1 <= (unsigned)op2;    break;
     case GTUBranchOp:  ok = (unsigned)op1 >  (unsigned)op2;    break;
     case GEUBranchOp:  ok = (unsigned)op1 >= (unsigned)op2;    break;
     case VSBranchOp:   return;         // can't handle yet
     case VCBranchOp:   return;         // can't handle yet
     default:           fatal("unexpected branch type");
                      }
    fint nodeToRemove;
    if (ok) {
      nodeToRemove = 0; // branch is taken
    } else {
      nodeToRemove = 1;
    }

    // discard one successor 
    Node* discard = nexti(nodeToRemove);
    removeNext(discard);
    discard->removeUpToMerge();
    Node* succ = nexti(1 - nodeToRemove);
    removeNext(succ);
    
    // check that if I am deleted, the right node will be next
    // This check is conservative in that it does not exactly duplicate
    // algorithm used by BB::gen
    Node* nn = this;
    do {
       nn =  nn->bb()->last != nn
               ?  nn->next()
               : (nn->bb()->next()
                    ?  nn->bb()->next()->first
                    :  NULL);
    } while ( nn  &&  nn != succ &&  nn->deleted); 
    if ( nn == succ ) {
      //  make the remaining one the fall-thru case
      append(succ);
      bb()->remove(this); // delete the branch    
    }
    else {
      // fall-thru not guaranteed; use a branch
      op = ALBranchOp; // cannot just delete me 
      append(discard); 
      append1(succ);
    }
  }
  
  // copy propagation: replace a use by another use; return false if
  // unsuccsessful

# define CP_HELPER(_src, srcUse)                                              \
    /* live range must be correct - otherwise reg. allocation breaks   */     \
    /* (even if doing just local CP - could fix this by checking for   */     \
    /* local conflicts when allocating PRegs, i.e. keep BB alloc info) */     \
    if (replace || d->extendLiveRange((Node*)this)) {                         \
      _src->removeUse(bb, srcUse);                                            \
      _src = d;                                                               \
      srcUse = _src->addUse(bb, (Node*)this);                                 \
      return true;                                                            \
    } else {                                                                  \
      return false;                                                           \
    }
  
  bool BasicNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    assert(canCopyPropagate(), "can't cp");
    assert(hasSrc(), "has no src");
    if (srcUse == u) {
      CP_HELPER(_src, srcUse);
    } else {
      fatal("copyPropagate: not the source use");
    }
    return false;
  }
  
  bool LoadOffsetNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == baseUse) {
      // minor performance bug: prev. node should probably be deleted
      // (loads base reg) - eliminateUnneeded doesn't catch it - fix this
      // (happens esp. if d is a constant)
      CP_HELPER(base, baseUse);
    } else {
      return LoadNode::copyPropagate(bb, u, d, replace);
    }
    return false;
  }

  bool LoadStackNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == frameUse) {
      CP_HELPER(frame, frameUse);
    } else {
      return LoadNode::copyPropagate(bb, u, d, replace);
    }
    return false;
  }

  bool StoreOffsetNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == baseUse) {
      CP_HELPER(base, baseUse);
    } else {
      return StoreNode::copyPropagate(bb, u, d, replace);
    }
    return false;
  }

  bool StoreStackNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == frameUse) {
      CP_HELPER(frame, frameUse);
    } else {
      return StoreNode::copyPropagate(bb, u, d, replace);
    }
    return false;
  }

  bool TBranchNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    bool haveFailure = !(intRcvr && intArg);
    bool res = doCopyPropagate(bb, u, d, replace);
    if (intArg && intRcvr && haveFailure) {
      assert(res, "CP must have worked");
      // failure branch has been eliminated through CP - remove the nodes
      Node* fail = _nxt->pop();
      fail->removePrev(this);
      fail->removeUpToMerge();
    }
    return res;
  }

  bool TBranchNode::doCopyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == srcUse) {
      if (d->isConstPReg() && ((ConstPReg*)d)->constant->is_smi())
        intRcvr = true;
      CP_HELPER(_src, srcUse);
    } else if (u == argUse) {
      if (d->isConstPReg() && ((ConstPReg*)d)->constant->is_smi())
        intArg = true;
      CP_HELPER(arg, argUse);
    } else {
      fatal("copyPropagate: not the source use");
    }
    return false;
  }

  bool  ArithRRNode::operIsConst() { return oper->isConstPReg(); }
  int32 ArithRRNode::operConst()   {
    assert(operIsConst(), "not a constant");
    return int32(((ConstPReg*)oper)->constant); }
  
  bool ArithNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    bool success = doCopyPropagate(bb, u, d, replace);
    if (_src->isConstPReg() && operIsConst()) {
      assert(success, "CP must have worked");
      // can constant-fold this operation
      int32 c1 = (int32)((ConstPReg*)_src)->constant;
      int32 c2 = (int32)operConst();
      int32 res;
      bool cc = false;
      switch (op) {
       case AddCCArithOp:               
        cc = true;      // fall through
       case AddArithOp:
        res = c1 + c2; break;

       case AndCCArithOp:               
        cc = true;      // fall through
       case AndArithOp:         
        res = c1 & c2; break;

       case OrCCArithOp:                
        cc = true;      // fall through
       case OrArithOp:          
        res = c1 | c2; break;

       case XOrArithOp:
        res = c1 ^ c2; break;

       case SubCCArithOp:               
        cc = true;      // fall through
       case SubArithOp:
        res = c1 - c2; break;

       default: return success;         // can't constant-fold
      }

      hasSideEffects_now = false;
      if (cc) {
        // condition codes set -- see if there's a branch we can eliminate
        assert(dest()->isNoPReg(), "shouldn't use result");
        Node* branch = next();
        if (branch->isBranchNode()) {
          eliminateNodeAndUsedPRs(_bb, NULL, true);    // delete comparison
          ((BranchNode*)branch)->eliminateBranch(c1, c2, res);
        }
      } else {
        constResult = new_ConstPReg(scope(), (oop)res);
        // enable further constant propagation of the result
        _src->removeUse(bb, srcUse);
        _src = constResult;
        srcUse = bb->addUse(this, _src);
      }
    }
    return success;
  }

  bool ArithNode::doCopyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    return PNode::copyPropagate(bb, u, d, replace);
  }
  
  bool ArithRRNode::doCopyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == operUse) {
      CP_HELPER(oper, operUse);
    } else {
      return ArithNode::doCopyPropagate(bb, u, d, replace);
    }
    return false;
  }
  
  bool TArithRRNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    bool res = doCopyPropagate(bb, u, d, replace);
    if (_src->isConstPReg() && oper->isConstPReg()) {
      assert(res, "CP must have worked");
      // can constant-fold this operation
      oop c1 = ((ConstPReg*)_src)->constant;
      oop c2 = ((ConstPReg*)oper)->constant;
      oop result;
      switch (op) {
       case TAddCCArithOp:      result = smi_add_prim((smiOop)c1, (smiOop)c2); break;
       case TSubCCArithOp:      result = smi_sub_prim((smiOop)c1, (smiOop)c2); break;
       case TMulCCArithOp:      result = smi_mul_prim((smiOop)c1, (smiOop)c2); break;
       case TDivCCArithOp:      result = smi_div_prim((smiOop)c1, (smiOop)c2); break;
       case TModCCArithOp:      result = smi_mod_prim((smiOop)c1, (smiOop)c2); break;
       
       case TALShiftCCArithOp:  result = smi_arithmetic_shift_left_prim((smiOop)c1, (smiOop)c2); break;
       case TARShiftCCArithOp:  result = smi_logical_shift_left_prim(   (smiOop)c1, (smiOop)c2); break;
       case TLLShiftCCArithOp:  result = smi_logical_shift_left_prim((   smiOop)c1, (smiOop)c2); break;
       case TLRShiftCCArithOp:  result = smi_logical_shift_right_prim(  (smiOop)c1, (smiOop)c2); break;

       case TAndCCArithOp:  result = smi_and_prim((smiOop)c1, (smiOop)c2); break;
       case TOrCCArithOp:   result = smi_or_prim(( smiOop)c1, (smiOop)c2); break;
       case TXorCCArithOp:  result = smi_xor_prim((smiOop)c1, (smiOop)c2); break;
       
       default:
        fatal1("unknown tagged opcode %ld", op);
      }
      bool ok = !result->is_mark();
      if (ok) {
        // constant-fold this operation
        constResult = new_ConstPReg(scope(), result);
        Node* discard = next1();
        removeNext(discard);
        discard->bb()->remove(discard);
        discard->removeUpToMerge();
#       if GENERATE_DEBUGGING_AIDS
          if (CheckAssertions) {
            bb->verify();
            ((BB*)bb->next())->verify();
          }
#       endif
        // enable further constant propagation of the result
        hasSideEffects_now = false;
        _src->removeUse(bb, srcUse);
        _src = constResult;
        srcUse = bb->addUse(this, _src);
      } else {
        // for now, can't constant-fold failure - can't use marks in ConstPReg
      }
    }
    return res;
  }

  bool TArithRRNode::doCopyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == srcUse) {
      if (d->isConstPReg() && ((ConstPReg*)d)->constant->is_smi())
        arg1IsInt = true;
      CP_HELPER(_src, srcUse);
    } else if (u == operUse) {
      if (d->isConstPReg() && ((ConstPReg*)d)->constant->is_smi())
        arg2IsInt = true;
      CP_HELPER(oper, operUse);
    } else {
      fatal("copyPropagate: not the source use");
    }
    return false;
  }
  
  bool TypeTestNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == srcUse) {
      if (d->isConstPReg()) {
        // we know the receiver - the type test is unnecessary!
        ConstPReg* c = (ConstPReg*)d;
        eliminateNodeAndUsedPRs(bb, NULL, false, c->constant->map()->enclosing_mapOop());
        return true;
      } else {
        CP_HELPER(_src, srcUse);
      }
    } else {
      fatal("don't have this use");
    }
    return false;
  }
  
  bool IndexedBranchNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == srcUse) {
      if (d->isConstPReg()) {
        // we know the receiver - the branch is unnecessary!
        ConstPReg* c = (ConstPReg*)d;
        eliminateNodeAndUsedPRs(bb, NULL, false, c);
        return true;
      } else {
        CP_HELPER(_src, srcUse);
      }
    } else {
      fatal("don't have this use");
    }
    return false;
  }
  
  bool AbstractArrayAtNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (u == argUse) {
      CP_HELPER(arg, argUse);
    } else {
      return BasicNode::copyPropagate(bb, u, d, replace);
    }
    return false;
  }

  bool AbstractArrayAtPutNode::copyPropagate(BB* bb, PUse* u, PReg* d,
                                             bool replace) {
    if (u == argUse) {
      CP_HELPER(arg, argUse);
    } else if (u == elemUse) {
      CP_HELPER(elem, elemUse);
    } else {
      return BasicNode::copyPropagate(bb, u, d, replace);
    }
    return false;
  }

  bool FlushNode::copyPropagate(BB* bb, PUse* u, PReg* d, bool replace) {
    if (replace && u == srcUse) {
      CP_HELPER(_src, srcUse);
    }
    return false;
  }

  inline void computeExposedBlocks(PReg* src, BlockPRegBList* l) {
    if (src->isBlockPReg()) {
      BlockPReg* r = (BlockPReg*)src;
      r->markEscaped();
      if (!l->contains(r)) l->append(r);
    }
  }
  
  void ArrayAtPutNode::computeExposedBlocks(BlockPRegBList* ll) {
    ::computeExposedBlocks(elem, ll);
  }

  void StoreNode::computeExposedBlocks(BlockPRegBList* ll) {
    ::computeExposedBlocks(_src, ll);
  }

  void ReturnNode::computeExposedBlocks(BlockPRegBList* ll) {
    if (_src) ::computeExposedBlocks(_src, ll);
  }

  void FlushNode::computeExposedBlocks(BlockPRegBList* ll) {
    // A flush of an uplevel-read does not expose a block because the block
    // could have been eliminated completely (i.e. the flush is a nop).
    // If the block wasn't eliminated completely, it must be exposed
    // somewhere else (arg to a real send or a store)
    if (_src->uplevelW) ::computeExposedBlocks(_src, ll);
  }

  // type test elimination
  
  bool BasicNode::endsWithUncommonTrap(Node* n) {
    // does n's basic block end with an uncommon trap?
    BB* bb = n->bb();
    while (n && !n->isUncommonNode() && n->bb() == bb) n = n->next();
    return n && n->isUncommonNode() && n->bb() == bb;
  }

  bool TArithRRNode::isFailureUncommon() {
    Node* n = next1();
    return n && endsWithUncommonTrap(n);
  }

  PReg* TArithRRNode::testedReg(fint n) {
    assert(n == 0, "only one reg tested");
    return oper;
  }

  void TArithRRNode::simplify(PReg* r, oop m) {
    if (r == oper) {
      if (PrintSICTypeTestOpt)
        lprintf("*could optimize tagged arith N%d\n", (void*)id());
      if (m == Memory->smi_map->enclosing_mapOop()) {
        // could eliminate tag check, but it's currently free (SPARC)
      } else {
        // non-int argument - will always fail
        // currently can't optimize much either
      }
    }
  }

  bool TBranchNode::isFailureUncommon() {
    if (nSuccessors() < 3) return true;
    Node* n = nexti(2);
    return n && endsWithUncommonTrap(n);
  }

  PReg* TBranchNode::testedReg(fint n) {
    assert(n == 0, "only one reg tested");
    return arg;
  }

  void TBranchNode::simplify(PReg* r, oop m) {
    if (r == arg) {
      if (PrintSICTypeTestOpt)
        lprintf("*optimizing tagged comparison N%d\n", (void*)id());
      if (m == Memory->smi_map->enclosing_mapOop()) {
        // can eliminate tag check
        intArg = true;
        if (intRcvr && intArg && nSuccessors() > 2) {
          Node* n = nexti(2);
          removeNext(n);
          n->removeUpToMerge();
        }
      } else {
        // non-int argument - will always fail
        // currently can't optimize much
        assert(!intArg, "conflicting type info");
      }
    }
  }

  bool TypeTestNode::isFailureUncommon() {
    Node* n = next();
    return n && hasUnknown && maps->length() == 1 && endsWithUncommonTrap(n);
  }

  oop TypeTestNode::testedType(fint n) {
    assert(n == 0 && maps->length() == 1, "can handle only one type");
    return maps->first();
  }

  void TypeTestNode::simplify(PReg* r, oop m) {
    if (deleted) return;
    if (r == _src) {
      fint i;
      for (i = maps->length() - 1; i >= 0 && maps->nth(i) != m; i--) ;
      if (i < 0) {
        // true type does not appear in our list!
        if (SICDebug) error("possible type misprediction?");
        if (!hasUnknown) fatal("conflicting type information");
        return;
      }
      if (PrintSICTypeTestOpt) lprintf("*eliminating type test N%d\n", (void*)id());
      eliminateUnnecessary(mapOop(m));
    }
  }

  oop IndexedBranchNode::testedType(fint n) {
    assert(n == 0, "only tests one type");
    return Memory->smi_map->enclosing_mapOop();
  }

  void IndexedBranchNode::simplify(PReg* r, oop m) {
    if (r == _src  &&  m == Memory->smi_map->enclosing_mapOop()) {
      if (PrintSICTypeTestOpt)
        lprintf("*optimizing type test of indexed branch N%d\n", (void*)id());
      srcMustBeSmi = true;
    }
  }


  bool AbstractArrayAtNode::isFailureUncommon() {
    Node* n = next1();
    return n && endsWithUncommonTrap(n);
  }

  // arrays: 0 = array, 1 = index, 2 = element
  PReg* AbstractArrayAtNode::testedReg(fint n) {
    assert(n < 2, "bad index");
    return n == 0 ? _src : arg;
  }

  void AbstractArrayAtNode::simplify(PReg* r, oop m) {
    if (r == arg) {
      if (PrintSICTypeTestOpt)
        lprintf("*optimizing array access N%d\n", (void*)id());
      if (m == Memory->smi_map->enclosing_mapOop()) {
        // can eliminate tag check on index
        intArg = true;
      } else {
        // non-int argument - will always fail
        // currently can't optimize much
        assert(!intArg, "conflicting type info");
      }
    }
  }

  oop ArrayAtNode::testedType(fint n) {
    assert(n < 2, "bad index");
    return n == 0 ?
      Memory->objVectorObj->map()->enclosing_mapOop() : Memory->smi_map->enclosing_mapOop();
  }

  oop ByteArrayAtNode::testedType(fint n) {
    assert(n < 2, "bad index");
    return n == 0 ?
      Memory->byteVectorObj->map()->enclosing_mapOop() : Memory->smi_map->enclosing_mapOop();
  }

  oop ArrayAtPutNode::testedType(fint n) {
    assert(n < 2, "bad index");
    return n == 0 ?
      Memory->objVectorObj->map()->enclosing_mapOop() : Memory->smi_map->enclosing_mapOop();
  }

  oop ByteArrayAtPutNode::testedType(fint n) {
    assert(n < 3, "bad index");
    return n == 0 ?
      Memory->byteVectorObj->map()->enclosing_mapOop() : Memory->smi_map->enclosing_mapOop();
  }

  PReg* ByteArrayAtPutNode::testedReg(fint n) {
    assert(n < 3, "bad index");
    switch (n) {
     case 0:    return _src;
     case 1:    return arg;
     case 2:    return elem;
     default:   fatal("bad index");
    }
    return NULL;
  }

  void ByteArrayAtPutNode::simplify(PReg* r, oop m) {
    if (r == elem) {
      if (PrintSICTypeTestOpt)
        lprintf("*optimizing byte array access N%d\n (elem)", (void*)id());
      if (m == Memory->smi_map->enclosing_mapOop()) {
        // can eliminate tag check on index
        intElem = true;
      } else {
        // non-int argument - will always fail
        // currently can't optimize much
        assert(!intElem, "conflicting type info");
      }
    }
    AbstractArrayAtPutNode::simplify(r, m);
  }

  // printing code (for debugging)

  void BasicNode::print_short() { char buf[1024]; lprintf("%s", print_string(buf)); }

  char* PrologueNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf,
              "Prologue %s%s nargs=%d frameSize=%d",
              needToFlushRegWindow ? "flush " : "",
              isAccessMethod ? "access" : "",
              (void*)nargs,
              (void*)thisFrameSize);
    if (printAddr) mysprintf(buf, "      p *(PrologueNode*)%#lx", this);
    return b;
  }

  char* ConstInitNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "ConstInitNode ");
    for (fint i = 0; i < constants.length(); i++) {
      mysprintf(buf, "%s ", constants.nth(i)->name());
    }
    if (printAddr) mysprintf(buf, "    p *(ConstInitNode*)%#lx", this);
    return b;
  }

  char* InterruptCheckNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "InterruptCheckNode");
    if (printAddr) mysprintf(buf, "      p *(InterruptCheckNode*)%#lx", this);
    return b;
  }

  char* LoadOffsetNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "LoadOffset %s[%#lx], %s",
              base->name(),
              (void*)offset,
              _dest->name());
    if (printAddr) mysprintf(buf, "      p *(LoadOffsetNode*)%#lx", this);
    return b;
  }

  char* LoadIntNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "LoadInt %#lx, %s", (void*)value, _dest->name());
    if (printAddr) mysprintf(buf, "      p *(LoadIntNode*)%#lx", this);
    return b;
  }

  char* LoadStackNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "LoadStack %s \"%s\"", frame->name(),
           stringOop(name)->copy_null_terminated());
    // if (nd) nd->print();
    mysprintf(buf, ", %s", _dest->name());
    if (printAddr) mysprintf(buf, "      p *(LoadStackNode*)%#lx", this);
    return b;
  }

  char* StoreOffsetNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "StoreOffset %s, %s[%#lx]",
           _src->name(), base->name(), (void*)offset);
    if (printAddr) mysprintf(buf, "      p *(StoreOffsetNode*)%#lx", this);
    return b;
  }

  char* StoreStackNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "StoreStack %s, %s \"%s\"", frame->name(),
           _src->name(), stringOop(name)->copy_null_terminated());
    // nd->print();
    if (printAddr) mysprintf(buf, "      p *(StoreStackNode*)%#lx", this);
    return b;
  }

  char* AssignNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "%s := %s", _dest->name(), _src->name());
    if (printAddr) mysprintf(buf, "      p *(AssignNode*)%#lx", this);
    return b;
  }
 
  char* SendNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "%s %s NLR %ld ", lookupTypeName(l), selector_string(sel),
           (void*)nlrPoint()->id());
/* too verbose for normal use (line gets too long)
    if (del) mysprintf(buf, "del=%#lx ", del);
    if (mh) mysprintf(buf, "mh=%#lx ", mh);
*/
    if (printAddr) mysprintf(buf, "      p *(SendNode*)%#lx", this);
    return b;
  }
 
  char* PrimNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "PrimCall _%s NLR %ld", pd->name(), (void*)nlrPoint()->id());
    if (printAddr) mysprintf(buf, "      p *(PrimNode*)%#lx", this);
    return b;
  }
 
  char* BlockCloneNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "BlockClone %s", _dest->name());
    if (printAddr) mysprintf(buf, "      p *(BlockCloneNode*)%#lx", this);
    return b;
  }
 
  char* BlockCreateNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "BlockCreate %s", _dest->name());
    if (printAddr) mysprintf(buf, "      p *(BlockCreateNode*)%#lx", this);
    return b;
  }
 
  char* InlinedReturnNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "InlinedReturn");
    if (printAddr) mysprintf(buf, "      p *(InlinedReturnNode*)%#lx", this);
    return b;
  }
 
  char* InlinedNonLocalReturnNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "InlinedNLR");
    if (printAddr) mysprintf(buf, "      p *(InlinedNonLocalReturnNode*)%#lx", this);
    return b;
  }
 
  char* NonLocalReturnNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "NonLocalReturn");
    if (printAddr) mysprintf(buf, "      p *(NonLocalReturnNode*)%#lx", this);
    return b;
  }
 
  char* MethodReturnNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "MethodReturn  %s", _src->name());
    if (printAddr) mysprintf(buf, "      p *(MethodReturnNode*)%#lx", this);
    return b;
  }
 
  const char* ArithNode::opName() { return ArithOpName[op]; }
 
  char* ArithRRNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "%s %s, %s, %s",
           opName(), _src->name(), oper->name(), _dest->name());
    if (printAddr) mysprintf(buf, "      p *(ArithRRNode*)%#lx", this);
    return b;
  }
 
  char* TArithRRNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "%s %s, %s, %s   N%d, N%d",
              ArithOpName[op], _src->name(), oper->name(), _dest->name(),
              (void*)next1()->id(),
              (void*)next()->id());
    if (printAddr) mysprintf(buf, "      p *(TArithRRNode*)%#lx", this);
    return b;
  }
 
  char* ArithRCNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "%s %s, #%#lx, %s",
           opName(), _src->name(), (void*)oper, _dest->name());
    if (printAddr) mysprintf(buf, "      p *(ArithRCNode*)%#lx", this);
    return b;
  }
 
  char* BranchNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "%s  N%ld N%ld",
           BranchOpName[op], (void*)next1()->id(), (void*)next()->id());
    if (printAddr) mysprintf(buf, "      p *(BranchNode*)%#lx", this);
    return b;
  }
 
  char* TBranchNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    Node* n1 = nSuccessors() > 1 ? nexti(1) : NULL;
    Node* n2 = nSuccessors() > 2 ? nexti(2) : NULL;
    mysprintf(buf, "T%s %s %s  N%ld N%ld fail N%ld",
              BranchOpName[op], _src->name(), arg->name(),
              (void*)(n1 ? n1->id() : -1),
              (void*)(next()->id()),
              (void*)(n2 ? n2->id() : -1));
    if (printAddr) mysprintf(buf, "      p *(TBranchNode*)%#lx", this);
    return b;
  }
 
  char* TypeTestNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "TypeTest %s, ", _src->name());
    for (fint i = 1; i <= maps->length(); i++) {
      oop m = maps->nth(i-1);
      if (m == Memory->smi_map->enclosing_mapOop()) mysprintf(buf, "int");
      else if (m == Memory->float_map->enclosing_mapOop()) mysprintf(buf, "float");
      else mysprintf(buf, m->debug_print());
      mysprintf(buf, ": N%ld; ",
                (void*)(nSuccessors() > i ? nexti(i)->id() : -1));
    }
    mysprintf(buf,
              "N%ld%s",
              (void*)(next() ? next()->id() : -1),
              hasUnknown ? "" : "*");
    if (printAddr) mysprintf(buf, "      p *(TypeTestNode*)%#lx", this);
    return b;
  }
 
  char* IndexedBranchNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "IndexedBranch %s, ", _src->name());
    for (fint i = 1;  i <= nCases;  i++) {
      mysprintf(buf, "%d: N%ld; ",
                (void*)i,
                (void*)(nSuccessors() > i ? nexti(i)->id() : -1));
    }
    mysprintf(buf,
              "N%ld%s",
              (void*)(next() ? next()->id() : -1),
              srcMustBeSmi ? "*" : "");
    if (printAddr) mysprintf(buf, "      p *(IndexedBranchNode*)%#lx", this);
    return b;
  }
 
  char* BlockZapNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "BlockZap %s", _dest->name());
    if (printAddr) mysprintf(buf, "      p *(BlockZapNode*)%#lx", this);
    return b;
  }
 
  char* FlushNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "Flush %s", _src->name());
    if (printAddr) mysprintf(buf, "      p *(FlushNode*)%#lx", this);
    return b;
  }

  char* ArrayAtNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "ArrayAt %s[%s], %s",
           _src->name(), arg->name(), _dest->name());
    if (printAddr) mysprintf(buf, "      p *(ArrayAtNode*)%#lx", this);
    return b;
  }
 
  char* ByteArrayAtNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "ByteArrayAt %s[%s], %s",
           _src->name(), arg->name(), _dest->name());
    if (printAddr) mysprintf(buf, "      p *(ByteArrayAtNode*)%#lx", this);
    return b;
  }
 
  char* ArrayAtPutNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "ArrayAtPut %s[%s] := %s, %s     p *(ArrayAtPutNode*)%#lx",
           _src->name(), arg->name(), elem->name(), _dest->name(), this);
    if (printAddr) mysprintf(buf, "      p *(ArrayAtPutNode*)%#lx");
    return b;
  }
 
  char* ByteArrayAtPutNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf,
              "ByteArrayAtPut %s[%s] := %s, %s",
              _src->name(), arg->name(), elem->name(), _dest->name());
    if (printAddr) mysprintf(buf, "      p *(ByteArrayAtPutNode*)%#lx", this);
    return b;
  }
 
  char* DeadEndNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "DeadEnd");
    if (printAddr) mysprintf(buf, "      p *(DeadEndNode*)%#lx", this);
    return b;
  }

  static fint prevsLen;
  static char* mergePrintBuf;
  static void printPrevNodes(Node* n) {
    mysprintf(mergePrintBuf, "N%ld%s", (void*)n->id(),
              --prevsLen > 0 ? ", " : "");
  }
  
  char* MergeNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "Merge (%s)", why);
    prevsLen = _prevs->length();
    mergePrintBuf = buf;
    _prevs->apply(printPrevNodes);
    buf = mergePrintBuf;
    if (printAddr) mysprintf(buf, "      p *(MergeNode*)%#lx", this);
    return b;
  }
 
  char* RestartNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "Restart N%ld", (void*)loopStart->id());
    if (printAddr) mysprintf(buf, "      p *(RestartNode*)%#lx", this);
    return b;
  }
 
  char* UncommonNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "UncommonBranch");
    if (printAddr) mysprintf(buf, "      p *(UncommonNode*)%#lx", this);
    return b;
  }

  char* NopNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "Nop");
    if (printAddr) mysprintf(buf, "      p *(NopNode*)%#lx", this);
    return b;
  }
 
  char* MarkerNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "Marker \"%s\" depth %d %s %s",
              selector_string(scope()->selector()),
              (void*)scope()->depth,
              invalid ? "(invalid)" : "", active ? "ACTIVE" : "");
    if (printAddr) mysprintf(buf, "      p *(MarkerNode*)%#lx", this);
    return b;
  }
 
  char* CommentNode::print_string(char* buf, bool printAddr) {
    char* b = buf;
    mysprintf(buf, "'%s' ", comment);
    if (printAddr) mysprintf(buf, "      p *(CommentNode*)%#lx", this);
    return b;
  }

  void BasicNode::printID() {
    char buf[32];
    lprintf("%4ld:%1s %-4s", (void*)id(), deleted ? "D" : " ",
            hasSplitSig() ? splitSig()->prefix(buf) : " ");
  }
  
  void PNode::verify() {
    if (deleted) return;
    if (!firstPrev() && !isPrologueNode())
      error1("PNode %#lx: no predecessor", this);
    if (firstPrev() && !firstPrev()->isSuccessor(this))
      error1("prev->next != this for PNode %#lx", this);
    if (_bb && !_bb->contains(this))
      error1("BB doesn't contain PNode %#lx", this);
    if (next() && ! next()->isPredecessor(this))
      error1("next->prev != this for PNode %#lx", this);
    if (_bb == NULL) error1("PNode %#lx: doesn't belong to any BB", this);
    if (next() == NULL && !isExitNode() && !isRestartNode() &&
        !isCommentNode())   // for the "rest of method omitted (dead)" comment
      error1("Node %#lx has no successor", this);
    if (next() != NULL && isExitNode()) {
      Node *n;
      for (n = next();
           n && (n->isCommentNode() || n->isDeadEndNode());
           n = n->next()) ;
      if (n) error2("exit node %#lx has a successor (%#lx)", this, next());
    }
    if (hasSrc()) src()->verify();
    if (hasDest()) {
      dest()->verify();
      if (dest()->isConstPReg())
        error2("Node %#lx: dest %#lx is ConstPR", this, dest());
    }
    if (isAssignmentLike() && (!hasSrc() || !hasDest()))
      error1("Node %#lx: isAssignmentLike() implies hasSrc/Dest", this);
    if (l && !l->isDefined())
      error1("Node %#lx has undefined label", this);
  }

  void LoadOffsetNode::verify() {
    if (deleted) return;
    PNode::verify();
    base->verify();
  }
  
  void LoadStackNode::verify() {
    if (deleted) return;
    PNode::verify();
    frame->verify();
  }

  void StoreOffsetNode::verify() {
    if (deleted) return;
    PNode::verify();
    base->verify();
  }
  
  void StoreStackNode::verify() {
    if (deleted) return;
    PNode::verify();
    frame->verify();
  }

 
  static MergeNode* mergeNodeBeingVerified;
  
  static void verifyPrevNodes(Node* n) {
    static char buf[BUFSIZ];
    if ( !n->isReachable() )
      error3("MergeNode %#lx, %s, has unreachable predecessor %#lx",
        mergeNodeBeingVerified, 
        mergeNodeBeingVerified->print_string(buf),
        n);
  }
  
  
  void MergeNode::verify() {
    if (deleted) return;
    
    // removeUpToMerge assumes that all predecessors are reachable,
    //  so check that here:
    mergeNodeBeingVerified= this;
    _prevs->apply(verifyPrevNodes);
    
    PNode::verify();
  }
  

  void BlockCloneNode::verify() {
    if (deleted) return;
    PrimNode::verify();
    if (!_dest->isBlockPReg())
      error2("BlockCloneNode %#lx: dest %s isn't a block", this, _dest->name());
    _dest->verify();
  }

  void MethodReturnNode::verify() {
    if (deleted) return;
    ReturnNode::verify();
    if (next()) error1("MethodReturnNode %#lx has a successor", this);
  }

  void NonLocalReturnNode::verify() {
    if (deleted) return;
    ReturnNode::verify();
    if (next()) error1("NonLocalReturnNode %#lx has a successor", this);
  }

  void InlinedReturnNode::verify() {
    if (deleted) return;
    ReturnNode::verify();
    if (!next()) error1("InlinedReturnNode %#lx has no successor", this);
    if (next() && next()->scope() == scope())
      error1("InlinedReturnNode %#lx: successor is in same scope", this);
  }

  void InlinedNonLocalReturnNode::verify() {
    if (deleted) return;
    ReturnNode::verify();
    if (!next())
      error1("InlinedNonLocalReturnNode %#lx has no successor", this);
    if (next() && next()->scope() == scope())
      error1("InlinedNonLocalReturnNode %#lx: successor is in same scope",
             this);
  }

  void ArithRRNode::verify() {
    if (deleted) return;
    ArithNode::verify();
    oper->verify();
  }

  void TArithRRNode::verify() {
    if (deleted) return;
    AbstractBranchNode::verify();
  }

  void AbstractBranchNode::verify() {
    if (deleted) return;
    PNode::verify();
  }

  void BlockZapNode::verify() {
    if (deleted) return;
    PNode::verify();
    if (!_dest->isBlockPReg())
      error2("BlockZapNode %#lx: dest %s isn't a block", this, _dest->name());
    _dest->verify();
  }

  void UncommonNode::verify() {
    if (deleted) return;
    // optimizeTypeTests relies on UncommonNode being last
    if (this != bb()->last)
      error1("UncommonNode %#lx: not last node in BB", this);
    PNode::verify();
  }
        
  void TypeTestNode::verify() {
    if (deleted) return;
    // optimizeTypeTests relies on TypeTestNode being last
    if (this != bb()->last)
      error1("TypeTestNode %#lx: not last node in BB", this);
    PNode::verify();
  }
        
 void IndexedBranchNode::verify() {
    if (deleted) return;
    // optimizeTypeTests relies on IndexedBranchNode being last
    if (this != bb()->last)
      error1("IndexedBranchNode %#lx: not last node in BB", this);
    PNode::verify();
  }
        
  void MarkerNode::checkSplitting(MergeSExpr* m, SExpr* splitExpr) {
    // The receiver is a copy of the original marker, created by splitting
    // on m.  Along this path of the split, m is replaced by splitExpr
    // (which is a part of m).
    // Change the xpr stack if necessary (so we can later find the correct
    // marker among all the copies).
    for (fint i = exprStack->length() - 1; i >= 0; i--) {
      if (exprStack->nth(i) == m) {
        exprStack->nthPut(i, splitExpr);
      }
    }
  }

  void MarkerNode::checkMap(SExpr* expr, oop p, const char* msg, fint n) {
    // assert(p != badOop, "should know p");
    // NB: can have badOops if in primitive failure -- expr stack is
    // still the primitive call expr stack, not the fail send expr stack
    // (this is a general problem with primitive failures)
    if (expr->hasMap() && !expr->map()->equal(p->map())) {
      invalid = true;
      if (PrintSICMarkers) {
        lprintf("*invalidating Marker %#lx: ", this);
        lprintf(msg, (void*)n);
        lprintf(" map %#lx vs %#lx\n", expr->map(), p->map()->enclosing_mapOop());
      }
    }
  }

  fint MarkerNode::depth() { return scope()->depth; }

  void MarkerNode::check() {
    // check if current node could be a restart point; if not, mark it invalid
    if (deleted || _bb == NULL) {
      invalid = true;
      return;
    }
    SCodeScope* s = scope();
    compiled_vframe* vf = s->vscope->vf;
    assert(s->selector() == vf->selector(), "mismatched selectors");
    checkMap(s->receiver, vf->receiver(), "receiver");
    assert(invalid || s->method() == vf->method(), "mismatched methods");
    checkMap(s->self     , vf->self()   , "self");
    {
      FOR_EACH_SLOTDESC_N(s->method()->map(), sd, i) {
        if (s->args[i]) {
          checkMap(s->args[i], vf->get_slot(sd), "arg %d", i);
        } else {
          // locals have no map (yet?)
        }
      }
    }
    oop* stack;
    smi len;
    vf->get_expr_stack(stack, len, true);
    for (fint i = exprStack->length() - 1; i >= 0; i--) {
      checkMap(exprStack->nth(i), stack[i], "stk %d", i);
    }
    assert(len == exprStack->length(), "expr stack lengths don't match");
  }

  // for gdb
  void printNodes(Node* n) {
    for ( ; n; n = n->next()) {
      n->printID(); n->print_short(); lprintf("\n");
    }
  }

  // architecture-independent gen nodes
        
  extern Location arith_genHelper(PReg* sreg, PReg* oper, PReg* dest,
                                  ArithOpCode op,
                                  Location& t1, Location& t2, bool& reversed);

  void ArithRRNode::gen() {
    BasicNode::gen();
    
    if (constResult) {
      Location dest = isRegister(_dest->loc) ? _dest->loc : Temp2;
      Location l = genHelper->moveToReg(constResult, dest);
      if (l != _dest->loc) genHelper->moveRegToLoc(dest, _dest->loc);
    } else {
      Location dummy;
      bool dummy2;
      Location dest = arith_genHelper(_src, oper, _dest, op, dummy, dummy, dummy2);
      if (dest != _dest->loc)
        genHelper->store(dest, spOffset(_dest->loc), SP);
    }
  }
  
  
  void AssignNode::gen() {
    BasicNode::gen();
    if (_src->loc == _dest->loc) return;
    if (_src->isConstPReg()) {
      genOop();
      return;
    }
    
    Location src = _src->loc;
    Location dest = _dest->loc;
    if (isRegister(src) && isRegister(_dest->loc)) {
      // common case: reg-to-reg
      genHelper->moveRegToReg(src, dest);
    } else if (isRegister(_dest->loc)) {
      // mem-to-reg
      genHelper->load(SP, spOffset(src), dest);
    } else if (isRegister(src)) {
      // reg-to-mem
      genHelper->store(src, spOffset(dest), SP);
    } else {
      // mem-to-mem
      genHelper->load(SP, spOffset(src), Temp1);
      genHelper->store(Temp1, spOffset(dest), SP);
    }
  }
  
  void BasicNode::genPcDesc() {
    fint b = bci();
    ScopeInfo si = scope()->scopeInfo;
    if (b != IllegalBCI && (b != lastBCI || si != lastScopeInfo)) {
      theSIC->rec->addPcDesc(theAssembler->offset(), si, b);
      lastBCI = b; lastScopeInfo = si;
    }
  }

  void BasicNode::gen() {
    if (GenerateAllPcDescs) genPcDesc();
  }

  void BlockCloneNode::gen() {
    BasicNode::gen();
    BlockPReg* blk = block();
    Location l_ = blk->loc;
    if (blk->primFailBlockScope && !clonePrimFailBlock) {
      // The current test for using prim fail blocks is broken - the location
      // needs to be initialized if there is a call or uncommon trap between
      // its creation.  For now, always initialize the location.
      genHelper->setToZero(l_);
      return;
    }

    if (isMemoized()) {
      // initialize memoized location
      if (isRegister(l_)) {
        genHelper->loadImmediateOop(deadBlockPR, l_, true);
      } else {
        Location t = genHelper->loadImmediateOop(deadBlockPR, Temp1, false);
        genHelper->moveRegToLoc(t, l_);
      }
    } else {
      genCall();
    }
  }
  
  void CommentNode::gen() { 
    BasicNode::gen();
  }
     
  void ConstInitNode::gen() {
    BasicNode::gen();
    for (fint i = constants.length() - 1; i >= 0; i--) {
      ConstPReg* r = constants.nth(i);
      genHelper->loadImmediateOop(r->constant, r->loc);
    }
  }
  
  void FlushNode::gen() {
    BasicNode::gen();
    PReg* regToFlush = _src->cpReg();
    Location l_ = regToFlush->loc;
    // Removed following assertion because code elimination 
    //  may eliminate all defs and uses of uplevel PReg.
    //   -- dmu
    // assert(l_ != UnAllocated || regToFlush->isConstPReg(),
    //       "should have a location to flush");
    if (!isRegister(l_)) return;
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        NameNode* n = _src->nameNode();
        assert(n->hasLocation() && n->location() == l_,
                 "cpReg() inconsistent with debug info");
      }
#   endif

    flushRegister(regToFlush);
  }

  void InlinedReturnNode::gen() {
    BasicNode::gen();
    theAssembler->Comment("inlined local return");
  }
  
  void InlinedNonLocalReturnNode::gen() {
    BasicNode::gen();
    theAssembler->Comment("inlined non-local return");
  }
  
  void LoadNode::genLoad(PReg* source, fint srcOffset) {
    BasicNode::gen();
    Location src = genHelper->moveToReg(source, Temp1);
    if (isRegister(_dest->loc)) {
      genHelper->load(src, srcOffset, _dest->loc);
    } else if (!_dest->isNoPReg()) {
      genHelper->load(src, srcOffset, Temp2);
      genHelper->store(Temp2, spOffset(_dest->loc), SP);
    }
  }

  void LoadOffsetNode::gen() {
    genLoad(base, offset);
  }
  
  void LoadStackNode::gen() {
    int32 offset = nd ? spOffset(nd->location(), nm) : 0;
    genLoad(frame, offset);
  }
  
  void MarkerNode::gen() {
    BasicNode::gen();
    pcOffset = theAssembler->offset();
  }

  void MergeNode::gen() {
    if (!l) l = new DefinedLabel(theAssembler->printing);
    BasicNode::gen();
  }
  
  void NopNode::gen() {
    BasicNode::gen();
  }

  bool MarkerNode::describePReg(PReg* r, SCodeScope** scopes,
                                ValueLocationNameDesc*& nd,
                                bool describeUnallocated) {
    // set nd (if possible) and return whether PReg is live and allocated
    fint dummy1, dummy2;
    if (r == NULL || (r->loc == UnAllocated && !describeUnallocated)) {
      // not used
      return false;
    } else if (r->scope == NULL) {
      assert(isGloballyAllocatedRegister(r->loc), "should be a hardwired reg");
      return false;
    } else if (r->scope != scopes[r->scope->depth]) {
      // not in current call stack --> not live
      return false;
    } else if (!r->scope->isSenderOrSame(findAncestor(_scope, dummy1,
                                                      r->scope, dummy2))) {
      // scope of r is below marker scope, so it cannot be live
      return false;
    } else if (r->isLiveAt(this)) {
      // preg is live; try to find nd
      assert(r->scope->isCodeScope(), "oops");
      nd = ((SCodeScope*)r->scope)->nameDescFor(r);
      if (nd) {
        nd->offset = r->scope->descOffset();
      } else if (r->isSAPReg()) {
        // must be copy-propagated SAPReg
        for (SCodeScope* s = ((SAPReg*)r)->creationScope;
             s != r->scope;
             s = s->sender()) {
          if (s->vscope) {
            nd = s->nameDescFor(r);
            if (nd) break;
          }
        }
      } else {
        // either a SplitReg, or the reg contains a block whose map we
        // couldn't figure out
      }
      
      if (nd == NULL && r->cpRegs) {
        // try to get info from equivalent regs
        for (fint i = r->cpRegs->length() - 1; i >= 0; i--) {
          if (describePReg(r->cpRegs->nth(i), scopes, nd, describeUnallocated))
            break;
        }
      }
      if (nd && r->isBlockPReg()) nd->block = ((BlockPReg*)r)->block;
      return true;
    } else {
      // not live
      return false;
    }
  }

  bool MarkerNode::checkContents(ValueLocationNameDesc* nd) {
    // check if nd is alrady in locs; if so, make sure contents agree
    // always returns true - makes it easier to use (don't need if GENERATE_DEBUGGING_AIDS)
    Location loc = nd->location();
    oop val = nd->value();
    for (fint i = locs->length() - 1; i >= 0; i--) {
      NameDesc* nd2 = locs->nth(i);
      if (loc == nd2->location()) {
        if (val != nd2->value()) {
          fail("SIC recompile: inconsistent register contents for %s",
               locationName(loc));
          if (WizardMode) error_breakpoint();
          return true;
        }
      }
    }
    return true;
  }
  
  void MarkerNode::describe() {
    assert(active, "should be active");
    locs = new NameDescBList(50);
    // get all scopes on current call stack
    SCodeScope* scope = this->scope();
    fint depth = scope->depth;
    SCodeScope **scopes= NEW_RESOURCE_ARRAY(SCodeScope*, depth + 1);
    scopes[depth] = scope;
    fint i;
    for (i = depth - 1; i >= 0; i--) {
      scopes[i] = scopes[i + 1]->sender();
      methodMap* mm = (methodMap*)scopes[i]->method()->map();
      if (mm->get_selector_at(scopes[i + 1]->senderBCI()) !=
          scopes[i + 1]->selector()) {
        // can't express live range of fail block args in bci terms
        // because there are 2 sends in the same bci -- arghh!
        // (see also SCodeScope::computeMasks)
        fail("SIC: can't recover prim. failure args for %s",
             selector_string(mm->get_selector_at(scopes[i + 1]->senderBCI())));
        return;
      }
    }

    // describe all live PRegs
    PRegBList* pregs = theSIC->bbIterator->pregTable;
    PRegBList unresolved(10);
    for (i = pregs->length() - 1; i >= 0; i--) {
      PReg* r = pregs->nth(i);
      ValueLocationNameDesc* nd;
      if (!describePReg(r, scopes, nd, false)) continue;        // not live
      if (PrintSICMarkers) {
        lprintf("*value of %s: vf %#lx ", r->name(), r->scope->vscope->vf);
        if (nd) nd->print(); else lprintf(" - not found");
        lprintf("\n"); 
      }
      if (nd == NULL) {
        if (r->weight < 0) {
          // was targeted to a register - will probably find its
          // equivalent PReg later
          unresolved.append(r);
          continue;
        } else {
          fail("SIC: couldn't find runtime value for %s", r->name());
          return;
        }
      }
      assert(checkContents(nd), "oops");
      locs->append(nd);
    }

    // add args to current send (aren't marked live if already in out regs)
    for (i = exprStack->length() - 1; i >= 0; i--) {
      SExpr* e = exprStack->nth(i);
      PReg* r = e->preg();
      Node* n = e->node();
      if (n && !r->isUnused() && n->hasDest()) {
        PReg* dest = n->dest();
        assert(r->isLiveAt(this), "should be live");
        if (isArgRegister(dest->loc)) {
          ValueLocationNameDesc* nd;
          describePReg(r, scopes, nd, true);
          if (nd) {
            nd->loc = dest->loc;
            assert(checkContents(nd), "oops");
            locs->append(nd);
          } else {
            fail("couldn't find expr stack elem %s", r->name());
            return;
          }
        }
      }
    }

    // try to resolve as yet unresolved PReg values
    while (unresolved.nonEmpty()) {
      PReg* r = unresolved.pop();
      fint i;
      for (i = locs->length() - 1; i >= 0; i--) {
        if (locs->nth(i)->location() == r->loc) {
          // ok, found run-time value via some other PReg
          break;
        }
      }
      if (i < 0) {
        fail("SIC: couldn't find runtime value (2) for %s", r->name());
        return;
      }
    }
           
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        bool haveReceiver = false;
        for (i = locs->length() - 1; i >= 0; i--) {
          NameDesc* nd = locs->nth(i);
          if (nd->location() == IReceiverReg) {
            haveReceiver = true;
            break;
          }
        }
        assert(haveReceiver, "receiver reg. should always be live");
      }
#   endif
  }

  sendDesc* MarkerNode::send_desc(nmethod* nm) {
    // The receiver is the active marker node, but it doesn't represent the
    // top of the stack.  Therefore, it must be "immediately" before a
    // non-inlined send.  Find this send and return the corresponding
    // sendDesc.
    assert(active, "not active");
    Node *n;
    for (n = next(); !n->isSendNode(); n = n->next()) {
      if (!n->canBeBetweenMarkerAndSend()) {
        // unexpected node between marker and send; e.g. send was
        // type-tested but branch currently on stack was not inlined
        // just fail for now
        if (PrintSICMarkers) {
          lprintf("*can't find Marker's sendDesc because of this node:\n");
          n->print();
        }
        return NULL;
      }
    }
    sendDesc* sd = sendDesc::sendDesc_from_call_instruction(
                     nm->insts() + ((SendNode*)n)->offset);
    assert(sd->verify(), "bad sendDesc");
    return sd;
  }

  void MarkerNode::fail(const char* msg, const void* arg) { 
    if (PrintRecompilation) warning1(msg, arg);
    invalid = true;
    theRecompilation->isReplacementSimple = active = false;
  }

  
  void PrologueNode::checkReceiverMap() {
    assert(theSIC->diLink == NULL && !L->isReceiverStatic(), "shouldn't be here");

    // test receiver map
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        switch (L->lookupType()) {
        case NormalLookupType:  break;
        case StaticNormalLookupType:
        case ImplicitSelfLookupType:
        case ResendLookupType:
        case DirectedResendLookupType: ShouldNotReachHere(); break;
        default: break;
        }
      }
#   endif

    Map* m = L->receiverMap();
    bool imm =  m == Memory->smi_map  ||  m == Memory->float_map;

    if (SICCountTypeTests) {
      theAssembler->startTypeTest(1, true, imm);
      theAssembler->doOneTypeTest();
    }

    if (m == Memory->smi_map)
      genHelper->smiOop_prologue(Memory->code->trapdoors->SendMessage_stub_td());
    else if (m == Memory->float_map)
      genHelper->floatOop_prologue(Memory->code->trapdoors->SendMessage_stub_td());
    else
      genHelper->memOop_prologue(L->receiverMapOop(),
                                 Memory->code->trapdoors->SendMessage_stub_td());
  }

  void PrologueNode::doMapSelectorDelegateeChecks() {
    if (!L->isReceiverStatic())
      checkReceiverMap(); // do approriate smi/float/memOop prologue
      
    theSIC->_verifiedOffset = theAssembler->offset();

    if (SICCountTypeTests) theAssembler->endTypeTest();
    theAssembler->Comment("verified entry point:");

    Label generalMiss(theAssembler->printing, NULL);
    if (L->isPerform()) {
      theAssembler->Comment("check selector");
      genHelper->checkOop(generalMiss, L->selector(), PerformSelectorLoc);
    }
      
    if (needsDelegatee(L->lookupType()) && !L->isDelegateeStatic()) {
      theAssembler->Comment("check delegatee");
      genHelper->checkOop(generalMiss, L->delegatee(), PerformDelegateeLoc);
    }
  }

  void PrologueNode::generateCountCode() {
    assert(GenerateCountCode, "should not be generating count code");

    MethodKind kind = isAccessMethod ? MethodKind(-1) : theSIC->method()->kind();
    fint assignableParents = L->adeps->length();
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
    genHelper->genCountCode(counter);
  }

  void PrologueNode::resetUnusedBit() {
    assert(!isAccessMethod && GenerateLRUCode, "shouldn't be resetting LRU bit");

    theAssembler->Comment("reset unused bit");
    void* unused_addr = &LRUflag[Memory->code->nextNMethodID()];
    genHelper->setToZeroA(unused_addr, Temp2);
  }
  
  void PrologueNode::verifyAssignableParents() {
    theAssembler->Comment("verify state of assignable parents");
    fint assignableParents = L->adeps->length();
    fint count = 0;
    for (fint i = 0; i < assignableParents; ++i) {
      objectLookupTarget* target = L->adeps->start()[i];
      Location t = genHelper->loadPath(Temp2, target, LReceiverReg);
      count = genHelper->verifyParents(target, t, count);
    }
  }


  // Prologue format:
  //
  // *if not DI child
  //    <smi/float/memOop prologue>
  // _verified:                       (entry point from PICs)
  //    if necessary <check selector>
  //    if necessary <check delegatee>
  // *endif DI
    
  // _diCheck:                        (entry point after recompile)
  //    <verify assignable parents>
    
  // *if haveStackFrame
  //    create stack frame
  // *endif
    
  // *if GenerateCountCode
  //    <countCode>
  // *endif
    
  // <flush register windows if neceessary>
  // <clear stack temporaries and excess argument locations
  void PrologueNode::gen() {
    BasicNode::gen();
    genPcDesc(); 

    fint assignableParents = L->adeps->length();
    
    theAssembler->Comment("Begin Prologue");

    prePrologue();

    if (theSIC->diLink == NULL)
      doMapSelectorDelegateeChecks(); // only do what's necessary
    else {
      // don't check receiver map, selector, delegatee if a DI cache miss
      assert(assignableParents > 0, "should have some di parents to check");
    }

    
    theSIC->_diCheckOffset = theAssembler->offset();
    theAssembler->Comment("DI entry point:");
    
    if (assignableParents > 0)
      verifyAssignableParents();
    
    if (haveStackFrame())
      createStackFrame();
    
    if (GenerateCountCode)
      generateCountCode();

    if (!isAccessMethod && GenerateLRUCode)
      resetUnusedBit();
    
    postPrologue();

    theAssembler->Comment("End Prologue");
  }


  void StoreStackNode::gen() {
    BasicNode::gen();
    int32 offset = spOffset(nd->location(), nm);
    Location fr = genHelper->moveToReg(frame, Temp1);
    if (_src->isConstPReg()) {
      // store constant
      ConstPReg* value = (ConstPReg*)_src;
      Location t2 = genHelper->loadImmediateOop(value, Temp2, false);
      genHelper->store(t2, offset, fr);
    } else {
      if (isRegister(_src->loc)) {
        genHelper->store(_src->loc, offset, fr);
      } else {
        genHelper->load(SP, spOffset(_src->loc), Temp2);
        genHelper->store(Temp2, offset, fr);
      }
    }
  }
  

  void TBranchNode::gen() {
    BasicNode::gen();
    Location rcvrReg, argReg;
    bool haveImmediate = false;

    assert(intRcvr ||
           !( _src->isConstPReg() && ((ConstPReg*)_src)->constant->is_smi()),
           "intRcvr should be set");
    assert(intArg ||
           !(  arg->isConstPReg() && ((ConstPReg*) arg)->constant->is_smi()),
           "intArg  should be set");

    rcvrReg = genHelper->moveToReg(_src, Temp1);

    if (intArg  &&  arg->isConstPReg()  && isImmediate(smiOop(((ConstPReg*)arg)->constant))) {
      haveImmediate = true;
    } else {
      argReg = genHelper->moveToReg(arg, Temp2);
    }
           
    genCompare(haveImmediate, rcvrReg, argReg);
    if (intRcvr && intArg) {
      // no tag tests necessary
    }
    else {
      // on Sparc, we compare using tagged subtracts.  if rcvr - arg overflows,
      // then the overflow bit will be set.  but we only care about the cases
      // where the overflow bit is set because the arg and/or the rcvr aren't an
      // smiOop.
      // testTagsIfNecessary, on Sparc, checks the tags of the rcvr and/or arg
      // to see how the overflow was triggered (subtraction overflow vs. non-smiOop
      // rcvr and/or arg).  -mabdelmalek 11/02
      testTagsIfNecessary(haveImmediate, rcvrReg, argReg);
    }
    BranchNode::gen();
  }
  

  void TypeTestNode::define(fint index, Label* l_) {
    Node* n = nexti(index);
    n->l = l_->unify(n->l);
  }
  


 // next 2 for debugging (used when in gdb in the middle of a compile)

  // print me and my successors

  void BasicNode::print_succs(Node* n) {
    Unused(n);
    printID(); print_short(); lprintf("\n");
  }

  void BasicNode::print_preds(Node* n) {
    Unused(n);
    printID(); print_short(); lprintf("\n");
  }

  void PNode::print_succs(Node* n) {
    if (n  &&  nPredecessors() > 1  &&  n != prev(0))
      return;
    Node::print_succs();
    for ( fint i = 0;  i < nSuccessors(); ++i)
      nexti(i)->print_succs(this);
  }

  void PNode::print_preds(Node* n) {
    if (n  &&  nSuccessors() > 1  &&  n != nexti(0))
      return;
    for ( fint i = 0;  i < nPredecessors(); ++i)
      prev(i)->print_preds(this);
    Node::print_preds();
  }
  
  
  // for debugging: if set, compiler generates call to _Breakpoint before
  // every non-inlined send
  bool breakpointBeforeCall = false;
    
  void SendNode::genBreakpointBeforeCall() {
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions  &&  breakpointBeforeCall) {
        theNodeGen->enterScope(scope());
        Node* n =
          new PrimNode(getPrimDescOfString("_Breakpoint"),
                        NULL, 0, exprStack,
                        NULL, NULL);
        theNodeGen->exitScope(scope());
        n->gen();
      }
    # endif
  }
  
  void SendNode::verifySendInfo() {
    # if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        switch (withoutExtraBits(l)) {
        case DirectedResendLookupType:
          assert(l & DelegateeStaticBit, "should have static delegatee");
          assert_string(del, "should be a string");
          // fall through
        case ImplicitSelfLookupType:
        case ResendLookupType:
        case StaticNormalLookupType:
        case NormalLookupType:
          assert(!isPerformLookupType(l), "should have a static selector");
          assert_string(sel, "should be a string");
          break;
        default:
          break;
        }
      }
    # endif
  }


# endif


