/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "stack.hh"
# include "_stack.cpp.incl"


# define MAGIC  123456789

// This must be a macro - can't return current frame from a real function.
# define GET_LAST_FRAME1(fr)                                                  \
  InterruptedContext::the_interrupted_context->must_be_in_self_thread();      \
  frame* fr;                                                                  \
  if (process != currentProcess) {                                            \
    fr = (frame*)process->lastSP();                                           \
  } else if (InterruptedContext::the_interrupted_context->is_set()) {         \
    fr = InterruptedContext::the_interrupted_context->sp();                   \
  } else {                                                                    \
    FlushRegisterWindows();                                                   \
    fr = currentFrame();                                                      \
  }
 
# ifdef ASSERT_but_hprofiler_does_this
#   define GET_LAST_FRAME(fr)                                                 \
      GET_LAST_FRAME1(fr);                                                    \
      if (!is_off_signal_stack((char*)fr))  \
        warning("traversing stack in interrupt handler - might not work");
# else
#   define GET_LAST_FRAME(fr) GET_LAST_FRAME1(fr)
# endif 

frame* Stack::callee_of(const frame* f) {
  GET_LAST_FRAME(p);
  for (frame* q;  p;  p = q) {
    q = p->sender();
    if (q == f) return p;
    assert(!p->is_first_self_frame(), "cannot find bottom of frame!");
  }
  ShouldNotReachHere(); // cannot find bottom of frame
  return 0;
}



frame* Stack::first_VM_frame() {
  if (process->nesting == 0)
    return 0;
  GET_LAST_FRAME(f);
  assert(f->is_aligned(), "alignment");
  frame* res = f;
  frame* senderFrame;
  for (;;) {
    senderFrame = res->sender();
    if (senderFrame == 0)
      return 0;
    if (senderFrame->is_self_frame())
      return res;
    res = senderFrame;
  }
}


// May not work if this frame is the first_VM_frame,
//  but I don't know why -- dmu
// Also returns corresponding RegisterLocator if rl is non null

frame* Stack::last_self_frame(bool includePrologue, RegisterLocator** rl) {
  frame* ff = first_VM_frame(); // sets senderFrame as side-effect
  if (ff == 0) return 0;
  
  frame* senderFrame = ff->sender();
  frame* result = !includePrologue  &&  senderFrame->is_in_prologue()
    ?  senderFrame->selfSender()    // if in prologue. sender is the first real frame
    :  senderFrame;                 // includePrologue means: return this frame even if nmethod is in prologue

  if (rl != 0) {
    GET_LAST_FRAME(f);
    RegisterLocator* first_rl = RegisterLocator::for_sender_of(f);
    *rl = first_rl->climb_to_frame(result);
    assert(*(int32*)(*rl)->fr() || true,  "ensure frame is valid");
  }
  
  return result;
}


frame* Stack::find_frame_entering(char* ep) {
  GET_LAST_FRAME(f);
  
  for (  frame* res = f;  res;  res = res->sender())
    if (res->c_entry_point() == ep)
      return res;    
  return 0;
}

// If the interpreter calls a primitive which starts a non-local
// return (e.g. unwind_protect),
// NLRSupport::continue_NLR_into_Self needs to find the interpreter frame to return to.
// It is the one which called CallPrimitiveFromInterpreter

frame* Stack::interpreter_frame_for_continuing_NLR_from_primitive() {
  GET_LAST_FRAME(f);
  
  for (  frame* res = f;  res;  res = res->sender()) {
    char* ep = res->c_entry_point();
    if ( ep == first_inst_addr( CallPrimitiveFromInterpreter )
    ||   ep == first_inst_addr( interruptCheck ) 
    ||   ep == first_inst_addr( InterpreterLookup_cont ))
      return res->sender();    
  }
  return 0;
}


// If the interpreter ends up in Conversion::returnToSelf
// it must have gotten there from calling HandleReturnTrap

frame* Stack::interpreter_frame_for_continuing_from_return_trap() {
  return find_frame_entering( first_inst_addr(HandleReturnTrap) )
           ->sender();
}


void Stack::consistencyCheck(primDoFn pfn, frame* lastSelfFrame) {
  if (preemptCause == cNonLIFOBlock) return;

  if (!lastSelfFrame) {
    lastSelfFrame = last_self_frame(true);
  }
 
  assert(lastSelfFrame->is_self_frame(), "should be a self frame");
  PrimDesc* pd;
  if ( lastSelfFrame->is_compiled_self_frame() ) {
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    sendDesc* sd = lastSelfFrame->send_desc();
    if (sd == 0) return;     // uncommon trap, or after fatal error
    // sd could be a prim. call or a lookup
    // don't need to check canScavenge et al for a lookup
    if (!sd->isPrimCall()) return;
    char* fn_start = sd->jump_addr();
    pd = getPrimDescOfFirstInstruction(fn_start, true);
    if (!pd) {
      warning1("stack: entry for primitive call to %#lx not found!!!",
               fn_start);
      return;
    }
#   endif
  } else {
    interpreter* interp = lastSelfFrame->get_interpreter();
    assert( interp != 0,
            "if interpreted, lastSelfFrame must be tops for this activation");
    pd = interp->getPrimDesc();
    if (pd == 0) return;
  }
  pfn(pd);
}


