# if defined(__ppc__) || defined(__powerpc__)
// Sun-$Revision: 30.14 $


// Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
//   See the LICENSE file for license information.


/* remove me from MW project when compiling under MW */


# include "asmDefs_gcc_ppc.hh"
        
    start_exported_function(currentFrame)
    mr     r3, sp
    blr

    start_exported_function(currentRTOC)
    mr     r3, rtoc
    blr

    start_exported_function(currentReturnAddr)
    lwz    r3, LinkageArea_savedPC(sp)
    blr

    start_exported_function(set_SPLimitReg)
    mr   SPLimitReg, r3 // relies on C not using this register (ugh)
    blr

    start_exported_function(save1Arg)
    // save arg1 in stack frame
    stw    r3, LinkageArea_size(sp) // arg area is right after linkage area
    blr

  //-----------------------------------------------------------------
                
                
allNVFPRs_sf31 = 0 - size_of_fpr
allNVFPRs_sf30 = allNVFPRs_sf31 - size_of_fpr
allNVFPRs_sf29 = allNVFPRs_sf30 - size_of_fpr
allNVFPRs_sf28 = allNVFPRs_sf29 - size_of_fpr
allNVFPRs_sf27 = allNVFPRs_sf28 - size_of_fpr
allNVFPRs_sf26 = allNVFPRs_sf27 - size_of_fpr
allNVFPRs_sf25 = allNVFPRs_sf26 - size_of_fpr
allNVFPRs_sf24 = allNVFPRs_sf25 - size_of_fpr
allNVFPRs_sf23 = allNVFPRs_sf24 - size_of_fpr
allNVFPRs_sf22 = allNVFPRs_sf23 - size_of_fpr
allNVFPRs_sf21 = allNVFPRs_sf22 - size_of_fpr
allNVFPRs_sf20 = allNVFPRs_sf21 - size_of_fpr
allNVFPRs_sf19 = allNVFPRs_sf20 - size_of_fpr
allNVFPRs_sf18 = allNVFPRs_sf19 - size_of_fpr
allNVFPRs_sf17 = allNVFPRs_sf18 - size_of_fpr
allNVFPRs_sf16 = allNVFPRs_sf17 - size_of_fpr
allNVFPRs_sf15 = allNVFPRs_sf16 - size_of_fpr
allNVFPRs_sf14 = allNVFPRs_sf15 - size_of_fpr

allNVFPRs_size = -allNVFPRs_sf14
                
// local def            


  
//  1. make new stack frame & save all registers in it
//  2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1]
//  3. if (!init)        restore fp, return addr from calleeSaveAddr[0], [1]
//                        clear semaphore, restore regs & return to return addr
//  4 else                setup new stack fp,sp starting at calleeSaveAddr[0]
//                        (ensure trap if return past top)
//                        clear semaphore, jump to calleeSaveAddr[1]

locals_for_sf_size = 0
rounded_locals_for_sf_size = (locals_for_sf_size + 7) & ~7
                
// FrameTop is the part of the frame at the top, addressed from tops

FrameTop_top = 0 // assume qw alignment
FrameTop_fprs_top = FrameTop_top
FrameTop_gprs_top = FrameTop_fprs_top  -  round(allNVFPRs_size, alignment_of_lsmul_top)
FrameTop_lcls_top = FrameTop_gprs_top  -  NonVolRegisterSize
FrameTop_bot  = FrameTop_lcls_top - round(locals_for_sf_size, size_of_gpr)
FrameTop_size = FrameTop_top - FrameTop_bot

                
Frame_bot = 0                // assume qw alignment
Frame_LinkageArea = Frame_bot
Frame_FrameTop_top = Frame_LinkageArea + round(LinkageArea_size + FrameTop_size, alignment_of_sp)
Frame_top = Frame_FrameTop_top
Frame_size = Frame_top - Frame_bot


 
// process switch primitive
// NOTE ASSUMES switching within same code segment:
//   void  SetSPAndCall( char** callerSaveAddr, char** calleeSaveAddr,
//                      bool init, bool* semaphore)// (bool == char)

  
# define callerSaveAddr  r3
# define calleeSaveAddr  r4
# define init            r5
# define semaphore       r6
# define fp              r7
# define link            r8

        
saveAddr_SP = 0
saveAddr_PC = size_of_gpr

  
  // next bit inspired by MPW PPC ASM manual, pg 1-6
  // must save/restore nonvol regs: r13 and up, Fr14 and up, and parts of CR
  // if asserts, should also zero out all others, incl ctr (count), xer, fp execption,
  //  fpscr fp status & control reg
  
  
// first make new stack frame & save all registers in it

start_exported_function(SetSPAndCall)
        mflr    link
        stw     link, LinkageArea_savedPC(sp)
        mfcr    r0
        stw     r0, LinkageArea_savedCR(sp)
        mr      fp,sp
        stwu    sp, LinkageArea_savedSP - Frame_size (sp)
        
//  2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1]
        
        cmpwi   callerSaveAddr, 0
        beq     noSave
        stw     sp,saveAddr_SP(callerSaveAddr)
        stw     link,saveAddr_PC(callerSaveAddr)
