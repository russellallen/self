/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "process.hh"
# include "_process.cpp.incl"

// valid state transitions for processes:
//
// initialized --> ready --> stopped --> aborting --> defunct
//                   |                     ^
//                   |                     |
//                    ---------------------
//
// dummyProcess starts out in state 'defunct', all others in 'initialized'.

static Process* dummyProcess;
static Process* processList = 0;
Process* currentProcess;
Process* prevProcess = 0;            // proc transferring to current
Process* vmProcess;                     // vm prompt process
Process* twainsProcess = 0;
static char* vmStackEnd = 0;         // start (highest addr) of VM stack
bool ConversionInProgress = false;
bool8 processSemaphore = false;
PreemptCause preemptCause = cNoCause;
oop yieldArg  = 0;
oop yieldRcvr = 0;

char* newSPLimit = 0;                  // for setSPLimitAndContinue
static void (* processTermFunc)();      // termination func; set during abort

void process_init() {
  processes = new Processes;
  dummyProcess = currentProcess = vmProcess = new Process(0, 0);
}

bool traceP = false;
bool traceV = false;

# if GENERATE_DEBUGGING_AIDS
  void printP(const char* s, void* p) {
    if (traceP) {
      lprintf("**P** %s ", s);
      if (p == (void*)&dummyProcess) lprintf("dummyProcess ");
      else if (p == (void*)vmProcess) lprintf("vmProcess ");
      else if (p == (void*)twainsProcess) lprintf("twainsProcess ");
      lprintf("0x%lx\n", p); 
    }
  }
# else
# define printP(a,b)
# endif

bool isOnVMStack(void* sp) {            // just a guess
  return (char*)sp <= vmStackEnd  &&  (char*)sp > vmStackEnd - 500000;
}

void Process::transfer() {
  bool initializingDstProcStack;
  
  printP("transferring to", this);
  assert(currentProcess != this, "transferring to myself");
  assert(! isOnVMStack(currentFrame()), "must not be on VM stack");
  assert(state == initialized || !hadStackOverflow(), "had stack overflow");
  assert(!processes->needsInvalidate, "should have handled this");
  assert(sizeof(processSemaphore) == 1,
         "assembly code assumes processSemaphore is a byte");
  assert(!processSemaphore, "processSemaphore shouldn't be set");

  processSemaphore = true;
  if (state == initialized) {
    init(suspendedPC);
    state = ready;
    initializingDstProcStack = true;
  } else {
    initializingDstProcStack = false;
  }
  char** currAddr = &currentProcess->suspendedSP;
  char** nextAddr = &this          ->suspendedSP;
  if (currentProcess == dummyProcess) {
    // creation of first process
    currAddr = 0;
    vmStackEnd = (char*)currentFrame() - 128;
    prevProcess = this;
  } else {
    assert(currentProcess->state == stopped ||
           currentProcess->state == ready ||
           currentProcess->state == aborting, "wrong process state");
    prevProcess = currentProcess;
  }
  // Check for vframeOops.  This check must *always* be done before
  // resuming Self code.
  if (!initializingDstProcStack) {
    assert(nesting > 0, "not in Self");
    killVFrameOopsAndSetWatermark(0);
  } else {
    clearPreemption();
  }
  patchForSingleStepping();
  ShowContextSwitchInMonitor cs;
  

  assert(currentProcess->verifyFramePatches(), "frame patching bug");
  assert(verifyFramePatches(), "frame patching bug");
  
  currentProcess = this;
  
  if (currentProcess->profiler) {
    currentProcess->profiler->resume();
  }
  assert(sizeof(processSemaphore) == 1,
         "SetSPAndCall assumes bool8* points to a byte");
  bool8 ws = pcWasSet;  pcWasSet = false;
  SetSPAndCall(currAddr, nextAddr, initializingDstProcStack,
               &processSemaphore, ws);
}


Process::Process(processOop p, int32 sSize, oop rcvr, stringOop sel, 
                 objVectorOop args) {
  printP("creating", this);
  pcWasSet = false; 
  current_hash = IntervalTimer::dont_use_any_timer ? 0 : rand();
  if (sSize) {
    LOG_EVENT1("creating process %#lx", this);
    int pageSize = OS::get_page_size();
    int32 npages = (sSize + pageSize - 1) / pageSize;
    int32 size = npages * pageSize;
    while (size < 2 * PrimStackSize) size += pageSize;
    stk.init(this, 0, size);
    method= as_smiOop(0); // just for the vmProcess
    state = initialized;
    procObj = currentProcess == dummyProcess ? Memory->processObj : p->clone();
    procObj->set_process(this);
  } else {
    // dummy process
    stk.init(0, 0, 0); procObj = 0; state = defunct;
  }
  
  next = 0;
  suspendedPC = 0; nesting = 0; 
  stopActivation = 0;
  stepping = stopping = deoptimizing = restartAfterConversion = false;
  _killUpToVF = 0;
  _uncommonPC = 0;
  aborter = 0;
  clear_check_vfo_locals();
  zombie= false;
  if (rcvr) {
    initialize(rcvr, sel, args);
  } else {
    init(0);
  }
  if (processList) addAfter(processList);
  profiler = 0;
}

void Process::init(char* pcVal) {
  if (hasStack()) {
    printP("reinitializing", this);
    suspendedSP = stackEnd() - oopSize;
    suspendedSP = adjust_initial_SP(suspendedSP);
    set_words((int32*)suspendedSP, (stackEnd() - suspendedSP) / oopSize);
    resetStackOverflow();
  }
  setPC((process_p)pcVal);
}

// Create the method starting the process; parameters have already been
// checked.
void Process::initialize(oop rcvr, stringOop sel, objVectorOop args) {
  ResourceMark rm;
  ByteCode b(true);
  slotList* slots = EMPTY;

  stringOop receiverString = new_string("receiver");
  slots = slots->add(receiverString, parent_map_slotType, rcvr);

  b.GenSendByteCode(0, 0, receiverString, true, false, 0);
  for(int32 i = 0; i < sel->arg_count(); i++) {
    b.GenLiteralByteCode(0, 0, args->obj_at(i));
  }
  b.GenSendByteCode(0, 0, sel, false, false, 0);
  bool ok = b.Finish("<process creation>",
                     " \"create the process and send the initial message\" ");
  assert(ok, "should not be errors");
  
  method = create_outerMethod(slots, &b);
  init(first_inst_addr(startCurrentProcess));
}

void Process::startCurrentProcess() {
  currentProcess->start();
}


void Process::start() {
  printP("starting", this);


  if (Trace) {
    lprintf ("starting process\n");
  }
  nesting = 0;  // runDoItMethod will increment

  // used to call EnterSelf, I just had it call CallSelf (now runDoItMethod) to
  //  be better factored -- dmu 9/11/95
  // oop res = EnterSelf(Memory->lobbyObj, c->insts(), badOop);
  // now it calls runDoItMethod

  oop res = runDoItMethod(Memory->lobbyObj, method); 

  // process has finished
  if (this != currentProcess) fatal("this isn't current process");
  // nesting = 0;

  preservedList.clear();
  killVFrameOops(0);
  NLRSupport::reset_have_NLR_through_C();
  SignalInterface::unblock_self_signals();

  // Conceptually, this process is now dead.  But we can't delete this
  // right here because it's the current process, i.e. this procedure
  // is executing on cp's stack.  Thus, we just mark it as dead; it will
  // be deallocated either by TWAINS or during the next scavenge.
  
  state = aborting;
  processOop cpo = processObj();
  cpo->kill();
  
  if (aborter) {
    aborter->transfer();        // continue with the process which aborted this
  } else if (twainsProcess) {
    if (res == badOop) {
      preemptCause   = cAborted;
    } else {
      preemptCause   = cTerminated;
      cpo->set_return_oop(res);
    }
    twainsProcess->transfer();
  } else {
    // will be cleaned up at next scavenge
    vmProcess->transfer();
  }
}


