/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "sicSplit.hh"
# include "_sicSplit.cpp.incl"

  const uint32 SplitSig::LevelMask = 0xf;

  class SplitSetting : public StackObj {
  public:
    SplitSig*& sig;
    SplitSig* saved;
    SplitSetting(SplitSig*& oldsig, SplitSig* newsig) : sig(oldsig) {
      saved = oldsig; oldsig = newsig;
    }
    ~SplitSetting() { sig = saved; }
  };

  SplitSig* new_SplitSig(SplitSig* current, fint splitID) {
    fint level = current->level() + 1;
    assert(level <= MaxSplitDepth, "max. split level exceeded");
    uint32 newID = splitID << ((MaxSplitDepth - level + 1) << 2);
    SplitSig* sig =
      (SplitSig*)((uint32(current) & ~SplitSig::LevelMask) | newID | level);
    assert(current->contains(sig), "should be in same branch");
    return sig;
  }

  void SplitSig::print() {
    char buf[MaxSplitDepth + 1];
    lprintf("SplitSig %#lx: %s", this, prefix(buf));
  }

  char* SplitSig::prefix(char* buf) {
    // fill buf with an ASCII representation of the receiver and return buf
    // e.g. a level-2 sig with first branch = 1 and 2nd branch = 3 --> "AB"
    fint l = level();
    buf[l--] = 0;
    uint32 sig = uint32(this) >> 4;
    while (l >= 0) {
      buf[l--] = 'A' + (sig & 0xf);
      sig = sig >> 4;
    }
    return buf;
  }


  // compiler code for splitting

  bool SCodeScope::shouldSplit(SendInfo* info) {
    assert(info->rcvr->isMergeSExpr(), "should be merge expr");
    MergeSExpr* r = (MergeSExpr*) info->rcvr;
    assert(r->isSplittable(), "should be splittable");
    if (!SICSplitting) return false;
    if (sig->level() == MaxSplitDepth) return false;
    Node* current = theNodeGen->current;
    if (!current->isSplittable()) return false;

    fint cost = 0;
    fint costLimit = theSIC->inlineLimit[SplitCostLimit];

    Node* n = 0;
    // compute the cost of all nodes that would be copied (i.e. all exprs
    // with a map type)
    fint i;
    for (i = 0; i < r->exprs->length(); i++) {
      SExpr* expr = r->exprs->nth(i);
      if (!expr->hasMap()) continue;    // won't copy these

      // ConstantExprs, for example have no node, so have no cost
      if ( expr->node() == 0 ) continue;

      SSelfScope* theScope = expr->node()->scope();
      fint theBCI = expr->node()->bci();
      for (SExpr* e = expr; e; e = e->next) {
        if (e->node()->scope() != theScope || e->node()->bci() != theBCI) {
          // make sure all subexpressions have the same scope
          // (otherwise can't describe live range of that value when split)
          // could fix this with better splitting (introduce temps to
          // "synchronize" the value's scopes)
          if (PrintInlining) {
            lprintf("%*s*not splitting %s: too complicated (scopes)\n",
                    (void*)depth, "", info->sel->copy_null_terminated());
          }
          r->setSplittable(false);      // no sense trying again
          return false;
        }
        Node* prev;
        // This for loop misses some merges becaues it only follows first successor of n.
        // That's why the assertion below is commented out. -- dmu 6/03
        for ( n = e->node(); 
              cost <= costLimit  &&  n != 0  &&  n != current; 
              n = n->next()) {
          cost += n->cost();
          if (!n->isSplittable()) {
            if (PrintInlining) {
              lprintf("%*s*not splitting %s: unsplittable node\n",
                    (void*)depth, "", info->sel->copy_null_terminated());
            }
            return false;
          }
#         if GENERATE_DEBUGGING_AIDS
            if (CheckAssertions) {
              prev = n;       // for easier debugging
            }
#         endif
        }
        // assert(n, "why didn't we find current?"); -- because only followed first succ above (dmu)
        if ( n == 0  ||  cost > costLimit) goto done;
      }
    }
    
   done:
    if ( n != current  ||  cost > costLimit ) {
      if (PrintInlining) {
        lprintf("%*s*not splitting %s: cost too high (%ld > %ld) or did not find current\n",
                (void*)depth, "",
                info->sel->copy_null_terminated(),
                (void*) cost, 
                (void*) costLimit );
      }
      if (n == current) {
        // When we changed cost to count up from 0 instead of down,
        // we found a bug: Urs was passing in what would be
        // costLimit-cost, but we think it should just be cost.
        //  -- dmu & ole a 6/96
        theSIC->registerUninlinable(info, SplitCostLimit, cost );
      }
      return false;
    }
    
    return true;
  }

  SExpr* SCodeScope::splitMerge(SendInfo* info, MergeNode*& newMerge) {
    // Split this send: copy nodes between sources of oldRcvr's parts and the current
    // node, then inline the send along all paths; merge paths back at newMerge,
    // result in info->resReg.
    // (rewritten & refactored by dmu 5/96)
    
    newMerge = new MergeNode("splitMerge newMerge");
    MergeSExpr* oldRcvr = (MergeSExpr*)info->rcvr;
    assert(oldRcvr->isSplittable(), "should be splittable");

    // performance bug - fix this: can't split on MergeSExpr more than once
    // because after changing the CFG the old expr points to the wrong nodes.
    //  -- urs
    // 
    // (After talking to Urs, I believe I can explain the above.)
    // Before splitting, oldRcvr contained a reference
    //  to a MergeNode. 
    // During splitting, the MergeNode was used
    //  to find the end-point of the nodes to copy.
    // After splitting, the original MergeNode survives on only one
    //  path.
    // So the Expr could not be split again because its MergeNode no longer
    //  identifies all the paths that would need to be copied.
    // 
    // Now, it seems to me that the merge expr should be mutated to
    //  point to the new merge node and new merged values.
    // But, since Exprs are generally treated as immutable, 
    //  that could be problematic.
    //    -- dmu 5/96
    //
    // For now, just prohibit future splitting on this expr.
    
    if ( !SICMultipleSplitting )
      oldRcvr->setSplittable(false);
    
    memoizeBlocks(info->sel);
    if (PrintInlining) {
      lprintf("%*s*splitting %s\n", (void*)depth,
              "", selector_string(info->sel));
    }

    Node* lastNodeToSplit = theNodeGen->current;

    OopBList*   splitRcvrMaps = new   OopBList(10);     // receiver map of each branch
    SExprBList* splitRcvrs    = new SExprBList(10);     // receiver expr of each branch
    NodeBList*  splitHeads    = new  NodeBList(10);     // first node of each branch

    bool needMapLoad = false;
    SExpr* resultOfInlinedSends = 0;
    splitInlinablePaths( newMerge,
                         info,
                         oldRcvr,  
                         lastNodeToSplit, 
                         
                         splitRcvrMaps,
                         splitRcvrs,
                         splitHeads,
                         needMapLoad,
                         resultOfInlinedSends );    

    UnknownSExpr* u = oldRcvr->findUnknown();

    if (u && splitRcvrMaps->length() > 0) {
      addTypeTestWhereUnknownsMerge(  info,  oldRcvr,  u,  needMapLoad,
                                      splitRcvrMaps,  splitRcvrs,  splitHeads,
                                      lastNodeToSplit );
    }

    if (info->needRealSend) {
      // The non-inlined send will be generated along the original (merged)
      // path, which will then branch to "newMerge".
      theNodeGen->current = lastNodeToSplit;
    } else {
      // discard the original path - can no longer reach it
      theNodeGen->current = newMerge;
    }

    if ( resultOfInlinedSends &&  resultOfInlinedSends->isMergeSExpr()) 
      resultOfInlinedSends->setNode(newMerge, info->resReg);

    if ( SICMultipleSplitting ) {
      //  Try mutating oldRcvr. This may be dangerous since SExpr's are
      //  in general immutable. However, its node must be set to the final merge
      //  for this split (will be used for future splitting).
      //  And its exprs must cover all the receiver expressions.

      if (u)
          splitRcvrs->append(u);
      oldRcvr->resetTo( newMerge, splitRcvrs );
    }
    return resultOfInlinedSends;
  }



  // for all paths with map info, split off paths and inline the send
  // set info->needRealSend if send is needed,
  // store maps, rerceivers, heads in the 3 lists
  // set needMapLoad, resultOfInlinedSends
  
  void SCodeScope::splitInlinablePaths( MergeNode*  newMerge,
                                        SendInfo*   info,
                                        MergeSExpr* oldRcvr, 
                                        Node*       lastNodeToSplit,
                                        
                                        OopBList*   splitRcvrMaps,
                                        SExprBList* splitRcvrs,
                                        NodeBList*  splitHeads,
                                        bool&       needMapLoad,
                                        SExpr*&     resultOfInlinedSends ) {
    needMapLoad = false;
    resultOfInlinedSends = 0;
    
    fint ncases = oldRcvr->exprs->length();
    for (fint i = 0; i < ncases; i++) {
      bool didSplit = splitPathIfInlinable(  
                                 newMerge,
                                 info,
                                 oldRcvr, 
                                 i, 
                                 lastNodeToSplit, 
                                      
                                 splitRcvrMaps, 
                                 splitRcvrs, 
                                 splitHeads,
                                 needMapLoad,
                                 resultOfInlinedSends);
      if (didSplit)
        ;   // cool
      else  if ( oldRcvr->exprs->nth(i)->isUnknownUnlikely() )  
        ;   // also cool, the send is unlikely
      else  // can't inline - need to append a real send after current
        info->needRealSend = true;
    }
  }


  bool SCodeScope::splitPathIfInlinable( 
                               MergeNode*  newMerge, 
                               SendInfo*   info,
                               MergeSExpr* oldRcvr, 
                               fint        i,
                               Node*       lastNodeToSplit,
                               
                               OopBList*   splitRcvrMaps,
                               SExprBList* splitRcvrs,
                               NodeBList*  splitHeads,
                               bool&       needMapLoad,
                               SExpr*&     resultOfInlinedSends ) {
                               
    // is path inlinable?
    
    SExpr* nthOldRcvr = oldRcvr->exprs->nth(i);
    assert(!nthOldRcvr->isConstantSExpr() || nthOldRcvr->next == 0 ||
           nthOldRcvr->constant() == nthOldRcvr->next->constant(),
             "shouldn't happen: merged consts - convert to map");
    if ( ! nthOldRcvr->hasMap() )
      return false;
    SSelfScope* nthScope = tryLookup(info, nthOldRcvr);
    if ( nthScope == 0 )
      return false;
    
    
    // Create a new PReg&SExpr for the receiver so that it has the right
    // scope (the nodes will replace the old result reg with the new
    // one while they are copied).  
    // (Since we're splitting starting at the original producer, the
    // original result may be in an arbitrary subscope of the receiver
    // or even in a sibling.  For reg. allocation et al., the result
    // must have a PReg that's live from the producing point to here.)
    
    SplitSetting setting(theSIC->splitSig, new_SplitSig(sig, i + 1));
    if (nthScope->isCodeScope())
      ((SCodeScope*)nthScope)->sig = theSIC->splitSig;
    SplitPReg* newPR = coveringRegFor(nthOldRcvr, theSIC->splitSig);
    SExpr* nthNewRcvr = nthOldRcvr->shallowCopy(newPR, nthOldRcvr->node());
    
    
      
    Node* mapMerge = new MergeNode("splitPathIfInlinable mapMerge"); // where all copied paths merge
    splitHeads->append( mapMerge);
    splitRcvrs->append( nthNewRcvr);
    
    // compute map needed for type test for this path
    // if not immediate, will need to load it
    
    if (nthOldRcvr->isConstantSExpr()) {
      splitRcvrMaps->append( nthOldRcvr->constant());
    } 
    else {
      splitRcvrMaps->append( nthOldRcvr->map()->enclosing_mapOop());
      Map* m = nthOldRcvr->map();
      needMapLoad |= m != Memory->smi_map && m != Memory->float_map;
    }
    
    // split off paths of all SExprs with this map up to merge point (mapMerge)
    splitPathsWithSameMap(mapMerge, oldRcvr, nthOldRcvr, nthNewRcvr, newPR);

    // copy everything between mapMerge and lastNodeToSplit
    theNodeGen->current = copyPath(mapMerge, oldRcvr->node(), lastNodeToSplit,
                               0, 0, oldRcvr, nthNewRcvr);
      
    // now inline the send
    SExpr* e = doInline(nthScope, nthNewRcvr, theNodeGen->current, 0);
    if (!e->isNoResultSExpr()) {  
      theNodeGen->append(new NopNode);
      e = e->shallowCopy(info->resReg, theNodeGen->current);
      resultOfInlinedSends = 
        resultOfInlinedSends 
          ? resultOfInlinedSends->mergeWith(e, newMerge) 
          : e;
    }
    theNodeGen->branch(newMerge);

    return true;
  }


  void SCodeScope::splitPathsWithSameMap( Node*        mapMerge,
                                          MergeSExpr*  oldRcvr, 
                                          SExpr*       nthOldRcvr, 
                                          SExpr*       nthNewRcvr,
                                          SplitPReg*   newPR ) {
                                      
    // split off paths of all SExprs with this map up to merge point (mapMerge)
    
    Node* rmerge = oldRcvr->node();
    assert(rmerge, "should have a node");
    for (SExpr* expr = nthOldRcvr;   expr;   expr = expr->next) {
      Node* n = expr->node();
      PReg* oldPR = expr->preg();
      assert(n->isSplittable(), "can't handle branches etc. yet");
      Node* frst = n->next();
      n->removeNext(frst);

      // insert an assignment
      // It is not safe to replace n's dest
      //  because other nodes might be using its value.
      //  cf the bytesDo: bug -- dmu 5/96
      
      if (newPR)
        n = n->append(new AssignNode(oldPR, newPR));
        
      n = copyPath(n, frst, rmerge, oldPR, newPR, oldRcvr, nthNewRcvr);
      n = n->append(mapMerge);
    }
  }



  void SCodeScope::addTypeTestWhereUnknownsMerge( SendInfo*     info,
                                                  MergeSExpr*   oldRcvr, 
                                                  UnknownSExpr* unknownOldRcvr,
                                                  bool          needMapLoad,
                                                  OopBList*     splitRcvrMaps,
                                                  SExprBList*   splitRcvrs,
                                                  NodeBList*    splitHeads,
                                                  
                                                  Node*& lastNodeToSplit) {
    // insert a type test after oldMerge (all unknown paths should meet
    // at that node)
    
    
    // Performance bug: the known-but-uninlinable sends will also go
    // through the type test; they should be redirected until after the
    // test.  The problem is that oldMerge may not be the actual merge
    // point but slightly later (i.e. a few InlinedReturns later).
    fint diff;
    if (WizardMode && PrintInlining &&
      (diff = oldRcvr->exprs->length() - splitRcvrMaps->length()) > 1) {
      lprintf("*unnecessary %d-way type test for %d cases\n",
                (void*)splitRcvrMaps->length(),
                (void*)diff);
    }
    
    Node* oldMerge = oldRcvr->node();
    Node* oldNext = oldMerge->next();
    if (oldNext) 
      oldMerge->removeNext(oldNext);
      
    PReg* oldRcvrPR = oldRcvr->preg();
    Node* typeCase = new TypeTestNode(oldRcvrPR, splitRcvrMaps, needMapLoad, true);
    oldMerge->append(typeCase);
    
    if ( !theSIC->useUncommonTraps) // uncommon, unshmommon
      info->needRealSend = true;
      
    if (info->needRealSend ) {
      // connect fall-through (unknown) case to old merge point's successor (oldNext)
      // i.e. oldNext leads to the real send
      if (oldNext) {
        typeCase->append(oldNext);
      }
      else {
        assert(lastNodeToSplit == oldMerge, "oops");
        lastNodeToSplit = typeCase->append(new NopNode);
      }
    } else {
      // make unknown case uncommon
      if (oldNext) {
        // must copy nodes between old merge point (i.e. end of the send
        // generating the receiver value) and last node to split; this code
        // computes the args of the current send
        theNodeGen->current = copyPath(typeCase, oldNext, lastNodeToSplit,
                                         0, 0, oldRcvr, unknownOldRcvr);
      } 
      else {
        assert(lastNodeToSplit == oldMerge, "oops");
        theNodeGen->current = typeCase;
      }
      theNodeGen->uncommonBranch(currentExprStack(0), info->restartPrim);
      if (PrintInlining) {
        lprintf("%*s*making %s uncommon (3)\n",
                 (void*)depth, "", selector_string(info->sel));
      }
    }
    // finally add the success branches to the type case
    //  (link up with the known split paths)
    for (fint j = 0; j < splitRcvrMaps->length(); j++) {
      Node* n = new AssignNode(oldRcvrPR, splitRcvrs->nth(j)->preg());
      typeCase->append(j + 1, n);
      n->append(splitHeads->nth(j));
    }
  }
  

  Node* SCodeScope::copyPath(Node* n, Node* start, Node* end,
                             PReg* oldPR, PReg* newPR,
                             MergeSExpr* rcvr, SExpr* newRcvr) {
    // copy the path from start to end, replacing occurrences of oldPR
    // with newPR; append copies to n, return last node
    if (SICDebug) {
      char* s = NEW_RESOURCE_ARRAY(char, 100);
      sprintf(s, "start of copied code: %#lx(N%d) --> %#lx(N%d) @ %#lx(N%d)",
              (unsigned long)start, start->id(),
              (unsigned long)end, end->id(),
              (unsigned long)n, n->id());
      n = n->append(new CommentNode(s));
    } 
    assert(!oldPR || !oldPR->isBlockPReg(), "cannot handle BlockPRegs");
    for (Node* c = start; true; c = c->next()) {
      assert(c->isSplittable(), "can't handle branches yet");
      Node* copy = c->copy(oldPR, newPR);
      if (copy && copy->isMarkerNode()) {
        ((MarkerNode*)copy)->checkSplitting(rcvr, newRcvr);
      }
      if (copy) n = n->append(copy);
      if (c == end) break;
    }
    if (SICDebug) n = n->append(new CommentNode("end of copied code"));
    return n;
  }

  SplitPReg* SCodeScope::coveringRegFor(SExpr* expr, SplitSig* sg) {
    // create a PReg with a live range covering all nodes between the
    // producer and the receiver scope/bci
    // see also SAPReg::isLiveAt
    SSelfScope* s = expr->node()->scope();
    fint bci = expr->node()->bci();
    assert(s->isCodeScope(), "oops");
    SplitPReg* r = SAPReg::regCovering(this, _bci, (SCodeScope*)s, bci, sg);
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        for (SExpr* e = expr; e; e = e->next) {
          SSelfScope* s2 = e->node()->scope();
          fint bci2 = e->node()->bci();
          assert(s2 == s, "oops");
          assert(bci2 == bci, "oops");
        }
      }
#   endif
    return r;
  }

# endif
