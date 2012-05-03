/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// interface between C and assembly routines 

extern "C" {
  oop SendMessage_stub(...); // This stub is called from a call: contract is post-call, pre-frame creation
  oop SendDIMessage_stub(...);

  oop ReturnResult_stub(...);
  extern oop ReturnResult_stub_result;

  oop UncommonBranch(...);
  oop Recompile_stub(...);
  oop DIRecompile_stub(...);
  oop MakeOld_stub(...);
  
  void ReturnTrap();
  void ReturnTrap2();
  void PrimCallReturnTrap();
  void ProfilerTrap();

  void volatile ContinueNLRAfterReturnTrap(char* pc, char* sp, oop result,
                                           frame* home, int32 homeID);
  void firstSelfFrame_returnPC(...);
  void firstSelfFrameSendDescEnd(...);
    
  oop CallPrimitiveFromInterpreter(...);
}

extern     char*          ReturnTrap_returnPC;
extern     char*       ReturnTrapNLR_returnPC;
extern     char*      Recompile_stub_returnPC;
extern     char*    DIRecompile_stub_returnPC; // not implemented on PPC
extern     char*        MakeOld_stub_returnPC;
extern     char*    SendMessage_stub_returnPC;



bool check_saved_byte_map_base();



extern "C" {
  oop breakpoint_prim(oop);
  
  oop smi_complement_prim(smiOop);

  oop smi_add_prim(smiOop, smiOop arg);
  oop smi_sub_prim(smiOop, smiOop arg);
  oop smi_mul_prim(smiOop, smiOop arg);
  oop smi_div_prim(smiOop, smiOop arg);
  oop smi_mod_prim(smiOop, smiOop arg);
        
  oop smi_and_prim(smiOop, smiOop arg);
  oop smi_xor_prim(smiOop, smiOop arg);
  oop smi_or_prim(smiOop, smiOop arg);
  oop smi_arithmetic_shift_left_prim(smiOop, smiOop arg);
  oop smi_logical_shift_left_prim(smiOop, smiOop arg);
  oop smi_arithmetic_shift_right_prim(smiOop, smiOop arg);
  oop smi_logical_shift_right_prim(smiOop, smiOop arg);

  frame* currentFrame();
  char* currentReturnAddr();

  char* SwitchStack0(char* fn_start,  char* newSP);
  char* SwitchStack1(char* fn_start,  char* newSP, void* arg1);
  char* SwitchStack2(char* fn_start,  char* newSP, void* arg1, void* arg2);
  char* SwitchStack3(char* fn_start,  char* newSP, void* arg1, void* arg2, void* arg3);
  char* SwitchStack4(char* fn_start,  char* newSP,
                     void* arg1, void* arg2, void* arg3, void* arg4);
        // set SP and call the fn; (used to switch to VM stack)

  // process switching primitive:
  
  //  1. make new stack frame & save all registers in it
  //  2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1]
  //  3. if (!init)        restore fp, return addr from calleeSaveAddr[0], [1]
  //                        clear semaphore, restore regs & return to return addr
  //  4 else                setup new stack fp,sp starting at calleeSaveAddr[0]
  //                        (ensure trap if return past top)
  //                        clear semaphore, jump to calleeSaveAddr[1]
  
  void  SetSPAndCall(char** callerSaveAddr, char** calleeSaveAddr,
                     bool init, bool8* semaphore, bool8 pcWasSet); 
  
  oop EnterSelf(oop recv, char* entryPoint, oop arg1);
        // call nmethod with given receiver and 1st arg
  oop volatile ContinueNLRFromC(char* addr, bool isInterpreted, bool isSelfIC);
  void volatile DiscardStack();
}


// helpers for assembly routines
extern "C" {
  extern char* continuePC;
  // to continue in C or Self after a trap, we sometimes need to go through
  // some assembly glue.  During such periods, continuePC holds the real
  // continuation PC that the assembly glue will jump to when it's done.
  // Otherwise, continuePC is NULL.
}


char* adjust_initial_SP(char* initial_SP);

oop failure_oop_for_restarting_uncommon_prim();

void fillRegisterValue(Location loc, oop b);

void set_flags_for_platform();

# include "_runtime_pd.hh.incl"

