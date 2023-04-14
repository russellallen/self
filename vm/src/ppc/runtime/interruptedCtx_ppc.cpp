# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# include "_interruptedCtx_ppc.cpp.incl"

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
  // system call, sc, svca, top 5 bits = 17, bit 30 is a 1
  int c = code_at_pc();
  return (c & 0xf8000002) == 0x88000002;
}


int InterruptedContext::system_trap() {
  return 0; // unimp for now
}


// used to be named patchMaxSP, but it seems to do what setupPreemption does,
// only with extra SPARC stuff and it's called within signal handling -- dmu 1/96

void InterruptedContext::setupPreemptionFromSignal() {
  // SPLimit is a global, not a register
  currentProcess->setupPreemption();
}

# if TARGET_OS_VERSION == MACOSX_VERSION
  // OS 9 version is in interruptedCtx_mac

  # if OSX_RELEASE == TIGER_RELEASE
    # define __ss ss // see /usr/include/mach/ppc/thread_status.h
    
    # define __srr0 srr0
    # define __srr1 srr1
    
    # define __r0 r0
    # define __r1 r1
    # define __lr lr
    # define __cr cr
    # define __xer xer
    # define __ctr ctr
  # endif

  char** InterruptedContext::pc_addr() {
    return (char**) &scp->uc_mcontext->__ss.__srr0; // see /usr/include/mach/ppc/thread_status.h
  }
  int* InterruptedContext::sp_addr() {
    return   (int*) &scp->uc_mcontext->__ss.__r1;
  }
  char** InterruptedContext::lr_addr() {
    return (char**) &scp->uc_mcontext->__ss.__lr;
  }

# elif TARGET_OS_VERSION == NETBSD_VERSION

  char** InterruptedContext::pc_addr() {
    return (char**) &_UC_MACHINE_PC(scp);
  }
  int* InterruptedContext::sp_addr() {
    return   (int*) &_UC_MACHINE_SP(scp);
  }
  char** InterruptedContext::lr_addr() {
    return (char**) &scp->uc_mcontext.__gregs[_REG_LR];
  }

# endif

char* InterruptedContext::lr() {
  return is_set() ? *lr_addr() : NULL;
}
  
# if TARGET_OS_VERSION == NETBSD_VERSION
oop* InterruptedContext::R0_addr() {
  return (oop*) &scp->uc_mcontext.__gregs[_REG_R0];
}
# else
oop* InterruptedContext::R0_addr() {
  return (oop*) &scp->uc_mcontext->__ss.__r0;
}
# endif

void InterruptedContext::print_registers() {
  InterruptedContext* ic = 
    the_interrupted_context && the_interrupted_context->is_set()  ?  the_interrupted_context  :
   (AbortContext.is_set() ? &AbortContext : NULL);
   
  if (ic == NULL) {
    lprintf("context is not set\n");
    return;
  }

# if TARGET_OS_VERSION == NETBSD_VERSION
  lprintf("XXX: TODO: %s\n", __PRETTY_FUNCTION__);
  return;

# else  // MacOS
  ppc_thread_state_t* ssp = &ic->scp->uc_mcontext->__ss;
  lprintf("srr0 (pc) = 0x%x\n", ssp->__srr0);
  lprintf("srr1      = 0x%x\n", ssp->__srr1);
  lprintf("cr        = 0x%x\n", ssp->__cr  );
  lprintf("xer       = 0x%x\n", ssp->__xer );
  lprintf("lr        = 0x%x\n", ssp->__lr  );
  lprintf("ctr       = 0x%x\n", ssp->__ctr );

  lprintf("\n");
  unsigned int* p = &ssp->__r0;
  for (fint i = 0;  i <= 31; i += 4)
    lprintf("r%-2d = 0x%08x  r%-2d = 0x%08x  r%-2d = 0x%08x  r%-2d = 0x%08x\n",
            i, p[i],  i+1, p[i+1],  i+2, p[i+2],  i+3,  p[i+3]);
  lprintf("\n\n");
# endif
}

# endif // TARGET_ARCH == PPC_ARCH
