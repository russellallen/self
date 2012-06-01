/* Sun-$Revision: 30.20 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "recompile.hh"
# include "_recompile.cpp.incl"

nmethod* recompilee = NULL;

fint nstages;
fint* compilers;        
static fint* recompileLimits;
static smi* compileCounts;

static const fint MaxStackToLookAt = 100;       // limits depth of stack search
static const fint TicksPerSec = 50;

static SlidingAverage* compileAvg;
static void compileAvgTracker() {
  compileAvg->add(activeCompiler ? 100 / TicksPerSec : 0);
}

void recompile_init() {
  # if defined(SIC_COMPILER)
    # if !defined(FAST_COMPILER)
      # error unsupported: must have nic if have sic
    # endif
    nstages = 2;
  # elif defined(FAST_COMPILER)
    nstages = 1;
  # else
    nstages = 0;
  # endif
  
  compilers=       NEW_C_HEAP_ARRAY(fint, nstages);
  compileCounts=   NEW_C_HEAP_ARRAY( smi, nstages);
  recompileLimits= NEW_C_HEAP_ARRAY(fint, max(0, nstages - 1));
  
  switch (nstages) {
   case 0:  break;
   case 1:
    compilers[0] = NIC;
    break;
   case 2:
    compilers[0] = NIC; compilers[1] = SIC;
    recompileLimits[0] = 10 * K;
    break;
 
  default: fatal("what compiler?");
  }
  for (fint i= 0; i < nstages; i++)
    compileCounts[i]= 0;
  compileAvg = new SlidingAverage(TicksPerSec);
  IntervalTimer::CPU_timer()->enroll_async(TicksPerSec, compileAvgTracker); 
}


# if ( TARGET_ARCH ==  PPC_ARCH  \
||     TARGET_ARCH == I386_ARCH )
  oop DIRecompile_stub(...) { fatal("no DI recompilation"); return NULL; }
# endif


# if defined(SIC_COMPILER)


// this code has grown without reorganization for a while and should probably
// be cleaned up

AbstractRecompilation* theRecompilation;
bool RecompilationInProgress = false;


bool allowedToRecompile() {
  return compileAvg->sum() < MaxCompilationPercentage;
}

// The following funcs are an ad-hoc hack defining the recompilation
// stages; they should be cleaned up.

bool needRecompileCode(fint level) {
  // Called by the compiler to find out if it should generate a check
  // for recompilation.
  assert(level >= 0, "invalid level");
  return level < nstages - 1;
}


fint recompileLimit(fint level) {
  return recompileLimits[min(level, nstages - 2)];
}


fint recompileLevel() {
  return recompilee ? recompilee->level() : -1;
}


fint currentCompiler() {
  if (recompilee == NULL) return compilers[0];

  fint lev = recompilee->level() + 1;
  assert(lev >= 0 && lev <= MaxRecompilationLevels, "invalid level");
  // NB: can be max  because max-level nmethod could get uncommon trap
  lev =  min(lev, nstages - 1);
  if (lev < 0) {
    warning1("incorrect recompilee level %ld", lev);
    lev = min(nstages - 1, 1);  // fix this
  }
  return compilers[lev];
}


void countCompilation() {
  if (recompilee) {
    compileCounts[min(recompilee->level() + 1, nstages - 1)]++;
  } else {
    compileCounts[0]++;
  }
}



class Recompilation;

//----------------------------------------------------------------------

// nvframes are vframes decorated with some extra state; they're canonicalized
// via the recompilation's stack inst var
class nvframe : public compiled_vframe {
 public:
  fint depth;           // distance from top of stack (0 = TOS)
  Recompilation* r;     // my recompilation
 protected:
  nvframe(compiled_vframe* vf, Recompilation* rec, fint n);
 public:
  nvframe(frame* f,   Recompilation* rec, fint n = -1);
  nvframe* sender();
  abstract_vframe* parent();
  abstract_vframe* top();
  bool is_n() { return true; }

# if  GENERATE_DEBUGGING_AIDS
  nvframe* callee();
  bool isParentOf(nvframe* other);
# endif
};

typedef BoundedListTemplate<nvframe*> NVFrameBList;


class RecompileFrame : public ResourceObj {
 public:
  frame* fr;
  nmethod* nm;                  // fr->code()
  sendDesc* sd;                 // fr->send_desc()
  bool monomorphic;             // sd is monomorphic
  fint orig_invocations;        // est. total invocation count of nm
  fint orig_sends;              // nm->nsends()
  fint invocations;             // current invocation est. (for this frame)
  fint sends;                   // sends caused by this frame
  fint cumulSends;              // sends + sends of nested blocks
  bool looping;                 // contains loop (containing current send)

  RecompileFrame(frame* fr);
  bool adjust(RecompileFrame* caller, RecompileFrame* callee);
  void computeSends();
  void print();
};


typedef BoundedListTemplate<RecompileFrame*> RecompileFrameBList;


//----------------------------------------------------------------------


class Recompilation: public AbstractRecompilation {
 public:
  AbstractRecompilation* prevRecompilation;
  bool recursive;               
  frame* lastFrame;             // last Self frame on VM stack (see fixupStack)
  frame* tripFrame;             // frame calling tripNM
  frame* copiedFrame;           // copy of tripFrame (during conversion)
  frame* callerFrame;           // frame calling recompilee
  sendDesc* sd;                 // calling sendDesc
  oop receiver;                 // recompilee's receiver
  NVFrameBList  stack;
  fint rdepth;                  // vf index of recompilee 
  NCodeBase* thing;             // whoever called us (stub or NIC nmethod)
  bool calledFromStub;          // thing->isCountStub()
  nmethod* tripNM;              // nmethod tripping its counter
  nmethod* recompilee;          // nmethod to recompile
  nmethod* newNM;               // recompiled nmethod
  nmethod* prevNM;              // optimized nmethod of previous recompilation
                                // (top-down recompiles)
  char *restartAddr;            // where to resume execution (possibly NULL)
  frame* firstReplaced;         // first (most recent) frame (partly) replaced
                                // by newNM
  frame* lastReplaced;          // last (oldest) frame replaced (at least
                                // partially) by newNM
  frame* origFirstReplaced;     // same as first/lastReplaced,
  frame* origLastReplaced;      // but original frame pointers (not copied)
  frame* block_scope_of_origFirstReplaced; // must cache these
  frame* block_scope_of_origLastReplaced;  // because need them after overwriting
                                           // frame link
  fint nreplaced;               // number of frames completely replaced by
                                // newNM (0 = at least one vframe in tripNM
                                // is not in newNM)
  fint nremaining;              // # of *vframes* not replaced (on-stack repl.)
  char* newSP;                  // SP after on-stack replacement
  char* newPC;                  // continuation PC after on-stack repl.

# if TARGET_ARCH == SPARC_ARCH
  // I'm in the process of porting the SIC to PPC.  I haven't got around
  // to porting this file yet.  For now, I just enclose Sparc-specific
  // code with "# if TARGET_ARCH == SPARCH_ARCH".
  // Once the SIC port is completed, platform-dependent versions of this file
  // will be created. -mabdelmalek 10/02
  sparc_sp* newFramePiece;      // part of frame with newNM = newNM block home
# endif

  Recompilation(frame* f, sendDesc* s, oop r, frame* lf, nmethod* rc,
                frame* tf, bool rec = false, nmethod* prev = NULL);
    
  void doit(char* pc);
  void init(char* pc);
  nmethod* recompile();
  void checkEffectiveness(nmethod* oldNM, nmethod* newNM);
  bool shouldRecompile(nmethod* nm, frame* caller);
  bool shouldNotRecompile(nmethod* nm, frame* caller);
  bool mustNotRecompile(nmethod* nm, frame* caller);
  void doShowStack(fint howMany = 10);
  void setNewTarget(nvframe* nvf);
  void find_break_frame(RecompileFrameBList frames);
  void compute_better_counts(RecompileFrameBList frames);
  void findRecompilee(nmethod* n);
  void findTopRecompilee();
  bool findRecompileeHome(nvframe* vf);
  nvframe* nvframeFromBlock(blockOop block, nvframe* thisFrame);
  void checkForBlockArgs();
  void tryRecompileCaller(nmethod* nm, fint limit, bool blocksAreOK = true);
  void getVScopes();
  const char* replaceOnStack();
  void replaceFrames(fint n, fint diff);
  bool pushFrame(frame* copy);
  void fillValues(frame* newFR);
  void killBlocks();
  bool checkForRemappedBlocks();
  bool checkForActivationMirrors();
  void handleRemappedBlocks();
  void discardNMethods();
  void fixStack();
  void printNewFrames(frame* newFr);
  void noRecompilee()     { recompilee= NULL; }
  bool recompiling_trip() { return rdepth == -1; }
  void finalize() {
    assert(theRecompilation == this, "forgot to call finalize on prev.");
    theRecompilation = prevRecompilation;
  }
};


//----------------------------------------------------------------------


nvframe::nvframe(frame* f, Recompilation* rec, fint n) 
 : compiled_vframe(f) {
  depth = n; r = rec;
  if (n == -1) {
    // find depth
    fint i;
    for (i = r->stack.length() - 1;
         i >= 0 && r->stack.nth(i)->fr > fr;
         i--) ;
    for ( ; i >= 0; i--) {
      nvframe* vf = r->stack.nth(i);
      if (vf->EQ(this)) {
        depth = i;              // found it
        break;
      }
      if (vf->fr < fr) break;   // no point looking further
    }
      
    if (depth == -1) {
      // didn't find a vframe; create new ones
      nvframe* vf;
      if (r->stack.isEmpty()) {
        vf = new nvframe(currentProcess->last_self_frame(true), r, 0);
      } else {
        vf = r->stack.top();
      }
      for (i = r->stack.length() - 1; !vf->EQ(this); i++, vf = vf->sender()) ;
      depth = i;
    }
  }
  assert(depth >= 0, "should have depth");
  if (depth == r->stack.length()) {
    r->stack.append(this);
  } else {
    assert(depth < r->stack.length(), "oops");
  }
  assert(this->EQ(r->stack.nth(depth)), "bad depth");
}


// For vf->bci() below see comment in conversion.cpp copyVFrame()

nvframe::nvframe(compiled_vframe* vf, Recompilation* rec, fint n)
  : compiled_vframe(vf->fr, vf->code, vf->desc, vf->bci()) {
  depth = n; r = rec;
  assert(depth == r->stack.length(), "should be in sequence");
  r->stack.append(this);
}


nvframe* nvframe::sender() {
  if (depth < r->stack.length() - 1) {
    return r->stack.nth(depth + 1);
  } else {
    compiled_vframe* vf = compiled_vframe::sender()->as_compiled();
    return vf ? new nvframe(vf, r, depth+1) : NULL;
  }
}


abstract_vframe* nvframe::parent() {
  compiled_vframe* vf = compiled_vframe::parent()->as_compiled();
  if (vf == NULL) return NULL;
  if (!currentProcess->stack()->contains((char*)vf->fr)) return NULL;
  nvframe* p;
  for (p = sender(); !p->EQ(vf); p = p->sender()) ;
  return p;
}


abstract_vframe* nvframe::top() {
  nvframe* topVF = this;
  while (!topVF->is_top()) topVF = topVF->sender();
  return topVF;
}


# if  GENERATE_DEBUGGING_AIDS
nvframe* nvframe::callee() {
  if (depth > 0) {
    return r->stack.nth(depth - 1);
  } else {
    return NULL;
  }
}


bool nvframe::isParentOf(nvframe* other) {
  do {
    other = other->parent()->as_n();
  } while (other && other->depth < depth);
  assert(!other || other->depth != depth || other == this,
         "nvframe not canonicalized");
  return other == this;
}
#endif


//----------------------------------------------------------------------

RecompileFrame::RecompileFrame(frame* f) {
  fr= f;
  nm= f->code();
  sd= f->send_desc();
  monomorphic= sd == NULL  ||  sd->pic() == NULL;
  orig_invocations= invocations= nm->invocationCount();
  orig_sends= sends= nm->nsends();
  cumulSends= 0;
  looping= false;

  for (abstract_vframe* vf = new_vframe(f);
       vf && vf->fr == f;
       vf = vf->sender()) {
    Map* m= vf->method()->map();
    assert(m->has_code(), "should be a method");
    if (((methodMap*)m)->containsLoop()) {
      looping= true;
      break;
    }
  }

  f= f->selfSender();
  if (f == NULL)
    return;

  // try to get better invocation count from count stub
  sendDesc* s= f->send_desc();
  CountStub* cs= s->countStub();
  if (cs) {
    // NB: s->get_method(0) may be != nm because nm was replaced by
    // recompiled nm, but invocation count is still correct
    invocations= cs->count();
    return;
  }

  CacheStub* pic= s->pic();
  if (pic == NULL)
    return;

  for (fint i= pic->arity() - 1; i >= 0; i--) {
    if (pic->get_method(i) == nm && (cs= pic->countStub(i))) {
      // assert(cs->count() <= invocations + 100, "invocations too small");
      // NB: assertion will fail because e.g. a new NIC nmethod may be 
      // linked into an existing sd)
      invocations= cs->count();
      return;
    }
  }
}


void RecompileFrame::print() {
  lprintf("*(RecompileFrame*)%#lx %-20.20s %s%s%s %5ld/%5ldi %5ld/%5ld/%6ld\n",
          this,
          selector_string(nm->key.selector),
          nm->compiler() == NIC ? " nic " : " ",
          looping ? "L" : " ",
          monomorphic ? "M" : " ",
          (void*)orig_invocations,
          (void*)invocations,
          (void*)orig_sends,
          (void*)sends,
          (void*)cumulSends);
}


static inline fint my_min(fint i, fint j) {
  // make sure that bogus "0 invocations" for optimized nmethods don't screw up
  if (i) {
    return j ? min(i,j) : i;
  } else {
    return j;
  }
}


bool RecompileFrame::adjust(RecompileFrame* caller, RecompileFrame* callee) {
  // try to make invoc. estimates better based on caller/callee info
  // return true if estimate changed
  fint old_inv = invocations;
  if (nm->compiler() == NIC && monomorphic && callee) {
    invocations = my_min(invocations, callee->invocations);
  }
  if (caller && !caller->looping) {
    invocations = my_min(invocations, caller->invocations);
  }
  return old_inv != invocations;
}


void RecompileFrame::computeSends() {
  // compute estimate for # of sends
  if (orig_sends) {
    fint orig = max(invocations, orig_invocations); // could be zero otherwise
    sends = (int)(orig_sends * (float)invocations / orig);
  } else {
    sends = invocations;                // wild guess
  }
}


//----------------------------------------------------------------------

bool showStack = false;


inline void printNM(nmethod* nm) {
  lprintf("%#lx %s%s \"%-25.25s\":%6ld snds %6ld inv %3ld clr\n",
          nm,
          nm->isYoung() ? "Y" : " ",
          nm->compiler() == NIC ? "U" : "S",
          selector_string(nm->key.selector),
          (void*)nm->nsends(),
          (void*)nm->invocationCount(),
          (void*)nm->ncallers());
}


Recompilation::Recompilation(frame* f, sendDesc* s, oop r, frame* lf,
                             nmethod* rc, frame* tf, bool rec, nmethod* prev)
  : stack(100) {
  callerFrame = f; sd = s; receiver = r; lastFrame = lf; 
  recompilee = rc; tripFrame = tf; recursive = rec; prevNM = prev;
  rdepth = -1; // -1 indicates recompilee==tripNM, and tripNM was in prologue
               // or in stub
  thing = NULL;
  tripNM = newNM = NULL;
  newSP = newPC = NULL;
  copiedFrame = NULL;
  firstReplaced = lastReplaced = NULL;
  nreplaced = nremaining = -1; 
  prevRecompilation = theRecompilation;
  theRecompilation = this;
  while (!tripFrame->is_self_frame())
    tripFrame = tripFrame->sender();
}


bool Recompilation::shouldNotRecompile(nmethod* nm, frame* caller) {
  return mustNotRecompile(nm, caller) || nm->shouldNotRecompile();
}


bool Recompilation::mustNotRecompile(nmethod* nm, frame* caller) {
  // answers true if nm must not be recompiled (for non-performance-related
  // reasons)
  if (!caller->is_self_frame() || caller->send_desc()->isPrimCall())
    return true;  // can't recompile yet if invoked by primitive
  return nm->mustNotRecompile();
}


bool Recompilation::shouldRecompile(nmethod* nm, frame* caller) {
  assert(! currentProcess->isUncommon(), "shouldn't call");
  return !shouldNotRecompile(nm, caller) && nm->shouldRecompile();
}


void Recompilation::setNewTarget(nvframe *nvf) {
  recompilee = nvf->code;
  receiver = nvf->receiver();
  callerFrame = nvf->fr->sender();
  rdepth = nvf->depth;
  assert(!callerFrame->send_desc()->isPrimCall(), "must be a send");
  assert(!mustNotRecompile(recompilee, callerFrame),
         "must not recompile this nmethod");
}


bool Recompilation::findRecompileeHome(nvframe* vf) {
  // find the first enclosing scope which needs recompilation
  nvframe* top;
  for (top = vf;
       top && !shouldRecompile(top->code, top->fr->sender());
       top = top->parent()->as_n()) 
    ;
  if (top == NULL) {
    // enclosing scopes are all optimized
    return false;
  }
  // find top vframe within this frame
  while (!top->is_top())
    top = top->sender();
  frame* caller = top->fr->sender();
  if (mustNotRecompile(top->code, caller)) {
    // do not optimize
    return false;
  }
  assert(shouldRecompile(top->code, caller), "just checkin'");
  setNewTarget(top);
  return true;
}


void Recompilation::doShowStack(fint howMany) {
  lprintf("\n");
  printNM(tripNM);
  frame* f = currentProcess->last_self_frame(true);
  for (fint i = 0; i < howMany && f; i++, f = f->selfSender()) {
    printNM(f->code());
  }
}


void Recompilation::findRecompilee(nmethod* nm) {
  // nm has tripped its counter; try to figure out whom to recompile
  // updates receiver
# if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      char buf[sizeof(Recompilation)];
      Recompilation* oldRecomp = (Recompilation*)buf;
      *oldRecomp = *this;
    }
# endif
  recompilee = nm;
  fint nsends = fint(9 * recompileLimits[min(nm->level(), nstages - 2)] / 10);
  fint prev_rdepth;

  // try to find a recompilee; each iteration may walk further up on the stack
  do {
    if (PrintRecompilation2) { lprintf("*trying "); printNM(recompilee); }
    prev_rdepth = rdepth;
    checkForBlockArgs();
    if (prev_rdepth == rdepth) {
      tryRecompileCaller(recompilee, nsends);
    }
  } while (prev_rdepth != rdepth && rdepth < MaxStackToLookAt);

  if (recompiling_trip() && !shouldRecompile(nm, callerFrame)) {
    noRecompilee();
  } 
  else if ( recompilee  &&  recompilee->ncallers() == 1)  {
    // try going up one more step, i.e. inline often-called nmethod into caller
    if (PrintRecompilation2) { lprintf("*trying "); printNM(recompilee); }
    tryRecompileCaller(recompilee, 1, receiver->is_block());
  }
}


nvframe* Recompilation::nvframeFromBlock(blockOop block, nvframe* thisFrame) {
  frame* bs = block->scope(true);
  // NB: block may be dead (receiver is block, but it may not be executing
  // the block method) or from a different process
  if (bs == NULL || !currentProcess->contains(bs))
    return NULL;
  nvframe* f = new nvframe(bs->home_frame_of_block_scope(), this);
  if (f  &&  f->depth - thisFrame->depth > MaxRecompilationDepth)
    return NULL;
  else
    return f;
}


void Recompilation::checkForBlockArgs() {
  // check if the recompilee has any block arguments; and go up to the
  // block's home frame if it seems worth it
  if (callerFrame == NULL || !callerFrame->is_self_frame())
    return;
  nvframe* blockFrame = NULL;
  nvframe* caller = new nvframe(callerFrame, this);
  if (receiver->is_block())
    blockFrame = nvframeFromBlock((blockOop)receiver, caller);
  if (blockFrame == NULL) {
    // look at the args.  NB: get info from caller, because callee may not
    // exist (is in prologue)
    oop* exprStack;
    smi len;
    caller->get_expr_stack(exprStack, len, true);
    methodMap* mm = caller->desc->method_map();
    stringOop selector = mm->get_selector_at(caller->bci());
    char* sel = selector_string(selector);
    fint nargs = str_arg_count(sel);
    for (fint n = 0; n < nargs; n++) {
      // search for a "promising" block arg
      oop arg = exprStack[len - nargs + n];
      if (arg->is_block()) {
        blockFrame = nvframeFromBlock((blockOop)arg, caller);
        if (blockFrame) {
          if (PrintRecompilation2)
            lprintf("*found block arg %ld in %s\n", (void*)(n + 1), sel);
          break;
        }
      }
    }
  }

  if (blockFrame && findRecompileeHome(blockFrame)) {
    // optimize block's parent
    if (PrintRecompilation2) lprintf("   (going up lexical link)\n");
  }
}


void Recompilation::tryRecompileCaller(nmethod* nm, fint limit,
                                       bool blocksAreOK) {
  // try to find out whether n's caller should be recompiled
  frame* callerFrame2 = callerFrame->sender();
  if (!callerFrame2->is_self_frame()) {
    // no caller
    return;
  }
  nmethod* caller = callerFrame->code();
  if (caller->isDI()) {
    if (PrintRecompilation2) lprintf("   (not going up - DI)\n");
    return;
  }
  if (!blocksAreOK) {
    nvframe* top = (new nvframe(callerFrame, this))->top()->as_n();
    if (top->receiver()->is_block()) return;
  }
# ifdef SIC_COMPILER
    if (caller->compiler() == SIC) {
      sendDesc* s = callerFrame->send_desc();
      if (s->isUninlinable()) {
        // the SIC decided this send wasn't inlinable
        if (PrintRecompilation2) lprintf("  (not going up - not inlinable)\n");
        return;
      }
    }
# endif
  fint nsends = caller->nsends();
  if (   (nsends >= limit || nm->isTiny())
      && !shouldNotRecompile(caller, callerFrame2)) {
    nvframe* top = (new nvframe(callerFrame, this))->top()->as_n();
    setNewTarget(top);
  }
}


void Recompilation::compute_better_counts(RecompileFrameBList frames) {
  fint i;
  const fint maxfr= frames.length() - 1;
  for (i= maxfr; i >= 0;  ) {
    RecompileFrame* caller= i < maxfr ? frames.nth(i + 1) : NULL;
    RecompileFrame* callee= i > 0     ? frames.nth(i - 1) : NULL;
    if (frames.nth(i)->adjust(caller, callee) && i < maxfr) {
      i++;
    } 
    else {
      i--;
    }
  }

  int32 cumul= 0;
  for (i= 0; i <= maxfr; i++) {
    RecompileFrame* fr= frames.nth(i);
    fr->computeSends();
    cumul += fr->sends;
    fr->cumulSends= cumul;
  }
    
  if (showStack || PrintRecompilation2) {
    lprintf("\n");
    for (i= maxfr; i >= 0; i--) frames.nth(i)->print();
    lprintf("\n"); 
  }
}


// Find the first frame exceeding 50% of the total send count and having 
// `significantly more' sends than its callee.

void Recompilation::find_break_frame(RecompileFrameBList frames) {
  const float SignificantlyMore = 1.2;
  const fint maxfr= frames.length() - 1;
  fint limit= max(frames.nth(maxfr)->cumulSends / 2, recompileLimits[0]);
  for (fint j= maxfr-1; j >= 0 && frames.nth(j)->cumulSends >= limit; j--) {
    float ratio=
      j > 0
        ? (float)frames.nth(j)->cumulSends / frames.nth(j-1)->cumulSends
        : 0;
    if (ratio >= SignificantlyMore)
      break;
  }
  // go down further if unsuitable for recompilation
  fint i;
  for (i= maxfr;
       i >= 0 && shouldNotRecompile(frames.nth(i)->nm, frames.nth(i + 1)->fr);
       i--)
    ;
  if (i >= 0 && frames.nth(i)->cumulSends >= limit) {
    // found the "break"
    RecompileFrame* fr= frames.nth(i);
    if (PrintRecompilation2) { lprintf("*top-down:\n"); fr->print(); }
    nvframe* top= (new nvframe(fr->fr, this))->top()->as_n();
    setNewTarget(top);
    findRecompilee(recompilee);         // go bottom-up from here
  }
  if (!recompilee) findRecompilee(tripNM);
}


void Recompilation::findTopRecompilee() {
  // find recompilee in top-down fashion (if SICRecompileTopDown); also
  // set recompilee if follow-up recompilation (prevNM != NULL)
  if (!SICRecompileTopDown && prevNM == NULL) return;  // nothing to do

  RecompileFrameBList frames(MaxStackToLookAt);
  fint i = 0;
  // collect the first MaxStackToLookAt stack frames, but if prevNM exists
  // stop at that frame
  for (frame* f = currentProcess->last_self_frame(true);
       f && (i < MaxStackToLookAt || prevNM);
       f = f->selfSender(), i++) {
    RecompileFrame* rf = new RecompileFrame(f);
    frames.append(rf);
    if (rf->nm == prevNM) break; // should this check rdepth? not sure -- miw
  }
  
  if (prevNM == NULL && SICRecompileTopDown) {
    // first recompilation of this series

    compute_better_counts(frames);

    find_break_frame(frames);

  } 
  else {
    // recompile frame below prevNM
    assert(prevNM, "should have prevNM");
    fint j = frames.length() - 1;
    assert(frames.nth(j)->nm == prevNM, "oops");
    // go down further if unsuitable for recompilation
    for ( --j; 
          j >= 0   &&  shouldNotRecompile(frames.nth(j)->nm, frames.nth(j+1)->fr);
              --j) ;
    if (j >= 0) {
      nvframe* top = (new nvframe(frames.nth(j)->fr, this))->top()->as_n();
      if (PrintRecompilation2) { lprintf("*top-down2: "); printNM(top->code); }
      setNewTarget(top);
    } 
    else {
      // no recompilee
    }
  }
}


inline void verifyAfterRecompile(char* cont, char* pc) {
  # if TARGET_ARCH == SPARC_ARCH
    assert( Byte_Map_Base() == Memory->remembered_set->byte_map_base(),
           "byte map base reg corrupted");
    assert (Byte_Map_Base() == (char*)saved_globals[ByteMapBaseReg - G0],
           "saved_globals for byte map base reg corrupted");
    assert( (char*)saved_globals[SPLimitReg - G0] == currentProcess->stackEnd()
    ||      (char*)saved_globals[SPLimitReg - G0] == currentProcess->spLimit(),
            "saved_globals for splimit reg corrupted");
  # endif
  if (VerifyAfterRecompilation) {
    bool safe = cont != NULL;
    if (! safe) {
      sendDesc* sd = sendDesc::sendDesc_from_return_PC(pc);
      if (   isCall((int32*)sd->call_instruction_addr()) 
          && (   !sd->isPrimCall()
              || (   sd->isPrimCall()
                  && getPrimDescOfFirstInstruction(sd->jump_addr(),
                                                   true)->canScavenge()))) {
        safe = true;
      }
    }
    if (safe) Memory->verify();
    for (frame* f = currentProcess->last_self_frame(true);
         f;
         f = f->selfSender()){
      if (f->code()->isInvalid() && !f->is_patched()) {
        fatal1("frame %#lx: should be patched", f);
      }
    }
  }
}


class RecompBuf {
 public:
  sendDesc* sd;
  frame* callerFrame;
  oop receiver;
  char* diChild;
  char* caller;
  void fill(sendDesc* s, frame* cf, oop r, char* d, char* c) {
    sd = s; callerFrame = cf; receiver = r; diChild = d; caller = c; }
};


// change whole thing for interp! XXX - dmu

static char* continueRecompile2(RecompBuf* buf, frame* last) {
  char *pc, *sp, *cont;
  nmethod* prevNM = NULL;
  frame* lastReplaced = NULL; // last (oldest) frame affected by recompile
  FlushRegisterWindows();       // make sure last & above is flushed to stack
  assert(!currentProcess->restartAfterConversion, "shouldn't be set");

  // NB: don't use needsWork/doWork because that could move nmethods, thus
  // invalidating the pointers in buf
  if (Memory->code->needsSweep()) Memory->code->doSweep();
  
  if (buf->callerFrame->is_self_frame()) {
    OutgoingArgsOfReturnTrapOrRecompileFrame = buf->callerFrame->extract_outgoing_args();
    assert(!SaveOutgoingArgumentsOfPatchedFrames
    ||     buf->callerFrame->sendee()->return_addr() == (char*)&  Recompile_stub_returnPC
    ||     buf->callerFrame->sendee()->return_addr() == (char*)&DIRecompile_stub_returnPC
    ||     buf->callerFrame->sendee()->return_addr() == (char*)&    MakeOld_stub_returnPC,
            "ensure patched_frame_saved_outgoing_args() will work");
  }

  fint i;
  for (i = 0; true; i++) {
    ResourceMark rm;
    Recompilation recomp(buf->callerFrame, buf->sd, buf->receiver, last, NULL,
                         last, false, prevNM);
    { BlockProfilerTicks bpt(exclude_recompile);
      FlagSetting f1(RecompilationInProgress, true);
      FlagSetting f2(PrintCompilation, PrintCompilation || PrintRecompilation);
      // NB: recompilee could be called from VM; e.g. Eval or UnwindProtect
      // assert(buf->callerFrame->is_self_frame(), "should be a Self frame");
      if (buf->diChild) fatal("fix this - DI not implemented");
      recomp.recompilee = ::recompilee;
      assert(isOnVMStack(last), "should be on VM stack");
      if (PrintRecompilation) lprintf("*%d: ", (void*)i);
      recomp.doit(buf->caller);
      recomp.finalize();
    }
    cont= recomp.restartAddr;
    if (cont) {
      if (i == 0) {
        pc = cont;      // first comp., no on-stack replacement
      } else {
        cont = NULL;    // previous recomp set newPC...don't set them again
      }
      break;
    }
    // was on-stack replacement
    pc = recomp.newPC; sp = recomp.newSP;
    if (!lastReplaced) {
      // remember oldest frame affected by recompilation
      for (lastReplaced = last;
           lastReplaced->code() != recomp.newNM;
           lastReplaced = lastReplaced->sender()) ;
      while (isOnVMStack(lastReplaced)) {
        lastReplaced = lastReplaced->sender();
      }
    }
    if (   !SICMultipleRecompilation
        || recomp.nremaining == 0
        || !allowedToRecompile()) {
      // stop recompiling
      break;
    }
    // set up next recompilation
    buf->callerFrame= last->selfSender();
    buf->sd= buf->callerFrame->send_desc();
    buf->receiver= new_vframe(last)->top()->receiver();
    buf->caller= recomp.newPC;
    prevNM= recomp.newNM;
  }

  // at this point, (cont != NULL) == there was no on-stack replacement
  processes->convert();
  verifyAfterRecompile(cont, pc);
  
  nmethod* continueNM = nmethod::findNMethod(pc);
  if (ScavengeAfterRecompilation) Memory->need_scavenge();
  assert(currentProcess->verifyFramePatches(), "patching bug");
  OutgoingArgsOfReturnTrapOrRecompileFrame = NULL;
  
  if (continueNM->isInvalid()) {
    // the current nmethod belongs to a block that was invalidated because its
    // home was recompiled, or it was invalidated because the sendDesc size
    // changed (mh bogusness)
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
        frame* f = currentFrame();
        while (!f->is_compiled_self_frame()) f = f->sender();
        assert(f->currentPC() == pc, "currentPC should be set");
        assert(f->is_patched(), "frame should be patched");
    }
#   endif
    // deoptimize the frame and continue execution
    // (we'll fall into [PrimCall]ReturnTrap)
    currentProcess->restartAfterConversion = true;
    LOG_EVENT("Continue into [PrimCall]ReturnTrap");
    return NULL;        
  } 
  else if (cont) {
    assert(i == 0, "shouldn't be here");
    LOG_EVENT1("Continue normally, cont = %#lx", cont);
    return cont;        // no on-stack replacement, continue normally
  } 
  else {
    LOG_EVENT2("ContinueAfterRecompilation pc=%#lx sp=%#lx", pc, sp);
#   if TARGET_ARCH == SPARC_ARCH
      ContinueAfterReturnTrap(pc, sp);
#   elif TARGET_ARCH ==  PPC_ARCH  \
     ||  TARGET_ARCH == I386_ARCH
      fatal("xxx unimp mac, unimp intel: where is result?");
      // ContinueAfterReturnTrap(result, pc, sp);
#   else
#     error what machine?
#   endif
  }
  ShouldNotReachHere();
  return NULL;
}


static char* continueRecompile(RecompBuf* buf) {
  // make an additional call to get extra frame on VM stack for fixStack
  return continueRecompile2(buf, currentFrame());
}


char* Recompile(sendDesc* sd, frame* callerFrame, oop receiver,
                char* diChild, char* caller) {
  // this activation may be overwritten during recompilation, so continue
  // on VM stack
  FlushRegisterWindows();
  assert(Byte_Map_Base() == Memory->remembered_set->byte_map_base(),
         "byte map base reg corrupted");
  static RecompBuf buf; // must be static (or else it might be overwritten)
  buf.fill(sd, callerFrame, receiver, diChild, caller);
  char* r = (char*)switchToVMStack((fntype)continueRecompile, &buf);
  assert(r != (char*)sd, "not supposed to happen");
  return r;
}


nmethod* also_Recompile( sendDesc* send_desc,
                         compilingLookup* L,
                         nmethod* reCompilee) {
  assert(isOnVMStack(currentFrame()), "should be on VM stack");
  if (reCompilee->isAccess()) return reCompilee;
  if (!allowedToRecompile()) return reCompilee;
  frame* vmfr = currentProcess->stack()->last_self_frame(true);
  FlagSetting fs1(SICMultipleRecompilation, false);
  FlagSetting fs2(SICReplaceOnStack, false);
  FlagSetting fs3(PrintCompilation, PrintCompilation || PrintRecompilation);
  FlagSetting fs4(InlineCache, false);
        // because inline caching will be done by calling lookup routine
  Recompilation recomp(L->sendingVFrame->fr,
                       send_desc,
                       L->receiver,
                       vmfr,
                       reCompilee, vmfr);
  recomp.doit(reCompilee->insts());
  recomp.finalize();
  nmethod* nm= nmethod::findNMethod(recomp.restartAddr); // why not just save nmethod? xxx miw
  if (nm == reCompilee) { // xxx miw
    // may not have been optimized, e.g. because of DI; force optimization
    FrameChainer fc(Memory->code);
    reCompilee->flush();
    nm = NULL;
  }
  return nm;
}


void Recompilation::init(char* pc) {
  thing = findThing(pc);        // caller thing (nmethod or count stub)
  calledFromStub= thing->isCountStub();
  if (calledFromStub) {
    CountStub *cs= (CountStub*)thing;
    assert(    cs->sd() == sd
           ||  cs->pic() && cs->pic()->sd() == sd,
           "sds don't match");
    tripNM= cs->target();
    restartAddr= tripNM->entryPointFor(sd);
  } else {
    assert(thing->isNMethod(), "should be a nmethod");
    if (currentProcess->isUncommon()) {
      // uncommon trap - recompilee already decided
      assert(recompilee, "should have a recompilee");
      tripNM = recompilee;
      // make stack look as if trap called us
      lastFrame = tripFrame = currentProcess->last_self_frame(true);
    } else {
      tripNM = (nmethod*)thing;
      assert(   SICMultipleRecompilation
             || recursive
             || tripNM->compiler() == NIC,
             "should be a NIC method");
    }
    restartAddr= tripNM->verifiedEntryPoint();
  }
  assert(tripNM->isNMethod(), "should be a nmethod now");
  if (PrintRecompilation)
    lprintf("*%srecompiling: tripNM = %#lx (%s)",
           currentProcess->isUncommon() ? "uncommon-" : "", tripNM, tripNM->key.selector_string());

  if (recompilee) {
    // already decided what to recompile (e.g. uncommon branch)
    // compute rdepth
    nvframe* vf = (new nvframe(lastFrame, this))->top()->as_n();
    while (vf && vf->code != recompilee) { // xxx miw
      vf = vf->sender();
      if (vf) vf = vf->top()->as_n();
    }
    // vf==NULL => recompilee must be callee of last_self_frame
    rdepth= vf ? vf->depth : -1; 
  } else {
    if (!allowedToRecompile()) {
      if (PrintRecompilation) lprintf(" (%CPU exceeded)");
      return;
    } else if (calledFromStub) {
      CountStub* cs= (CountStub*)thing;
      if (cs->count() < recompileLimit(tripNM->level())) {
        if (PrintRecompilation) lprintf(" (counter decayed)");
        return;
      }
    }
    findTopRecompilee();
    if (recompilee == NULL) {
      if (showStack || PrintRecompilation2) doShowStack();
      findRecompilee(tripNM);
      assert(!recompilee || !mustNotRecompile(recompilee, callerFrame),
             "oops");
    }
  }

  if (recompilee && recompilee->isAccess()) {
    noRecompilee(); // don't recompile access methods
  }

  if (tripNM != recompilee && useCount[tripNM->id] > 0) { //xxx miw
    // give the tripNM another chance to get recompiled (esp. since it
    // could be uncommon)
    useCount[tripNM->id] = ClearTripNMUseCount ? 0 : useCount[tripNM->id] / 2;
  }
}
  

void Recompilation::doit(char* pc) {
  init(pc);

  EventMarker em( "recompiling %#lx: %#lx --> %#lx", tripNM, NULL, NULL);

  if (Interpret) return; // XXXX no recompile for interp for now -- dmu
  if (recompilee == NULL) {
    if (PrintRecompilation) lprintf(": no recompilee\n");
    if (calledFromStub) {
      ((CountStub*)thing)->set_count(0);
    }
    return;
  } 
  if (PrintRecompilation) lprintf(", recompilee = %#lx", recompilee);
  FrameChainer fc(Memory->code);
  newNM = recompile();
  em.event.args[1] = recompilee; em.event.args[2] = newNM; 
  ::recompilee = NULL;
  recompileeVScopes = NULL;
  if (recompilee == NULL) return; // couldn't recompile (e.g. DI)
  
  checkEffectiveness(recompilee, newNM);
  recompilee->unlink_saved_frame_chain();

  if (newNM != tripNM && UsePICRecompilation) { // xxx miw
    // Link the new method into the inline caches linked to the
    // recompilee.  Necessary to preserve type info of these
    // methods.

    if (recompilee->reusable()) {
      // If old method was reusable, cannot redirect linked sends from old,
      // generic NIC method to new, specialized SIC method: may be wrong
      // context.  Also, do not want to throw away reusable nmethods.
      recompilee->remove_me_from_inline_cache();
    } else {
      recompilee->forwardLinkedSends(newNM);
      recompilee->flush();      // no longer need its PICs
    }
  }
  
  const char* msg = replaceOnStack();
  if (msg == NULL) {
    // replaced on stack
    restartAddr= NULL;
    return; 
  }
  if (PrintRecompilation && SICReplaceOnStack) {
    lprintf("*not replacing on stack: %s\n", msg); 
  }
  LOG_EVENT1("*not replacing on stack: %s", msg);
  if (recompiling_trip()) {
    // continue with new (optimized) version
    restartAddr= calledFromStub
                 ? newNM->entryPointFor(sd)
                 : newNM->verifiedEntryPoint();
  } else {
    // didn't change the method which actually overflowed its counter
  }
}


nmethod* Recompilation::recompile() {
  nmethod* new_nm = NULL;
  if (   recompiling_trip()
      && receiver->map() != recompilee->key.receiverMap()
      && calledFromStub
      && ((CountStub*)thing)->jump_addr() != tripNM->verifiedEntryPoint()) {
    // The lookup would have missed in the inline cache if it hadn't
    // triggered recompilation.  Try again later (need correct receiver
    // oop below)
    CountStub* cs= (CountStub*)thing;
    cs->set_count(cs->count() - 1);
    if (PrintRecompilation) lprintf(" -- NOT recompiled (will miss)\n");
    noRecompilee();
    return tripNM;
  }
  if (recompilee->isUncommon()) {
    fatal("uncommon branches shouldn't be recompiled");
  } 
  if (recompilee != tripNM) { // xxx miw
    tripNM->save_unlinked_frame_chain(); // protect n from being flushed
  }
  if (recompilee->isDI()) {
    // for now, don't recompile DI methods
    // The problem is that the state of the DI parents can be different
    // from the original state, so that the recompiled method tests
    // for different parent(s) than the recompilee, screwing up the
    // whole di chain (possibly leading to endless recompiles).
    // To solve this, we should probably pass in the recompilee's
    // parent maps to the recompiler.   -Urs

    // to achieve at least something, mark sendDesc as optimized
    sendDesc* s = callerFrame->send_desc();
    s->setOptimized();
    s->unlink();
    
    noRecompilee();
    if (PrintRecompilation) lprintf(": not recompiling because of DI\n");
    tripNM->unlink_saved_frame_chain();
    return tripNM;
  } 
  else {
    recompilee->flushPartially();
    // recompilation: recompilee is still in sd, tell lookup not to put
    // new nmethod in there
    // also, with uncommon trap in recursive nmethods, sendDesc could be
    // bound twice to same nmethod if InlineCache were true
    FlagSetting fs(InlineCache, false);
    
    getVScopes();
    sendDesc* s = callerFrame->send_desc();
    oop selector = recompilee->key.selector;
    oop delegatee = recompilee->key.delegatee;
    abstract_vframe* sendingVFrame = new_vframe(callerFrame);
    oop smh = sendingVFrame->methodHolder_object();
    ::recompilee = recompilee;
    
    // don't use SendMessage (has ResourceMark which may corrupt markers
    // constructed by compiler); also, don't use stack allocation for L
    // because top scope refers to it (key)
    cacheProbingLookup* L =
      new cacheProbingLookup( receiver,
                              selector,
                              delegatee,
                              smh,
                              new_vframe(callerFrame),
                                      // windows already flushed
                              s,
                              NULL,   // DIDesc
                              false); // don't want debug version

    new_nm = s->lookup_compile_and_backpatch(L);
    
/* The map test may fail due to a programming change and has been
   disabled, Lars 1/26/94
#  if GENERATE_DEBUGGING_AIDS
   assert(    (recursive || SICMultipleRecompilation)
           && new_nm->key.receiverMapOop()->equal(recompilee->key.receiverMapOop())
        || new_nm->key == recompilee->key,
        "keys don't match");
#  endif
*/
  }

  if (recompilee != tripNM) { // xxx miw
    tripNM->unlink_saved_frame_chain();
  }
  if (PrintRecompilation) lprintf("\n");
  if (new_nm && nstages > 1 && new_nm->version() < MaxVersions)
    new_nm->flags.isYoung= 1;
  return new_nm;
}


