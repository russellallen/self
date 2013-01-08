/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER
  
# pragma implementation "preg.hh"
# include "_preg.cpp.incl"
  
  int32 PReg::currentNo = 0;
  int32 BlockPReg::numBlocks = 0;
  static ConstPRegBList* constants = 0;
  static PReg* dummyPR;
  const fint PReg::AvgBBIndexLen = 10;
  const fint PReg::VeryNegative = -99999999;
  
  // weights indexed by loop depth
  static fint udWeight[] = { 1, 8, 8*8, 8*8*8, 8*8*8*8 };
  const  fint udWeightLen = sizeof(udWeight) / sizeof(fint) - 1;
  
  void initPRegs() {
    PReg::currentNo = 0; BlockPReg::numBlocks = 0;
    constants = new ConstPRegBList(50);
    dummyPR = new PReg(NULL);
  }

  SAPReg::SAPReg(SCodeScope* s, fint st, fint en) : PReg(s) {
    creationStartBCI = startBCI = st == IllegalBCI ? s->bci() : st;
    endBCI                      = en == IllegalBCI ? s->bci() : en;
    creationScope = s;
  }

  bool PReg::isLocalTo(BB* bb) {
    // is this a preg local to bb? (i.e. can it be allocated to temp regs?)
    // treat ConstPRegs as non-local so they don't get allocated prematurely
    // (possible performance bug)
    // (Note: uplevelW -> uplevelR, so this tests either uplevel -- dmu 12/02)
    return
      loc == UnAllocated && !uplevelR && !debug && !incorrectDU() &&
        !isConstPReg() && dus.length() == 1 && dus.first()->bb == bb;
  }


  PDef* PReg::getDefinitionForGlobalCopyPropagation() {
    fint dulength = dus.length();
    fint e;
    DUInfo* info;
    for (e = 0; ; ++e) {
      if (e >= dulength)
        fatal("getDefinitionForGlobalCopyProagation could not find one");
      info = dus.nth(e)->defUseInfo();
      if (info->defs.length())
        break;
    }
    
    assert(info->defs.length() == 1, "should be one definition only");
    PDef* def = info->defs.first();

#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        for ( ++e; e < dulength; ++e) {
          if (dus.nth(e)->defUseInfo()->defs.length())
              fatal("already have def!?!");
        }
      }
#   endif

    assert(def, "should have found the definition");
    return def;
  }


  void PReg::attemptGlobalCopyPropagate() {

    // do global copy propagation of this PReg
    //  only really do it if singly-assigned PRegs

    if ( isConstPReg() || !canCopyPropagate()) 
      return;

    PDef* def = getDefinitionForGlobalCopyPropagation();
      
    if (!def->canCopyPropagate(this))
      return;

    // ok, everything is fine - propagate the def to the uses

    fint dulength = dus.length();
    fint e;
    for (e = 0; e < dulength; e++) {
      PRegBBIndex* index = dus.nth(e);
      DUInfo* info = index->defUseInfo();
      // caution: propagateTo may eliminate nodes and thus shorten
      // info->uses
      fint j = 0;
      BB* bb = index->bb;
      while (j < info->uses.length()) {
        fint oldLen = info->uses.length();
        info->propagateTo(bb, info->reg, def, info->uses.nth(j), true);
        if (info->uses.length() == oldLen) {
          // propagate didn't eliminate this use; try next one
          j++;
        }
      }
    }
  }


  // check basic conditions for global CP
  bool PReg::canCopyPropagate() {
    if (nuses() == 0 || ndefs() != 1) return false;
    // don't propagate if register has incorrect def info or does not
    // survive calls (i.e. is local to BB)
    if (incorrectD() || isTrashedReg(loc)) return false;

    // don't propagate uplevel-assigned (defs aren't correct)
    if (uplevelW) return false;
      
    return true;        // looks good
  }
  
  void PReg::makeSameRegClass(PReg* other, RegisterEqClassBList* classes) {
    if (regClass && !other->regClass) {
      classes->nth(regClass)->append(other);
    } else if (!regClass && other->regClass) {
      classes->nth(other->regClass)->append(this);
    } else if (!regClass && !other->regClass) {
      // non has a regClass - create new one
      regClass = classes->length();
      RegisterEqClass* newClass = new RegisterEqClass(this);
      classes->append(newClass);
      newClass->append(other);
    } else {
      // both already have regClasses - combine the two classes
      classes->nth(regClass)->append(other);
      classes->nthPut(other->regClass, NULL);
    }
  }
  
  ConstPReg* ConstPReg::new_ConstPReg(SSelfScope* s, oop c) {
    for (fint i = 0; i < constants->length(); i++) {
      ConstPReg* r = constants->nth(i);
      if (r->constant == c) {
        r->extendLiveRangeForScope(s);
        return r;
      }
    }
    // constant not found, create new ConstPReg*
    ConstPReg* r = new ConstPReg(s, c);
    constants->append(r);
    r->_ndefs = 1;      // fake def
    return r;
  }
  
