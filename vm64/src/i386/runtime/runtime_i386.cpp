# if  TARGET_ARCH == I386_ARCH || TARGET_ARCH == X86_64_ARCH
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
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


// cannot used simple DiscardStack (as in runtime_sparc.[sS]) because of restoring
// nonvol registers
void volatile DiscardStack() {
  currentProcess->abort();
}


char* adjust_initial_SP(char* init_SP) {
  smi r = (smi)init_SP - oopSize; // incase we want to push a parameter
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


// This should be an assembly function, similar to sparc/runtime/runtime_asm_gcc_sparc.[sS].
// I haven't implemented it yet, so I just put the stub here. -mabdelmalek 10/02.
void  HandleUncommonTrap()
{
  fatal("uncommon traps unimplemented on i386");
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

# endif // TARGET_ARCH == I386_ARCH