noSave: 
        
        stfd    f31,FrameTop_fprs_top + allNVFPRs_sf31(fp)
        stfd    f30,FrameTop_fprs_top + allNVFPRs_sf30(fp)
        stfd    f29,FrameTop_fprs_top + allNVFPRs_sf29(fp)
        stfd    f28,FrameTop_fprs_top + allNVFPRs_sf28(fp)
        stfd    f27,FrameTop_fprs_top + allNVFPRs_sf27(fp)
        stfd    f26,FrameTop_fprs_top + allNVFPRs_sf26(fp)
        stfd    f25,FrameTop_fprs_top + allNVFPRs_sf25(fp)
        stfd    f24,FrameTop_fprs_top + allNVFPRs_sf24(fp)
        stfd    f23,FrameTop_fprs_top + allNVFPRs_sf23(fp)
        stfd    f22,FrameTop_fprs_top + allNVFPRs_sf22(fp)
        stfd    f21,FrameTop_fprs_top + allNVFPRs_sf21(fp)
        stfd    f20,FrameTop_fprs_top + allNVFPRs_sf20(fp)
        stfd    f19,FrameTop_fprs_top + allNVFPRs_sf19(fp)
        stfd    f18,FrameTop_fprs_top + allNVFPRs_sf18(fp)
        stfd    f17,FrameTop_fprs_top + allNVFPRs_sf17(fp)
        stfd    f16,FrameTop_fprs_top + allNVFPRs_sf16(fp)
        stfd    f15,FrameTop_fprs_top + allNVFPRs_sf15(fp)
        stfd    f14,FrameTop_fprs_top + allNVFPRs_sf14(fp)
        
        
        stmw    LowestNonVolReg, FrameTop_gprs_top(fp)

        stw     rtoc, LinkageArea_savedRTOC(sp)
        
        
//  3. if (!init)        restore fp, return addr from calleeSaveAddr[0], [1]
//                        clear semaphore, restore regs & return to return addr
        
        lwz     sp,saveAddr_SP(calleeSaveAddr)
        lwz     r0,saveAddr_PC(calleeSaveAddr)
        mtlr    r0

        li      r0,0
        stb     r0,0(semaphore)

        cmpwi   init, 0
        bne     firstTimeThisProcess

        lwz     fp,LinkageArea_savedSP(sp)
        
        lwz     r0,LinkageArea_savedCR(fp)
        mtcr    r0
        // lwz   rtoc,LinkageArea_savedRTOC(sp)
        
        lmw     LowestNonVolReg, FrameTop_gprs_top(fp)
                
        lfd     f31,FrameTop_fprs_top + allNVFPRs_sf31(fp)
        lfd     f30,FrameTop_fprs_top + allNVFPRs_sf30(fp)
        lfd     f29,FrameTop_fprs_top + allNVFPRs_sf29(fp)
        lfd     f28,FrameTop_fprs_top + allNVFPRs_sf28(fp)
        lfd     f27,FrameTop_fprs_top + allNVFPRs_sf27(fp)
        lfd     f26,FrameTop_fprs_top + allNVFPRs_sf26(fp)
        lfd     f25,FrameTop_fprs_top + allNVFPRs_sf25(fp)
        lfd     f24,FrameTop_fprs_top + allNVFPRs_sf24(fp)
        lfd     f23,FrameTop_fprs_top + allNVFPRs_sf23(fp)
        lfd     f22,FrameTop_fprs_top + allNVFPRs_sf22(fp)
        lfd     f21,FrameTop_fprs_top + allNVFPRs_sf21(fp)
        lfd     f20,FrameTop_fprs_top + allNVFPRs_sf20(fp)
        lfd     f19,FrameTop_fprs_top + allNVFPRs_sf19(fp)
        lfd     f18,FrameTop_fprs_top + allNVFPRs_sf18(fp)
        lfd     f17,FrameTop_fprs_top + allNVFPRs_sf17(fp)
        lfd     f16,FrameTop_fprs_top + allNVFPRs_sf16(fp)
        lfd     f15,FrameTop_fprs_top + allNVFPRs_sf15(fp)
        lfd     f14,FrameTop_fprs_top + allNVFPRs_sf14(fp)
        
        mr      sp,fp
        
        # if GENERATE_DEBUGGING_AIDS
        
        li      r0,0
        li      r3,0
        li      r4,0
        li      r5,0
        li      r6,0
        li      r7,0
        li      r8,0
        li      r9,0
        li      r10,0
        li      r11,0
        li      r12,0
        
        # endif
                
        blr
        nop // just in case the linker messes  us up
        
//  4 else                setup new stack fp,sp starting at calleeSaveAddr[0]
//                        (ensure trap if return past top)
//                        clear semaphore, jump to calleeSaveAddr[1]

FirstFrame      = 0 // assume qw alignment
FirstFrame_bot = FirstFrame
FirstFrame_top = round(LinkageArea_size, alignment_of_sp)
FirstFrame_size = FirstFrame_top

firstTimeThisProcess:
        li      r0,15
        andc    sp,sp,r0 // align by 16
        li      r0, 0
        stwu    r0, LinkageArea_savedSP - FirstFrame_size(sp)      // decr & store null sp
        import_function_address(r3, ReturnOffTopOfProcess)
        stw     r3,LinkageArea_savedPC(sp)
        
        # if GENERATE_DEBUGGING_AIDS
        li      r0,0
        li      r3,0
        li      r4,0
        li      r5,0
        li      r6,0
        li      r7,0
        li      r8,0
        li      r9,0
        li      r10,0
        li      r11,0
        li      r12,0

        li      r14,0
        li      r15,0
        li      r16,0
        li      r17,0
        li      r18,0
        li      r19,0
        li      r20,0
        li      r21,0
        li      r22,0
        li      r23,0
        li      r24,0
        li      r25,0
        li      r26,0
        li      r27,0
        li      r28,0
        li      r29,0
        li      r30,0
        li      r31,0
        
        # endif
        
        blrl
        lwz     r0,LinkageArea_savedPC(sp)
        mtlr    r0
        lwz     sp,LinkageArea_savedSP(sp)
        blr
        
// =============================================
// SwitchStack0 switches back toVm stack with 0 arguments
/// Actually it passes 4 args, so it can be reused to inplement the others
        
        
        
# define newPC       r3
# define lastSP      r4
# define a1          r5
# define a2          r6
# define a3          r7
# define a4          r8

SwSFrame = 0
SwSFrame_bot = SwSFrame
SwSFrame_argsave = SwSFrame_bot + LinkageArea_size /* space for callee to save args */
SwSFrame_top = round(SwSFrame_argsave  +  4 * size_of_gpr, alignment_of_sp)
SwSFrame_size = SwSFrame_top


