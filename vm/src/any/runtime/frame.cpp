/* Sun-$Revision: 30.19 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "frame.hh"
# pragma implementation "frame_inline.hh"

# include "_frame.cpp.incl"


frame* frame::nmethod_frame_chain(nmethod* nm) {
  return *nmethod_frame_chain_addr(nm); }
  
void   frame::set_nmethod_frame_chain(frame* f, nmethod* nm) {
  *nmethod_frame_chain_addr(nm) = f; }
  
objVectorOop frame::patched_frame_saved_outgoing_args(nmethod* nm) {
  if (!SaveOutgoingArgumentsOfPatchedFrames)
    return NULL;
  assert(is_patched(), "saved outoing args only in patched frame");
  return *patched_frame_saved_outgoing_args_addr(nm); 
}
  
void frame::set_patched_frame_saved_outgoing_args(objVectorOop args, nmethod* nm) {
  *patched_frame_saved_outgoing_args_addr(nm) = args;
}


char* frame::platform_independent_return_addr() {
  char* r = real_return_addr();
  if (isPatchedReturnAddress(r)) {
    char** addr = currentPC_addr();
    assert(Memory->code->contains(*addr), "saved currentPC not in zone");
    return *addr;
  }
  else {
    return r;
  }
}


void frame::set_return_addr(char* addr) {
  char** r = real_return_addr_addr();
  if (isPatchedReturnAddress(*r)) {
    r = currentPC_addr();
    assert(Memory->code->contains(*r), "saved currentPC not in zone");
  }
  *r = addr;
}


char* frame::currentPC() {
  return *currentPC_addr();
}

void  frame::set_currentPC(char* p) {
  *currentPC_addr() = p;
}

char*  frame::real_return_addr() { return *real_return_addr_addr(); }
void   frame::set_real_return_addr(char* x) { *real_return_addr_addr() = x; }

void frame::adjust_return_addr(int32 delta) {set_return_addr(return_addr() + delta);}

Stack* frame::my_stack()   { 
  Stack* s = processes->stackFor(this); 
  assert(s != NULL, "");
  return s;
}

bool frame::is_compiled_self_frame() {
  return Memory->code->contains(return_addr());
}

bool frame::is_self_stub_frame() {
  return Memory->code->sZone->contains(return_addr());
}

bool frame::is_self_frame() {
  return is_compiled_self_frame() || is_interpreted_self_frame();
}
    
bool frame::is_first_self_frame() {
  return is_self_frame() && selfSender() == NULL;
}


frame* frame::sendee(frame* startFrameHint) {
  // search for full frame starting at the given frame; do full stack search
  // if not found
  // used during conversions if the full frame could be a copied frame
  frame* f = startFrameHint;
  while (f && f->sender() != this) f = f->sender();
  if (f == NULL) f = my_stack()->callee_of(this);
  return f;
}

// return next Self frame (skipping all C frames in between) or zero
// if there are no more Self frames
  
frame* frame::selfSender() {
  frame* f = this;
  for (;;) {
    f = f->sender();
    if (f == NULL  ||  f->is_self_frame())
      return f;
  }
}

// same but do not skip C frames

frame* frame::immediateSelfSender() {
  frame* f = sender();
  return f != NULL  &&  f->is_self_frame() ? f : NULL;
}


int32 frame::frame_size() {
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (ConversionInProgress && is_compiled_self_frame()) {
    // could be a copied frame (in the resource area), i.e. sl < l; take
    // size from nmethod
    return code()->frameSize();
  }
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  return frame_size_of_uncopied_frame();
}


// testers

interpreter* frame::get_interpreter_of_block_scope() {
  char* cep = c_entry_point();
  if (cep == NULL)  return NULL;
  Location loc = location_of_interpreter_of_block_scope( cep);
  return loc == IllegalLocation ? NULL : (interpreter*) *location_addr(loc);
}


interpreter* frame::get_interpreter() {
  //  on sparc uses sender, on ppc, same frame
  frame* f= block_scope_of_home_frame();
  if (f == NULL)
    return NULL;
  return f->get_interpreter_of_block_scope();
}



bool frame::is_interpreted_self_frame() {
# if TARGET_OS_VERSION == MACOSX_VERSION
  // breaks when scanning stack for spy
  if (Interpret) fatal("Interpreter does not work on OSX");
  return false;
# else
  return get_interpreter() != NULL;
# endif
}
  
  
fint frame::vdepth(bool includePrologueVframe) {
  abstract_vframe* vf = new_vframe(this);
  if (!includePrologueVframe &&
      (vf->real_bci() == PrologueBCI || vf->real_bci() == EpilogueBCI)) {
    if (vf->is_top()) return 0;
    vf = vf->immediateSender();
  }
  fint n;
  for (n = 1;  !vf->is_top();  vf = vf->immediateSender()) n++;
  return n;
}


nmethod* frame::code() {
  // this is called a lot, so watch out for performance bugs
# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  assert(is_compiled_self_frame(), "not a self frame");
  // The subtraction below does not seem to be needed to me.
  // But We need to work on Klein, so I'm not messing with it. -- dmu 2/04
  // Note, this also occurs in Pc::my_nmethod.
  nmethod* r = nmethodContaining(return_addr() - sizeof(class nmethod), NULL);
  # if GENERATE_DEBUGGING_AIDS
    if (CheckAssertions) {
      char* ra = return_addr();
      nmethod* nm1 = NULL;
           if   (r->contains(ra))  ;
      else if ((nm1 = nmethodContaining(ra, NULL))->contains(ra))
              fatal("should not have subtracted");
      else    fatal3("value 0x%x is not in any nmethod, either 0x%x, or 0x%x",
                     ra, r, nmethodContaining(ra, NULL));
    }
  # endif
  return r;
# else
  ShouldNotReachHere();
  return NULL;
# endif
}

void frame::nmethod_moved_by(int32 delta, nmethod* where_nm_is_now) {
  for (frame* f = this;
       f != NoFrameChain && f != SavedFrameChain;
       f = f->nmethod_frame_chain(where_nm_is_now)) {
    f->adjust_return_addr(delta);
  }
}


void frame::patch(frame* prev, bool forceSelfFrame ) {
  if (is_interpreted_self_frame())
    patch_interpreted_self_frame(false);
  else
    patch_compiled_self_frame( return_addr_for_patching(forceSelfFrame, prev) );
}


void frame::patch_profiler_trap() {
  if (is_interpreted_self_frame()) {
    patch_interpreted_self_frame(true);
  }
  else {
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)

    if (isPatchedReturnAddress(return_addr())) {
      return;
    }
    patch_compiled_self_frame((void(*)(...)) ProfilerTrap);

#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        sendDesc* sd = sendDesc::sendDesc_from_return_PC(real_return_addr());
        char* insts =  sd->jump_addr();
        assert( Memory->code->contains(insts) ||
                Memory->code->stubs->contains(insts) ||
                insts == Memory->code->trapdoors->SendMessage_stub_td(),
                "should call self code");
      }
#   endif
#   else
    ShouldNotReachHere();
#   endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
  }
}


void frame::patch_interpreted_self_frame(bool forProfiling) {
  interpreter* interp = get_interpreter();
  if (forProfiling && interp->is_return_patched())
    return;
  interp->patch_return(forProfiling ? patched_for_profiling : patched);
}


// sets a patch so that execution stops when control returns to this frame

void frame::patch_compiled_self_frame(returnTrapHandlerFn new_fn) {
  char* ret = return_addr();
  // don't patch top Self frame
  if ( ret == first_inst_addr((void*)firstSelfFrame_returnPC))
    return;

  assert(is_compiled_self_frame(), "must be compiled");
  assert( new_fn == (returnTrapHandlerFn)ReturnTrap  ||  
          new_fn == (returnTrapHandlerFn)PrimCallReturnTrap  ||
          new_fn == (returnTrapHandlerFn)ProfilerTrap, "patching to wild address");
  assert(   Memory->code->contains(ret)
         || ret == first_inst_addr((void*)firstSelfFrame_returnPC),
         "ret addr not in zone, already patched?");

  trace_patch(new_fn);
  
  // must be before we set currentPC so following code can test it
  save_outgoing_arguments();
  
  set_currentPC(ret);
  set_real_return_addr(first_inst_addr((void*)new_fn));
}


// In order to be able to restart a send after a return trap
// (for the KillActivationsUpTo primitive, or uncommon branches, etc.)
// We will need the outgoing arguments of the patched frame.
// On architectures like the PPC, we need to get this from the callee frame
// BEFORE it returns. So get them now and save in a place findable from this frame.
// This counts on a trampoline when going into primitives that can walk the stack,
// which only currently works for PPC.

void frame::save_outgoing_arguments() {
  if (!SaveOutgoingArgumentsOfPatchedFrames) {
    return;
  }
  frame* s = sendee();
  if (s->return_addr() == (char*)&ReturnTrap_returnPC
  ||  s->return_addr() == (char*)&ReturnTrapNLR_returnPC 
  ||  s->return_addr() == (char*)&Recompile_stub_returnPC 
  ||  s->return_addr() == (char*)&DIRecompile_stub_returnPC
  ||  s->return_addr() == (char*)&    MakeOld_stub_returnPC ) {
    // we are currently in HandleReturnTrap and this is the frame
    // corresponding to the original patched frame, so use its
    // outgoing args  -- dmu 2/03
    assert(OutgoingArgsOfReturnTrapOrRecompileFrame->verify(), "check args");
    set_patched_frame_saved_outgoing_args(OutgoingArgsOfReturnTrapOrRecompileFrame);
  }
  else
    set_patched_frame_saved_outgoing_args(extract_outgoing_args());
}


objVectorOop frame::extract_outgoing_args(frame* sendeeOrNULL) {
  if (!SaveOutgoingArgumentsOfPatchedFrames) {
    return NULL;
  }
  assert(is_self_frame(), "only works for Self frames");
  const bool traceEOA = false;
 
  frame* s = sendeeOrNULL == NULL  ?  sendee()  :  sendeeOrNULL;
  fint nargs = outgoing_arg_count(s);
  ResourceMark rm;
  RegisterLocator* srl = s->is_self_frame() ? RegisterLocator::for_frame(s) : NULL;
  objVectorOop saved_args_and_rcvr = Memory->objVectorObj->cloneSize(nargs + 1 /* rcvr */);
  if (traceEOA) lprintf("***** frame::extract_outgoing_args: ");
  for (fint i = 0;  i < nargs + 1;  ++i) {
    oop arg = *(oop*) s->location_addr_of_incoming_argument(LocationOfSavedOutgoingArgInSendee(i-1), srl);
    assert(arg->verify_oop(), "bad outgoing argument");
    saved_args_and_rcvr->obj_at_put(i, arg);
    if (traceEOA) { lprintf(" %s", arg->debug_print()); }
  }
  if (traceEOA)  lprintf("\n\n");
  return saved_args_and_rcvr;
}