// Resulting oop is interpreted by start above
volatile void Process::abort_process()     { NLRSupport::unwind_stack_to_kill_process(badOop); }
volatile void Process::terminate_process() { NLRSupport::unwind_stack_to_kill_process(0); }



Process::~Process() {
  if (this == dummyProcess) return;
  printP("destroying", this);
  LOG_EVENT3("destroying process %#lx, obj = %#lx, base = %#lx",
             this, processObj(), stk.base);
  if (this == currentProcess) fatal("process: cannot destroy myself");
  if (state == defunct) fatal("process already destroyed");
  if (this == prevProcess) prevProcess = 0;
  Process *p, *q = 0;
  for (p = processList; p && p != this; q = p, p = p->next) ;
  assert(p, "process not on process list");
  if (q) {
    remove(q);
  } else {
    processList = next;
  }
  state = defunct;
  if (hasStack()) stk.deallocate();
  if (processObj()) processObj()->kill();
}


bool Process::allocate() {
  printP("allocating", this);
  if (!hasStack()  &&  stk.size) {
    return stk.allocate();
  }
  return true;
}

// The process termination functions could be written more concisely
// using macros, but it would be a pain to debug.

void terminateMe() {
  if (currentProcess == twainsProcess) twainsProcess = 0;
  void (* p)() = processTermFunc;
  processTermFunc = 0;       // clear it for assertions
  p();
}

static void checkAbort(PrimDesc* pd) {
  if (!pd->canAbortProcess()) {
    fatal1("incorrect primitive entry for %s: canAbort must be set",
           pd->name());
  }
}

void Process::kill() {
  LOG_EVENT1("killing process %#lx", this);
  assert(state != aborting && state != defunct, "wrong status");
  if (state == initialized) {   
    assert(currentProcess != this, "wrong context");
  } else {
    assert(nesting > 0, "should be in Self");
    stack()->consistencyCheck(checkAbort);
    // make sure we don't crash (again) because we don't have a sendDesc
    //   but only compiled frames have one
    { // It's possible that lsf is 0 (eg first frame calls interruptCheck
      // and the process is then killed).
      frame *lsf;
      
      while (    lsf= last_self_frame(false),
                 lsf
             && !lsf->is_interpreted_self_frame()
             &&  lsf->send_desc() == 0)
        suspendedSP = (char*)lsf->sender();
    }
    // don't do any programming conversions - just pop all frames; not strictly
    // necessary but saves some work
    killVFrameOops(0);       // kill all activation mirrors
    stack()->remove_patches();  
    if (this == currentProcess) {
      terminateMe();    
    } else {    
      setPC(terminateMe);
      state = ready;
      aborter = currentProcess;
      transfer();       
    }                           
  }     
}

void Process::terminate() {
  processTermFunc = (void (*)()) &terminate_process;
  kill();
}

void Process::abort() {
  processTermFunc = (void (*)()) &abort_process;
  kill();
}

void Process::setStopPoint(vframeOop stop) {
  stopActivation = stop;
}

void Process::setSingleStepping() {
  assert(isRunnable(), "should be runnable");
  stepping = true;
  patchForSingleStepping();
}

void Process::resetSingleStepping() {
  stepping = false;
}

void Process::patchForSingleStepping(frame* belowFrame) {
  if (isSingleStepping() || stopping) {
    // make sure we stop at the next possible byte code
    setupPreemption();
    if (inSelf()) {
      // make sure we catch returns, too
      // patch last Self frame; if passed in, belowFrame is the frame below
      // the one to be patched
      if (!belowFrame) belowFrame = stack()->first_VM_frame();
      frame* last = belowFrame->sender();
      last->patch(belowFrame);
    }
  }
}

frame* Process::stopFrame() {
  if (stopActivation) {
    assert(stopActivation->is_live(), "should be live");
    return stopActivation->locals();
  } else {
    return 0;
  }
} 

void Process::killFrames(abstract_vframe* vf) {
  // kill off all activations below vf
  assert(this != currentProcess, "wrong context");
  resetSingleStepping();
  resetStopping();
  killVFrameOops(vf);
  vf->fr->patch(0);
  _killUpToVF = new_vframeOop(this, vf);
  if (traceV)
    lprintf("*** killFrames: starting kiling: _killUpToVF = 0x%x\n, fr = 0x%x, descOffset = %d\n",
            _killUpToVF, vf->fr, _killUpToVF->descOffset()->value());
            
  // switch processes and restart the receiver at doKillFrames; the process
  // will do a fake NLR to pop off the frames, then convert
  // the target frame and do one more NLR to pop the rest.  Finally,
  // having popped all frames, the receiver will suspend itself and return
  // to the controlling process
  // (currentProcess = process executing the killUpTo primitive)
  
  NLRSupport::set_NLR_home_from_C( (int32)vf->fr->block_scope_of_home_frame() );
  NLRSupport::set_NLR_home_ID_from_C(     vf->scopeID());
  transfer();
}

void Process::deoptimize(frame* last) {
  // deoptimize last stack frame
  assert(this != currentProcess, "wrong context");
  resetSingleStepping();
  resetStopping();
  setDeoptimizing();
  last->patch(0);
  NLRSupport::set_NLR_home_from_C( (int32)last->block_scope_of_home_frame() );
  // Why no NLRSupport::set_NLR_home_ID_from_C??? -- dmu 1/03
  // I don't think the arguments need to be saved, since gotoByteCode caller will set them anyway
  // -- dmu 1/03
  transfer();
}

