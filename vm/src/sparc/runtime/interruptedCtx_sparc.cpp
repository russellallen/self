/* Sun-$Revision: 30.12 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "unixPrims.hh"
# include "fields.hh"
# include "files.hh"
# include "frame.hh"
# include "interruptedCtx.hh"
# include "label_inline.hh"
# include "monitorHooks.hh"
# include "nmethod_inline.hh"
# include "os_includes.hh"
# include "process.hh"
# include "scanner.hh"
# include "sig.hh"
# include "signalBlocker.hh"
# include "stack.hh"
# include "uncommonBranch.hh"
# include "universe.hh"
# include "vframe.hh"
# include "zone.hh"

char* InterruptedContext::next_pc() { return *next_pc_addr(); }
void InterruptedContext::set_next_pc(void *npc){
  *next_pc_addr() = (char*)npc;
}


void InterruptedContext::set_continuation_address(char *addr, bool mustWork, bool setSema) {
  InterruptedContext::the_interrupted_context->must_be_in_self_thread();
  

  assert(!continuePC, "continuePC already set");
  if (setSema) processSemaphore = true; 
  if (the_interrupted_context->next_pc() == the_interrupted_context->pc() + 4) {
    // normal case
    continuePC = the_interrupted_context->pc();
    the_interrupted_context->set_pc(addr);
    the_interrupted_context->set_next_pc(addr + 4);
  } else {
    // Instruction at pc is in delay slot; next instr. is non-sequential
    // Execute delay slot instruction before jumping to continuation
    int32* instp = (int32*)the_interrupted_context->pc();
    if (isCall(instp) || isJump(instp)) {
      // back-to-back CTI - shouldn't happen for Self code
      warning("setContinuationAddress: can't handle back-to-back CTI;\n");
      warning4("pc=%#lx (%lx), npc=%#lx (%lx)",
               the_interrupted_context->pc(),  *(int*)the_interrupted_context->pc(),
               the_interrupted_context->next_pc(),
               *(int*)the_interrupted_context->next_pc());
      if (mustWork) fatal("couldn't set continuation address");
    } else {
      continuePC = the_interrupted_context->next_pc();
      the_interrupted_context->set_next_pc(addr);
    }
  }
}


bool InterruptedContext::in_system_trap() {
  if (scp == &dummy_scp)
    return false;
  const int trap_code = 0x91d02000; // t g0,0x0,o0
  return code_at_pc() == trap_code;
}


int InterruptedContext::g1() {
  # if  TARGET_OS_VERSION == SOLARIS_VERSION
     return ((ucontext_t*) scp)->uc_mcontext.gregs[REG_G1];
  # elif  TARGET_OS_VERSION == SUNOS_VERSION
     return ((sigcontext *) scp)->sc_g1;
  # endif
}


int InterruptedContext::system_trap() {
  return g1();  // g1 contains function code
}


// used to be named patchMaxSP, but it seems to do what setupPreemption does,
// only with extra SPARC stuff and it's called within signal handling -- dmu 1/96

void InterruptedContext::setupPreemptionFromSignal() {
    InterruptedContext::the_interrupted_context->must_be_in_self_thread();
  
    if (continuePC) fatal("recursive setSPLimit");
    if ( the_interrupted_context->pc()      >= first_inst_addr( setSPLimitAndContinue )
     &&  the_interrupted_context->pc()      <  first_inst_addr( setSPLimitAndContinueEnd )
    ||   the_interrupted_context->next_pc() >= first_inst_addr( setSPLimitAndContinue )
     &&  the_interrupted_context->next_pc() <  first_inst_addr( setSPLimitAndContinueEnd )) {
      return;                   // already patched or just about to do it
    }
    newSPLimit = currentProcess->stackEnd();
    set_continuation_address(first_inst_addr(setSPLimitAndContinue), false, true);
}

char** InterruptedContext::pc_addr() {
  # if  TARGET_OS_VERSION == SOLARIS_VERSION
     return (char**) &scp->uc_mcontext.gregs[REG_PC];
  # elif  TARGET_OS_VERSION == SUNOS_VERSION
     return (char**) &scp->sc_pc;
  # endif
}


# if  TARGET_OS_VERSION == SOLARIS_VERSION

  // maps locations to their offset in the gregs array
  static fint loc_map[] = {     // indexed by location
    -1,     REG_G1, REG_G2, REG_G3, REG_G4, REG_G5, REG_G6, REG_G7,
    REG_O0, REG_O1, REG_O2, REG_O3, REG_O4, REG_O5, REG_O6, REG_O7,
    -1,     -1,     -1,     -1,     -1,     -1,     -1,     -1,     
    -1,     -1,     -1,     -1,     -1,     -1,     -1,     -1};

  inline oop* reg_addr(ucontext_t* scp, Location reg) {
    fint off = loc_map[reg];
    if (off >= 0) {
      return (oop*)&scp->uc_mcontext.gregs[off];
    } else {
      // register is in bottommost window
      if (scp->uc_mcontext.gwins) {
        return (oop*)&scp->uc_mcontext.gwins->wbuf[0] + (reg - L0);
      } else {
        // was saved on stack (normal case)
        oop* sp = reg_addr(scp, SP);
        return sp + (reg - L0);
      }
    }
  }

  void  InterruptedContext::set_reg(Location reg, void* newVal) {
    *reg_addr((ucontext_t*) scp, reg) = (oop) newVal;
  }
# ifdef UNUSED
  void* InterruptedContext::get_reg(Location reg) {
    return *reg_addr((ucontext_t*) scp, reg);
  }
# endif
#endif



char** InterruptedContext::next_pc_addr() {
  # if  TARGET_OS_VERSION == SOLARIS_VERSION
     return (char**) &((ucontext_t*) scp)->uc_mcontext.gregs[REG_nPC];
  # elif  TARGET_OS_VERSION == SUNOS_VERSION
     return (char**) &((sigcontext *)scp)->sc_npc;
  # endif
}


int* InterruptedContext::sp_addr() {
  # if  TARGET_OS_VERSION == SOLARIS_VERSION
     return &((ucontext_t*) scp)->uc_mcontext.gregs[REG_SP];
  # elif  TARGET_OS_VERSION == SUNOS_VERSION
     return &((sigcontext *) scp)->sc_sp;
  # endif
}

void InterruptedContext::print_registers() {
  lprintf("Sorry, InterruptedContext::print_registers() is unimplemented for SPARC\n");
}