fint frame::outgoing_arg_count(frame* sendee) {
  const bool traceOAC = false;
  // w/o rcvr
  // May return -1 of there is not even a receiver.
  sendDesc* sd = send_desc();
  fint r;
  if (sd->isPrimCall()) {
    char* addr = sd->jump_addr();
    PrimDesc* pd = getPrimDescOfFirstInstruction(addr, true);
    assert(pd != NULL, "no primitive descriptor");
    r = pd->arg_count();
    if (traceOAC) lprintf("***** frame::outgoing_arg_count: pd = %s, r = %d\n", pd->name(), r);
  }
  // calling self, may be _Perform
  else
    r = sd->arg_count();
  return r;
}


void frame::trace_patch(returnTrapHandlerFn new_fn) {
  LOG_EVENT2("patching frame %#lx to %#lx", this, first_inst_addr((void*)new_fn));
  
  if (traceV) {
    const char* n =
        new_fn == (returnTrapHandlerFn)        ReturnTrap ?         "ReturnTrap"
      : new_fn == (returnTrapHandlerFn)PrimCallReturnTrap ? "PrimCallReturnTrap"
      : new_fn == (returnTrapHandlerFn)      ProfilerTrap ?       "ProfilerTrap"
      : "Unknown";
    
    lprintf("*patching frame %#lx to %s from %#lx\n",
           (long unsigned)this, n,
           (long unsigned)(real_return_addr()));
  }
}
  

