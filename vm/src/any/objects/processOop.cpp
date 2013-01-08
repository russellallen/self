/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



# pragma implementation "processOop.hh"
# include "_processOop.cpp.incl"

oop processOopClass::NewProcess_prim(smi stackSize, oop rcvr, stringOop sel, 
                                     objVectorOop args, void *FH) {
  ResourceMark rm;
  char *selector = sel->copy_null_terminated();
  if (stackSize <= 0 || str_arg_count(selector) > args->length()) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return 0;
  }
  Process* p;
  p = new Process(this, stackSize, rcvr, sel, args);
  return p->processObj();
}

inline Process* checkProcess(oop p) {
  assert(p->is_process(), "not a process");
  Process* proc = processOop(p)->process();
  if (!proc || proc->processObj() != p) {
    return 0;                // dead process or a clone of a process obj
  } else {
    return proc;
  }
}


void processOopClass::kill_process() {
  set_process(0);
  vframeOop sentinel = vframeList();
  sentinel->set_next(0);
}


bool processOopClass::is_live_process() {
  return checkProcess(this) != 0;
}


oop processOopClass::AbortProcess_prim(void *FH) {
  Process* proc = checkProcess(this);
  if (!proc) {
    prim_failure(FH, NOPROCESSERROR);
    return 0;
  }
  if (proc == twainsProcess)  {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return 0;
  }
  preserved pres(this);
  proc->abort();
  if (proc->state == defunct) fatal("process already deleted");
  delete proc;
  return pres.value;
}


oop Yield_prim(oop rcvr, oop arg) {
  if (twainsProcess) {
    if (currentProcess->isSingleStepping()) {
      // yielding counts as a step
      assert(preemptCause == cSingleStepped, "wrong preemptCause");
    } 
    else {
      preemptCause = cYielded;
      yieldRcvr = rcvr;
      yieldArg  = arg;
      { preserved p(rcvr);
        // Self processes that willingly yielded the CPU are suspended here;
        // the other suspension point is in handlePreemption (process.c)
        if (currentProcess->profiler) { 
          currentProcess->profiler->suspend();
        }
        twainsProcess->transfer();
        rcvr = p.value;
      }
      if (currentProcess->isKillingOrDeoptimizing()) {
        // continue non-local return (for KillActivations primitive)
        NLRSupport::continue_NLR_into_Self(false);
      }
    }
  } 
  else {
    // this is a no-op
  }
  assert(!processSemaphore, "processSemaphore should not be set");
  return rcvr;
}

oop ThisProcess_prim(oop rcvr) {
  Unused(rcvr);
  return currentProcess->processObj();
}

oop processOopClass::PrintProcessStack_prim(void *FH) {
  Process* p = checkProcess(this);
  if (!p) {
    prim_failure(FH, NOPROCESSERROR);
    return 0;
  }
  switch (p->state) {
   case ready:
   case stopped:
    p->stack()->print();
    break;
   case initialized:
    lprintf("\nProcess has not started yet.\n");
    break;
   case aborting:
    lprintf("\nProcess is aborting.\n");
    break;
   case defunct:
   default:
    fatal("illegal process status");
  };
  return this;
}

smi TWAINSResultSize_prim() {
  return PendingSelfSignals::Self_result_size();
}

// twains helpers:

Process* processOopClass::TWAINS_receiver_check(void* FH) {
  Process* proc = checkProcess(this);
  if (!proc  || !proc->isRunnable()) {
    prim_failure(FH, NOPROCESSERROR);
    return 0;
  }
  return proc;
}

bool processOopClass::TWAINS_result_vector_check(objVectorOop resultArg,
                                                 void* FH) {
  if (resultArg->length_obj_array() >= PendingSelfSignals::Self_result_size()) {
    return true;
  } else {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return false;
  }
}