void Process::gotoByteCode(abstract_vframe* vf, smi newBCI, objVectorOop exprStack,
                           void* FH) {
  // skip the current byte code of the bottomost vframe (vf)
  // first, deoptimize  the last stack frame
  { vframeOop vfo = new_vframeOop(this, vf);
    preserved p1(vfo);
    preserved p2(exprStack);
    deoptimize(vf->fr);
    vf = vframeOop(p1.value)->as_vframe();
    exprStack = objVectorOop(p2.value);
  }
 

  // now check the arguments (easier to do here - otherwise all oops would
  // have to be preserved)
  
  methodMap* mm = (methodMap*)vf->method()->map();
  fint currentBCI = vf->bci();
  fint maxBCI = mm->length_codes() - 1;
  if (newBCI < 0 || newBCI > maxBCI) {
    failure(FH, "invalid byte code index");
    return;
  }
  
  if (vf->is_interpreted()) {
    fatal("unimp for interpreter");
    return;
  }
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  assert(vf->as_compiled()->code->isDebug(), "should be debug-compiled");
  compiled_vframe** vfs;
  NameDesc** nds;
  fint len;
  compiled_vframe* newVF = new compiled_vframe( vf->fr,
                                                vf->as_compiled()->code,
                                                vf->as_compiled()->desc,
                                                newBCI,
                                                vf->as_compiled()->reg_loc());
  newVF->get_exprStackInfo(0, vfs, nds, len);
  if (len != exprStack->length()) {
    char msg[80];
    sprintf(msg, "invalid expression stack length (should be %ld)", long(len));
    failure(FH, msg);
    return;
  }

  fint i;
  for (i = 0; i < len; i++) {
    oop v = exprStack->obj_at(i);
    if (nds[i]->isMemoizedBlock() && !(v->is_block() && v->is_live())) {
      char msg[180];
      const char* blk = v->is_block() && !v->is_live() ? "live " : "";
      sprintf(msg, "implementation restriction: expression stack entry %ld must be a %sblock", long(i), blk);
      failure(FH, msg);
      return;
    } 
    else {
      assert(!nds[i]->isBlockValue(), "shouldn't be a block value");
    }
  }

  // all args are ok; kill off / create blocks between the current and new bci
  IntList* currentBlocks = mm->blocks_upto(currentBCI);
  IntList* newBlocks     = mm->blocks_upto(newBCI);
    
  if (newBlocks->length() < currentBlocks->length()) {
    // need to kill some blocks
    assert(newBCI < currentBCI, "expected to go backwards");
    for (IntListElem* e = currentBlocks->head(); e; e = e->next()) {
      if (!newBlocks->includes(e->data())) {
        NameDesc* n = vf->as_compiled()->desc->blockElem(e->data());
        assert(n->isMemoizedBlock(), "should be memoized");
        oop block = vf->as_compiled()->get_contents(n);
        assert_block(block, "expected a block");
        block->kill();
      }
    }
  } else if (newBlocks->length() > currentBlocks->length()) {
    // need to create some blocks
    assert(newBCI > currentBCI, "expected to go forwards");
    for (IntListElem* e = newBlocks->head(); e; e = e->next()) {
      if (!currentBlocks->includes(e->data())) {
        NameDesc* n = newVF->desc->blockElem(e->data());
        assert(n->isMemoizedBlock(), "shouldn't be memoized");
        
        // get_contents creates the block
        oop block = newVF->get_contents(n);
        
        // also set block in expr stack (may be a different location) -- dmu
        NameDesc* n2 = newVF->desc->exprStackElem(e->data());
        newVF->set_contents(n2, block);
        
        assert_block(block, "should be a block");
        assert(block->is_live(), "should be live");
      }
    }
  }

  // now fill in new expression stack
  for (i = 0;  i < len;  i++) {
    oop v = exprStack->obj_at(i);
    newVF->set_contents(nds[i], v);
  }

  // set the PC
  sendDesc* sd = newVF->code->sendDescFor(newVF, false);
  newVF->fr->set_return_addr((char*)sd);
  // and finally, replace the frame *below* newVF->fr with the correct one;
  // deoptimize will pop it, do a no-op deoptimization and create the right one
  deoptimize(newVF->fr);
  
# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  ShouldNotReachHere();
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
}


bool Process::inSelf(bool including_prologue) {
  return nesting > 0 && last_self_frame(including_prologue) != 0;
}
  
bool Process::hasEmptyStack() {
  ResourceMark rm;
  // is the current stack empty?  (ignoring "invisible" frames)
  if (!inSelf()) return true;
  if (this == vmProcess) {
    return false;
  } else {
    // top frame is hidden doIt (with the initial perform)
    // check if we have a second vframe
    abstract_vframe* vf = new_vframe(last_self_frame(false));
    return vf->sender() == 0;
  }
}

bool isStackOverflow(char* addr) {  
  return currentProcess != dummyProcess &&
    currentProcess->isStackOverflow(addr);
}

bool Process::verifyFramePatches() {
  bool ok = true;
  // make sure all frames are correctly patched
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (!processTermFunc && nesting > 0) {
    for (frame *f = last_self_frame(true), *f0= f; f; f = f->selfSender()) {
      if (ConversionInProgress && f == f0) continue;
      if (f->is_interpreted_self_frame()) continue;
      if (f->code()->isInvalid() && !f->is_patched()) {
        ok = false;
        error1("frame %#lx: should be patched", f);
      }
    }
  }
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  return ok;
}

bool Process::verify() {
  bool r = true;
  if (state != initialized)  r &= stack()->verify();
  if (processObj()->process() != this) {
    error2("Process object %#lx doesn't point to process %#lx",
           processObj(), this);
    r = false;
  }
  bool verify_result = true;
  VERIFY_TEMPLATE(&procObj);
  VERIFY_TEMPLATE(&method);
  r &= verify_result;
  if (!verifyVFrameList()) {
    lprintf("\t of vframeList of process %#lx\n", this);
    r = false;
  }
  if (deoptimizing) { error1("Process %lx:  deoptimizing flag set", this);  r= false; }
  if (restartAfterConversion) {
    error1("Process %lx: restartAfterConversion flag set", this);
    r = false;
  }
  r &= verifyFramePatches();
  return r;
}


void Process::print() {
  static const char* pstate[] = {
    "initialized", "ready", "stopped", "aborting", "defunct" };
  lprintf("Process %#lx: state = %s, %s, obj = %#lx, method = %#lx\n",
         this, pstate[state],
         inSelf() ? "in Self" : "not in Self",
         procObj, method);
  lprintf("\tp ((Process*)%#lx)->stack()->print()\n", this);
  stack()->print();
}

void Process::print_short() { lprintf("process %#lx", this); }

void Process::convert() {
  stack()->convert();
}

# if GENERATE_DEBUGGING_AIDS
  void pps(Process* p) { p->stack()->print(); }
# endif

// ------------------------- memory functions ------------------------

// the preservedList contains all preservedObjs of the process; it's really
// a stack, i.e. elem 0 is the oldest, elem(n) the youngest

inline bool moreRecent(void* p, void* q) {  // is p more recent than q?
  return p < q || isOnVMStack(p) != isOnVMStack(q);
}

void PreservedList::oops_do(oopsDoFn f, Process* proc) {
  for (fint i = list.length() - 1; i >= 0; i--) {
    preservedVmObj* p = list.nth(i);
    assert(proc->contains((char*)p) || proc == currentProcess,
           "preservedObj not on process stack");
    UsedOnlyInAssert(proc);
    if (i > 0) {
      preservedVmObj* prev = list.nth(i - 1);
      // The latest MW compiler does not guarantee this property:
      // Two stack allocated objects in same activation may not be ordered.
      // -- dmu 6/1
      // assert(moreRecent(p, prev), "prev preservedObj should be more recent");
    }
    p->oops_do(f);
  }
}

void Process::preserve(preservedVmObj* p) {
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  traceP) lprintf("*preserving %#lx (process %#lx)\n",
                                           p, this);
# endif

// The latest MW compiler does not guarantee this property:
// Two stack allocated objects in same activation may not be ordered.
// -- dmu 6/1
# if 0
    while (preservedList.list.nonEmpty()) {
      preservedVmObj* prev = preservedList.list.last();
      if (moreRecent(p, prev)) {
        break;            // everything is ok
      } else {
        // there's at least one dangling preservedObj on the stack
        // (not cleaned up because of some C frame popping)
        if (traceP) lprintf("*discarding %#lx (process %#lx)\n",
                            (long unsigned)prev, (long unsigned)this);
        preservedList.list.pop();
      }
    }
# endif
  preservedList.list.push(p);
}

void Process::un_preserve(preservedVmObj* p) {
# if GENERATE_DEBUGGING_AIDS
  if (CheckAssertions  &&  traceP) lprintf("*unpreserving %#lx (process %#lx)\n",
                                           p, this);
# endif
  while(preservedList.list.pop() != p) {
    // Get rid of all extra preservedVmObjs created after p.
    // This can happen e.g. when a process is killed within an _Eval
    // (i.e. SelfNesting > 1)
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions  &&  traceP) lprintf("*  also discarding %#lx (process %#lx)\n",
                                               (preservedList.list.top()),
                                               this);
#   endif
  }
}

static void scavenge_func(oop* p) { SCAVENGE_TEMPLATE(p); }
static void gc_mark_func(oop* p) { MARK_TEMPLATE(p); }
static void gc_unmark_func(oop* p) { UNMARK_TEMPLATE(p); }
static oop from, to;
static void switch_pointers_func(oop* p) { SWITCH_POINTERS_TEMPLATE(p) }
static bool markingFromZombies;

