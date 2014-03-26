# if  TARGET_ARCH == PPC_ARCH
/* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# include "debug.hh"
# include "frame.hh"
# include "frame_format.hh"
# include "label_inline.hh"
# include "objVectorOop.hh"
# include "process.hh"
# include "regs.hh"
# include "runtime.hh"


bool check_saved_byte_map_base() {
  // nothing for PPC
  return true;
}


// cannot used simple DiscardStack (as in runtime_sparc.s) because of restoring
// nonvol registers
void volatile DiscardStack() {
  currentProcess->abort();
}


char* adjust_initial_SP(char* init_SP) {
  // don't need to adjust; asm glue (EnterSelf, I think) does it!
  return init_SP;
}



// define byte_map_base if not in a register

char* byte_map_base; // also use a register, too


// define SPLimit if not kept in a register:

char* SPLimit = NULL;
extern "C" {void set_SPLimitReg(char*); }
void  setSPLimit(char* m)        { 
  SPLimit = m; 
  if (UseSPLimitReg)
    set_SPLimitReg(m);
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


bool isNonVolSavingReturnAddress(char* r) {
  return   r == (char*)&SaveSelfNonVolRegs_returnPC
      ||   r == (char*)  &SendMessage_stub_returnPC
      ||   r == (char*)&SendDIMessage_stub_returnPC
      ||   r == (char*)        &ReturnTrap_returnPC
      ||   r == (char*)     &ReturnTrapNLR_returnPC
      ||   r == (char*)    &Recompile_stub_returnPC 
      ||   r == (char*)      &MakeOld_stub_returnPC;
}

fint volatile_register_sp_or_fp_offset(char* r) {
  return
           r == (char*)  &SendMessage_stub_returnPC  ?    SendMessage_stub_volatile_register_sp_offset
        :  r == (char*)&SendDIMessage_stub_returnPC  ?  SendDIMessage_stub_volatile_register_sp_offset
        :  r == (char*)    &Recompile_stub_returnPC  ?      Recompile_stub_volatile_register_sp_offset
        :  r == (char*)      &MakeOld_stub_returnPC  ?        MakeOld_stub_volatile_register_sp_offset
        :  r == (char*)&SaveSelfNonVolRegs_returnPC  ?  SaveSelfNonVolRegs_volatile_register_fp_offset
        :  0;
}

 
// Duplicated in runtime_asm_gcc.s:
fint ReturnTrap_frame_size = roundTo(linkage_area_size + HandleReturnTrap_arg_count + NumLocalNonVolRegisters, frame_word_alignment);

// Not implemented on PPC:
char* DIRecompile_stub_returnPC = NULL;

oop failure_oop_for_restarting_uncommon_prim() {
  assert(SaveOutgoingArgumentsOfPatchedFrames, "PPC needs this");
  warning("untested: failure_oop_for_restarting_uncommon_prim");
  return OutgoingArgsOfReturnTrapOrRecompileFrame->obj_at(0);
}


void fillRegisterValue(Location loc, oop b) {
  warning("untested");
  OutgoingArgsOfReturnTrapOrRecompileFrame->obj_at_put(loc - ReceiverReg, b);
}

void set_flags_for_platform() {
  FastMapTest                          = false;  lprintf("for PPC:  FastMapTest = false\n");
  LogVMMessages                        = true;   lprintf("for PPC:  LogVMMessages = true\n");
  PrintScriptName                      = true;   lprintf("for PPC:  PrintScriptName  = true\n");
  Inline                               = true;   lprintf("for PPC:  Inline = true\n");
  SICDeferUncommonBranches             = false;  lprintf("for PPC:  SICDeferUncommonBranches = false\n");
  SICReplaceOnStack                    = false;  lprintf("for PPC:  SICReplaceOnStack = false\n");
  SaveOutgoingArgumentsOfPatchedFrames = true;   lprintf("for PPC:  SaveOutgoingArgumentsOfPatchedFrames = true\n");
}


# include <sys/sysctl.h>

// call haveAltiVec() instead of me
bool slow_haveAltiVec() {
  int selectors[2] = { CTL_HW, HW_VECTORUNIT };
  int hasVectorUnit = 0;
  size_t length = sizeof(hasVectorUnit);
  int error = sysctl(selectors, 2, &hasVectorUnit, &length, NULL, 0);
  return  0 == error  &&  hasVectorUnit != 0;
}
# endif // TARGET_ARCH == PPC_ARCH
