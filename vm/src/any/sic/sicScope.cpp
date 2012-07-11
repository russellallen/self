/* Sun-$Revision: 30.17 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "sicScope.hh"
# pragma implementation "sicScope_inline.hh"

# include "_sicScope.cpp.incl"

# ifdef SIC_COMPILER

  fint SScope::currentScopeID = 0;


  SendInfo::SendInfo(MethodLookupKey* k) {
    rcvr = 0;
    l = k->lookupType;
    isSelfImplicit = (l &  ImplicitSelfBit) ? true : false;
    isUndirectedResend = baseLookupType(l) == ResendBaseLookupType;
    sel = (stringOop)k->selector;
    del = (stringOop)k->delegatee;
    key = k;
    init();
  }

  void SendInfo::computeNSends(RScope* rscope, fint bci) {
    RScopeBList* lst = rscope->subScopes(bci);
    nsends = 0;
    for (fint i = lst->length() - 1; i >= 0; i--) {
      nsends += lst->nth(i)->nsends;
    }
  }

  SSelfScope::SSelfScope(SCodeScope* sender, RScope* rs, SendInfo* info) {
    _sender = sender;
    if (sender) {
      _senderBCI = sender->_bci;
      sender->subScopes->append(this);
      depth = _sender->depth + 1;
      loopDepth = _sender->loopDepth;
    } else {
      _senderBCI = IllegalBCI;
      depth = loopDepth = 0;
    }
    receiver = result = nlrResult = 0;
    if (info && info->resReg) {
      resultPR = info->resReg;
    } else {
      resultPR = 0;
    }
    rscope = rs;
    if (rscope) {
      rs->extend();
    }
      
    vscope = BadVScope;           // for better debugging
    predicted = info ? info->predicted : false;
  }

  void SSelfScope::computeVScope() {
    if (vscope && vscope != BadVScope) return;          // already set
    if (_sender && _sender->vscope &&
        _sender->bci() == _sender->vscope->vf->bci()) {
      vscope = _sender->vscope->callee;
      if (vscope) {
        if (!vscope->vf->receiver()->map()->equal(receiver->map())) {
          // receiver types don't match (e.g. wrong branch of PIC-predicted
          // send)
          vscope = 0;
        } else if (method() != vscope->vf->method() ||
                   selector() != vscope->vf->selector()) {
          // this scope was affected by programming -- don't use it
          vscope = 0;
        }
      }
    } else {
      vscope = 0;
    }
  }
  
  void SSelfScope::addResult(SExpr* e) {
    if (result == 0) {
      result = e;
    } else {
      result = result->mergeWith(e, result->node());
    }
  }
  
  SCodeScope::SCodeScope( oop         m,
                          SCodeScope* sender,
                          RScope*     rs,
                          SendInfo*   info )
  : SSelfScope(sender, rs, info) {
    _key = info->key; _method = m;
#   if GENERATE_DEBUGGING_AIDS
      // not an assertion because it may fail in very rare cases (when
      // recompiling lookup error methods - new method gets created by lookup)
      if (CheckAssertions  &&  !(rscope->isNullScope() || rscope->method() == m))
        warning("wrong rscope");
#   endif
    endsDead = inEpilogue = _haveNLRPoint = false;

    nargs = 0; // set in initialize
    nslots = m->map()->length_slots();
    args = NEW_RESOURCE_ARRAY(SExpr*, nslots);
    locals = NEW_RESOURCE_ARRAY(PReg*, nslots);
    fint i;
    for (i = 0; i < nslots; i++) { args[i] = 0; locals[i] = 0; }
    method_map = (methodMap *) m->map();
    ncodes = method_map->length_codes();
    theSIC->ncodes += ncodes;
    primFailure = info->primFailure || (sender ? sender->primFailure : false);
    nsends = 0;
    exprStack = new SExprStack(this, ncodes);
    exprStackElems = new SExprBList(ncodes);
    blockElems = new SExprBList(ncodes);
    subScopes = new SSelfScopeBList(ncodes);
    blocks = new BlockPRegBList(ncodes);
    _bci = PrologueBCI;
    incoming = 0;
    allocs = NEW_RESOURCE_ARRAY(RegisterString, ncodes);
    for (i = 0; i < ncodes; i++) { allocs[i] = 0; }
    regs   = NEW_RESOURCE_ARRAY(LongRegisterString*, ncodes);
    for (i = 0; i < ncodes; i++) { regs[i] = new LongRegisterString(); }
    expressions = NEW_RESOURCE_ARRAY(PReg*, ncodes);
    pushedLocal = NEW_RESOURCE_ARRAY(PReg*, ncodes);
    for (i = 0; i < ncodes; i++) { expressions[i] = pushedLocal[i] = 0; }
    
    init_branch_targets();
        
    _scopeID = currentScopeID++;
    scopeInfo = 0;
    marker = 0;
    splitRegs = new PRegBList(5);
    sig = sender ? sender->sig : 0;
    // for correct register allocation, result has to belong to sender scope
    if (!resultPR) {
      if (sender) {
        SAPReg* r = new SAPReg(sender, sender->bci(), sender->bci());
        r->creationScope = this;
        r->creationStartBCI = ncodes - 1;
        resultPR = r;
      } else {
        resultPR = new SAPReg(this, ncodes - 1, ncodes - 1);
      }
    }
  }
  
  
  void SCodeScope::init_branch_targets() {
    BoolBList* btBCIs;
    method_map->branch_targets(hasBranchBC, &btBCIs, &backwards_branch_targets);
    if (hasBranchBC) {
      branchTargets      = NEW_RESOURCE_ARRAY(MergeNode*,  ncodes + 1);
      branchTargetStacks = NEW_RESOURCE_ARRAY(BranchBCTargetStack*, ncodes + 1);
      for (int32 i = 0;  i < ncodes+1;  i++) { 
        branchTargets[i] = 
          btBCIs->nth(i) || backwards_branch_targets->nth(i)
            ?  new MergeNode("br bc merge") 
            :  0;
        branchTargetStacks[i] = 0;
      }
    }
  }
  

  SMethodScope::SMethodScope(oop m, oop mh_or_map, SCodeScope* sen, RScope* rs,
                             SendInfo* info)
  : SCodeScope(m, sen, rs, info) {
    _methodHolder_or_map = mh_or_map;
    initialize();
  }
  
  SBlockScope::SBlockScope(oop m, SScope* p, SCodeScope* s, RScope* rs,
                           SendInfo* info)
  : SCodeScope(m, s, rs, info) {
    _parent = p; initialize();
    if (info->rcvr && info->rcvr->preg()->isBlockPReg()) {
      BlockPReg* r = (BlockPReg*)info->rcvr->preg();
      if (r->primFailBlockScope) {
        // (some) prim failure blocks are special-cased to avoid  
        // initialization and zapping in the success path; since the
        // receiver block is being inlined, we need to make sure it's
        // properly initialized
        // (e.g. it could be created along some paths but not along others)
        r->memoize();
        theNodeGen->append(new BlockCloneNode(r, sig, true));
      }
    }
  }                           
    

  void SCodeScope::initialize() {
    containsNLR= method_map->containsNLR();
    if (method_map->containsLoop()) loopDepth++;
    assert(nslots == method()->map()->length_slots(), "just checkin'");
    assert(nargs == 0, "expecting nargs not to be set yet");
    if (isTop()) {
      // preallocate receiver, incoming args, locals
      self = receiver =
        new MapSExpr(receiverMapOop(),
                     new SAPReg(this, IReceiverReg, false, false,
                                PrologueBCI, ncodes-1),
                     0);
      incoming = allocateRegister(incoming, IReceiverReg);
      FOR_EACH_SLOTDESC_N(method()->map(), s, i) {
        if (s->is_arg_slot()) {
          oop ind= s->data;
          assert_smi(ind, "bad index");
          fint argIndex= smiOop(ind)->value();
          Location l = IArgLocation(argIndex);
          args[i]= new UnknownSExpr(new SAPReg(this, l, false, false, PrologueBCI, ncodes-1));
          incoming = allocateRegister(incoming, l);
          ++nargs;
        } 
      }
    } else {
      self = receiver = 0;            // will be set by caller
      // get args from sender's expression stack
      fint firstArgIndex=   sender()->exprStack->length()
                          - method()->map()->arg_count();
      FOR_EACH_SLOTDESC_N(method()->map(), s, i) {
        if (s->is_arg_slot()) {
          oop ind= s->data;
          assert_smi(ind, "bad index");
          fint argIndex= smiOop(ind)->value();
          args[i]= sender()->exprStack->nth(firstArgIndex + argIndex);
          ++nargs;
        }
      }
    }
  }
  
  void SCodeScope::prologue() {
    computeVScope();
    theNodeGen->enterScope(this);

    nlrPoints = NEW_RESOURCE_ARRAY(MergeNode*, ncodes + 1);
    for (fint i = 0; i < ncodes + 1; i++) { nlrPoints[i] = 0; }

    if (isTop()) {
      theNodeGen->prologue(theSIC->needRegWindowFlushes, false, nargs);
    }

    if (SICDebug) {
      char* s = NEW_RESOURCE_ARRAY(char, 100);
      sprintf(s, "%s@prologue: ", selector_string(selector()));
      theNodeGen->comment(s);
    }

    // NB: const init must come before slot initializations because some
    // slot may be initialized via a ConstPReg
    constInitNode = (ConstInitNode*)theNodeGen->append(new ConstInitNode);
    assert(!isTempReg(receiver->preg()->loc), "shouldn't be temp?");
    assert(!self || self == receiver, "what's self?");

    initLocals();

    postPrologue();

    flushPoint = theNodeGen->append(new NopNode);

    preallocateBlockExprs();

    if (isTop()) theNodeGen->testStackOverflow(currentExprStack(), sig);
    
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      assert(receiver->scope()->isSenderOrSame(this),
             "receiver must be in parent scope");
      assert(self->scope()->isSenderOrSame(this),
             "self must be in parent scope");
      for (fint j= 0; j < nslots; j++) {
        assert(args[j] == 0 || args[j]->scope()->isSenderOrSame(this),
               "arg must be in parent scope");
      }
    }
#   endif
  }

  void SCodeScope::initLocals() {
    oop m = method();
    FOR_EACH_SLOTDESC_N(m->map(), sd, n) {                // init locals
      if (sd->is_obj_slot()) {
        oop initialContents = m->get_slot(sd);
        locals[n]= new PReg(this);
        theNodeGen->loadOop(initialContents, locals[n]);
      } else if (sd->is_arg_slot() && isInlined()) {
        assert(!isTempReg(args[n]->preg()->loc), "shouldn't be temp?");
      }
    }
  }

  void SCodeScope::preallocateBlockExprs() {
    if (hasBranchBC) {
      // must preallocate blocks
      OopList* literals;
      IntList* blockBCIs = method_map->all_blocks(&literals);
      blockExprs = NEW_RESOURCE_ARRAY( SExpr*, ncodes );
      for ( int32 i = 0;  i < blockBCIs->length();  ++i ) {
        oop lit = literals->nth(i);
        assert_block(lit, "must be block");
        blockExprs[blockBCIs->nth(i)] = blockLiteral(blockOop(lit));
      }
    }
    else
      blockExprs = 0;
  }

  void SCodeScope::postPrologue() {
    if (self == 0) {
      self = receiver;
      assert(!isBlockScope(), "should set self differently");
    }
  }

  bool SCodeScope::isSenderOf(SSelfScope* callee) {
    assert(callee, "should have a scope");
    if (depth > callee->depth) return false;
    for (SSelfScope* s = callee->sender(); s; s = s->sender()) {
      if (this == s) return true;
    }
    return false;
  }

  
  
  // called by either materializeBlock or computeUplevelAccesses
  //  in order to recurse
  
  void SCodeScope::doUplevelAccesses(BlockPReg* blk, pregDoFn f) {
    // Blk is an escaping block.  Call f on all slots uplevel-accessed by
    // blk (except for constant slots).
    
    // compute uplevel-accessed locals
    slotsOop blockMeth= blk->block->value();
    blockMethodMap* bmm= (blockMethodMap*)blockMeth->map();
    IntList* slotIndices = 
      UseLocalAccessBytecodes
      ? bmm->uplevel_accessed_slots(method_map)
      : method_map->accessedSlots(bmm);

    // self is always up-level accessed
    f(blk, self->preg(), false);
    // In blocks, the receiver is uplevel accessed implicitly by NLRs of
    // nested blocks.  The code below may sometimes flush the receiver
    // unnecessarily, but it may be too complicated to figure out the
    // right thing.  Fix this if it becomes a performance problem.
    f(blk, receiver->preg(), false);
    
    for (IntListElem* e = slotIndices->head(); e; e = e->next()) {
      fint i= e->data();
      slotDesc* slot= method_map->slot(i);
      if (slot->name == VMString[SELF]) {
        // already handled
      } else if (slot->is_arg_slot()) {
        PReg* r = args[i]->preg();
        // NB: must call function repeatedly (i.e. even if r->uplevelR)
        // because r might be a local of a caller and be updated between
        // two calls that both uplevel-read it.
        f(blk, r, false);
      } else if (slot->is_map_slot()) {
        // constant slot - don't do anything
      } else {
        assert(slot->is_obj_slot(), "should be a data slot");
        PReg* r = locals[i];
        // for now, an up-level accessed local is always stack-allocated
        //  so pass in true for isWritten whether actually written or not.
        f(blk, r, true);
      }
    }
  }
  
  
  class sic_code_generator: public abstract_interpreter {
   protected:
    SCodeScope* sscope;
    
    IntListStream  exprStackBCIs;
    
   protected:
    SExpr* expr;
    
   public:
    fint           exprStackLength;
    
    
    void interpret_method();
    
  protected:

    void fetch_and_decode_bytecode();
    void interpret_bytecode();
    
    void do_SELF_CODE()  { sscope->exprStack->push( expr= sscope->self ); }
    void do_POP_CODE() { if ( !sscope->endsDead ) sscope->exprStack->pop();}

    void do_NONLOCAL_RETURN_CODE()  { sscope->returnCode(); }
    void do_read_write_local_code(bool isWrite);
    void do_literal_code(oop literal);
    void do_send_code( bool isSelfImplicit, stringOop sel, fint arg_count );
    
    void do_branch_code( int32 target_PC, oop target_oop = badOop ) {
      sscope->branchCode( pc, target_PC, target_oop);
    }
  
    void do_BRANCH_INDEXED_CODE()  { 
      sscope->branchIndexedCode( pc, get_branch_vector());
    }
    
    void write_expr_stack_info();
    
   public:
    sic_code_generator(SCodeScope*);
  
  };
  
  
  sic_code_generator::sic_code_generator(SCodeScope* ss) 
   : abstract_interpreter(ss->method()) {
    IntList* exprStackBCIList= 
      mi.map()->expression_stack_bcis( false);
                                    
    exprStackLength= exprStackBCIList->length();
    exprStackBCIs.init( exprStackBCIList, -1);
    sscope= ss;
  }
  
  
  void sic_code_generator::interpret_method() {
    abstract_interpreter::interpret_method();
    sscope->mergeInBranchTo(pc);
  }
  
  void sic_code_generator::fetch_and_decode_bytecode() {
    abstract_interpreter::fetch_and_decode_bytecode();
    expr= 0;
    sscope->prepareForBytecode(pc);
  }
  
  void sic_code_generator::interpret_bytecode() {
    sscope->mergeInBranchTo(pc);
    abstract_interpreter::interpret_bytecode();

    if (expr  &&  !sscope->endsDead) 
      sscope->expressions[pc] = expr->preg();

    write_expr_stack_info();
  }


  void sic_code_generator::do_read_write_local_code(bool isWrite) {
    expr= sscope->genLocalSend( !isWrite, is.lexical_level, is.index );
    sscope->exprStack->push(expr);
  }
  
  
  void sic_code_generator::do_literal_code(oop literal) {
    if (literal->is_block_with_code()) {
      expr= sscope->blockLiteral(blockOop(literal));
    }
    else {
      // don't clone empty blocks
      PReg* r = new SAPReg(sscope);
      theNodeGen->loadOop(literal, r);
      expr= new ConstantSExpr(literal, r, theNodeGen->current);
    }
    sscope->exprStack->push(expr);
  }
  
    
  void sic_code_generator::do_send_code( bool isSelfImplicit, stringOop sel, fint arg_count ) {
    expr= sscope->genSend(isSelfImplicit,
                   is.is_undirected_resend,
                   sel,
                   is.delegatee,
                   arg_count);
    sscope->exprStack->push(expr);
    assert(expr->isNoResultSExpr() || expr->scope()->isSenderOrSame(sscope),
           "result should be in my scope (or sender), not callee");
           
    if (expr->isNoResultSExpr()) {
      // the send we just compiled will never return (e.g. block with
      // NLR), so everything after this is dead code
      if (theNodeGen->current) {
        theNodeGen->comment("rest of method omitted (dead)");
        theNodeGen->append(new DeadEndNode);
      }
      sscope->endsDead = true;
      pc= mi.length_codes - 1; // signal early return (see interpret_bytecode)
    }
  }
  
  
  void sic_code_generator::write_expr_stack_info() {
    if (pc == exprStackBCIs.current) {
      // remember expr stack elem for debugging info
      sscope->exprStackElems->append(sscope->endsDead
                                     ? 0
                                     : sscope->exprStack->top());
      exprStackBCIs.advance();
    }
    if (sscope->endsDead) {
      // write placeholders for the dead expr stack elems
      while (sscope->exprStackElems->length()  <  exprStackLength) {
        sscope->exprStackElems->append(0);
      } 
    }
  }



  void SCodeScope::prepareForBytecode(fint pc) {
    _bci= pc;
    if (SICDebug) {
      char* s = NEW_RESOURCE_ARRAY(char, 100);
      oop sel= selector();
      sprintf(s, "%s@%ld: ", 
              sel->is_string()
                ? stringOop(sel)->copy_null_terminated()
                : "<not a string>",
              long(pc));
      theNodeGen->comment(s);
    }
    if ( vscope  &&  pc == vscope->vf->bci()) {
      // mark this code position as a restart point when replacing nmethods
      // on the stack
      // potential bug: don't distinguish between prim call and fail send
      theNodeGen->append(marker = new MarkerNode( exprStack, sig));
    }
  }
  
   
  void SCodeScope::genCode() {
    startOfScope = (MergeNode*)theNodeGen->append(
      new MergeNode("genCode startOfScope"));
    endOfScope = isTop() ? 0 : new MergeNode("genCode endOfScope");
    
    sic_code_generator scg(this);
    
    scg.interpret_method();    
    assert( exprStackElems->length() ==  scg.exprStackLength,
           "not enough expr stack elems written");
    _bci = ncodes - 1;
  }


  void SCodeScope::mergeInBranchTo(int32 pc) {
    // called each bc (and after last one)
    // to handle case if bc is target of a branch bc
    
    if (!hasBranchBC)
      return;
      
    MergeNode* bt = branchTargets[pc];
    if ( !bt ) 
      return; // not target
    bt->setScope(this);
    
    // must move expr stack to common locs for merge
    BranchBCTargetStack* stk = getBranchTargetStack(pc);
    // move values to common locs
    stk->mergeInExprsFromStack(exprStack, bt, false); 
    stk->moveExprsToStack(exprStack);      // fix exprs in exprStack
    
    theNodeGen->append(bt);                // now merge
  }
  
  
  BranchBCTargetStack* SCodeScope::getBranchTargetStack( int32 pc ) {
    // get the stack of SExprs for a branch going to bci pc
    BranchBCTargetStack*& res = branchTargetStacks[pc];
    if ( res == 0 ) {
      res = new_BranchBCTargetStack( 
              this,
              backwards_branch_targets->nth(pc),
              exprStack->length(),
              pc );
    }
    return res;
  }


  void SCodeScope::branchCode(  int32 pc,
                                int32 target_PC, 
                                oop target_oop ) {
     
    assert(hasBranchBC, "better know in advance");
    SExpr* testExpr;
    PReg*  targetPR;
    if ( target_oop == badOop ) {
      targetPR = 0;
      testExpr = 0;
    }
    else {
      targetPR = new_ConstPReg( this, target_oop);
      testExpr = exprStack->pop();
    }
      
    theNodeGen->branchCode( branchTargets[target_PC], 
                            target_PC <= pc,
                            targetPR,
                            testExpr,
                            getBranchTargetStack(target_PC),
                            exprStack,
                            currentExprStack(),
                            sig );
  }


  void SCodeScope::branchIndexedCode(  int32 pc,
                                       objVectorOop targets ) {
     
    assert(hasBranchBC, "better know in advance");
    PReg* testPR = exprStack->pop()->preg();
    int32 n = targets->length();
    MergeNode** targetNodes = NEW_RESOURCE_ARRAY( MergeNode*, n );
    bool*        isBackward = NEW_RESOURCE_ARRAY( bool,       n );
    BranchBCTargetStack**  myTargetStacks = 
      NEW_RESOURCE_ARRAY( BranchBCTargetStack*, n);
    for (int32 i = 0;  i < n;  ++i) {
      oop t = targets->obj_at(i);
      assert_smi(t, "target must be smi");
      int32 tt = smiOop(t)->value();
      assert( 0 <= tt  &&  tt < ncodes + 1,  "target must be in range");
      targetNodes[i] = branchTargets[tt];
      isBackward[i]  = tt <= pc;
      myTargetStacks[i] = getBranchTargetStack(tt);
    }
      
    theNodeGen->branchIndexedCode( n,
                                   targetNodes, 
                                   isBackward,
                                   testPR,
                                   myTargetStacks,
                                   exprStack,
                                   currentExprStack(),
                                   sig );
  }


  // code for block literal (possibly memoizing)
  SExpr* SCodeScope::blockLiteral(blockOop literal) {
    // Here's how it works: we clone the block and its map and store the
    // SScope* pointer in the block map's _desc field (because we don't know
    // the correct scope desc value yet).  Later, after generating
    // the scope descs, we go through the list of cloned blocks and fix up
    // their _descs by directly overwriting (so they
    // don't get yet another map).
    
    // For branches, this is called when bci == PrologueBCI
    // to create these early. Then it is called again
    // when bci != PrologueBCI and just returns what was earlier
    // created. The early creation is needed in case the normal
    // creation point is branched around; the "register" needs to
    // be allocated and initialized for the zapping code. -- dmu

    if ( hasBranchBC  &&  _bci != PrologueBCI ) {
      // was preallocated
      return blockExprs[_bci];
    }
    blockMap *map= (blockMap*)literal->map();
    assert(map->desc() == BLOCK_PROTO_DESC, "should be a prototype block");

    blockOop clone = literal->clone_and_set_desc(
                                     as_byte_count_smiOop((int32)this));
    assert(!clone->is_mark() && clone->map() != map, "should have new map");

    BlockPReg* loc = new BlockPReg(this, clone, _bci, ncodes - 1);
    if ( _bci == PrologueBCI )
      loc->memoize(); // creating for branch, memoize for sure
    blocks->append(loc);

    theNodeGen->loadBlockOop(loc, sig);
    SExpr* r =  new ClonedBlockSExpr(clone->map()->enclosing_mapOop(), loc,
                                     theNodeGen->current);
    blockElems->append(r);
    return r;
  }
  
  
  void SMethodScope::returnCode() {
    // normal return -- handled in standard epilogue
  }
  
  void SBlockScope::returnCode() {
    if (CatchInterprocessReturns) {
      SScope* s = this;
      PReg* t = theNodeGen->nlrHomePR;
      do {
        s->loadParentScope(t);
        s = s->parent();
      } while (s->isBlockScope() || s->isVFrameBlockScope());
      PrimDesc* pd = getPrimDescOfFunction(
                fntype(&catch_interprocess_returns), true);
      theNodeGen->loadArg( -1, receiver->preg(), true);
      theNodeGen->append(
        new PrimNode( pd,
                      0, 0, currentExprStack(0),
                      0, 0));
    }
    // load home scope and other NLR registers
    SScope* s = this;
    PReg* t = theNodeGen->nlrHomePR;
    do {
      s->loadParentScope(t);
      s = s->parent();
    } while (s->isBlockScope() || s->isVFrameBlockScope());
    if (s->isVFrameScope()) {
      theNodeGen->prepareNLR(exprStack->pop()->preg(), t, homeID());
      if (!nlrPoint()) theNodeGen->continueNonLocalReturn();
    } else {
      // inlined NLR
      assert(s->isMethodScope(), "must be a method");
      nlrResult = exprStack->pop();
      // BUG: returned block won't be marked as escaped because NLRNode
      // has no src -- but it cannot be invoked, so that's ok
      // need to materialize - otherwise dead block isn't recognized
      theNodeGen->materializeBlock(nlrResult->preg(), sig, new PRegBList(1));

      const fint MaxBlocksToKill = 10;
      // If less than MaxBlocksToKill need to be killed, do it here & return;
      // otherwise, share code wih normal NLR sequence (slower but smaller).
      // The expected cost really is smaller than MaxBlocksToKill because
      // many blocks will be eliminated and thus have zero kill cost.
      fint nblocks = 0;
      BlockPRegBList kill(MaxBlocksToKill);
      for (SCodeScope* ss = this;
           nblocks <= MaxBlocksToKill; 
           ss = ss->sender()) {
        BlockPRegBList* l = ss->blocks;
        for (fint i = l->length() - 1; i >= 0; i--) {
          BlockPReg* bl = l->nth(i);
          if (!bl->primFailBlockScope) {
            nblocks++;
            kill.append(bl);
          }
        }
        if (ss == s) break;
      }
      if (nblocks <= MaxBlocksToKill) {
        theNodeGen->comment("inlined NLR");
        for (fint i = kill.length() - 1; i >= 0; i--) {
          BlockPReg* bl = kill.nth(i);
          if (!bl->primFailBlockScope) theNodeGen->zapBlock(bl);
        }
        if (s->isTop()) {
          fint o = theSIC->send_desc->endOffset(theSIC->L->lookupType());
          theNodeGen->append(new MethodReturnNode(o, true, nlrResult->preg()));
        } 
        else {
          assert(s->isCodeScope(), "must be a SelfScope");
          SCodeScope* s2= (SCodeScope*)s;
          theNodeGen->move(nlrResult->preg(), s2->resultPR);
          theNodeGen->branch(s2->endOfScope);
          s2->addResult(nlrResult->shallowCopy(s2->resultPR, 0));
        }
        return;
      } 
      else {
        // have to set up the NLR regs so we can share the nlrPoint code
        // (not optimal since we'll do a superflous test for "home reached",
        // but it saves code space)
        assert(nlrPoint(), "should have NLR point");
        theNodeGen->append(new LoadIntNode(homeID(), theNodeGen->nlrHomeIDPR));
        theNodeGen->move(theNodeGen->framePR, theNodeGen->nlrHomePR);
        theNodeGen->move(nlrResult->preg(), theNodeGen->nlrResultPR);
        assert(s->isSelfScope(), "must be a SelfScope");
        SSelfScope* s2 = (SSelfScope*)s;
        s2->addResult(nlrResult->shallowCopy(s2->resultPR, 0));
      }
    }
    // jump to NLRpoint (to kill off blocks etc.)
    if (nlrPoint()) theNodeGen->branch(nlrPoint());
  }
  
  void SCodeScope::epilogue() {
    // _bci = EpilogueBCI;
    // EpilogueBCI would be more correct but creates lots of bugs
    _bci = ncodes - 1;
    inEpilogue = true;
    SExpr* resExpr = 0;
    if (!endsDead) {
      bool noNLR = exprStack->length() == 1;
      if (noNLR) {
        resExpr = exprStack->pop();
        // need to materialize - otherwise dead block isn't recognized
        theNodeGen->materializeBlock(resExpr->preg(), sig, new PRegBList(1));
      }
      if (isMethodScope() || noNLR) {
        // either a normal method, or no NLR from block
        // zap all blocks
        for (fint i = blocks->length() - 1; i >= 0; i--) {
          BlockPReg* bl = blocks->nth(i);
          if (!bl->primFailBlockScope) theNodeGen->zapBlock(bl);
        }
      }
      // return last expr if no explicit return
      if (resExpr) {
        theNodeGen->move(resExpr->preg(), resultPR);
        addResult(resExpr->shallowCopy(resultPR, theNodeGen->current));
        if (isTop()) {
          fint offset = theSIC->send_desc->endOffset(theSIC->L->lookupType());
          theNodeGen->append(new MethodReturnNode(offset, true, resultPR));
        } else {
          theNodeGen->branch(endOfScope);
        }
      }
      assert(exprStack->length() == 0, "non-empty expr stack");
    }
    genNLRPoints();
    if (endOfScope) {
      // if the endOfScope node is not reached it must not
      //  be put in theNodeGen->current, cause that would create
      //  a merge with a predecessor that is never run, which messes up
      //  dead-code elimination. -- dmu
      if (endOfScope->nPredecessors() > 0) {
        theNodeGen->current = endOfScope;
        if (resExpr)
          theNodeGen->append(new InlinedReturnNode(resExpr->preg(), resultPR));
      }
      else
        theNodeGen->current = 0;
    }
    if (!result) {
      // scope never returns anything
      assert(isBlockScope() && containsNLR || endsDead,
             "should have a result");
      result = new NoResultSExpr;
    } else if (result->hasMap() && result->map()->is_block()) {
      SCodeScope* s = BlockPReg::scopeFromBlockMap(result->myMapOop());
      if (s && isSenderOrSame(s)) {
        // prevent block from being inlined because block is non-LIFO
        result = new UnknownSExpr(resultPR);
      }
    }
    theNodeGen->exitScope(this);
  }
  
  inline MergeNode* SCodeScope::nlrPoint(fint n) {
    // wrapper for nlrPoints array - creates merge nodes on demand
    if (nlrPoints[n] == 0) {
      nlrPoints[n] = new MergeNode("nlrPoint n");
      nlrPoints[n]->setScope(this); // 'cause we might not be current scope
    }
    return nlrPoints[n];
  }

  bool SCodeScope::haveNLRPoint() {
    // does this scope have at least one NLR point?
    // it must have one if 
    //  - any subscope has one (including primitive subscopes), or
    //  - it has a NLR, or
    //  - it has non-inlined sends, and any superscope has an NLR point

    // for efficiency, cache result (once true it will always be true,
    // and once we're done with this scope it won't change)
    if (_haveNLRPoint || inEpilogue) return _haveNLRPoint;        

    _haveNLRPoint = haveNLR();
    for (fint i = subScopes->length() - 1; i >= 0 && !_haveNLRPoint; i--) {
      SSelfScope* ss = subScopes->nth(i);
      _haveNLRPoint = ss->haveNLRPoint();
    }

    for (SCodeScope* s = _sender; s && !_haveNLRPoint; s = s->_sender) {
      _haveNLRPoint = s->_haveNLRPoint;
    }
    return _haveNLRPoint;
  }

  MergeNode* SCodeScope::nlrPoint() {
    // return nlr point for current # of blocks
    return haveNLRPoint() ? nlrPoint(blocks->length()) : 0;
  }

  PRegBList* SCodeScope::currentExprStack(fint exclude) {
    PRegBList* es = new PRegBList(exprStack->length() - exclude);
    for (fint i = 0; i < exprStack->length() - exclude; i++) {
      es->push(exprStack->nth(i)->preg());
    }
    return es;
  }
  
  void SCodeScope::genNLRPoints() {
    if (!haveNLRPoint()) return;       // no code needed
    
    // generate NLR code for all inline caches in this method
    fint n = blocks->length();
    
    // We don't want to add unreachable merges
    
    for ( ; n >= 0  &&  nlrPoint(n)->nPredecessors() == 0;  --n)
      ;
    if (n < 0) // cannot reach any nlrPoints, do not make any code
      return;

    if (n == 0) {
      // we don't have (reachable--dmu) nested blocks, 
      //  so we can't be the home of any NLR
      // but we need to be able to continue NLRs, so generate code for that
      theNodeGen->current = nlrPoint(n);
      continue_NLR();
      theNodeGen->current = 0;
      return;
    }
    // order NLR code so can share code -- so NLR point with longest
    // block list to kill comes first
    // kill all blocks (in reverse order of creation)
    
    theNodeGen->current = nlrPoint(n);
    
    for (fint i = 0; i < n; i++) {
      theNodeGen->branch(nlrPoint(n - i));
      BlockPReg* bl = blocks->nth(n - i - 1);
      if (!bl->primFailBlockScope) theNodeGen->zapBlock(bl);
    }

    theNodeGen->branch(nlrPoint(0));
    if (haveNLR() && isMethodScope()) {
      // generate code testing whether NLR has reached its home
      Node* finalReturn = theNodeGen->testNLR(scopeID());
      // generate code for the two outcomes (NLR home reached/not reached)
      continue_NLR(); // "not reached" code
      // now do the "reached" code
      if (isTop()) {
        fint offset = theSIC->send_desc->endOffset(theSIC->L->lookupType());
        finalReturn->append(new MethodReturnNode(offset, true,
                                                 theNodeGen->nlrResultPR));
      } else {
        if (result == 0) {
          // normal code doesn't reach end of method, and none of our
          // blocks' NLRs was inlined
          assert(endsDead, "should have a result");
        } 
        // need to take into account possible non-inlined NLR result 
        // performance bug: don't need to pollute result if all NLRs
        // were inlined
        if (nsends) addResult(new UnknownSExpr(resultPR));
        Node* nn = new AssignNode(theNodeGen->nlrResultPR, resultPR);
        finalReturn->append(nn);
        nn->append(endOfScope);
      }
      theNodeGen->current = 0;
    } else {
      // can't be the target of any NLR
      continue_NLR(); 
    }
  }

  void SCodeScope::continue_NLR() {
    // search up the (inlined) call chain to find a possible NLR home
    SCodeScope *s;
    for (s = sender(); s && !s->nlrPoint(); s = s->sender()) ;
    if (s) {
      PReg* r = theNodeGen->nlrResultPR;
      theNodeGen->append(new InlinedNonLocalReturnNode(r, r));
      theNodeGen->branch(s->nlrPoint());
    } else {
      // none of the callers can possibly be the home of an NLR
      theNodeGen->continueNonLocalReturn();
    }
  }
  
  SExpr* SCodeScope::genPrim(SendInfo* info) {
    // primitive call or perform
    LookupType performLookupType;
    bool isPerform = checkPerformPrim(info->sel, performLookupType);
    SExpr* rcvr = info->isSelfImplicit  ? self : 0;    
    SPrimScope* prim;
    if (isPerform) {
      prim = new SPerformPrimScope(this, performLookupType, info->sel,
                                   info->del, rcvr);
    } else if (info->sel == VMString[_RESTART] ||
               info->sel == VMString[_RESTART_IF_FAIL]) {
      prim = new SRestartPrimScope(this, info->sel, info->rcvr);
    } else {
      prim = new SPrimScope(this, info->sel, rcvr, bci() == ncodes - 1);
    }
    prim->genCode();
    return prim->result;
  }

  void SCodeScope::markLocals(PRegBList* expStk) {
    // this scope has at least one send - mark locals as debug-visible
    if (nsends == 0) {
      // first time we're called
      self->preg()->debug = true;
      receiver->preg()->debug = true;
      for (fint i = 0; i < nslots; i++) {
        if (args[i]) args[i]->preg()->debug = true;
        if (locals[i]) locals[i]->debug = true;
      }
    }
    // also mark expression stack as debug-visible (excluding arguments to
    // current send) (the args are already excluded from the CallNode's
    // expression stack, so just use that one instead of this->exprStack)
    for (fint i = 0; i < expStk->length(); i++) {
      expStk->nth(i)->debug = true;
    }
  }

  void SCodeScope::addSend(PRegBList* expStk) {
    if (!expStk) return;                    // not an exposing send
    for (SCodeScope* s = this;
         s && s->isCodeScope(); s = s->sender()) {
      // possible performance bug: currently, the expr stack elems of a prim
      // that scavenges but doesn't walk the stack are marked debug-visible.
      // In reality, the should only be allocated to non-temp regs but can
      // be freely copy-propagated etc.  But such prims are exceedingly rare.
      s->markLocals(expStk);
      s->nsends++;
    }
  }

  void SCodeScope::computeMaskFor(SAPReg* r, fint stackLocs,
                                  fint nonRegisterArgs) {
    // r belongs to our scope; mark its live range
    // (note that "belongs to this scope" doesn't mean "is an expr stack entry
    // in this scope" -- the SAPReg may have been copy-propagated from another
    // scope)
    assert(r->scope == this, "not in this scope");
    if (nsends == 0) return;                 // don't need to compute masks

#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions  &&  r->isBlockPReg() && ((BlockPReg*)r)->primFailBlockScope) {
        // a prim fail block is only live after the prim has failed
        // (in that range it will be marked because it is the receiver of
        // the fail send)
        // but the code is currently broken, so the reg is always initialized
        // (see BlockCloneNode::gen), must mark it live
        assert(r->creationScope == this, "shouldn't have CPed block");
      }
#   endif

    RegisterString mask = registerMaskBit(r->loc, stackLocs, nonRegisterArgs);
    if (mask == 0) return;
    if (r->isSplitPReg()) {
      // don't mark split regs here - each send will mark them iff the
      // reg is live at that send
      splitRegs->append(r);
      return;
    }
    
    // don't mark startBCI because r is not live at beginning of startBCI
    // (but it is at the end of startBCI)
    fint i; 
    // added min w.r.t ncodes-1 to handle endBCI == ncodes
    //  for branch bcs -- dmu
    fint end = min(r->endBCI, ncodes - 1);
    // added max for i because startBCI can be -2 and allocs starts at 0.
    // also added it two more places below.
    //   -- dmu 4/22/04
    for (i = max(0, r->startBCI + 1); i <= end; i++) {
      allocs[i] |= mask;
    }
    SCodeScope* s = r->creationScope->sender();
    if (r->creationScope != this) {
      // r was constant-propagated out of its scope; need to mark it live
      // in subscopes.  E.g. if r is created in C where A@0 calls B@0 calls C,
      // and r was propagated to A, need to mark it live in B@1 
      fint start = r->creationScope->senderBCI();
      while (s != this) {
        for (i = max(0, start + 1); i < s->ncodes; i++) {
          s->allocs[i] |= mask;
        }
        start = s->senderBCI();
        s = s->sender();
      }
      // also mark it live in creation scope ]creationStartBCI..end]
      s = r->creationScope;
      for (i = max(0, r->creationStartBCI + 1); i < s->ncodes; i++) {
        s->allocs[i] |= mask;
      }
    }
  }

  void SCodeScope::computeMasks(RegisterString base, fint stackLocs,
                                fint nonRegisterArgs) {
    // called after reg. allocation to compute register masks for sends
    // the bits corresponding to SAPRegs have already been set
    if (nsends == 0) {
      // don't need to compute masks
      allocs = 0; // to catch bugs - shouldn't ever ask for allocs
      return;
    }

    base |= registerMaskBit(    self->preg()->loc, stackLocs, nonRegisterArgs);
    base |= registerMaskBit(receiver->preg()->loc, stackLocs, nonRegisterArgs);
    // compute base mask 
    fint i;
    for (i = 0; i < nslots; i++) {
      if (locals[i]) {
        base |= registerMaskBit(locals[i]->loc, stackLocs, nonRegisterArgs);
      } else if (args[i]) {
        // args are either covered by enclosing scope, or they are SAPRegs
        PReg* r = args[i]->preg();
        assert(r->isSAPReg() ||
               r->scope->isSenderOf(this), "oops");
        // nevertheless, we need to set the bit because prim fail block args
        // (prim name / error string) wouldn't be marked otherwise (their
        // lifetime can't reallybe expressed in bcis because it starts in
        // the middle of the prim call bci, i.e., the prim call bci has
        // two sends...sigh)
        base |= registerMaskBit(r->loc, stackLocs, nonRegisterArgs);
      }        
    }

    // add constants allocated to registers
    ConstPRegBList* constants = &constInitNode->constants;
    for (i = constants->length() - 1; i >= 0; i--) {
      base |= registerMaskBit(constants->nth(i)->loc, stackLocs, nonRegisterArgs);
    }
    
    for (i = 0; i < ncodes; i++) allocs[i] |= base;

    // make sure prim fail blocks are scavenged correctly
    for (i = 0; i < ncodes; i++) {
      PReg* r = expressions[i];
      if (r && r->isBlockPReg() &&
          ((BlockPReg*)r)->primFailBlockScope == this) {
        // mark block live from here to end of scope (should be exactly
        // two bcis: literal/arg acces, and the prim. call
        
        // Except for index bytecodes! -- dmu
        // Used to just mark allocs[i] and allocs[i+1] 
        // with following check:
        //  assert(i == ncodes - 2, "should be 2nd last byte code");
        // Now mark through next non-index bytecode:
        
        int32 mask = registerMaskBit(r->loc, stackLocs, nonRegisterArgs);
        allocs[i] |= mask;
        
        for ( int32 nextNonIndexBCI = i + 1;
              getOp( method_map->start_codes()[nextNonIndexBCI] )
                ==  INDEX_CODE;
              ++nextNonIndexBCI ) {
          if (nextNonIndexBCI >= ncodes)
            fatal("should have found a prim call");
          allocs[nextNonIndexBCI] |= mask;
        }
      }
    }

    // compute masks of subscopes
    for (i = 0; i < subScopes->length(); i++) {
      SSelfScope* s = subScopes->nth(i);
      s->computeMasks(allocs[s->senderBCI()], stackLocs, nonRegisterArgs);
    }
  }

  // register allocation: if r is being allocated to a PReg of a scope,
  // it is marked as unavailable in all subscopes and all superscopes.
  // (But it is still available in sibling scopes and their subscopes.)
  // r is the RegisterString for the register

  inline void SSelfScope::allocateUp(PReg* r, bool okToOverlap) {
    Unused(okToOverlap);
    // mark reg as taken in callers
    // (don't need to worry about lexical chain because it must be a subset
    // of the calling chain)
    SSelfScope* callee = this;
    for (SCodeScope* s = sender(); s; callee = s, s = s->sender()) {
      s->markReg(r, callee->senderBCI(), callee->senderBCI());
    }
  }
  
  inline void SAccessScope::allocateDown(PReg* r, fint start, fint end,
                                         bool okToOverlap) {
    Unused(start); Unused(end);
    assert(!regs.isAllocated(r->loc) || r->weight < 0 || okToOverlap,
           "already allocated");
    markReg(r, -1, -1);
  }

  void SAccessScope::allocateReg(PReg* r, bool okToOverlap) {
    assert(!regs.isAllocated(r->loc) || r->weight < 0 || okToOverlap,
           "already allocated");
    markReg(r, 0, 0);
    allocateUp(r, okToOverlap);
  }
  
  void SAccessScope::markReg(PReg* r, fint start, fint end) {
    Unused(start); Unused(end);
    regs.allocate(r->loc);
  }
    
  void SCodeScope::markReg(PReg* r, fint start, fint end) {
    Location l = r->loc;
    for (fint i = start; i <= end; i++) {
      regs[i]->allocate(l);
    }
  }
    
  inline void SCodeScope::getLiveRange(PReg* r, fint& start, fint& end) {
    if (r->isSAPReg()) {
      // get live range of r
      SAPReg* sr = (SAPReg*)r;
      start = max(sr->startBCI, 0);
      end = sr->endBCI < 0 ? ncodes - 1 : sr->endBCI;
    } else {
      start = 0; end = ncodes - 1;
    }
    assert(start >= 0 && start < ncodes, "invalid bci");
    assert(end   >= 0 && end   < ncodes, "invalid bci");
  }
  
  void SCodeScope::allocateReg(PReg* r, bool okToOverlap) {
    fint start, end;
    getLiveRange(r, start, end);
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      for (fint i = start; i <= end; i++) {
        assert(!regs[i]->isAllocated(r->loc) || r->weight < 0 || okToOverlap,
               "already allocated");
      }
    }
#   endif
    allocateUp(r, okToOverlap);
    allocateDown(r, start, end, okToOverlap);
  }
  
  
  // Return true if this scope is deleted.
  // Optimizations delete nodes and pseudo registers.
  // Splitting clones nodes, creating multiple copies of a scope's
  // nodes.
  // If all ways up to me are deleted, then there is no point generating
  // scope, etc info for me. And it would be impossible anyway, since
  // the pregs would not even be allocated anywhere. -- dmu 7/96
  
  bool SCodeScope::isDeleted() {
    for (ConstInitNode* n = constInitNode;  n;  n = n->nextCopy) {
      if (!n->deleted)
        return false;
    }
    return true;
  }


  void SCodeScope::allocateConst(ConstPReg* r) {
    for (ConstInitNode* n = constInitNode; n; n = n->nextCopy) {
      n->addConstant(r);
    }
  }

  // is register/stack temp l available in r's live range?
  bool SAccessScope::isRegAvailable(PReg* r, Location l, RegisterString in) {
    Unused(r); Unused(in);
    return !regs.isAllocated(l);
  }

  Location SAccessScope::findReg(PReg* r, fint firstRegisterIndexToUse,
                                 RegisterString incoming) {
    Unused(r);
    RegisterString taken = regs.regs() | incoming;
    fint i;
    for (i = firstRegisterIndexToUse;
         isAllocated(taken, CalleeSavedRegs[i]) && i < NumCalleeSavedRegs;
         i++) ;
    if (i < NumCalleeSavedRegs) {
      // found a free register 
      return CalleeSavedRegs[i];
    } else {
      return UnAllocated;
    }
  }
  
  bool SCodeScope::isRegAvailable(PReg* r, Location l, RegisterString inc) {
    if (isRegister(l) && isAllocated(inc, l)) return false;
    fint start, end;
    getLiveRange(r, start, end);
    for (fint i = start; i <= end; i++) {
      if (regs[i]->isAllocated(l)) return false;
    }
    return true;
  }
  
  Location SCodeScope::findReg(PReg* r, fint firstRegisterIndexToUse,
                               RegisterString incmng) {
    fint start, end;
    getLiveRange(r, start, end);
    RegisterString taken = incmng;
    fint i;
    for (i = start; i <= end; i++) taken |= regs[i]->regs();
    for (i = firstRegisterIndexToUse;
         isAllocated(taken, CalleeSavedRegs[i]) && i < NumCalleeSavedRegs;
         i++) ;
    if (i < NumCalleeSavedRegs) {
      // found a free register 
      return CalleeSavedRegs[i];
    } else {
      return UnAllocated;
    }  
  }
  
  Location SAccessScope::findStackTemp(PReg* r) {
    Unused(r);
    LongRegisterString* rs = &regs;
    return (Location)findFirstUnusedTemp(&rs, 1);
  }
  
  Location SCodeScope::findStackTemp(PReg* r) {
    fint start, end;
    getLiveRange(r, start, end);
    return (Location)findFirstUnusedTemp(&regs[start], end - start + 1);
  }
  
  
  SExpr* SCodeScope::genLocalSend( bool isRead, fint lexicalLevel,
                                   fint index) {
    assert(UseLocalAccessBytecodes, "harbinger of the future");
    slotDesc* sd = method_map->getLocalSlot(lexicalLevel, index);

    SScope* s = this;
    for (fint i = 0;  i < lexicalLevel;  ++i)
      s = s->parent();

    SExpr* res = genLocalSend( isRead ? sd->name : sd->assignment_slot_name(),
                               sd,
                               s);
    assert(res, "is local");
    return res;
  }
  
  
  SExpr* SCodeScope::genSend( bool isReceiverImplicit,
                              bool isUndirectedResend,
                              stringOop sel,
                              stringOop del,
                              fint arg_count) {
                            
    SendInfo* info = new SendInfo(0, 0, 
                                  isReceiverImplicit,
                                  isUndirectedResend,
                                  sel,
                                  del);
    info->computeNSends(rscope, _bci);
    if (sel->is_string() && sel->is_prim_name()) {
      return genPrim(info);
    }
    
    LookupType lookupType;
    if (del != 0) {
      assert(isReceiverImplicit, "directed resend must be to implicit self");
      lookupType = DirectedResendLookupType;
    }
    else if (isUndirectedResend) {
      lookupType = ResendLookupType;
    }
    else if (isReceiverImplicit) {
      if (!UseLocalAccessBytecodes) {
        SExpr* res = genLocalSend(sel);
        if (res) return res;        // was local send
      }
      lookupType = ImplicitSelfLookupType;
    }
    else {
      lookupType = NormalLookupType;
    }
    info->l = lookupType;
    info->rcvr =   isReceiverImplicit
      ? self
      : exprStack->nth(exprStack->length() - arg_count - 1);
    return inlineSend(info);
  }

  SExpr* SCodeScope::genRealSend(SendInfo* info) {
    if (PrintInlining) {
      lprintf("%*s*sending %s\n", (void*)depth, "",
              selector_string(info->sel));
    }
    if (info->rcvr->isUnknownSExpr()) {
      theSIC->registerUninlinable(info, NormalFnLimit, 0);
    } else {
      // known receiver - registerUninlinable already handled
    }
    LookupType lookupType = withCountBits(info->l, info->countType);
    if (theRecompilation && SICUseOptimizedSDFlag && !info->primFailure) {
      lookupType |= OptimizedSendMask;
      if (info->uninlinable) {
        // don't count
      } else {
        lookupType = withCountBits(lookupType, Comparing);
      }
    } else {
      // either we have only one compiler (so the flag is redundant), or we're
      // prematurely compiling with the SIC (e.g. isCriticalSend), or this
      // nmethod is from a sd with OptimizedSendMask; don't propagate
      // Optimized flag
    }
    if (info->uninlinable) {
      lookupType |= UninlinableSendMask;
    }
    if (nstages == 1 || (recompilee && recompilee->version() >= MaxVersions-1)) {
      // don't use any counting code
      lookupType = withCountBits(lookupType, NonCounting);
    } else if (currentProcess->isUncommon() && !info->uninlinable) {
      // make it counting so uncommon version gets replaced after a while
      lookupType = withCountBits(lookupType, Comparing);
    }
    
    // push args and generate call
    fint argc = info->sel->arg_count();
    fint top = exprStack->length();
    theSIC->allocateArgs(argc, false);
    PReg* rcvr = info->rcvr->preg();

    // materialize memoized blocks
    PRegBList* blks = new PRegBList(5);
    fint i;
    for (i = 1; i <= argc; i++) {
      PReg* l = exprStack->nth(top - i)->preg();
      theNodeGen->materializeBlock(l, sig, blks);
    }
    theNodeGen->materializeBlock(rcvr, sig, blks);

    // Make sure NLR points are created - we need one if there are
    // blocks to kill or if an superscope has NLRs.  Since the latter
    // is hard to test, just assume it's so.
    _haveNLRPoint |= blocks->length() > 0 || isInlined();

    // move args to arg regs
    for (i = 1; i <= argc; i++) {
      PReg* l = exprStack->nth(top - i)->preg();
      theNodeGen->loadArg(argc - i, l, false);
    }

    fint exclude = argc;
    if (!info->isSelfImplicit) exclude++;
    theNodeGen->loadArg(-1, rcvr, false);        // load receiver
    Node* call = theNodeGen->selfCall(this, lookupType, self->preg(),
                                      info->sel, info->del,
                                      methodHolder_or_map(), 
                                      nlrPoint(), argc,
                                      currentExprStack(exclude), sig);
    theNodeGen->move(call->dest(), info->resReg);  
    return new UnknownSExpr(info->resReg, theNodeGen->current);
  }
  
  SScope* SMethodScope::lookup(stringOop sel, slotDesc*& sd) {
    sd = method()->find_slot(sel);
    return sd ? this : 0;
  }
  
  SScope* SBlockScope::lookup(stringOop sel, slotDesc*& sd) {
    sd = method()->find_slot(sel);
    return sd ? this : parent()->lookup(sel, sd);
  }
  
  SScope* SDeadBlockScope::lookup(stringOop sel, slotDesc*& sd) {
    Unused(sel);
    sd = 0; return 0;
  }
  
  SScope* SVFrameMethodScope::lookup(stringOop sel, slotDesc*& sd) {
    sd = _vf->method()->find_slot(sel);
    return sd ? this : 0;
  }
  
  SScope* SVFrameBlockScope::lookup(stringOop sel, slotDesc*& sd) {
    sd = _vf->method()->find_slot(sel);
    return sd ? this : parent()->lookup(sel, sd);
  }
  
  SExpr* SCodeScope::genLocalSend( stringOop sel, slotDesc* sd, SScope* s) {
    if (sd == 0) {
      s = lookup(sel, sd);
    }
    if (s != 0) {
      // found a lexically-scoped slot with this name
      // s is the scope containing the slot
      fint argc = sel->arg_count();
      assert(argc == 0 || argc == 1, "wrong number of args");
      NameDesc* nd = 0;
      if (sd->is_map_slot() ||
          (s->isVFrameScope() &&
          (nd = s->vf()->get_name_desc(sd, true), nd && nd->isValue()))) {
        // load value of constant slot or of unallocated (constant) data slot
        assert(argc == 0, "must be an access");
        oop p = nd ? nd->value() : sd->data;
        PReg* reg = new_ConstPReg(this, p);
        return new ConstantSExpr(p, reg, theNodeGen->current);
      } else {
        // generate access code
        PReg* reg = s->isVFrameScope() ? new TempPReg(this) : 0; 
        return genLocal(s, this, sd, argc, reg);
      }
    } else {
      return 0;
    }
  }
  
  SExpr* SCodeScope::local(SCodeScope* sender, slotDesc* sd,
                           fint argc, PReg* t) { 
    Unused(t);
    oop m = method();
    if (sd->is_map_slot()) {
      // load constant slot
      assert(argc == 0, "must be an access");
      PReg* reg = new_ConstPReg(sender, sd->data);
      return new ConstantSExpr(sd->data, reg, theNodeGen->current);
    } else {
      // slot access or assignment
      bool isArg = sd->is_arg_slot();
      if (isArg) {
        return args[sd - m->map()->slots()];
        // don't need to actually assign anything
      } 
      assert(sd->is_obj_slot(), "unexpected slot type");
      PReg* l = locals[sd - m->map()->slots()];
      SExpr* expr;
      if (argc == 0) {
        // slot access
        SAPReg* res = new SAPReg(sender);
        theNodeGen->move(l, res);
        if (SICRegTargeting) new RegisterPair(res, l);
        expr = new UnknownSExpr(res, theNodeGen->current);
        sender->pushedLocal[sender->_bci] = l;
      } else {
        // assignment
        PReg* arg = sender->exprStack->pop()->preg();
        theNodeGen->materializeBlock(arg, sig, new PRegBList(5));
        theNodeGen->loadArg(arg, l);
        expr = self;
      }
      return expr;
    }
  }

  
  // The genLocal calls generate a sequence of instructions to load the
  // SP of the frame containing the local.  The last scope then loads
  // (or stores) the value.
  
  SExpr* SMethodScope::genLocal(SScope* target, SCodeScope* sender,
                                slotDesc* sd, fint argc, PReg* t) {
    Unused(sender); Unused(target);
    assert(target == this, "should have found the slot");
    return SCodeScope::local(sender, sd, argc, t);
  }
  
  SExpr* SBlockScope::genLocal(SScope* target, SCodeScope* sender,
                               slotDesc* sd, fint argc, PReg* t) {
    if (target == this) {
      // normal local slot access
      return SCodeScope::local(sender, sd, argc, t);
    } else {
      // load parent scope's SP, then continue
      loadParentScope(t);
      return parent()->genLocal(target, sender, sd, argc, t);
    }
  }
  
  void SBlockScope::loadParentScope(PReg* t) {
    // load first block's parent scope
    if (_parent->isVFrameScope()) {
      theNodeGen->loadBlockParent(receiver->preg(), t);
    } else {
      // inlined block - access will be handled by enclosing scope
    }
  }
  
  SExpr* SVFrameScope::genLocal(SScope* target, SCodeScope* sender,
                                slotDesc* sd, fint argc, PReg* t) {
    assert(target == this, "should have found the slot");
    NameDesc* nd = _vf->get_name_desc(sd);
    assert(!nd->isValue(), "shouldn't call genLocal for constants");
    if (argc == 0) {
      PReg* r = new SAPReg(sender);
      theNodeGen->loadSaved(t, _vf->code, nd, r, sd->name);
      return new UnknownSExpr(r, theNodeGen->current);
    } else {
      PReg* arg = sender->exprStack->pop()->preg();
      theNodeGen->storeSaved(arg, t, _vf->code, nd, sd->name);
      return sender->self;
    }
  }  
  
  SExpr* SVFrameBlockScope::genLocal(SScope* target, SCodeScope* sender,
                                     slotDesc* sd,  fint argc, PReg* t) {
    if (target == this) {
      return SVFrameScope::genLocal(target, sender, sd, argc, t);
    } else {
      if (_vf->fr != parent()->vf()->fr) {
        loadParentScope(t);
      } else {
        // inlined in parent's frame, don't need to walk up the stack
      }
      return parent()->genLocal(target, sender, sd, argc, t);
    } 
  }
  
  void SVFrameBlockScope::loadParentScope(PReg* t) {
    if (_vf->fr != _parent->vf()->fr) {
      // load block's parent scope
      NameDesc* nd = _vf->get_block_name();
      theNodeGen->loadSaved(t, _vf->code, nd, t,
                            VMString[LEXICAL_PARENT]);
      theNodeGen->loadBlockParent(t, t);
    } else {
      // inlined in parent's frame, don't need to walk up the stack
    }
  }
  
  bool SCodeScope::checkPerformPrim(stringOop selector,
                                    LookupType& lookupType) {
    if (!selector->is_string()) return false;
    
    fint len = selector->length();
    char* sel = selector->bytes();
    if (selector->has__Perform__prefix()) {
      return checkPerform(sel, len, 9 /* _Perform: */, lookupType);
    } else if (selector->has__PerformResend__prefix()) {
      return checkPerform(sel, len, 15 /* _PerformResend: */, lookupType);
    }
    return false;
  }
  
  
  bool SCodeScope::checkPerform(const char* sel, fint len, fint prefix,
                                LookupType& performLookupType) {
    // check if this is really a perform primitive; if so, also
    // return perform type
    
    if (str_has_IfFail(sel, len)) len -= 7;
    
    fint argc = 0;
    while (strncmp(sel + len - 5, "With:", 5) == 0) {
      argc ++;
      len -= 5;
    }
    
    if (len == prefix) {
      if (prefix == 9) {
        performLookupType = NormalPerformType;
      } else {
        performLookupType = ResendPerformType;
      }
    } else if (prefix == 9 && len == prefix + 13 &&
               strncmp(sel + prefix, "DelegatingTo:", 13) == 0) { 
      performLookupType = DelegatedPerformType;
    } else {
      // not a recognized perform primitive name; don't replace with perform
      return false;
    }
    return true;
  }
  
  void SPrimScope::initialize() {
    stringOop selector = (stringOop)_selector;
    nargs = selector->arg_count();
    if (selector->has_IfFail()) {
      _selector = selector->without_IfFail();
      failSelector = VMString[VALUE_WITH_];
      hasFailBlock = true;
      failBlock = exprStack()->pop();
      nargs--;
    } else {
      failSelector = VMString[PRIMITIVE_FAILED_ERROR_NAME_];
      hasFailBlock = false;
      failBlock = 0;
    }
    pd = getPrimDescOfSelector((stringOop)_selector);
    args = new SExprBList(nargs);
    // npop: keep track of how many elems we need to pop from expr stack;
    // need to keep expr stack intact until end of call so that e.g. uncommon
    // branches can mark elems as visible
    npop = nargs;
    fint top = exprStack()->length() - 1;
    for (fint i = 0; i < nargs; i++) args->append(exprStack()->nth(top - i));
    if (receiver == 0) {
      receiver = exprStack()->nth(top - nargs);
      npop++;
    }
    needZap = false;
    if (pd->canFail()) {
      // mark failure block as memoized
      if (failBlock && failBlock->preg()->isBlockPReg()) {
        BlockPReg* bl = (BlockPReg*)failBlock->preg();
        bool primFailBlock = lastBCI && !pd->canWalkStack();
        for (SCodeScope* s = _sender; s != bl->scope && primFailBlock;
             s = s->sender()) {
          if (s->bci() < s->ncodes - 1) primFailBlock = false;
        }
        if (primFailBlock) {
          // this block is never needed/visible unless the primitive fails
          // because the primitive call is the last byte code of the method
          // and all scopes between this one and the block's home are at the
          // last bci.
          bl->primFailBlockScope = sender();
          bl->memoized = false;
          needZap = true;
        } else {
          bl->memoize();
        }
      }
    }

  }
  
  SExpr* SPerformPrimScope::genCall() {
    Node* n = theNodeGen->perform(_sender, lookupType, self()->preg(), nargs,
                                  delegatee(), methodHolder_or_map(),
                                  _sender->nlrPoint(),
                                  currentExprStack(0), _sender->sig);
            // args already popped, thus currentExprStack(0)
    theNodeGen->move(n->dest(), resultPR);
    successNode = theNodeGen->current;
    return 0;
  }
  
  void SPrimScope::genCode() {
    initialize();
    result = tryConstantFold();
    if (!result) result = tryTypeCheck();
    if (!result) result = tryInline();
    if (result) {
       // don't need to generate code for call
    } else {
      loadArgs();
      theNodeGen->loadArg(-1, receiver->preg(), true); // load receiver
      SExpr* failRes = genCall();
      assert(successNode, "should have successNode");
      Node* c = successNode;          // for better formatting of switch
      PReg* r = resultPR;
      switch(pd->etype()) {
       case ReceiverPrimType:
        result = receiver->shallowCopy(r, c); break;
       case ReceiverMapPrimType:
        result = receiver->mapify(r, c); break;
       case IntegerPrimType:
        result = new MapSExpr(Memory->smi_map->enclosing_mapOop(), r, c); break;
       case FloatPrimType:
        result = new MapSExpr(Memory->float_map->enclosing_mapOop(), r, c); break;
       case StringPrimType:
        result = new MapSExpr(Memory->stringObj->map()->enclosing_mapOop(), r, c);
        break;
       case ObjVectorPrimType:
        result = new MapSExpr(Memory->objVectorObj->map()->enclosing_mapOop(), r, c);
        break;
       case ByteVectorPrimType:
        result = new MapSExpr(Memory->byteVectorObj->map()->enclosing_mapOop(), r, c);
        break;
       case BooleanPrimType:
        result = (new ConstantSExpr(Memory->trueObj,  r, 0))->copyMergeWith(
          new ConstantSExpr(Memory->falseObj, r, 0),
          r, c);
        break;
       case NoReturnPrimType:
        result = new NoResultSExpr;
       case UnknownPrimType:
       default:
        result = new UnknownSExpr(r, c); break;
      }
      if (failRes) result = result->mergeWith(failRes, theNodeGen->current);
    }
    // pop args 
    while (npop-- > 0) exprStack()->pop();
  }

  void SRestartPrimScope::genCode() {
    theNodeGen->restart(_sender->startOfScope, currentExprStack(0),
                        _sender->sig);
    result = new NoResultSExpr;
  }

  SExpr* SPrimScope::genCall() {
    BlockPReg* failReg = 0;
    if (needZap && pd->canScavenge() && failBlock->preg()->isBlockPReg()) {
      BlockPReg* r = (BlockPReg*)failBlock->preg();
      if (r->primFailBlockScope) failReg = r;
    }
    MergeNode* nlr = pd->needsNLRCode() ? _sender->nlrPoint() : 0;
    PRegBList* es = currentExprStack(npop); 
    PrimNode* call =
      theNodeGen->primCall(_sender, pd, nlr, nargs, es, _sender->sig, failReg);

    // failure handling
    SExpr* failResult;
    if (pd->canFail()) {
      Node* test = 0;
      MergeNode* done = 0;
      failResult = genPrimFailure(call, 0, test, done, resultPR);
      // move success result to right place and merge with fail branch
      successNode = test->append1(new AssignNode(call->dest(), resultPR));
      if (done) {
        successNode->append(done);
        theNodeGen->current = done;
      }
      else
        theNodeGen->current = successNode;
    } else {
      failResult = 0;
      theNodeGen->move(call->dest(), resultPR);
      successNode = theNodeGen->current;
    }

    return failResult;
  }
  
  void SPrimScope::loadArgs(PRegBList* blocks) {
    theSIC->allocateArgs(nargs, true);

    // materialize block args
    if (!blocks) blocks = new PRegBList(5);
    fint i;
    for (i = 0; i < nargs; i++) {
      PReg* l = args->nth(i)->preg();
      theNodeGen->materializeBlock(l, _sender->sig, blocks);
    }
    theNodeGen->materializeBlock(receiver->preg(), _sender->sig, blocks);
    
    // move args to arg registers
    for (i = 1; i <= nargs; i++) {
      PReg* l = args->nth(i - 1)->preg();
      theNodeGen->loadArg(nargs - i, l, true);
    }
  }
  
  void SPerformPrimScope::initialize() {
    bool explicitReceiver = receiver == 0;
    if (explicitReceiver) receiver = (SExpr*)1; // fake for SPrimSc::init
    SPrimScope::initialize();
    while (npop-- > 0) exprStack()->pop();
    if (explicitReceiver) receiver = exprStack()->pop();
    sel = args->pop(); nargs--; // subtract selector
    del = 0;
    if (needsDelegatee(lookupType)) {
      del = args->pop(); nargs--; // subtract delegatee
    }
  }

  void SPerformPrimScope::loadArgs(PRegBList* blocks) {
    // materialize possible blocks
    if (!blocks) blocks = new PRegBList(5);
    theNodeGen->materializeBlock(sel->preg(), _sender->sig, blocks);
    if (del) theNodeGen->materializeBlock(del->preg(), _sender->sig, blocks);
    SPrimScope::loadArgs(blocks);
    
    if (needsDelegatee(lookupType)) {
      theNodeGen->loadArg(del->preg(), theNodeGen->delPR); // push delegatee
    }
    theNodeGen->loadArg(sel->preg(), theNodeGen->selPR);   // push selector
  }
  
  void SMethodScope::genCode() {
    prologue();
    SCodeScope::genCode();
    epilogue();
  }
  
  void SBlockScope::genCode() {
    prologue();
    SCodeScope::genCode();
    epilogue();
  }
  
  
  void SBlockScope::postPrologue() {
    // load self
    if (parent()->isVFrameScope()) {
      SAPReg* selfPR = new SAPReg(this, PrologueBCI, ncodes-1);
      self = new MapSExpr(mapOop(selfMapOop()), selfPR , 0);

      compiled_vframe* vf = parent()->vf();
      NameDesc* selfName = vf->get_self_name();
      PReg* t = new TempPReg(this);
      loadParentScope(t);
      if (selfName->hasLocation()) {
        theNodeGen->loadSaved(t, vf->code, selfName, self->preg(), VMString[SELF]);
        // make sure this load isn't optimized away (to trap dead blocks)
        theNodeGen->current->hasSideEffects_now = true;
      } else {
        // do dummy load to test for dead block
        theNodeGen->comment("dummy load for dead block test");
        theNodeGen->loadSaved(t, vf->code, 0, theNodeGen->noPR, VMString[SELF]);
        theNodeGen->current->hasSideEffects_now = true;
        theNodeGen->loadOop(selfName->value(), self->preg());
      }
    } else {
      assert(parent()->isCodeScope(), "just checkin'");
      self = ((SCodeScope*)parent())->self;
    }
  }
  
  void SDeadBlockScope::postPrologue() {
    // don't load parent scope - not necessary
  }
  
  SVFrameScope::SVFrameScope(compiled_vframe* f) { _vf = f; }
  
  SVFrameBlockScope::SVFrameBlockScope(compiled_vframe* f) : SVFrameScope(f) {
    abstract_vframe* parent = f->parent();
    if (parent) {
      _parent = new_SVFrameScope(parent->as_compiled());
    } else {
      _parent = 0;
    }
  }

  SExpr* SVFrameScope::receiverExpr() {
    SExpr* descSelf= _vf->desc->selfExpr();
    // get the map info from the runtime, because
    // 1. The scopeDesc in the nmethod may be invalid, or
    // 2. If reusing nmethods, it might just be plain wrong.
    if (ReuseNICMethods || true || _vf->code->isInvalid()) {
      oop self= _vf->self();
      if (descSelf->isMapSExpr() && descSelf->map() != self->map()) {
        MapSExpr* m= (MapSExpr*)descSelf;
        m->_myMapOop= self->map()->enclosing_mapOop();
        LOG_EVENT1("SIC: counterfactual inlining %#lx",
        m->_myMapOop);
      }
    }
    return descSelf;
  }
  oop SVFrameScope::method() { return _vf->desc->method(); }
  oop SVFrameScope::methodHolder_or_map() {
    return _vf->methodHolder_or_map(); }
  
  SDeadBlockScope::SDeadBlockScope(oop m, SendInfo* info)
  : SBlockScope(m, 0, 0, new RNullScope(0), info) {}
  
  void SDeadBlockScope::genCode() {
    prologue();                // to create stack frame
    theNodeGen->nonLifoTrap(currentExprStack(0), sig);    
    endOfScope = new MergeNode("SDeadBlockScope::genCode endOfScope");
    theNodeGen->append(endOfScope);
    fint offset = theSIC->send_desc->endOffset(theSIC->L->lookupType());
    theNodeGen->append(new MethodReturnNode(offset, true, theNodeGen->noPR));
    // ignore rest of method - will never execute
  }
  
  SVFrameScope* new_SVFrameScope(compiled_vframe* vf) {
    MethodKind kind = vf->method()->kind();
    switch (kind) {
     case OuterMethodType:
      return new SVFrameMethodScope(vf);
     case BlockMethodType:
      return new SVFrameBlockScope(vf);
     default:
      fatal("unexpected byte code kind");
      return 0;
    }
  }


  SPrimScope::SPrimScope(SCodeScope* s, oop sel,
                         SExpr* rcvr, bool last)
  : SSelfScope(s, s->rscope, 0) {
    _selector = sel; receiver = rcvr; lastBCI = last; successNode = 0;
    // for correct register allocation, result has to belong to sender scope
    if (!resultPR) {
      assert(s, "must have sender");
      SAPReg* r = new SAPReg(s, s->bci(), s->bci());
      resultPR = r;
    }
  }
  
  SPerformPrimScope::SPerformPrimScope(SCodeScope* s,
                                       LookupType l, oop selector, oop delgt,
                                       SExpr* rcvr)
    : SPrimScope(s, selector, rcvr, false) {
    lookupType = l; _delegatee = delgt; 
  }

  SRestartPrimScope::SRestartPrimScope(SCodeScope* s, oop sel, SExpr* r)
    : SPrimScope(s, sel, r, false) { }

  mapOop SAccessScope::receiverMapOop() { return L->receiverMapOop(); }
  oop SAccessScope::selector()                 { return L->selector(); }
  
  void SConstantSlotAccessScope::genCode() {
    slotDesc* s = L->result()->as_real()->desc;
    assert(s->is_map_slot(), "should be constant slot");
    theNodeGen->loadOop(s->data, resultPR);
    result = new ConstantSExpr(s->data, resultPR, theNodeGen->current);
  }

  SDataSlotAssignScope::SDataSlotAssignScope(SICLookup* L1, SCodeScope* s,
                                             RScope* rs, SExpr* r, SExpr* a,
                                             SendInfo* info)
  : SAccessScope(L1, s, rs, r, info) { arg = a; }

  void SDataSlotAccessScope::genCode() {
    theNodeGen->pathLookup(L->result()->as_real(), receiver->preg(), resultPR);
    result = new UnknownSExpr(resultPR, theNodeGen->current);
  }

  void SDataSlotAssignScope::genCode() {
    assert(L->result()->is_real(), "real lookup should have real result");
    realSlotRef* ref = (realSlotRef*) L->result();
    slotDesc* dataSlot = ref->holder->map()->find_slot(ref->desc->name);
    realSlotRef*  dataRef  = new realSlotRef(ref->holder, dataSlot);
    PReg* rcvrPR = receiver->preg();
    PReg* argPR = arg->preg();
    bool needCheckStore = true;
    if (arg->hasMap()) {
      Map* map = arg->map();
      if (map == Memory->smi_map || map == Memory->float_map)
        needCheckStore = false;
    }
    if (arg->hasConstant()) {
      oop constant = arg->constant();
      needCheckStore = constant->is_new();          // ints/floats aren't new
    } else if (arg->hasMap()) {
      Map* m = arg->map();
      if (m == Memory->smi_map || m == Memory->float_map)
        needCheckStore = false;
    }
    if (argPR->isBlockPReg()) {
      theNodeGen->materializeBlock(argPR, _sender->sig, new PRegBList(1));
    }
    theNodeGen->pathAssign(rcvrPR, dataRef, argPR, needCheckStore);
    if (resultPR != rcvrPR) {
      theNodeGen->move(rcvrPR, resultPR);
      result = receiver->shallowCopy(resultPR, theNodeGen->current);
    } else {
      result = receiver;
    }
  }

  // debugging information

  fint SSelfScope::descOffset() {
    return scopeInfo ? theSIC->rec->offset(scopeInfo) : IllegalDescOffset;
  }

  void SCodeScope::fixupBlocks() {
    if (!CheckAssertions  &&  isLite()) return;         // nothing to do
    fint i;
    for (i = 0; i < ncodes; i++) {
      PReg* r = expressions[i];
      if (r && r->isBlockPReg()) {
        // can't use BlockPReg::parent - slot may have been fixed up already
        oop block = ((BlockPReg*)r)->block;
        blockMap *map= (blockMap*)block->map();
        smiOop desc= map->desc();
        assert_smi(desc, "should be an integer");
        assert(desc != BLOCK_PROTO_DESC, "should have been changed");
        if (desc == as_byte_count_smiOop((int32) this)) {
#          if GENERATE_DEBUGGING_AIDS
            if (CheckAssertions  &&  isLite()) {
              // don't actually get the offset because it's undefined
              assert(r->isUnused(), "should be unused");
              assert(!((BlockPReg*)r)->escapes, "shouldn't escape");
              continue;
            }
#          endif
          map->setDesc(as_smiOop(descOffset()));
        }
      }
    }
    for (i = 0; i < subScopes->length(); i++) {
      subScopes->nth(i)->fixupBlocks();
    }
  }
  
  void SCodeScope::describe() {
    if (isDeleted())   return;  // totally unreachable, can't do anything for me
      
    genScopeInfo();

    if (isLite()) {
      // don't decribe locals & expr stack -- can't ever ask for this info
    } else {
      // locals
      ScopeDescRecorder* rec = theSIC->rec;
      ScopeInfo info = scopeInfo;
      assert(nslots == method()->map()->length_slots(), "just checkin'");
      FOR_EACH_SLOTDESC_N(method()->map(), s, n) {
        if (s->is_vm_slot()) {
          // ignore
        } else if (s->is_arg_slot()) {
          //  I changed it from:
          //    rec->addSlot(info, n, args[n]->preg()->nameNode());
          //    because it was failing for constants (ConstantSExpr) -- dmu
          rec->addSlot(info, n, args[n]->nameNode());
        } else if (s->is_obj_slot()) {
          // local data slot
          rec->addSlot(info, n, locals[n]->nameNode());
        } else {
          // constant or assignment slot - don't describe
          assert(s->is_map_slot(), "unexpected slot type");
        }
      }
      
      // expression stack
      for (fint i= 0; i < exprStackElems->length(); i++) {
        SExpr* e = exprStackElems->nth(i);
        if (e) {
          rec->addExprStack(info, i, e->nameNode(false));
        } else {
          // dead code was omitted, still need to write dummy expr stack elem
          assert(endsDead, "should have expr stack element");
          rec->addExprStack(info, i, new IllegalName);
        }
      }
      
      // live blocks
      for (fint i= 0;  i < blockElems->length();  i++) {
        SExpr* e = blockElems->nth(i);
        rec->addBlock(info, i, e->nameNode(false));
      }
    }

    // subscopes
    for (fint i = 0; i < subScopes->length(); i++) {
      subScopes->nth(i)->describe();
    }
  }
  
  void SMethodScope::genScopeInfo() {
    bool lite = isLite();
    scopeInfo = theSIC->rec->
      addMethodScope(_key,
                     _method,
                     self->nameNode(!lite),
                     self->myMapOop(),
                     _methodHolder_or_map, lite, scopeID(),
                     _sender ? _sender->scopeInfo : 0,
                     _senderBCI,
                     predicted);
  }
  
  void SBlockScope::genScopeInfo() {
    bool top = isTop() || parent()->isVFrameScope();
    bool lite = isLite();
    if (top) {
      scopeInfo = theSIC->rec->
        addTopLevelBlockScope(_key,
                              _method,
                              _key->receiverMapOop(),
                              self->nameNode(!lite),
                              self->nameNode(!lite),
                              self->myMapOop(),
                              methodHolder_or_map(),
                              receiver->nameNode(!lite),
                              receiver->nameNode(!lite),
                              lite,
                              scopeID(),
                              _sender ? _sender->scopeInfo : 0,
                              _senderBCI,
                              predicted);
    } else {
      assert(parent()->isCodeScope(), "must be method scope");
      SCodeScope* p = (SCodeScope*)parent();
      scopeInfo = theSIC->rec->
        addBlockScope(_key, _method, _key->receiverMapOop(),
                      receiver->nameNode(!lite), p->scopeInfo, lite,
                      scopeID(), _sender ? _sender->scopeInfo : 0,
                      _senderBCI, predicted);
    }
  }

  void SDeadBlockScope::genScopeInfo() {
    bool lite = isLite();
    scopeInfo = theSIC->rec->
      addDeadBlockScope(_key, _method, receiver->nameNode(!lite), lite,
                        scopeID(), _sender ? _sender->scopeInfo : 0,
                        _senderBCI, predicted);
  }

  void SDataSlotAccessScope::describe() {
    // describe access scope only if receiver type isn't known without
    // referring to recompilee
    if (predicted) {
      MethodLookupKey* k= new_MethodLookupKey(L->key);
      scopeInfo =
        theSIC->rec->addDataAccessScope(k, receiver->nameNode(false),
                                        receiverMapOop(), methodHolder_or_map(),
                                        _sender->scopeInfo, _senderBCI,
                                        predicted);
    }
  }

  void SDataSlotAssignScope::describe() {
    // describe access scope only if receiver type isn't known without
    // referring to recompilee
    if (predicted) {
      MethodLookupKey* k= new_MethodLookupKey(L->key);
      scopeInfo =
        theSIC->rec->addDataAssignmentScope(k, receiver->nameNode(false),
                                            receiverMapOop(), methodHolder_or_map(),
                                            _sender->scopeInfo, _senderBCI,
                                            predicted);
    }
  }

  void SConstantSlotAccessScope::describe() {
    // describe access scope only if receiver type isn't known without
    // referring to recompilee
    if (predicted) {
      MethodLookupKey* k= new_MethodLookupKey(L->key);
      scopeInfo =
        theSIC->rec->addDataAccessScope(k, receiver->nameNode(false),
                                        receiverMapOop(), methodHolder_or_map(),
                                        _sender->scopeInfo, _senderBCI,
                                        predicted);
    }
  }

  ValueLocationNameDesc* SCodeScope::nameDescFor(PReg* r) {
    // r is a register that is live at the restarting marker node; find its
    // run-time value and create a NameDesc for it
    assert(vscope, "not on current stack");
    oop val;
    blockOop blk = (blockOop)badOop;
    if (r->isConstPReg()) {
      val = ((ConstPReg*)r)->constant;
    } else {
      SExpr* expr;
      val = valueFor(r, expr);
      if (val == badOop) return 0;
      if (val->is_block()) {
        if (expr && expr->hasMap()) {
          // fabricate a dummy block with the right map
          blk = blockOop(val)->copy();
          blk->addr()->_map = expr->myMapOop();
          blk->kill();
        } else {
          // Couldn't find new map for the block; maybe the block belongs
          // to a caller nmethod?  Find out.
          frame* home = blockOop(val)->scope(true);
          if (home == 0 ||
              (theSIC->vscopes &&
              home > theSIC->vscopes->last()->vf->fr->block_scope_of_home_frame())) {
            // ok, don't need to remap the block
          } else {
            if (PrintRecompilation) {
              lprintf("*couldn't find block map for %s (oop %#lx)\n",
                      r->name(), blk);
            }
            return 0;            // sorry, need map and couldn't find it
          }
        }
      }
    }
    LOG_EVENT3("ValueLocationNameDesc %s%d %s",
               r->prefix(), r->id(), locationName(r->loc));
    return new ValueLocationNameDesc(r->loc, val, blk);
  }

  oop SCodeScope::valueFor(PReg* r, SExpr*& expr) {
    // try to find r's run-time value and its SExpr
#   define RETURN(val, exp) { expr = exp; return val; }
    compiled_vframe* vf = vscope->vf;

    // try receiver & self
    if (r->isCPEquivalent(receiver->preg()))
      RETURN(vf->get_contents(vf->get_receiver_name(), true, true), receiver);
    if (r->isCPEquivalent(self->preg()))
      RETURN(vf->get_contents(vf->get_self_name(), true, true), self);
    { // args and locals
      FOR_EACH_SLOTDESC_N(_method->map(), sd, i) {
        if (args[i] && args[i]->preg()->isCPEquivalent(r)) {
          RETURN(vf->get_slot2(sd, true, true), args[i]);
        } else if (locals[i] && locals[i]->isCPEquivalent(r)) {
          RETURN(vf->get_slot2(sd, true, true), 0);
        }
      }
    }
    // live blocks (try *before* expr stack to create eliminated blocks)
    IntList* bcs = method_map->blocks_upto(vf->bci());
    IntListElem* e;
    for ( e = bcs->head(); e; e = e->next()) {
      int32 bci2 = e->data();
      if (expressions[bci2]->isCPEquivalent(r)) {
        NameDesc* n = vf->desc->blockElem(bci2);
        oop block = vf->get_contents(n, true, true);
        Map* bm = block->map();
        fint i;
        for (i= blocks->length() - 1;
             i >= 0 && !bm->equal(blocks->nth(i)->block->map());
             i--) ;
        assert(i >= 0, "should have found block");
        RETURN(block, new MapSExpr(blocks->nth(i)->block->map()->enclosing_mapOop(),
                                   blocks->nth(i), 0));
      }
    }

    // expr stack
    oop* stack;
    smi len;
    vf->get_expr_stack(stack, len, true);
    SExprStack* es = marker->exprStack;
    for (fint i= len - 1; i >= 0; i--) {
      if (es->nth(i)->preg()->isCPEquivalent(r)) RETURN(stack[i], es->nth(i));
    }

    // not a source-level name - may be an outgoing arg
    if (r->isArgSAPReg() && isArgRegister(r->loc)) {
      RETURN(vf->register_contents(r->loc), 0);
    }
    RETURN(badOop, 0);           // not found
#   undef RETURN
  }

  // printing code

  void SendInfo::print() {
    lprintf("SendInfo %#lx \"%s\" (rcvr = %#lx, nsends = %ld)\n",
           (unsigned long)this, selector_string(sel), (unsigned long)rcvr,
           long(nsends));
  }
  
  void SCodeScope::print() {
    lprintf(" method: %#lx\n\tdel: %#lx  id: %ld",
           (unsigned long)method(), (unsigned long)delegatee(),
           long(scopeID()));
    lprintf("  args: x/%ldx %#lx", long(nslots), (unsigned long)args); 
    lprintf("\n\tlocals: x/%ldx %#lx", long(nslots), (unsigned long)locals); 
    lprintf("  stack: "); exprStack->print_short_zero();
    lprintf("  blocks: "); blocks->print_short_zero();
    lprintf("\n\tnlrPoints: x/%ldx %#lx\n", long(blocks->length()),
           (unsigned long)nlrPoints);
    lprintf("  subScopes: "); subScopes->print();
    lprintf("\n");
  }
  
  void SMethodScope::print_short() {
    lprintf("(SMethodScope*)%#lx (", (unsigned long)this);
    selector()->print_oop(); lprintf(")");
  }
  
  void SMethodScope::print() {
    print_short();
    SCodeScope::print();
    lprintf("\tmh: %#lx", (unsigned long)methodHolder_or_map()); 
    lprintf("  sender: "); sender()->print_short_zero();
    lprintf(" @ %ld\n", long(senderBCI()));
  }
  
  void SBlockScope::print() {
    print_short();
    SCodeScope::print();
    lprintf("\tparent: "); parent()->print_short_zero();
    lprintf("  sender: "); sender()->print_short_zero();
    lprintf(" @ %ld\n", long(senderBCI()));
  }
  
  void SBlockScope::print_short() {
    lprintf("(SBlockScope*)%#lx (", (unsigned long)this);
    selector()->print_oop(); 
    lprintf(" %#lx)", (unsigned long)method());
  }
  
  void SDeadBlockScope::print_short() {
    lprintf("SDeadBlockScope %#lx (%#lx)", (unsigned long)this,
           (unsigned long)method()); }
  
  void SVFrameScope::print() {
    print_short();
    lprintf("  _vf = %#lx", (unsigned long)_vf);
  }
  
  void SVFrameMethodScope::print_short() {
    lprintf("(SVFrameMethodScope*)%#lx (", (unsigned long)this);
    _vf->selector()->print_oop();
    lprintf(")");
  }
  
  void SVFrameMethodScope::print() {
    SVFrameScope::print();
    lprintf("\n");
  }
  
  void SVFrameBlockScope::print() {
    SVFrameScope::print();
    lprintf("\n    parent: "); parent()->print_short_zero();
    lprintf("\n");
  }
  
  void SVFrameBlockScope::print_short() {
    lprintf("(SVFrameBlockScope*)%#lx (", (unsigned long)this);
    _vf->selector()->print_oop();
    lprintf(" = %#lx)", (unsigned long)method());
  }
  
  void SPrimScope::print_short() {
    lprintf("(SPrimScope*)%#lx (", (unsigned long)this);
    _selector->print_oop();
    lprintf(")");
  }

  void SPerformPrimScope::print_short() {
    lprintf("(SPerformPrimScope*)%#lx (", (unsigned long)this);
    _selector->print_oop();
    lprintf(")");
  }
  void SRestartPrimScope::print_short() {
    lprintf("(SRestartPrimScope*)%#lx (", (unsigned long)this);
    _selector->print_oop();
    lprintf(")");
  }

  void SDataSlotAccessScope::print_short() {
    lprintf("(SDataSlotAccessScope*)%#lx (", (unsigned long)this);
    L->selector()->print_oop();
    lprintf(")");
  }
  
  void SConstantSlotAccessScope::print_short() {
    lprintf("(SConstantSlotAccessScope*)%#lx (", (unsigned long)this);
    L->selector()->print_oop();
    lprintf(")");
  }
  
  void SDataSlotAssignScope::print_short() {
    lprintf("(SDataSlotAssignScope*)%#lx (", (unsigned long)this);
    L->selector()->print_oop();
    lprintf(")");
  }
  
  
# endif