start_exported_function(SwitchStack0) 
switch_stack: 
        mflr    r0
        stw     r0, LinkageArea_savedPC(sp)
        mr      r0, sp
        la      sp, -SwSFrame_size(lastSP) // set sp
        stw     r0, LinkageArea_savedSP(sp)

        mtlr    newPC
        
        mr      r3, a1
        mr      r4, a2
        mr      r5, a3
        mr      r6, a4
        
        blrl
        
        lwz     sp, LinkageArea_savedSP(sp)
        lwz     r0, LinkageArea_savedPC(sp)
        mtlr    r0
        blr     


  start_exported_function(SwitchStack1)
        b switch_stack

  start_exported_function(SwitchStack2)
        b switch_stack

  start_exported_function(SwitchStack3)
        b switch_stack

  start_exported_function(SwitchStack4)
        b switch_stack
        
        
// ===========================================

// CallPrimitiveFromInterpreter
        
        
  // called with entry point, rcv, argp, arg_count
  

reg_save_len    = 4 * size_of_gpr// 4 words to preserve alignment

                // assume qw alignment
CPFIFrame_bot  = 0 // qw alignment
CPFIFrame_argsave = LinkageArea_size
CPFIFrame_regsave = round(CPFIFrame_argsave  +  4 * size_of_gpr, alignment_of_lsmul_top)
CPFIFrame_top     = CPFIFrame_regsave   + reg_save_len 
CPFIFrame_size = CPFIFrame_top
                
linkage_len     = 12

# define entry_pt_a      r3
# define rcv_a           r4
# define argp_a          r5
# define arg_count_a     r6
# define scr_a           r7

# define argp            r31
# define arg_count       r30
# define scr_b           r29

  start_exported_function(CallPrimitiveFromInterpreter)
  
        mflr    r0
        stw     r0,LinkageArea_savedPC(sp) // save link
        
        stmw    r28,-reg_save_len(sp) // save 4 nonvol regs
        
        slwi    scr_a, arg_count_a, 2 // words to bytes
        sub     scr_a,  sp, scr_a       // scr_a now has sp - arg length
        addi    scr_a, scr_a, -(LinkageArea_size + reg_save_len) // and - linkage_len - reg_save_len
        li      r0, 15
        andc    scr_a, scr_a, r0  // round down
        stw     sp,0(scr_a)
        mr      sp, scr_a // setup sp for new frame
        
        mtlr    entry_pt_a
        mr      r3, rcv_a
        mr      argp, argp_a
        mr      arg_count, arg_count_a
        
        addi    r0, arg_count, 1
        mtctr   r0
        
        // redo to use lswx someday:
        bdz     endRegArgs
        lwz     r4,  0(argp)
        bdz     endRegArgs
        lwz     r5,  4(argp)
        bdz     endRegArgs
        lwz     r6,  8(argp)
        bdz     endRegArgs
        lwz     r7,  12(argp)
        bdz     endRegArgs
        lwz     r8,  16(argp)
        bdz     endRegArgs
        lwz     r9,  20(argp)
        bdz     endRegArgs
        lwz     r10, 24(argp)
        bdz     endRegArgs
        lwz     r11, 28(argp)
        bdz     endRegArgs
        lwz     r12, 32(argp)
endRegArgs:
        mtctr   r0
        addi    argp, argp, -oopSize
        la      scr_b, LinkageArea_size - oopSize (sp) // put start of args in frame in scr_b
        bdz     endRegMem
        
regMemLoop:     lwzu    r0,oopSize(argp)
                stwu    r0,oopSize(scr_b)
                bdnz    regMemLoop
                
endRegMem:      
                stw     rtoc,LinkageArea_savedRTOC(sp)
                blrl    // go!
                lwz     rtoc,LinkageArea_savedRTOC(sp) // reload, although others do not
                lwz     sp,LinkageArea_savedSP(sp)
                lmw     r28,-reg_save_len(sp) // restore nonvol gprs
                lwz     r0,LinkageArea_savedPC(sp)
                mtlr    r0
                blr

// ---------------------------------------------------------
// SaveSelfNonVolRegs

// Problem: VM needs to walk stack to find all oops to do GC etc.
// But callee-saved regs are saved wherever.
// Solution: when Self calls a C-routine that might walk the stack,
// go through me. Pass args the usual way, pass fn entry point in r11 (Temp1) and
// pass # of args (including receiver) in r12.
 
 
// WARNING: next two defines are DUPLICATED in regs_ppc.hh
# define SaveSelfNonVolRegs_entry_point_register Temp1
# define SaveSelfNonVolRegs_arg_count_register   Temp2


# define excess_arg_count r31
# define frame_size   r30
# define caller_sp    r29
# define srcp         r28
# define dstp         r27


// frame contains saved nonvols, room for callee to save all r3-r10 possible incoming reg args
// frame includes all nonvols, all arg regs (for C to save into me) + space for mem args
 
// As of 1/03 I am changing this routine to always save the incoming arg regs so
// that when we patch a frame we can get at the outgoing arguments for restarting a send
// -- dmu                

// save volatiles for return trap handling...use the area that my caller might use anyway
// WARNING: DUPLICATED in runtime_ppc.hh

// Do not use the area for C callees to save register args, no telling what
// they will put there. Instead, allocate an area relative to the TOP of my frame,
// since I do not statically know my number of outgoing args. -- dmu
SaveSelfNonVolRegs_volatile_register_fp_offset = -(NumLocalNonVolRegisters + NumRcvrAndArgRegisters)

base_fr_size =   LinkageArea_size/oopSize + NumRcvrAndArgRegisters + -SaveSelfNonVolRegs_volatile_register_fp_offset

# define  vol_base       r31
# define  vol_reg_count  r30


