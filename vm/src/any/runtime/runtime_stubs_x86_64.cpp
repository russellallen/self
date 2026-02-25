/* Copyright 2024 AUTHORS.
   See the LICENSE file for license information. */

/* C/asm stubs for x86_64 interpreter-only builds.
   Replaces i386/runtime/runtime_asm_gcc_i386.S */

# if TARGET_ARCH == X86_64_ARCH

# include "_runtime_i386.cpp.incl"  // reuse i386 includes


// =====================================================================
// Frame pointer access
// =====================================================================

extern "C" frame* currentFrame() {
  // Return the caller's frame pointer.
  // The i386 asm version just returns %ebp (caller's, since it's a leaf).
  // We dereference rbp once to get past our own frame setup.
  frame* fp;
  __asm__ __volatile__("movq (%%rbp), %0" : "=r"(fp));
  return fp;
}

extern "C" char* currentReturnAddr() {
  return (char*)__builtin_return_address(0);
}


// =====================================================================
// Stack switching (SwitchStack)
// =====================================================================
// These switch to a new stack (the VM stack) and call a function there.
// They must be implemented in assembly because they change %rsp.

// SwitchStack0: call fn_start on newSP, no extra args
extern "C" char* SwitchStack0(char* fn_start, char* newSP) {
  char* result;
  __asm__ __volatile__(
    "movq   %%rsp, %%r10\n\t"     // save old SP
    "movq   %%rbp, %%r11\n\t"     // save old BP
    "movq   %2,    %%rsp\n\t"     // switch to new stack
    "pushq  %%r10\n\t"            // save old SP on new stack
    "pushq  %%r11\n\t"            // save old BP on new stack
    "callq  *%1\n\t"              // call fn_start()
    "popq   %%r11\n\t"            // restore old BP
    "popq   %%rsp\n\t"            // restore old SP
    "movq   %%rbp, %%r11\n\t"     // (rbp may have changed)
    : "=a"(result)                 // result in rax
    : "r"(fn_start), "r"(newSP)
    : "r10", "r11", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
      "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack1(char* fn_start, char* newSP, void* arg1) {
  char* result;
  __asm__ __volatile__(
    "movq   %%rsp, %%r10\n\t"
    "movq   %2,    %%rsp\n\t"
    "pushq  %%r10\n\t"
    "subq   $8,    %%rsp\n\t"     // 16-byte align for SysV ABI
    "movq   %3,    %%rdi\n\t"     // arg1 in rdi (SysV ABI)
    "callq  *%1\n\t"
    "addq   $8,    %%rsp\n\t"     // undo alignment pad
    "popq   %%rsp\n\t"
    : "=a"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1)
    : "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11",
      "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack2(char* fn_start, char* newSP, void* arg1, void* arg2) {
  char* result;
  __asm__ __volatile__(
    "movq   %%rsp, %%r10\n\t"
    "movq   %2,    %%rsp\n\t"
    "pushq  %%r10\n\t"
    "subq   $8,    %%rsp\n\t"     // 16-byte align for SysV ABI
    "movq   %3,    %%rdi\n\t"     // arg1 in rdi
    "movq   %4,    %%rsi\n\t"     // arg2 in rsi
    "callq  *%1\n\t"
    "addq   $8,    %%rsp\n\t"     // undo alignment pad
    "popq   %%rsp\n\t"
    : "=a"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1), "r"(arg2)
    : "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11",
      "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack3(char* fn_start, char* newSP,
                               void* arg1, void* arg2, void* arg3) {
  char* result;
  __asm__ __volatile__(
    "movq   %%rsp, %%r10\n\t"
    "movq   %2,    %%rsp\n\t"
    "pushq  %%r10\n\t"
    "subq   $8,    %%rsp\n\t"     // 16-byte align for SysV ABI
    "movq   %3,    %%rdi\n\t"
    "movq   %4,    %%rsi\n\t"
    "movq   %5,    %%rdx\n\t"     // arg3 in rdx
    "callq  *%1\n\t"
    "addq   $8,    %%rsp\n\t"     // undo alignment pad
    "popq   %%rsp\n\t"
    : "=a"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1), "r"(arg2), "r"(arg3)
    : "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11",
      "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack4(char* fn_start, char* newSP,
                               void* arg1, void* arg2,
                               void* arg3, void* arg4) {
  char* result;
  __asm__ __volatile__(
    "movq   %%rsp, %%r10\n\t"
    "movq   %2,    %%rsp\n\t"
    "pushq  %%r10\n\t"
    "subq   $8,    %%rsp\n\t"     // 16-byte align for SysV ABI
    "movq   %3,    %%rdi\n\t"
    "movq   %4,    %%rsi\n\t"
    "movq   %5,    %%rdx\n\t"
    "movq   %6,    %%rcx\n\t"     // arg4 in rcx
    "callq  *%1\n\t"
    "addq   $8,    %%rsp\n\t"     // undo alignment pad
    "popq   %%rsp\n\t"
    : "=a"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1), "r"(arg2),
      "r"(arg3), "r"(arg4)
    : "rcx", "rdx", "rsi", "rdi", "r8", "r9", "r10", "r11",
      "memory", "cc"
  );
  return result;
}


// =====================================================================
// Process switching (SetSPAndCall)
// =====================================================================
// This is the heart of cooperative multitasking in Self.
// It saves/restores the entire register state for process switching.