void Recompilation::checkEffectiveness(nmethod* oldNM, nmethod* new_nm) {
  // new_nm is a recompiled version of oldNM; try to catch cases where
  // recompilation didn't get us anything and prevent further recompilation
  assert(oldNM != new_nm, "nmethods should differ");
  addrDesc* a1 = oldNM->locs(), *aend1 = oldNM->locsEnd();
  addrDesc* a2 = new_nm->locs(), *aend2 = new_nm->locsEnd();
  // check if the two nmethods have the same sendDescs
  for  ( ; a1 < aend1 && a2 < aend2; a1++, a2++) {
    for ( ; a1 < aend1 && !a1->isCall(); a1++, a2++) ;
    if (a1 >= aend1) {
      if (a2 < aend2) return;   // not the same
      break;
    }
    if (a2 >= aend2 || !a2->isCall()) return;
    if (a1->isPrimitive() != a2->isPrimitive() ||
        a1->isSendDesc()  != a2->isSendDesc()) return;
    if (!a1->isSendDesc()) continue;
    sendDesc* sd1 = a1->asSendDesc(oldNM);
    sendDesc* sd2 = a2->asSendDesc(new_nm);
    LookupType l1 = sd1->lookupType();
    if (l1 != sd2->lookupType()) return;
    if (   !isPerformLookupType(l1)
        && sd1->selector() != sd2->selector())
      return;
  }
  // ok, they have the same sendDescs; make sure all sendDescs are non-counting
  if (PrintRecompilation)
    lprintf("*recompilation ineffective (%#lx)!\n", new_nm);
  for (a2 = new_nm->locs(); a2 < aend2; a2++) {
    if (a2->isSendDesc()) {
      a2->asSendDesc(new_nm)->setCounting(NonCounting);
    }
  }
  if (oldNM->version() == MaxVersions - 1) {
    new_nm->setVersion(MaxVersions);
  } else {
    // bump version counter by an extra generation, but don't set to max --
    // could have been ineffective because we recompiled too early
    new_nm->setVersion(min(new_nm->version() + 1, MaxVersions - 1));
  }
}


