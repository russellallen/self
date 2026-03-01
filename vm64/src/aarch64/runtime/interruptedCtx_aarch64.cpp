# if  TARGET_ARCH == AARCH64_ARCH
/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

# include "_interruptedCtx_aarch64.cpp.incl"

char* InterruptedContext::next_pc(){ return NULL; }
void InterruptedContext::set_next_pc(void *) {}


void InterruptedContext::set_continuation_address(char *addr, bool mustWork, bool setSema) {
  assert(!continuePC, "continuePC already set");
  if (setSema) processSemaphore = true;
  Unused(mustWork);
  the_interrupted_context->set_pc(addr);
}


bool InterruptedContext::in_system_trap() {
  if (scp == &dummy_scp)
    return false;
  // ARM64: system calls use SVC instruction
  // Check for SVC #0x80 (encoding: 0xD4001001)
  uint32* insn = (uint32*)pc();
  return (*insn & 0xFFE0001F) == 0xD4000001; // SVC instruction mask
}


int InterruptedContext::system_trap() {
  return int(NULL); // unimp for now
}


void InterruptedContext::setupPreemptionFromSignal() {
  // SPLimit is a global, not a register
  currentProcess->setupPreemption();
}


# if TARGET_OS_VERSION == MACOSX_VERSION

  char** InterruptedContext::pc_addr() {
    return  (char**) &scp->uc_mcontext->__ss.__pc;
  }
  int* InterruptedContext::sp_addr() {
    return  (int*) &scp->uc_mcontext->__ss.__sp;
  }
  int* InterruptedContext::fp_addr() {
    return  (int*) &scp->uc_mcontext->__ss.__fp;
  }

# elif TARGET_OS_VERSION == LINUX_VERSION

  char** InterruptedContext::pc_addr() {
    return  (char**) &scp->uc_mcontext.pc;
  }
  int* InterruptedContext::sp_addr() {
    return  (int*) &scp->uc_mcontext.sp;
  }
  int* InterruptedContext::fp_addr() {
    return  (int*) &scp->uc_mcontext.regs[29];
  }

# else
  # error Unsupported OS for aarch64
# endif

void InterruptedContext::print_registers() {
  InterruptedContext* ic =
    the_interrupted_context && the_interrupted_context->is_set()  ?  the_interrupted_context  :
   (AbortContext.is_set() ? &AbortContext : NULL);

  if (ic == NULL) {
    lprintf("context is not set\n");
    return;
  }
  # if TARGET_OS_VERSION == MACOSX_VERSION

  arm_thread_state64_t* ssp = &ic->scp->uc_mcontext->__ss;
  lprintf("x0        = 0x%llx\n", ssp->__x[0]);
  lprintf("x1        = 0x%llx\n", ssp->__x[1]);
  lprintf("x2        = 0x%llx\n", ssp->__x[2]);
  lprintf("x3        = 0x%llx\n", ssp->__x[3]);
  lprintf("x4        = 0x%llx\n", ssp->__x[4]);
  lprintf("x5        = 0x%llx\n", ssp->__x[5]);
  lprintf("x6        = 0x%llx\n", ssp->__x[6]);
  lprintf("x7        = 0x%llx\n", ssp->__x[7]);
  lprintf("x8        = 0x%llx\n", ssp->__x[8]);
  lprintf("x29 (fp)  = 0x%llx\n", ssp->__fp);
  lprintf("x30 (lr)  = 0x%llx\n", ssp->__lr);
  lprintf("sp        = 0x%llx\n", ssp->__sp);
  lprintf("pc        = 0x%llx\n", ssp->__pc);
  lprintf("cpsr      = 0x%x\n",   ssp->__cpsr);

  # elif TARGET_OS_VERSION == LINUX_VERSION

  const mcontext_t *mc = &ic->scp->uc_mcontext;
  lprintf("x0        = 0x%lx\n", mc->regs[0]);
  lprintf("x1        = 0x%lx\n", mc->regs[1]);
  lprintf("x2        = 0x%lx\n", mc->regs[2]);
  lprintf("x3        = 0x%lx\n", mc->regs[3]);
  lprintf("x4        = 0x%lx\n", mc->regs[4]);
  lprintf("x5        = 0x%lx\n", mc->regs[5]);
  lprintf("x6        = 0x%lx\n", mc->regs[6]);
  lprintf("x7        = 0x%lx\n", mc->regs[7]);
  lprintf("x8        = 0x%lx\n", mc->regs[8]);
  lprintf("x29 (fp)  = 0x%lx\n", mc->regs[29]);
  lprintf("x30 (lr)  = 0x%lx\n", mc->regs[30]);
  lprintf("sp        = 0x%lx\n", mc->sp);
  lprintf("pc        = 0x%lx\n", mc->pc);
  lprintf("pstate    = 0x%lx\n", mc->pstate);

  # else
    # error Unsupported OS for aarch64
  # endif
  lprintf("\n");
}

# endif // TARGET_ARCH == AARCH64_ARCH