#define load_global_nonvol_regs						  \
                import_data_address(ByteMapBaseReg, byte_map_base)	; \
                import_data_address(SPLimitReg, SPLimit)		; \
                lwz     ByteMapBaseReg, 0(ByteMapBaseReg)		; \
                lwz     SPLimitReg,     0(SPLimitReg)

                
                // need to reuse the save sequence, so macrofy it
#define save_local_nonvol_regs \
                stmw    LowestLocalNonVolReg, -(size_of_gpr * NumLocalNonVolRegisters)(sp)
                 
                // need to reuse the load sequence, so macrofy it
#define restore_local_nonvol_regs(base, disp) \
                lmw     LowestLocalNonVolReg, (disp -(size_of_gpr * NumLocalNonVolRegisters))(base)
                
                start_exported_function(SaveSelfNonVolRegs)        
SaveSelfNonVolRegs_start:
                mflr    r0 // save link
                stw     r0, LinkageArea_savedPC(sp)
                save_local_nonvol_regs                
               
                // which case?
                cmpwi   SaveSelfNonVolRegs_arg_count_register, NumRcvrAndArgRegisters
                bgt     extra_args//  have at least 1 extra
                
                // common case: no extra args
                
                // save the right number of vol regs
                // save outgoing volatiles for frame patching/return trap handling
                la    vol_base, (SaveSelfNonVolRegs_volatile_register_fp_offset * oopSize)(sp) 
                slwi  vol_reg_count, SaveSelfNonVolRegs_arg_count_register, 2 // in BYTES
                mtxer vol_reg_count // byte count -> bottom bits of XER
                stswx r3, 0, vol_base // store the registers

                stwu    sp, -round(base_fr_size * size_of_gpr, alignment_of_sp) (sp)// DUPLICATED in lmw below and in ContinueNLRFromC above
                
do_call:        
                mtlr    SaveSelfNonVolRegs_entry_point_register
                blrl
                
start_exported_function(SaveSelfNonVolRegs_returnPC)
                b       return_normally
                .long    0 // mask
                b       return_nlr
                .long    0 // nmln, not sure if needed
                .long    0 // ditto
                
                // unwind stack and return
                
return_normally:
                lwz     sp, LinkageArea_savedSP(sp) // pop frame
                lwz     r0, LinkageArea_savedPC(sp)
                restore_local_nonvol_regs(sp, 0)
                mtlr    r0
                blr

return_nlr:
                lwz     sp, LinkageArea_savedSP(sp) // pop frame
                lwz     Temp1, LinkageArea_savedPC(sp)
                addi    Temp1, Temp1, non_local_return_offset
                restore_local_nonvol_regs(sp, 0)
                mtlr    Temp1
                blr
                
                
                // compute frame size: add # extra args to base, * oopSize and round to quadword
extra_args:     
                // save outgoing volatiles for frame patching/return trap handling
                la    vol_base, (SaveSelfNonVolRegs_volatile_register_fp_offset * oopSize)(sp) 
                stswi r3,  vol_base,  NumRcvrAndArgRegisters * oopSize // save all vol regs
                
                subi    excess_arg_count, SaveSelfNonVolRegs_arg_count_register, NumRcvrAndArgRegisters
                addi    frame_size, excess_arg_count, base_fr_size + 3 // + 3 for rounding  
                andi.   frame_size, frame_size, 0xfffc// finish rounding
                slwi    frame_size, frame_size, 2 // shift word count to byte count
                neg     frame_size, frame_size // need to decrement SP
                
                mr      caller_sp, sp// will need this for arg copying
                stwux   sp, sp, frame_size // finally! make frame
                
                // now need to copy those excess args
                // setup src and dst regs, need to point to word BEFORE the first word to move
                addi    srcp, caller_sp, LinkageArea_size  +  NumRcvrAndArgRegisters * size_of_gpr  -  size_of_gpr
                addi    dstp,        sp, LinkageArea_size  +  NumRcvrAndArgRegisters * size_of_gpr  -  size_of_gpr
                mtctr   excess_arg_count

do_another:     lwzu    r0, size_of_gpr(srcp)
                stwu    r0, size_of_gpr(dstp)
                bdnz    do_another
                
                b       do_call
                                  

// ------------------------------------------------------
// ContinueNLRFromC
 
// When C code wants to continue an NLR, it calls here
 
// Also need to restore nonvols if encounter a SaveSelfNonVolRegs_returnPC frame

        
# define ret_addr        rcv  // return address
# define interp_flag     arg1 // nlr to interp?
# define self_ic_flag    arg2 // called from Self ic?
        

start_exported_function(ContinueNLRFromC)    // called by VM 
                // pop VM frames
                import_function_address(Temp1, SaveSelfNonVolRegs_returnPC) // get save stub return PC
                 b       skipFirstPop
notFound1:      lwz     sp, LinkageArea_savedSP(sp)     // pop frame
skipFirstPop:   lwz     r0, LinkageArea_savedPC(sp)
                cmpw    r0, Temp1                         // look for savenonvol frame
                bne+    not_saved1
                // At this point sp is sp for SaveNonVol frame
                lwz     Temp2, LinkageArea_savedSP(sp)  // get top of savenonvol frame
                restore_local_nonvol_regs(Temp2, 0)
                
not_saved1:
                cmpw    r0, ret_addr                    // test ret pc
                bne     notFound1

                cmpwi   interp_flag, 0          // interp?
                beq     cont                   // no, goto compiled variant

                import_data_address(Temp1, processSemaphore) // clear sema
                li      r0, 0
                stb     r0, 0(Temp1)

                mtlr    ret_addr
                blr

cont: 
                // now load NLR params from globals

                import_data_address(Temp1, NLRResultFromC)
                lwz     NLRResultReg, 0(Temp1)

                import_data_address(Temp1, NLRHomeIDFromC)
                lwz     NLRHomeIDReg, 0(Temp1)

                import_data_address(Temp1, NLRHomeFromC) // These two only needed if going back to self, just do anyway
                lwz     NLRHomeReg, 0(Temp1)        

                lwz     Temp1, LinkageArea_savedPC(sp) // return
                addi    r0, Temp1, non_local_return_offset
                mtlr    r0 // return thru inline cache

                import_data_address(Temp1, processSemaphore) // clear sema
                li      r0, 0
                stb     r0, 0(Temp1)

                blr
                      
                