void Recompilation::getVScopes() {
  assert(recompileeVScopes == NULL, "shouldn't be set");
  if (!SICReplaceOnStack) return;
  VScopeBList* vscopes = new VScopeBList(50);
  abstract_vframe* stop = new_vframe(callerFrame);
  VScope* prev = NULL;
  for (abstract_vframe* vf = new_vframe(currentProcess->last_self_frame(true));
       !vf->EQ(stop);
       vf = vf->sender()) {
    vscopes->push(prev = new VScope(vf, prev));
  }
  if (vscopes->isEmpty()) {
    // stopped in prologue - replacing on stack is trivial
    vscopes = NULL;
  }
  recompileeVScopes = vscopes;
  markers = vscopes ? new MarkerNodeBList(vscopes->length()) : NULL;
}


const char* Recompilation::replaceOnStack() {
  // try to replace unoptimized nmethods on stack with new nmethod
  // return NULL if successful, error string if not
  if (!SICReplaceOnStack) return "!SICReplaceOnStack";
  if (currentProcess->isUncommon()) {
    // frame::adjust_blocks will fail (no sendDesc, no reg. mask)
    return "not possible yet (uncommon branch)";
  }
  if (   recompiling_trip()
      && !currentProcess->isUncommon()
      && new_vframe(callerFrame)->is_prologue()) {
    return "not necessary (at beginning of nmethod)";
  }
  if (recompilee == NULL) return "no recompilee";
  if (!isReplacementSimple) return "not simple";

  if (!activeMarker || !activeMarker->active)
    return "no active marker";


  // added tripNM == recompilee qualification to assert below
  //  because sd is the tripping sd, so if the recompilee is up
  //  the stack, this assertion is meaningless -- dmu 5/96

  assert( tripNM != recompilee
      ||     sd->endOffset(sd->lookupType()) 
          == sd->endOffset(newNM->key.lookupType),
         "lookupType changed");


  if (rdepth > MaxStackToLookAt) return "rdepth too big";

  sendDesc* s = NULL;
  nremaining = rdepth - activeMarker->depth();
  if (nremaining > 0) {
    // didn't inline everything; make sure we can find sendDesc
    // XXXX interp?
    s = activeMarker->send_desc(newNM);
    if (s == NULL) return "can't find sendDesc";
  }

  // now check for C frames between tripFrame and recompilee's frame
  fint nframes = 0;
  for (frame* f = tripFrame; f != callerFrame; f = f->sender(), nframes++) {
    if (!f->is_self_frame()) {
      return "C frame inbetween";
    }
  }
  nframes--;

  if (nremaining > 0) {
    // find top frame not replaced by optimized nmethod
    abstract_vframe* vf = new_vframe(tripFrame);
    for (fint i = 1; i < nremaining; i++) vf = vf->sender();
    if (!vf->is_top()) return "stopped inlining in middle of existing frame";
    // too complicated -- e.g. pushFrame() and block remapping would have to be
    // rewritten to handle partially-replaced firstReplaced frame
  }

  if (checkForRemappedBlocks()) {
    return "potential trouble with remapped blocks";
  }

  if (checkForActivationMirrors()) {
    return "potential trouble with activation mirrors";
  }

  if (PrintSICReplacement) {
    lprintf("**old vframes (unoptimized):\n");
    // make sure stack[rdepth+1] exists
    nvframe* vf = stack.nth(rdepth)->sender();
    for (fint i = 0; i <= rdepth + 1; i++) {
      stack.nth(i)->print_frame(i);
    }
  }
  // write current state to event log (for debugging)
  for (fint i = 0; i <= rdepth; i++) {
    nvframe* vf = stack.nth(i);
    LOG_EVENT2("*old frame: fr=%#lx, sender=%#lx", vf->fr, vf->fr->sender());
    LOG_EVENT3("*old frame: sel=%#lx, nm=%#lx, pc=%#lx",
               vf->selector(), vf->code, vf->fr->return_addr());
  }
  FlagSetting fs(ConversionInProgress, true);
  replaceFrames(nframes, nremaining);
  fillValues(lastFrame);

  if (nremaining > 0) {
    // didn't inline everything; find sendDesc and copy the remaining
    // unoptimized frames back to the stack
    LOG_EVENT1("setting newPC from sd: %#lx", s);
    newPC = (char*)s;
    fixStack();         // for better debugging
    frame **frames= NEW_RESOURCE_ARRAY( frame*, nframes);
    frame* fr = copiedFrame;
    fint j;
    for (j = 0; fr != firstReplaced; j++, fr = fr->sender()) {
      frames[j] = fr;
    }
    assert(j <= nframes, "went too far");
    bool needsPatching= false;
    for (--j ; j >= 0; j--) {
      needsPatching |= pushFrame(frames[j]);
    }
    if (needsPatching)
      currentProcess->convert();
  }
  killBlocks();
  handleRemappedBlocks();
  if (PrintSICReplacement) printNewFrames(lastFrame);
  discardNMethods();
  return NULL;
}