vframeOop processOopClass::TWAINS_stop_activation_check(Process* proc,
                                                        oop stop, void* FH) {
  vframeOop stop_vfo = 0;
  if (stop == Memory->nilObj) {
    // no stopping (common case)
  } else if (stop->is_mirror() && mirrorOop(stop)->reflectee()->is_vframe()) {
    // make sure it's live and on proc's stack
    stop_vfo = vframeOop(mirrorOop(stop)->reflectee());
    if (!stop_vfo->is_live()) {
      prim_failure(FH, NOACTIVATIONERROR);
      return vframeOop(badOop);
    }
    if (!proc->contains((char*)stop_vfo->locals())) {
      prim_failure(FH, NOACTIVATIONERROR);
      return vframeOop(badOop);
    }
  } else {
    prim_failure(FH, BADTYPEERROR);
    return vframeOop(badOop);
  }
  return stop_vfo;
}

bool processOopClass::TWAINS_parallel_check(void* FH) {
  if (twainsProcess) {
    prim_failure(FH, PARALLELTWAINSERROR);
    return false;
  } else {
    return true;
  }
}

void processOopClass::TWAINS_transfer_to_another_process(
                        Process* proc,
                        objVectorOop& resultArg, 
                        bool stepping,
                        vframeOop stop_vfo) {
                        
  if (proc->hasStack() || proc->allocate()) {
    // transfer to the other process
    preserved pres1(resultArg);
    if (stepping) {
      proc->setSingleStepping();
      preemptCause = cSingleStepped;    // so it isn't overridden by signals
    }
    if (stop_vfo) proc->setStopPoint(stop_vfo);
    LOG_EVENT3("TWAINS: transfer to %#lx %s stop=%#lx", proc, 
           stepping ? "stepping" : "", stop_vfo); 
    proc->transfer();           // run the other process
    resultArg = objVectorOop(pres1.value);
    if (stepping) {
      assert(preemptCause == cSingleStepped ||
         isFatalCause(preemptCause), "wrong preemptCause");
      proc->resetSingleStepping();
    }
    if (proc->stopping) {
      // returned from stopActivation (but could be way past it, e.g.
      // when process was aborted)
      proc->resetStopping();
      if (!isFatalCause(preemptCause)) preemptCause = cFinishedActivation;
    }
    proc->setStopPoint(0);
  } else {
    // couldn't allocate stack
    preemptCause= cCouldntAllocateStack;
    proc->state= aborting;
  }
}


void processOopClass::TWAINS_await_signal() {
  // nothing to do; just wait for next signal from Unix
  processes->idle = true;
  do {
    // wait for any interrupt
    SignalInterface::wait_for_any();
    // The while loop is necessary for debugging: sigpause
    // ends after a ^C even if gdb doesn't pass the signal.
  } while ( preemptCause == cNoCause );
  processes->idle = false;
}


oop processOopClass::TWAINS_prim(objVectorOop resultArg, 
                                 bool stepping, oop stop, void *FH) {
  if (SignalInterface::are_self_signals_blocked())
    warning("_TWAINS: signals are blocked (with _BlockSignals)");
  
  Process* proc= TWAINS_receiver_check(FH);
  if (proc == 0) return 0;
  if (!TWAINS_result_vector_check( resultArg, FH)) return 0;
  vframeOop stop_vfo= TWAINS_stop_activation_check(proc, stop, FH);
  if (stop_vfo == vframeOop(badOop)) return 0;
  if (!TWAINS_parallel_check(FH)) return 0;

  preemptCause = cNoCause;
  twainsProcess = currentProcess;
  if (PendingSelfSignals::are_any_pending() && !SignalInterface::are_self_signals_blocked()) {
    // return immediately - have unhandled signals
    preemptCause = cSignal;
  }
  else if (proc != twainsProcess) {
    TWAINS_transfer_to_another_process(proc, resultArg, stepping, stop_vfo);
  }
  else {
    TWAINS_await_signal();
  }
  twainsProcess = 0;
  
  oop res = get_result(resultArg);
  LOG_EVENT3("TWAINS: res = %#lx { %#lx, %#lx, ... }", res,
             resultArg->obj_at(0), resultArg->obj_at(1));
  preemptCause = cNoCause;
  return res;
}


