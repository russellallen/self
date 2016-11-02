/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "sicInline.hh"

# include "_sicInline.cpp.incl"

  static fint msgCost = 0;      // estimated cost of last inlining candidate
  
  SExpr* SCodeScope::inlineSend(SendInfo* info) {
    stringOop sel = info->sel;
    SExpr* res = NULL;
    info->resReg = new SAPReg(this);
    MergeNode* merge = NULL;
    fint argc = sel->arg_count();

    if (!Inline && !InlineSTMessages) {
      // don't do any inlining
      info->needRealSend = true;
    } else {
      info->rcvr = picPredict(info);
      UnknownSExpr* u = info->rcvr->findUnknown();
      if (u && !u->isUnlikely()) {
        info->rcvr = typePredict(info);
      }
      
      if (info->rcvr->really_hasMap(this)) {
        // single map - try to inline this send
        SSelfScope* s = tryLookup(info, info->rcvr);
        if (s) {
          SExpr* r = doInline(s, info->rcvr, theNodeGen->current, NULL);
          if (r->isNoResultSExpr()) {
            res = r;
          } else {
            theNodeGen->append(new NopNode());   // to get right scope for r
            res = r->shallowCopy(r->preg(), theNodeGen->current);
          }
        } else {
          if (PrintInlining) {
            lprintf("%*s*marking %s send ReceiverStatic\n",
                    (void*)depth,"", selector_string(sel));
          }
          // receiver type is constant (but e.g. method was too big to inline)
          info->l |= ReceiverStaticBit;
          info->needRealSend = true;
        }
      } else if (info->rcvr->isMergeSExpr()) {
        res = inlineMerge(info, merge);
      } else {
        // unknown receiver
        // NB: *must* use uncommon branch if marked unlikely because
        // future type tests won't test for unknown
        if (info->rcvr->findUnknown()->isUnlikely()) {
          // generate an uncommon branch for the unknown case, not a send
          theNodeGen->current = theNodeGen->uncommonBranch(currentExprStack(0),
                                                           info->restartPrim);
          info->needRealSend = false;
          if (PrintInlining) {
            lprintf("%*s*making %s uncommon\n", (void*)depth,"",selector_string(sel));
          }
        } else {
          info->needRealSend = true;
        }
      }
    }
    
    if (info->needRealSend) {
      SExpr* r = genRealSend(info);
      res = res ? res->mergeWith(r, merge) : r;
    }
    if (merge && res && !res->isNoResultSExpr()) theNodeGen->branch(merge);

    // now pop expr stack
    for (fint i = 0; i < argc; i++) exprStack->pop();
    if (!info->isSelfImplicit) exprStack->pop();
    if (!res) res = new NoResultSExpr;
    return res;
  }
  
  
  SExpr* SCodeScope::inlineMerge(SendInfo* info, MergeNode*& merge) {
    // inline the send by type-casing; return uninlined cases in others list
    // If merge has no predecessors, return NULL for merge ref.
    SExpr* res = NULL;
    assert(info->rcvr->isMergeSExpr(), "must be a merge");
    MergeSExpr* r = (MergeSExpr*)info->rcvr;
    stringOop sel = info->sel;
    merge = NULL;

    if (r->isSplittable() && shouldSplit(info)) {
      return splitMerge(info, merge);
    }
                    
    fint ncases = r->exprs->length();
    if (ncases > SICTypeCaseLimit) {
      info->needRealSend = true;
      if (PrintInlining) {
        lprintf("%*s*not type-casing %s (%ld > SICTypeCaseLimit)\n",
                (void*)depth, "", selector_string(sel), (void*)ncases);
      }
      return res;
    }
    assert( merge == NULL, "I assume merge is out param only");
    merge = new MergeNode("inlineMerge merge");

    if (SICDebug) {
      char* s = NEW_RESOURCE_ARRAY(char, 200);
      sprintf(s, "begin type-case of %s (ends at node N%ld)",
              sel->copy_null_terminated(), long(merge->id()));
      theNodeGen->comment(s);
    }
    if (PrintInlining) {
      lprintf("%*s*type-casing %s\n", (void*)depth, "", selector_string(sel));
    }

    // build list of cases to inline
    // (add only immediate maps at first, collect others in ...2 lists
    SSelfScopeBList* slist  = new SSelfScopeBList(ncases);
    SSelfScopeBList* slist2 = new SSelfScopeBList(ncases);
    SExprBList* elist  = new SExprBList(ncases);
    SExprBList* elist2 = new SExprBList(ncases);
    SExprBList* others = new SExprBList(ncases);
    OopBList* mlist  = new OopBList(ncases);
    OopBList* mlist2 = new OopBList(ncases);
    bool needMapLoad = false;
    fint i;
    for (i = 0; i < ncases; i++) {    
      SExpr* nth = r->exprs->nth(i);
      assert(!nth->isConstantSExpr() || nth->next == NULL ||
             nth->constant() == nth->next->constant(),
             "shouldn't happen: merged consts - convert to map");
      SSelfScope* s;

      if (!nth->hasMap()  ||  (s = tryLookup(info, nth)) == NULL) {
        // cannot inline
        others->append(nth);
        info->needRealSend = true;
        continue;
      }
      // can inline this case

      // Notice that for immediates, instead of putting the constants in the mlist,
      // we put the maps. No point in optimizing just for 17. -- dmu 6/05
      Map* map = nth->map();
      if (map == Memory->smi_map  ||  map == Memory->float_map) {
        slist ->append(s);        // immediate maps go first
        // Bug fix: instead of nth->shallowCopy, must generalize to any 
        // with same map, not just the same constant, because other ints (for example)
        // will pass the type test, too. -- dmu 6/05
        elist ->append(new MapSExpr(map->enclosing_mapOop(), r->preg(), NULL));
        mlist ->append(map->enclosing_mapOop());
        continue;
      }
      // can inline but not immediate map
      slist2->append(s);        // append later
      elist2->append(nth->shallowCopy(r->preg(), NULL)); // use preg of merge
      if (nth->isConstantSExpr()) {
        mlist2->append(nth->constant());
      }
      else {
        needMapLoad = true; // will need to load map of testee
        mlist2->append(map->enclosing_mapOop());
      }
    }

    mlist->appendList(mlist2);
    elist->appendList(elist2);
    slist->appendList(slist2);
        
    // now do the type test and inline the individual cases
    if (slist->length() > 0) {
      memoizeBlocks(sel);
      
      Node* typeCase =
        theNodeGen->append(new TypeTestNode(r->preg(), mlist, needMapLoad,
                                            info->needRealSend));
      Node* fallThrough = typeCase->append(new NopNode);
      for (i = 0; i < slist->length(); i++) {
        theNodeGen->current = typeCase->append(i + 1, new NopNode);
        SExpr* e = doInline(slist->nth(i), elist->nth(i), theNodeGen->current, merge);
        if (!e->isNoResultSExpr()) {
          theNodeGen->append(new NopNode);
          e = e->shallowCopy(info->resReg, theNodeGen->current);
          res = res ? res->mergeWith(e, merge) : e;
        }
        theNodeGen->branch(merge);
      }
      theNodeGen->current = fallThrough;
    }
    if (res && res->isMergeSExpr()) 
      res->setNode(merge, info->resReg);
      
    assert( info->needRealSend &&  others->length() ||
           !info->needRealSend && !others->length(), "inconsistent");
           
    // NB: *must* use uncommon branch if marked unlikely because
    // future type tests won't test for unknown
                      
    if (others->isEmpty()) {
      // typecase cannot fail
      theNodeGen->deadEnd();
    }
    else if ( others->length() == 1
         &&   others->first()->isUnknownSExpr()
         &&   ((UnknownSExpr*)others->first())->isUnlikely()) {
            // generate an uncommon branch for the unknown case, not a send
            theNodeGen->uncommonBranch(currentExprStack(0), info->restartPrim);
            info->needRealSend = false;
            if (PrintInlining)
              lprintf("%*s*making %s uncommon (2)\n", (void*)depth,"",selector_string(sel));
    }
    return res;
  }

  void SCodeScope::memoizeBlocks(stringOop sel) {
    // memoize block args so they aren't created for inlined cases
    fint top = exprStack->length();
    fint argc = sel->arg_count();
    for (fint i = 1; i <= argc; i++) {
      PReg* r = exprStack->nth(top - i)->preg();
      if (r->isBlockPReg()) ((BlockPReg*)r)->memoize();
    }
  }

  bool SMethodScope::isRecursiveCall(oop meth, oop rcvrMap, fint n) {
    if (meth == method()) {
      if (receiverMapOop() == rcvrMap) {
        if (n <= 1) return true; else n--;
      }
    }
    SScope* s = sender();
    return s && s->isRecursiveCall(meth, rcvrMap, n);
  }

  bool SBlockScope::isRecursiveCall(oop meth, oop rcvrMap, fint n) {
    // skip lexically nested frames -- otherwise, get false recursion
    // e.g. with nested ifTrue's
    return _parent->isRecursiveCall(meth, rcvrMap, n);
  }
  
  bool SVFrameMethodScope::isRecursiveCall(oop meth, oop rcvrMap, fint n) {
    // potential performance bug (bad interaction with block cloning)
    // fix this
    if (meth == method()) {
      if (receiverMapOop() == rcvrMap) {
        return true; 
      }
    }
    SScope* s = sender();
    return s && s->isRecursiveCall(meth, rcvrMap, n);
  }

  fint SSelfScope::calleeSize(RScope* rs) {
    // try to get the callee's size (in bytes)
    if (!rs->isPICScope()) return 0;    // no info
    RPICScope* ps = (RPICScope*)rs;
    nmethod* inlinee= ps->callee;
    if (inlinee->compiler() == NIC) {
      return 0;         // can't say much about the real code size
    }
    fint size = inlinee->instsLen() - oopSize * PrologueSize;
    if (inlinee->isUncommonRecompiled()) {
      // uncommon nmethods are bigger because the contain many more non-
      // inlined sends for all the uncomon cases
      size /= 2;
    }
    return size;
  }
  
  bool SCodeScope::calleeTooBig(SendInfo* info, RScope* rs,
                                InlineLimitType limitType) {
    // try to see if the potential inlinee is too big
    fint size = calleeSize(rs);
    // NB: continue even if size == 0 to bring current estimated size into play
    assert(limitType <= BlockFnLimit, "bad limit");
    limitType = InlineLimitType(limitType + NormalFnInstrLimit-NormalFnLimit);
    fint cutoff = theSIC->inlineLimit[limitType];
    fint estimated = theSIC->estimatedSize();
    fint limit = theSIC->inlineLimit[NmInstrLimit];
    // reject if inlinee too large, but correct for well-known cheap messages
    bool bad = size > cutoff &&
      !(info->rcvr->hasMap() &&
        isCheapMessage(info->sel, info->rcvr->myMapOop()));
    if (bad && estimated + size < limit / 2) {
      // allow inlining if recompilee itself is small (i.e., a forwarder)
      if (recompilee &&
          recompilee->instsLen() - oopSize * PrologueSize < cutoff) {
        bad = false;
      }
    }
    // also reject if est. total size too large (except for ifTrue et al)
    // but don't trust the isCheap thing if we're way over the limit
    bad = bad || estimated + size >= limit;
    if (bad &&
        estimated + size < 2 * limit &&
        (size == 0 || size < cutoff / 8) &&
        info->rcvr->hasMap() &&
        isReallyCheapMessage(info->sel, info->rcvr->myMapOop())) {
      bad = false;
    }
    if (bad && PrintInlining) {
      lprintf("%*s*not inlining %s: callee too big (%d/%d/%d/%d)\n", (void*)depth, "",
              selector_string(info->sel),
              (void*)size, (void*)cutoff, (void*)estimated, (void*)limit);
    }
    if (SICDebug && bad && estimated > limit)
      warning4("SIC: (while compiling %s/%s) estimated nmethod size > limit (%ld > %ld)",
               selector_string(theSIC->L->selector()),
               selector_string(info->sel), estimated, limit);
    return bad;
  }
  
  bool SCodeScope::calleeIsSmall(SendInfo* info, RScope* rs,
                                 InlineLimitType limitType) {
    // try to see if the potential inlinee is small
    fint size = calleeSize(rs);
    if (!size) return false;    // no size info
    assert(limitType <= BlockFnLimit, "bad limit");
    limitType = InlineLimitType(limitType + NormalFnInstrLimit-NormalFnLimit);
    fint cutoff = theSIC->inlineLimit[limitType];
    fint estimated = theSIC->estimatedSize();
    fint limit = theSIC->inlineLimit[NmInstrLimit];
    bool ok = size <= cutoff && estimated + size < limit;
    if (ok && PrintInlining) {
      lprintf("%*s*inlining %s anyway: callee is small (%d/%d/%d/%d)\n",
              (void*)depth, "", selector_string(info->sel),
              (void*)size, (void*)cutoff, (void*)estimated, (void*)limit);
    }
    return ok;
  }
  
  bool SCodeScope::shouldInlineSend(SendInfo* info, RScope* rs, SExpr* rcvr,
                                    oop m, InlineLimitType limitType) {
    MethodLookupKey* k = info->key;
    if (!k->selector->is_string()) return false;

    if (isRecursiveCall(m, k->receiverMapOop(), MaxRecursionUnroll)) {
      info->uninlinable = true;
      return false;
    }
    
    if (!Inline) {
      assert(InlineSTMessages, "shouldn't be here");
      // NB: works only with rewritten whileTrue/False (using _Restart)
      if (isSmalltalkInlined(k->selector)) return true;
      if (isSmalltalkInlined(selector())) return true;
      return false;
    }

    if (limitType == NormalFnLimit) {
      // check args to see if any of them is a block; if so, increase limit
      fint top = exprStack->length();
      fint argc = stringOop(k->selector)->arg_count();
      for (fint i = argc; i > 0; i--) {
        if (exprStack->nth(top - i)->preg()->isBlockPReg()) {
          limitType = BlockArgFnLimit;
          goto done;
        }
      }
      // check receiver
      if (lookupReceiverIsSelf(k->lookupType)) {
        if (self->preg()->isBlockPReg()) limitType = BlockArgFnLimit;
      } else if (exprStack->nth(top - argc - 1)->preg()->isBlockPReg()) {
        limitType = BlockArgFnLimit;
      }
    }
    
   done:
    if (calleeTooBig(info, rs, limitType)) {
      // register this send as uninlinable
      theSIC->registerUninlinable(info, limitType, 9999);
      return false;
    }

    // NB: this test comes after calleeTooBig to prevent forced inlining of
    // e.g. a really complicated user-defined '+' for matrices
    if (isCheapMessage(stringOop(k->selector))) {
      msgCost = costP->cheapSendCost;
      return true;
    }

    fint cutoff = theSIC->inlineLimit[limitType];
    msgCost = sicCost( m, this, costP);
    if (info->primFailure &&
        info->nsends < MinPrimFailureInvocations) {
      if (rs->isPICScope() && ((RPICScope*)rs)->sd->isOptimized()) {
        // the fail block send is optimized, it's probably executed frequently
      } else if (rs->isSelfScope()) {
        // was inlined in previous version, so do it again
      } else {
        // don't inline error block unless trivial or taken often
        if (msgCost > MaxTrivialPrimFailureCost) return false;
        // should also look at block method, not default value:With:
        Map* map = rcvr->map();
        if (map->is_block()) {
          slotsOop method = ((blockMap*)map)->value();
          msgCost = sicCost( method, this, failCostP);
          // bug: should estimate real length of prim failure; e.g. could
          // have single send (cost 1) but that method sends more and more
          // msgs...i.e. need concept of "being in fail branch" so that
          // no further inlining takes place -- fix this
          if (msgCost > MaxTrivialPrimFailureCost) return false;
        }
      }
    }
    if (msgCost > cutoff) {
      if (calleeIsSmall(info, rs, limitType)) return true;
      theSIC->registerUninlinable(info, limitType, msgCost);
      return false;
    }
    return true;
  }

  bool SCodeScope::shouldInlineBlock(SendInfo* info, RScope* rs,
                                     SExpr* rcvr, oop method) {
    return shouldInlineSend(info, rs, rcvr, method, BlockFnLimit);
  }

  bool SCodeScope::shouldInlineMethod(SendInfo* info, RScope* rs,
                                      SExpr* rcvr, oop meth) {
    return shouldInlineSend(info, rs, rcvr, meth, NormalFnLimit);
  }
  
  SSelfScope* SCodeScope::notify(stringOop selector, const char* msg) {
    if (PrintInlining) {
      lprintf("%*s*cannot inline %s, cost = %ld (%s)\n", (void*)depth, "",
              selector_string(selector), (void*)msgCost, msg);
    }
    return NULL;        // cheap trick to make calls more convenient
  }

  SSelfScope* SCodeScope::tryLookup(SendInfo* info, SExpr* rcvr) {
    // info->rcvr is the overall receiver (e.g. a merge expr), rcvr is
    // a particular branch
    // nmln* depsTop = theSIC->L->deps->top;
    assert(rcvr->hasMap(), "should have a map");
    
    SICLookup* L = new SICLookup(info->l,
                                 rcvr->isConstantSExpr()
                                   ? rcvr->asConstantSExpr()->constant()
                                   : rcvr->map()->enclosing_mapOop(),
                                 info->sel,
                                 info->del,
                                 theSIC->L->deps,
                                 this );

    L->perform_lookup();
    info->key= new_MethodLookupKey(L->key);
    
    if (L->result() == NULL) {
      // nothing found statically
      // should remove unused deps here
      if (L->status == foundNone) {
        // next recompilation might get it via PICs
        theSIC->registerUninlinable(info, NormalFnLimit, 0);
      } else {
        info->uninlinable = true;
      }
      char msg[80];
      sprintf(msg, "lookup failed: %s", lookupStatusString(L->status));
      return notify(info->sel, msg);
    }

    slotDesc* s = L->result()->as_real()->desc;
    assert(! s->is_vm_slot(), "shouldn't be a vm slot");
    RScope* rs = rscope->subScope(_bci, L);
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      bool isNullRScope = rs->isNullScope(); // for breakpoints
    }