# ifdef UNUSED
  ConstPReg* PReg::bfindConstPReg(Node* n, oop c) {
    // return const preg for oop or NULL if none exists
    for (fint i = 0; i < constants->length(); i++) {
      ConstPReg* r = constants->nth(i);
      if (r->constant == c) {
        return r->covers(n) ? r : NULL;
      }
    }
    return NULL;                    // constant not found
  }
# endif
  
  bool ConstPReg::needsRegister() {
    // register only pays off if we're used more than once and aren't a
    // small immediate constant
# if TARGET_ARCH == SPARC_ARCH
    return SICCSEConstants && weight > 1 && 
      (int32(constant) > maxImmediate || int32(constant) < -maxImmediate);
# elif TARGET_ARCH == I386_ARCH
    return false; // regs tight, use immediates
# endif
  }

  void ConstPReg::allocateTo(Location reg) {
    assert(isRegister(reg), "should be a register");
    loc = reg;
    assert(scope->isCodeScope(), "expected non-access scope");
    ((SCodeScope*)scope)->allocateConst(this);
  }

  inline fint computeWeight(SSelfScope* s) {
    const fint scale = 16;      // normal use counts scale, uncommon use is 1
    if (s && s->isCodeScope() && ((SCodeScope*)s)->primFailure) {
      return 1 * udWeight[min(udWeightLen, s->loopDepth)];
    } else {
      return scale * udWeight[min(udWeightLen, s ? s->loopDepth : 0)];
    }
  }
  
  void PReg::incUses(PUse* use) {
    _nuses++;
    if (use->isSoft()) _nsoftUses++;
    SSelfScope* s = use->node->scope();
    weight += computeWeight(s);
    assert(weight >= _nuses + _ndefs || isConstPReg(), "weight too small");
  }     
  void PReg::decUses(PUse* use) {
    _nuses--;
    if (use->isSoft()) _nsoftUses--;
    SSelfScope* s = use->node->scope();
    weight -= computeWeight(s);
    assert(weight >= _nuses + _ndefs || isConstPReg(), "weight too small");
  }
  
  void PReg::incDefs(PDef* def) {
    _ndefs++;
    SSelfScope* s = def->node->scope();
    weight += computeWeight(s);
    assert(weight >= _nuses + _ndefs || isConstPReg(), "weight too small");
  }

# ifdef UNUSED
  void PReg::decDefs(PDef* def) {
    _ndefs--;
    SSelfScope* s = def->node->scope();
    weight -= computeWeight(s);
    assert(weight >= _nuses + _ndefs || isConstPReg(), "weight too small");
  }
