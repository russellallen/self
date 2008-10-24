/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "hprofiler.hh"
# include "_hprofiler.cpp.incl"

HProfiler* hprofiler;

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

// this is an early hierarchical profiler; it is now obsolete (only useful
// for VM performance debugging, at most)

# define MAX_STACK_DEPTH 10000

const char* IndentString = "  ";
const float LeavesCutoff = 0.02;        // whom to list in the leaves section

static AsyncAllocator* pnodeAllocator;
 
typedef void (*pnodeDoFn)(pnode* p);

class pnodeBase {
 public:
  virtual int32 ownTicks() = 0;
  virtual void printSelf(float percent) = 0;

  virtual ~pnodeBase() {};
};

static pnode* newList = NULL;   // list of pnodes with new oops

class pnode : public pnodeBase {      // node in profiled calling tree
public:
  pnode* next;                  // sibling
  pnode* callee;                // methods called by me
  pnode* nextNew;               // for scavenging (pnodes w/new oops)
  oop method;                   // method oop 
  oop selector;
  bool isAccess;
  int32 _ticks[2];              // 0 = self, 1 = vm; includes callees
  int32 _ownTicks[2];           // my own ticks (calculated during sort)

  static char*   prefix;        // line prefix for printing

 
  pnode(oop meth, oop sel, bool isAcc) {
    method = meth; selector = sel; isAccess = isAcc;
    callee = next = NULL;
    _ticks[0] = _ticks[1] = _ownTicks[0] = _ownTicks[1] = 0;
    if (is_new()) {
      nextNew = newList->nextNew; newList->nextNew = this;
    } else {
      nextNew = NULL;
    }
  }

  void* operator new(size_t size) { return pnodeAllocator->async_malloc(size); }
  void  operator delete(void* p)  { pnodeAllocator->async_free(p); }
  void  dealloc();

  void pnodeDo(pnodeDoFn f) {
    f(this);
    if (callee) callee->pnodeDo(f);
    if (next)   next->pnodeDo(f);
  }
  
  void  sort();
  void  addLeaf();
  void  tick(bool self)         {  _ticks[self ? 0 : 1]++; }
  
  bool  equal(nmethod* nm);
  bool  isTop()                 { return this == hprofiler->top; }
  bool  is_new()                { return method->is_new() ||
                                         selector->is_new(); }
  int32 selfTicks()             { return _ticks[0]; }
  int32 vmTicks()               { return _ticks[1]; }
  int32 ticks()                 { return selfTicks() + vmTicks(); }
  int32 ownSelfTicks()          { return _ownTicks[0]; }
  int32 ownVMTicks()            { return _ownTicks[1]; }
  int32 ownTicks()              { return ownSelfTicks() + ownVMTicks(); }
  
  void print(int32 total, float cutoff, float skip, smi maxDepth, bool first);
  void printSelf(float percent);
};

class primPnode : public pnode {      // for primitive leaves: lookup, compile, gc
public:
  // ignore all inherited members -- they're not used
  int32 _ticks;
  char* name;
  bool  included;

  primPnode(char* n, int32 t, bool i) : pnode(0,0,false) {
    name = n; _ticks = t; included = i;}
  void* operator new(size_t size);
  void  operator delete(void* p);
  int32 ownTicks()                      { return _ticks; }
  void  printSelf(float percent);
};

void* primPnode::operator new(size_t size) { return selfs_malloc(size); }
void  primPnode::operator delete(void* p) { selfs_free(p); }


char*  pnode::prefix;
static pnode** leaves;          // used during profile printing
static int32   nleaves;         // # elements in leaves


# if  GENERATE_CODE_TO_AID_DEBUGGING_ALLOC
  static pnode* ref_ptr;
  static pnode* last_ref;
  static void count_ref_fn(pnode* pn) {
    if (pn->next == ref_ptr || pn->callee == ref_ptr) {
      if (last_ref) fatal("has more than one reference to it");
      last_ref = pn;
    }
  }
