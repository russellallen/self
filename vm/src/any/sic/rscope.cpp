/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "rscope.hh"
# include "_rscope.cpp.incl"

# ifdef SIC_COMPILER

  RScope::RScope(RAbstractSelfScope* s, fint bci) {
    _sender = s; _senderBCI = bci; 
    if (s) {
      s->addScope(bci, this);
      nsends = s->nsends;
    } else {
      nsends = -1;
    }
  }

  RAbstractSelfScope::RAbstractSelfScope(RAbstractSelfScope* s, fint bci,
                                         ScopeDesc* d, mapOop m)
  : RScope(s, bci), uncommon(1) {
    desc = d;
    if (d == 0 || d->isAccessScope()) {
      ncodes = 1;
    } else {
      methodMap* mm = (methodMap *) d->method()->map();
      ncodes = mm->length_codes();
    }
    _subScopes = NEW_RESOURCE_ARRAY(RScopeBList*, ncodes);
    for (fint i = 0; i < ncodes; i++) _subScopes[i] = 0;
    _receiverMapOop = m;
  }

  RPICScope::RPICScope(nmethod* cllr, PcDesc* pc, sendDesc* s, mapOop rcvrMap,
                       nmethod* clle, CountStub *cs, fint lev, bool tr)
    : RAbstractSelfScope(0, pc->byteCode,
                         clle ? clle->scopes->root() : 0,
                         rcvrMap) {
    caller= cllr;
    pcDesc= pc;
    sd= s;
    _receiverMapOop= rcvrMap;
    callee= clle;
    nsends= cs ? cs->count() :
        callee ? callee->invocationCount() / max(callee->ncallers(), 1) : 0;
    level= lev;
    trusted= tr;
    lookupType= sd->lookupType();
    extended= false;
  }
  
  RUntakenScope::RUntakenScope(nmethod* c, PcDesc* pc, sendDesc* s, fint lev)
    : RPICScope(c, pc, s, mapOop(badOop), 0, 0, lev, true) { }
  
  bool RAbstractSelfScope::equivalent_lookup(simpleLookup* l) {
    if (desc->l_equivalent(l)) {
      _receiverMapOop = l->receiverMapOop();        // hack for blocks
      return true;
    } else {
      return false;
    }
  }
  
  RSelfScope::RSelfScope(RAbstractSelfScope* s, fint bci, ScopeDesc* d)
    : RAbstractSelfScope(s, bci, d,
                         d ? d->rcvrExpr()->myMapOop() : mapOop(badOop))
  {}

  bool RSelfScope::equivalent_scope(SScope* s) {
    if (!s->isSelfScope()) return false;
    SSelfScope* ss = (SSelfScope*)s;
    // don't use ss->rscope because it may not be set yet; but ss's sender
    // must have an rscope if ss is equivalent to this.
    return ss->senderBCI() == desc->senderByteCodeIndex() &&
           ss->sender()->rscope == _sender;
  }
  
  bool RPICScope::equivalent_scope(SScope* s) {
    Unused(s);
    // an RPICScope represents a non-inlined scope, so it can't be equivalent
    // to any SScope
    return false;
  }

  oop RAbstractSelfScope::method() { return desc->method(); }

  void RAbstractSelfScope::addScope(fint bci, RScope* s) {
    assert(bci >= 0 && bci < ncodes, "bci out of range");
    if (_subScopes[bci] == 0) _subScopes[bci] = new RScopeBList(5);
    assert(!_subScopes[bci]->contains(s), "already there");
    _subScopes[bci]->append(s);
  }

  RScope* RAbstractSelfScope::subScope(fint bci, simpleLookup* k) {
    // return the subscope matching the lookup
    assert(bci >= 0 && bci < ncodes, "bci out of range");
    RScopeBList* list = _subScopes[bci];
    if (list == 0) return new RNullScope(this);
    for (fint i = 0; i < list->length(); i++) {
      RScope* rs = list->nth(i);
      if (rs->equivalent_lookup(k))
        return rs;
    }
    return new RNullScope(this);
  }

  RScopeBList* RAbstractSelfScope::subScopes(fint bci) {
    // return all subscopes at bci
    assert(bci >= 0 && bci < ncodes, "bci out of range");
    RScopeBList* list = _subScopes[bci];
    if (list == 0) return new RScopeBList(1);
    return list;
  }

  bool RAbstractSelfScope::hasSubScopes(fint bci) {
    assert(bci >= 0 && bci < ncodes, "bci out of range");
    return _subScopes[bci] != 0;
  }

  bool RAbstractSelfScope::isUncommonAt(fint bci, bool primCall) {
    assert(bci >= 0 && bci < ncodes, "bci out of range");

    // check if program got uncommon trap in the past
    for (fint i = 0; i < uncommon.length(); i++) {
      if (uncommon.nth(i)->bci() == bci) return false;
    }

    if (_subScopes[bci]) {
      RScope* s = _subScopes[bci]->first();

      // isTrusted() added by dmu 4/96 to avoid untrusted PICs
      //   from prevented prim failure being uncommon

      if (primCall && s && !s->isUntakenScope()  &&  isTrusted()) {
        // primitive failure was executed at least once - don't make it
        // uncommon
        return false;
      }
      
      if (_subScopes[bci]->length() == 1 && s->isUntakenScope()) {
        if (primCall) {
          // ok, prim failure was never taken - guess it's ok
          // (this is optimistic - might be primitive that always fails
          // but hasn't been executed yet)
          return true;
        } 

        // don't make uncommon if send was never executed (we are probably
        // optimizing a loop before the rest of the method containing the
        // loop has executed
        return false;
      }

      // performance bug: currently, PICs cannot handle performs.
      // Thus, do not allow uncommon branches
      // for the "otherwise" case because the inline cache contains only the
      // last case.
      RScopeBList* l = _subScopes[bci];
      for (fint i = l->length() - 1; i >= 0; i--) {
        RScope* s = l->nth(i);
        if (s->isPICScope()) {
          RPICScope* ps = (RPICScope*)s;
          if (isPerformLookupType(ps->lookupType)) 
            return false;
        }
      }
    }
    return true;
  }

  SExpr* RAbstractSelfScope::receiverExpr() {
    // guess that true/false map really means true/false object
    // (gives more efficient testing code)
    if (receiverMapOop() == mapOop(badOop)) {
      if (WizardMode) warning("SIC: unknown receiver expression");
      return new UnknownSExpr(0);
    } else if (receiverMap() == Memory->true_map()) {
      return new ConstantSExpr(Memory->trueObj, 0, 0);
    } else if (receiverMap() == Memory->false_map()) {
      return new ConstantSExpr(Memory->falseObj, 0, 0);
    } else {
      return new MapSExpr(receiverMapOop(), 0, 0);
    }
  }

  SExpr* RUntakenScope::receiverExpr() {
    return new UnknownSExpr(0, 0, sd->wasNeverExecuted());
  }

  bool RUntakenScope::isUnlikely() { return sd->wasNeverExecuted(); }

  void RPICScope::unify(RAbstractSelfScope* s) {
    assert(ncodes == s->ncodes, "should be the same");
    for (fint i = 0; i < ncodes; i++) {
      _subScopes[i] = s->_subScopes[i];
      if (_subScopes[i]) {
        for (fint j = _subScopes[i]->length() - 1; j >= 0; j--) {
          _subScopes[i]->nth(j)->_sender = this;
        }
      }
    }
    uncommon.appendList(&s->uncommon);
  }

  RScopeBList* RNullScope::subScopes(fint bci) {
    Unused(bci);
    return new RScopeBList(1);
  }

  static int compare_pcDescs(const void* p1,  const void* p2) {
    PcDesc** r1 = (PcDesc**) p1;
    PcDesc** r2 = (PcDesc**) p2;
    return (*r2)->scope - (*r1)->scope;
  }
  
  static int compare_RPICScopes(const void* p1,  const void* p2) {
    RPICScope** r1 = (RPICScope**) p1;
    RPICScope** r2 = (RPICScope**) p2;
    return (*r2)->pcDesc->scope - (*r1)->pcDesc->scope;
  }
  
  
  typedef BoundedListTemplate<PcDesc*   >    PcDescBList;
  typedef BoundedListTemplate<RPICScope*> RPICScopeBList;

  static void getCallees(nmethod* nm, PcDescBList*& uncommon,
                         RPICScopeBList*& sends, bool trusted, fint level) {
    // return a list of all taken uncommon branches of nm, plus a list
    // of all nmethods called by nm (in the form of PICScopes)
    // both lists are sorted by scope (biggest offset first)
    if (PrintPICScopes) {
      lprintf("%*s*searching nm %#lx \"%s\" (%strusted; %ld callers)\n",
             (void*)(2 * level), "",
             nm, selector_string(nm->key.selector), trusted ? "" : "not ",
             (void*)nm->ncallers());
    }
    uncommon = new PcDescBList(1);
    sends = new RPICScopeBList(UsePICRecompilation ? 10 : 1);
    if (nm->compiler() == SIC) {
      for (addrDesc* a = nm->locs(), *aend = nm->locsEnd(); a < aend; a++) {
        if (a->isUncommonTrap()) {
          int32* instp = (int32*) a->addr(nm);
          assert(isUnimp(instp), "should be an unimp instruction");
          if (trapCount(instp) != 0) {
            uncommon->append(nm->containingPcDesc((char*)instp));
          }
        }
      }
    }
    qsort(uncommon->data_addr(), uncommon->length(), sizeof(PcDesc*),
          compare_pcDescs);
    if (UsePICRecompilation) {
      for (addrDesc* a = nm->locs(), *aend = nm->locsEnd(); a < aend; a++) {
        if (a->isSendDesc()) {
          sendDesc* sd = a->asSendDesc(nm);
          PcDesc* p = nm->containingPcDesc((char*)sd);
          fint len= sd->ntargets();
          switch (len) {
            case 0:
              // this send was never taken
              sends->append(new RUntakenScope(nm, p, sd, level));
              break;
            case 1: {
              // monomorphic IC
              assert (sd->pic() == 0, "shouldn't have a PIC");
              nmethod *callee= sd->get_method();
              // If we are reusing nmethods and the method is reusable and
              // we skip the prologue, then we don't really know the rcvr
              // type...
              mapOop m=    ReuseNICMethods
                        && callee->reusable()
                        && sd->jump_addr() == callee->verifiedEntryPoint()
                          ? mapOop(badOop)
                          : callee->key.receiverMapOop();

              // If a method calls _IntAdd: indirectly and
              //  some other call to _IntAdd: fails,
              //  still need to make its failure uncommon.
              //  The problem is that the send of value:With: in the
              //  wrapper method has a 1-entry PIC.
              //  In order to prevent 1-entry PICs from always being trusted,
              //    I have added the "&& trusted" below.  dmu 4/96

              sends->append(new RPICScope(nm, p, sd, m,
                                          callee, sd->countStub(),
                                          level, 
                                          m != mapOop(badOop)  && trusted));
              break;
            }
            default: {
              CacheStub *pic= sd->pic();
              assert(pic, "should have PIC");
              bool useInfo= trusted || len <= UntrustedPICLimit;
              if (!useInfo) {
                // NB: ignore limit for block receivers - right case will be
                // picked by compiler; use last, not first, because first
                // case might be an immediate.

                // This is a terrible hack--the compiler should be restructured.
                // The problem is that this code is called BEFORE it knows
                // that it will have a constant (block lit) for the rcvr
                // of this send.
                // For now, just try all entries, instead of just last one.
                // was: pic->get_map(len-1)->map_addr()->is_block() (dmu 5/96)
                for (fint i = 0;  i < len;  i++) {
                  if (pic->get_map(i)->map_addr()->is_block()) {
                    useInfo= true;
                    break;
                  }
                }
              }
              if (useInfo) {
                for (fint i = 0; i < len; i++) {
                  sends->append(new RPICScope(nm, p, sd, pic->get_map(i),
                                              pic->get_method(i), pic->countStub(i),
                                              level, trusted));
                }
              } else if (PrintPICScopes) {
                lprintf("%*s*not trusting PICs in sd %#lx \"%s\" (%ld cases)\n",
                        (void*)(2*level), "", sd,
                        selector_string(sd->selector()), (void*)len);
              }
            }
          }
        }
      }
      qsort(sends->data_addr(), sends->length(), sizeof(RPICScope*),
            compare_RPICScopes);
    }
  }
    
  RAbstractSelfScope* constructRScopes(nmethod* nm, bool trusted,
                                       fint level) {
    // construct nm's RScope tree and return the root
    // level > 0 means recursive invocation through a RPICScope (level
    // is the recursion depth); trusted means PICs info is considered
    // accurate
    RAbstractSelfScope* current = 0;
    RAbstractSelfScope* root = 0;
    PcDescBList* uncommon;
    RPICScopeBList* sends;
    getCallees(nm, uncommon, sends, trusted, level);
    // visit each scope in the debug info and enter it into the tree
    FOR_EACH_SCOPE(nm->scopes, s) {
      // search s' sender RScope
      ScopeDesc* sender = s->sender();
      RAbstractSelfScope* rsender;
      for (rsender = current; rsender;
           rsender = rsender->sender()) {
        if (rsender->isSelfScope() &&
            ((RSelfScope*)rsender)->desc->is_equal(sender))
          break;
      }
      fint bci = sender ? s->senderByteCodeIndex() : IllegalBCI;
      current = new RSelfScope(rsender, bci, s);
      if (!root) {
        root = current;
        root->nsends = nm == recompilee ? nm->oldCount : nm->invocationCount();
      }

      // enter bcis with taken uncommon branches
      while (uncommon->nonEmpty() &&
             uncommon->top()->scope == s->offset()) {
        current->uncommon.push(new RUncommonBranch(current, uncommon->pop()));
      }
      // enter info from PICs
      while (sends->nonEmpty() &&
             sends->top()->pcDesc->scope == s->offset()) {
        RPICScope* ps = sends->pop();
        ps->_sender = current; 
        current->addScope(ps->bci(), ps);
      }
    }
    assert(sends->isEmpty(), "sends should have been connected to rscopes");
    assert(uncommon->isEmpty(),
           "uncommon branches should have been connected to rscopes");
    return root;
  }

  inline bool trustPICs(nmethod* nm) {
    fint ncallers = nm->ncallers();
    oop sel = nm->key.selector;
    if (sel == VMString[PLUS] || sel == VMString[MINUS] ||
        sel == VMString[TIMES] || sel == VMString[DIVIDE]) {
      // code space optimization: try to avoid unnecessary mixed-type
      // arithmetic
      return ncallers <= 1;
    } else {
      return ncallers <= PICTrustLimit;
    }
  }

  void RPICScope::extend() {
    // try to follow PIC info one level deeper (i.e. extend rscope tree)
    if (!extended && callee->isValid() && !callee->isZombie() && caller != callee) {
      // search the callee for type info
      RAbstractSelfScope* s =
        constructRScopes(callee, trusted && trustPICs(callee), level + 1);
      // s and receiver represent the same scope - unify them
      unify(s);
    }
    extended = true;
  }

  void RScope::print() {
    lprintf("; sender: %#lx@%ld; count %ld\n", _sender,
            (void*)_senderBCI,
            (void*)nsends);
  }

  void RAbstractSelfScope::printSubScopes() {
    fint i;
    for (i = 0; i < ncodes && _subScopes[i] == 0; i++) ;
    if (i < ncodes) {
      lprintf("{ ");
      for (i = 0; i < ncodes; i++) {
        lprintf("%#lx ", _subScopes[i]);
      }
      lprintf("}");
    } else {
      lprintf("none");
    }
  }
  
  void RSelfScope::print_short() {
    lprintf("p *(RSelfScope*)%#lx \"%s\" #%ld",
           this, selector_string(desc->key.selector), (void*)nsends);
  }
  
  void RSelfScope::print() {
    print_short();
    lprintf(": scope %#lx; subScopes: ", desc);
    printSubScopes();
    if (uncommon.nonEmpty()) { lprintf("; uncommon "); uncommon.print(); }
    RScope::print();
  }

  void RPICScope::print_short() {
    lprintf("p *(RPICScope*)%#lx \"%s\" #%ld",
           this, selector_string(desc->key.selector), (void*)nsends);
  }
  
  void RPICScope::print() {
    print_short();
    lprintf(": sendDesc %#lx; subScopes: ", sd);
    printSubScopes();
    if (uncommon.nonEmpty()) { lprintf("; uncommon "); uncommon.print(); }
  }

  void RUntakenScope::print_short() {
    lprintf("p *(RUntakenScope*)%#lx \"%s\"",
           this, selector_string(sd->selector()));
  }
  
  void RUntakenScope::print() {
    print_short();
    lprintf(": sendDesc %#lx\n", sd);
    assert(!*_subScopes, "should have no subscopes");
    assert(uncommon.isEmpty(), "should have no uncommon branches");
  }

  void RNullScope::print_short() {
    lprintf("p *(RNullScope*)%#lx\n", this); 
  }

  void RUncommonBranch::print() {
    lprintf("p *(RUncommonScope*)%#lx : %#lx@%ld\n", this, scope, (void*)bci());
  }

  void RNullScope::printTree(fint bci, fint level) {
    Unused(bci); Unused(level); }

  void RScope::printTree(fint bci, fint level) {
    lprintf("%*s%3ld: ", (void*)(level * 2),
            "", (void*)bci);
    print_short(); lprintf("\n");
  }

  void RAbstractSelfScope::printTree(fint bci, fint level) {
    RScope::printTree(bci, level);
    for (fint i = 0; i < ncodes; i++) {
      if (_subScopes[i]) {
        if (_subScopes[i]->length() == 1 &&
            _subScopes[i]->first()->isUntakenScope()) {
          lprintf("  %*s%3ld: uncommon trap\n", (void*)(level * 2),
                  "", (void*)bci);
        }
        for (fint j = 0; j < _subScopes[i]->length(); j++) {
          _subScopes[i]->nth(j)->printTree(i, level + 1);
        }
      }
    }
  }

  void VScope::print() {
    lprintf("(VScope*)%#lx (vf %#lx) \"%s\"\n", this, vf,
           selector_string(vf->selector()));
  }
  
  void VScope::print_short() { lprintf("VScope %#lx", this); }
  
# endif