oop processOopClass::ProcessReturnValue_prim(void *FH) {
  if (process()) {
    prim_failure(FH, NOPROCESSERROR);
    return 0;
  }
  return get_return_oop();
}

oop processOopClass::get_result(oop resultArg) {
  // compute result and fill in result vector if necessary
  oop res;
  switch (preemptCause) {
   case cTerminated:
   case cAborted:
    res = VMString[causeString[preemptCause]];
    delete prevProcess;
    break;
   case cStackOverflowed:
   case cNonLIFOBlock:
    res = VMString[causeString[preemptCause]];
    assert(prevProcess->state == stopped, "wrong state");
    break;
   case cSingleStepped:
   case cFinishedActivation:
   case cCouldntAllocateStack:
   case cLowOnSpace:
    res = VMString[causeString[preemptCause]];
    break;
   case cYielded:
    res = VMString[causeString[preemptCause]];
    resultArg->obj_at_put(0, yieldRcvr);
    resultArg->obj_at_put(1, yieldArg);
    break;
   case cSignal:
    res = VMString[SIGNAL];
    PendingSelfSignals::pass_to_Self(resultArg);
    break;
   case cNoCause:
   case cLast:
   default:
    fatal1("unknown/illegal preemptCause %ld", preemptCause);
  }
  return res;
}

// debugging primitives
smi processOopClass::StackDepth_prim(void *FH) {
  Process* p = checkProcess(this);
  if (!p) {
    prim_failure(FH, NOPROCESSERROR);
    return 0;
  }
  int32 vdepth = p->stack()->vdepth();
  if (p != vmProcess && vdepth > 0) vdepth--;   // hide dummy doIt vframe
  return vdepth;
}

typedef BoundedListTemplate<abstract_vframe*> VFrameBList;

static VFrameBList*  vframeBList;
static void addVFrameToList(abstract_vframe* vf) { vframeBList->append(vf); }

vframeOop processOopClass::clone_vframeOop(abstract_vframe* vf, Process* p,
                                           bool mustAllocate) {
  vframeOop vfo;
  MethodKind k = vf->method()->kind();
  switch (k) {
   case OuterMethodType:
    vfo= Memory->outerActivationObj->basic_clone(mustAllocate); break;
   case BlockMethodType:
    vfo= Memory->blockActivationObj->basic_clone(mustAllocate); break;
   default:
    fatal("unexpected kind");
  }
  if (oop(vfo) != failedAllocationOop) {
    vfo->set_process(p);
    vfo->set_locals(vf->fr->vfo_locals_of_home_frame());
    vfo->set_method(vf->method());
    vfo->set_descOffset(vf->descOffset());
  }
  return vfo;
}