# endif

void pnode::dealloc() {
# if  GENERATE_CODE_TO_AID_DEBUGGING_ALLOC
    ref_ptr = this;             // wish we had GC...
    last_ref = NULL;
    hprofiler->top->pnodeDo(count_ref_fn);
    lprintf("deleting %#lx ", this);
#endif
  if (callee) callee->dealloc();
  if (next) next->dealloc();
  delete this;
}

static int compare_pn(const void* p1,  const void* p2) {
  pnode** pn1 = (pnode**)p1;
  pnode** pn2 = (pnode**)p2;
  return (*pn1)->ticks() - (*pn2)->ticks();
}

static int compare_pn_leaf(const void* p1,  const void* p2) {
  pnode** pn1 = (pnode**)p1;
  pnode** pn2 = (pnode**)p2;
  return (*pn2)->ownTicks() - (*pn1)->ownTicks();
}

void pnode::sort() {
  // sort all children of this node
  if (!callee) return;
  if (callee->next) {
    ResourceMark rm;
    pnode** pns = NEW_RESOURCE_ARRAY( pnode*, MAX_STACK_DEPTH);
    int32 n = 0;
    pnode* p;
    for ( p = callee; p; p = p->next) {
      pns[n++] = p;
      if (n == MAX_STACK_DEPTH)
        break;
    }
    qsort(pns, n, sizeof(pnode*), compare_pn);
    callee = pns[--n];
    for ( ; n > 0; n--) {
      pns[n]->next = pns[n-1];
    }
    pns[0]->next = NULL;
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        for (p = callee; p->next; p = p->next) {
          assert(p->ticks() >= p->next->ticks(), "not sorted");
        }
      }
#   endif
  }
  _ownTicks[0] = _ticks[0]; _ownTicks[1] = _ticks[1];
  for (pnode* p = callee; p; p = p->next) {
    _ownTicks[0] -= p->_ticks[0]; _ownTicks[1] -= p->_ticks[1]; 
    p->sort();
  }
  assert(ownVMTicks() >= 0 && ownSelfTicks() >= 0, "inconsistent ticks");
}

void printNum(float val) {
  lprintf("%s%*.1f%%   ", pnode::prefix, val >= 99.5 ? 5 : 4, val);
}

void pnode::printSelf(float percent) {
  if (isTop()) return;          // dummy top node
  printNum(percent);
  if (isAccess) {
    printName(NULL, selector);
    lprintf(" (slot accessor)");
  } else {
    printName((methodMap*) method->map(), selector);
  }
  lprintf("\n");
}

void primPnode::printSelf(float percent) {
  printNum(percent);
  lprintf("<%s>", name);
  if (included) {
    lprintf(" (included in tree under <primitives>)\n");
  } else {
    lprintf(" (not included in tree)\n");
  }
}

void pnode::print(int32 total, float cutoff, float skip, smi depth, bool first) {
  if (ticks() >= cutoff) {
    if (ownTicks() >= LeavesCutoff * total) addLeaf();
    printSelf(100.0 * ticks() / total);
    int32 len = strlen(prefix);         // extend prefix string
    strcat(prefix, IndentString);
    if (next && next->ticks() >= cutoff) prefix[len + 1] = '|';
    if (callee && depth > 0) {
      // skip intermediate frames if they contain less than skip ticks
      // but not if this is the top node
      pnode* c = callee;
      if (!isTop()) {
        for ( ; c && c->ticks() > ticks() - skip; c = c->callee) ;
      }
      if (c) c->print(total, cutoff, skip, depth - 1, true);
    }
    if (ownVMTicks() >= cutoff) {
      printNum(100.0 * ownVMTicks() / total);
      lprintf("<primitives>\n");
    }      
    prefix[len] = '\0';
    if (next) next->print(total, cutoff, skip, depth, false);
  } else if (! first) {
    // rest must be below threshold; print if not first callee
    int32 t = 0, vmt = 0;
    for (pnode* pn = this; pn; pn = pn->next) {
      assert(pn->ticks() < cutoff, "not ordered");
      t += pn->ticks(); vmt += pn->vmTicks();
    }
    if (t >= cutoff) {
      printNum(100.0 * t / total);
      lprintf("<all others>\n");
    }
  }
}

