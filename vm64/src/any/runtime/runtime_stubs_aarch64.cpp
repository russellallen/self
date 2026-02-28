/* Copyright 2024-2026 AUTHORS.
   See the LICENSE file for license information. */

/* C/asm stubs for aarch64 (ARM64) interpreter-only builds.
   Replaces i386/runtime/runtime_asm_gcc_i386.S
   Modeled after runtime_stubs_x86_64.cpp */

# include "config.hh"
# if TARGET_ARCH == AARCH64_ARCH

# include "_runtime_aarch64.cpp.incl"


// =====================================================================
// Frame pointer access
// =====================================================================

extern "C" frame* currentFrame() {
  // Return the caller's frame pointer.
  // On ARM64, x29 is the frame pointer.
  // We dereference fp once to get past our own frame setup.
  frame* fp;
  __asm__ __volatile__("ldr %0, [x29]" : "=r"(fp));
  return fp;
}

extern "C" char* currentReturnAddr() {
  return (char*)__builtin_return_address(0);
}


// =====================================================================
// Stack switching (SwitchStack)
// =====================================================================
// These switch to a new stack (the VM stack) and call a function there.
// They must be implemented in assembly because they change sp.
//
// ARM64 ABI: args in x0-x7, return in x0, callee-saved x19-x28/fp/lr
// Stack must be 16-byte aligned before any call (bl/blr).

// SwitchStack0: call fn_start on newSP, no extra args
extern "C" char* SwitchStack0(char* fn_start, char* newSP) {
  // fn_start in x0, newSP in x1
  char* result;
  __asm__ __volatile__(
    "mov   x9, sp\n\t"              // save old SP
    "mov   sp, %2\n\t"              // switch to new stack
    "stp   x9, xzr, [sp, #-16]!\n\t" // push old SP + padding (16-byte aligned)
    "blr   %1\n\t"                  // call fn_start()
    "mov   %0, x0\n\t"             // capture return value from x0
    "ldp   x9, xzr, [sp], #16\n\t" // pop old SP + padding
    "mov   sp, x9\n\t"             // restore old SP
    : "=r"(result)
    : "r"(fn_start), "r"(newSP)
    : "x9", "x10", "x11", "x12", "x13", "x14", "x15",
      "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8",
      "lr", "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack1(char* fn_start, char* newSP, void* arg1) {
  char* result;
  __asm__ __volatile__(
    "mov   x9, sp\n\t"
    "mov   sp, %2\n\t"
    "stp   x9, xzr, [sp, #-16]!\n\t"
    "mov   x0, %3\n\t"             // arg1 in x0
    "blr   %1\n\t"
    "mov   %0, x0\n\t"             // capture return value from x0
    "ldp   x9, xzr, [sp], #16\n\t"
    "mov   sp, x9\n\t"
    : "=r"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1)
    : "x9", "x10", "x11", "x12", "x13", "x14", "x15",
      "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8",
      "lr", "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack2(char* fn_start, char* newSP, void* arg1, void* arg2) {
  char* result;
  __asm__ __volatile__(
    "mov   x9, sp\n\t"
    "mov   sp, %2\n\t"
    "stp   x9, xzr, [sp, #-16]!\n\t"
    "mov   x0, %3\n\t"
    "mov   x1, %4\n\t"
    "blr   %1\n\t"
    "mov   %0, x0\n\t"             // capture return value from x0
    "ldp   x9, xzr, [sp], #16\n\t"
    "mov   sp, x9\n\t"
    : "=r"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1), "r"(arg2)
    : "x9", "x10", "x11", "x12", "x13", "x14", "x15",
      "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8",
      "lr", "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack3(char* fn_start, char* newSP,
                               void* arg1, void* arg2, void* arg3) {
  char* result;
  __asm__ __volatile__(
    "mov   x9, sp\n\t"
    "mov   sp, %2\n\t"
    "stp   x9, xzr, [sp, #-16]!\n\t"
    "mov   x0, %3\n\t"
    "mov   x1, %4\n\t"
    "mov   x2, %5\n\t"
    "blr   %1\n\t"
    "mov   %0, x0\n\t"             // capture return value from x0
    "ldp   x9, xzr, [sp], #16\n\t"
    "mov   sp, x9\n\t"
    : "=r"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1), "r"(arg2), "r"(arg3)
    : "x9", "x10", "x11", "x12", "x13", "x14", "x15",
      "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8",
      "lr", "memory", "cc"
  );
  return result;
}