// --------------------------------------------------------------
// ContinueAfterReturnTrap

// Note: we can simply restore nonvols by climing the stack,
// only because we are not doing true conversions yet!.
//
// Is above still true? -- dmu 1/03
// Maybe it works OK because of register locators.
                
# define result_arg      arg0 // note: is already in right place
# define pc_arg          arg1
# define sp_arg          arg2


                start_exported_function(ContinueAfterReturnTrap)
                // setup NLR regs
    // pop VM frames
                import_function_address(Temp1, ReturnTrap_returnPC) // get save stub return PC
                b       loop_entry_point1
                
notFound2:      lwz     r0, LinkageArea_savedPC(sp)
                cmpw    r0, Temp1                         // look for savenonvol frame
                bne+    not_saved2
                lwz     Temp2, LinkageArea_savedSP(sp)  // get top of savenonvol frame
                restore_local_nonvol_regs(Temp2, 0)
not_saved2:
                lwz     sp, LinkageArea_savedSP(sp)     // pop frame
loop_entry_point1:                
                cmpw    sp, sp_arg
                bne     notFound2

                import_data_address(Temp1, processSemaphore) // clear sema
                li      r0, 0
                stb     r0, 0(Temp1)
                
                mtlr    pc_arg // goto pc
                blr
                
// --------------------------------------------------------------
// ContinueNLRAfterReturnTrap
                
# undef pc_arg
# define pc_arg          arg0
# undef sp_arg
# define sp_arg          arg1
# undef result_arg
# define result_arg      arg2
# define homeFrame_arg   arg3
# define homeFrameID_arg arg4    

                start_exported_function(ContinueNLRAfterReturnTrap)
                
                // setup NLR regs
                
                mr      Temp1,        pc_arg
                mr      Temp2,        sp_arg
                mr      NLRResultReg, result_arg
                mr      NLRHomeReg,   homeFrame_arg
                mr      NLRHomeIDReg, homeFrameID_arg
                mr      r6, Temp1
                mr      r7, Temp2
                                        // pop VM frames
                import_function_address(Temp1, ReturnTrap_returnPC) // get save stub return PC
                b       loop_entry_point2
                
notFound3:      lwz     r0, LinkageArea_savedPC(sp)
                cmpw    r0, Temp1                         // look for savenonvol frame
                bne+    not_saved3
                lwz     Temp2, LinkageArea_savedSP(sp)  // get top of savenonvol frame
                restore_local_nonvol_regs(Temp2, 0)
not_saved3:
                lwz     sp, LinkageArea_savedSP(sp)     // pop frame
loop_entry_point2:                
                cmpw    sp, r7
                bne     notFound3
                
                                
                import_data_address(Temp1, processSemaphore) // clear sema
                li      r0, 0
                stb     r0, 0(Temp1)
                
                mtlr    r6 // goto pc
                blr
                
// ---------------------------------------------------------
// SaveNVRet

// see comment in runtime.h or interpreter.h
/// Also known to RegisterLocator::update_addresses_from_VM_frame

# define fn   arg5
# define fnNo 5

// frame contains saved nonvols, room for callee to save all r3-r10 possible incoming reg args
 frsize =    LinkageArea_size + ((NumRcvrAndArgRegisters + NumNonVolRegisters) * size_of_gpr) // will be saving all volatile registers + 2 for perform sel & del
 frsize =    round(frsize, alignment_of_sp)// round up to quadword


start_exported_function(SaveNVAndCall5)
        
                mflr    r0 // save link
                stw     r0, LinkageArea_savedPC(sp)
                stw     fn, (LinkageArea_size + (fnNo - arg0No) * size_of_gpr)(sp) // save c entry point
        
                // save nonvol gprs
                stmw    LowestNonVolReg, -(size_of_gpr * NumNonVolRegisters)(sp)
                stwu    sp, -frsize(sp) // make frame
                mtlr    fn // goto fn
                blrl
        
start_exported_function(SaveNVRet) // for stack-walking
                lwz     sp, 0(sp)
                lmw     LowestNonVolReg, -(size_of_gpr * NumNonVolRegisters)(sp)
        
                lwz     r0, LinkageArea_savedPC(sp)
                mtlr    r0
                blr
// --------------------------------------------------------------
// EnterSelf

// copied from CallPrimitiveFromInterpreter

// also need to export  firstSelfFrame_returnPC, firstSelfFrameSendDescEnd


  // oop EnterSelf(oop recv, char* entryPoint, oop arg1)
# define rcv_arg          arg0
# define entry_point_arg  arg1
# define arg1_arg         arg2  

outgoing_arg_count = 2
fr_size          = round(LinkageArea_size  +  (outgoing_arg_count + NumGlobalNonVolRegisters) * size_of_gpr, alignment_of_sp)
                
 
                  
start_exported_function(EnterSelf)
                  
                  // save PC link
                  
                  mflr     r0
                  stw      r0, LinkageArea_savedPC(sp)// save PC link (pc to return to)
                  
                  // save global nonvols for C
                  subi     Temp1, sp, NumGlobalNonVolRegisters * size_of_gpr
                  stswi    LowestNonVolReg, Temp1, NumGlobalNonVolRegisters * size_of_gpr
                  load_global_nonvol_regs
                 
                  stwu    sp, -fr_size(sp)
                  
                  
                  // call Self
                   
                  mtlr entry_point_arg
                  // dont need to move rcv
                  mr   arg1, arg1_arg
                  
                  // Inline cache format: DUPLICATED in SendDesc, ReturnTrap
                  blrl    // go!
                  
                  // inline cache
