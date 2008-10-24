/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "nlrSupport.hh"

# include "_nlrSupport.cpp.incl"


// helpers for assembly routines
extern "C" {
  // As we are returning up Self stack (NLR returns)
  // we might return into C++ (via firstSelfFrame_returnPC in runtime.s).
  // Before returning to C++, asm code calls this function,
  // which also sets NLRSupport::_have_NLR_through_C flag.
  oop  capture_NLR_parameters_from_registers(oop result, int32 target_frame, int32 target_ID);

// These are used for communication with the assembly routine because
// there aren't enough temporary registers to hold all this stuff.
// Don't access these this way from C++;

  oop   NLRResultFromC;    // params for ContinueNLRFromC
  int32 NLRHomeFromC;
  int32 NLRHomeIDFromC;
  
  void continue_discard_stack();
}


// Called by assembly glue when a NLR reaches a VM frame on the stack
oop capture_NLR_parameters_from_registers(oop result, int32 targetFrame, int32 targetID) {
  NLRSupport::save_NLR_results(result, targetFrame, targetID);
  // return to assembly glue which then returns from EnterSelf()
  return result;
}


// Called by assembly glue when a DiscardStack reaches a VM frame on the stack
// Should only return when stack is completely traversed
// used by NLRs, etc., that toss the whole stack
void continue_discard_stack() {
  if (currentProcess->selfNesting() > 1) {
    currentProcess->nesting--;
    DiscardStack();
  } else {
    // return to assembly glue which then returns from EnterSelf()
  }
}




bool NLRSupport::_have_NLR_through_C = false;


// accessors for NLR vars above:

oop    NLRSupport::NLR_result_from_C()  { return NLRResultFromC; }
int32  NLRSupport::NLR_home_from_C()    { return NLRHomeFromC; }
int32  NLRSupport::NLR_home_ID_from_C() { return NLRHomeIDFromC; }

void   NLRSupport::set_NLR_result_from_C(oop x)    { NLRResultFromC = x; }
void   NLRSupport::set_NLR_home_from_C(int32 x)    { NLRHomeFromC = x; }
void   NLRSupport::set_NLR_home_ID_from_C(int32 x) { NLRHomeIDFromC = x; }


volatile void NLRSupport::continue_NLR_into_Self(bool remove_patches) {
  processSemaphore = true;
  frame* vmf = currentProcess->stack()->first_VM_frame();
  assert(!vmf->is_self_frame() && vmf->sender()->is_self_frame(),
         "not the right frame");
  if (remove_patches) vmf->remove_patches_up_to_C();
  
  if (vmf->sender()->is_interpreted_self_frame()) 
    continue_NLR_into_interpreted_Self();
  else if (preemptCause == cNonLIFOBlock) 
    continue_NLR_from_compiled_nonLIFO_block(vmf);
  else
    continue_NLR_into_compiled_Self(remove_patches, vmf);
  ShouldNotReachHere(); // should not return to here
}


volatile void NLRSupport::continue_NLR_into_interpreted_Self() {
  set_have_NLR_through_C(); // interp needs this
  frame* f =
    currentProcess->stack()->interpreter_frame_for_continuing_NLR_from_primitive();
  assert(f != NULL, "could not find frame to return to");
  ContinueNLRFromC(f->real_return_addr(), true, false);
  ShouldNotReachHere(); // should not return to here
}


volatile void NLRSupport::continue_NLR_from_compiled_nonLIFO_block(frame* vmf) {
  reset_have_NLR_through_C(); // normally clear this when resuming NLR in compiled code
  // either a trap instruction or a load; skip bottommost frame because
  // it has no proper inline cache to return through
  frame* above = vmf->sender()->sender();
  if (!above->is_self_frame())
    fatal("can't handle block called by VM");
  ContinueNLRFromC( above->return_addr(), false, true);
  ShouldNotReachHere(); // should not return to here
}


volatile void NLRSupport::continue_NLR_into_compiled_Self(bool remove_patches, frame* vmf) {
  reset_have_NLR_through_C(); // normally clear this when resuming NLR in compiled code
  char* ret_addr = vmf->sender()->real_return_addr();
  char* vm_addr  = vmf->return_addr();
  assert(!remove_patches || (ret_addr == vmf->sender()->return_addr() &&
                              vm_addr == vmf->real_return_addr()),
         "patches not removed");
  UsedOnlyInAssert(remove_patches);
  // Need to use two different ways to return:
  // 1) if VM was called through a normal Self inline cache (i.e. lookup)
  // 2)  "  "  "    "       "    " stack ovfl test or other primitive
  // This is because the "prim call inline cache" has a different format.
  // On SPARC, the return pointer is increased at a prim call site so a normal return
  // will skip in the inline cache.
  // All lookup routines are between Low- and HighReturnAddress.
  
  // On PPC, is_Self_IC flag ignored, and do not have to put lookup routines
  // between Low and HighReturnAddress.
  bool is_Self_IC = is_Self_return_address(vm_addr);  
  ContinueNLRFromC(ret_addr, false, is_Self_IC);
  ShouldNotReachHere(); // should not return to here
}


void NLRSupport::save_NLR_results(oop res, int32 targetFrame, int32 targetID) { 
  assert(res == badOop  ||  res == 0  ||  targetFrame != NULL,
         "either aborting/terminating process or have a target");
  set_NLR_result_from_C(res);
  set_NLR_home_from_C(targetFrame);
  set_NLR_home_ID_from_C(targetID);
  NLRSupport::set_have_NLR_through_C();
}


bool NLRSupport::is_bad_home_reference(char* addr) {
  static const int bad_home_range = 1 << 12; /* address range for refs from dead blks */

  int32 iaddr = (int32)addr;
  return (iaddr & Tag_Mask) == Int_Tag &&
         (iaddr >= 0  ?  iaddr  :  -iaddr)  <  bad_home_range;
}


// use NLR mechanism to unwind process stack when killing

void volatile NLRSupport::unwind_stack_to_kill_process(oop res) {
  save_NLR_results(res);
  ResetMonitor sa; // tell the spy
  continue_NLR_into_Self(true); // reuse NLR for abort
  ShouldNotReachHere(); // should not return to here
}


  

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

void NLRSupport::non_lifo_abort_from_continuePC() {
  char* nonLifoAbortPC = continuePC;
  continuePC = NULL;
  non_lifo_abort(nonLifoAbortPC);
}


void NLRSupport::non_lifo_abort(pc_t nonLifoAbortPC) {
  if (nonLifoAbortPC == 0)  fatal("nonLifoAbortPC is zero");
  
  // was in compiled code
  // need to flush nmethod of dead block (next invocation could be ok)
  nmethod* deadBlock = findNMethod(nonLifoAbortPC);

  // Initialize our return address so that it looks like our caller is C
  // (the "caller" really is the non-lifo block nmethod, but we can't display
  // its stack frame anyway, so we make it look like C).  At the same time,
  // must make it look like our caller was invoked via
  // SendMessage_stub so that abort()
  // returns throudgh the inline cache.
  fix_current_return_address(Memory->code->trapdoors->SendMessage_stub_td());

  Memory->code->chainFrames();
  deadBlock->flush();
  Memory->code->unchainFrames();

  processSemaphore = false; 
  // HACK to avoid assertion in Process:: transfer(), Lars
  currentProcess->nonLifoError();
}


void NLRSupport::fix_current_return_address(char* addr) {
  // make sure this function doesn't get inlined
  FlushRegisterWindows();
  currentFrame()->fix_current_return_address(addr);
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