extern "C" char* SwitchStack4(char* fn_start, char* newSP,
                               void* arg1, void* arg2,
                               void* arg3, void* arg4) {
  char* result;
  __asm__ __volatile__(
    "mov   x9, sp\n\t"
    "mov   sp, %2\n\t"
    "stp   x9, xzr, [sp, #-16]!\n\t"
    "mov   x0, %3\n\t"
    "mov   x1, %4\n\t"
    "mov   x2, %5\n\t"
    "mov   x3, %6\n\t"
    "blr   %1\n\t"
    "mov   %0, x0\n\t"             // capture return value from x0
    "ldp   x9, xzr, [sp], #16\n\t"
    "mov   sp, x9\n\t"
    : "=r"(result)
    : "r"(fn_start), "r"(newSP), "r"(arg1), "r"(arg2),
      "r"(arg3), "r"(arg4)
    : "x9", "x10", "x11", "x12", "x13", "x14", "x15",
      "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8",
      "lr", "memory", "cc"
  );
  return result;
}


// =====================================================================
// Process switching (SetSPAndCall)
// =====================================================================
// This is the heart of cooperative multitasking in Self.
// Saves/restores ALL callee-saved registers for process switching.
//
// Args: x0=callerSaveAddr, x1=calleeSaveAddr, w2=init,
//       x3=semaphore, w4=pcWasSet
//
// callerSaveAddr[0]/[1] = saved sp / saved return addr
// calleeSaveAddr[0]/[1] = saved sp / saved return addr (or new sp / entry)
//
// The saved sp (= suspendedSP) must be usable as a frame* by frame-walking
// code (Stack::first_VM_frame, etc.), so it must be:
//   - 16-byte aligned (frame::is_aligned())
//   - at *(suspendedSP+0): saved fp (used by sender())
//   - at *(suspendedSP+8): return addr = 0 (marks it as non-Self frame)
//
// Saved stack layout (at callerSaveAddr[0]):
//   [saved x19] [saved x20]
//   [saved x21] [saved x22]
//   [saved x23] [saved x24]
//   [saved x25] [saved x26]
//   [saved x27] [saved x28]
//   [saved fp]  [saved lr]
//   [copy of fp] [mock return addr=0]  <- callerSaveAddr[0] (0 mod 16)

extern "C" void ReturnOffTopOfProcess();

extern "C" __attribute__((naked))
void SetSPAndCall(char** callerSaveAddr, char** calleeSaveAddr,
                  bool init, bool8* semaphore, bool8 pcWasSet) {
  __asm__ __volatile__(
    // Prologue: save all callee-saved registers
    "stp   x19, x20, [sp, #-16]!\n\t"
    "stp   x21, x22, [sp, #-16]!\n\t"
    "stp   x23, x24, [sp, #-16]!\n\t"
    "stp   x25, x26, [sp, #-16]!\n\t"
    "stp   x27, x28, [sp, #-16]!\n\t"
    "stp   x29, x30, [sp, #-16]!\n\t"   // save fp (x29) and lr (x30)

    // Create frame-like footer for external frame walkers
    // (so suspendedSP can be interpreted as a frame* by Stack::first_VM_frame)
    // offset 0 = saved fp (for sender()), offset 8 = 0 (marks non-Self frame)
    "stp   x29, xzr, [sp, #-16]!\n\t"   // fp copy + mock return addr = 0
    // sp is now 0 mod 16

    // Save caller state if callerSaveAddr (x0) != NULL
    "cbz   x0, 1f\n\t"
    "mov   x9, sp\n\t"
    "str   x9, [x0]\n\t"                 // callerSaveAddr[0] = sp (frame-like)
    "str   x30, [x0, #8]\n\t"            // callerSaveAddr[1] = lr (return addr)
    "1:\n\t"

    // Clear semaphore
    "strb  wzr, [x3]\n\t"

    // Load callee's saved state (read before switching stacks)
    "ldr   x9, [x1]\n\t"                 // saved SP (or new SP if init)
    "ldr   x10, [x1, #8]\n\t"            // saved PC (or entry point if init)

    "tst   w2, #0xff\n\t"                // init?
    "b.ne  3f\n\t"

    // --- Resume existing process ---
    "mov   sp, x9\n\t"                   // switch to callee's saved stack
    "add   sp, sp, #16\n\t"              // skip footer (fp copy + mock ret)
    "ldp   x29, x30, [sp], #16\n\t"      // restore fp and lr
    "ldp   x27, x28, [sp], #16\n\t"
    "ldp   x25, x26, [sp], #16\n\t"
    "ldp   x23, x24, [sp], #16\n\t"
    "ldp   x21, x22, [sp], #16\n\t"
    "ldp   x19, x20, [sp], #16\n\t"
    // sp now points to where we were before prologue

    "tst   w4, #0xff\n\t"                // pcWasSet?
    "b.ne  2f\n\t"
    "br    x10\n\t"                       // normal: jump to saved PC

    // pcWasSet: jumping to function START
    // On ARM64 the return address is in lr, not on the stack, and sp
    // is already 0 mod 16 (correct for function entry).
    "2:\n\t"
    "br    x10\n\t"                       // jump to entry point

    // --- Initialize new process ---
    "3:\n\t"
    "mov   x29, #0\n\t"                  // null frame link (stop frame tracing)
    "mov   sp, x9\n\t"                   // new stack pointer (0 mod 16)
    "adrp  x9, _ReturnOffTopOfProcess@PAGE\n\t"
    "add   x9, x9, _ReturnOffTopOfProcess@PAGEOFF\n\t"
    "mov   x30, x9\n\t"                  // lr = ReturnOffTopOfProcess
    "br    x10\n\t"                       // jump to entry point

    ::: "memory"
  );
}