void Process::scavenge_contents() {
  if (state != aborting) stack()->scavenge_contents();
  SCAVENGE_TEMPLATE(&procObj);
  SCAVENGE_TEMPLATE(&method);
  SCAVENGE_TEMPLATE(&stopActivation);
  SCAVENGE_TEMPLATE(&_killUpToVF);
  preservedList.oops_do(scavenge_func, this);
}

void Process::gc_mark_contents() {
  assert(zombie, "shouldn't visit twice");
  if (!markingFromZombies) zombie= false;
  if (state != aborting) stack()->gc_mark_contents();
  MARK_TEMPLATE(&procObj);
  MARK_TEMPLATE(&method);
  MARK_TEMPLATE(&stopActivation);
  MARK_TEMPLATE(&_killUpToVF);
  preservedList.oops_do(gc_mark_func, this);
}

void Process::gc_unmark_contents() {
  if (state != aborting) stack()->gc_unmark_contents();
  UNMARK_TEMPLATE(&procObj);
  UNMARK_TEMPLATE(&method);
  UNMARK_TEMPLATE(&stopActivation);
  UNMARK_TEMPLATE(&_killUpToVF);
  preservedList.oops_do(gc_unmark_func, this);
}

void Process::switch_pointers() {
  if (state != aborting) stack()->switch_pointers(from, to);
  SWITCH_POINTERS_TEMPLATE(&procObj);
  SWITCH_POINTERS_TEMPLATE(&method);
  SWITCH_POINTERS_TEMPLATE(&stopActivation);
  SWITCH_POINTERS_TEMPLATE(&_killUpToVF);
  preservedList.oops_do(switch_pointers_func, this);
}

void Process::write_snapshot(FILE* f) { Unused(f); }

void Process::read_snapshot(FILE* f) {
  Unused(f);
  // a hack until we have real snapshots
  if (this == vmProcess) {
    procObj = Memory->processObj;
    procObj->set_process(this);
  } else {
    procObj = 0;           // procObj was overwritten by snapshot
    state = aborting;         // discard this process ASAP
  }
}


// --------------------------- preemption --------------------------

inline void handlePreemption() {
  if (Memory->needs_scavenge()) Memory->scavenge();
  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (Memory->code->needsWork()) Memory->code->doWork();
  if (Memory->code->stubs->needsWork) Memory->code->stubs->cleanup();
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

  if (twainsProcess == 0 && Memory->old_gen->needToSignalLowOnSpace) {
    Memory->old_gen->needToSignalLowOnSpace= false;
    Memory->default_low_space_handler();
  }

  frame* last = currentProcess->stack()->last_self_frame(true);
  currentProcess->killVFrameOopsAndSetWatermark(last);
  if (currentProcess->isKillingOrDeoptimizing()) {
    // done killing frames / deoptimizing - return to caller of primitive
    currentProcess->resetKilling();
    currentProcess->resetDeoptimizing();
    prevProcess->transfer();
  } else if (twainsProcess && preemptCause != cNoCause) {
    if (SignalInterface::are_self_signals_blocked()  &&  preemptCause == cSignal) {
      // ignore the signal(s) until blocking is removed
    } else if (preemptCause == cSingleStepped &&
               currentProcess->hasEmptyStack()) {
      // initial single-step - skip "invisible" doIt method
      // and prologue part of a nmethod.
      if (!currentProcess->isSingleStepping()) {
        currentProcess->setSingleStepping();
      }
      currentProcess->patchForSingleStepping();
    } else {
      // suspend current process and return to twains process (which will
      // return from the TWAINS primitive)
      // Self processes that unwillingly yielded the CPU are suspended here;
      // the other suspension point is in Yield_prim

      if (Memory->old_gen->needToSignalLowOnSpace) {
        preemptCause= cLowOnSpace;
        Memory->old_gen->needToSignalLowOnSpace= false;
      }
      if (currentProcess->profiler) {
        currentProcess->profiler->suspend();
      }
      twainsProcess->transfer();
    }
  } else if ( PendingSelfSignals::count(sigquit) != 0 ) {
    abortSelf();
  } else {
    // no need to switch processes
  }
   
  // do this last because the timer might go off again and
  //  we don't want to undo preemption after that happens
  IntervalTimer::do_all_sync_tasks();
}


bool Process::preemptionPending() {
  if (currentSPLimit() == stackEnd()) return true;
  if (newSPLimit == stackEnd()) {
    // After InterruptedContext::setupPreemptionFromSignal has been called but before setSPLimitAndContinue is
    // executed preemption is pending.
    assert( processSemaphore, "processSemaphore should be set");
    return true;
  }
  return false;
}


void preemptor() {
  if (SignalInterface::are_self_signals_blocked()) 
    return;
  if (processSemaphore || currentProcess == twainsProcess) {
    // Either the twainsProcess is idle (and will wake up immediately after we
    // return), or we are in a critical section and should not be disturbed.
    return;
  } else if (currentProcess->nesting == 0) {
    // This is either the VM process (near the prompt) or a process that
    // is just about to start (i.e., in startCurrentProcess).  Wait.
    return;
  }
  // Set the SP limit so that the next call will cause a "stack overflow".
  InterruptedContext::setupPreemptionFromSignal();
}


// ----------------------- vframeOop management --------------------

// All live vframeOops are in the vframeList of their respective process.
// Within the list, vframes are ordered from most recent to least recent
// (closest to top-of-stack to farthest).

vframeOop Process::findInsertionPoint(abstract_vframe* target) {
  // Returns vframeOop after which vf should be inserted.  If an identical
  // vframe is already in the list, the position returned is before this
  // vframe.
  ResourceMark rm;
  if (traceV) {
    static fint findInseritonPoint_count = 0;
    ++findInseritonPoint_count;
    lprintf("*** Entering Process::findInsertionPoint(0x%x), %d\n", target, findInseritonPoint_count);
    verifyVFrameList();
  }
  assert(stack()->contains((char*)target->fr) ||
         (ConversionInProgress || theRecompilation)
          && isOnVMStack(target->fr), "not in my stack");
  
  vframeOop sentinel = procObj->vframeList();

  // set l to first vfo above or same as target (target),
  // set prev to l's predecessor
  
  vframeOop l, prev= sentinel;
  for (l = prev->next();
       l  &&  l->is_below(target->fr);
       prev = l,  l = prev->next())
    ;
  
  // if none above target, or if none equal to target, return prev
  // can also return prev for interpreter, since all vfo's in same real frame
  //  are for same vframe.

  if ( l == 0  ||  l->is_above(target->fr)  ||  target->is_interpreted()) {
    return prev;
  }

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  compiled_vframe* ctarget = target->as_compiled(); // shortcut
  
  // several vframes with same frame or vframeOop has not been created yet
  
  assert(l->is_equal(ctarget->fr), "just checkin'");

  compiled_vframe* trial_vframe_in_target_frame =
    new_vframe(ctarget->fr)->as_compiled();

  // trial_vframe_in_target_frame iterates through all vframes of the frame,
  // and l/prev follow
  // through the list.
  // CAUTION: some vframeOops might be dead --> do not construct vframes
  
  for (;;) {
    if (l == 0) {
      // at end of list, insert after prev
      assert(  prev == sentinel
           ||  prev->is_below(ctarget->fr)
           ||  ctarget->isCallerOf(
                  ctarget->code->scopes->at(prev->descOffset())),
               "incorrect order");
      if (traceV) lprintf("A");
      return prev;
    }
    if (  trial_vframe_in_target_frame == 0
      ||  l->is_above( trial_vframe_in_target_frame->fr )) {
      // list didn't contain any vframe above target
      assert(l->is_above(ctarget->fr), "should be beyond this frame");
      if (traceV) lprintf("B");
      return prev;
    }
    if ( trial_vframe_in_target_frame->isCallerOf(
            trial_vframe_in_target_frame->code->scopes->at(
                                                 l->descOffset()))) {
      // l is below target; advance it
      if (traceV) lprintf("C");
      prev = l;
      l = l->next();
    }
    else if ( trial_vframe_in_target_frame->desc->is_equal( ctarget->desc )) {
      // found right place to insert
      if (traceV) lprintf("D");
      assert( prev->is_below(ctarget->fr)
           || ctarget->isCallerOf(
                        ctarget->code->scopes->at(prev->descOffset())),
              "incorrect order");
      assert( l->is_equal(ctarget->fr)
              &&  !ctarget->isCallerOf(ctarget->code->scopes->at(
                                                      l->descOffset())),
              "incorrect position");

      return prev;
    }
    else {
      if (traceV) lprintf("E");
      trial_vframe_in_target_frame =
        trial_vframe_in_target_frame->immediateSender()->as_compiled();
    }
  }
# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  ShouldNotReachHere();
  return 0;
# endif
}


