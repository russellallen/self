# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "_interruptedCtx_i386.cpp.incl"

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
  // system call, sysenter instruction
  return pc()[0] == '\x0f'  &&  pc()[1] == '\x34';
}


int InterruptedContext::system_trap() {
  return NULL; // unimp for now
}


// used to be named patchMaxSP, but it seems to do what setupPreemption does,
// only with extra SPARC stuff and it's called within signal handling -- dmu 1/96

void InterruptedContext::setupPreemptionFromSignal() {
  // SPLimit is a global, not a register
  currentProcess->setupPreemption();
}


# if TARGET_OS_VERSION == MACOSX_VERSION  &&  OSX_RELEASE == TIGER_RELEASE
  # define __ss  ss // after TIGER use __ss

  # define __eip eip

  # define __esp esp
  # define __ebp ebp

  # define __eax eax
  # define __ebx ebx
  # define __ecx ecx
  # define __edx edx

  # define __esi esi
  # define __edi edi

  # define __eflags eflags

  # define __cs cs
  # define __ds ds
  # define __es es
  # define __fs fs
  # define __gs gs
# endif

# if TARGET_OS_VERSION == MACOSX_VERSION

  char** InterruptedContext::pc_addr() {
  return  (char**) &scp->uc_mcontext->__ss.__eip; // see /usr/include/mach/i386/thread_status.h
  }
  int* InterruptedContext::sp_addr() {
  return  (int*) &scp->uc_mcontext->__ss.__esp;
  }
  int* InterruptedContext::ebp_addr() {
  return  (int*) &scp->uc_mcontext->__ss.__ebp;
  }

# elif TARGET_OS_VERSION == LINUX_VERSION

  char** InterruptedContext::pc_addr() {
    return  (char**) &scp->uc_mcontext.gregs[REG_EIP]; // see /usr/include/asm-i386/sigcontext.h
  }
  int* InterruptedContext::sp_addr() {
    return  (int*) &scp->uc_mcontext.gregs[REG_ESP];
  }
  int* InterruptedContext::ebp_addr() {
    return  (int*) &scp->uc_mcontext.gregs[REG_EBP];
  }
# else
  # error What OS version?
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

  i386_thread_state_t* ssp = &ic->scp->uc_mcontext->__ss;
  lprintf("eax       = 0x%x\n", ssp->__eax);
  lprintf("ebx       = 0x%x\n", ssp->__ebx);
  lprintf("ecx       = 0x%x\n", ssp->__ecx);
  lprintf("edx       = 0x%x\n", ssp->__edx);
  lprintf("esi       = 0x%x\n", ssp->__esi);
  lprintf("edi       = 0x%x\n", ssp->__edi);
  lprintf("ebp       = 0x%x\n", ssp->__ebp);
  lprintf("esp       = 0x%x\n", ssp->__esp);
  lprintf("ss        = 0x%x\n", ssp->__ss);
  lprintf("eflags    = 0x%x\n", ssp->__eflags);
  lprintf("eip       = 0x%x\n", ssp->__eip);
  lprintf("cs       = 0x%x\n", ssp->__cs);
  lprintf("ds       = 0x%x\n", ssp->__ds);
  lprintf("es       = 0x%x\n", ssp->__es);
  lprintf("fs       = 0x%x\n", ssp->__fs);
  lprintf("gs       = 0x%x\n", ssp->__gs);

  # elif TARGET_OS_VERSION == LINUX_VERSION

    greg_t *gregs = ic->scp->uc_mcontext.gregs;
    lprintf("eax       = 0x%x\n", gregs[REG_EAX]);
    lprintf("ebx       = 0x%x\n", gregs[REG_EBX]);
    lprintf("ecx       = 0x%x\n", gregs[REG_ECX]);
    lprintf("edx       = 0x%x\n", gregs[REG_EDX]);
    lprintf("esi       = 0x%x\n", gregs[REG_ESI]);
    lprintf("edi       = 0x%x\n", gregs[REG_EDI]);
    lprintf("ebp       = 0x%x\n", gregs[REG_EBP]);
    lprintf("esp       = 0x%x\n", gregs[REG_ESP]);
    lprintf("ss        = 0x%x\n", gregs[REG_SS]);
    lprintf("efl       = 0x%x\n", gregs[REG_EFL]);
    lprintf("eip       = 0x%x\n", gregs[REG_EIP]);
    lprintf("cs        = 0x%x\n", gregs[REG_CS]);
    lprintf("ds        = 0x%x\n", gregs[REG_DS]);
    lprintf("es        = 0x%x\n", gregs[REG_ES]);
    lprintf("fs        = 0x%x\n", gregs[REG_FS]);
    lprintf("gs        = 0x%x\n", gregs[REG_GS]);
    lprintf("trapno    = 0x%x\n", gregs[REG_TRAPNO]);
    lprintf("err       = 0x%x\n", gregs[REG_ERR]);
    lprintf("uesp      = 0x%x\n", gregs[REG_UESP]);

  # else
	# error What OS?
  # endif
  lprintf("\n");
}

# endif // TARGET_ARCH == I386_ARCH