void pnode::addLeaf() {
  if (nleaves == MAX_STACK_DEPTH)
    return;
  // add myself to the leaves list
  for (int32 i = 0; i < nleaves; i++) {
    if (leaves[i]->method == method) {
      // already there
      leaves[i]->_ownTicks[0] += _ownTicks[0];
      leaves[i]->_ownTicks[1] += _ownTicks[1];
      return;
    }
  }
  // not there -- add a copy of myself
  leaves[nleaves] = new pnode(method, selector, isAccess);
  *leaves[nleaves] = *this;
  leaves[nleaves]->next = leaves[nleaves]->callee = NULL;
  nleaves++;
}

bool pnode::equal(nmethod* nm) {
  if (selector != nm->key.selector) return false;
  if (nm->isAccess()) {
    return isAccess;
  } else {
    return !isAccess && method == nm->method();
  }
}

void HProfiler::reset() {
  if (top) { top->dealloc(); top= NULL; }
  p = NULL;
  ticks = gcTicks = lookupTicks = compilerTicks = primTicks = 0;
  if (newList) { delete newList; newList= NULL; }
}

// Would be safer to synchronize with Self (wait til next interrupt point)
// but this would distort the profile since primitives wouldn't show up.
// Disadvantage of doing it here: tricky, charges scavenges etc to most
// recent Self activation.
static void htick() { hprofiler->tick(); }

void HProfiler::start(Process* pr) {
  if (p && p != pr) reset();
  p = pr;
  top = new pnode(0, 0, false);    // dummy root
  newList = new pnode(0, 0, false);
  IntervalTimer::CPU_timer()->enroll_async( IntervalTimer::CPU_timer()->ticks_per_second(), htick);
}

void HProfiler::stop() {
  IntervalTimer::CPU_timer()->withdraw(htick);
  p = NULL;
}

nmethod** nms;