static int frame_count;

// Note: caller must have a resource mark; (for RegisterLocators)

void Stack::frames_do(framesDoFn fn, primDoFn pfn) {
  // use true for PPC: need to catch OOPS even if first self frame called interrupt check from its prologue
  if (!process->inSelf(true)) return; 
  
  frame* f = first_VM_frame();
  RegisterLocator* reg_locs = RegisterLocator::for_sender_of(f); // RegisterLocators only work for Self frames
  
  if (pfn) consistencyCheck(pfn);    // do consistency check for prim call
  
  frame_count = 0;
# if  GENERATE_DEBUGGING_AIDS
    frame *ff, *fff, *ffff;
# endif
  for ( ; f != 0;  
          f = f->sender()) {
          
    if (f->is_self_frame()) {
      reg_locs = reg_locs->climb_to_frame(f);
      (*fn)(f, reg_locs);
    }
    else
      (*fn)(f, 0);
      
    ++frame_count;
    assert(frame_count < 1000000, "figure-6 bug");
#   if  GENERATE_DEBUGGING_AIDS
      if (SpendTimeForDebugging) {
        ffff = fff;  fff = ff;  ff = f;
      }
#   endif
  }
}

void Stack::vframes_do(vframesDoFn fn, frame* fr) {
  if (!process->inSelf()) return;
  abstract_vframe* vf = new_vframe(fr ? fr : last_self_frame(false));
  assert(vf->real_bci() != PrologueBCI && vf->real_bci() != EpilogueBCI,
         "bottom most activation must be a valid vframe");
  do {
    (*fn)(vf);
    vf = vf->sender();
  } while (vf);
}

static int32 d;
static void frame_inc_depth(frame* f, RegisterLocator*) { if (f->is_self_frame())  ++d; }
static void vframe_inc_depth(abstract_vframe* f) { Unused(f); d ++; }

int32 Stack::depth() {
  ResourceMark m;
  d = 0;
  frames_do(frame_inc_depth);
  return d;
}

static void frame_remove_patch(frame* f, RegisterLocator*) { if (f->is_self_frame())  f->remove_patch(); }

void Stack::remove_patches() {
  // remove all return address patches
  ResourceMark m;
  frames_do(frame_remove_patch);
}


// I am called repeatedly on every process's stack to
//  build linked lists of frames that use a particular nmethod.
// When this is done, every nmethod that is on a stack will
//  have its frame chain link set to a frame whose frame chain link
//  will point to the next frame using the same nmethod, etc. -- dmu

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

void Stack::chainFrames() {
  // this is called a lot, so watch out for performance bugs
  // that's also why it doesn't use frames_do
  frame* f = last_self_frame(true);
  while (f) {
    if (f->is_compiled_self_frame()) {
      nmethod* nm = f->code();
      f->set_nmethod_frame_chain(nm->frame_chain, nm);
      nm->frame_chain = f;
    }
    f = f->selfSender();
  }
}


void Stack::unchainFrames() {
  frame* f = last_self_frame(true);
  while (f) {
    if (f->is_compiled_self_frame())
      f->code()->clear_frame_chain();
    f = f->selfSender();
  }
}

# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)

void Stack::chainFrames() {}
void Stack::unchainFrames() {}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


    
static enumeration *theEnumeration;

static void vframe_enumerate_references(abstract_vframe* vf) {
  vf->enumerate_references(theEnumeration);
}

static void vframe_enumerate_families(abstract_vframe* vf) {
  vf->enumerate_families(theEnumeration);
}

void Stack::enumerate_references(enumeration *e) {
  theEnumeration = e;
  vframes_do(vframe_enumerate_references);

  // Check for block references in this stack
  if (e->get_num_live_vframes() > 0 ) {
     oop *targetp = e->get_targets();
     for (int index = 0; 
              index < e->get_num_live_vframes();
            ++index) {

      abstract_vframe* vf   = new_vframe(last_self_frame(false));
      abstract_vframe* tvf  = vframeOop(targetp[index + e->get_num_live_vframes()])->as_vframe();
      abstract_vframe* prev = 0;
      for (  ; vf  &&  !vf->EQ(tvf);  prev = vf, vf = vf->sender()) {
        abstract_vframe* parentVF = vf->parent();
        if (parentVF && parentVF->EQ(tvf)) {
          e->add_obj(new_vframeOop(process, vf));
        } 
      }
      if (prev && vf) {
        assert(prev->sender()->EQ(vf), "just checking");
        e->add_obj(new_vframeOop(process, prev));
      }
    }
  }
}

void Stack::enumerate_families(enumeration *e) {
  theEnumeration = e;
  vframes_do(vframe_enumerate_families);
} 

