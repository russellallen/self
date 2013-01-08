/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "defUse.hh"
# pragma implementation "defUse_inline.hh"
# include "_defUse.cpp.incl"



  // rcvr is definition of a PReg (the arg) which we are trying to
  //  apply global copy propagation to

  bool PDef::canCopyPropagate(PReg* definedPr) {

    // don't propagate if the defNode isn't assignment

    if (!node->isAssignmentLike())
      return false;
    assert(node->dest() == definedPr, "not assignment-like");


    // don't propagate if source has incorrect def info, does not
    // survive calls (i.e. is local to BB), or is uplevelW (incorr. defs)

    PReg* defSrc = node->src();

    if ( defSrc->incorrectD() 
    ||   isTrashedReg(defSrc->loc)
    ||   defSrc->uplevelW)
      return false;

    return true;
  }


  void DUInfo::propagateTo(BB* useBB, PUse* use, Node* fromNode, PReg* src,
                           Node* toNode, bool global) {
    // r1 := r2; ...; r3 := op(r1)  -->  r1 := r2; ...; r3 := op(r2)
    bool ok = toNode->copyPropagate(useBB, use, src);
    if (PrintSICCopyPropagation) {
      lprintf("*%s cp:%s propagate %s from N%ld (%#lx) to N%ld (%#lx)\n",
              global ? "global" : "local",
              ok ? "" : " couldn't",
              src->name(),
              (void*)(fromNode ? fromNode->id() : 0),
              fromNode,
              (void*)toNode->id(), toNode);
    }
  }


  void DUInfo::propagateTo(BB* useBB, PReg* r, PDef* def, PUse* use,
                           bool global) {
    // def reaches use; try to eliminate r's use by using copy propagation
    Node* fromNode = def->node;
    bool isAssignment = fromNode->isAssignmentLike();
    Node* toNode = use->node;
    bool hasSrc = fromNode->hasSrc();
    PReg* fromPR = hasSrc ? fromNode->src() : 0;
    bool isConst = hasSrc && fromPR->isConstPReg();
    if (  isAssignment 
    &&    isConst 
    &&    toNode->canCopyPropagateOop()) {
      // loadOop r1, oop; ...; r2 := op(r1)    --->
      // loadOop r1, oop; ...; r2 := op(oop)
      bool ok = toNode->copyPropagate(useBB, use, fromPR);
      if (PrintSICCopyPropagation) {
        lprintf("*%s cp:%s %s from N%ld (%#lx) to N%ld (%#lx)\n",
               global ? "global" : "local", 
               ok ? "" : " couldn't propagate",
               fromPR->name(),
               (void*)fromNode->id(), fromNode,
               (void*)toNode->id(), toNode);
      }
    } else if (  isAssignment 
           &&   !isConst 
           &&    hasSrc 
           &&    toNode->canCopyPropagate()
           &&    toNode->canCopyPropagateFrom(fromPR)) {
      // r1 := r2; ...; r3 := op(r1)  -->  
      // r1 := r2; ...; r3 := op(r2)
      propagateTo(useBB, use, fromNode, fromPR, toNode, global);
    } 
    else if (  r->nuses() == 1 
         &&    toNode->isAssignNode() 
         &&   !toNode->hasSideEffects() 
         &&    fromNode->canChangeDest() 
         &&    r->canEliminateAndStillDebug()) {
      // fromNode: r := ...;  ... ; toNode: x := r    --->
      // fromNode: x := ...;
      if (PrintSICCopyPropagation) {
        lprintf("*%s cp: changing dest of N%ld (%#lx) to %s to match use at N%ld (%#lx)\n",
                global ? "global" : "local", 
                (void*)fromNode->id(),
                fromNode, r->name(),
                (void*)toNode->id(), toNode);
      }
      assert(!r->incorrectDU(), "shouldn't try CP on this");
      assert(!global || r->ndefs() == 1, "not safe with >1 defs");
      assert(fromNode->dest() == r, "unexpected dest");
      fromNode->setDest(fromNode->bb(), toNode->dest());
      toNode->eliminateNodeAndUsedPRs(toNode->bb(), 0, false);
    } else {
      if (PrintSICCopyPropagation) {
        lprintf("*%s cp: can't propagate N%ld (%#lx) to N%ld (%#lx)\n",
               global ? "global" : "local",
               (void*)fromNode->id(), fromNode,
               (void*)toNode->id(), toNode);
      }
    }
  }
  
  void PUse::print()      { lprintf("PUse %#lx (N%ld)", this,
                                    (void*)node->id()); }
  void PSoftUse::print()  { lprintf("PSoftUse %#lx (N%ld)", this,
                                    (void*)node->id());}
  void PDef::print()      { lprintf("PDef %#lx (N%ld)", this,
                                    (void*)node->id()); }

  void BBDUTable::print() {
    if (!info) return;      // not built yet
    print_short();
    for (fint i = 0; i < info->length(); i++) {
      lprintf("%3ld: ", (void*)i); info->nth(i)->print();
    }
  }
  
  void DUInfo::getLiveRange(int32& firstNodeNum, int32& lastNodeNum) {
    // IN:  first & last node ID of BB
    // OUT: first & last node ID where this PReg is live
    bool firstSet = false;
    PDefListElem* d = defs.head();
    PUseListElem* u = uses.head();
    while (u || d) {
      assert(!u || !u->next() ||
             u->data()->node->id() <= u->next()->data()->node->id(),
             "should be ordered by increasing node number");
      assert(!d || !d->next() ||
             d->data()->node->id() <= d->next()->data()->node->id(),
             "should be ordered by increasing node number");
      if (u && (!d || u->data()->node->id() <= d->data()->node->id())) {
        firstSet = true;                // use before def --> live from start
        lastNodeNum = u->data()->node->num();
        u = u->next();
      } else if (d) {
        if (!firstSet) {
          firstSet = true;              // first definition is here
          firstNodeNum = d->data()->node->num();
        }
        d = d->next();
      }
    }
  }

  void DUInfo::print_short() { lprintf("DUInfo %#lx", this); }
  void DUInfo::print() {
    print_short(); lprintf(" for "); reg->print_short(); lprintf(": ");
    uses.print(); lprintf("; "); defs.print(); lprintf("\n");
  }

  void PRegBBIndex::print_short() {
    lprintf("PRegBBIndex [%ld] for", (void*)index); bb->print_short(); 
  }

  void PRegBBIndex::print() {
    print_short(); lprintf(": "); bb->duInfo.info->nth(index)->print();
  }

  static bool cpCreateFailed = false;

  CPInfo* CPInfo::new_CPInfo(Node* n) {
    CPInfo* cpi = new CPInfo(n);
    if (cpCreateFailed) {
      cpCreateFailed = false;
      return 0;
    }
    return cpi;
  }
  
  CPInfo::CPInfo(Node* n) {
    def = n;
    if (n->hasSrc()) {
      r = n->src();
    } else {
      // can't use this def
      cpCreateFailed = true;
    }
  }

  bool CPInfo::isConstant()     { return r->isConstPReg(); }
  oop  CPInfo::constant()       {
    assert(isConstant(), "not constant");
    return ((ConstPReg*)r)->constant;
  }

  void CPInfo::print() {
    lprintf("*(CPInfo*)%#lx : def %#lx, %s\n", this, def, r->name());
  }
  
  static void printNodeFn(PDefUse* du) { lprintf("N%ld ",
                                                 (void*)du->node->id()); }
  
  void printDefsAndUses(PRegBBIndexBList* l) {
    lprintf("defs: ");
    forAllDefsDo(l, (defDoFn)printNodeFn);
    lprintf("; uses: ");
    forAllUsesDo(l, (useDoFn)printNodeFn);
  }

  static defDoFn theDefIteratorFn;
  static void doDefsFn(PRegBBIndex* p) {
    DUInfo* info = p->bb->duInfo.info->nth(p->index);
    info->defs.apply(theDefIteratorFn);
  }
  
  void forAllDefsDo(PRegBBIndexBList* l, defDoFn f) {
    theDefIteratorFn = f;
    l->apply(doDefsFn);
  }

  static useDoFn theUseIteratorFn;
  static void doUsesFn(PRegBBIndex* p) {
    DUInfo* info = p->bb->duInfo.info->nth(p->index);
    info->uses.apply(theUseIteratorFn);
  }
  
  void forAllUsesDo(PRegBBIndexBList* l, useDoFn f) {
    theUseIteratorFn = f;
    l->apply(doUsesFn);
  }
  
# endif
