/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef SIC_COMPILER

# pragma implementation "regAlloc.hh"
# include "_regAlloc.cpp.incl"



SICAllocator* theAllocator;

static int compare_pregs(const void* p1,  const void* p2) {
  PReg** r1 = (PReg**) p1;
  PReg** r2 = (PReg**) p2;
  return (*r1)->weight - (*r2)->weight;
}

SICAllocator::SICAllocator() {
  theAllocator = this; 
  globals = 0;
  pairs = new RegisterPairList(100);
  regClasses = new RegisterEqClassBList(50);
  regClasses->append(0);     // make first index be 1, not 0
}

void SICAllocator::allocateToStack(PReg* r) {
  Location l = r->scope->findStackTemp(r);
  r->allocateTo(l);
  if (l >= StackLocations + stackTemps) {
    assert(l == StackLocations + stackTemps, "should increase by one");
    stackTemps++;
  }
  if (PrintSICRegAlloc) {
    lprintf("*SIC-allocating %s (weight %ld, %ld uses/%ld defs)\n",
            r->name(), (void*)r->weight, (void*)r->nuses(), (void*)r->ndefs());
  }
}

bool SICAllocator::allocateConst(ConstPReg* pr, Location preferred) {
  // allocate pr to a register if possible; if preferred != UnAllocated,
  // must allocate to that register
  if (!pr->needsRegister()) return false;
  
  // allocate only to register - allocating to stack makes code slower
  // also, try to move initialization out of loops
  fint depth = pr->scope->loopDepth;
  SCodeScope **scopes= NEW_RESOURCE_ARRAY( SCodeScope*, depth + 1);
  assert(pr->scope->isCodeScope(), "expected non-access scope");
  SCodeScope* s = (SCodeScope*)pr->scope;
  fint i;
  for (i = 0; i < depth && s; i++) {
    assert(s->isCodeScope(), "should be non-access");
    scopes[i] = (SCodeScope*)s;
    fint d = s->loopDepth;
    do { s = s->sender(); } while (s && s->loopDepth == d);
  }
  if (s) {
    scopes[i] = s;
    assert(s->loopDepth == 0, "should have reached top");
  } else {
    // loop wasn't completely inlined
    scopes[i] = theSIC->topScope;
  }
  if (preferred == UnAllocated) {
    for ( ; i >= 0; i--) {
      Location l = scopes[i]->findReg(pr, firstRegisterIndexToUse, incoming);
      if (l != UnAllocated) {
        pr->scope = scopes[i];          // promote to higher scope
        pr->allocateTo(l);
        if (PrintSICRegAlloc) {
          lprintf("*SIC-allocating %s (weight %ld, %ld uses/%ld defs%s)\n",
                  pr->name(),
                  (void*)pr->weight,
                  (void*)pr->nuses(),
                  (void*)pr->ndefs(),
                  i < pr->scope->loopDepth ? "; moved out of loop" : "");
        }
        break;
      }
    }
    if (pr->loc == UnAllocated && PrintSICRegAlloc) {
      lprintf("*not allocating %s (weight %ld, %ld uses/%ld defs)\n",
              pr->name(),
              (void*)pr->weight,
              (void*)pr->nuses(),
              (void*)pr->ndefs());
    }
  } else if (isRegister(preferred)) {
    for ( ; i >= 0; i--) {
      if (scopes[i]->isRegAvailable(pr, preferred, incoming)) {
        pr->allocateTo(preferred);
        return true;
      }
    }
  }
  return pr->loc != UnAllocated;
}