void Recompilation::replaceFrames(fint nframes, fint diff) {
  // copy the old frames

  frame* frameToCopy = tripFrame->make_full_frame_on_user_stack();

  if (frameToCopy != tripFrame)
    assert(recursive || SICMultipleRecompilation, "shouldn't normally happen");
  
  copiedFrame = frameToCopy->copy(nframes, true);
  if (!copiedFrame) fatal("couldn't copy frame");

  // find frame range that will be replaced by new frame
  if (diff > 0) {
    // didn't inline everything
    frame* f = copiedFrame;
    // find top frame not replaced by optimized nmethod
    abstract_vframe* vf = new_vframe(copiedFrame);
    fint i;
    for (i = 1; i < diff; i++) vf = vf->sender();
    firstReplaced = vf->sender()->fr;
    for (i = 0; f != vf->fr; i++, f = f->sender()) ;
    assert(i <= nframes, "went too far");
    nreplaced = nframes - i;
    if (!vf->is_top()) {
      nreplaced--;      // didn't completely replace last frame
      ShouldNotReachHere();     // not implemented yet
    }
    origFirstReplaced = frameToCopy;
    for (origFirstReplaced = frameToCopy, f = copiedFrame;
         f != firstReplaced;
         origFirstReplaced = origFirstReplaced->sender(), f = f->sender()) ;
  } else {
    firstReplaced = copiedFrame;
    nreplaced = nframes + 1;
    origFirstReplaced = frameToCopy;
  } 

  lastReplaced = firstReplaced;
  origLastReplaced = origFirstReplaced;
  for (fint i = nreplaced; i > 1; i--) {
    lastReplaced = lastReplaced->sender();
    origLastReplaced = origLastReplaced->sender();
  }
  assert(lastReplaced->code()->method() == newNM->method(), "wrong frame");
  
  block_scope_of_origFirstReplaced = 
    origFirstReplaced->block_scope_of_home_frame();
  block_scope_of_origLastReplaced = 
    origLastReplaced->block_scope_of_home_frame();

  // pop off the frames to be replaced
# if TARGET_ARCH != SPARC_ARCH
  // sorry - right now this code is machine-dependent;
  fatal("unimp");
# else
  // create new frame and initialize FP/PC

  // XXX This creates a newFramePiece as does push_new_sp.
  //  So we should factor them later.
  //  Also this object seems to include redundant instance vars.
  
  assert( callerFrame->my_sp()->as_oops() ==
          callerFrame->callees_sp()->as_oops() + recompilee->frameSize(),
          "I simplified, and want to check that this works --dmu");
  
  char* addr = callerFrame->real_return_addr();
  sparc_fp* link = callerFrame->callees_sp()->link();
  
  newFramePiece = (sparc_sp*) (callerFrame->my_sp()->as_oops()
                               - newNM->frameSize());
  callerFrame = newFramePiece->as_callers_frame();
  
  newSP = (char*)newFramePiece;
  newPC = newNM->insts() + activeMarker->pcOffset;

  LOG_EVENT1("setting newPC from active marker: %#lx", newPC);

  // NULL out frame (needed for stack temps)
  //  Why? XXX -- dmu
  set_oops(newFramePiece->as_oops(),  newNM->frameSize(),  0);
  
  newFramePiece->set_link(link);
  newFramePiece->set_return_addr(addr);

  fixStack();

  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      // make things break quickly if locations remain uninitialized
      lastFrame->zap(0, RegisterLocator::for_frame(lastFrame));      // FYI: this zaps with 0x1, not UNINITIALIZED
      if (nremaining == 0) {
        LOG_EVENT("zapping global regs");
        const oop UNINITIALIZED = (oop)0xfffffffd;
        for (fint ii = 0; ii < NumTempRegs; ii++) {
          Location r = TempRegs[ii];
          if (r <= G7) {
            assert(r >= G0, "oops");
            saved_globals[r - G0] = UNINITIALIZED;
          } else {
            assert(O0 <= r && r < O7, "oops");
            // can't alway zap out regs since out regs of current send are not
            // described by activeMarker
            // saved_outregs[r - O0] = UNINITIALIZED;     
          }
        }
      } else {
        // must not overwrite regs - needed by remaining frame
      }
    }
  # endif // GENERATE_DEBUGGING_AIDS