oop processOopClass::ActivationStack_prim(void *FH) {
  ResourceMark rm;
  Process* p = checkProcess(this);
  if (p == currentProcess)
    p->killVFrameOopsAndSetWatermark( p->last_self_frame(false));
  if (!p) {
    prim_failure(FH, NOPROCESSERROR);
    return 0;
  }
  FlushRegisterWindows();

  vframeBList = new VFrameBList(1000);

  p->stack()->vframes_do(addVFrameToList);

  bool hideFirst = p != vmProcess;
  if (vframeBList->nonEmpty() && hideFirst) (void) vframeBList->pop();

  smi len= vframeBList->length();
  objVectorOop resultVec= Memory->objVectorObj->cloneSize(len, CANFAIL);
  if (oop(resultVec) == failedAllocationOop) {
    out_of_memory_failure(FH, Memory->objVectorObj->size() + len);
    return 0;
  }

  oop*         resultp   = resultVec->objs();

  // Build the result as a merge of vframeBList and existing vframeOops
  // and save mirrors of all the resulting vframeOops.
  vframeOop prev  = vframeList();
  vframeOop merge = prev->next();
  for (int i = 0; i < vframeBList->length(); i++) {
    abstract_vframe* vf = vframeBList->nth(i);
    mirrorOop mirror;
    if (merge && merge->is_equal(vf)) {
      mirror= merge->as_mirror_or_fail();
      if (oop(mirror) == failedAllocationOop) {
        out_of_memory_failure(FH);
        return 0;
      }
      prev  = merge;
      merge = merge->next();
    } else {
      vframeOop vfo= clone_vframeOop(vf, p, CANFAIL);
      if (oop(vfo) == failedAllocationOop) {
        out_of_memory_failure(FH);
        return 0;
      }
      mirror= vfo->as_mirror_or_fail();
      if (oop(mirror) == failedAllocationOop) {
        out_of_memory_failure(FH);
        return 0;
      }
      vfo->insertAfter(prev);
      prev = vfo;
    }
    Memory->store(resultp++, mirror);
  }
  if (p == currentProcess)
    p->killVFrameOopsAndSetWatermark( p->last_self_frame(false));
  return resultVec;
}


abstract_vframe* processOopClass::vframe_at(smi index, void *FH, Process*& p,
                                   frame*& last) {
  p = checkProcess(this);
  if (!p) {
    prim_failure(FH, NOPROCESSERROR);
    return 0;
  }
  if (index < 0 || !p->inSelf()) {
    prim_failure(FH, BADINDEXERROR);
    return 0;
  }
  FlushRegisterWindows();
  last = p->last_self_frame(false);
  abstract_vframe* vf = new_vframe(last);
  if (vf->is_prologue()) vf = vf->sender();
  bool hideFirst = p != vmProcess;
  int32 i = 0;
  for ( ;; ) {
    if (i == index) break;
    vf = vf->sender();
    i++;
    if (!vf) break;
  }
  if (!vf || (vf->is_first_self_vframe() && hideFirst)) {
    prim_failure(FH, BADINDEXERROR);
    return 0;
  }
  return vf;
}

oop processOopClass::ActivationAt_prim(smi index, void *FH) {
  ResourceMark rm;
  Process* p;
  frame* last;
 abstract_vframe* vf = vframe_at(index, FH, p, last);
  if (!vf) return 0; 
  oop vfo = new_vframeOop(p, vf)->as_mirror();
  if (p == currentProcess) p->killVFrameOopsAndSetWatermark(last);
  return vfo;
}

oop processOopClass::KillUpTo_prim(smi index, void *FH) {
  ResourceMark rm;
  preserved pres1(this);
  Process* p;
  frame* last;
  abstract_vframe* vf = vframe_at(index, FH, p, last);
  if (!vf) return 0; 
  if (!p->isRunnable()) {
    failure(FH, "process is not runnable");
    return 0;
  }
  if (p == currentProcess) {
    failure(FH, "cannot operate on current process");
    return 0;
  }
  if (p == twainsProcess) {
    failure(FH, "cannot operate on scheduler process");
    return 0;
  }
  p->killFrames(vf);
  assert(!p->isKilling(), "shouldn't be in killing mode anymore");
  return pres1.value;
}

oop processOopClass::GotoByteCode_prim(smi bci, objVectorOop exprStack,
                                       void *FH) {
  ResourceMark rm;
  preserved pres1(this);
  Process* p;
  frame* last;
  abstract_vframe* vf = vframe_at(0, FH, p, last);
  if (!vf) return 0; 
  if (!p->isRunnable()) {
    failure(FH, "processes is not runnable");
    return 0;
  }
  if (p == currentProcess) {
    failure(FH, "cannot operate on current process");
    return 0;
  }
  if (p == twainsProcess) {
    failure(FH, "cannot operate on scheduler process");
    return 0;
  }
  p->gotoByteCode(vf, bci, exprStack, FH);
  return pres1.value;
}


    