void HProfiler::tick() {
  if (!resources.in_consistent_state()) {
    warning("HProfiler::tick() skipping because resource area is not consistent");
    return;
  }
  ResourceMark rm; // needed because new debug info allocates scopeDescs
  if ( currentProcess != p              // our process isn't running
  ||   !p->inSelf() || !p->isRunnable() // newborn or dead process
  ||   MallocInProgress)                // malloc isn't reentrant, 
                                        // scopeDescs may do mallocs
    return;

  ticks++;
  if (GCInProgress) {
    gcTicks++;                          // don't charge individuals for GC
    return;
  }
  if (theCompiler                     // same for compiles
#     ifdef SIC_COMPILER
        || theSIC
#     endif
      ) {
    compilerTicks++;
    return;
  }
  if (ConversionInProgress || processSemaphore) {  
    return;                             // stack/zone may look weird
  }

  bool inSelf = Memory->code->isSelfPC((char*)InterruptedContext::the_interrupted_context->pc());
  top->tick(inSelf);
  
  if (ShowLookupInMonitor::lookup_nesting) {
    lookupTicks++;                      // for leaves list
    assert(!inSelf, "should be C code");
  } else if (!inSelf) {
    primTicks++;                        // for leaves list
  }
  
  
  // collect all nmethods on stack
  // cannot use malloc or resource area since we're executing async to the VM
  frame* f = p->stack()->last_self_frame(true);
  int32 n = 0;
  // XXXX interp?
  if (Memory->code->iZone->contains(InterruptedContext::the_interrupted_context->pc())) {
    // bottommost nmethod may have no frame (e.g. access methods)
    // so it may be omitted from the stack trace
    nmethod* last = findNMethod(InterruptedContext::the_interrupted_context->pc());
    if (last != f->code()) nms[n++] = last;
  }
  for ( ; f; f = f->selfSender()) {
    // XXXX interp?
    if (f->is_compiled_self_frame()) {
      nms[n++] = f->code();
    }
    if (n == MAX_STACK_DEPTH)
      break;
  }

  // update ticks of nmethods that remained on stack since last tick
  n--;
  pnode *pn, *prevpn;
  for (pn = top->callee, prevpn = top;
       pn && n >= 0;
       n--, pn = prevpn->callee) {
    pnode *sibling;
    for (sibling = pn;
         sibling && !sibling->equal(nms[n]);
         sibling = sibling->next) ;
    if (sibling) {
      // found nmethod in tree
      assert(sibling->equal(nms[n]), "not found");
      sibling->tick(inSelf);
      prevpn = sibling;
    } else {
      // a new path starts here
      break;
    }
  }

  // insert new path
  pn = prevpn;
  for ( ; n >= 0; n--, pn = pn->callee) {
    // insert new node at front of callee chain
    pnode* t = pn->callee;
    oop selector  = nms[n]->key.selector;
    bool isAccess = nms[n]->isAccess();
    oop method    = isAccess ? 0 : nms[n]->method();
    pn->callee    = new pnode(method, selector, isAccess);
    pn->callee->next = t;
    pn->callee->tick(inSelf);
  }

  IntervalTimer::CPU_timer()->enable();       // reset tick interval
}

void HProfiler::sort() {
  // sort siblings in descending order
  if (inactive()) return;
  top->sort();
}

void HProfiler::print_hp(float fcutoff, float fskip, smi maxDepth) {
  if (inactive()) return;
  ResourceMark rm;
  lprintf("\n  total ticks: %ld; one tick = %3.2f%%\n\n",
         long(ticks), 100.0 / ticks);
  leaves = NEW_RESOURCE_ARRAY( pnode*, MAX_STACK_DEPTH);
  nleaves = 0;
  top->prefix = NEW_RESOURCE_ARRAY( char, MAX_STACK_DEPTH);
  strcpy(top->prefix, IndentString);
  float cutoff = max(1.0, fcutoff * ticks);
  float skip   = max(1.0, fskip * ticks);
  top->print(ticks, cutoff, skip, maxDepth, true);
  if (gcTicks >= cutoff)
    leaves[nleaves++] = new primPnode("garbage collection", gcTicks, false);
  if (compilerTicks >= cutoff)
    leaves[nleaves++] = new primPnode("compilation", compilerTicks, false);
  if (lookupTicks >= cutoff)
    leaves[nleaves++] = new primPnode("lookup", lookupTicks, true);
  if (primTicks >= cutoff)
    leaves[nleaves++] = new primPnode("primitives w/o lookup", primTicks, true);
  if (nleaves) {
    qsort(leaves, nleaves, sizeof(pnode*), compare_pn_leaf);
    lprintf("\n  leaves:\n");
    for (int32 i = 0; i < nleaves; i++) {
      int32 ownTicks = leaves[i]->ownTicks();
      leaves[i]->printSelf(100.0 * ownTicks / ticks);
      delete leaves[i];
    }
  }
  leaves = NULL;
  top->prefix = NULL;
}

static oop start_cont_p;
static void start_cont() { 
  hprofiler->start(processOop(start_cont_p)->process()); }

static void reset_cont() { hprofiler->reset(); }
static float pnode_cutoff, pnode_skip;
static smi pnode_maxDepth;

static void print_profile_cont() {
  ResourceMark mark;
  hprofiler->sort();
  hprofiler->print_hp(pnode_cutoff, pnode_skip, pnode_maxDepth);
}
  