# endif
  
  void PReg::removeUse(DUInfo* info, PUse* use) {
    assert(info->reg == this, "wrong reg");
    info->uses.remove(use);
    decUses(use);
  }
  
  void PReg::removeUse(BB* bb, PUse* use) {
    if (use == NULL) return;
    for (fint i = 0; i < dus.length(); i++) {
      PRegBBIndex* index = dus.nth(i);
      if (index->bb == bb) {
        DUInfo* info = bb->defUseInfo(index);
        removeUse(info, use);
        return;
      }
    }
    ShouldNotReachHere(); // info not found
  }
  
  void PReg::removeDef(DUInfo* info, PDef* def) {
    assert(info->reg == this, "wrong reg");
    info->defs.remove(def);
    _ndefs--;
    SSelfScope* s = def->node->scope();
    weight -= computeWeight(s);
    assert(weight >= _nuses + _ndefs, "weight too small");
  }
  
  void PReg::removeDef(BB* bb, PDef* def) {
    if (def == NULL) return;
    for (fint i = 0; i < dus.length(); i++) {
      PRegBBIndex* index = dus.nth(i);
      if (index->bb == bb) {
        DUInfo* info = bb->defUseInfo(index);
        removeDef(info, def);
        return;
      }
    }
    ShouldNotReachHere(); // info not found
  }
  
  void PReg::addDUHelper(Node* n, PDefUseList* l, PDefUse* el) {
    int32 myNum = n->num();
    PDefUseListElem* prev = NULL;
    for (PDefUseListElem* e = l->head();
         e && e->data()->node->num() < myNum;
         prev = e, e = e->next()) ;
    l->insertAfter(prev, el);
  }
  
  PUse* PReg::addUse(DUInfo* info, Node* n) {
    assert(info->reg == this, "wrong reg");
    PUse* u = new PUse(n);
    addDUHelper(n, (PDefUseList*)&info->uses, u);
    incUses(u);
    return u;
  }
  
  PUse* PReg::addUse(BB* bb, Node* n) {
    for (fint i = 0; i < dus.length(); i++) {
      PRegBBIndex* index = dus.nth(i);
      if (index->bb == bb) {
        DUInfo* info = bb->defUseInfo(index);
        return addUse(info, n);
      }
    }
    return bb->addUse(n, this);
  }
  
  PDef* PReg::addDef(DUInfo* info, Node* n) {
    assert(info->reg == this, "wrong reg");
    PDef* d = new PDef(n);
    addDUHelper(n, (PDefUseList*)&info->defs, d);
    incDefs(d);
    return d;
  }
  
  PDef* PReg::addDef(BB* bb, Node* n) {
    for (fint i = 0; i < dus.length(); i++) {
      PRegBBIndex* index = dus.nth(i);
      if (index->bb == bb) {
        DUInfo* info = bb->defUseInfo(index);
        return addDef(info, n);
      }
    }
    return bb->addDef(n, this);
  }

  bool SAPReg::extendLiveRange(Node* n) {
    // the receiver is being copy-propagated to n; try to extend its live range
    assert(startBCI != IllegalBCI && creationStartBCI != IllegalBCI &&
           endBCI != IllegalBCI, "live range not set");
    bool ok = true;
    if (n->scope() == scope) {
      fint bci = n->bci();
      assert(bciGE(bci, startBCI), "can't propagate backwards");
      if (bciGT(bci, endBCI)) endBCI = bci;
    } else if (n->scope()->isSenderOf(scope)) {
      // propagating upwards - promote receiver to higher scope
      SSelfScope *s, *nscope = n->scope();
      for (s = scope; s->sender() != nscope; s = s->sender());
      scope = nscope;
      startBCI = s->senderBCI();
      endBCI = n->bci();
    } else if (scope->isSenderOf(n->scope())) {
      // scope is caller; check if already covered
      SSelfScope *s;
      for (s = n->scope(); s->sender() != scope; s = s->sender()) ;
      fint bci = s->senderBCI();
      assert(bciGE(bci, startBCI), "can't propagate backwards");
      if (bciGT(bci, endBCI)) endBCI = bci;
    } else {
      // can't propagate between siblings yet
      ok = false;
    }
    assert(bciLE(startBCI, endBCI) && startBCI != IllegalBCI &&
           bciLT(endBCI, nscope()->ncodes), "invalid start/endBCI");
    return ok;
  }

  bool SplitPReg::extendLiveRange(Node* n) {
    // currently can't extend split regs live range without screwing up
    // register allocation
    assert(startBCI != IllegalBCI && creationStartBCI != IllegalBCI &&
           endBCI != IllegalBCI, "live range not set");
    if (n->scope() == scope) {
      fint bci = n->bci();
      assert(bciGE(bci, startBCI), "can't propagate backwards");
      if (bciLE(bci, endBCI)) return true;      // already covered
    } else if (scope->isSenderOf(n->scope())) {
      // scope is caller; check if already covered
      SSelfScope *s;
      for (s = n->scope(); s->sender() != scope; s = s->sender()) ;
      fint bci = s->senderBCI();
      assert(bciGE(bci, startBCI), "can't propagate backwards");
      if (bciLE(bci, endBCI)) return true;      // already covered
    } 
    return false;
  }

  void ConstPReg::extendLiveRangeForScope(SSelfScope* s) {
    // make sure the constant reg is in a high enough scope
    if (scope->isSenderOrSame(s)) {
      // scope is caller of s
    } else if (s->isSenderOf(scope)) {
      // s is caller of scope, so promote receiver to s
      scope = s;
    } else {
      // scope and s are siblings of some sort - go up to common sender
      do { s = s->sender(); } while (!s->isSenderOf(scope));
      scope = s;
    }
  }

# ifdef UNUSED
  bool ConstPReg::covers(Node* n) {
    // does receiver cover node n (is it live at n)?
    SSelfScope* s = n->scope();
    if (scope->isSenderOrSame(s)) {
      // ok, scope is caller of s
      return true;
    } 
    return false;
  }
