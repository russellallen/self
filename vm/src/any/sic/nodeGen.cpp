/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "nodeGen.hh"
# include "_nodeGen.cpp.incl"

# define APPEND(node)      current = current->append (node)
# define APPEND1(node)     current = current->append1(node)
# define APPENDN(n, node)  current = current->append(n, node)
# define COMMENT(s)        current = current->append(new CommentNode(s))

  NodeGen* theNodeGen;

  NodeGen::NodeGen(compilingLookup* l, sendDesc* sd, nmln* d) {
    initPRegs();
    initNodes();
    scopeStack = new SSelfScopeBList(30);
    start = current = NULL;
    L =l; send_desc = sd; diLink = d;
    haveStackFrame = false;
    delPR = new PReg(NULL, PerformDelegateeLoc, true, true);
    selPR = new PReg(NULL, PerformSelectorLoc, true, true);
    nlrHomePR = new PReg(NULL, NLRHomeReg, true, true);
    nlrHomeIDPR = new PReg(NULL, NLRHomeIDReg, true, true);
    nlrResultPR = new PReg(NULL, NLRResultReg, true, true);
    nlrTempPR = new PReg(NULL, NLRTempReg, true, true);
    framePR = new PReg(NULL, FrameReg, true, true);
    noPR = new NoPReg;
    theNodeGen = this;
  }

  void NodeGen::enterScope(SSelfScope* s) { scopeStack->push(s); }
  void NodeGen::exitScope (SSelfScope* s) {
    assert(currentScope() == s, "exiting wrong scope");
    scopeStack->pop();
  }

  void NodeGen::prologue(bool needToFlushRegWindow, bool isAccessMethod,
                         fint nargs) {
    assert(current == NULL, "prologue must be first");
    current = start = new PrologueNode(needToFlushRegWindow, isAccessMethod,
                                       nargs, L);
  }

  Node* NodeGen::append(Node* n) { 
    return APPEND(n); 
  }
  
  Node* NodeGen::comment(char* s) { return APPEND(new CommentNode(s)); }

  void NodeGen::testStackOverflow(PRegBList* exprStack, SplitSig* sig) {
    APPEND(new InterruptCheckNode(exprStack, sig));
    ((SCodeScope*)currentScope())->addSend(exprStack);
  }

  void NodeGen::loadBlockParent(PReg* block, PReg* dst) {
    // given a block, load the frame pointer of its enclosing scope
    APPEND(new LoadOffsetNode(block, scope_offset(), dst));
  }

# ifdef UNUSED
  void NodeGen::loadSender(PReg* sp, PReg* dest) {
    // load frame's sender
    APPEND(new LoadOffsetNode(sp, frame_offset * oopSize, dest));
  }
