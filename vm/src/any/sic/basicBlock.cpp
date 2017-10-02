/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# include "abstract_interpreter_inline.hh"
# include "basicBlock_inline.hh"
# include "bitVector.hh"
# include "blist.hh"
# include "debug.hh"
# include "node.hh"
# include "nodeGen.hh"
# include "process.hh"
# include "regAlloc.hh"
# include "registerString.hh"
# include "regs.hh"
# include "regs.hh"
# include "sicScope.hh"

  void BasicBlockBase::init(Node* f, Node* l, fint n) {
    if (f->isMergeNode()) {
      ((MergeNode*)f)->didStartBB = true;     // for debugging
    }
    first = f; last = l; backwardBranches = 0; nnodes = n;
    _id = 0; 
  }
  

  void BB::localCopyPropagate() {
    fint len = duInfo.info->length();
    RegisterString usedTwice = compute_usedTwice();
    fint i;
    
    for (i = 0; i < len; i++) {
      DUInfo* dui = duInfo.info->nth(i);
      localCopyPropagateOnePReg(dui, usedTwice);
    }
  }
  
  
  RegisterString BB::compute_usedTwice() {
    fint len = duInfo.info->length();
    RegisterString used = 0;
    RegisterString usedTwice = 0;
    fint i;
    for (i = 0; i < len; i++) {
      PReg* r = duInfo.info->nth(i)->reg;
      if (r->loc != UnAllocated  &&  isAllocated(used, r->loc)) {
        // two PRegs have same preallocated reg - algorithm below can't handle
        // this
        usedTwice = allocateRegister(usedTwice, r->loc);
      }
      used = allocateRegister(used, r->loc);
    }
    return usedTwice;
  }


  void BB::localCopyPropagateOnePReg(DUInfo* dui, RegisterString usedTwice) {
    PReg* r = dui->reg;
    if (r->loc != UnAllocated  &&  isAllocated(usedTwice, r->loc)) {
      // this preallocated PReg has aliases - don't do CP
      return;
    }    
    PUseListElem* u = dui->uses.head();
    PDefListElem* nextd;
    for (PDefListElem* d = dui->defs.head(); 
                       d && u; 
                       d = nextd) {
      nextd     = d->next();
      PDef* def = d->data();

      if (isSourceOfDefUsedTwice(def, usedTwice))
        continue; // r := f(r2), and r2 is aliased preallocated - can't handle
      u = findFirstUseOfDef(def, u);
      if (u == NULL)
        break; // done with this chain (or PReg)
      u = localCopyPropagateEachUseOfThisDef(dui, d, u, usedTwice);
    }
  }   
  
  
  
  PUseListElem* BB::localCopyPropagateEachUseOfThisDef(DUInfo* dui, 
                                                       PDefListElem* d,
                                                       PUseListElem* firstUseToConsider,
                                                       RegisterString usedTwice) {
    PDef* def = d->data();

    // init loop vars:
    PUseListElem* u = firstUseToConsider;
    fint     u_id = u->data()->node->num();
    fint     d_id =       def->node->num();
    fint nextd_id = IDOfDefAfter(d);
    
    // for all uses of the def at d
    while (d_id < u_id  &&  u_id <= nextd_id) {
      // the def at d_id reaches the use at u_id
      dui->propagateTo(this, dui->reg, def, u->data(), false);
      
      u = u->next();  
      if (u == NULL) return NULL; 
      u_id = u->data()->node->num();
    }
    return u;
  }
  
  
  bool BB::isSourceOfDefUsedTwice(PDef* def, RegisterString usedTwice) {
    Node* definingNode = def->node;
    return  definingNode->hasSrc()  &&  isAllocated(usedTwice, definingNode->src()->loc);
  }

  
  PUseListElem* BB::findFirstUseOfDef(PDef* def, PUseListElem* startingUse) {
    fint d_id = def->node->num();
    for ( PUseListElem* u = startingUse;
                        u != NULL;
                        u = u->next() ) {
      fint u_id = u->data()->node->num();
      if (u_id >= d_id)
        return u;
    }
    return NULL;
  }
  
  
  fint BB::IDOfDefAfter(PDefListElem* d) {
    PDefListElem* nextd = d->next();
    const fint BIG = ~(fint(1) << fint(sizeof(fint) * BitsPerByte  -  1));
    assert(sizeof(fint) != 4  ||  BIG == 0x7fffffff, "just checking");
    return nextd == NULL  ?  BIG  : nextd->data()->node->num();
  }


  void BB::makeUses() {
    // collect defs and uses for all pregs (and fill pregTable in the process)
    assert(duInfo.info == NULL, "shouldn't be set");
    duInfo.info = new DUInfoBList(nnodes + 10);
    // note: BB may grow during loop below (inserting FlushNodes)
    // Or new BBs may be added
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n->deleted) continue;
      n->makeUses(this);
    }
  }

  void BB::renumber() {
    fint count = 0;
    for (Node* n = first; n != last->next(); n = n->next()) n->setNum(count++);
    nnodes = count;
  }
    
  void BB::remove(Node* n) {
    // remove this node and its defs & uses
    // NB: nodes aren't actually removed from the graph but just marked as
    // deleted.  This is much simpler because the topology of the flow graph
    // doesn't change this way
    assert(contains(n), "node isn't in this BB");
    n->removeUses(this);
    n->deleted = true;
  }

  void BB::addAfter(Node* prev, Node* newNode) {
    // prev == NULL means add as first node
    assert(nnodes, "shouldn't add anything to this BB");
    assert(prev == NULL || contains(prev), "node isn't in this BB");
    BB* newNodeBB = this;
    if (prev) {
      prev->insertNext(newNode);
      // cannot just set last because prev may have multiple successors
      //   if (prev == last) last = newNode;
      // Instead add flush node to NEXT bb -- dmu 10/96
      // Nope, cannot do that if following node is MERGE, have to add a bb!
      // See the long fatal elsewhere in this file where MergeNodes are created.
      
      if (prev == last) {
        // cannot use node::newBB(), would disturb successor node BB's
        newNodeBB = new BB(newNode, newNode, 1);
        theSIC->bbIterator->addBBPostHoc( newNodeBB, 
                                          this, 
                                          newNode->next()->bb());
      }
    } else {
      first->insertPrev(newNode);
      first = newNode;
    }
    if (theSIC->bbIterator->usesBuilt) {
      newNode->makeUses(newNodeBB);
    } else {
      newNode->setBB(newNodeBB);
    }
    if ( newNodeBB == this )
      renumber();
    assert(newNode->bb() == newNodeBB, "should point to me now");
  }

  static BB* thisBB;
  static void duChecker(PRegBBIndex* p) {
    if (p->bb == thisBB) fatal("should not be in middle of list");
  }

  static bool findMyBB(PRegBBIndex* bb, PRegBBIndex* p) {
    return p->bb == (BB*)bb; // hack around type system, find fn would want PRegBBIndex
  }

  fint BB::addUDHelper(PReg* r) {
    // we're computing the uses block by block, and the current BB's
    // PRegBBIndex is always the last entry in the preg's list.
    assert(nnodes, "shouldn't add anything to this BB");
    theSIC->bbIterator->pregTable->nthPut(r->id(), r, true);
    PRegBBIndex* p;
    if (theSIC->bbIterator->usesBuilt) {
      // find entry for the PReg
      fint i = r->dus.find((PRegBBIndex*)this, findMyBB);
      if (i >= 0) {
        p = r->dus.nth(i);
      } else {
        // create new entry
        duInfo.info->append(new DUInfo(r));
        r->dus.append(p = new PRegBBIndex(this, duInfo.info->length() - 1, r));
      }
    } else {
      // while building the defs & uses, the PReg's entry must be the last
      // one in the list (if there is an entry for this BB)
      if (r->dus.isEmpty() || r->dus.last()->bb != this) {
        // PReg doesn't yet have an entry for this block
#       if GENERATE_DEBUGGING_AIDS
          if (CheckAssertions) {
            thisBB = this;
            r->dus.apply(duChecker);
          }
#       endif
        duInfo.info->append(new DUInfo(r));
        r->dus.append(new PRegBBIndex(this, duInfo.info->length() - 1, r));
      }
      p = r->dus.last();
    }
    assert(p->bb == this, "wrong BB");
    assert(duInfo.info->nth(p->index)->reg == r, "wrong PReg");
    return p->index;
  }

  PUse* BB::addUse(Node* n, PReg* r, bool soft) {
    assert(contains(n), "node isn't in this BB");
    if (r->isNoPReg()) return NULL;
    PUse* u = soft ? new PSoftUse(n) : new PUse(n);
    r->incUses(u);
    fint index = addUDHelper(r);
    duInfo.info->nth(index)->uses.append(u);
    return u;
  }
    
  PDef* BB::addDef(Node* n, PReg* r) {
    assert(contains(n), "node isn't in this BB");
    if (r->isNoPReg()) return NULL;
    PDef* d = new PDef(n);
    r->incDefs(d);
    fint index = addUDHelper(r);
    duInfo.info->nth(index)->defs.append(d);
    if (r->uplevelR) {
      // flush uplevel-read pregs to stack after each definition
      n->addFlushNode(new FlushNode(r, n->scope(), n->bci()));
    }
    return d;
  }

  void BB::allocateTempRegisters(BitVector** hardwired, PRegBList* tempRegs,
                                 BitVectorBList* lives) {
    if (!nnodes) return;            // empty BB

    RegisterEqClassBList regClasses(nnodes + 1);
    regClasses.append(NULL);        // first reg class has index 1

    fint  use_count[NumRegisters], def_count[NumRegisters];
    for (fint i = 0; i < NumRegisters; i++) use_count[i] = def_count[i] = 0;

    allocate_to_preferred_candidates_if_possible(use_count, def_count);

    // allocate other temp regs (using the untouched temp regs of this BB)
    fint temp = 0;
    for (int i = 0; i < duInfo.info->length(); i++) {
      // collect temp regs 
      PReg* r = duInfo.info->nth(i)->reg;
      if (r->loc == UnAllocated && !r->isUnused() && r->isLocalTo(this)) {
        assert(r->dus.first()->index == i, "should be the same");
        for ( ; temp < NumTempRegs &&
             use_count[TempRegs[temp]] + def_count[TempRegs[temp]] > 0;
             temp++) ;
        if (temp == NumTempRegs) break;     // ran out of regs
        // ok, allocate TempRegs[temp] to the preg and equivalent pregs
        Location t = TempRegs[temp++];
        PReg* frst = r->regClass ? regClasses.nth(r->regClass)->first : r;
        for (PReg* pr = frst; pr; pr = pr->regClassLink) {
          doAlloc(pr, t);
          pr->regClass = 0;
        }
      }
      r->regClass = 0;
    }

    if (temp == NumTempRegs) {
      // ran out of temp regs with the simple strategy - try using slow
      // allocation algorithm
      slowAllocateTempRegisters(hardwired, tempRegs, lives);
    }
  }
  
  void BB::allocate_to_preferred_candidates_if_possible(fint use_count[], fint def_count[]) {
    RegCandidateBList cands(nnodes);
 
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n->deleted) continue;
      n->markAllocated(use_count, def_count);
      if (n->isAssignNode())
        pick_candidates_for_assignment_node(n, use_count, def_count, cands);
    }

    // now examine all candidates and allocate them to preferred register
    // if possible
    while (cands.nonEmpty()) {
      RegCandidate* c = cands.pop();
      if (def_count[c->loc] == c->ndefs) {
        doAlloc(c->r, c->loc);
      }
    }
  }
  
  
  void BB::pick_candidates_for_assignment_node(Node* n, fint use_count[], fint def_count[],
                                               RegCandidateBList &cands) {
    PReg* src = n->src();
    PReg* dest = n->dest();
    bool localSrc  = src ->isLocalTo(this);
    bool localDest = dest->isLocalTo(this);
    if ( isRegister(src->loc)) {
      if (dest->loc == UnAllocated && localDest) {
        // PR = PR2(reg)
        // allocate dest->loc to src->loc, but only if src->loc
        // isn't defined again
        cands.append(new RegCandidate(dest, src->loc, def_count[src->loc]));
      }
    } else if ( isRegister(dest->loc)) {
      if (src->loc == UnAllocated && localSrc) {
        // PR2(reg) = PR
        // should allocate src->loc to dest->loc, but only if dest->loc
        // has single definition (this one) and isn't used before
        // this point   [simplification]
        if (def_count[dest->loc] != 1 || use_count[dest->loc]) {
          // not eligible for special treatment
        } else {
          cands.append(new RegCandidate(src, dest->loc, 1));
        }
      }
    } else if (localSrc && localDest) {
      // both regs are local and unallocated - put them in same
      // equivalence class
      // fix this - should check for overlapping live ranges
      //        needed to say "if nonoverlapping live ranges(src, dest)"
      //        src->makeSameRegClass(dest, &regClasses);
      //        if (WizardMode) warning("basicBlock: happens");
    } else {
      // non-local registers - skip
    }
  }

    
  // allocate PRegs that are used & defined solely within this BB
  void BB::slowAllocateTempRegisters(BitVector** hardwired, PRegBList* tempRegs,
                                     BitVectorBList* lives) {
    // clear temporary data structures
    tempRegs->clear();
    lives->clear();
    fint i;
    for (i = 0; i < NumTempRegs; i++) {
      hardwired[i]->setLength(nnodes);
      hardwired[i]->clear();
    }

    for (i = 0; i < duInfo.info->length(); i++) {
      // collect temp regs and hardwired temp regs
      PReg* r = duInfo.info->nth(i)->reg;
      if (r->isLocalTo(this)) {
        assert(r->dus.first()->index == i, "should be the same");
        if (r->isUnused()) {
          // unused register - ignore
        } else {
          DUInfo* info = duInfo.info->nth(r->dus.first()->index);
          tempRegs->append(r);
          BitVector* bv = new BitVector(nnodes);
          lives->append(bv);
          fint firstUse = 0, lastUse = nnodes - 1;
          duInfo.info->nth(i)->getLiveRange(firstUse, lastUse);
          bv->addFromTo(firstUse, lastUse);
        }
      } else if (isTempReg(r->loc)) {
        fint firstUse = 0, lastUse = nnodes - 1;
        if (!r->incorrectDU()) {
          duInfo.info->nth(i)->getLiveRange(firstUse, lastUse);
        } else {
          // can't really compute live range since the temp might be non-local
          // so assume it's live from first node til the end
        }
        hardwired[RegToTempNo[r->loc]]->addFromTo(firstUse, lastUse);
      }
    }

    // now, tempRegs holds all temp regs, and lives contains each register's
    // live range (one bit per node, 1 = reg is live); hardwired contains
    // the ranges where temp regs are already taken (e.g. for NLR, calls, etc)

    // cycle through the temp registers to (hopefully) allow more optimizations
    // later (e.g. scheduling)
    fint lastTemp = 0;
#   define nextTemp(n) (n == NumTempRegs - 1) ? 0 : n + 1

    for (i = 0; i < tempRegs->length(); i++) {
      // try to allocate tempRegs[i] to a temp register
      PReg* r = tempRegs->nth(i);
      if (r->loc != UnAllocated) {
        assert(r->regClass == 0, "should have been cleared");
        continue;
      }
      BitVector* liveRange = lives->nth(i);
      for (fint tempNo = lastTemp, ntries = 0; ntries < NumTempRegs;
           tempNo = nextTemp(tempNo), ntries++) {
        if (liveRange->isDisjointFrom(hardwired[tempNo])) {
          Location temp = TempRegs[tempNo];
          doAlloc(r, temp);
          hardwired[tempNo]->unionWith(liveRange);
          lastTemp = nextTemp(tempNo);
          break;
        }
      }
      if ( r->loc == UnAllocated
      && (PrintSICTempRegisterAllocation   
          ||   (WizardMode  &&  TARGET_ARCH != I386_ARCH) /* happens normally in I386; few regs */ )) {
        lprintf("*could NOT find temp assignment for local %s in BB%ld\n",
               r->name(), (void*)id());
      } else if (r->loc == UnAllocated) {
        if (PrintSICTempRegisterAllocation) lprintf("out of temp regs");
      }
      r->regClass = 0;
    }
  }

  void BB::doAlloc(PReg* r, Location l) {
    assert( !r->cpInfo,
            "should not allocate to a PReg that has been copy-propagated");
    if (PrintSICTempRegisterAllocation) {
      lprintf("*assigning %s to temp %s in BB%ld\n",
             locationName(l), r->name(), (void*)id());
    }
    assert(!r->debug, "should not allocate to temp reg");
    r->loc = l;
    theSIC->check_flushability(r);
  }
  
  void BB::eliminateUnreachableNodes() {
    for (Node* n = first;  n != last->next();  n = n->next()) {
      n->eliminateUnreachableNodes();
    }
  }

  void BB::computeExposedBlocks(BlockPRegBList* l) {
    // add all escaping blocks to l
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n->deleted) continue;
      n->computeExposedBlocks(l);
    }
  }
  
  void BB::gen() {
    if (!nnodes) return;            // empty BB
    
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n->l && !n->l->isDefined()) n->l->define();
      if (n->deleted) continue;
      n->gen();
    }
  }

  static fint prevsBBLen;
  static void printPrevBBs(AbstractBB* b) {
    lprintf("BB%ld%s", (void*)b->id(), --prevsBBLen > 0 ? ", " : "");
  }
  
  void BB::print_short() {
    lprintf("BB%-3ld %#lx [%ld..%ld]; prevs ",
            (void*)id(), this, (void*)first->id(), (void*)last->id());
    prevsBBLen = _prevs->length();
    _prevs->apply(printPrevBBs);
    lprintf("; ");
    if (next ()) lprintf("next BB%ld", (void*)next ()->id());
    if (next1()) lprintf(    " BB%ld", (void*)next1()->id());
  }

  void BB::print() {
    print_short(); lprintf("(%ld nodes):\n", (void*)nnodes);
    print_code(false);
    lprintf("duInfo: "); duInfo.print();
  }

  void BB::print_code(bool suppressTrivial) {
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n->deleted && !(n == first || n == last)) continue;
      if (suppressTrivial && n->isTrivial()) {
        // don't print
      } else {
        n->printID(); n->print_short(); lprintf("\n");
      }
    }
  }

  void BB::print_vcg_nodes(FILE* f, bool suppressTrivial) {
    fprintf(f, "graph: { title: \"BB%d (%d..%d)\" folding:1\n",
            id(), first->id(), last->id());
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n->deleted && !(n == first || n == last)) continue;
      if (suppressTrivial && n->isTrivial()) {
        // don't print
      } else {
        char b[256], nname[256];
        char* buf = b;
        mysprintf(buf, "node: { title:\"%d\" label: \"%s\" }\n",
                (void*)n->id(), n->print_string(nname, false));
        fputs(b, f);
      }
    }
    fprintf(f, "}\n");
  }

  void BB::print_vcg_edges(FILE* f, bool suppressTrivial) {
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n->deleted && !(n == first || n == last)) continue;
      if (suppressTrivial && n->isTrivial()) {
        // don't print
      } else {
        for (fint i = 0; i < n->nSuccessors(); i++) {
          Node* nnext = n->nexti(i);
          while (nnext &&
                 (nnext->deleted || (suppressTrivial && nnext->isTrivial())))
            nnext = nnext->next();
          if (nnext) 
            fprintf(f, "edge:{ sourcename:\"%d\" targetname: \"%d\" }\n",
                    n->id(), nnext->id());
        }
      }
    }
  }

  bool BB::contains(Node* which) {
    for (Node* n = first; n != last->next(); n = n->next()) {
      if (n == which) return true;
    }
    return false;
  }

  void BB::verify() {
    fint count = 0;
    for (Node* n = first; n != last->next(); n = n->next()) {
      count++;
      n->verify();
      if (n->bb() != this)
        error2("BB %#lx: Node %#lx doesn't point back to me", this, n);
      // endsBB() is true if the block isn't memoized.  But when a block
      // is memoized after the basic block structure was created, the
      // assertion will complain because the BB structure is never updated
      // (as a matter of principle).
      // if (n == last && !n->endsBB() &&
      //     !(n->next() && n->next()->isMergeNode() &&
      //     ((MergeNode*)(n->next()))->didStartBB)) {
      //   error2("BB %#lx: last Node %#lx isn't endsBB()", this, n);
      //   fatal("compiler error");     // so it bombs when hit
      // }
      if (n->endsBB() && n != last)
        error2("BB %#lx: Node %#lx ends BB but isn't last node", this, n);
    }
    if (count != nnodes) error1("incorrect nnodes in BB %#lx", this);
  }


  void BBIterator::build(Node* first) {
    assert(bbTable == NULL, "already built");
    bbCount = 0;
    pregTable = globals = NULL;
    buildBBs(first);
  }

  void BBIterator::buildBBs(Node* first) {
    // build basic blocks
    // first, sort them topologically (ignoring backward arcs)
    // some things (e.g. SplitPReg::isLiveAt) depend on correct ordering
    BBBList* list = new BBBList(max(BasicNode::currentID >> 3, 10));
    first->newBB()->dfs(list);
    // now, the list contains the BBs in reverse order
    bbCount = list->length();
    bbTable = new BBBList(bbCount);
    for (fint i = bbCount-1; i >= 0; i--) {
      BB* bb = list->nth(i);
      bb->_id = bbCount - i - 1;
      bbTable->append(bb);
    }
  }
  

  void BBIterator::addBBPostHoc(BB* newBB, BB* predBB,  BB* nextBB) {
    // have just created a new BB after whole BB structure was built,
    // need to fix up iterator -- dmu 10/96
    // Have to keep BBs in order, so they get generated in
    // bytecode order, so SAPReg lifetime analysis works. -- dmu
    // nextBB may be earlier than predBB, so insert new BB after
    // predBB (which must preceede newBB).
    
    fint newBBId = predBB->id() + 1;
    bbTable->append(NULL); // create place holder
    for ( fint i = bbCount - 1;  i >= newBBId;  --i ) {
      BB* b = bbTable->nth(i);
      assert(b->id() == i,  "bb id must be same as bb index");
      ++b->_id;
      bbTable->nthPut(i+1, b);
    }
    newBB->_id = newBBId;
    bbTable->nthPut(newBBId, newBB);
    ++bbCount;
    
    // Now need to restitch bb next, pred pointers
    predBB->moveNext(nextBB, newBB);
    nextBB->movePrev(predBB, newBB);
    newBB->setPrev(predBB);
    newBB->setNext(nextBB);
  }


  void BB::dfs(BBBList* list) {
    // build BB graph with depth-first traversal
    _id = 1;            // mark as visited
    if (last->isRestartNode()) {
      // don't follow backward branch, but add backwards arc
      MergeNode* loopHeadNode = ((RestartNode*)last)->loopStart;
      BB* loopHeadBB = loopHeadNode->bb();
      
      bool wasNull = loopHeadBB == NULL; // added for branch bcs
      if ( wasNull ) {                   // added for branch bcs
        loopHeadBB = loopHeadNode->newBB();
      }
      loopHeadBB->backwardBranches++;
      append(loopHeadBB);

      if (loopHeadBB->id() == 0)  { // added for branch bcs
        loopHeadBB->dfs(list);
      }
    } else {
      fint n = last->nSuccessors();
      fint i;
      for (i = 0;  i < n;  i++) {
        Node* next = last->nexti(i);
        if (next == NULL) continue;     // for printing incomplete graphs
        BB* nextBB = next->newBB();
        append(i, nextBB);
      } 
      for (i = nSuccessors() - 1; i >= 0; i--) {
        BB* nextBB = (BB*)nexti(i);
        // only follow the link if next->bb hasn't been visited yet
        if (nextBB->id() == 0) nextBB->dfs(list);
      }
    }
    list->append(this);
  }
  
  static void clearNodes(BB* bb) {
    for (Node* n = bb->first; n != bb->last->next(); n = n->next()) {
      n->setBB(NULL);
    }
  }
  
  void BBIterator::clear() {
    apply(clearNodes);
    bbTable = NULL; pregTable = globals = NULL;
}

  void BBIterator::makeUses() {
    // a few PRegs may be created during makeUses (e.g. for deadBlockObj,
    // true/false etc), so leave a bit of room
    const fint ExtraPRegs = 10;
    fint n = PReg::currentNo + ExtraPRegs;
    pregTable = new PRegBList(n);
    for (fint i = 0; i < n; i++) pregTable->append(NULL);
    for (fint i = 0; i < bbCount; i++) { bbTable->nth(i)->makeUses(); }
    usesBuilt = true;
  }

  void BBIterator::allocateTempRegisters() {
    // speed/space optimization: allocate hardwired et al only once, not for
    // every BB
    BitVector* hardwired[NumTempRegs];
    PRegBList tempRegs(BasicNode::currentID);
    BitVectorBList lives(BasicNode::currentID);    
    fint i;
    for (i = 0; i < NumTempRegs; i++) {
      hardwired[i] = new BitVector(roundTo(BasicNode::currentID, BitsPerWord));
    }
    
    for (i = 0; i < bbCount; i++) {
      bbTable->nth(i)->allocateTempRegisters(hardwired, &tempRegs, &lives);
    }
    
    fint done = 0;
    globals = new PRegBList(pregTable->length());
    for (i = 0; i < pregTable->length(); i++) {
      PReg* r = pregTable->nth(i);
      if (r) {
        if (r->isUnused()) {
          pregTable->nthPut(i, NULL);           // no longer needed
        } else if (r->loc == UnAllocated) {
          globals->append(r);
        } else {
          done++;                               // allocated to a temp register
        }
      }
    }
    if (PrintSICTempRegisterAllocation) {
      fint total = globals->length() + done;
      float f = 100.0 * done / total;
      lprintf("*temporary reg. allocations done; %ld out of %ld = (%3.1f%%).\n",
              (void*)done, (void*)total, *(void**)&f);
    }
  }

  void BBIterator::print() {
    fint i;
    for ( i = 0; i < bbCount; i++) {
      lprintf("  "); bbTable->nth(i)->print_short(); lprintf("\n");
    }
  }

  void BBIterator::localCopyPropagate() {
    fint i;
    for ( i = 0; i < bbCount; i++) { bbTable->nth(i)->localCopyPropagate(); }
  }

  void BBIterator::computeExposedBlocks() {
    // escape analysis for blocks: compute initial approximation (lower bound)
    exposedBlks = new BlockPRegBList(BlockPReg::numBlocks);
    fint i;
    for ( i = 0; i < bbCount; i++) {
      bbTable->nth(i)->computeExposedBlocks(exposedBlks);
    }
  }

  static void addUplevel(PReg* exposer, PReg* exposed, bool isWritten) {
    // exposed is uplevel-accessed by exposer
    Unused(exposer);
    if (exposed->isBlockPReg()) {
      BlockPReg* block = (BlockPReg*)exposed;
      BlockPRegBList* l = theSIC->bbIterator->exposedBlks;
      if (!block->escapes) {
        assert(!l->contains(block), "should not be in list");
        l->append(block);
        block->markEscaped();
      }
    }
    exposed->uplevelR = true;
    if (isWritten)
      exposed->uplevelW = true;
    
    theSIC->cope_with_uplevel_access_to(exposed);
  }
    
  void BBIterator::computeUplevelAccesses() {
    // mark uplevel-accessed variables and compute closure of exposedBlks
    // NOTE: exposedBlks may grow during the iteration because blocks that
    // are uplevel-accessed by blocks in the initial exposedBlks list are
    // added to the list until closure is reached
    fint i;
    for ( i = 0; i < exposedBlks->length(); i++) {
      BlockPReg* r = exposedBlks->nth(i);
      r->markEscaped();
      assert (r->parent() == r->scope, "block preg was copied/changed scope");
      assert(r->scope->isCodeScope(), "must be code scope");
      r->nscope()->doUplevelAccesses(r, addUplevel);
    }
  }

  void BBIterator::gen() {
    fint i;
    for (i = 0; i < bbCount; i++) {
      bbTable->nth(i)->gen();
      fint next;
      for (next = i + 1;            // find next nonempty BB
           next < bbCount && bbTable->nth(next)->nnodes == 0;
           next++) ;
      if (     (next == bbCount 
           &&  bbTable->nth(i)->next()) 
      ||       (next < bbCount 
           &&  bbTable->nth(i)->next() 
           &&  bbTable->nth(i)->next() != bbTable->nth(next) 
           && !bbTable->nth(i)->last->isRestartNode()) /* zzz or branch? */ ) {
        // non-sequential control flow - insert a branch
        Node* n = bbTable->nth(i)->next()->first;
        n->genBranch();
      }
    }
  }

  void BBIterator::print_code(bool suppressTrivial) {
    fint i;
    for ( i = 0; i < bbCount; i++) {
      bbTable->nth(i)->print_code(suppressTrivial);
      int32 next = i + 1;
      if ( ( next == bbCount && bbTable->nth(i)->next() )  ||
           ( next <  bbCount && bbTable->nth(i)->next() &&
                                bbTable->nth(i)->next() != bbTable->nth(next) &&
                               !bbTable->nth(i)->last->isRestartNode())) {
        // non-sequential control flow - insert a branch
        Node* n = bbTable->nth(i)->next()->first;
        lprintf("\tgoto N%ld\n", (void*)n->id());
      }
      if (!suppressTrivial) lprintf("\n");
    }
  }

  void BBIterator::print_vcg_code(FILE* f, bool suppressTrivial) {
    fint i;
    for (i = 0; i < bbCount; i++) {
      bbTable->nth(i)->print_vcg_nodes(f, suppressTrivial);
    }
    for (i = 0; i < bbCount; i++) {
      bbTable->nth(i)->print_vcg_edges(f, suppressTrivial);
      int32 next = i + 1;
      if ( ( next == bbCount && bbTable->nth(i)->next() )   ||
           ( next <  bbCount && bbTable->nth(i)->next() &&
                                bbTable->nth(i)->next() != bbTable->nth(next) &&
                               !bbTable->nth(i)->last->isRestartNode())) {
        // non-sequential control flow - insert a branch
        Node* n = bbTable->nth(i)->next()->first;
      }
    }
  }

  void BBIterator::eliminateUnreachableNodes() {
    // eliminateUptoMerge stops at a merge with an extra
    //  predecessor. But if that is an unreachable node, it
    //  is stopping too soon. While it might be best if the SIC
    //  never generated such unreachable paths, it does do it and
    //  it is so hard to eliminate that I am adding a pass to do it
    //  post hoc. -- dmu
    fint i;
    for (i = 1;  i < bbCount;  i++) {
      bbTable->nth(i)->eliminateUnreachableNodes();
    }
  }

  void BBIterator::globalCopyPropagate() {

    // do global copy propagation of singly-assigned PRegs

    fint i;
    for ( i = 0; i < pregTable->length(); i++) {
      PReg* r = pregTable->nth(i);
      if (r)
        r->attemptGlobalCopyPropagate();
    }
  }

  void BBIterator::eliminateUnneededResults() {
    // eliminate nodes producing results that are never used
    // (except for preallocated regs...their uses aren't completely right now)
    fint i;
    for ( i = 0; i < pregTable->length(); i++) {
      PReg* r = pregTable->nth(i);
      if (r && r->hardUses() == 0) {
        r->eliminatePR( false);
      }
    }
  }

  void BBIterator::computeMasks(fint stackLocs, fint nonRegisterArgs) {
    // mark bits for SAPRegs that are live at sends (i.e. expr stack temps)
    fint i;
    for ( i = 0; i < pregTable->length(); i++) {
      PReg* r = pregTable->nth(i);
      if (r && r->isSAPReg() && r->loc != UnAllocated && !isTrashedReg(r->loc))
        r->scope->computeMaskFor((SAPReg*)r, stackLocs, nonRegisterArgs);
    }
  }

  void BBIterator::computeDominators() {
    // Dragon book p. 671
    dominators = new BitVector*[bbCount];
    fint i;
    for (i = 0; i < bbCount; i++) {
      dominators[i] = new BitVector(bbCount);
      dominators[i]->addFromTo(0, bbCount - 1);
    }
    dominators[0]->clear();
    dominators[0]->add(0);

    bool changed = true;
    // since BBs are topologically sorted, one iteration (+ one to check)
    // is usually enough
    while (changed) {
      changed = false;
      for (i = 1; i < bbCount; i++) {
        BB* bb = bbTable->nth(i);
        BitVector* dom = dominators[i];
        dom->remove(i); // so changed doesn't give false alerts
        fint j;
        for ( j = bb->nPredecessors() - 1; j >= 0; j--) {
          changed |= dom->intersectWith(dominators[bb->prev(j)->id()]);
        }
        dom->add(i);
      }
    }
    if (PrintSICDominators) printDominators();
  }

  void BBIterator::printDominators() {
    fint i;
    for ( i = 0; i < bbCount; i++) {
      lprintf("BB%d: ", (void*)i); dominators[i]->print(); lprintf("\n");
    }
  }

  static Node** ott_tt;
  static fint ott_dominated;

  static void optimTT(fint index) {
    // the type test ott_tt[iindex] dominates ott_tt[ott_dominated]; see if the
    // dominated node can be eliminated
    Node* dominator = ott_tt[index];
    Node* dominated = ott_tt[ott_dominated];
    if (dominated == dominator || dominator == NULL) return;

    if (!dominator->isFailureUncommon()) return;

    fint i;
    for ( i = dominator->numTested() - 1; i >= 0; i--) {
      PReg* r = dominator->testedReg(i);
      if (r->isSinglyAssigned()) {
        dominated->simplify(r, dominator->testedType(i));
      }
    }
  }

  void BBIterator::optimizeTypeTests() {
    // a typetest node can be eliminated if it is dominated by another
    // type test for the same value, unless the value could have been
    // assigned between the two nodes

    // not fully debugged yet!  don't use  -Urs 8/94
    FlagSetting fs1(PrintSICTypeTestOpt, true);
    FlagSetting fs2(PrintSICEliminateUnneededNodes, true);
    SICDebug=WizardMode= true;

    Node* tt[bbCount];  // maps BB --> type test in that BB
    ott_tt = tt;
    fint i;
    for (i = 0; i < bbCount; i++) {
      BB* bb = bbTable->nth(i);
      if (bb->last->isTypeTestLike()) {
        tt[i] = bb->last;
      } else {
        tt[i] = NULL;
      }
    }

    // forall type tests
    for (i = 0; i < bbCount; i++) {
      if (tt[i]) {
        ott_dominated = i;
        // forall type tests dominating tt[i]
        dominators[i]->doForAllOnes(optimTT);
      }
    }
  }
    
  void BBIterator::apply(BBDoFn f) {
    for (int32 i = 0; i < bbCount; i++) { f(bbTable->nth(i)); }
  }

  void BBIterator::verify(bool theWoiks) {
    if (!bbTable)
      return;
    if (theWoiks) {
      int32 i;
      for (i = 0; i < bbCount; i++) { bbTable->nth(i)->verify(); }
      if (pregTable) {
        for (i = 0; i < pregTable->length(); i++) {
          if (pregTable->nth(i)) pregTable->nth(i)->verify();
        }
      }
    }
    checkTail();
    checkReturnSomewhere();
  }
  
  void BBIterator::checkTail() {
    // check for code at end that falls into space
    BB* bb = bbTable->last();
    Node* n = bb->last;
    if (n->isExitNode()  ||  n->isRestartNode())
      return;
    if (n->next())
      return;
    fatal("last node has no successor");
  }
  
  void BBIterator::checkReturnSomewhere() {
    // ensure that a return exists somwhere
    // check for code at end that falls into space
    fint i;
    for (i = 0; i < bbCount; i++) {
      BB* bb = bbTable->nth(i);
      for (Node* n = bb->first; n;  n = n->next()) {
        if ( n->deleted  ) {
  }
  else if ( (n->isExitNode()  &&  !n->isDeadEndNode())
             ||   n->isRestartNode())
          return; // found return!
        if (n == bb->last)
          break;
      }
    }
    fatal("no live real return node");
  }
    
    

# endif