returnTrapHandlerFn frame::return_addr_for_patching( bool forceSelfFrame,
                                                     frame* sendee_arg) {
  if (forceSelfFrame)
    return (void (*)(...)) ReturnTrap;
  
  if (!sendee_arg)
    sendee_arg = sendee();
  assert( sendee_arg->sender() == this, "incorrect sendee_arg");
  assert( !sendee_arg->is_interpreted_self_frame(), "XXX not implemented yet");

  return sendee_arg->is_compiled_self_frame()
    ?  (void (*)(...))         ReturnTrap
    :  (void (*)(...)) PrimCallReturnTrap;
}
  

bool frame::is_patched() {
  interpreter* interp = get_interpreter();
  if (interp != NULL)  return interp->is_return_patched();
  return isPatchedReturnAddress(real_return_addr()); 
}


void frame::remove_patch() {
  if (traceV && is_patched())
    lprintf("*removing patch from frame %#lx\n", this);
    
  if (is_patched())
    LOG_EVENT1("removing patch from frame %#lx", this);
  else
   return;
   
  if (is_interpreted_self_frame())
    get_interpreter()->patch_return(not_patched);
  else {
    set_patched_frame_saved_outgoing_args(0); // not strictly necessary
    set_real_return_addr(return_addr());
  }
}