# endif

  void NodeGen::loadSaved(PReg* frame, nmethod* nm, NameDesc* nd, PReg* dest, oop name) {
    assert(!nd || !nd->isValue(), "should have a location");
    APPEND(new LoadStackNode(frame, nm, nd, dest, name));
  }

  void NodeGen::storeSaved(PReg* val, PReg* frame, nmethod* nm, NameDesc* nd, oop name) {
    assert(!nd->isValue(), "should have a location");
    APPEND(new StoreStackNode(val, frame, nm, nd, name));
  }

  void NodeGen::pathAssign(PReg* rcvr,
                           realSlotRef* path,
                           PReg* val,
                           bool checkStore) {
    COMMENT("Begin slot assignment");
    int32 offset = smiOop(path->desc->data)->byte_count() - Mem_Tag;
    if (path->holder->is_object_or_map()) {
      PReg* t = new TempPReg(currentScope());
      t = loadPath(path->holder, rcvr, t);
      APPEND(new StoreOffsetNode(val, t, offset, checkStore));  
    } else {
      fatal("don't support vframe lookups");
    }
  }

  PReg* NodeGen::loadPath(lookupTarget* target,
                          PReg* receiver,
                          PReg* dest) {
    // returns register to use for base address of load
    if (target->is_receiver()) {
      return receiver;
    } else {
      assert(target->is_object(), "must be an object path search");
      objectLookupTarget* otarget = (objectLookupTarget*) target;
      if (otarget->prevTargetSlot) {
        pathLookup(otarget->prevTargetSlot, receiver, dest);
      } else {
        loadOop(otarget->obj, dest);
      }
      return dest;
    }
  }
    
  void NodeGen::pathLookup(realSlotRef* path, PReg* receiver, PReg* dest) {
    if (path->holder->is_object_or_map()) {
      PReg* base = loadPath(path->holder, receiver, dest);
      fint offset = smiOop(path->desc->data)->byte_count() - Mem_Tag;
      APPEND(new LoadOffsetNode(base, offset, dest));
    } else {
      fatal("don't support vframe lookups");
    }
  }
    
  Node* NodeGen::restart(MergeNode* loopStart,
                         PRegBList* exprStack, SplitSig* s) {
    Node* n = APPEND(new RestartNode(exprStack, s, loopStart));
    // reset current so that any code generated after the restart will
    // be ignored in later phases since there is no path reaching it

    // Next line added by dmu 4/26/07 to try to fix bug:
    //  inlined [3] loop had nsends of 0, but needed mask for call to InterruptCheck
    ((SCodeScope*)currentScope())->addSend(exprStack);
    
    current = new NopNode;
    return n;
  }

  Node* NodeGen::selfCall(SCodeScope* sc, LookupType l, PReg* self,
                          oop sel, oop del, oop methodHolder,
                          MergeNode* nlrPoint, fint argc,
                          PRegBList* exprStack, SplitSig* sig) {
    Unused(self);
    APPEND(new SendNode(l, sel, del, methodHolder, nlrPoint, argc,
                        exprStack, sig));
    sc->addSend(exprStack);
    return current;
  }

  Node* NodeGen::perform(SCodeScope* sc, LookupType l, PReg* self,
                         fint argc, oop del, oop mh, MergeNode* nlrPoint,
                         PRegBList* exprStack, SplitSig* sig) {
    return selfCall(sc, l, self, as_smiOop(argc), del, mh, nlrPoint, argc,
                    exprStack, sig);
  }

  PrimNode* NodeGen::primCall(SCodeScope* sc, PrimDesc* p,
                              MergeNode* nlrPoint, fint argc,
                              PRegBList* exprStack, SplitSig* sig,
                              BlockPReg* failBlock) {
    PrimNode* pn;
    APPEND(pn = new PrimNode(p, nlrPoint, argc, exprStack, sig, failBlock));
    if (pn->exprStack) sc->addSend(pn->exprStack);
    return pn;
  }

  Node* NodeGen::uncommonBranch(PRegBList* exprStack, bool restartSend) {
    assert(SICDeferUncommonBranches, "shouldn't use uncommon traps");
    Node* n = APPEND(new UncommonNode(exprStack, restartSend));
    assert(currentScope()->isCodeScope(), "must be non-access");
    ((SCodeScope*)currentScope())->addSend(exprStack);
    current = NULL;
    return n;
  }

  void NodeGen::nonLifoTrap(PRegBList* exprStack, SplitSig* s) {
    APPEND(new DeadBlockNode(exprStack, s));
  }


  void NodeGen::deadEnd() {
    APPEND(new DeadEndNode);
    current = NULL;
  }
  void NodeGen::loadOop(oop p, PReg* dest) {
    APPEND(new AssignNode(new_ConstPReg(currentScope(), p), dest));
  }
  void NodeGen::loadBlockOop(BlockPReg* b, SplitSig* s) {
    APPEND(new BlockCloneNode(b, s)); }
  void NodeGen::move(PReg* from, PReg* to) { APPEND(new AssignNode(from, to));}
  void NodeGen::zapBlock(BlockPReg* block) { 
    assert(current, "should not generate unreachable zaps");
    APPEND(new BlockZapNode(block)); }

  static PRegBList* mlist;
  static SplitSig* msig;
  static void materializeHelper(PReg*, PReg* r, bool) {
    theNodeGen->materializeBlock(r, msig, mlist, true);
  }

  void NodeGen::materializeBlock(PReg* r, SplitSig* sig,
                                 PRegBList* materialized, bool recursive) {
    Unused(recursive);
    if (r->isBlockPReg() && !materialized->contains(r)) {
      BlockPReg* bpr = (BlockPReg*)r;
      bpr->isMaterialized = true;

      // make sure the block is created
      APPEND(new BlockCreateNode(bpr, sig));
      
      // flush if uplevel-accessed
      // done by BlockCreateNode
      // if (recursive) APPEND(new FlushNode(currentScope(), bpr, true));
      materialized->append(bpr);
      
      // also make sure all uplevel-accessed blocks exist
      msig = sig; mlist = materialized; // params for materializeHelper
      bpr->nscope()->doUplevelAccesses(bpr, materializeHelper);
    }
  }
      
  void NodeGen::loadArg(PReg* from, PReg* to) {
    APPEND(new AssignNode(from, to));
  }
      
  void NodeGen::loadArg(fint argNo, PReg* from, bool isPrimCall) {
    Unused(isPrimCall);
    assert(currentScope()->isCodeScope(), "oops");
    SCodeScope* s = (SCodeScope*)currentScope();
    fint bci = s->bci();
    Location l = argNo == -1 ? ReceiverReg : ArgLocation(argNo);
                // weird arg numbering - 0 is 1st arg, not receiver
    // uses aren't right yet (call should have use) -fix this
    loadArg(from, new ArgSAPReg(s, l, true, false, bci, bci));
  }

  void NodeGen::prepareNLR(PReg* result, PReg* scope, smi homeID) {
    Unused(scope);
    // set up NLR registers
    loadArg(result, nlrResultPR);
    APPEND(new LoadIntNode(homeID, nlrHomeIDPR));
    // (nlrHomePR is loaded by caller)
  }

  Node* NodeGen::testNLR(smi homeID) {
    // test if NLR has reached home; the node returned is the success
    // branch (i.e. the home has been reached), current is the other
    // branch
    Node* homeIDTest = NULL;
    if (homeID) {       // note: will be 0 if no inlining
      if (isImmediate(smiOop(homeID))) {
        APPEND(new ArithRCNode(SubCCArithOp, nlrHomeIDPR, homeID, noPR));
      } else {
        APPEND(new LoadIntNode(homeID, nlrTempPR));
        APPEND(new ArithRRNode(SubCCArithOp, nlrHomeIDPR, nlrTempPR, noPR));
      }
      homeIDTest = APPEND(new BranchNode(EQBranchOp));
      APPEND1(new ArithRRNode(SubCCArithOp, nlrHomePR, framePR, noPR));
    } else {
      APPEND (new ArithRRNode(SubCCArithOp, nlrHomePR, framePR, noPR));
    }
    Node* homeFrameTest = APPEND(new BranchNode(EQBranchOp));

    // home & homeID match
    Node* finalReturn = new NopNode;
    APPEND1(finalReturn);

    // no match, continue NLR
    Node* cont = new MergeNode("testNLR cont"); 
    if (homeIDTest) homeIDTest->append(cont);
    homeFrameTest->append(cont);
    current = cont;
    return finalReturn;
  }

  void NodeGen::continueNonLocalReturn() {
    // continue NLR (return through caller's inline cache)
    APPEND(new NonLocalReturnNode(NULL, NULL));
  }

  void NodeGen::branch(MergeNode* target) {
    // connect current with target
    if (current != NULL && current != target) {
      current->append(target);
    }
    current = target;
  }

  void NodeGen::branchCode( MergeNode*           targetNode,
                            bool                 isBackwards,
                            PReg*                targetPR,
                            SExpr*               testExpr,
                            BranchBCTargetStack* targetStack,
                            SExprStack*          exprStack,
                            PRegBList*           exprStackPRs, 
                            SplitSig*            s ) {
    // gen nodes for all but indexed branch bytecode
    // branch if top of stack == target_oop, uncond if PRs NULL
    
    if ( targetPR != NULL  &&  SICBranchSplitting ) {
      char* whyNot =  splitCondBranch( targetNode,
                                       isBackwards,
                                       targetPR,
                                       testExpr,
                                       targetStack,
                                       exprStack,
                                       exprStackPRs,
                                       s );
      if (PrintSICBranchSplitting)
        if (!whyNot)
          lprintf("branch splitting succeeded\n");
        else
          lprintf("branch splitting failed: %s\n", whyNot);
          
      if ( !whyNot )
        return;
    }
      
    BranchOpCode op;
    if (targetPR == NULL)
      op = ALBranchOp;
    else {
      APPEND( new ArithRRNode( SubCCArithOp, targetPR, testExpr->preg(), noPR));
      op = EQBranchOp;
    }

    Node* condBranch = new BranchNode(op);
    append( condBranch );
    appendBranchCodeNodes( 1,
                           isBackwards,
                           targetNode,
                           targetStack,
                           exprStack,
                           exprStackPRs,
                           s );
    current = condBranch;
  }
  

  char* NodeGen::splitCondBranch( MergeNode*           targetNode,
                                  bool                 isBackwards,
                                  PReg*                targetPR,
                                  SExpr*               testExpr,
                                  BranchBCTargetStack* targetStack,
                                  SExprStack*          exprStack,
                                  PRegBList*           exprStackPRs, 
                                  SplitSig*            s ) {
    // try to split a conditional branch bc to avoid materializing
    // the boolean
    
    // local splitting only for now
  
    assert(targetPR->isConstPReg(), 
           "cond branch must be testing for constant");
    oop targetOop = ((ConstPReg*)targetPR)->constant;
    
    if (!testExpr->isMergeSExpr()) 
      return "testExpr not MergeSExpr";
    if (!((MergeSExpr*)testExpr)->isSplittable()) 
      return "textExpr not splittable";
    SExprBList* exprs = ((MergeSExpr*)testExpr)->exprs;
    assert(testExpr->node(), "splittable implies node()");
    Node* preceedingMerge = testExpr->node();
    if (current != preceedingMerge)
      return "not local"; // local only for now
    
    if ( preceedingMerge->nPredecessors() != exprs->length() )
      return "would have to iterate over predecessors";
      
    fint i;
    for ( i = 0;  
          i < exprs->length(); 
          ++i) {
       SExpr* e = exprs->nth(i);
       Node* n = e->node();
       if ( !preceedingMerge->isPredecessor(n) )
         return "merge not immediately after expr node";
       if ( !e->isConstantSExpr() )
         return "merge contains non-constant expression";
    }
    MergeNode* mergeForBranching      = new MergeNode("for branching");
    MergeNode* mergeForFallingThrough = new MergeNode("for falling through");
    mergeForBranching     ->setScope(currentScope());
    mergeForFallingThrough->setScope(currentScope());
    for ( i = 0;  
          i < exprs->length();  
          ++i) {
      SExpr* e = exprs->nth(i);
      Node* n = e->node();
      MergeNode* mn = e->constant() == targetOop
        ?  mergeForBranching
        :  mergeForFallingThrough;
      mn->setPrev(n);
      n->moveNext(preceedingMerge, mn);
    }     
    while (preceedingMerge->nPredecessors())
      preceedingMerge->removePrev(preceedingMerge->prev(0));
       
    current = mergeForBranching;
    branchCode( targetNode,
                isBackwards,
                NULL,
                NULL,
                targetStack,
                exprStack,
                exprStackPRs,
                s);
                
    append(mergeForFallingThrough);
    return NULL;
  }
  
  
  void NodeGen::branchIndexedCode( 
                       int32                 nCases,
                       MergeNode**           targetNodes,
                       bool*                 isBackwards,
                       PReg*                 testPR,
                       BranchBCTargetStack** targetStacks,
                       SExprStack*           exprStack,
                       PRegBList*            exprStackPRs, 
                       SplitSig*             s ) {
    // generate indexed branch
        
    IndexedBranchNode* ib = new IndexedBranchNode(testPR, nCases);
    current->append(ib); 
    
    for (int32 i = 0;  i < nCases;  ++i) {
      current = ib;

      appendBranchCodeNodes( i + 1, 
                             isBackwards[i], 
                             targetNodes[i], 
                             targetStacks[i],
                             exprStack,
                             exprStackPRs, 
                             s );
    }
    current = ib;
  }
  
  
  void NodeGen::appendBranchCodeNodes( int32                whichSucc, 
                                       bool                 isBackwards,
                                       MergeNode*           target,
                                       BranchBCTargetStack* targetStack,
                                       SExprStack*          exprStack,
                                       PRegBList*           exprStackPRs,
                                       SplitSig*            s ) {
  // use nop nodes to avoid indexed br node being pred twice of
  // same merge node if two cases goto same place
  APPENDN(whichSucc, new NopNode);
  
  // move stack values to targetStack
  targetStack->mergeInExprsFromStack(exprStack, target, isBackwards);
  
 // append to current for a fwd or back branch for a branch bc
  Node* n =  isBackwards
    ?  (Node*)  new RestartNode(exprStackPRs, s, target)
    :           target;
  append( n);
}


  void NodeGen::print_short() { lprintf("NodeGen %#lx", (unsigned long)this); }
      
# endif