start_exported_function(firstSelfFrame_returnPC)
                  b    send_desc_end               
                  .long 0                       // reg mask
                  b    contNLR
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for selector
                  .long 20                      // placeholder for StaticNormalLookupType
                                  
start_exported_function(firstSelfFrameSendDescEnd)
send_desc_end:
                  lwz     sp,LinkageArea_savedSP(sp)
                  // restore global nonvols for C
                  subi    Temp1, sp, NumGlobalNonVolRegisters * size_of_gpr
                  lswi    LowestNonVolReg, Temp1, NumGlobalNonVolRegisters * size_of_gpr
                  lwz     r0,LinkageArea_savedPC(sp)
                  mtlr    r0
                  blr

//        continue with NLR: prepare to call capture_NLR_parameters_from_registers with NLR reg params

contNLR:          import_function_address(Temp1, capture_NLR_parameters_from_registers)
                  mtlr    Temp1
                  
                  // don't need this because they are already in the right registers!
                  //mr      arg0, NLRResultReg
                  //mr      arg1, NLRHomeReg
                  //mr      arg2, NLRHomeIDReg
                  blrl
                  
                  // and back to caller (which is C code)
                  b      send_desc_end // restore stack & regs
                  
// ====================================================================

 
// SendMessage_stub: called from inline caches and prologue, post call, pre frame
// NonVols:
//   This routine goes via SaveSelfNonVolRegs because it calls out to C and C
//   may traverse the stack. This creates a coupling to RegisterLocator::update_addresses_from_VM_frame.
//   If that routine finds a frame for this stub, it can assume that all nonvols are stored
//   below its sp.
 
 
 num_outgoing_args = 6 // I pass 6 args to C (SendMessage) so need to leave that much stack space
    
// I save args for the send here (DUPLICATED in runtime.h)
 SendMessage_stub_volatile_register_sp_offset = LinkageArea_size/oopSize + num_outgoing_args
 
// will be saving all volatile registers + 2 for perform sel & del
 frsize  = (SendMessage_stub_volatile_register_sp_offset + NumRcvrAndArgRegisters + 2 + NumLocalNonVolRegisters) * oopSize

 frsize = round(frsize, alignment_of_sp)    // round up to quadword
   
                               
                start_exported_function(SendMessage_stub)
                 // save link
                 mflr    r0
                 stw     r0, LinkageArea_savedPC(sp)
                 save_local_nonvol_regs
   
                 stwu sp, -frsize(sp)  // create frame
                 
                 // save volatile regs
                 la    Temp1, (SendMessage_stub_volatile_register_sp_offset * oopSize)(sp)
                 stswi r3, Temp1, NumRcvrAndArgRegisters * oopSize 
                 
                 // setup args for SendMessage
                 
                 // NOTE: next few carefully ordered to avoid aliasing and destroying values
                 // and number of them must agree with no_outgoing_args above

                 mr     r8, r4// arg1
                 lwz    r7, frsize + PerformDelegateeLoc_sp_offset (sp)// these offsets are relative to sp when stub was entered
                 lwz    r6, frsize + PerformSelectorLoc_sp_offset (sp)// 
                 mr     r5, r3// receiver    // destroys arg2 but we dont need arg2             
                 la     r4, frsize(sp)//  lookup frame
                 mflr   r3// // REUSING LINK VALUE for sendDesc arg
                 
                 import_function_address(Temp1, SendMessage)
                 mtlr   Temp1
                 blrl
                 
                 // returns entry point, use count register so orig link can be in link reg
                 
start_exported_function(SendMessage_stub_returnPC) // for stack-walking
                 mtctr  result
                 
                 // now restore everything:
                 // first vol regs
                 la    Temp1, (SendMessage_stub_volatile_register_sp_offset * oopSize)(sp)
                 lswi  r3, Temp1, NumRcvrAndArgRegisters * oopSize
                 
                 la    sp, frsize(sp)//  restore sp
                 restore_local_nonvol_regs(sp, 0)
                 lwz  r0, LinkageArea_savedPC(sp)//  restore link
                 mtlr  r0
                 
                 bctr//  branch to counter reg
                 
// ======================================================================================                   

 
// SendDIMessage_stub: called from inline caches and prologue, post call, pre frame
// NonVols:
//   This routine goes via SaveSelfNonVolRegs because it calls out to C and C
//   may traverse the stack. This creates a coupling to RegisterLocator::update_addresses_from_VM_frame.
//   If that routine finds a frame for this stub, it can assume that all nonvols are stored
//   below its sp.
 
// To make the profiler work we save the link register in the stack frame. -- dmu 2/04
 
 num_outgoing_args = 6 // I pass 6 args to C (SendDIMessage) so need to leave that much stack space
    
// I save args for the send here (DUPLICATED in runtime.h)
 SendDIMessage_stub_volatile_register_sp_offset = LinkageArea_size/oopSize + num_outgoing_args
 
 frsize = (SendDIMessage_stub_volatile_register_sp_offset + NumRcvrAndArgRegisters + 2 + NumLocalNonVolRegisters) * oopSize // will be saving all volatile registers + 2 for perform sel & del
 frsize = round(frsize, alignment_of_sp)    // round up to quadword
   
