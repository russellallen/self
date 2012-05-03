/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "sicExpr.hh"
# include "_sicExpr.cpp.incl"

  // merge expressions have the following properties:
  // - they never have more than MaxPICSize+1 elements
  // - they're flat (i.e don't contain other MergeSExprs)

  SExpr* SExpr::copyMergeWith(SExpr* other, PReg* p, Node* nod) {
    SExpr *m = new MergeSExpr(p, nod);
    if (!p) m->_preg = preg();
    m = m->mergeWith(this, nod);
    m = m->mergeWith(other, nod);
    return m;
  }

  MergeSExpr::MergeSExpr(PReg* p, Node* nod) : SExpr(p, nod) { initialize(); }

  void MergeSExpr::initialize() {
    exprs = new SExprBList(MaxPICSize + 1); setSplittable(_node != NULL);
  }

  NoResultSExpr::NoResultSExpr(Node* n) : SExpr(theNodeGen->noPR, n) {}

  MapSExpr::MapSExpr(mapOop m, PReg* p, Node* n) : SExpr(p, n) {
    assert_map(m, "must be a map");
    _myMapOop = m;
  }
  
  ClonedBlockSExpr::ClonedBlockSExpr(mapOop m, PReg* p, Node* n)
  : MapSExpr(m, p, n) {
    assert(m->map_addr()->is_block(), "not a block");
    assert(p->isBlockPReg(), "not a block preg");
    assert(n, "must have a node");
    _blockScope = (SCodeScope*)p->scope;
  }

  const fint UnknownSExpr::UnlikelyBit = 1;

  bool UnknownSExpr::equals(SExpr* other) {
    return other->isUnknownSExpr();
  }

  bool NoResultSExpr::equals(SExpr* other) {
    return other->isNoResultSExpr();
  }

  bool MapSExpr::equals(SExpr* other) {
    return (other->isMapSExpr() || other->isConstantSExpr()) &&
           other->myMapOop() == myMapOop();
  }

  bool ClonedBlockSExpr::equals(SExpr* other) {
    return other->isClonedBlockSExpr() && other->myMapOop() == myMapOop();
  }

  bool ConstantSExpr::equals(SExpr* other) {
    return (other->isConstantSExpr() && other->constant() == constant()) ||
           (other->isMapSExpr() && other->myMapOop() == myMapOop());
  }

  const fint MergeSExpr::SplittableBit        = 2;
  const fint MergeSExpr::UnknownSetBit        = 4;
  const fint MergeSExpr::ContainingUnknownBit = 8;

  bool MergeSExpr::equals(SExpr* other) {
    Unused(other);
    return false; // for now
  }  

  SExpr* UnknownSExpr::mergeWith(SExpr* other, Node* n) {
    if (other->isNoResultSExpr()) return this;
    if (other->isUnknownSExpr()) {
      if (n && node() && other->node()) {
        // preserve splitting info
        SExpr* e = copyMergeWith(other, preg(), n);
        return e;
      } else {
        _node = NULL;   // prevent future splitting
        return this;
      }
    } else {
      PReg* r = _preg == other->preg() ? _preg : NULL;
      return copyMergeWith(other, r, n);
    }
  }

  SExpr* NoResultSExpr::mergeWith(SExpr* other, Node* n) {
    Unused(n);
    return other; }

  SExpr* MapSExpr::mergeWith(SExpr* other, Node* n) {
    if (other->isNoResultSExpr()) return this;
    if ((other->isMapSExpr() || other->isConstantSExpr())
        && other->myMapOop() == myMapOop()) {
      // generalize map + constant in same clone family --> map
      _node = NULL;     // prevent future splitting
      return this;
    } else {
      PReg* r = _preg == other->preg() ? _preg : NULL;
      return copyMergeWith(other, r, n);
    }
  }

  SExpr* ClonedBlockSExpr::mergeWith(SExpr* other, Node* n) {
    if (other->isNoResultSExpr()) return this;
    if (equals(other)) {
      if (n && node() && other->node()) {
        // preserve splitting info
        SExpr* e = copyMergeWith(other, preg(), n);
        return e;
      } else {
        _node = NULL;   // prevent future splitting
        return this;
      }
    } else {
      PReg* r = _preg == other->preg() ? _preg : NULL;
      return copyMergeWith(other, r, n);
    }
  }

  SExpr* ConstantSExpr::mergeWith(SExpr* other, Node* n) {
    // NB: be careful not to mapify true & false consts
    if (other->isNoResultSExpr()) return this;
    if (other->isConstantSExpr()
        && other->constant() == constant()) {
      if (n && node() && other->node()) {
        // preserve splitting info
        SExpr* e = copyMergeWith(other, preg(), n);
        return e;
      } else {
        _node = NULL;   // prevent future splitting
        return this;
      }
    } else if (other->isMapSExpr()) {
      return other->mergeWith(this, n);
    } else {
      PReg* r = _preg == other->preg() ? _preg : NULL;
      return copyMergeWith(other, r, n);
    }
  }

  SExpr* MergeSExpr::mergeWith(SExpr* other, Node* n) {
    if (other->isNoResultSExpr()) return this;
    setUnknownSet(false);
    if (n == NULL) setSplittable(false);
    _node = n;
    if (other->isMergeSExpr()) {
      MergeSExpr* o = other->asMergeSExpr();
      if (o->isSplittable() && !isSplittable()) return o->mergeWith(this, n);
      for (fint i = 0; i < o->exprs->length(); i++) {
        // must be careful when adding splittable exprs (e->next != NULL)
        // to avoid creating loops in the ->next chain
        SExpr* e = o->exprs->nth(i);
        SExpr* nexte;
        for ( ; e; e = nexte) {
          nexte = e->next;
          e->next = NULL;
          add(e);
        }
      }
    } else {
      add(other);
    }
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        fint len = exprs->length();
        for (fint i = 0; i < len; i++) {
          SExpr* e = exprs->nth(i);
          for (fint j = i + 1; j < len; j++) {
            SExpr* e2 = exprs->nth(j);
            assert(! e->equals(e2), "duplicate expr");
            assert(! (e->hasMap() && e2->hasMap() && e->myMapOop() == e2->myMapOop()),
                     "duplicate maps");
          }
        }
      }