vframeOop Process::findVFrameOop(abstract_vframe* vf) {
  // find vframeOop for vf
  vframeOop last = findInsertionPoint(vf);
  vframeOop nxt = last->next();
  if (nxt && vf->EQ(nxt->as_vframe())) {
    return nxt;
  } else {
    return 0;
  }
}

vframeOop Process::insertVFrameOop(vframeOop vfm) {
  ResourceMark rm;
  assert(vfm->process() == this, "wrong process");
  assert(vfm->next() == 0, "shouldn't be linked");
  vframeOop last = findInsertionPoint(vfm->as_vframe());
  vframeOop nxt = last->next();
  if (nxt && vfm->equal(nxt)) {
    fatal("vframeOop already exists");
    return nxt;
  } else {
    if (traceV) lprintf("*** inserting vframeOop %#lx\n", vfm);
    vfm->insertAfter(last);
    return vfm;
  }
}


// kill all vframes up to (but not including) currentVF

void Process::killVFrameOops(abstract_vframe* currentVF) {
  ResourceMark rm;
  vframeOop lastToKill;
  if (currentVF) {
    lastToKill = findInsertionPoint(currentVF);
    if (traceV) 
      lprintf("*** killVFrameOops(currentVF = 0x%x, fr = 0x%x, lastToKill 0x%x)\n",
              currentVF, currentVF->fr, lastToKill);
  } else {
    // was last self frame - kill all vframes
    lastToKill = 0;
  }
  vframeOop sentinel = procObj->vframeList();
  if (lastToKill != sentinel) {
    vframeOop l;
    for (l = sentinel->next(); l != lastToKill; l = l->next()) {
      l->kill(); 
    }
    if (l) l->kill();
    sentinel->set_next(l ? l->next() : 0);
  }

  if (check_vfo_locals) {
    killVFrameOopsInCurrentFrame(currentVF);
    clear_check_vfo_locals();
  }
  
  // check if we returned from stopActivation
  if (stopActivation && !stopActivation->is_live()) {
    stopping = true;
    if (preemptCause == cNoCause) preemptCause = cFinishedActivation;
  }

  if (traceV) verifyVFrameList();
}


// kill vframes which were in current frame at time of last interrupt
//  but have since died

void Process::killVFrameOopsInCurrentFrame(abstract_vframe* currentVF) {
  
  frame* f = frame_for_check_vfo_locals(currentVF);
  if (f == 0) return;

  vframeOop sentinel = procObj->vframeList();

  abstract_vframe* vf = new_vframe(f);
  vframeOop lastToKill = findInsertionPoint(vf);

  trace_killVFrameOopsInCurrentFrame(lastToKill, vf);

  if (lastToKill != sentinel) {
    vframeOop firstSurvivor = lastToKill->next();       // don't kill this one
    vframeOop prev = sentinel;  // prev guy (to delete elems from list)
    vframeOop l    = sentinel->next();
    for ( ;
          l  &&  l != firstSurvivor  &&  l->locals() <= check_vfo_locals;
          l = l->next()) {
      if (l->locals() == check_vfo_locals) {
        // kill l and remove it from the list
        l->remove(prev);
        l->kill(); 
      } else {
        prev = l;
      }
    }
  }
}
  

// check_vfo_locals records the vfo locals of the last frame there
//  was a live vfo for.
// If that frame is not still on the stack, just return 0.

// This routine finds the corresponding frame for check_vfo_locals.
// It also checks that control came back here soon enough
//  to kill any vfos that needed it.
// 
// check_vfo_locals was the bottommost frame last time we checked; it could have
// changed its value if its nmethod branched to an uncommon case.
// If this happened, we have to correct the corresponding vfos.
// Note that we executed at most one call or return since last time,
// but we never get here on a return, since killVFrameOopsInCurrentFrame
// checks for it and does not call me if so,
// so check_vfo_locals must be one of the first two frames.

frame* Process::frame_for_check_vfo_locals(abstract_vframe* currentVF) {
  
  if (currentVF == 0)
    return 0;
  
  frame* first  = currentVF->fr;
  frame* second = first->selfSender();

  // check to see if we have returned since check_vfo_locals
  
  // if frame is no longer on stack, all vfos have been killed through the
  // normal procedure

  if ( check_vfo_locals_sender < first->vfo_locals_of_home_frame()->sender() )
     return 0;

     
  if (traceV) lprintf("*check ");

  if (check_vfo_locals_sender == first->vfo_locals_of_home_frame()->sender()) {
    // still bottom frame
    if (traceV) lprintf("first ");
    return first;
  }
  if ( check_vfo_locals_sender ==
       second->vfo_locals_of_home_frame()->sender() ) {

    // 2nd frame (a call was executed since last check)
    if (traceV) lprintf("second ");
    return second;
  }
  fatal("check_vfo_locals must be either first or second - stopped too late");
  return 0;
}


void Process::set_check_vfo_locals(abstract_vframe* currentVF) {
  // NB: the check_vfo_locals business is necessary because we can't just remember
  // frame* pointers -- these may change!  (Since they depend on the 
  // size of the sp area below the sp area we're interested in)
  
  check_vfo_locals             = currentVF->fr->vfo_locals_of_home_frame();
  check_vfo_locals_sender      = check_vfo_locals->sender();
  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  check_vfo_locals_is_uncommon = currentVF->is_compiled()
                              && currentVF->as_compiled()->code->isUncommon();
# else
  check_vfo_locals_is_uncommon = false;
# endif
}


void Process::clear_check_vfo_locals() {
  check_vfo_locals = check_vfo_locals_sender = 0;
  check_vfo_locals_is_uncommon = false;
}
  

void Process::trace_killVFrameOopsInCurrentFrame( vframeOop lastToKill,
                                                  abstract_vframe* vf ) {
  if (traceV) {
    lprintf("*lastToKill %#lx, vf %#lx\n",
           (long unsigned)lastToKill, (long unsigned)vf);
    vf->print_frame();
  }
}


