# if  TARGET_ARCH == I386_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation  "runtime_i386.hh"

# include "_runtime_i386.cpp.incl"

// Follows is a list of potential improvements to my I386 port of Self as of 5/16/06:
// - Could use the SIMD instructions to speed searches for senders, implementors, etc. (search_i386.cpp).
// - Could implement deferred compilation of uncommon branches for more speed.
// - Could implement interpreter glue, to allow experiments with the interpreter.
// - Could optimize the SIC better for this platform; it seems to generate unneeded moves:
//    e.g. desktop close top-level method moves eax to esi and back to eax.
// Could implement compiled_vframe::sendeeOrNULL_for_get_expr_stack to improve recompilation accuracy.
// Could make a universal binary for convenience.
// Could get the Carbon UI to work in the debug version (cannot pull UI window to front right now).
//   (But the X version does work.)
// Could add explicit info in the Snapshot so would not have to heuristally determin endian-ness.
//
// There is a very intermittent bug when doing "comparatorTests doTests testShortLines".
// I have seen this once in the debug version when running "tests testVMSuite. tests testSelfSuite".




bool check_saved_byte_map_base() {
  // nothing for intel
  return true;
} 


// cannot used simple DiscardStack (as in runtime_sparc.s) because of restoring
// nonvol registers
void volatile DiscardStack() {
  currentProcess->abort();
}


char* adjust_initial_SP(char* init_SP) {
  int r = (int)init_SP - oopSize; // incase we want to push a parameter
  r -= frame_alignment_offset * BytesPerWord;
  return (char*)(r & ~(frame_word_alignment * BytesPerWord  -  1)) + frame_alignment_offset * BytesPerWord; // apple docs says 16-byte alignment
}


// define byte_map_base if not in a register

char* byte_map_base; // also use a register, too



// define SPLimit if not kept in a register:

char* SPLimit = NULL;
extern "C" {void set_SPLimitReg(char*); }
void  setSPLimit(char* m)        { 
  SPLimit = m; 
}

char* currentSPLimit()           { return SPLimit; }

// some machines do not need the following in asm:
extern "C" oop breakpoint_prim(oop rcvr) { 
  return rcvr; 
}


// This should be an assembly function, similar to sparc/runtime/runtime_asm_gcc_sparc.s.
// I haven't implemented it yet, so I just put the stub here. -mabdelmalek 10/02.
void  HandleUncommonTrap()
{
  fatal("uncommon traps unimplemented on PPC");
}



// Not implemented on Intel:
char* DIRecompile_stub_returnPC = NULL;



oop failure_oop_for_restarting_uncommon_prim() {
  assert(SaveOutgoingArgumentsOfPatchedFrames, "I386 needs this");
  if (SpendTimeForDebugging)
    warning("untested: failure_oop_for_restarting_uncommon_prim");
  return OutgoingArgsOfReturnTrapOrRecompileFrame->obj_at(0);
}


void fillRegisterValue(Location loc, oop b) {
  if (SpendTimeForDebugging)
    warning("untested: fillRegisterValue");
  OutgoingArgsOfReturnTrapOrRecompileFrame->obj_at_put(loc - ReceiverReg, b);
}




void set_flags_for_platform() {
  LogVMMessages                        = true;   lprintf("for I386:  LogVMMessages = true\n");
  PrintScriptName                      = true;   lprintf("for I386:  PrintScriptName  = true\n");
  Inline                               = true;   lprintf("for I386:  Inline = true\n");
  # ifdef SIC_COMPILER
    SICDeferUncommonBranches             = false;  lprintf("for I386:  SICDeferUncommonBranches = false (not implemented)\n"); 
    SICReplaceOnStack                    = false;  lprintf("for I386:  SICReplaceOnStack = false (not implemented)\n");
  # endif
  SaveOutgoingArgumentsOfPatchedFrames = true;   lprintf("for I386:  SaveOutgoingArgumentsOfPatchedFrames = true\n");
}


# if HOST_ARCH == PPC_ARCH  &&  TARGET_ARCH == I386_ARCH //testing Intel asm

# define STUBBIFY(a) void a() {fatal(XSTR(a));}
extern "C" {
  oop EnterSelf(oop recv, char* entryPoint, oop arg1) { fatal("stub");}
  frame* currentFrame() { return 0; }
  void firstSelfFrameSendDescEnd(...) {fatal("stub");}
  char* vmDate;

  oop Recompile_stub(...) {fatal("stub");}
  oop MakeOld_stub(...) {fatal("stub");}
  
  oop SendMessage_stub(...) {fatal("stub");}
  oop SendDIMessage_stub(...) {fatal("stub");}

  oop smi_add_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_and_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_arithmetic_shift_left_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_arithmetic_shift_right_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_complement_prim(smiOop) { fatal("stub"); }
  oop smi_logical_shift_left_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_logical_shift_right_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_mul_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_or_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_sub_prim(smiOop, smiOop) { fatal("stub"); }
  oop smi_xor_prim(smiOop, smiOop) { fatal("stub"); }

  void volatile ContinueNLRAfterReturnTrap(char* pc, char* sp, oop result,
                                           frame* home, int32 homeID) {fatal("stub");}
                                           
  oop volatile ContinueNLRFromC(char* addr, bool isInterpreted, bool isSelfIC) {fatal("stub");}


STUBBIFY(PrimCallReturnTrap)
STUBBIFY(ProfilerTrap)
STUBBIFY(ReturnTrap)


  void  SetSPAndCall(char** callerSaveAddr, char** calleeSaveAddr,
                     bool init, bool8* semaphore) {fatal("stub");}
  
 char* SwitchStack0(char* fn_start,  char* newSP) {fatal("stub");}
  char* SwitchStack1(char* fn_start,  char* newSP, void* arg1) {fatal("stub");}
  char* SwitchStack2(char* fn_start,  char* newSP, void* arg1, void* arg2) {fatal("stub");}
  char* SwitchStack3(char* fn_start,  char* newSP, void* arg1, void* arg2, void* arg3) {fatal("stub");}
  char* SwitchStack4(char* fn_start,  char* newSP,
                     void* arg1, void* arg2, void* arg3, void* arg4) {fatal("stub");}
oop CallPrimitiveFromInterpreter(...) {fatal("stub"); }

void      firstSelfFrame_returnPC(...) {fatal("stub");}
char*          ReturnTrap_returnPC;
char*       ReturnTrapNLR_returnPC;
char*      Recompile_stub_returnPC;
char*        MakeOld_stub_returnPC;
char*    SendMessage_stub_returnPC;

}

# endif
# endif // TARGET_ARCH == I386_ARCH