# endif

  bool ConstPReg::extendLiveRange(Node* n) {
    extendLiveRangeForScope(n->scope());
    return true;
  }
  
  bool PReg::checkEquivalentDefs() {
    // check if all defs are equivalent, i.e. assign the same preg
    if (ndefs() == 1) return true;
    PReg* rhs = NULL;
    for (fint i = 0; i < dus.length(); i++) {
      DUInfo* info = dus.nth(i)->defUseInfo();
      for (PDefListElem* e = info->defs.head(); e; e = e->next()) {
        Node* n = e->data()->node;
        if (!n->isAssignmentLike()) return false;
        if (rhs) {
          if (rhs != n->src()) return false;
        } else {
          rhs = n->src();
        }
      }
    }
    // yup, rhs is the only preg ever assigned to me
    return true;
  }

  bool PReg::canEliminateAndStillDebug() {
    // can this PReg be eliminated without compromising the debugging info?
    //  (used to take withUses arg, but am always planning to elim uses, too)

    if (isUnused()) return if_why(false, "nothing to eliminate");
    
    // check if reg can be eliminated
    if ( incorrectU() ) 
      return if_why(false, "don't elim if uses are incorrect (hardwired pregs");
      
    if ( uplevelW  ) 
      return if_why(false, "uses also incorrect for uplevel-written vars");
    
    assert(!_nsoftUses || debug, "nsoftUses should imply debug");

    if (isBlockPReg()) { 
      assert( hardUses() == 0, "only called when no hard uses of me");
      return if_why(true, 
        "blocks can always be eliminated - can describe with BlockValueDesc");
    }
    
    if (!debug)
      return if_why(true, "not needed for debugging");
      
    return canRuntimeValueBeReconstructed();
  }
  
  
  bool PReg::if_why(bool b, const char* why) {
    if (PrintSICEliminateUnneededNodes)
      lprintf("*%s eliminate %s: %s\n", 
              b ? "ok to" : "uncool to", why, name());
    return b;
  }
  

  // debug-visible: eliminate only if run-time value
  // can be reconstructed
  
  bool PReg::canRuntimeValueBeReconstructed() {
      
    if ( _ndefs > 1
    &&   !isBlockPReg()            // we know all defs of a block are equivalent
    &&   !checkEquivalentDefs())   // ok if all defs are the same
      return if_why(false, ">1 def && debug-visible");
    
    DUInfo* info = dus.first()->defUseInfo();
    PDefListElem* e = info->defs.head();
    if (!e)
      return if_why(false, 
        "info not in first elem - would have to search");

    Node* defNode = e->data()->node;
    if (defNode->hasConstantSrc())
      return if_why(true, "constant assignment - easy to handle");
    
    // can substitute defSrc if its lifetime encompasses ours and if
    // it is singly-assigned and not a temp reg (last cond. is necessary to
    // prevent e.g. result of a send (in o0) to be used as the receiver of
    // subsequent scopes that have nsends > 0; fix this if it becomes a
    // performance problem)
      
    if ( !defNode->hasSrc() )
      return if_why(false, "can't recover debug info, no defSrc");

    PReg* defSrc = defNode->src();
    if (!defSrc->isSAPReg())
      return if_why(false, "can't recover debug info, def not SAPReg");

    if (isTempReg(defSrc->loc)) 
      return if_why(false, "can't recover debug info, def isTempReg");
    
    if ( defSrc->scope->isSenderOf(scope) )
      return if_why(true, 
        "definition scope is sender of my eliminatee's scope");
        
    if ( defSrc->scope != scope )
      return if_why(false, "def scope not my scope");
    
    if (!isSAPReg())
      return if_why(false, "not SAPReg");
      
    if (bciGE(((SAPReg*)defSrc)->endBCI, ((SAPReg*)this)->endBCI))
      return if_why(true, "def in same scope, SAPReg, lifetime encompasses");
    
    return if_why(false, "def ends too soon");
  }
  

  bool BlockPReg::canEliminateAndStillDebug() {
    if (!PReg::canEliminateAndStillDebug()) return false;
    if (!escapes) return true;
    if (uplevelR) return false;  // uplevelW -> uplevelW -- dmu 12/02
    
    // escaping, unused block; since it has no real uses, the only time
    // it might be created (might escape) is when a nested block is created
    oop value = block->value();
    if (!value->has_code()) {   // empty block
      escapes = false; 
      isEliminated = true;
      return true; 
    }
    oop* literals = value->literals()->objs();
    for (fint i = value->literals()->length() - 1; i >= 0; i--) {
      if (literals[i]->is_block()) {
        // can't eliminate, but at least memoize it
        // fix this - should find nested BlockPR and check if it escapes
        if (PrintSICEliminateUnneededNodes) 
          lprintf("*not eliminating block %s (has nested blocks)\n", name());
        memoize();
        return false;
      }
    }
    // ok - all exposing nodes were optimized away, the block doesn't really
    // escape
    escapes = false;
    isEliminated = true;
    return true;
  }
  
    
  // eliminate all nodes defining me
  // if removing is true, then we are removing unreachable code,
  //   else removing reg cause it is never used
  
  void PReg::eliminatePR( bool removingUnreachableCode) {
    assert( hardUses() == 0, "only called when no hard uses of me");
    if ( !canEliminateAndStillDebug()) return;
    for (fint i = 0; i < dus.length(); i++) {
      PRegBBIndex* index = dus.nth(i);
      DUInfo* info = index->defUseInfo();
      BB*       bb = index->bb;
      PDefListElem* e = info->defs.head();
      while (e) {
#       if GENERATE_DEBUGGING_AIDS
          fint oldlen;
          if (CheckAssertions) {
            oldlen = info->defs.length();
          }
#       endif
        Node* n = e->data()->node;
        if (!removingUnreachableCode  &&   n->hasSideEffects()) {
          // cannot eliminate this node, its effect (though not its)
          //  result is needed
          // But, its destination must be redirected to a dummy register.
          // Otherwise, the allocator will allocate a location for it,
          //  and an assertion will trip, since this PR has a cpinfo
          n->eliminateDest(bb);
          // eliminateDest is a noop for a call node, but is OK
          //   to leave this def of o0, shouldn't hurt anything
          // elminateDest is also a noop for a block zap node
          //  this should not be a problem says Urs, -- dmu 8/96
          if (PrintSICEliminateUnneededNodes) {
            char buf[1024];
            lprintf("*not eliminating node N%ld: %s\n", (void*)n->id(),
                    n->print_string(buf)); 
          }
          assert(nuses() == 0, "cannot eliminate this?");
          e = e->next();
        }
        else {
          if (cpInfo) {
            if (debug) {
              // canEliminateAndStillDebug assures that all defs are equivalent
#             if GENERATE_DEBUGGING_AIDS
                if (CheckAssertions) {
                  CPInfo* cpi = new_CPInfo(n);
                  assert(  cpi && cpi->r->cpReg() == cpReg(),
                         "can't handle this");
                }
#             endif
            } 
            else {
              // can't really handle CP w/multiple defs; make sure we don't use
              // bad information
              cpInfo->r = dummyPR;
            }
          } 
          else {
            cpInfo = new_CPInfo(n);
            assert(!debug || cpInfo || isBlockPReg(), "couldn't create info");
            if (cpInfo) {
              PReg* r = cpInfo->r;
              // if we're eliminating a debug-visible PReg, the replacement
              // must be debug-visible, too (so that it isn't allocated to
              // a temp reg)
              r->debug |= debug;
              if (r->cpRegs == NULL) r->cpRegs = new PRegBList(5);
              r->cpRegs->append(this);
            }
          }
          
          n->eliminateNodeAndUsedPRs(bb, this, removingUnreachableCode);
          assert(info->defs.length() < oldlen, "didn't remove def");
          e = info->defs.head();
          // simple, but may rescan some uneliminatable nodes
        }
      }
      eliminateUses(info, bb, removingUnreachableCode);
    }
  }
  
  void PReg::eliminateUses(DUInfo* info, BB* bb, bool removingUnreachableCode) {
    PUseListElem* ue = info->uses.head();
    while (ue) {
#     if GENERATE_DEBUGGING_AIDS
      fint oldlen;
      if (CheckAssertions) {
        oldlen = info->uses.length();
      }
#     endif
      Node* n = ue->data()->node;
      if (PrintSICEliminateUnneededNodes) {
        char buf[1024];
        lprintf("*eliminating node N%ld: %s\n", 
               (void*)n->id(),
               n->print_string(buf)); 
      }
      assert(!n->hasSideEffects(), "must be able to eliminate this");
      n->eliminateNodeAndUsedPRs(bb, this, removingUnreachableCode);
      assert(info->uses.length() < oldlen, "didn't remove use");
      ue = info->uses.head();
    }
 }

  // for efficiency, node n in isLiveAt() must be "plausible", i.e. in a
  // scope somewhere below the receiver's scope
  // otherwise, use slow_isLiveAt

  bool PReg::slow_isLiveAt(Node* n) {
    if (scope->isSenderOrSame(n->scope())) {
      return isLiveAt(n);
    } else {
      return false;
    }
  }

  bool PReg::isLiveAt(Node* n) {
    SSelfScope* s = n->scope();
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      SScope *ss;
      for (ss = s; ss != scope && ss; ss = ss->sender()) ;
      assert(ss == scope, "s is not below my scope");
    }
