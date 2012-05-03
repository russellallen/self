# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# pragma implementation "sic_ppc.hh"
# include "_sic_ppc.cpp.incl"

# ifdef SIC_COMPILER

// On PPC, registers have no local place to be saved
// (PPC uses callee-save), so cannot simply flush a register.
// Therefore allocate even uplevelR pregs on the stack, too. -- dmu 12/02
bool SICAllocator::keepUplevelRPRegsInMemory = true; 

void SICompiler::initializeForPlatform() {
  _number_of_saved_nonvolatile_registers = 0;
  nlrLabel = NULL;
  _are_register_arguments_saved_on_stack = false;
}


int32 SICompiler::stackTempCount() {
  return number_of_saved_nonvolatile_registers()
       + number_of_memory_locals()
       + max_no_of_outgoing_args_and_rcvr();
}


int32 SICompiler::numberOfIncomingArgsAndRcvrInRegisters() {
  return min(incoming_arg_count(), NumArgRegisters) + 1 /* for rcvr */;
}


int32 SICompiler::max_no_of_outgoing_args_and_rcvr() {
  return argCount + 1 /* for rcvr */;
}


int32 SICompiler::number_of_saved_nonvolatile_registers() {
  // _number_of_saved_nonvolatile_registers is set by LongRegisterString::allocate, if we allocate any
  // registers for local variables.  
  // If _number_of_saved_nonvolatile_registers is not set,
  // this method didn't use any callee-saved registers, so _number_of_saved_nonvolatile_registers
  // never got set from LongRegisterString::allocate.  in this case, max 
  // register depth is just the number of incoming args and receiver in registers.
  //  -- Michael Abd-El-Malek, 12/02
  int32 r =  _number_of_saved_nonvolatile_registers
          ?  _number_of_saved_nonvolatile_registers
          :  numberOfIncomingArgsAndRcvrInRegisters();
  assert(r <= NumCalleeSavedRegs, "error in calculating register depth");
  return r;
}


int32 SICompiler::number_of_memory_locals() {
  return stackLocCount;
}


bool SICompiler::is_incoming_register_arg_or_rcvr(Location l) {
  return  isRegister(l)
      &&  (R31 - l)  <  numberOfIncomingArgsAndRcvrInRegisters();
}


void SICompiler::check_flushability(PReg* p) {
  assert( !p->uplevelR  ||  !isRegister(p->loc)  ||  is_incoming_register_arg_or_rcvr(p->loc)
       || (p->print(), false),
          "PPC can only flush incoming rcvr & args, other regs are callee-save");
}

void SICompiler::cope_with_uplevel_access_to(PReg* pr) {
  check_flushability(pr);
  if (isRegister(pr->loc)) 
    save_register_arguments_on_stack();
}

// allocate nonvols down from R31, must save/restore them, so track depth
void SICompiler::update_number_of_saved_nonvolatile_registers_for(Location l) {
  if (!isRegister(l))  return;
  _number_of_saved_nonvolatile_registers = max(_number_of_saved_nonvolatile_registers, 32 - l);
}

# endif // SIC_COMPILER
# endif // TARGET_ARCH == PPC_ARCH