void Process::convertVFrameOops( frame* fr,
                                 frame* vfoLocals,
                                 nmethod* invalidNM,
                                 int32 vdepth,
                                 abstract_vframe** old_vf,
                                 abstract_vframe** new_vf ) {
  // convert vframes after programming
  // fr, vfoLocals:  old frame/vfo locals (which no longer exist)
  //                   (fr is interpreter_frame... if interpreted)
  // vdepth:  size of the next two params
  // old_vf:  all old vframes (which point to a copy of the invalid frame)
  // new_vf:  the corresponding new vframes (with actual frame pointers)
  //          both arrays are ordered from least to most recent vframe
  //          and the frames are in elements 1..vdepth (0 is the caller)
  ResourceMark rm;
  
  vframeOop l = procObj->vframeList()->next();
  clear_check_vfo_locals();

  LOG_EVENT3("convertVFrameOops %#lx %#lx %d", fr, vfoLocals, vdepth);
  if (traceV) lprintf("*** converting vframeOop %#lx w/ locals 0x%x, descOffset %d\n",
                      l, l->locals(), l->descOffset()->value());
  
  if ( l  &&  l->locals() == vfoLocals ) {

    // Make all vfos which used to point to vfoLocals point to their new
    // frame.  Also change the desc offset.

    for ( int32 i = vdepth;
          l  &&  l->locals() == vfoLocals;
          l = l->next() ) {

      // find i so old_vf[i] matches l

      if (old_vf[i]->is_interpreted()) {
        ; // no inlining: trivially matches
      }
      else {
#       if defined(FAST_COMPILER) || defined(SIC_COMPILER)
          ScopeDesc* ldesc = invalidNM->scopes->at( l->descOffset() );
          for ( ;
                !old_vf[i]->as_compiled()->desc->is_equal(ldesc)  &&  i > 0;
                i--)
            ;
          assert( old_vf[i]->as_compiled()->desc->is_equal(ldesc),  "not found");
#       else
          ShouldNotReachHere(); Unused(invalidNM);
#       endif
      }

      // convert l
      
      l->set_locals(     new_vf[i]->fr->vfo_locals_of_home_frame());
      l->set_descOffset( new_vf[i]->descOffset());
      l->set_method(     new_vf[i]->method());

      if (traceV) lprintf("*** converted vframeOop %#lx to locals 0x%x, descOffset %d\n",
                          l, l->locals(), l->descOffset()->value());
      LOG_EVENT1("converting vframeOop %#lx", l);
    }
  }
  if (traceV) {
    verifyVFrameList();
    printVFrameList(5);
  }
}



// remove dead vframeOops and set up things to regain control at the
// appropriate point(s)
// current is current Self frame (passed in as a speed optimization) or 0

void Process::killVFrameOopsAndSetWatermark(frame* current) {

  // first check for the common case - no vframeOops at all

  if (procObj->vframeList()->next() == 0) {
    clearWatermark();
    return;
  }

  ResourceMark rm;

  if (current == 0 && inSelf()) current = stk.last_self_frame(true); 
  assert(     !current
          ||  stack()->contains((char*)current )
          ||  ConversionInProgress && isOnVMStack(current),
         "not in my stack");

  abstract_vframe* currentVF = current ? new_vframe(current) : 0;

  traceAndLog_killVFrameOopsAndSetWatermark(current, currentVF);

  killVFrameOops(currentVF);

  // may not be anymore vframes to do

  if (procObj->vframeList()->next() == 0) {
    clearWatermark();
    return;
  }
  setWatermark( currentVF);

  traceEpilog_killVFrameOopsAndSetWatermark();
}


// do not need to regain control for vframe killing

void Process::clearWatermark() {
  if (!Memory->needs_scavenge()) clearPreemption();
  clear_check_vfo_locals();
}


// called to arrange to regain control in future to kill
//  any vfos that may be left.
// Assumes procObj vframeList is non-null

void Process::setWatermark( abstract_vframe* currentVF ) {
  
  frame* current = currentVF->fr;
  vframeOop first = procObj->vframeList()->next();

  if (first->is_above(currentVF->fr)) {

    // the only live vframeOops are above the current frame - patch return
    // address

    frame* target = first->locals();
    frame* sender = current->sender();
    for ( ;
         sender->vfo_locals_of_home_frame() != target;
         current = sender, sender = current->sender()) ;
    sender->patch(current);
    clearWatermark();
  }
  else {

    // have live vframeOops in the current frame
    // at next interrupt, we need to check if these are still live (even
    // if the frame isn't the current frame anymore)

    assert( first->is_equal(current),  "cannot be below me");
    assert( first->locals() == current->vfo_locals_of_home_frame(),
            "must be the same");

    set_check_vfo_locals( currentVF );
    
    setupPreemption();
    frame* target = current->selfSender();
    if (target) target->patch(0);
  }
}



void Process::traceAndLog_killVFrameOopsAndSetWatermark( frame* current,
                                                  abstract_vframe* currentVF) {
  LOG_EVENT2("killVFrameOopsAndSetWatermark(%#lx, %#lx)", current, check_vfo_locals);
  if (traceV) {
    lprintf("killVFrameOopsAndSetWatermark(%#lx, %#lx):\n",
           (long unsigned)current, (long unsigned)check_vfo_locals);
    frame* f = current;
    for (int32 i = 0; f && i < 5; i++, f = f->sender())
      lprintf("%#lx ", f);
    lprintf("\n");
    if (currentVF) {
      currentVF->print_frame(0);
      abstract_vframe* s = currentVF->sender();
      if (s) s->print_frame(1);
    }
  }
}


void Process::traceEpilog_killVFrameOopsAndSetWatermark() {
  if (traceV) {
    printVFrameList(5);
    lprintf("\t");
    if (preemptionPending()) lprintf("preemption pending; ");
    lprintf("check_vfo_locals = %#lx, check_vfo_locals_sender = %#lx%s\n",
           (long unsigned)check_vfo_locals,
           (long unsigned)check_vfo_locals_sender,
           check_vfo_locals_is_uncommon ? ", uncommon" : "");
  }
}


bool Process::verifyVFrameList() {
  ResourceMark rm;
  vframeOop last = procObj->vframeList();
  vframeOop nxt;
  for (vframeOop l = last->next(); l; last = l, l = nxt) {
    nxt = l->next();
    if (nxt) {
      frame* fr = l->fr();
      if (l->is_above(nxt->fr())) {
        error2("wrong frame ordering (%#lx > %#lx)", fr, nxt->fr());
        return false;
      }
#     if defined(FAST_COMPILER) || defined(SIC_COMPILER)
      if (fr->is_compiled_self_frame()) {
        ScopeDesc* s = fr->code()->scopes->at(l->descOffset());
        if (l->is_equal(nxt->fr()) && !nxt->as_vframe()->isCallerOf(s)) {
          error2("wrong vframe ordering (vframeOops %#lx and %#lx)", l, nxt);
          return false;
        }
      }
#     endif
      if (l->equal(nxt)) {
        error2("duplicate vframeOops (%#lx and %#lx)", l, nxt);
        return false;
      }
      frame* f = last_self_frame(true);
      while (l->is_above(f)) f = f->sender();
      if (!l->is_equal(f)) {
        error2("invalid frame pointer %#lx in vframeOop %#lx", fr, l);
        return false;
      } else if (f->vfo_locals_of_home_frame() != l->locals()) {
        error2("invalid locals pointer %#lx in vframeOop %#lx",
               l->locals(), l);
        return false;
      }
      // construct the vframe - will fail if we have a bogus vframeOop
      l->as_vframe();
    }
  }
  return true;
}


void Process::printVFrameList(fint howMany) {
  if (procObj->vframeList()->next()) {
    lprintf("***vframe list of process %#lx:\n", this);
    vframeOop l;
    for (l = procObj->vframeList()->next(); l && howMany-- > 0;
         l = l->next()) {
      lprintf("\t"); l->print();
    }
    if (l) lprintf("\t...\n");
  }
}

// --------------------------- processes --------------------------

Processes* processes;
int32 causeString[cLast];       // translates  PreemptCause --> VMString index

Processes::Processes() {
  idle = false; needsInvalidate = false;
  causeString[ cTerminated           ] = PROCESS_TERMINATED;
  causeString[ cAborted              ] = PROCESS_ABORTED;
  causeString[ cStackOverflowed      ] = STACK_OVERFLOW;
  causeString[ cNonLIFOBlock         ] = NON_LIFO;
  causeString[ cYielded              ] = YIELDED;
  causeString[ cSingleStepped        ] = SINGLESTEPPED;
  causeString[ cFinishedActivation   ] = FINISHEDACTIVATION;
  causeString[ cSignal               ] = SIGNAL;
  causeString[ cLowOnSpace           ] = LOWONSPACE;
  causeString[ cCouldntAllocateStack ] = COULDNTALLOCATESTACK;
}