void frame::remove_patches_up_to_C() {
  frame* f = this;
  do {
    f->remove_patch();
    f = f->sender();
  } while (f->is_self_frame());
}


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
   
void frame::trace(oop receiver, nmethod* c) {
  print_trace_indent();
  lprintf("calling ");
  receiver->print_oop();
  lprintf(" %s", c->key.selector_string());
  assert(receiver->verify() && c->key.selector->verify(),
         "invalid oops");
  assert(receiver != Memory->deadBlockObj, "uncreated block");
  
  bool first = true;
  
  FOR_EACH_SLOTDESC(c->method()->map(), s) {
    if (s->is_arg_slot()) {
      if (first) {
        lprintf(" | ");
        first = false;
      }
      lprintf(":");
      s->name->string_print();
      lprintf(" = ");
      oop a = get_lookup_arg(smiOop(s->data)->value());
      assert(a->verify(), "invalid oops");
      a->print_oop();
      lprintf(". ");
      assert(a != Memory->deadBlockObj, "uncreated block");
    }
  }
  if (! first) lprintf("|");
  if (WizardMode) lprintf(" (code: 0x%lx)", c);
  lprintf("\n");
}

void frame::traceAssignment(oop receiver, nmethod* c) {
  print_trace_indent();
  lprintf("assigning ");
  receiver->print_oop(); 
  lprintf(" ");
  stringOop(c->key.selector)->string_print();
  lprintf(" ");
  oop a = get_lookup_arg(0);
  assert(receiver->verify() && a->verify(), "invalid oops");
  a->print_oop();
  if (WizardMode) lprintf(" (code: 0x%lx)", c);
  lprintf("\n");
}