start_exported_function(SendDIMessage_stub)
                
                 // // (Note caller's link is passed in in DILinkReg)
                 save_local_nonvol_regs
                 
                 // // save PC of caller in his stack frame so that profiler can set last_frame to one above
                 // // interrupted context's sp. One stwu below sets sp, profiler will count on  LinkageArea_savedPC(sp) -- dmu 2/04
                 mflr    r0
                 stw     r0, LinkageArea_savedPC(sp)
                 
                 stwu sp, -frsize(sp)  // create frame
                 
                 // // save volatile regs
                 la    DITempReg, (SendDIMessage_stub_volatile_register_sp_offset * oopSize)(sp)
                 stswi r3, DITempReg, NumRcvrAndArgRegisters * oopSize
                 
                 // setup args for SendDIMessage
                 
                 // NOTE: next few carefully ordered to avoid aliasing and destroying values
                 // and number of them must agree with no_outgoing_args above

                 mr     r8, r4// arg1
                 mr     r7, r3// rcvr
                 mr     r6, DICountReg// r0
                 mr     r5, DILinkReg// points right to the nmln and after the call
                 la     r4, frsize(sp)//  lookup frame
                 mflr   r3  // send desc: use caller's link
                 stw    r3, LinkageArea_savedPC + frsize(sp)// and save link for stack crawling
                 
                 //  ahh... through with DI*Reg's
               
                 import_function_address(Temp1, SendDIMessage)
                 mtlr   Temp1
                 blrl
                 
                 // returns entry point, use count register so orig link can be in link reg
                 
start_exported_function(SendDIMessage_stub_returnPC) // for stack-walking
                 mtctr  result
                 
                 // now restore everything:
                 // first vol regs
                 la    Temp1, (SendDIMessage_stub_volatile_register_sp_offset * oopSize)(sp)
                 lswi  r3, Temp1, NumRcvrAndArgRegisters * oopSize
                 
                 la    sp, frsize(sp)//  restore sp
                 restore_local_nonvol_regs(sp, 0)
                 lwz   r0, LinkageArea_savedPC(sp)//  restore link
                 mtlr  r0
                 
                 bctr//  branch to counter reg
                 
// ======================================================================================                   




// MakeOld_stub
// called when a young nmethod''s counter overflows.
// called by a count stub.

// The bit with might need _Perform selector...
// What if a method being called when MakeOld/Recompile is called
// is being _Performed? Might need to save these two. -- dmu 2/03

 num_outgoing_args = 5 // I pass 5 args to C (MakeOld) so need to leave that much stack space
    
 MakeOld_stub_volatile_register_sp_offset = LinkageArea_size/oopSize + num_outgoing_args
 
 frsize  = (MakeOld_stub_volatile_register_sp_offset + NumRcvrAndArgRegisters + NumLocalNonVolRegisters + 2 /* might need _Perform selector & del */) * oopSize

 frsize = round(frsize, alignment_of_sp)    // round up to quadword

start_exported_function(MakeOld_stub)
                 // // (Note caller's link is passed in in RecompileLinkReg)
                 save_local_nonvol_regs
                 stwu sp, -frsize(sp)  // create frame (link reg was already saved in CountCodePattern::initComparing())
                 
                 // save volatile regs
                 la    RecompileTempReg, (MakeOld_stub_volatile_register_sp_offset * oopSize)(sp)
                 stswi r3, RecompileTempReg, NumRcvrAndArgRegisters * oopSize
                 
                 // setup args for MakeOld
                 
                 mr     r7, RecompileLinkReg // nmethod/stub calling us
                 li     r6, 0                // no DI
                 mr     r5, r3               // receiver
                 la     r4, frsize(sp)       // lookup frame
                 mflr   r3                   // send desc: use caller''s link
                 stw    r3, LinkageArea_savedPC + frsize(sp)// and save link for stack crawling
                 
                 // will be calling MakeOld, but save non vols on the way
                 import_function_address(Temp1, MakeOld)
                 mtlr   Temp1
                 blrl
                 
                 // returns entry point, use count register so orig link can be in link reg
  
start_exported_function(MakeOld_stub_returnPC) // for stack-walking
                 mtctr  result
  
                 // now restore everything:
                 // first vol regs
                 la    Temp1, (MakeOld_stub_volatile_register_sp_offset * oopSize)(sp)
                 lswi  r3, Temp1, NumRcvrAndArgRegisters * oopSize
                 
                 la    sp, frsize(sp)//  restore sp
                 restore_local_nonvol_regs(sp, 0)
                 lwz   r0, LinkageArea_savedPC(sp)//  restore link
                 mtlr  r0
  
                 bctr//  branch to counter reg

  
// ======================================================================================  



// ReturnTrap: return pointer is patched to me. I save registers and
// call HandleReturnTrap. Must look like an inline cache.
// Well, actually this may not be strictly necessary, but it guards
// against misusing the ret pc.

// Also for PPC, PrimCallReturnTrap is the same


HandleReturnTrap_arg_count = 5

frsize = (LinkageArea_size/oopSize + HandleReturnTrap_arg_count + NumLocalNonVolRegisters) * oopSize
// DUPLICATED in frame_format_ppc.hh
ReturnTrap_frame_size = round(frsize, alignment_of_sp)

start_exported_function(ReturnTrap_start)

                  .long 0                       // placeholder for call instruction
start_exported_function(ReturnTrap)
start_exported_function(PrimCallReturnTrap)          
                  b    rt2               
                  .long 0                       // reg mask
                  b    ReturnTrap_beyond_for_NLR
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for selector
                  .long 0                       // placeholder for lookup type
                  .long 0                       // placeholder for delegatee

start_exported_function(ReturnTrap2)  
rt2:                     
                 // result already in r3
                 mr     arg1, sp
                 li     arg2, 0 // not NLR
                 li     arg3, 0 
                 li     arg4, 0
                 
ReturnTrap_do_call:          
                 save_local_nonvol_regs
                 // (link must already be saved since this is a return trap -- dmu 2/04)
                 stwu   sp, -ReturnTrap_frame_size(sp)
                 
                 import_function_address(Temp1, HandleReturnTrap)
                 mtlr   Temp1
                 blrl
                 
start_exported_function(ReturnTrap_returnPC)
start_exported_function(ReturnTrapNLR_returnPC) // SPARC needs both, same for PPC
                 .long   0 // no return
                 
ReturnTrap_beyond_for_NLR: 
                 // WARNING: carefully ordered to avoid clobbering values
                 mr     r7, NLRHomeIDReg
                 mr     r6, NLRHomeReg
                 li     r5, 1 //  NLR
                 mr     r4, sp
                 // result already in r3 WARNING: assumes NLRResultReg = r3
                
                 b      ReturnTrap_do_call
 