void Processes::startVMProcess() {
  processList = vmProcess;
  vmProcess->init(first_inst_addr(run_the_VM));
  (void)vmProcess->allocate();
  vmProcess->transfer();
}

static enum { terminateIt, abortIt, discardIt } termMode;
static void terminateProcess(Process* p) {
  if (p == twainsProcess) twainsProcess = 0;
  if (p != vmProcess) {
    switch (termMode) {
     case terminateIt: p->terminate(); break;
     case abortIt:     p->abort(); break;
     case discardIt:   break;
     default:          fatal1("wrong termMode %ld", termMode);
    }
  }
}

# define PROCESSES_DO_ALL(name, doName)                                       \
                                                                              \
  void Processes::name() {                                                    \
    SignalInterface::block_self_signals(); /* prevent further context switches */   \
    if (currentProcess != vmProcess) {                                        \
      vmProcess->setPC((process_p)&doName);                                   \
      vmProcess->transfer();                                                  \
    } else {                                                                  \
      doName();                                                               \
    }                                                                         \
  }     

static void proc_deleteDead(Process* p) { if (p->state == aborting) delete p; }

# define PROCESSES_DO_NON_WM(mode)                                            \
  termMode = mode;                                                            \
  assert(currentProcess == vmProcess, "executing in wrong context");          \
  /* kill all processes except vmProcess */                                   \
  processes->processesDo(terminateProcess);                                   \
  prevProcess = vmProcess;      /* otherwise prevProcess is invalid */        \


void doDiscardAll() {
  PROCESSES_DO_NON_WM(discardIt);
  processes->processesDo(proc_deleteDead, true); // deallocate dead processes
  // return to prompt
  DiscardStack();
}

void Processes::processesDo(processesDoFn f, bool doItForAll) {
  Process* q;
  for (Process* p = processList; p; p = q) {
    q = p->next;                // because p could be deleted
    assert(p->state != defunct, "shouldn't have defunct processes in list");
    if (doItForAll || p->state != aborting) {
      f(p);
    }
  }
}

void printProcess(Process* p) { p->print(); }

void Processes::print() {
  processesDo(printProcess, true);
  lprintf("\n");
}

static char* pf;
static Process* pfp;
static void proc_frame_for(Process* p) { if (p->contains(pf)) pfp = p; }
Stack* Processes::slowStackFor(void* f) {
  pf = (char*)f;
  pfp = 0;
  processesDo(proc_frame_for);
  if (pfp == 0) {
    if (ConversionInProgress) {
      // saved stack frame (can only be printed by VM -- for debugging)
      return currentProcess->stack();
    } else {
      // usually fatal error, but don't fatal here because verify tests for it
      return 0;
    }
  }
  assert(pfp != currentProcess, "must not return current stack");
  return pfp->stack();
}

static void proc_chainFrames(Process* p)        { p->chainFrames(); }
static void proc_unchainFrames(Process* p)      { p->unchainFrames(); }
static void proc_scav_contents(Process* p)      { p->scavenge_contents(); }
static void proc_gc_mark_contents(Process* p)   { 
  if (p->zombie) p->processObj()->gc_mark(); }
static void proc_gc_unmark_contents(Process* p) { p->gc_unmark_contents(); }
static void proc_set_zombie(Process *p)         { p->zombie= true; }

static enumeration *theEnumeration;
static void proc_enumerate_references(Process* p) {
  if (p != currentProcess) p->stack()->enumerate_references(theEnumeration); }
static void proc_enumerate_families(Process* p) {
  if (p != currentProcess) p->stack()->enumerate_families(theEnumeration); }

static bool proc_verify_result = true;
static void proc_verify(Process* p)             { proc_verify_result &= p->verify(); }
static void proc_switch_pointers(Process* p)    { p->switch_pointers(); }
static FILE* sf;
static void proc_read_snapshot(Process* p)      { p->read_snapshot(sf); }
static void proc_write_snapshot(Process* p)     { p->write_snapshot(sf); }

void Processes::chainFrames()        { processesDo(proc_chainFrames); }
void Processes::unchainFrames()      { processesDo(proc_unchainFrames); }
void Processes::scavenge_contents()  {
  processesDo(proc_scav_contents, true); 
  processesDo(proc_deleteDead, true);   // deallocate dead processes
}

/*
 GC of processes

 This is done in two parts, in order to detect and mark all processes
 which are not reachable from the system roots (`zombies').  We cannot
 reclaim these processes directly during GC because each must be
 abort()ed to:
 1) Run any NLR code associated with the process' stack.
 2) Zap all blocks associated with the process.
 The Self-side code can get a vector of zombies (using _ZombieProcesses)
 after GC, and abort them.

 The current process and the TWAINS process are considered to be
 roots.  Their C-side structs are scanned, which causes the
 corresponding Self process objects to be marked and later scanned.
 In this first phase of scanning, all non-zombie processes
 are found, and the corresponding C structure are scanned.

 In a second phase, all zombie processes are scanned.

 Important points:
  - Each C Process struct must be scanned precisely once.
  - All structs except those of the current and TWAINS processes are reached
    via ProcessMap::gc_mark_contents.

 miw 4/17/95
*/

void Processes::gc_mark_contents()   {
  processesDo(proc_set_zombie, true);
  markingFromZombies= false;
  currentProcess->gc_mark_contents();
  if (twainsProcess) twainsProcess->gc_mark_contents();
}

void Processes::gc_mark_remaining_processes() {
  markingFromZombies= true;
  processesDo(proc_gc_mark_contents, true); // ensure all processes are marked
}

void Processes::gc_unmark_contents() {
  processesDo(proc_gc_unmark_contents, true);
}

static unsigned int nZombies;
static objVectorOop zombiesVec;
static void count_zombie(Process *p) { if (p->zombie) nZombies++; }
static void add_zombie(Process *p) {
  if (p->zombie)
    zombiesVec->obj_at_put(nZombies++, p->processObj()); }

oop zombie_prim() { return processes->zombies(); }

objVectorOop Processes::zombies() {
  // count the zombies
  nZombies= 0;
  processesDo(count_zombie, true);
  // put them in a vector
  zombiesVec= Memory->objVectorObj->cloneSize(nZombies);
  nZombies= 0;
  processesDo(add_zombie, true);
  return zombiesVec;
}

bool Processes::verify() { 
  bool r = true;
  proc_verify_result = r;
  processesDo(proc_verify, true);
  r &= proc_verify_result;
  return r;
}
void Processes::enumerate_references(enumeration *e) {
  theEnumeration = e; processesDo(proc_enumerate_references); }
void Processes::enumerate_families(enumeration *e) {
  theEnumeration = e; processesDo(proc_enumerate_families); }
void Processes::switch_pointers(oop f, oop t) {
  from = f; to = t; processesDo(proc_switch_pointers, true);
}
void Processes::read_snapshot(FILE* f) {
  sf = f;
  processesDo(proc_read_snapshot);
}
void Processes::write_snapshot(FILE* f) {
  sf = f; processesDo(proc_write_snapshot);
}


static void convertProcess(Process* p) { p->convert(); }
static void convert_cont() { processes->convert_cont(); }

void Processes::convert() { 
  if (needsInvalidate) {
    LOG_EVENT("Processes::convert");
    switchToVMStack(::convert_cont);
    needsInvalidate = false;
  }
}