// memory functions

static void newListDo(pnodeDoFn f) {
  pnode* prev = newList;
  pnode* pn;
  while ((pn = prev->nextNew) != NULL) {
    f(pn);
    if (pn->is_new()) {
      prev = pn;
    } else {
      prev->nextNew = pn->nextNew;      // no longer new -- remove from list
      pn->nextNew = NULL;
    }
  }
}

static oopsDoFn odfn;
static void pnode_oopsDo(pnode* pn) { odfn(&pn->method); odfn(&pn->selector); }
static void pnode_scavenge(pnode* pn) {
  SCAVENGE_TEMPLATE(&pn->method); SCAVENGE_TEMPLATE(&pn->selector); }
static void pnode_gc_mark(pnode* pn) { 
  MARK_TEMPLATE(&pn->method); MARK_TEMPLATE(&pn->selector); }
static void pnode_gc_unmark(pnode* pn) { 
  UNMARK_TEMPLATE(&pn->method); UNMARK_TEMPLATE(&pn->selector); }

static oop pnode_from, pnode_to;
static void pnode_switch_pointers(pnode* pn) {
  if (pn->method == pnode_from) pn->method = pnode_to;
  if (pn->selector == pnode_from) pn->selector = pnode_to;
}
static bool pnode_verify_result = true;
static void pnode_verify(pnode* pn) {
  bool verify_result = true;
  VERIFY_TEMPLATE(&pn->method); VERIFY_TEMPLATE(&pn->selector);
  pnode_verify_result &= verify_result;
}
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


HProfiler::HProfiler() {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  top = NULL;
  reset();
# endif
}

void initHProfiler() {
  if (hprofiler) fatal("only one profiler, please");
  hprofiler = new HProfiler();
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  nms =  NEW_C_HEAP_ARRAY(nmethod*, MAX_STACK_DEPTH);
  pnodeAllocator = new AsyncAllocator(sizeof(pnode), 500);
# endif
}

oop ResetProfile_prim(oop rcvr) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  switchToVMStack(reset_cont);
# endif
  return rcvr;
}

oop Profile_prim(oop p, bool on) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  // start/stop profiling process p 
  if (on) {
    start_cont_p = p;           // recursive - may need lotsa stack space
    switchToVMStack(start_cont);
  } else {
    hprofiler->stop();
  }
# else
  Unused(on);
# endif
  return p;
}


oop PrintProfile_prim(oop rcvr, float cutoff, float skip, smi maxDepth) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  pnode_cutoff = cutoff; pnode_skip = skip; pnode_maxDepth = maxDepth;
  switchToVMStack(print_profile_cont);
# else
  Unused(cutoff); Unused(skip); Unused(maxDepth);
# endif
  return rcvr;
}

void HProfiler::scavenge_contents() {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (!inactive()) newListDo(pnode_scavenge);
# endif
}

void HProfiler::oops_do(oopsDoFn f) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  odfn = f;
  if (!inactive()) top->pnodeDo(pnode_oopsDo);
# else
  Unused(f);
# endif
}

void HProfiler::switch_pointers(oop from, oop to) {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  pnode_from = from; pnode_to = to;
  if (!inactive()) {
    if (from->is_new()) {
      newListDo(pnode_switch_pointers);
    } else {
      top->pnodeDo(pnode_switch_pointers);
    }
  }
# else
  Unused(from); Unused(to);
# endif
}

bool HProfiler::verify() {
  bool r = true;
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (!inactive()) {
    pnode_verify_result = r;  
    top->pnodeDo(pnode_verify); 
    r = pnode_verify_result; 
  }
# endif
  return r;
}

void HProfiler::gc_mark_contents() {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (!inactive()) top->pnodeDo(pnode_gc_mark);
# endif
}

void HProfiler::gc_unmark_contents() {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (!inactive()) top->pnodeDo(pnode_gc_unmark);
# endif
}
