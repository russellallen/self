# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "registerLocator_ppc.hh"

# include "_registerLocator_ppc.cpp.incl"


void RegisterLocator::update_addresses_from_self_frame() {
  // I may be the frame that was running when the signal hit.
  // If so, use addresses of regs saved in Unix signal info.
  // -- dmu 1/04
  if ( update_addresses_from_InterruptedContext(my_frame, InterruptedContext::the_interrupted_context) ) {
    # if GENERATE_DEBUGGING_AIDS
      if (SpendTimeForDebugging)  setHow = 5;
    # endif
  }
  else if ( update_addresses_from_InterruptedContext(my_frame, &AbortContext) ) {
    # if GENERATE_DEBUGGING_AIDS
      if (SpendTimeForDebugging)  setHow = 6;
    # endif
  }
  if (my_frame->is_self_stub_frame()) 
    return; // CacheStubs and CountStubs do not muck with the nonvol regs -- dmu 1/04

  nmethod* nm = my_frame->code();
  update_addresses_from_callee_of(my_frame->sender(), nm->number_of_saved_nonvolatile_registers());
  # if GENERATE_DEBUGGING_AIDS
    if (SpendTimeForDebugging)  setHow += 10;
  # endif
}


void RegisterLocator::update_addresses_from_VM_frame() {
  char* r = my_frame->real_return_addr();
  if (isNonVolSavingReturnAddress(r)) {
    // special asm funcs that saves all NVs
    update_addresses_from_callee_of(my_frame->sender(),  NumLocalNonVolRegisters);
    # if GENERATE_DEBUGGING_AIDS
      if (SpendTimeForDebugging)  setHow = 2;
    # endif
  }
  else if ( update_addresses_from_InterruptedContext(my_frame, InterruptedContext::the_interrupted_context) ) {
    # if GENERATE_DEBUGGING_AIDS
      if (SpendTimeForDebugging)  setHow = 3;
    # endif
  }
  else if ( update_addresses_from_InterruptedContext(my_frame, &AbortContext) ) {
    # if GENERATE_DEBUGGING_AIDS
      if (SpendTimeForDebugging)  setHow = 4;
    # endif
  }
  else
    forget_everything();
}


RegisterLocator* RegisterLocator::for_NonVolSaving_frame(frame* f) {
  assert(isNonVolSavingReturnAddress(f->real_return_addr()), "");
  RegisterLocator* r = new RegisterLocator(false);
  r->my_frame = f;
  r->update_addresses_from_VM_frame();
  r->my_frame = f->sender(); // because this RL is for reg values while sender frame is running
  return r;
}


void RegisterLocator::update_addresses_from_callee_of(frame* f, fint callee_save_count) {
  // sender() because this frame saves regs based on INCOMING SP
  oop*  last_addr = f-> my_callees_last_saved_nonvolatile_register_addr();
  oop* first_addr = last_addr - (callee_save_count - 1);
  fint r = HighestNonVolReg;
  for ( oop* p = last_addr;  p >= first_addr;  --p, --r )
    set_address((Location)r, p);
}


bool RegisterLocator::update_addresses_from_InterruptedContext(frame* f, InterruptedContext* ic) {
  if (ic->sp() == f) {
    oop* p = &ic->R0_addr()[LowestLocalNonVolReg - R0];
    for ( fint r = LowestLocalNonVolReg;  r <= HighestNonVolReg;  ++r, ++p )
      set_address(Location(r), p);
    return true;
  }
  return false;
}


RegisterLocator* RegisterLocator::for_frame(frame* f) {
  frame* dbg_frame;
  Stack* dbg_stack;
  if (SpendTimeForDebugging) {
    dbg_stack = f->my_stack();
    dbg_frame = dbg_stack->first_VM_frame();
  }
  RegisterLocator* r;
  frame* dbg_self_frame = f->my_stack()->last_self_frame(true, &r);
  assert(dbg_self_frame, "no self frame");
  return r->climb_to_frame(f);
}
# endif // TARGET_ARCH == PPC_ARCH