int32 Stack::vdepth(frame* f) {
  ResourceMark m;
  d = 0;
  vframes_do(vframe_inc_depth, f);
  return d;
}

void Stack::print() {
  ResourceMark m;
  LOG_EVENT("VM stack dump");           // mark likely point of error
  int32 maxFrame = StackPrintLimit;
  frame* last = last_self_frame(false);
  if (last == 0) {
    lprintf("No Self stack!\n\n");
    return;
  }
  abstract_vframe* v = new_vframe(last);
  int32 depth = vdepth(last);
  bool omitFirst = currentProcess != vmProcess;
  if (omitFirst) depth--;
  
  fint curFrame = 0;
  fint printFrame = 0;
  for (; curFrame < maxFrame;  ++curFrame) {
    if (v == 0 || (v->is_first_self_vframe() && omitFirst)) return;
    if (v->print_frame(printFrame)) {
      printFrame ++;
    }
    v = v->sender();
  }
  
  if (curFrame  <  depth - maxFrame)
    lprintf("\n# %d - # %d: skipped, stack print limit is %d\n\n",
           curFrame,  depth - maxFrame - 1, maxFrame);
  
  for (;  curFrame  <  depth - maxFrame;  ++curFrame) {
    assert(!v->is_first_self_vframe(), "bad stack depth");
    v = v->sender();
  }
  
  for (;  v;  ++curFrame) {
    if (v->is_first_self_vframe() && omitFirst) break;
    v->print_frame(curFrame);
    v = v->sender();
  }
}

void print_stack() {
  currentProcess->stack()->print();
}

static void frame_scavenge_contents(frame* f, RegisterLocator* rl) { f->scavenge_contents(rl); }
static void frame_gc_mark_contents(frame* f, RegisterLocator* rl) { f->gc_mark_contents(rl); }
static void frame_gc_unmark_contents(frame* f, RegisterLocator* rl) { f->gc_unmark_contents(rl); }
static bool frame_verify_result = true;
static void frame_verify(frame* f, RegisterLocator* rl) { frame_verify_result &= f->verify(frame_count, rl); }
static oop from;
static oop to;
static void frame_switch_pointers(frame* f, RegisterLocator* rl) { f->switch_pointers(from, to, rl); }

static void check_scavenge(PrimDesc* pd) {
  if (!pd->canScavenge()) {
    fatal1("incorrect primitive entry for %s: canScavenge must be set",
           pd->name());
  }
}
void Stack::scavenge_contents()  { ResourceMark rm;  frames_do(frame_scavenge_contents, check_scavenge); }
void Stack::gc_mark_contents()   { ResourceMark rm;  frames_do(frame_gc_mark_contents); }
void Stack::gc_unmark_contents() { ResourceMark rm;  frames_do(frame_gc_unmark_contents); }
bool Stack::verify()             {
  bool r = true;
  ResourceMark rm;  
  if (markDestroyed()) {
    error1("Stack of process %#lx has overflowed", process);
    r = false;
  }
  frame_verify_result = r;
  frames_do(frame_verify);
  return frame_verify_result;
}

void Stack::switch_pointers(oop f, oop t) {
  from = f;
  to = t;
  ResourceMark rm;  
  frames_do(frame_switch_pointers, check_scavenge);
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

void Stack::convert() {
  ResourceMark rm;
  if (!process->inSelf()) return;
  frame* f = last_self_frame(true);
  frame* prev = 0;
  do {
    if (f->is_compiled_self_frame()) {
      nmethod* nm = f->code();
      if (nm->isInvalid()) {
        // need to convert this frame when control returns to it
        f->patch(prev);
      }
    }
    prev = f;
    f = f->sender();
  } while (f);
}

# else // defined(FAST_COMPILER) || defined(SIC_COMPILER)

void Stack::convert() {}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)



void Stack::mark() {
  int32* p = mark_addr();
  *p-- = MAGIC; *p-- = MAGIC; *p-- = MAGIC; *p = MAGIC;
  p = (int32*)base;
  *p++ = MAGIC; *p++ = MAGIC; *p++ = MAGIC; *p = MAGIC;
}

bool Stack::markDestroyed() {
  if (!base) return false;      // stack hasn't been allocated yet
  int32* p = (int32*)base;
  if (!(*p++ == MAGIC && *p++ == MAGIC && *p++ == MAGIC && *p == MAGIC)) {
    fatal("unrecoverable stack overflow while executing in VM");
  }
  p = mark_addr();
  return !(*p-- == MAGIC && *p-- == MAGIC && *p-- == MAGIC && *p == MAGIC);
}

bool Stack::allocate() {
  base= AllocateHeap(size, "a process stack", false);
  return base != 0;
}

void Stack::deallocate() {
  if (markDestroyed())
    warning("A process stack has overflowed - memory may be corrupted!!");
  selfs_free(base);
  base = (char*)1;      // cause bus error if dereferenced
}