#   endif
    assert(!isSplittable() || _node, "splittable mergeExpr must have a node");
    return this;
  }

  void MergeSExpr::add(SExpr* e) {
    assert(e->next == NULL, "shouldn't be set");
    setUnknownSet(false);
    if (exprs->isFull()) return;
    if (!e->node()) setSplittable(false);
    for (fint i = 0; i < exprs->length(); i++) {
      SExpr* e1 = exprs->nth(i);
      if ((e->hasMap() && e1->hasMap() && e->myMapOop() == e1->myMapOop()) ||
          e->equals(e1)) {
        // an equivalent expression is already in our list
        // if unsplittable we don't need to do anything except
        // if e is a map and the expr we already have is a constant
        // (otherwise: might later make unknown unlikely and rely on
        // constant value)
        if (!isSplittable() && !e1->isConstantSExpr()) return;
        
        // even though the map is already in our list, we care about
        // the new entry because we might have to copy the nodes between
        // it and the split send
        // Therefore, we keep lists of equivalent SExprs (linked via the
        // "next" field).
#       if GENERATE_DEBUGGING_AIDS
          if (CheckAssertions) {
            for (SExpr* e2 = exprs->nth(i); e2; e2 = e2->next)
              assert(!e->node() || e2->node() != e->node(),
                       "node alrady in list");
          }
#       endif
        // generalize different constants to maps
        if (e->isConstantSExpr() && e1->isConstantSExpr() &&
            e->constant() == e1->constant()) {
          // leave them as constants
        } else {
          if (e->isConstantSExpr()) {
            e = e->mapify(e->preg(), e->node());
          }
          if (e1->isConstantSExpr()) {
            // mapify e1 and replace it in receiver
            SExpr* ee = e1->mapify(e1->preg(), e1->node());
            ee->next = e1->next;
            exprs->nthPut(i, ee);
          }
        }
        if (!isSplittable()) return;
        // append e at end of e1's next chain
        for (e1 = exprs->nth(i); e1->next; e1 = e1->next) ;
        e1->next = e;
        return;
      }
    }
    if (exprs->length() == MaxPICSize) {
      // our capacity overflows, so make sure we've got at least one Unknown
      // type in our set
      if (findUnknown() == NULL)
        exprs->append(new UnknownSExpr(e->preg(), NULL));
    } else {
      exprs->append(e);
    }
  }


  void MergeSExpr::resetTo(Node* n, SExprBList* e) {
    // called for multiple splitting; does the unorthodox
    // (after all exprs should be immutable)
    // step of resetting my node and exprs to account for a split
    // that has just been done.
    // keep the same preg because it was good before the split and
    // the split should not remove assignments to it.

   if (exprs->length() == 0)
     fatal("merge must have one old expr");
   PReg* pr = exprs->nth(0)->preg();

#  if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
     for (fint i = 0;  i < exprs->length();  ++i)
       assert(pr == exprs->nth(i)->preg(), "incoming exprs must have same preg");
    }