# endif // TARGET_ARCH == SPARC_ARCH
}


void Recompilation::discardNMethods() {
  // flush all nmethods that were replaced on stack
  // HACK: force unchaining of frames to see if any of the nmethods can
  // be discarded (necessary because stack manipulations mess up the
  // frame chains)
  if (recursive) return;
  fint nesting = zone::frame_chain_nesting;
  zone::frame_chain_nesting = 1;
  Memory->code->unchainFrames();
  frame* f;
  for (f = copiedFrame; true; f = f->sender()) {
    f->code()->clear_frame_chain();
    if (f == lastReplaced) break;
  }
  Memory->code->chainFrames();
  zone::frame_chain_nesting = nesting;
  // first mark all nmethods to flush, then flush in a 2nd pass
  // (nmethod may be on stack twice because of recursion)
  const frame* MagicFrame = (frame*)-1;
  nmethodBList flushList(50);
  for (f = copiedFrame; true; f = f->sender()) {
    nmethod* nm = f->code();
    if (nm->frame_chain != NoFrameChain) {
      // still used (on another stack), or already in flushList
    } else if (nm != recompilee && !nm->reusable()) { // xxx miw
      nm->frame_chain = (frame*)MagicFrame;
      flushList.append(nm);
    }
    if (f == lastReplaced) break;
  }
  while (flushList.nonEmpty()) {
    nmethod* nm = flushList.pop();
    assert(nm->frame_chain == MagicFrame, "should be magic");
    nm->clear_frame_chain();
    nm->flush();
  }
}