#   endif
    
    if (s->is_map_slot()) {
      // handle constant slots first
      
      if ( !s->data->has_code()) {
        // inline value of a constant slot
        msgCost = 0;
        return new SConstantSlotAccessScope(L, this, rs, rcvr, info);
      } 
      switch ( s->data->kind() ) {
       case BlockMethodType:
        return tryLookupOfBlockMethod(info, rcvr, rs, s->data, L);

       case OuterMethodType:
        return tryLookupOfOuterMethod(info, rcvr, rs, s->data, L);

       default:
         fatal("unexpected kind of code in slot");
      }
    } 

    assert(s->is_obj_slot(), "unexpected slot type");
    // is not map slot
    // found a slot in the receiver or one of its ancestors
    msgCost = 0;

    return
     info->sel->is_1arg_keyword()
       ?  // inline assignment to an instance variable
          (SSelfScope*) new SDataSlotAssignScope(L, this, rs, rcvr, exprStack->top(),
                                   info) 
       :  // inline access of an instance variable
          (SSelfScope*) new SDataSlotAccessScope(L, this, rs, rcvr, info);
  }


  SSelfScope* SCodeScope::tryLookupOfOuterMethod( SendInfo* info,
                                                  SExpr* rcvr,
                                                  RScope* rs, 
                                                  oop methodObj,
                                                  SICLookup* L) {
    oop mh = L->result()->as_real()->generalized_methodHolder_or_map(L->receiver);
    if (mh == MH_TBD) {
      // method holder is not known statically; cannot inline
      return notify(info->sel, "method holder unknown");
    }
    if ( !shouldInlineMethod(info, rs, rcvr, methodObj))
      return notify(info->sel, "rejected");

    // fix rs here
    return new SMethodScope(methodObj, mh, this, rs, info);
  }


  SSelfScope* SCodeScope::tryLookupOfBlockMethod( SendInfo* info, 
                                                  SExpr* rcvr, 
                                                  RScope* rs, 
                                                  oop methodObj,
                                                  SICLookup* L) {
    // inline block method (value, value: etc)
    if (!shouldInlineBlock(info, rs, rcvr, methodObj))
      return notify(info->sel, "rejected");

    SScope* parentScope;
    if (rcvr->isClonedBlockSExpr()) {
      // result of a BlockClone node
      parentScope = ((ClonedBlockSExpr*)rcvr)->blockScope();
      assert(!parentScope->isVFrameScope(), "shouldn't be a vf scope");
      assert(parentScope->isCodeScope(), "shouldn't be access");
    }
    else if ( L->result()->as_real()->holder->is_map() 
         &&   L->result()->as_real()->holder->map() == theSIC->L->receiverMap()) {
      // block is in same clone family as receiver block; therefore,
      // must have same parent scope as receiver block
      // example: value:With: sends value:
      assert_block(theSIC->L->receiver, "expecting a block literal");
      blockOop block = (blockOop) theSIC->L->receiver;
      compiled_vframe* vf = block->parentVFrame(NULL)->as_compiled();
      parentScope = new_SVFrameScope(vf);
    }
    else {
      // can't find nmethod for this block
      assert(! (L->result()->as_real()->holder->is_map() &&
                L->result()->as_real()->holder->map()->equal(
                    theSIC->L->receiverMap())),
             "block map cloning got us again");
      return notify(info->sel, "unknown block");
    }
    //    fix rs here
    return new SBlockScope(methodObj, parentScope, this, rs, info);
  }


  SExpr* SCodeScope::doInline(SSelfScope* s, SExpr* rcvr, Node* start,
                              MergeNode* end) {
    s->receiver = rcvr->asReceiver();
    if (PrintInlining) {
      lprintf("%*s*inlining %s, cost %ld/size %ld (%#lx)%s\n", (void*)depth, "",
              (s->isCodeScope() 
                ? sprintName((methodMap*)s->method()->map(), s->selector())
                : selector_string(s->selector())), // was: selector_string(s->selector()),
               (void*)msgCost, (void*)calleeSize(s->rscope),
              s, s->rscope->isNullScope() ? "" : "*");
    }
    Node* next = start->next();
    if (next) start->removeNext(next);
    theNodeGen->current = start;
    s->genCode();
    if (next && end) theNodeGen->branch(end);
    return s->result;
  }
    
  SExpr* SCodeScope::picPredictUnlikely(SendInfo* info,
                                        RUntakenScope* uscope) {
    if (theSIC->useUncommonTraps &&
        info->primFailure && uscope->isUnlikely()) {
      // this send was never executed in the recompilee
      // only make the send unlikely if it had a chance to execute
      // (If the send isn't a prim failure, don't trust the info --
      // it's unlikely that the method just stops executing in the middle.
      // What probably happened is that recompilation happens before the
      // rest of the method got a chance to execute (e.g. recursion), or it
      // always quit via NLR.  In any case, the compiler can't handle this
      // yet - need to treat it specially similar to endsDead.)
      info->nsends = 0;
      const fint MinSends = MinPrimFailureInvocations;
      fint count = uscope->caller->invocationCount();
      if (count <= 0) {
        // hack: optimized method has no count, so assume it's > MinSends
        count = MinSends + 1;
      }
      bool makeUncommon = count >= MinSends && uscope->sd->wasNeverExecuted();
      if (PrintInlining) {
        lprintf("%*s*%sPIC-type-predicting %s as never executed\n",
                (void*)depth, "", makeUncommon ? "" : "NOT ",
                info->sel->copy_null_terminated());
      }
      if (makeUncommon) {
        return new UnknownSExpr(info->rcvr->preg(), NULL, true);
      }
    }
    return info->rcvr;
  }

  SExpr* SCodeScope::picPredict(SendInfo* info) {
    // check PICs for information
    if (!UsePICRecompilation) return info->rcvr;
    bool canBeUnlikely = theSIC->useUncommonTraps;
    if (rscope->hasSubScopes(_bci)) {
      RScopeBList* l = rscope->subScopes(_bci);
      if (l->first()->isUntakenScope() && l->length() == 1) {
        return picPredictUnlikely(info, (RUntakenScope*)l->first());
      } else if (info->rcvr->containsUnknown()) {
        if (PrintInlining) {
          lprintf("%*s*PIC-type-predicting %s (%ld maps)\n", (void*)depth, "",
                  info->sel->copy_null_terminated(), (void*)l->length());
        }
        for (fint i = 0; i < l->length(); i++) {
          RScope* r = l->nth(i);
          SExpr* expr = r->receiverExpr();
          if (expr->isUnknownSExpr()) {
            // untaken real send (from PIC)
          } else if (expr->map()->is_block()) {
            // for now, doesn't make sense to predict block maps because of
            // map cloning
            if (PrintInlining) {
              lprintf("%*s*not predicting block map\n", (void*)depth, ""); 
            }
            canBeUnlikely = false;
          } else {
            SExpr* alreadyThere = info->rcvr->findMap(expr->myMapOop());
            if (alreadyThere) {
              // generalize to map if only have constant
              if (alreadyThere->isConstantSExpr())
                info->rcvr = info->rcvr->mergeWith(expr, NULL);
            } else {
              // add map only if type isn't already present (for splitting)
              info->predicted = true;
              info->rcvr = info->rcvr->mergeWith(expr, NULL);
              if (expr->hasConstant() && l->length() == 1) {
                // check to see if single predicted receiver is true or false;
                // if so, add other boolean to prediction.  Reduces the number
                // of uncommon branches; not doing so appears to be overly
                // aggressive (as observed experimentally)
                oop c = expr->constant();
                if (c == Memory->trueObj &&
                    !info->rcvr->findMap(Memory->false_mapOop())) {
                  SExpr* f = new ConstantSExpr(Memory->falseObj, NULL, NULL);
                  info->rcvr = info->rcvr->mergeWith(f, NULL);
                } else if (c == Memory->falseObj &&
                           !info->rcvr->findMap(Memory->true_mapOop())) {
                  SExpr* t = new ConstantSExpr(Memory->trueObj, NULL, NULL);
                  info->rcvr = info->rcvr->mergeWith(t, NULL);
                }
              }
            }
          }
        }
      } else {
        // know receiver type precisely
        return info->rcvr;
      }
      // mark unknown branch as unlikely
      UnknownSExpr* u = info->rcvr->findUnknown();
      if (u && canBeUnlikely && theSIC->useUncommonTraps && 
          rscope->isUncommonAt(_bci, false)) {
        info->rcvr = info->rcvr->makeUnknownUnlikely(this);
      }
    } else if (theSIC->useUncommonTraps &&
               info->primFailure &&
               rscope->isUncommonAt(_bci, true)) {
      // this is the failure send of a primitive, and the failure was made
      // uncommon in the recompilee, and it was never taken, so keep it
      // uncommon
      if (PrintInlining) {
        lprintf("%*s*PIC-type-predicting %s as never executed (2)\n",
                (void*)depth, "", info->sel->copy_null_terminated());
      }
      info->rcvr = new UnknownSExpr(info->rcvr->preg(), NULL, true);
    }
     
    assert(info->rcvr->preg(), "should have a preg");
    return info->rcvr;
  }

  SExpr* SCodeScope::typePredict(SendInfo* info) {
    // try static type prediction
    PReg* r = info->rcvr->preg();
    stringOop sel = info->sel;
    if (sel == VMString[IF_TRUE_] ||
        sel == VMString[IF_FALSE_] ||
        sel == VMString[IF_TRUE_FALSE_] ||
        sel == VMString[IF_FALSE_TRUE_] ||
        sel == VMString[OR]  || sel == VMString[AND] || sel == VMString[NOT]) {
      // boolean message
      if (PrintInlining) {
        lprintf("%*s*type-predicting %s\n", (void*)depth, "",
               sel->copy_null_terminated());
      }
      info->predicted = true;
      bool allowUnlikely = theSIC->useUncommonTraps;
      if (SICDeferUncommonBranches &&
          (sel == VMString[IF_TRUE_] ||
           sel == VMString[IF_FALSE_] ||
           sel == VMString[IF_TRUE_FALSE_] ||
           sel == VMString[IF_FALSE_TRUE_])) {
        // these bets are really safe - make uncommon even when recompiling
        // due to uncommon trap (if the ifTrue itself caused the trap,
        // rscope->isUncommonAt will be false, so this is safe)
        allowUnlikely = true;
      }
      if (allowUnlikely) {
        if (rscope->isUncommonAt(_bci, false)) {
          // ok, no uncommon trap here
        } else if (rscope->hasSubScopes(_bci)) {
          // has real send for ifTrue et al. -- must be NIC-compiled
          // make uncommon unlikely if no non-true/false receiver present
          RScopeBList* subs = rscope->subScopes(_bci);
          for (fint i = subs->length() - 1; i >= 0; i--) {
            RScope* s = subs->nth(i);
            SExpr* rcvr = s->receiverExpr();
            if (rcvr->hasMap()) {
              Map* m = rcvr->map();
              if (m != Memory-> true_map() &&
                  m != Memory->false_map()) {
                allowUnlikely = false;
                break;
              }
            }
          }
          if (WizardMode && !allowUnlikely)
            warning("SIC: non-bool receiver for ifTrue: et al. detected");
        }
        if (allowUnlikely) {
          // make unknown case unlikely despite 
          info->rcvr = info->rcvr->makeUnknownUnlikely(this);
        }
      }
      SExpr* rcvr = info->rcvr;
      SExpr* t = new ConstantSExpr(Memory->trueObj , r, NULL);
      SExpr* f = new ConstantSExpr(Memory->falseObj, r, NULL);
      // make sure we don't destroy splitting info; only add types if not
      // already present
      if (rcvr->findMap(Memory-> true_mapOop()) == NULL)
        rcvr = rcvr->mergeWith(t, NULL);
      if (rcvr->findMap(Memory->false_mapOop()) == NULL)
        rcvr = rcvr->mergeWith(f, NULL);
      return rcvr;
    }
    
    if (// binary integer arithmetic messages
        sel == VMString[PLUS] ||
        sel == VMString[MINUS] ||
        sel == VMString[PERCENT] ||
        sel == VMString[LESS_THAN] ||
        sel == VMString[LESS_EQUAL] || 
        sel == VMString[GREATER_EQUAL] ||
        sel == VMString[GREATER_THAN] ||
        // integer looping messages
        sel == VMString[TO_DO_] ||
        sel == VMString[UP_TO_DO_] ||
        sel == VMString[DOWN_TO_DO_] ||
        sel == VMString[TO_BY_DO_] ||
        sel == VMString[UP_TO_BY_DO_] ||
        sel == VMString[DOWN_TO_BY_DO_] ||
        // unary integer arithmetic selectors
        sel == VMString[SUCCESSOR] ||
        sel == VMString[SUCC] ||
        sel == VMString[PREDECESSOR] ||
        sel == VMString[PRED]) {
      if (info->rcvr->findMap(Memory->smi_map->enclosing_mapOop())) return info->rcvr;
      if (PrintInlining) {
        lprintf("%*s*type-predicting %s\n", (void*)depth, "",
                sel->copy_null_terminated());
      }
      info->predicted = true;
      SExpr* res =
        info->rcvr->mergeWith(new MapSExpr(Memory->smi_map->enclosing_mapOop(),
                                           r, NULL), NULL);
      if (theSIC->useUncommonTraps && rscope->isUncommonAt(_bci, false)) {
        info->rcvr = res = res->makeUnknownUnlikely(this);
      }
      return res;
    }
    
    return info->rcvr;
  }

# else // !SIC_COMPILER
  void sicInline_init() {}
# endif