void SICAllocator::allocate(PRegBList* g, RegisterString inc) {
  // simple count-based register allocation
  globals = g; 
  if (SICRegTargeting) handlePairs();

  qsort(globals->data_addr(), globals->length(), sizeof(PReg*),
        compare_pregs);
  assert(globals->isEmpty() ||
         globals->first()->weight <= globals->last()->weight,
         "wrong sort order");

  stackTemps = 0;
  firstRegisterIndexToUse = 0;
  incoming = inc;
  while (nthBit(CalleeSavedRegs[firstRegisterIndexToUse]) & incoming) firstRegisterIndexToUse++;

  while (globals->nonEmpty()) {
    PReg* r = globals->pop();
    assert(r->ndefs() + r->nuses() > 0, "PReg is unused");
    if (r->loc != UnAllocated) {
      assert(r->weight < 0 || r->regClass, "must be targeted register");
      if (isRegister(r->loc)) continue;
    }
    bool wasAllocatedHere = false;      // to avoid extra calls to targetUses()
    if (r->isConstPReg()) {
      allocateConst((ConstPReg*)r);
      wasAllocatedHere = (r->loc != UnAllocated);
    } else if (  r->uplevelW
           ||   (keepUplevelRPRegsInMemory && r->uplevelR)
           ||   (SICDontUseRegs && !(r->isSAPReg() || r->isTempPReg()))) {
      // allocate uplevel-written _local_ vars to stack.
      allocateToStack(r);
      wasAllocatedHere = true;
    } else {
      Location loc = r->scope->findReg(r, firstRegisterIndexToUse, incoming);
      if (loc != UnAllocated) {
        // found a free register 
        r->allocateTo(loc);
        wasAllocatedHere = true;
        if (PrintSICRegAlloc) {
          lprintf("*SIC-allocating %s (weight %ld, %ld uses/%ld defs)\n",
                  r->name(),
                  (void*)r->weight,
                  (void*)r->nuses(),
                  (void*)r->ndefs());
        }
      } else if (r->loc == UnAllocated) {
        allocateToStack(r);
        wasAllocatedHere = true;
      } else {
        // already stack-allocated via register targeting, and we didn't
        // find a free register in our scope
      }
    }
    if (r->loc != UnAllocated && wasAllocatedHere) {
      if (SICRegTargeting) r->targetUses(incoming, false);
      if (r->regClass) {
        // co-allocate other PRegs
        for (PReg* pr = regClasses->nth(r->regClass)->first;
             pr; pr = pr->regClassLink) {
          if ( pr->loc == UnAllocated 
          &&   !(keepUplevelRPRegsInMemory && pr->uplevelR)
          &&   pr->scope->isRegAvailable(pr, r->loc, incoming)) {
            // NB: test for isRegAvailable is necessary; in general, r
            // covers pr, but pr may have been propagated to a higher scope
            pr->loc = r->loc;
            theSIC->check_flushability(pr);
            if (PrintSICRegAlloc) {
              lprintf("*SIC-coallocating %s (weight %ld, %ld uses/%ld defs)\n",
                      pr->name(),
                      (void*)pr->weight,
                      (void*)pr->nuses(),
                      (void*)pr->ndefs());
            }
          }
        }
      }
      // allocate *after* targeting so that register doesn't appear
      // to be taken
      r->scope->allocateReg(r);
      if (r->regClass) {
        // possibly extend range where r->loc is busy
        for (PReg* pr = regClasses->nth(r->regClass)->first;
             pr; pr = pr->regClassLink) {
          if (pr->loc != UnAllocated) pr->scope->allocateReg(pr, true);
        }
      }
    }
  }
}


// PReg methods for register allocation

static PReg* thePReg;           // for targetUse
static PRegBList* targetedRegs;
static RegisterString inc;

// can't easily pass extra args to list iterators - arggh!
class RecursionHack {
 public:
  PReg* saved;
  RecursionHack(PReg* r) { saved = thePReg; thePReg = r; }
  ~RecursionHack() { thePReg = saved; }
};

static void targetUse(PUse* u) {
  Node* n = u->node;
  if (n->isAssignmentLike() && n->hasDest()) {
    assert(n->src() == thePReg, "wrong source");
    PReg* r = n->dest();
    // thePReg is assigned to r; if r is singly-defined, try to allocate
    // it to the same register
    if ( r->loc == UnAllocated 
    &&  !r->uplevelW
    &&  !(SICAllocator::keepUplevelRPRegsInMemory && r->uplevelR)
    &&   r->isSinglyAssigned()
    &&   r->checkEquivalentDefs()) {
      assert(!r->isConstPReg(), "shouldn't be const");
      // ok, we can use the same register if it is available in r's
      // live range
      if (PrintSICRegTargeting) {
        lprintf("*SIC-targetingU %s to %s ", r->name(),
                locationName(thePReg->loc));
      }
      if (r->scope->isRegAvailable(r, thePReg->loc, inc)) {
        r->allocateTo(thePReg->loc);
        if (PrintSICRegTargeting) lprintf("- ok.\n");
        targetedRegs->append(r);
        thePReg->weight = r->weight = -1;
        r->targetUses(inc, true);
      } else {
        if (PrintSICRegTargeting) lprintf("- not available.\n");
      }
    }
  }
}

static void targetU(PRegBBIndex* p) {
  DUInfo* info = p->bb->duInfo.info->nth(p->index);
  info->uses.apply(targetUse);
}