extern "C" void SetSPAndCall(char** callerSaveAddr, char** calleeSaveAddr,
                              bool init, bool8* semaphore, bool8 pcWasSet) {
  // Save caller's frame pointer and return address
  if (callerSaveAddr) {
    callerSaveAddr[0] = (char*)__builtin_frame_address(1); // caller's rbp
    callerSaveAddr[1] = (char*)__builtin_return_address(0); // return addr
  }

  *semaphore = false;

  if (!init) {
    // Restore: jump to the saved context
    // calleeSaveAddr[0] = saved rbp, calleeSaveAddr[1] = saved return addr
    char* saved_bp = calleeSaveAddr[0];
    char* saved_pc = calleeSaveAddr[1];
    __asm__ __volatile__(
      "movq %0, %%rbp\n\t"
      "jmpq *%1\n\t"
      : : "r"(saved_bp), "r"(saved_pc)
    );
    __builtin_unreachable();
  } else {
    // Initialize: set up a new stack at calleeSaveAddr[0] and jump to calleeSaveAddr[1]
    char* new_sp = calleeSaveAddr[0];
    char* entry  = calleeSaveAddr[1];
    __asm__ __volatile__(
      "movq %0, %%rsp\n\t"
      "movq %0, %%rbp\n\t"
      "pushq $0\n\t"           // dummy return address for x86_64 ABI alignment
      "jmpq *%1\n\t"
      : : "r"(new_sp), "r"(entry)
    );
    __builtin_unreachable();
  }
}


// =====================================================================
// JIT stubs — fatal without JIT compiler
// =====================================================================

extern "C" oop SendMessage_stub(...) {
  fatal("SendMessage_stub called without JIT");
  return NULL;
}

extern "C" oop SendDIMessage_stub(...) {
  fatal("SendDIMessage_stub called without JIT");
  return NULL;
}

extern "C" oop Recompile_stub(...) {
  fatal("Recompile_stub called without JIT");
  return NULL;
}

extern "C" oop DIRecompile_stub(...) {
  fatal("DIRecompile_stub called without JIT");
  return NULL;
}

extern "C" oop MakeOld_stub(...) {
  fatal("MakeOld_stub called without JIT");
  return NULL;
}

extern "C" void ReturnTrap() {
  fatal("ReturnTrap called without JIT");
}

extern "C" void ReturnTrap2() {
  fatal("ReturnTrap2 called without JIT");
}

extern "C" void PrimCallReturnTrap() {
  fatal("PrimCallReturnTrap called without JIT");
}

extern "C" void ProfilerTrap() {
  fatal("ProfilerTrap called without JIT");
}

extern "C" void volatile ContinueNLRAfterReturnTrap(char* pc, char* sp, oop result,
                                                     frame* home, int32 homeID) {
  Unused(pc); Unused(sp); Unused(result); Unused(home); Unused(homeID);
  fatal("ContinueNLRAfterReturnTrap called without JIT");
}

extern "C" void firstSelfFrame_returnPC(...) {
  fatal("firstSelfFrame_returnPC called without JIT");
}

extern "C" void firstSelfFrameSendDescEnd(...) {
  fatal("firstSelfFrameSendDescEnd called without JIT");
}

// CallPrimitiveFromInterpreter: marshal args from interpreter stack to
// the C calling convention and call the primitive function.
//   entry_point = primitive function pointer
//   rcv         = receiver oop
//   argp        = pointer to args on interpreter stack (argp[0] = first arg)
//   nargs       = number of non-receiver arguments
extern "C" oop CallPrimitiveFromInterpreter(void* entry_point, oop rcv,
                                             oop* argp, fint nargs) {
  typedef oop (*prim_fn_t)(...);
  prim_fn_t fn = (prim_fn_t)entry_point;
  switch (nargs) {
    case  0: return fn(rcv);
    case  1: return fn(rcv, argp[0]);
    case  2: return fn(rcv, argp[0], argp[1]);
    case  3: return fn(rcv, argp[0], argp[1], argp[2]);
    case  4: return fn(rcv, argp[0], argp[1], argp[2], argp[3]);
    case  5: return fn(rcv, argp[0], argp[1], argp[2], argp[3], argp[4]);
    case  6: return fn(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5]);
    case  7: return fn(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6]);
    case  8: return fn(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7]);
    case  9: return fn(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8]);
    case 10: return fn(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8], argp[9]);
    default:
      fatal("CallPrimitiveFromInterpreter: too many arguments");
      return NULL;
  }
}

extern "C" oop EnterSelf(oop recv, char* entryPoint, oop arg1) {
  Unused(recv); Unused(entryPoint); Unused(arg1);
  fatal("EnterSelf called without JIT");
  return NULL;
}

extern "C" oop volatile ContinueNLRFromC(char* addr, bool isInterpreted, bool isSelfIC) {
  Unused(addr); Unused(isInterpreted); Unused(isSelfIC);
  fatal("ContinueNLRFromC called without JIT");
  return NULL;
}

// DiscardStack, check_saved_byte_map_base, set_flags_for_platform,
// and DIRecompile_stub_returnPC are already defined in runtime_i386.cpp
// (which compiles for x86_64 too).
// continuePC is defined in runtime.cpp.

// JIT global variables only defined in the assembly .S files (now excluded):
char* ReturnTrap_returnPC       = NULL;
char* ReturnTrapNLR_returnPC    = NULL;
char* Recompile_stub_returnPC   = NULL;
char* MakeOld_stub_returnPC     = NULL;
char* SendMessage_stub_returnPC = NULL;

// zone::frame_chain_nesting static member
int32 zone::frame_chain_nesting = 0;

# endif // TARGET_ARCH == X86_64_ARCH
