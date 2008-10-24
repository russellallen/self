/* Sun-$Revision: 30.10 $ */
/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "registerLocator.hh"

# include "_registerLocator.cpp.incl"



RegisterLocator::RegisterLocator(bool clear) 
 : ResourceObj() {
 
  my_frame = NULL;
  # if GENERATE_DEBUGGING_AIDS
    if (SpendTimeForDebugging) {
      sendee = NULL;
      setHow = 0;
    }
  # endif
    
  if (clear)
    forget_everything();
}


RegisterLocator* RegisterLocator::clone() {
  RegisterLocator* r = new RegisterLocator(false);
  *r = *this;
  # if GENERATE_DEBUGGING_AIDS
    if (SpendTimeForDebugging)
      r->sendee = this;
  # endif
  return r;
}


void RegisterLocator::set_address(Location reg, oop* a) {
  assert( ( int(a) & 3 ) == 0, "alignment check");
  addresses()[index_for_reg(reg)] = a;
}


oop* RegisterLocator::address_of(Location reg) {
  assert( my_frame->is_aligned(), "frame not set");
  oop* r = addresses()[index_for_reg(reg)];
  assert(r != NULL  &&  (int(r) & (oopSize-1)) == 0,
         "If this is called from a primitive, be sure the primtive table entry sets canWalkStack");
  return r;
}


fint RegisterLocator::index_for_reg(Location reg) {
  assert(isRegister(reg), "");
  assert(LowestLocalNonVolReg <= reg  &&  reg <= HighestNonVolReg, "");
  return reg - LowestLocalNonVolReg;
}



RegisterLocator* RegisterLocator::sender() {
  RegisterLocator* result = clone();
  result->be_for_sender();
  return result;
}

void RegisterLocator::be_for_sender() {
  // NB: a frame saves registers and so provides their addresses for its SENDER
  assert(my_frame != NULL, "checking PPCSIC bug");
  if (my_frame->is_compiled_self_frame())  update_addresses_from_self_frame();
  else                                     update_addresses_from_VM_frame();
  my_frame = my_frame->sender();
}


RegisterLocator* RegisterLocator::climb_to_frame(frame* f) {
  if (fr() == f)
    return this;
  RegisterLocator* r;
  // Gah! Conversion and Recompilation thread the stack from the vm stack to the self stack
  // so I had to add the "ConversionInProgress  ||  RecompilationInProgress" part. -- dmu 6/99
  // Also when profiling, can trace a stack (on Vm stack) that is threaded back to self stack.
  // Maybe should just test for vm stack to self stack transition? -- dmu 1/04
  // That's what I'm trying now. -- dmu 1/04
  for ( r = clone();  
        r->fr() != f;  
        r->be_for_sender() )
    assert(isOnVMStack(r->fr())  || r->fr() < f,  "passed it");
    
  // nprofiler debug code needs vframes, but since there may be self vframes,
  // then vm frames, then the signal, there may not be all addresses defined. -- dmu 1/04
  assert(profilerCollectStackSemaphore || r->are_all_defined(), "");
  return r;
}


bool RegisterLocator::are_all_defined() {
  // return true of all addrs are defined
  for (fint i = LowestLocalNonVolReg;  i <= HighestNonVolReg;  ++i)
    if ( address_of((Location)i) == NULL )
      return false;
  return true;
}


void RegisterLocator::forget_everything() {
  for (fint i = LowestLocalNonVolReg;  i <= HighestNonVolReg;  ++i)
    set_address((Location)i, NULL);
}


RegisterLocator* RegisterLocator::for_sender_of(frame* f) {
  RegisterLocator* r = new RegisterLocator();
  r->my_frame = f;
  r->be_for_sender();
  return r;
}


RegisterLocator* RegisterLocator::for_copied_frame(frame* copied_frame) {
  // when copying a frame for conversion, need to copy the saved registers
  oop* regs = NEW_RESOURCE_ARRAY(oop, NumLocalNonVolRegisters);
  RegisterLocator* r = new RegisterLocator(false);
  r->my_frame = copied_frame;
  
  for (int i = LowestLocalNonVolReg;  i <= HighestNonVolReg;  ++i) {
    oop* p = &regs[i - LowestLocalNonVolReg];
    *p = *address_of(Location(i));
    r->set_address(Location(i), p);
  }
  return r;
}