static frame* kill_old_blocks_lo;
static frame* kill_old_blocks_hi;
static void kill_old_blocks(oop* p) {
  if ((*p)->is_block()) {
    frame* bs = blockOop(*p)->scope(true);
    if (kill_old_blocks_lo <= bs  &&  bs <= kill_old_blocks_hi) {
      (*p)->kill();
    }
  }
}


void Recompilation::killBlocks() {
  // kill off any remaining blocks in belonging to the frames replaced by
  // newFr (these are never created in the new optimized nmethod)
  ::kill_old_blocks_lo = firstReplaced->block_scope_of_home_frame();
  ::kill_old_blocks_hi = lastReplaced ->block_scope_of_home_frame();
  assert(kill_old_blocks_lo <= kill_old_blocks_hi, "bad range");
  RegisterLocator* rl = RegisterLocator::for_frame(firstReplaced);
  for (frame* f = firstReplaced; 
              f <= lastReplaced; 
              f = f->sender(),  rl = rl->sender()) {
    f->oops_do(kill_old_blocks, rl);
  }
}


bool Recompilation::checkForRemappedBlocks() {
  // Check for real blocks that may block (har, har) on-stack replacement.
  // A pathological situation occurs if recompilee has a block currently active
  // on the stack (say, oldBlockNM), and oldBlockNM has real nested blocks.
  // Then, if we replace recompilee but not oldBlockNM, the nested blocks have
  // the wrong map no matter what: the old map is wrong because newNM's
  // layout is different, but the new map is wrong too because oldBlockNM
  // is still on the stack and may have a different layout from newBlockNM.
  fint last = rdepth - activeMarker->depth(); // depth of newest vframe to be recompiled
  frame* startF = stack.nth(last)->fr; // newest frame to be recompiled
  frame* endF   = stack.nth(rdepth)->fr; // oldest
  fint i;
  for ( i = 0; i < rdepth; i++) {
    nvframe* vf = stack.nth(i);
    oop rcvr = vf->receiver();
    if (rcvr->is_block()) {
      // check if this block's home is in newNM (transitively)
      
      // used to be:

      //  nvframe* home;      
      //  for ( home = vf;
      //        home != NULL;
      //        home = home->parent()->as_n()) 
      //     if (last <= home->depth  &&  home->depth <= rdepth)
      //       break;           
      //  if (home == NULL) 
      //    continue;

      // but this only works if method is block method, and
      //  we need to find outer methods if the receiver is a block
      //  with a recompiled enclosing scope -- dmu

      bool parentWillBeRecompiled = false;
      for ( abstract_vframe*  parentVF = blockOop(rcvr)->parentVFrame(NULL, true);
                              parentVF != NULL;
                              parentVF = parentVF->parent() ) {
        if ( startF <= parentVF->fr  &&  parentVF->fr <= endF ) {
          parentWillBeRecompiled = true;
          break;
        }
      }  
      if ( !parentWillBeRecompiled )
        continue;

      // ok, this is a block that could be troublesome; find out if it has
      // been inlined into newNM
      if (rdepth - vf->depth < activeMarker->depth()) 
       continue;

      // Oops, this guy could really cause trouble: it will be in a
      // nmethod called (transitively) by newNM.  If there exist any
      // real blocks whose home is in vf (transitively), we can't do the
      // replacement.  (Of course we could do it anyway if we knew that
      // this other nmethod could be replaced on the stack, but since
      // replacement isn't always possible we're stuck.  A less conservative
      // approach would be to find out if the second replacement can be done.)

      if (((methodMap*)(vf->method()->map()))->hasSubBlocks()) {
        // check if any of the nested blocks has a chance of executing before
        // vf's activation resumes; unfortunately, this is always possible
        // even if all these blocks are BlockValues (i.e. never created),
        // single-stepping etc. could create them anyway
        return true;
      }
    }
  }
  return false;         // no blocks that may cause trouble
}