void PReg::targetDef() {
  // try to target the receiver's single definition to the receiver's reg
  DUInfo* info = dus.first()->defUseInfo();
  PDefListElem* e = info->defs.head();
  if (!e) {
    // info not in first elem - would have to search
    if (PrintSICRegTargeting) 
      lprintf("*not targeting %s: def not in first info\n", name());
    return;
  }
  Node* defNode = e->data()->node;
  if (defNode->isAssignmentLike() && defNode->hasSrc()) {
    assert(defNode->dest() == this, "wrong preg");
    PReg* r = defNode->src();
    // r defines the receiver; if r is also singly-assigned, we can
    // target it to our register
    if (r->loc == UnAllocated &&
        r->isSinglyAssigned() && r->checkEquivalentDefs()) {
      if (PrintSICRegTargeting) {
        lprintf("*SIC-targetingD %s to %s ", r->name(), locationName(loc));
      }
      bool ok;
      if (r->isConstPReg()) {
        // need to treat const pregs specially - propagate scope, or
        // maybe doesn't need a register
        ConstPReg* pr = (ConstPReg*)r;
        if (!pr->needsRegister()) {
          if (PrintSICRegTargeting) lprintf("- not necessary.\n");
          return;
        } else {
          ok = theAllocator->allocateConst(pr, loc);
        }
      } else if (r->scope->isRegAvailable(r, loc, inc)) {
        r->allocateTo(loc);
        ok = true;
      } else {
        if (PrintSICRegTargeting) lprintf("- not available.\n");
        ok = false;
      }
      if (ok) {
        if (PrintSICRegTargeting) lprintf("- ok.\n");
        targetedRegs->append(r);
        thePReg->weight = r->weight = -1;
        r->targetUses(inc, true);
      } else {
        if (PrintSICRegTargeting) lprintf("- not available.\n");
      }
    }
  }
}

void PReg::targetUses(RegisterString incoming, bool recursive) {
  // receiver has been register-allocated; try to target other PRegs so that
  // register moves will be eliminated
  if (isSinglyAssigned() && checkEquivalentDefs()) {
    FlagSetting fs(PrintSICRegTargeting,
                   PrintSICRegAlloc || PrintSICRegTargeting);
    RecursionHack h(this);
    if (!recursive) {
      inc = incoming;
      targetedRegs = new PRegBList(10);
    }
    targetDef();        // try targeting my defining PReg
    dus.apply(targetU);         // try targeting my uses
    if (!recursive) {
      // mark the targeted regs as allocated
      while (targetedRegs->nonEmpty()) {
        PReg* r = targetedRegs->pop();
        r->scope->allocateReg(r);
      }
      targetedRegs = 0;
    }
  }
}

RegisterEqClass::RegisterEqClass(PReg* f) {
  first = last = f;
  assert(last->regClassLink == 0, "should be empty");
}

void RegisterEqClass::append(PReg* other) {
  assert(first->regClass && first->regClass == last->regClass,
         "bad regClass");
  assert(last->regClassLink == 0, "should be empty");
  last->regClassLink = other;
  fint c = first->regClass;
  for ( ; last->regClassLink; last = last->regClassLink) {
    last->regClass = c;
  }
  last->regClass = c;
}

void RegisterPair::add() { theAllocator->pairs->append(this); }

static SAPReg* check_lhs = 0;
static bool check_ok = false;

static void checkDef(PDef* u) {
  Node* n = u->node;
  if (check_lhs->slow_isLiveAt(n)) check_ok = false;
}

static void checkDefs(PRegBBIndex* p) {
  DUInfo* info = p->bb->duInfo.info->nth(p->index);
  info->defs.apply((defDoFn)checkDef);
}

void SICAllocator::handlePairs() {
  RegisterPair* p; // moved dcl out of loop so ?#!$ gdb would show it--dmu
  while (pairs->nonEmpty()) {
    p = pairs->pop();
    PReg* rhs = p->rhs;
    SAPReg* lhs = p->lhs;
    if (lhs->loc != UnAllocated || rhs->loc != UnAllocated) continue;
    if (lhs->isUnused()) continue;

    // The following assert used to be present, but tripped
    // on code that seems to work fine, 
    // assert(!rhs->isUnused(), "if rhs is unused, lhs should be, too");
    // so I am replacing it with
    // the following if-test -- dmui 2/97
    if (rhs->isUnused()) continue;

    if (lhs->regClass == rhs->regClass && lhs->regClass)
      continue;  // already handled
    // see if rhs has any defs during lhs' life time
    // rhs has defs if uplevel-assigned and lhs has sends
    // but since uplevelW are stack-allocated anyway... fix this
    if (rhs->uplevelW) continue;
    check_lhs = lhs;
    check_ok = true;
    rhs->dus.apply(checkDefs);
    if (check_ok) {
      // no definitions - allocate to same reg
      if (PrintSICRegTargeting)
        lprintf("*co-allocating %s and %s\n", rhs->name(), lhs->name());
      // note: rhs's live range covers lhs's live range, so make sure allocate
      // rhs first
      rhs->makeSameRegClass(lhs, regClasses);
      // increase weight of rhs to reflect joint use
      rhs->weight += lhs->weight;
    }
  }
}

# endif