#  endif
     
   setNode(n, pr);
    initialize(); // empty out exprs
    for (fint i = 0;  i < e->length();  ++i)
      add( e->nth(i) );
  }


  bool MergeSExpr::really_hasMap(SSelfScope* s) {
    // Check if receiver really has only one map.  Specifically, if we're
    // at the place that made the receiver's unknown part unlikely, the
    // receiver should *not* be considered a MapSExpr because the unknown
    // part hasn't been tested yet.
    return hasMap() && !(s == unlikelyScope && s->bci() <= unlikelyBCI);
  }

  bool MergeSExpr::hasMap() {
    // treat a merge expr like a single map if it contains only one map and
    // possibly an unlikely unknown
    if (exprs->length() > 2) return false;
    SExpr* e1 = exprs->nth(0);
    bool haveMap1 = e1->hasMap();
    if (exprs->length() == 1) return haveMap1;  // only one expr
    UnknownSExpr* u1 = e1->findUnknown();
    if (u1 && !u1->isUnlikely()) return false;  // 1st = likely unknown
    SExpr* e2 = exprs->nth(1);
    bool haveMap2 = e2->hasMap();
    UnknownSExpr* u2 = e2->findUnknown();
    if (u2 && !u2->isUnlikely()) return false;  // 2nd = likely unknown
    if (haveMap1 && haveMap2) return false;     // 2 maps
    // success!  one expr may have map, one is unlikely unknown
    return haveMap1 || haveMap2;
  }

  mapOop MergeSExpr::myMapOop() {
    assert(hasMap(), "don't have a map");
    SExpr* e = exprs->nth(0);
    if (e->hasMap()) return e->myMapOop();
    return exprs->nth(1)->myMapOop();
  }

  SExpr* MergeSExpr::asReceiver() {
    return new MapSExpr(myMapOop(), _preg, _node);
  }

  bool MergeSExpr::hasConstant() {
    // see hasMap()...also, must be careful about different constants with
    // same map (i.e. expr->next is set)
    return false;
  }

  oop MergeSExpr::constant() {
    ShouldNotCallThis();
    return 0;
  }

  SExpr* ConstantSExpr::mapify(PReg* p, Node* n) {
    return new MapSExpr(_c->map()->enclosing_mapOop(), p, n);
  }

  MapSExpr* ConstantSExpr::asMapSExpr() {
    return new MapSExpr(_c->map()->enclosing_mapOop(), _preg, _node);
  }

  SExpr* MergeSExpr::mapify(PReg* p, Node* n) {
    MergeSExpr* e = new MergeSExpr(p, n);
    for (fint i = 0; i < exprs->length(); i++) {
      SExpr* expr = exprs->nth(i)->mapify(p, n);
      e->add(expr);
    }
    // result is non-splittable because nodes aren't correct and expr->next
    // is ignored for the components of the receiver
    setSplittable(false);
    return e;
  }
  
  bool MergeSExpr::containsUnknown() {
    if (isUnknownSet()) {
      UnknownSExpr* u;
      assert((u = findUnknown()) == NULL && !isContainingUnknown() ||
             u != NULL && isContainingUnknown(), "isContainingUnknown wrong");
      return isContainingUnknown();
    }
    setUnknownSet(true);
    for (fint i = 0; i < exprs->length(); i++) {
      if (exprs->nth(i)->isUnknownSExpr()) {
        setContainingUnknown(true);
        return true;
      }
    }
    setContainingUnknown(false);
    return false;
  }
  
  UnknownSExpr* MergeSExpr::findUnknown() {
    for (fint i = 0; i < exprs->length(); i++) {
      if (exprs->nth(i)->isUnknownSExpr()) return (UnknownSExpr*)exprs->nth(i);
    }
    return NULL;
  }

  SExpr* MergeSExpr::findMap(mapOop map) {
    for (fint i = 0; i < exprs->length(); i++) {
      SExpr* e = exprs->nth(i);
      if (e->hasMap() && e->myMapOop() == map) return e;
    }
    return NULL;
  }

  SExpr* UnknownSExpr::makeUnknownUnlikely(SSelfScope* s)    {
    Unused(s);
    assert(SICDeferUncommonBranches, "shouldn't make unlikely");
    // called on an UnknownSExpr itself, this is a no-op; works only
    // with merge exprs
    return this;
  }

  SExpr* MergeSExpr::makeUnknownUnlikely(SSelfScope* s) {
    assert(SICDeferUncommonBranches, "shouldn't make unlikely");
    unlikelyScope = s; unlikelyBCI = s->bci();
    for (fint i = 0; i < exprs->length(); i++) {
      SExpr* e;
      if ((e = exprs->nth(i))->isUnknownSExpr()) {
        if (!((UnknownSExpr*)e)->isUnlikely()) {
          // must make a copy to avoid side-effecting e.g. incoming arg
          UnknownSExpr* u = (UnknownSExpr*)e;
          UnknownSExpr* new_u = new UnknownSExpr(u->preg(), u->node(), true);
          exprs->nthPut(i, new_u);
          for (u = (UnknownSExpr*)u->next; u;
               u = (UnknownSExpr*)u->next, new_u = (UnknownSExpr*)new_u->next){
            new_u->next = new UnknownSExpr(u->preg(), u->node(), true);
          }
        }
        return this;
      }
    }
    ShouldNotReachHere(); // contains no unknown expression
    return NULL;
  }

  SExpr* ConstantSExpr::findMap(mapOop m) { return myMapOop() == m ? this : NULL; }
  
  SExpr* UnknownSExpr::shallowCopy(PReg* p, Node* n) {
    return new UnknownSExpr(p, n);
  }

  SExpr* NoResultSExpr::shallowCopy(PReg* p, Node* n) {
    Unused(p); Unused(n);
    return new NoResultSExpr();
  }

  SExpr* MapSExpr::shallowCopy(PReg* p, Node* n) {
    return new MapSExpr(myMapOop(), p, n);
  }

  SExpr* ClonedBlockSExpr::shallowCopy(PReg* p, Node* n) {
    return new ClonedBlockSExpr(myMapOop(), p, n, _blockScope);
  }

  SExpr* ConstantSExpr::shallowCopy(PReg* p, Node* n) {
    return new ConstantSExpr(_c, p, n);
  }

  SExpr* MergeSExpr::shallowCopy(PReg* p, Node* n) {
    MergeSExpr* e = new MergeSExpr(p, n);
    e->exprs = exprs;
    e->setSplittable(isSplittable());
    return e;
  }

  SSelfScope* SExpr::scope() { return _preg->scope; }

  NameNode* SExpr::nameNode(bool mustBeLegal) {
    return preg()->nameNode(mustBeLegal); }
  
  NameNode* ConstantSExpr::nameNode(bool mustBeLegal) {
    Unused(mustBeLegal);
    return newValueName(constant()); }

  void SExpr::print_expr(const char* type) {
    lprintf(" (Node %#lx)", (unsigned long)node());
    if (next) lprintf(" (next %#lx)", (unsigned long)next);
    lprintf("    p *(%s*)%#lx\n", type, (unsigned long)this);
  }
  
  void UnknownSExpr::print() {
    lprintf("UnknownSExpr %s", isUnlikely() ? "unlikely" : "");
    SExpr::print_expr("UnknownSExpr");
  }

  void NoResultSExpr::print() { SExpr::print_expr("NoResultSExpr"); }

  void ConstantSExpr::print() {
    lprintf("ConstantSExpr "); constant()->print_oop(); SExpr::print_expr("ConstantSExpr");
  }

  void MapSExpr::print() {
    lprintf("MapSExpr "); myMapOop()->print_oop(); SExpr::print_expr("MapSExpr"); 
  }

  void ClonedBlockSExpr::print() {
    lprintf("ClonedBlockSExpr "); myMapOop()->print_oop(); SExpr::print_expr("ClonedBlockSExpr"); 
  }

  void MergeSExpr::print() {
    lprintf("MergeSExpr %s(", isSplittable() ? "splittable " : "");
    for (fint i = 0; i < exprs->length(); i++) {
      lprintf("%#lx%s ", (unsigned long)(exprs->nth(i)),
             exprs->nth(i)->next ? "*" : "");
    }
    lprintf(")");
    SExpr::print_expr("MergeSExpr");
  }

  void SExprStack::push(SExpr* e) {
    // set r's startBCI if it is an expr stack entry and not already set
    PReg* r = e->preg();
    if (r->isSAPReg()) {
      SAPReg* sr = (SAPReg*)r;
      if (sr->scope == scope) {
        if (sr->startBCI == IllegalBCI)
          sr->startBCI = sr->creationStartBCI = scope->bci();
      }
    }
    SExprBList::push(e);
  }

  SExpr* SExprStack::pop() {
    SExpr* e = SExprBList::pop();
    PReg* r = e->preg();
    if (r->isSAPReg()) {
      SAPReg* sr = (SAPReg*)r;
      if (sr->scope == scope) {
        // endBCI may be assigned several times, e.g. in "x foo: 1" where
        // foo is an assignment slot
        fint newBCI =
          scope->bci() == EpilogueBCI ? scope->ncodes - 1 : scope->bci();
        if (bciLT(sr->endBCI, newBCI)) sr->endBCI = newBCI;
      } else {
        assert(sr->scope->isSenderOf(scope), "preg scope too low");
      }
    }
    return e;
  }
  
  
  BranchBCTargetStack* new_BranchBCTargetStack(
              SCodeScope* s,
              bool  isTargetOfBackwardsBranch,
              int32 len,
              int32 targetBCI ) {
    if ( len == 0 ) {
      // empty: no problem
    } 
    else if ( s->bci() >= s->ncodes ) {
      // branch to return: no problem
    }
    else if ( s->method_map->start_codes()[s->bci()]
                 == BuildCode( NO_OPERAND_CODE, NONLOCAL_RETURN_CODE) ) {
      // branch to non-local return: no problem
    } 
    else {
      warning1("SIC found non-empty expression stack at branch target"
               "in method %s; "
               "The debug information will be incorrect.--dmu 9/96",
               stringOop(s->selector())->copy_null_terminated());
    }
    return  ( isTargetOfBackwardsBranch
             ?  (BranchBCTargetStack*) new BBranchBCTargetStack( len)
             :  (BranchBCTargetStack*) new FBranchBCTargetStack( len)
             )->initialize(len, s, targetBCI);
  }


  BranchBCTargetStack::BranchBCTargetStack(int32 len)
    : SExprBList(len) {}
    
    
  BranchBCTargetStack* BranchBCTargetStack::initialize(
                         int32 len,
                         SCodeScope* s,
                         int32 targetBCI) {
    // no virts in constructor, argh!
    assert(length() == 0, "should be empty");
    for ( int32 i = 0;  i < len;  ++i)
      append( new_expr(s, targetBCI) );
    return this;
  }


  void BranchBCTargetStack::mergeInExprsFromStack( 
              SExprStack* stk,
              Node*       mergeNode,
              bool        isBackwards ) {
    // bring values from exprStack into me
    assert(stk->length() == length(), "lengths must match");
    for (int32 i = 0;  i < length();  ++i)
      nthPut( i,  mergeInExpr( nth(i), stk->nth(i), mergeNode, isBackwards ) );
  }
  

  SExpr* FBranchBCTargetStack::mergeInExpr( 
             SExpr*  myExpr, 
             SExpr*  stkExpr,
             Node*   mergeNode,
             bool    ) {
    theNodeGen->move(stkExpr->preg(), myExpr->preg());
    return myExpr->copyMergeWith( stkExpr, myExpr->preg(), mergeNode);
  }

  
  // recall that splitting cannot handle backwards branches
  
  SExpr* BBranchBCTargetStack::mergeInExpr( 
             SExpr*  myExpr, 
             SExpr*  stkExpr,
             Node*   ,
             bool    forBackwardsBranch ) {
    theNodeGen->move(stkExpr->preg(), myExpr->preg());
    return forBackwardsBranch
      ?  myExpr // too late to change myExpr, but already put in UnknownSExpr
      :  myExpr->copyMergeWith(stkExpr,
                               myExpr->preg(),
                               NULL); // NULL so is not splittable
  }

  
  SExpr* FBranchBCTargetStack::new_expr(SCodeScope* s, int32 targetBCI) {
    // I changed lifetime of new SAPReg from default (s->bci())
    // to targetBCI.  
    // Actually targetBCI - 1 because lifetime is ]startBCI, endBCI].
    // This fixed a bug: for indexed bytecodes
    // the default lifetimes makes the SIC think register is
    // live (allocated) at the indexed-branch bytecode.
    // But it is not assigned-to unless the branch for that case
    // is taken. The result is that the SIC thinks the register is live
    // when it has not been assigned to. It is marked live in the
    // register mask of an inline-cache, and it scavenged, even though
    // it has garbage in it. Changing the lifetime fixes it. 
    // -- dmu 11/17/96
    return new MergeSExpr(
                 new SAPReg(s, targetBCI - 1 ), 
                 // SExpr for type of res of this bc
                 s->branchTargets[s->bci()] );
  }
  
  
  SExpr* BBranchBCTargetStack::new_expr(SCodeScope* s, int32 targetBCI) {
    // Here put in UnknownSExpr, cause will not know
    // types of values coming in backwards in time for
    // node generation.
    // Later, in mergeInExpr, will make
    // a merge expr with NULL node to turn off splitting.
    // Urs says splitting is unprepared to deal with the topologies
    // of a backwards branch (a branch below the center of the Y). -- dmu
    
    // Even though this is a backwards branch STACK,
    // it could be a stack for a branch target that is reached
    // both by a forwards indexed branch and a backwards whatever
    // branch. So do the same lifetime setting as above. -- dmu
    return new UnknownSExpr(new SAPReg(s, targetBCI - 1));
  }
  
  
  void BranchBCTargetStack::moveExprsToStack( SExprStack* stk ) {
    // move my exprs to the stk
    for (fint i = 0;  i < length();  ++i)
      stk->pop();
    for (fint j = 0;  j < length();  ++j)
      stk->push(nth(j));
  }
  
# endif