bool Recompilation::checkForActivationMirrors() {
  // Check if any of the frames that would be replaced has an activation
  // mirror on it.  Such mirrors could be remapped with some work, but
  // for now just don't replace on stack (fix this).   -Urs 8/94
  // (see Process:convertVFrameOops if you want to lift this restriction.)
  // returns true if there is a problem

  vframeOop vfo = currentProcess->findInsertionPoint(stack.nth(0))->next();
  LOG_EVENT1("checkForActivationMirrors %#lx", vfo);

  if (vfo == NULL) return false;

  frame* start = stack.nth(0)->fr;
  frame* end   = stack.nth(max(0, rdepth))->fr;

  assert( start->vfo_locals_of_home_frame() <= end->vfo_locals_of_home_frame(),
          "oops");

  LOG_EVENT3("checkForActivationMirrors %#lx %#lx %#lx",
             vfo->locals(),
             start->vfo_locals_of_home_frame(),
             end->vfo_locals_of_home_frame());

  return  vfo->is_equal(start)
    ||    (vfo->is_above(start) && (vfo->is_below(end)
    ||    vfo->is_equal(end)));
}


void Recompilation::fillValues(frame* newFr) {
  frame* firstBS1 = firstReplaced->block_scope_of_home_frame();
  frame*  lastBS1 =  lastReplaced->block_scope_of_home_frame();
  frame* firstBS2 = block_scope_of_origFirstReplaced;
  frame*  lastBS2 = block_scope_of_origLastReplaced;
  
  // fill in new frame's oops
  compiled_vframe* newVF = new_vframe(newFr)->as_compiled();
  for (fint i = 0;  i < activeMarker->locs->length();  i++) {
    assert(activeMarker->locs->nth(i)->isValueLocation(), "oops");
    ValueLocationNameDesc* nd =
      (ValueLocationNameDesc*)activeMarker->locs->nth(i);
    Location loc = nd->location();

    if (nremaining  &&  isInitializedInFillValues(loc)) {
      // don't initialize this register - not bottom frame
      LOG_EVENT2("not setting %s (%d remaining)",
                 locationName(loc), nremaining);
      continue;
    }

    oop b = nd->value();
    if (b->is_block()) {
      if (oop(nd->block) == badOop || nd->block->map() == b->map()) {
          LOG_EVENT3("not remapping block %#lx (namedesc block = %#lx%s)",
                     b, nd->block,
                     nd->block == Memory->deadBlockObj  
                       ?  " is deadBlockObj" : "");
      }
      else {
        // block may have to be remapped - old frame was replaced by newFr
        // but be careful not to remap blocks whose homes still run the old
        // version of the nmethod
        frame* bs = blockOop(b)->scope(true);
        if (   (bs >= firstBS1 && bs <= lastBS1)
            || (bs >= firstBS2 && bs <= lastBS2)) {
          // block's home is either in removed frame or in copy of it
          blockOop(b)->remap(nd->block->map(), newFr);
        }
        else {
          // doesn't need to be remapped
          LOG_EVENT1("not remapping block %#lx (not in replaced frames)", b);
        }
      }
    }
    LOG_EVENT2("setting %s to %#lx", locationName(loc), b);
    // don't use register_contents_addr - don't want location on stack
    if (TARGET_ARCH == I386_ARCH)
      fatal("This is not right for the Intel architecture.");
    if (isArgRegister(loc))   fillRegisterValue(loc, b);
    else                      *newVF->register_contents_addr(loc) = b;
  }

  // fill in any extra args (stored in our frame, not callee's)
  // XXXX fix for interp
  sendDesc* s = activeMarker->send_desc(newNM);
  if (s && !s->isPrimCall() && s->arg_count() > NumArgRegisters) {
    compiled_vframe* oldVF = new_vframe(firstReplaced)->as_compiled();
    for (fint j = s->arg_count() - 1; j >= NumArgRegisters; j--) {
      Location loc = ArgLocation(j);
      oop val = oldVF->register_contents(loc);
      oop* p = newVF->register_contents_addr(loc);
      LOG_EVENT2("setting extra arg %s to %#lx", locationName(loc), val);
      *p = val;
    }
  }
}