// =====================================================================
// JIT stubs -- fatal without JIT compiler
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
//
// IMPORTANT: On ARM64, variadic function pointers (...) use a different
// calling convention (args on stack) than non-variadic (args in registers).
// We must cast to properly-typed non-variadic function pointers so the
// compiler generates correct register-based argument passing.
extern "C" oop CallPrimitiveFromInterpreter(void* entry_point, oop rcv,
                                             oop* argp, fint nargs) {
  typedef oop (*fn0)(oop);
  typedef oop (*fn1)(oop, oop);
  typedef oop (*fn2)(oop, oop, oop);
  typedef oop (*fn3)(oop, oop, oop, oop);
  typedef oop (*fn4)(oop, oop, oop, oop, oop);
  typedef oop (*fn5)(oop, oop, oop, oop, oop, oop);
  typedef oop (*fn6)(oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn7)(oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn8)(oop, oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn9)(oop, oop, oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn10)(oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn11)(oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn12)(oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn13)(oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn14)(oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop);
  typedef oop (*fn15)(oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop, oop);
  switch (nargs) {
    case  0: return ((fn0)entry_point)(rcv);
    case  1: return ((fn1)entry_point)(rcv, argp[0]);
    case  2: return ((fn2)entry_point)(rcv, argp[0], argp[1]);
    case  3: return ((fn3)entry_point)(rcv, argp[0], argp[1], argp[2]);
    case  4: return ((fn4)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3]);
    case  5: return ((fn5)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4]);
    case  6: return ((fn6)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5]);
    case  7: return ((fn7)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6]);
    case  8: return ((fn8)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7]);
    case  9: return ((fn9)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8]);
    case 10: return ((fn10)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8], argp[9]);
    case 11: return ((fn11)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8], argp[9], argp[10]);
    case 12: return ((fn12)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8], argp[9], argp[10], argp[11]);
    case 13: return ((fn13)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8], argp[9], argp[10], argp[11], argp[12]);
    case 14: return ((fn14)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8], argp[9], argp[10], argp[11], argp[12], argp[13]);
    case 15: return ((fn15)entry_point)(rcv, argp[0], argp[1], argp[2], argp[3], argp[4], argp[5], argp[6], argp[7], argp[8], argp[9], argp[10], argp[11], argp[12], argp[13], argp[14]);
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
// (which compiles for aarch64 too).
// continuePC is defined in runtime.cpp.

// JIT global variables only defined in the assembly .S files (now excluded):
char* ReturnTrap_returnPC       = NULL;
char* ReturnTrapNLR_returnPC    = NULL;
char* Recompile_stub_returnPC   = NULL;
char* MakeOld_stub_returnPC     = NULL;
char* SendMessage_stub_returnPC = NULL;

// zone::frame_chain_nesting static member
int32 zone::frame_chain_nesting = 0;

# endif // TARGET_ARCH == AARCH64_ARCH
