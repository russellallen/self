# ifdef __ppc__
/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



/*

Inside Macintosh: Introduction to PowerPC System Software, 1-44

stack overview:

stack grows down: \/

                 _________
parameter area            | - caller allocs, and sets
linkage area     _________| - caller allocs and saves its own rtoc here
saved registers           | - callee allocs & saves GPR13 - GPR31 (but C comp only saves 16-31), FPR14-FPR21
local variables           | - callee allocs and puts locals here
parameter area            | - callee allocs and uses for extra outgoing parms
linkage area     _________| - callee allocs


parameter area: caller allocates this, puts outgoing params in it (after first 8, 
                which go in regs, must fit largest param list called by caller
                
linkage area: caller allocates, caller saves its RTOC here, 
              caller restores its RTOC after every call
              (RTOC value is saved/restored only for cross-toc calls or pointer-based calls)
              callee's prologue saves cond reg and link reg here.
              Caller's prologue saved pre-caller SP here

linkage area:

incoming sp + 20:            store incoming RTOC (ignored)
incoming sp + 16:            reserved
incoming sp + 12:            reserved
incoming sp +  8:            store incoming link {QUADWORD aligned}
incoming sp +  4:            store incoming CR (if modify cr2 - cr 4) (ignored)
incoming sp:                 caller's incoming sp was stored here by caller, QUADWORD aligned, or maybe just doubleword

example: sp -= 192:

incoming sp -  4  sp + 188:  store incoming r31
incoming sp -  8  sp + 184:  store incoming R30
incoming sp - 12  sp + 180:  store incoming R29
incoming sp - 16  sp + 176:  store incoming R28
incoming sp - 20  sp + 172:  store incoming R27
incoming sp - 24  sp + 168:  store incoming R26
incoming sp - 28  sp + 164:  store incoming R25
incoming sp - 32  sp + 160:  store incoming R24
incoming sp - 36  sp + 156:  store incoming R23
incoming sp - 40  sp + 152:  store incoming R22
incoming sp - 44  sp + 148:  store incoming R21
incoming sp - 48  sp + 144:  store incoming R20
incoming sp - 52  sp + 140:  store incoming R19
incoming sp - 56  sp + 136:  store incoming R18
incoming sp - 60  sp + 132:  store incoming R17
incoming sp - 64  sp + 128:  store incoming R16 

since sp -= 192, sp - 64 becomes sp + 128

sp + 116: local 16 (non reg local 0)
....
sp + 108: local N - 1
sp + 104: local 19 (non reg local 3)

sp + 100: last outgoing arg (arg 19)
...
sp + 60: outgoing arg 9
sp + 56: outgoing arg 8 (first nonreg outgoing arg)

sp + 54: space for callee to store of last reg outgoing arg (arg 7, R10)
...
sp + 28: space for callee to store of arg 1, R4
sp + 24: space for callee to store of arg 0, R3

sp + 20: top of linkage area



stack size: 
  6 words in linkage area, 
  max-outgoing-args words for outgoing args
  N locals words
  <alignment to doubleword if any FPRs stored>
  0 - 18 doublewords for saved FPRs (FPR 14 - FRP 31)  
  <alignment so that R31 must end at quadword boundary>
  0 - 56 words for saved GPRs [0 - 19 words] & saved FPRs [0 - 18 doublewords]
  
  so stack size in words =  6 (linkage size) + max-outgoing-args  +  n-nonreg-locals
                         +  fpr-alignment  +  2 * n-saved-fprs
                         +  gpr-alignment  +  n-saved-gprs


R31:  local  0
R30:  local  1
R29:  local  2
R28:  local  3
R27:  local  4
R26:  local  5
R25:  local  6
R24:  local  7
R23:  local  8
R22:  local  9
R21:  local 10
R20:  local 11
R19:  local 12
R18:  local 13
R17:  local 14
R16:  local 15



<incoming sp - 64>

R3:  outgoing arg 0
R4:  outgoing arg 1
R5:  outgoing arg 2
R6:  outgoing arg 3
R7:  outgoing arg 4
R8:  outgoing arg 5
R9:  outgoing arg 6
R10: outgoing arg 7


leaf procs can use red zone, sp-4 through sp-224
  224 is space used by 19 32-bit GPRs + 18 64-bit fprs, rounded up to doubleword boundary


*/

// For these constants, "top" means "farther from the top of stack (TOS)",
// and "bottom" means "closer to TOS".  That is, if the stack grows
// downwards in memory (as in Unix), "top" pointer > "bottom" ptr.


const fint    frame_word_alignment = 4; // align frames to quad word for best load/store multiple speed
const fint frame_alignment_offset = 0; // frame ptr is what is aligned


// stack offsets from stack pointer
const fint    linkage_area_start      = 0;
const fint    saved_sp_offset         = 0; // store sp here after frame creation
const fint    saved_cr_offset         = 1; // store cond reg here before frame creation if you use cr2 - cr 4
const fint    saved_pc_offset         = 2; // store link reg here before frame creation
const fint    reserved1_offset        = 3;
const fint    reserved2_offset        = 4;
const fint    saved_rtoc_offset       = 5; // store RTOC here post frame creation (if trans RTOC)
const fint    linkage_area_end        = 6;
const fint    receiver_stack_offset   = 6;
const fint    first_arg_stack_offset  = 7;

const fint    last_saved_reg_offset   = -1;




// stack offsets from first (lowest) saved non-vol: these are locals that the Self
//  compiler allocates in every one of its frames
// warning current_pc_offset is duplicated in asmDefs_ppc.h for ProfilerTrap

// We cannot put the current_pc word here, as I first thought because:
// when the stack is patched, the original return pc is put in current_pc.
// To find current_pc, we need the nmethod to find how many non-vols are saved in the frame.
// But to find the nmethod we need the original return pc; Catch-22.

// So, keep the current_pc word in the saved_rtoc_field instead.
// After all, that field is only used by the CALLER to do a C-style cross
// RTOC call. (See Inside Macintosh PowerPC System Software.)

const fint    nmethod_frame_chain_offset  = -1;
const fint    patched_frame_saved_outgoing_args_offset = -2;
const fint    last_extra_offset           = patched_frame_saved_outgoing_args_offset;
const fint    num_extra_locals_for_runtime = -last_extra_offset;

const fint    current_pc_offset           = saved_rtoc_offset;


// Frame sizes
const fint    linkage_area_size = linkage_area_end - linkage_area_start;


// offsets for saved arg part of stack (parent's frame)
inline int32 rcvr_and_argument_offset(fint i /* 0 = rcvr */) {
  return receiver_stack_offset + i;
}

inline int32 stackLocation_offset(fint i, fint max_no_of_outgoing_args_and_rcvr) {
  return receiver_stack_offset + max_no_of_outgoing_args_and_rcvr + i;
}

# if defined(SIC_COMPILER)

  inline int32 stackTempCountToFrameSize(int32 size) {
    return size + linkage_area_size + num_extra_locals_for_runtime;
  }

  inline int32 frameSizeToStackTempCount(int32 size) {
    return size - linkage_area_size - num_extra_locals_for_runtime;
  }

# endif

// return offset off of sp
int32 spOffset(Location reg, fint frameSize, fint max_no_of_outgoing_args_and_rcvr);


// Duplicated in asmDefs_gcc_ppc.hh
const fint PerformSelectorLoc_sp_offset  =  -(NumLocalNonVolRegisters + 1) * oopSize;
const fint PerformDelegateeLoc_sp_offset =  -(NumLocalNonVolRegisters + 2) * oopSize;
# endif // __ppc__