void Recompilation::handleRemappedBlocks() {
  // If a block method is on the stack whose receiver block was remapped
  // because its home is in newNM, that frame needs to be recompiled.
  // Why? Because that method may clone blocks and give them maps that will find
  // nmethods in the zone that assume the old lexical parent stack frames. (dmu)
  // Yet another annoying side-effect of nmethod-specific block maps...
  assert(rdepth >= 0, "rdepth shouldn't be negative");
  frame **frames= NEW_RESOURCE_ARRAY( frame*, rdepth);
  fint n = 0;
  for (frame* f = lastFrame; f->code() != newNM; f = f->sender()) {
    frames[n++] = f;
  }
  nmethod* nm;
  oop rcvr;
  fint i;
  for ( i = n - 1; i >= 0; i--) {
    // NB: for PPC this will have to be modified to avoid quadratic RegisterLocator allocation
    abstract_vframe* vf = (new_vframe(frames[i]))->top();
    rcvr = vf->receiver();
# if TARGET_ARCH == SPARC_ARCH
    if (   rcvr->is_block()
        && blockOop(rcvr)->scope() == newFramePiece->as_callers_frame()) {
      // receiver is a block with home in recompiled nmethod
      // NB: in theory, only have a problem if it is the block method (rather
      // than, e.g., whileTrue:), because only the block method has lexical
      // access.  However, the non-block method could have an inlined copy of
      // the block method which is currently not active but might be invoked
      // any time.  Thus, the code below catches non-block cases, too.
      nm = frames[i]->code();
      if ( rcvr->map() != nm->key.receiverMap()  // xxx miw
      &&   nm->isValid()) 
        break;
    }
# else
    fatal("recompilation unimplemented on this architecture");
# endif
  }
  if (i < 0)
    return;
        
  // yup, this guy must be recompiled because the block map has changed
  assert(nm->frame_chain != NoFrameChain, "should be on stack");
  bool wasReplaced = false;
  Recompilation* recomp = NULL;
  
  // Originally, the next bit was skipped if SICMultipleRecompilation
  //  was set, with the explanation:
    // don't recompile now - will (probably) recompile later
    // (but must mark it as invalid)
    
  // BUT, if this frame is about to perform a send with an
  //  argument that is a block-literal, when said block literal
  //  is invoked, it will find a block nmethod that has the wrong map
  //  for SELF (since we are trying to change this block's map
  //  (recall this block is the receiver of this frame).
  // So, I think we have to recompile anyway, right away!
  // Except that, recompiling is not guaranteed, it may
  //  not replace on stack.
  // So I have strengthed checkForRemappedBlocks, so that
  //  now it should not be correctness-critical to replace here.
  //   -- dmu 1/12/96
  

  if (!SICMultipleRecompilation) {
    nm->flushPartially();
    frame* sender = frames[i]->sender();
    recomp = new Recompilation(sender, sender->send_desc(), rcvr,
                               lastFrame, nm, lastFrame, true);
    recomp->doit(nm->insts());
    recomp->finalize();
    wasReplaced = recomp->nreplaced >= 0;
    
    // (end of next bit)
  }

  if (wasReplaced) {
    // on-stack replacement was successful
    lastFrame = recomp->lastFrame;
    newPC = recomp->newPC;
    LOG_EVENT1("setting newPC from recomp: %#lx", newPC);
    newSP = recomp->newSP;
  } else {
    // hopefully, this doesn't happen too often
    // deoptimize frame when control returns to it
    nm->invalidate();
    
  }
  // check again - there may be others
  handleRemappedBlocks();
}



bool Recompilation::pushFrame(frame* copy) {
  // copy the frame onto the run-time stack
  assert(copy < firstReplaced, "shouldn't push this frame");
  char* oldSP = newSP;
  fint size = copy->frame_size();
  newSP -= size * oopSize;
  copy->copy_to(newSP, oldSP, newPC, true);
  newPC = copy->return_addr();
  LOG_EVENT1("setting newPC in pushFrame: %#lx", newPC);
  fixStack();
  // can't patch the frame now as it may be overwritten during stack
  // replacement 
  assert(!copy->code()->isInvalid()
         || currentProcess->last_self_frame(true)->code()->isInvalid(),
         "code should be invalid");
  return copy->code()->isInvalid();
}


void Recompilation::fixStack() {
  lastFrame->fix_frame( newPC, newSP);
}


void Recompilation::printNewFrames(frame* newFr) {
  lprintf("**new vframes (optimized):\n");
  abstract_vframe* vf = new_vframe(newFr);
  fint vdiff = newFr->vdepth() - (rdepth < 0 ? 0 : rdepth);
  while (vdiff-- > 0) {
    // Printing these vframes is somewhat risky since newNM isn't at an
    // interrupt point.  So just print their names.
    lprintf("skipping vframe %#lx \"%s\"\n",
           vf, selector_string(vf->selector()));
    vf = vf->sender();
  }
  fint i;
  for (i = 0; vf->fr == newFr || i < rdepth; vf = vf->sender()) {
    if (vf->is_prologue()) {
      // bottommost vf doesn't really exist (hasn't completed prologue yet,
      // e.g. locals may be uninitialized)
      assert(i == 0, "not bottommost");
    } else {
      vf->print_frame(i++);
    }
  }
  vf->print_frame(i++);
}


char* MakeOld(sendDesc* sd, frame* callerFrame, oop receiver,
              char* diChild, char* caller) {
  nmethod* nm;
  NCodeBase* thing;

  { ResourceMark rm;
    thing= findThing(caller);   // caller thing (count stub)
    assert(thing->isCountStub(), "should be a stub");
    CountStub* stub = (CountStub*)thing;
#   if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
        sendDesc* sd2 = stub->sd();
        if (!sd2) sd2 = stub->pic()->sd();
        assert(sd2 == sd, "sd mismatch");
    }
#   endif

    nm = stub->target();
    const bool BypassMakeOld = false; // for debugging, set to true to bypass me
    if (BypassMakeOld)   return nm->entryPointFor(sd);
    // assert(nm->isYoung(), "should be young nmethod");
    // nm can be old: megamorphic PICs just reuse count stubs on a miss, so if
    // a young nmethod is in a megamorphic PIC and gets thrown out before
    // becoming old, some random nmethod is linked to the AgingStub
    nm->makeOld();
  }
  if (nm->isToBeRecompiled()) {
    // recompile this guy now
    LOG_EVENT("calling Recompile from MakeOld");
    return Recompile(sd, callerFrame, receiver, diChild, nm->insts());
  } 
  // It is possible to have a call chain with all SIC methods
  //  where the caller needs recompilation, but makes no other calls but
  //  this one. So check the caller, too. -- dmu 5/96

  nmethod* sendingNM = nmethod::findNMethod(sd);
  if ( sendingNM->isToBeRecompiled()) {
    // Must make sender old, so it can be chosen as recompilee
    {
      ResourceMark rm; // above code does it, maybe needed for makeOld?
      sendingNM->makeOld();
    }
    // Don't know how to point compiler to caller, so just invoke as above
    LOG_EVENT("calling Recompile from MakeOld (2)");
    return Recompile(sd, callerFrame, receiver, diChild, nm->insts());
  }
  return nm->entryPointFor(sd);
}


static fint checkCompiler(oop c, bool recompiler) {
  // return compiler or -1 if invalid
  if (!c->is_byteVector()) return -1;
  if (VMString[NIC]->equals(byteVectorOop(c))) {
    // the nic is not a valid recompiler
    return recompiler ? -1 : fint(NIC);
#   ifdef SIC_COMPILER
    } else if (VMString[SIC]->equals(byteVectorOop(c))) {    
      return SIC; // change to NIC to run test suite w/ NIC even if it tries for SIC
#   endif
  }
  return -1;
}


oop set_recompilation_prim(oop r, objVectorOop comps,
                           objVectorOop limits, void* FH) {
  fint len = comps->length();
  if (len < 1) {
    failure(FH, "must have at least one compiler");
    return 0;
  }
  if (len != limits->length() + 1) {
    failure(FH, "limit vector should be one shorter than compilers vector");
    return 0;
  }
  fint* newcomps = (fint*)AllocateHeap(len * sizeof(fint),
                                       "compilers settings");
  fint* newlimits = (fint*)AllocateHeap(len * sizeof(fint),
                                        "recompilation limits");
  smi* newcounts = (smi*)AllocateHeap(len * sizeof(smi), "compilers settings");
  fint i;
  for (i = 0; i < len; i++) {
    newcomps[i] = checkCompiler(comps->obj_at(i), i);
    if (newcomps[i] < 0) {
      char msg[80];
      sprintf(msg, "arg1[%ld]: invalid compiler", long(i));
      failure(FH, msg);
      return 0;
    }
    newcounts[i] = i < nstages ? compileCounts[i] : 0;
  }
  for (i = 0; i < len - 1; i++) {
    oop lim = limits->obj_at(i);
    if (!lim->is_smi() || smiOop(lim)->value() < 1) {
      char msg[BUFSIZ];
      sprintf(msg,
              "arg2[%ld]: invalid recompilation limit (not a positive integer)",
              long(i));
      failure(FH, msg);
      return 0;
    }
    newlimits[i] = roundTo(smiOop(lim)->value(), K);
    // for simplicity (Sparc sethi), round up values to next K
  }
  // everything ok, install new values
  nstages = len;
  selfs_free(compilers); compilers = newcomps;
  selfs_free(compileCounts); compileCounts = newcounts;
  selfs_free(recompileLimits); recompileLimits = newlimits;
  return r;
}


# else

# define recompilee NULL // use define to avoid defining nmethod

nmethod* also_Recompile( sendDesc*         /* send_desc */,
                         compilingLookup*  /* L */,
                         nmethod*          /* reCompilee */) {
  return NULL;
}


# endif //  defined(SIC_COMPILER)


oop get_compilers_prim(oop) {
  objVectorOop res = Memory->objVectorObj->cloneSize(nstages);
  for (fint i = 0; i < nstages; i++) {
    res->obj_at_put(i, VMString[compilers[i]]);
  }
  return res;
}


oop get_compile_counts_prim(oop) {
  objVectorOop res = Memory->objVectorObj->cloneSize(nstages);
  for (fint i = 0; i < nstages; i++) {
    res->obj_at_put(i, as_smiOop(compileCounts[i]));
  }
  return res;
}


oop get_recompile_limits_prim(oop) {
  objVectorOop res = Memory->objVectorObj->cloneSize(nstages - 1);
  for (fint i = 0; i < nstages - 1; i++) {
    res->obj_at_put(i, as_smiOop(recompileLimits[i]), false);
  }
  return res;
}