void Processes::convert_cont() {
  ResourceMark rm;
  FlushRegisterWindows();
  Memory->code->chainFrames();
  processesDo(convertProcess);
  Memory->code->unchainFrames();
}

void Process::nonLifoError() {
  currentProcess->state = stopped;
  if (twainsProcess) {
    preemptCause = cNonLIFOBlock;
    twainsProcess->transfer();
    ShouldNotReachHere();
  } else {
    lprintf("\n*** attempt to invoke non-lifo block (block's enclosing scope has returned)! ***\n");
    currentProcess->stack()->print();
    abort();
  }
}


void interruptCheck() {
   
  if (isStackOverflow((char*)currentFrame())) {
    currentProcess->state = stopped;
    if (twainsProcess) {
      preemptCause = cStackOverflowed;
      twainsProcess->transfer();
      ShouldNotReachHere(); // shouldn't restart this process
    } else {
      lprintf("\n*** Stack Overflow!!\n");
      currentProcess->stack()->print();
      Process::abort_process();
    }
  } else if (profilers->hasOverflow()) {
    // A profiler call InterruptedContext::setupPreemptionFromSignal to empty its filled buffer.
    profilers->handleOverflow();
  } else {
    handlePreemption();
  }
  if (currentProcess->isKillingOrDeoptimizing()) {
    // continue pseudo non-local return (e.g. for KillActivations primitive)
    NLRSupport::continue_NLR_into_Self(false);
  }
}


// run a method, can optionally pass in nm
// caller must preserve arguments in situ!

oop Process::runDoItMethod( oop rcv,
                            oop method,
                            oop* args,
                            fint arg_count ) {
  
  assert(Interpret  ||  arg_count <= 1,
         "unimplemented: cannot pass in > 1 arg to compiled code");
  
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

  nmethod* nm;
  if (!Interpret) { 
    nm = constructDoItMethod( rcv, method );
    if (Trace && WizardMode) {
      lprintf("running do It method 0x%lx\n", (unsigned long) nm);
    }
  }
# endif //  defined(FAST_COMPILER) || defined(SIC_COMPILER)

  oop res = prepare_to_call_self();
  if (res->is_mark())
    return res;

  if (!Interpret) {
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    EventMarker("entering self %d", (void*)nesting);
    res = EnterSelf( rcv, nm->insts(),  arg_count < 1  ?  badOop  : args[0]);
#   else
    ShouldNotReachHere();
#   endif
  }
  else {
    res = interpret( rcv, VMString[DO_IT], 0, method, rcv, args, arg_count);
  }  
  cleanup_after_calling_self();

  return res;
}


oop Process::prepare_to_call_self() {
  if (    PendingSelfSignals::keyboard_signals() != 0
      &&  this == vmProcess 
      &&  nesting == 0) {
    // ^C pressed at the prompt - ignore
    PendingSelfSignals::reset_keyboard_signals();
  }
  if (hadStackOverflow()) {
    if (this == vmProcess && nesting == 0) {
      // clear the stack overflow indicator
      resetStackOverflow();
      state = ready;
    } else {
      // stack overflow in C, e.g. during parsing
      return ErrorCodes::vmString_prim_error(STACKOVERFLOWERROR);
    }
  }
  if (!PendingSelfSignals::are_any_pending() && !preemptionPending()) {
    clearPreemption();
  } else {
    // should immediately preempt
    setupPreemption();
  }
  killVFrameOopsAndSetWatermark(0);
  nesting++;
  
  // in case mac itimer is pending, but it zapped max sp of
  //  wrong process
  currentProcess->setupPreemption();

  return smiOop_zero;
}


void Process::cleanup_after_calling_self() {
  nesting--;
  killVFrameOopsAndSetWatermark(0);
  if ( nesting == 0  &&  this == vmProcess ) {

    // return to the VM prompt; make sure that everything is consistent
    // (could have been aborted)

    assert(twainsProcess == 0, "shouldn't have twains process");
    NLRSupport::reset_have_NLR_through_C();
    SignalBlocker sb;
    processSemaphore = false;
    SignalInterface::unblock_self_signals();
    vmProcess->state = ready;
    assert(isClean(), "should be clean now");
    SignalInterface::flush_input_after_ctrl_c();
  }
  patchForSingleStepping();
}


void Process::cleanup_after_eval_prim(oop res) {
  if (NLRSupport::have_NLR_through_C()) {
    // continue non-local return
    NLRSupport::continue_NLR_into_Self(false);
  } 
  else if (res->is_mark()) {
    if (res == badOop) {
      // syntax error - abort process
      currentProcess->abort();
    } 
    else {
      // return error indication
      if (res == ErrorCodes::vmString_prim_error(STACKOVERFLOWERROR)) {
        currentProcess->stack()->mark();        // repair stack mark
      }
    }
  } 
  else {
    // normal termination
  }
}


// A process can temporarily execute on the Unix stack (e.g. for compiles).

# define SWITCH_TO_VM_STACK(header, call1, call2)                             \
  header {                                                                    \
    frame* f = currentFrame();                                                \
    if (isOnVMStack(f)) {                                             \
      call1;                                                                  \
    } else {                                                                  \
      call2;                                                                  \
    }                                                                         \
  }

SWITCH_TO_VM_STACK(void switchToVMStack(doFn continuation),
                   continuation(),
                   SwitchStack0(first_inst_addr(continuation), vmStackEnd))
                   
SWITCH_TO_VM_STACK(oop switchToVMStack(fntype continuation, void* arg1),
                   return continuation(arg1),
                   return (oop)SwitchStack1(first_inst_addr(continuation),
                                            vmStackEnd, arg1))
                                            
SWITCH_TO_VM_STACK(
  nmethod* switchToVMStack(
    nmethod *continuation(compilingLookup*),
    compilingLookup* L ),
  return continuation(L),
  return (nmethod*)SwitchStack1(first_inst_addr(continuation),
                                vmStackEnd, (void*)L))
                                            
SWITCH_TO_VM_STACK(
  nmethod* switchToVMStack(oop receiver, oop method,
                           constructDoItMethodContinuation continuation),
  return continuation(receiver, method),
  return (nmethod*)SwitchStack2(first_inst_addr(continuation),
                                vmStackEnd, receiver, method))

SWITCH_TO_VM_STACK(
  void switchToVMStack_intSend( simpleLookup* L, int32 arg_count,
                                intLookupContinuation continuation),
  continuation( L, arg_count ),
  SwitchStack2( first_inst_addr(continuation),
                vmStackEnd,
                L,
                (void*)arg_count ) )
     
                   
PROCESSES_DO_ALL(  discardAll, doDiscardAll)


void Process::prepare_to_return_to_self_after_conversion(
                frame* new_last_self_frame, 
                bool& restartSend,
                bool& wasUncommon,
                int32*& uncPC) {
  killVFrameOopsAndSetWatermark(new_last_self_frame);
  wasUncommon = currentProcess->isUncommon();
  // restartAfterConversion is only set by recompilation
  restartSend = wasUncommon || restartAfterConversion;
  uncPC = (int32*)uncommonPC();
  resetUncommon();
  restartAfterConversion = false;
  patchForSingleStepping(new_last_self_frame);
  
  frame* kill_target = new_last_self_frame;
    
  if (traceV && isKilling() && killVF()->as_vframe()->fr == kill_target)
    lprintf("*** stopping senseless killing of innocent frames, kill_target = 0x%x\n", kill_target);
}

bool Process::is_done_with_killing_or_deoptimizing(frame* dest_self_fr) {
  return  isDeoptimizing() // only used for goto bytecode primitive (only last stack frame)
  ||      (isKilling()  &&  killVF()->as_vframe()->fr == dest_self_fr); // for killActivationsUpTo prim

}