#   endif
    return true;
  }

  SCodeScope* PReg::findAncestor(SSelfScope* s1, fint& bci1,
                                 SSelfScope* s2, fint& bci2) {
    // find closest common ancestor of s1 and s2, and the
    // respective sender bcis in that scope
    if (s1->depth > s2->depth) {
      while (s1->depth > s2->depth) {
        bci1 = s1->senderBCI(); s1 = s1->sender();
      }
    } else {
      while (s2->depth > s1->depth) {
        bci2 = s2->senderBCI(); s2 = s2->sender();
      }
    }
    assert(s1->depth == s2->depth, "oops");
    while (s1 != s2) {
      bci1 = s1->senderBCI(); s1 = s1->sender();
      bci2 = s2->senderBCI(); s2 = s2->sender();
    }
    assert(s1->isCodeScope(), "oops");
    return (SCodeScope*)s1;
  }

  bool SplitPReg::isLiveAt(Node* n) {
    if (!SAPReg::isLiveAt(n)) return false;
    SplitSig* sig2 = n->splitSig();
    return sig->contains(sig2);
  }

  SplitPReg* SAPReg::regCovering(SCodeScope* s1, fint bci1,
                                 SCodeScope* s2, fint bci2, SplitSig* sig) {
    // return a PReg covering both s1 and s2; use s2 as the creation scope
    fint b1 = bci1, b2 = bci2;
    SCodeScope* ss = PReg::findAncestor(s1, b1, s2, b2);
    assert(b1 >= b2, "use (b1) should come after def (b2)");
    SplitPReg* r = new SplitPReg(ss, b2, b1, sig);
    r->creationScope = s2;
    r->creationStartBCI = bci2;
    return r;
  }

  bool SAPReg::isLiveAt(Node* n) {
    // first check if receiver is live in source-level terms; if that says
    // dead it really means dead
    SSelfScope* s = n->scope();
    assert(s->isCodeScope(), "oops");
    bool live = basic_isLiveAt((SCodeScope*)s, n->bci());
    if (!live || !isTempReg(loc)) return live;
    // tempReg-allocated PRegs can only be live in the BB's where they appear;
    // use this as an additional filter
    // this check helps reduce the number of "inconsistent reg contents"
    // failures in MarkerNode::dexcribe
    // (this code only works because tempReg-allocated PRegs currently span
    // only one BB - see isLocalTo)
    BB* bb = n->bb();
    for (fint i = 0; i < dus.length(); i++) {
      BB* bb2 = dus.nth(i)->bb;
      if (bb == bb2) return true;
    }
    return false;       // not live despite what basic_isLiveAt says
  }
  
  bool SAPReg::basic_isLiveAt(SCodeScope* s, fint bci) {
    assert(bciLT(bci, s->ncodes), "bci too high");
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      SScope* s1;
      for (s1 = s; s1 != scope && s1; s1 = s1->sender()) ;
      assert(s1 == scope, "s is not below my scope");
    }
