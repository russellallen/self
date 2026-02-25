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
// Saves/restores ALL callee-saved registers for process switching.
//
// Args: rdi=callerSaveAddr, rsi=calleeSaveAddr, edx=init,
//       rcx=semaphore, r8b=pcWasSet
//
// callerSaveAddr[0]/[1] = saved rsp / saved return addr
// calleeSaveAddr[0]/[1] = saved rsp / saved return addr (or new sp / entry)
//
// The saved rsp (= suspendedSP) must be usable as a frame* by frame-walking
// code (Stack::first_VM_frame, etc.), so it must be:
//   - 16-byte aligned (frame::is_aligned())
//   - at *(suspendedSP+0): saved rbp (used by sender())
//   - at *(suspendedSP+8): return addr = 0 (marks it as non-Self frame)
//
// Saved stack layout (at callerSaveAddr[0]):
//   [original return addr]   <- rbp+8
//   [saved rbp]              <- rbp
//   [saved rbx]              <- rbp-8
//   [saved r12]              <- rbp-16
//   [saved r13]              <- rbp-24
//   [saved r14]              <- rbp-32
//   [saved r15]              <- rbp-40
//   [padding = 0]            <- rbp-48
//   [mock return addr = 0]   <- rbp-56
//   [copy of rbp]            <- rbp-64 = callerSaveAddr[0] (0 mod 16)

extern "C" void ReturnOffTopOfProcess();

extern "C" __attribute__((naked))
void SetSPAndCall(char** callerSaveAddr, char** calleeSaveAddr,
                  bool init, bool8* semaphore, bool8 pcWasSet) {
  __asm__ __volatile__(
    // Prologue: save all callee-saved registers
    "pushq %%rbp\n\t"
    "movq  %%rsp, %%rbp\n\t"
    "pushq %%rbx\n\t"
    "pushq %%r12\n\t"
    "pushq %%r13\n\t"
    "pushq %%r14\n\t"
    "pushq %%r15\n\t"

    // Create frame-like footer for external frame walkers
    // (so suspendedSP can be interpreted as a frame* by Stack::first_VM_frame)
    "pushq $0\n\t"                    // padding (alignment)
    "pushq $0\n\t"                    // mock return addr (marks non-Self frame)
    "pushq %%rbp\n\t"                 // rbp copy (sender() follows this)
    // rsp is now 0 mod 16

    // Save caller state if callerSaveAddr (rdi) != NULL
    "testq %%rdi, %%rdi\n\t"
    "jz    1f\n\t"
    "movq  %%rsp, (%%rdi)\n\t"        // callerSaveAddr[0] = rsp (frame-like)
    "movq  8(%%rbp), %%rax\n\t"       // caller's return address
    "movq  %%rax, 8(%%rdi)\n\t"       // callerSaveAddr[1] = return addr
    "1:\n\t"

    // Clear semaphore
    "movb  $0, (%%rcx)\n\t"

    // Load callee's saved state (read before switching stacks)
    "movq  (%%rsi), %%r9\n\t"         // saved SP (or new SP if init)
    "movq  8(%%rsi), %%rax\n\t"       // saved PC (or entry point if init)

    "testb %%dl, %%dl\n\t"            // init?
    "jnz   3f\n\t"

    // --- Resume existing process ---
    "movq  %%r9, %%rsp\n\t"           // switch to callee's saved stack
    "addq  $24, %%rsp\n\t"            // skip footer (rbp copy + mock ret + pad)
    "popq  %%r15\n\t"                 // restore all callee-saved registers
    "popq  %%r14\n\t"
    "popq  %%r13\n\t"
    "popq  %%r12\n\t"
    "popq  %%rbx\n\t"
    "popq  %%rbp\n\t"
    // rsp now points to original return address
    "movq  %%rax, (%%rsp)\n\t"        // overwrite with saved PC
    "testb %%r8b, %%r8b\n\t"          // pcWasSet?
    "jnz   2f\n\t"
    "ret\n\t"                          // normal: pop return addr and jump

    // pcWasSet: jumping to function START, don't pop return addr
    // (rsp stays 8 mod 16, as if call just executed)
    "2:\n\t"
    "jmpq  *(%%rsp)\n\t"

    // --- Initialize new process ---
    // suspendedSP is 0 mod 16 on x86_64.  Push ReturnOffTopOfProcess (8 bytes)
    // so rsp becomes 8 mod 16, which is correct for a function entry (as if
    // call had just pushed a return address).
    "3:\n\t"
    "movq  $0, %%rbp\n\t"             // null frame link (stop frame tracing)
    "movq  %%r9, %%rsp\n\t"           // new stack pointer (0 mod 16)
    "leaq  ReturnOffTopOfProcess(%%rip), %%r9\n\t"
    "pushq %%r9\n\t"                   // return addr if process falls off top
    "jmpq  *%%rax\n\t"                // jump to entry point (rsp is 8 mod 16)

    ::: "memory"
  );
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