// ======================================================================================  



// ProfilerTrap: return pointer is patched to me. I save registers and
// call HandleProfilerTrap. Must look like an inline cache.
// Well, actually this may not be strictly necessary, but it guards
// against misusing the ret pc.



HandleProfilerTrap_arg_count = 1

ProfilerTrap_volatile_register_sp_offset = LinkageArea_size/oopSize + HandleProfilerTrap_arg_count


numVolRegsToSave = HandleProfilerTrap_arg_count // could someday be NumNLRRegisters


frsize = (ProfilerTrap_volatile_register_sp_offset + numVolRegsToSave + HandleProfilerTrap_arg_count + NumLocalNonVolRegisters) * oopSize
// DUPLICATED in frame_format_ppc.hh
ProfilerTrap_frame_size = round(frsize, alignment_of_sp)

start_exported_function(ProfilerTrap_start)

                  .long 0                       // placeholder for call instruction
start_exported_function(ProfilerTrap)
                  b    pf2               
                  .long 0                       // reg mask
                  b    returnProfilerNLR
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for selector
                  .long 0                       // placeholder for lookup type
                  .long 0                       // placeholder for delegatee

pf2:                     
                 lwz   Temp2, current_pc_offset(sp)//  get return address

                 save_local_nonvol_regs
                 stwu   sp, -ProfilerTrap_frame_size(sp)

                 // (link must already be saved since this is a return trap -- dmu 2/04)
                 
                 // save NLR (volatile) regs
                 la Temp1, (ProfilerTrap_volatile_register_sp_offset * oopSize)(sp)
                 stswi arg0 /* also normal result reg */,Temp1,  numVolRegsToSave * oopSize
                 mr    arg0, Temp2
                 
                 import_function_address(Temp1, HandleProfilerTrap)
                 mtlr   Temp1
                 blrl
                 
                 mr    Temp2, result                 
                 la    Temp1, (ProfilerTrap_volatile_register_sp_offset * oopSize)(sp)
                 lswi  arg0 /* also normal result reg */, Temp1, numVolRegsToSave * oopSize
                 
                 la    sp, ProfilerTrap_frame_size(sp)
                 restore_local_nonvol_regs(sp, 0)
                 mtlr  Temp2
                 blr
                 
returnProfilerNLR:
// just continue NLR                 
                lwz   Temp1, current_pc_offset(sp)//  get return address
                addi  Temp1, Temp1, non_local_return_offset
                mtlr  Temp1
                blr

// ==============================


/* Doesn't seem to work// use Carbonosity instead

start_exported_function(FlushInstruction)
      icbi 0, r3
      isync
      blr
*/

// =========================================

// implement write system call lib routine

/*
start_exported_function(WRITE)
  li r0, 4
   sc
  blr
  blr
*/


//// warning: following code is untested// it is modelled after SendDIMessage_stub

// ====================================================================
// Recompile_stub: called when a normal method''s counter overflows.  called by a 
// NIC nmethod or PIC.  caller must store its link register (which contains the
// sendDesc) into Temp2 AND save it on the frame.  it must then jump AND link to us, 
// so that the link register contains the nmethod/stub.  see CodeGen::checkRecompilation.
// it's ugly but i couldn't find a better way.    -mabdelmalek 12/02
// see comment on SendMessage_stub on why we save the non-volatile registers
 
 num_outgoing_args = 5 // I pass 5 args to C (Recompile) so need to leave that much stack space
    
 Recompile_stub_volatile_register_sp_offset = LinkageArea_size/oopSize + num_outgoing_args
 
 frsize  = (Recompile_stub_volatile_register_sp_offset + NumRcvrAndArgRegisters + NumLocalNonVolRegisters + 2 /* might need _Perform selector & del */) * oopSize

 frsize = round(frsize, alignment_of_sp)    // round up to quadword
  
                               
start_exported_function(Recompile_stub)
                 // // (Note caller's link is passed in in RecompileLinkReg)
  
                 save_local_nonvol_regs
                 
                 // link already saved (for profiler, see comment above)

                 stwu sp, -frsize(sp)  // create frame
                 
                 // save volatile regs
                 la    RecompileTempReg, (Recompile_stub_volatile_register_sp_offset * oopSize)(sp)
                 stswi r3, RecompileTempReg, NumRcvrAndArgRegisters * oopSize
                 
                 // setup args for Recompile
                 
                 mr     r7, RecompileLinkReg // nmethod/stub calling us
                 li     r6, 0                // no DI
                 mr     r5, r3               // receiver
                 la     r4, frsize(sp)       // lookup frame
                 mflr   r3                   // send desc: use caller''s link
                 stw    r3, LinkageArea_savedPC + frsize(sp)// and save link for stack crawling
                 
                 // will be calling Recompile, but save non vols on the way
                 import_function_address(Temp1, Recompile)
                 mtlr   Temp1
                 blrl
                 
                 // returns entry point, use count register so orig link can be in link reg
                 
start_exported_function(Recompile_stub_returnPC) // for stack-walking
                 mtctr  result
                 
                 // now restore everything:
                 // first vol regs
                 la    Temp1, (Recompile_stub_volatile_register_sp_offset * oopSize)(sp)
                 lswi  r3, Temp1, NumRcvrAndArgRegisters * oopSize
                 
                 la    sp, frsize(sp)//  restore sp
                 lwz   r0, LinkageArea_savedPC(sp)//  restore link
                 restore_local_nonvol_regs(sp, 0)
                 mtlr  r0
                 
                 bctr//  branch to counter reg
                 
                 
                                  
start_exported_function(swap_bytes)
  lwz    r4, 0(r3)
  stwbrx r4, 0, r3
  blr

# endif // TARGET_ARCH == PPC_ARCH