#   endif
    // check out SCodeScope::computeMaskFor before/after changing the
    // code below - is marks the sendDesc masks using the same algorithm

    // find closest common ancestor of s and creationScope, and the
    // respective bcis in that scope
    fint bs = bci;
    fint bc = creationStartBCI;
    SSelfScope* ss = findAncestor(s, bs, creationScope, bc);
    if (!scope->isSenderOrSame(ss)) fatal("bad scope arg in basic_isLiveAt");
    if (ss == scope) {
      // live range = ]startBCI, endBCI]
      assert(startBCI == bc ||
             ss == creationScope && creationStartBCI == bc, "oops");
      return bciLT(startBCI, bs) && bciLE(bs, endBCI);
    } else {
      // live range = ]bc, end of scope]
      return bciLT(bc, bs);
    }
  }

  bool PReg::isCPEquivalent(PReg* r) {
    // is receiver in same register as argument?
    if (this == r) return true;
    // try receiver's CP info
    CPInfo* i;
    for (i = cpInfo; i && i->r; i = i->r->cpInfo) {
      if (i->r == r) return true;
    }
    // now try the other way
    for (i = r->cpInfo; i && i->r; i = i->r->cpInfo) {
      if (i->r == this) return true;
    }
    return false;
  }
  
  NameNode* PReg::locNameNode(bool mustBeLegal) {
    UsedOnlyInAssert(mustBeLegal);
    assert(!isTempReg(loc) || !mustBeLegal, "shouldn't be in temp reg");
    if (isTempReg(loc) && !debug) {
      return new IllegalName;
    } else {
      // debug-visible PRegs may have temp regs if they're only visible 
      // from uncommon branches
      return new LocationName(loc);
    }
  }

  SCodeScope* BlockPReg::parent() {
    return scopeFromBlockMap(block->map()->enclosing_mapOop());
  }

  SCodeScope* BlockPReg::scopeFromBlockMap(mapOop block_map) {
    blockMap *b= (blockMap*)block_map->map_addr();
    smiOop desc= b->desc();
    assert_smi(desc, "should be an integer");
    assert(desc != BLOCK_PROTO_DESC, "should have been changed");
    SCodeScope* s = (SCodeScope*)desc;
    // s may be invalid (receiver block) - make educated guess
    if (int(s) < 256 * K) s = NULL;     // not a valid address
    assert(s == NULL || s->isCodeScope(), "should be non-access");
    return s;
  }
  
  NameNode* BlockPReg::locNameNode(bool mustBeLegal) {
    Unused(mustBeLegal);
    assert(!isTempReg(loc), "shouldn't be in temp reg");    
    if (memoized || primFailBlockScope) {
      assert(parent()->nsends > 0, "should have exposing send for this block");
    }
    // always describe blocks with MemoizedNames so we can find all blocks
    // in a vframe (see Recompilation::checkForRemappedBlocks)
    return new MemoizedName(loc, block);
  }
  
  NameNode* PReg::nameNode(bool mustBeLegal) {
    PReg* r = cpReg();
    if (r->loc != UnAllocated) {
      return r->locNameNode(mustBeLegal);
    } else if (r->isConstPReg()) {
      return r->nameNode(mustBeLegal);
    } else if (r->isBlockPReg()) {
      return new BlockValueName(((BlockPReg*)r)->block);
    } else {
      // commented out for the time being, miw 6/14/96
      // assert(!debug, "couldn't recover debug info");
      return new IllegalName;
    }
  }

  NameNode* ConstPReg::nameNode(bool mustBeLegal) {
    Unused(mustBeLegal);
    return newValueName(constant); }

  PReg* PReg::cpReg() {
    assert(!cpInfo || loc == UnAllocated,
           "allocated regs shouldn't have cpInfo");
    if (cpInfo == NULL) {
      return this;
    } else {
      PReg* r;
      for (CPInfo* i = cpInfo; i; r = i->r, i = r->cpInfo) ;
      return r;
    }
  }
  
  void BlockPReg::memoize() {
    if (primFailBlockScope == NULL) memoized = true;
  }
  
  void BlockPReg::markEscaped() {
    if (!escapes) {
      escapes = true;
      // must describe parent scope because block escapes
      assert(scope->isCodeScope(), "should be non-access");
      nscope()->addSend(new PRegBList(1));
      if (PrintSICExposed) lprintf("*exposing %s\n", name());
    }
  }
      
  
  char* PReg::name() {
    char* n = NEW_RESOURCE_ARRAY(char, 25);
    if (loc == UnAllocated) { 
      sprintf(n, "%s%d%s%s%s", prefix(), id(),
              uplevelR || uplevelW ? "^" : "",
              uplevelR ? "R" : "", uplevelW ? "W" : "");
    } else {
      sprintf(n, "%s%d(%s)%s%s%s", prefix(), id(), locationName(loc),
              uplevelR || uplevelW ? "^" : "",
              uplevelR ? "R" : "", uplevelW ? "W" : "");
    }
    return n; 
  }
  
  void PReg::print() {
    print_short(); lprintf(": "); printDefsAndUses(&dus);
  }
  
  char* BlockPReg::name() {
    char* n = NEW_RESOURCE_ARRAY(char, 25);
    sprintf(n, "%s <%#lx>%s", PReg::name(), (unsigned long)block,
            memoized ? "#" : (primFailBlockScope ? "#F" : ""));
    return n;
  }
  
  char* ConstPReg::name() {
    char* n = NEW_RESOURCE_ARRAY(char, 25);
    sprintf(n, "%s <%#lx>", PReg::name(), (unsigned long)constant);
    return n;
  }
  
  char* SplitPReg::name() {
    char* n = NEW_RESOURCE_ARRAY(char, 25);
    char buf[MaxSplitDepth+1];
    sprintf(n, "%s <%s>", PReg::name(), sig->prefix(buf));
    return n;
  }
  
  bool PReg::verify() {
    bool ok = true;
    if (_id < 0 || _id >= currentNo) {
      ok = false;
      error2("PReg %#lx: invalid ID %ld", this, _id);
    }
    int32 uses = 0, defs = 0;
    for (fint i = 0; i < dus.length(); i++) {
      DUInfo* info = dus.nth(i)->defUseInfo();
      defs += info->defs.length();
      uses += info->uses.length();
    }
    if (defs != _ndefs && !incorrectD() && !isConstPReg()) {
      // ConstPRegs have fake def
      ok = false;
      error3("PReg %#lx: wrong def count (%ld instead of %ld)",
             this, _ndefs, defs);
    }
    if (uses != _nuses && !incorrectU()) {
      ok = false;
      error3("PReg %#lx: wrong use count (%ld instead of %ld)",
             this, _nuses, uses);
    }
    if (!incorrectDU() && _ndefs == 0 && _nuses > 0) {
      ok = false;
      error1("PReg %#lx: used but not defined", this);
    }
    if (uplevelW && !uplevelR) {
      ok = false;
      error1("PReg %#lx: uplevelW should imply uplevelR", this);
    }
#   ifdef fixthis  // fix this - may still be needed
    if (debug && !incorrectDU() && isTrashedReg(loc)) {
      ok = false;
      error1("PReg %#lx: debug-visible but allocated to temp reg", this);
    }
#   endif
    
    return ok;
  }
  
  bool SAPReg::verify() {
    bool ok = PReg::verify();
    if (ok) {
      if (startBCI == IllegalBCI) {
        if (creationStartBCI != IllegalBCI || endBCI != IllegalBCI) {
          ok = false;
          error1("SAPReg %#lx: live range only partially set", this);
        }
      } else if (scope->isCodeScope()) {
        fint ncodes = nscope()->ncodes;
        if (creationStartBCI < EpilogueBCI
        ||  creationStartBCI >= creationScope->ncodes) {
          ok = false;
          error2("SAPReg %#lx: invalid creationStartBCI %ld",
                 this, creationStartBCI);
        }
        if (startBCI < EpilogueBCI || startBCI >= ncodes) {
          ok = false;
          error2("SAPReg %#lx: invalid startBCI %ld", this, startBCI);
        }
        if (endBCI < EpilogueBCI || endBCI >= ncodes) {
          ok = false;
          error2("SAPReg %#lx: invalid endBCI %ld", this, endBCI);
        }
      }
    }
    return ok;
  }

  bool BlockPReg::verify() {
    bool ok = SAPReg::verify() && block->verify();
    if (!block->is_block()) {
      ok = false;
      error2("BlockPReg %#lx: oop %#lx is not a block", this, block);
    }
    if (isMaterialized &&  !escapes  &&  !isEliminated) {
      // blocks are materialized when generating code;
      //  a subsequent pass asks each node for escaping blocks to
      //   ensure their locals are stack-allocated.
      //  So the computeExposedBlocks routines must be consistent with
      //   the code generation routines.
      //  Catch one inconsistency here. -- dmu
      //  (Must check has_code because canEliminateAndStillDebug above falsifies escapes).
      ok = false;
      error2("BlockPReg %#lx: "
             "oop %#lx has been materialized but has not been caught escaping",
             this, block);
    }
    return ok;
  }
  
  bool NoPReg::verify() { return true; }
  
  bool ConstPReg::verify() {
    bool ok = (PReg::verify() && constant->is_map()) || constant->verify();
# if TARGET_ARCH == SPARC_ARCH
    if (int32(constant) < maxImmediate && int32(constant) > -maxImmediate
        && loc != UnAllocated) {
# elif TARGET_ARCH == I386_ARCH
    if (loc != UnAllocated) {
# endif
      error2("ConstPReg %#lx: could use load immediate to load oop %#lx",
             this, constant);
      ok = false;
    }
    if (loc != UnAllocated && !isRegister(loc)) {
      error1("ConstPReg %#lx: was allocated to stack", this);
      ok = false;
    }
    if (loc != UnAllocated && isTrashedReg(loc)) {
      error1("ConstPReg %#lx: was allocated to trashed reg", this);
      ok = false;
    }
    return ok;
  }
  
# endif