void frame::traceLookup(oop receiver, nmethod* c) {
  print_trace_indent();
  lprintf("fetching ");
  assert(receiver->verify() && c->key.selector->verify(), "invalid oops");
  receiver->print_oop();
  lprintf(" ");
  stringOop(c->key.selector)->string_print();
  if (WizardMode) lprintf(" (code: 0x%lx)", c);
  lprintf("\n");
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


void frame::print_trace_indent() {
  for (fint i = my_stack()->depth() % 79; i > 0; i--) lprintf(" ");
}


void frame::print() {
  lprintf("%sframe %#lx: PC = %#lx, sender = %#lx,",
         is_compiled_self_frame() ? "Self " : "C ",
         this,
         real_return_addr(),
         sender());
  if (is_interpreted_self_frame()) {
    interpreter* interp = get_interpreter();
    lprintf(" interpreter = %#lx\n", interp);
  } else {
    print_compiled();
  }
}
  

static Conversion* conversion;

static void ConvertFrame_cont() { conversion->doit(); }

static void ConvertFrame(oop result, char* sp,
                         bool nlr, frame* nlrHome, int32 nlrHomeID, 
                         bool isInterp) {
  ConversionInProgress = true;
  // rm can't be on the stack (cause it might be overwritten; also needs
  // to deallocate itself
  ResourceMark* rm = new ResourceMark;
  conversion = new Conversion(result, sp, nlr, nlrHome, nlrHomeID, rm, isInterp);
  // CAUTION: while converting the frame, the original activation record of
  // this procedure will be OVERWRITTEN. Therefore, we do the actual work
  // in ConvertFrame_cont (after switching to the VM stack).
  switchToVMStack(ConvertFrame_cont);
}


// HandleReturnTrap helpers:

static void  unpatch_the_convertFrame_and_get_returnTrap_info(
        char* sp_of_patched_frame,
        frame*  patched_self_frame, 
        frame*& convertFrame, 
        char* & selfPC);
        
static bool return_trap_was_just_for_vframeOops(char* selfPC, frame* convertFrame);

static void trivial_exit_from_return_trap(oop result, char* sp_of_patched_frame, bool nlr,
                                          frame* nlrHome, int32 nlrHomeID, char* selfPC,
                                          frame* patched_self_frame);

static bool conversion_needed_for_return_trap(bool nlr, frame* nlrHome, int32 nlrHomeID,
                                              frame* convertFrame);
static void NLR_exit_from_return_trap(
              oop result, char* sp_of_patched_frame,
              frame* nlrHome, int32  nlrHomeID,
              frame* convertFrame, char* selfPC);
static void patch_frame_at_end_of_NLR_for_returnTrap(frame* convertFrame, frame* nlrHome);



// The caller of HandleReturnTrap is the frame that must be converted;
// the assembly glue makes sure no registers are clobbered before 
// HandleReturnTrap is called and creates a new stack frame.

void HandleReturnTrap(oop result, char* sp_of_patched_frame,
                      bool nlr, frame* nlrHome, int32 nlrHomeID) {
  // called by assembly glue when returning into a marked frame
  // first, make it look as if assembly glue was called from Self

  assert(nlr == true || nlr == false, "assembly glue passed bogus values 2");

  processSemaphore = true;
  FlushRegisterWindows();
  // next line must in IN THIS routine for SPARC

  // Remember, patched_self_frame is frame that would have been RETURNED INTO
  // had not the patching happened. -- dmu 1/03
  frame* patched_self_frame = currentFrame()->get_patched_self_frame(sp_of_patched_frame);

  char* selfPC;
  frame* convertFrame;
  unpatch_the_convertFrame_and_get_returnTrap_info(sp_of_patched_frame, patched_self_frame,
                                                   convertFrame, selfPC);
    
  if (traceV) 
    lprintf("*** HandleReturnTrap: sp_of_patched_frame = 0x%x, nlr = %d, nlrHome = 0x%x, nlrHomeID = %d patched_self_frame = 0x%x\n",
            sp_of_patched_frame, nlr, nlrHome, nlrHomeID, patched_self_frame);

  LOG_EVENT3("HandleReturnTrap res=%#lx sp_of_patched_frame=%#lx pc=%#lx", result, sp_of_patched_frame, selfPC);

  currentProcess->killVFrameOopsAndSetWatermark(convertFrame);  // kill extra vframes
  
  // figure out why the frame was marked & exit appropriately

  if ( return_trap_was_just_for_vframeOops(selfPC, convertFrame)) {
    trivial_exit_from_return_trap(result, sp_of_patched_frame,
                                  nlr, nlrHome, nlrHomeID,
                                  selfPC, patched_self_frame);
    ShouldNotReachHere();
  }
  // programming conversion / single-stepping trap / stop trap / unc. trap
  if (  conversion_needed_for_return_trap(nlr, nlrHome, nlrHomeID, convertFrame)) {
    ConvertFrame(result, sp_of_patched_frame, nlr, nlrHome, nlrHomeID,  selfPC == 0);
    ShouldNotReachHere();
  }
  // just return through this frame, don't need to convert
  NLR_exit_from_return_trap(result, sp_of_patched_frame, nlrHome, nlrHomeID, convertFrame, selfPC);
}  


objVectorOop OutgoingArgsOfReturnTrapOrRecompileFrame = NULL;

void  unpatch_the_convertFrame_and_get_returnTrap_info(
        char* sp_of_patched_frame,
        frame*  patched_self_frame, 
        frame*& convertFrame, 
        char* & selfPC) {
  selfPC = patched_self_frame->currentPC();
  
  if ( Memory->code->contains(selfPC) ) {
    // aha! compiled code
    assert(!Interpret, "interpreted code should not get here");
    if (patched_self_frame->is_patched()) {
      // really is a return trap; outgoing args were saved when frame was patched
      OutgoingArgsOfReturnTrapOrRecompileFrame = patched_self_frame->patched_frame_saved_outgoing_args();
      if (SaveOutgoingArgumentsOfPatchedFrames) {
        assert(patched_self_frame->sendee()->return_addr() == (char*)&ReturnTrap_returnPC
          ||  patched_self_frame->sendee()->return_addr() == (char*)&ReturnTrapNLR_returnPC ,
              "ensure patched_frame_saved_outgoing_args() will work");
        assert(OutgoingArgsOfReturnTrapOrRecompileFrame->verify_oop(), "check outgoing args");
        assert_objVector(OutgoingArgsOfReturnTrapOrRecompileFrame, "check outgoing args");
        assert(!currentProcess->isUncommon(), "must be real return trap");
      }
    }
    else {
      // was an uncommonBranch, only works on SPARC, are no outgoing args, just saved_out_regs
      assert(currentProcess->isUncommon(), "must be uncommon branch");
    }
    patched_self_frame->set_real_return_addr(selfPC);
    // skip asm frame
    convertFrame = currentProcess->last_self_frame(true);
    assert(convertFrame == patched_self_frame, "should be the same if compiled");
  }
  else {
    selfPC = 0; // mark in interp
    assert(Interpret, "compiled code should not get here");
    // must be in interpreter, find the frame
    // skip C interp frames
    convertFrame = currentProcess->last_self_frame(true);
    // Don't know if the following line works, not supporting the interp these days...dmu 2/03
    OutgoingArgsOfReturnTrapOrRecompileFrame = convertFrame->patched_frame_saved_outgoing_args();
    convertFrame->remove_patch();
  }
}


bool return_trap_was_just_for_vframeOops(char* selfPC, frame* convertFrame) {
  return !currentProcess->isKillingOrDeoptimizing()
      && !currentProcess->isUncommon()
#     if defined(FAST_COMPILER) || defined(SIC_COMPILER)
      && !(selfPC && findNMethod(selfPC)->isInvalid())
#     endif
      && !currentProcess->isSingleStepping()
      && !currentProcess->isStopping()
      && currentProcess->stopFrame() != convertFrame->vfo_locals_of_home_frame();
}

void trivial_exit_from_return_trap(oop result, char* sp_of_patched_frame, bool nlr,
                                   frame* nlrHome, int32 nlrHomeID, char* selfPC,
                                   frame* patched_self_frame) {
  // trap was for vframeOops; continue
  conversion = NULL;
  // returnToSelf will clear processSemaphore
  conversion->returnToSelf(result, sp_of_patched_frame, nlr, nlrHome, nlrHomeID,
                            selfPC == 0
                              ?  NULL
                              :  patched_self_frame->send_desc(),
                            selfPC == 0);
  ShouldNotReachHere();
}

                                          
bool conversion_needed_for_return_trap(bool nlr, frame* nlrHome, int32 nlrHomeID, frame* convertFrame) {
  if (!nlr) return true; // no nlr, must be here for conversion
  if (convertFrame->block_scope_of_home_frame() != nlrHome)  
    return false;  // not at frame of home, keep NLRing for now
  // doing NLR & have arrived at home frame
  if (currentProcess->isKillingOrDeoptimizing()) return true; // better convert
  return nlrHomeID != 0; // NLR ing into SIC, do conversion
}

  
void NLR_exit_from_return_trap(
              oop result,
              char* sp_of_patched_frame,
              frame* nlrHome,
              int32  nlrHomeID,
              frame* convertFrame,
              char* selfPC) {
              
  patch_frame_at_end_of_NLR_for_returnTrap(convertFrame, nlrHome);
  
  if (selfPC == 0) { // interpreting
    convertFrame->get_interpreter()->restartSend = false;
    processSemaphore = false;
    OutgoingArgsOfReturnTrapOrRecompileFrame = NULL; // done with this
    // return into interpreter
    return;
  } 
  
  # if defined(FAST_COMPILER) || defined(SIC_COMPILER)
    ((Conversion*)NULL)->nlr_to_compiled_self( result, false, nlrHome, nlrHomeID, (sendDesc*)selfPC, sp_of_patched_frame);
  # endif
    ShouldNotReachHere();
}


void patch_frame_at_end_of_NLR_for_returnTrap(frame* convertFrame, frame* nlrHome) {
  if (nlrHome == NULL) {
    // the block is from another process -- home isn't on our stack
    LOG_EVENT("HandleReturnTrap, nlrHome=0");
  }
  else {
    frame *f, *prev;
    for (f= convertFrame, prev= NULL;
         f && f->block_scope_of_home_frame() != nlrHome;
         prev= f, f= f->sender())
      ;
    if (f) f->patch(prev, true);
    LOG_EVENT2("HandleReturnTrap f=%#lx prev=%#lx", f, prev);
  }
}



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

char *HandleProfilerTrap(char* return_address) {
  // called by assembly glue when returning into a marked frame
  // first, make it look as if assembly glue was called from Self
  assert(Memory->code->contains(return_address), "not in Self");

  sendDesc* sd = sendDesc::sendDesc_from_return_PC(return_address);
  char* insts =  sd->jump_addr();
  
  assert( Memory->code->contains(insts)
     ||   Memory->code->stubs->contains(insts)
     ||   insts == Memory->code->trapdoors->SendMessage_stub_td(),
          " should call self code");

  return return_address 
       + sendDesc::sendDesc_from_return_PC(return_address)->endOffset();
}

# endif


bool frame::verify(int n, RegisterLocator* rl) {
  bool r = true;
  interpreter* interp = get_interpreter();
  if (interp != NULL)
    r &= interp->verify();
  if (!ConversionInProgress || n > 0) {
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
      if (is_compiled_self_frame()  &&  code()->isInvalid() && !is_patched()) {
        error1("frame %#lx should have patched return address", this);
        r = false;
      }
#   endif
  }
  r &= verify_oops(rl);
  return r;
}


bool frame::is_in_prologue() {
  assert( is_self_frame(), "only for self frames");

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

    if (!is_interpreted_self_frame())
      return !code()->in_self_code_at(return_addr());
      
# endif

  return get_interpreter()->pc  ==  PrologueBCI;
}  


void frame::printVerbose() {
  print();
  printRegs();
  printVerbose_on_this_platform();

  # if defined(FAST_COMPILER) || defined(SIC_COMPILER)

    if (is_compiled_self_frame() && !ConversionInProgress) {
      lprintf("nmethod: %#lx \"%s\"; ",
             (long unsigned)(code()),
             selector_string(code()->key.selector));
      if (send_desc()) {
        lprintf("mask: "); printMask(send_desc()->mask()); lprintf("\n");
      }
    }

  # endif

  interpreter* interp = get_interpreter();
  if (interp != NULL) interp->print();
}


// called from conversion.c:

// return a copy of this frame and its nsenders senders
// need to copy 3 sparc_sps (at least on the Sparc) because extra args
// are in 3rd sparc_sp


frame* frame::copy(fint nsenders, bool adjustBlocks) {
  assert(this != NULL, "");
  frame* last_frame_to_copy = find_last_frame_to_copy(nsenders);
  if (last_frame_to_copy == NULL) return NULL;
  
  frame* first_copied_frame = copy_frames_through(last_frame_to_copy);
  adjust_frame_links_of_copied_frames(last_frame_to_copy, first_copied_frame);
  
  if (adjustBlocks) {
    // have to do this in separate loop because need correct links
    adjust_blocks_of_copied_frames(nsenders, first_copied_frame);
  }
  return first_copied_frame;
}


// helpers for copy()

frame* frame::find_last_frame_to_copy(fint nsenders) {
  // init to sender, because even if nsenders is zero,
  //  need my sender to copy any arguments to me beyond i5 -- dmu
  //
  // Also, on PPC need my sender to copy any incoming arguments
  // (which are saved in sender's frame). -- dmu 6/99
  frame* last_frame_to_copy = sender();
  for ( fint i = 0;  i < nsenders;  ++i ) {
    last_frame_to_copy = last_frame_to_copy->sender();
    if (last_frame_to_copy == NULL) return NULL;
  }
  return last_frame_to_copy;
}


frame* frame::copy_frames_through(frame* last_frame_to_copy) {
  int32 size = copy_through_oop_count(last_frame_to_copy);
  int32 size_for_aligning = size + frame_word_alignment - 1 + frame_alignment_offset*BytesPerWord; // align copied frames for assertions
  oop* frame_area = NEW_RESOURCE_ARRAY( oop, size_for_aligning);
  int frame_byte_alignment = frame_word_alignment << 2;
  frame* first_copied_frame = (frame*) 
    roundTo(int(frame_area), frame_byte_alignment)  +  frame_alignment_offset * BytesPerWord;
  assert((oop*)first_copied_frame + size  <=  frame_area + size_for_aligning, 
         "make sure aligning does not cause overflow");
  copy_oops((oop*)this, (oop*)first_copied_frame, size);

  return first_copied_frame;
}


// after copying this frame and nsenders to
//  first_copied_frame, adjust the blocks

void frame::adjust_blocks_of_copied_frames( fint   nsenders,
                                            frame* first_copied_frame) {
  frame* oldf = this;
  frame* newf = first_copied_frame;
  for ( fint i = 0;  i <= nsenders;  ++i ) {
    
    frame* news = newf->block_scope_of_home_frame();
    frame* olds = oldf->block_scope_of_home_frame();
    ResourceMark rm; // for the register locators
    newf->adjust_blocks(olds, news, RegisterLocator::for_frame(newf ));
    
    oldf = oldf->sender();
    newf = newf->sender();
  }
}


RegisterString frame::mask_if_present() {
  if (!is_self_frame())  return 0;
  sendDesc* s = send_desc();
  // bottommost frame may have no sendDesc (uncommon trap etc.)
  return s == NULL  ?  0  :  s->mask();
}

bool frame::is_aligned() { 
  return ((int32(this)  +  frame_alignment_offset * BytesPerWord)    &    (frame_word_alignment * BytesPerWord  -  1)) 
          == 0;
}

 

// and finally the functions that use the iterator/closures:


void frame::scavenge_contents(                       RegisterLocator* rl)  { FrameIterator( this, rl,  CheckAssertions,  mask_if_present(),  true,   OopScavenger     (           ).a() ); }
void frame::gc_mark_contents(                        RegisterLocator* rl)  { FrameIterator( this, rl,  CheckAssertions,  mask_if_present(),  false,  OopGCMarker      (           ).a() ); }
void frame::gc_unmark_contents(                      RegisterLocator* rl)  { FrameIterator( this, rl,  false,            mask_if_present(),  true,   OopGCUnmarker    (           ).a() ); }
void frame::switch_pointers(oop from, oop to,        RegisterLocator* rl)  { FrameIterator( this, rl,  false,            mask_if_present(),  true,   OopSwitcher      ( from, to  ).a() ); }
void frame::zap(RegisterString m,                    RegisterLocator* rl)  { FrameIterator( this, rl,  true,                             m,  true,   OopZapper        (           ).a() ); }
void frame::oops_do(oopsDoFn f,                      RegisterLocator* rl)  { FrameIterator( this, rl,  false,            mask_if_present(),  false,  OopDoer          ( f         ).a() ); }
void frame::stack_locations_do(oopsDoFn f,           RegisterLocator* rl)  { FrameIterator( this, rl,  false,            mask_if_present(),  false,  OopLocationsDoer ( f         ).a() ); }
void frame::adjust_blocks(frame* olds,  frame* news, RegisterLocator* rl)  { FrameIterator( this, rl,  CheckAssertions,  mask_if_present(),  true,   OopBlockAdjuster ( olds, news).a() ); }

bool frame::verify_oops(                             RegisterLocator* rl)  { bool r = true;
                                                                             FrameIterator( this, rl,  false,            mask_if_present(),  false,  OopVerifier      ( r         ).a() );
                                                                             return r; }


