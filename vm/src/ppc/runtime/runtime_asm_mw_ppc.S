# if defined(__ppc__) || defined(__powerpc__)
# if 0
# skip when compiling with gcc
; // Sun-$Revision: 30.11 $


 ; Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
 ;   See the LICENSE file for license information.

; This file is obsolete as of 1/03.
; I have changed the gcc assember version and not kept this up.
; -- dmu 1/03


 ; Written for the MPW assembler

# cannot use regular includes, does not use cpp

 include 'asmDefs_mw_ppc.hh'
        
  start_exported_func currentFrame
 mr     r3,sp
 blr
 
  start_exported_func currentRTOC
 mr     r3,RTOC
 blr


 start_exported_func currentReturnAddr
 lwz    r3,LinkageArea.savedPC(sp)
 blr

 start_exported_func set_SPLimitReg
 mr   SPLimitReg, r3 ; relies on C not using this register (ugh)
 blr
 
 start_exported_func save1Arg
 ; save arg1 in stack frame
 stw    r3, LinkageArea.size(sp) ; arg area is right after linkage area
 blr

  ;-----------------------------------------------------------------
                
savedFPR        record
                ds.b    size_of_fpr
                endr
                
allNVFPRs       record  0,decr
base            set     *
sf31            ds      savedFPR
sf30            ds      savedFPR
sf29            ds      savedFPR
sf28            ds      savedFPR
sf27            ds      savedFPR
sf26            ds      savedFPR
sf25            ds      savedFPR
sf24            ds      savedFPR
sf23            ds      savedFPR
sf22            ds      savedFPR
sf21            ds      savedFPR
sf20            ds      savedFPR
sf19            ds      savedFPR
sf18            ds      savedFPR
sf17            ds      savedFPR
sf16            ds      savedFPR
sf15            ds      savedFPR
sf14            ds      savedFPR
                endr

                
 ; local def            


  
 ;  1. make new stack frame & save all registers in it
 ;  2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1]
 ;  3. if (!init)        restore fp, return addr from calleeSaveAddr[0], [1]
 ;                        clear semaphore, restore regs & return to return addr
 ;  4 else                setup new stack fp,sp starting at calleeSaveAddr[0]
 ;                        (ensure trap if return past top)
 ;                        clear semaphore, jump to calleeSaveAddr[1]

locals_for_sf   record
                endr
                

FrameTop        record  0,decr ; downwards to align more easily
                ; assume qw alignment
fprs            ds      allNVFPRs
                align   4 ; for stm
gprs            ds.l    HighestNonVolReg - LowestNonVolReg + 1
lcls            ds      locals_for_sf
size            equ     *
                endr
                
                
Frame           record
                ; assume qw alignment
bot             ds      LinkageArea
                ds.b    FrameTop
                align   4
top             equ     *
size            equ     *
                endr

 
 ; process switch primitive
 ; NOTE ASSUMES switching within same code segment:
 ; in other words, although I save and restore the RTOC, I
 ; do not set the new RTOC.
 ;   void  SetSPAndCall( char** callerSaveAddr, char** calleeSaveAddr,
 ;                      bool init, bool* semaphore); (bool == char)

        import_func ReturnOffTopOfProcess, rtop

  
callerSaveAddr  set r3
calleeSaveAddr  set r4
init            set r5
semaphore       set r6
fp              set r7
link            set r8

        
saveAddr        record
saSP            ds.l 1
saPC            ds.l 1
                endr

  start_exported_func SetSPAndCall
  
  ; next bit inspired by MPW PPC ASM manual, pg 1-6
  ; must save/restore nonvol regs: R13 and up, FR14 and up, and parts of CR
  ; if asserts, should also zero out all others, incl ctr (count), xer, fp execption,
  ;  fpscr fp status & control reg
  
  
 ; first make new stack frame & save all registers in it

        mflr    link
        stw     link,LinkageArea.savedPC(SP)
        mfcr    r0
        stw     r0,LinkageArea.savedCR(SP)
        mr      fp,sp
        stwu    SP,LinkageArea.savedSP-Frame.size(SP)
        
 ;  2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1]
        
        cmpwi   callerSaveAddr, 0
        beq     noSave
        stw     sp,saveAddr.saSP(callerSaveAddr)
        stw     link,saveAddr.saPC(callerSaveAddr)
noSave: 
        
        with    frameTop,fprs
        stfd    f31,sf31(fp)
        stfd    f30,sf30(fp)
        stfd    f29,sf29(fp)
        stfd    f28,sf28(fp)
        stfd    f27,sf27(fp)
        stfd    f26,sf26(fp)
        stfd    f25,sf25(fp)
        stfd    f24,sf24(fp)
        stfd    f23,sf23(fp)
        stfd    f22,sf22(fp)
        stfd    f21,sf21(fp)
        stfd    f20,sf20(fp)
        stfd    f19,sf19(fp)
        stfd    f18,sf18(fp)
        stfd    f17,sf17(fp)
        stfd    f16,sf16(fp)
        stfd    f15,sf15(fp)
        stfd    f14,sf14(fp)
        
        endwith
        endwith
        
        stmw    LowestNonVolReg,frameTop.gprs(fp)
        
        stw     RTOC,LinkageArea.savedRTOC(sp)

        
 ;  3. if (!init)        restore fp, return addr from calleeSaveAddr[0], [1]
 ;                        clear semaphore, restore regs & return to return addr
        
        lwz     sp,saveAddr.saSP(calleeSaveAddr)
        lwz     r0,saveAddr.saPC(calleeSaveAddr)
        mtlr    r0

        li      r0,0
        stb     r0,0(semaphore)

        cmpwi   init, 0
        bne     firstTimeThisProcess

        lwz     fp,LinkageArea.savedSP(sp)
        
        lwz     r0,LinkageArea.savedCR(fp)
        mtcr    r0
        ; lwz   RTOC,LinkageArea.savedRTOC(sp)
        
        lmw     LowestNonVolReg,frameTop.gprs(fp)
                
        with    frameTop,fprs
        lfd     f31,sf31(fp)
        lfd     f30,sf30(fp)
        lfd     f29,sf29(fp)
        lfd     f28,sf28(fp)
        lfd     f27,sf27(fp)
        lfd     f26,sf26(fp)
        lfd     f25,sf25(fp)
        lfd     f24,sf24(fp)
        lfd     f23,sf23(fp)
        lfd     f22,sf22(fp)
        lfd     f21,sf21(fp)
        lfd     f20,sf20(fp)
        lfd     f19,sf19(fp)
        lfd     f18,sf18(fp)
        lfd     f17,sf17(fp)
        lfd     f16,sf16(fp)
        lfd     f15,sf15(fp)
        lfd     f14,sf14(fp)
        
        endwith
        endwith
        
        mr      sp,fp
        
        if GENERATE_DEBUGGING_AIDS
        
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
        
        endif
                
        blr
        nop ; just in case the linker messes  us up
        
 ;  4 else                setup new stack fp,sp starting at calleeSaveAddr[0]
 ;                        (ensure trap if return past top)
 ;                        clear semaphore, jump to calleeSaveAddr[1]

FirstFrame      record
                ; assume qw alignment
bot             ds      LinkageArea
                align   4
top             equ     *
size            equ     *
                endr

firstTimeThisProcess:
        li      r0,15
        andc    sp,sp,r0 ;; align by 16
        li      r0, 0
        stwu    r0,LinkageArea.savedSP-FirstFrame.size(sp)      ;; decr & store null sp
        lwz     r3,rtop(RTOC)
        lwz     r3,0(r3)
        stw     r3,LinkageArea.savedPC(sp)
        
        if GENERATE_DEBUGGING_AIDS
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
        
        endif
        
        blrl
        lwz     r0,LinkageArea.savedPC(sp)
        mtlr    r0
        lwz     sp,LinkageArea.savedSP(sp)
        blr
        
; =============================================
; SwitchStack0 switches back toVm stack with 0 arguments
;; Actually it passes 4 args, so it can be reused to inplement the others
        
        
        
newPC   set r3
lastSP  set r4
a1      set r5
a2      set r6
a3      set r7
a4      set r8

SwSFrame        record
                ; assume qw alignment
bot             ds      LinkageArea
argsave         ds.l    4 ; space for callee to save args
                align   4
top             equ     *
size            equ     *
                endr


  start_exported_func SwitchStack0
  
        mflr    r0
        stw     r0, LinkageArea.savedPC(sp)
        mr      r0, sp
        la      sp, -SwSFrame.size(lastSP) ; set sp
        stw     r0, LinkageArea.savedSP(sp)

        mtlr    newPC
        
        mr      r3, a1
        mr      r4, a2
        mr      r5, a3
        mr      r6, a4
        
        blrl
        
        lwz     sp, LinkageArea.savedSP(sp)
        lwz     r0, LinkageArea.savedPC(sp)
        mtlr    r0
        blr     


  start_exported_func SwitchStack1
        b .SwitchStack0[pr]


  start_exported_func SwitchStack2
        b .SwitchStack0[pr]

  start_exported_func SwitchStack3
        b .SwitchStack0[pr]

  start_exported_func SwitchStack4
        b .SwitchStack0[pr]
        
        
; ===========================================

; CallPrimitiveFromInterpreter
        
        
  ; called with entry point, rcv, argp, arg_count
  

CPFIFrame       record
                ; assume qw alignment
bot             ds      LinkageArea
argsave         ds.l    4 ; space for callee to save args
                align   4
regsave         ds.l    4 ; 4 words to preserve alignment
top             equ     *
size            equ     *
                endr
                
reg_save_len    equ 16
linkage_len     equ 12

entry_pt_a      set r3
rcv_a           set r4
argp_a          set r5
arg_count_a     set r6
scr_a           set r7

argp            set r31
arg_count       set r30
scr_b           set r29

  start_exported_func CallPrimitiveFromInterpreter
  
        mflr    r0
        stw     r0,LinkageArea.savedPC(sp) ; save link
        
        stmw    r28,-reg_save_len(sp) ; save 4 nonvol regs
        
        slwi    scr_a, arg_count_a, 2 ; words to bytes
        sub     scr_a,  sp, scr_a       ; scr_a now has sp - arg length
        addi    scr_a, scr_a, -(LinkageArea.size + reg_save_len) ; and - linkage_len - reg_save_len
        li      r0, 15
        andc    scr_a, scr_a, r0  ; round down
        stw     sp,0(scr_a)
        mr      sp, scr_a ; setup sp for new frame
        
        mtlr    entry_pt_a
        mr      r3, rcv_a
        mr      argp, argp_a
        mr      arg_count, arg_count_a
        
        addi    r0, arg_count, 1
        mtctr   r0
        
        ; redo to use lswx someday:
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
        la      scr_b, LinkageArea.size-oopSize(sp) ; put start of args in frame in scr_b
        bdz     endRegMem
        
regMemLoop:     lwzu    r0,oopSize(argp)
                stwu    r0,oopSize(scr_b)
                bdnz    regMemLoop
                
endRegMem:      
                stw     RTOC,LinkageArea.savedRTOC(sp)
                blrl    ; go!
                lwz     RTOC,LinkageArea.savedRTOC(sp) ; reload, although others do not
                lwz     sp,LinkageArea.savedSP(sp)
                lmw     r28,-reg_save_len(sp) ; restore nonvol gprs
                lwz     r0,LinkageArea.savedPC(sp)
                mtlr    r0
                blr

 ; ---------------------------------------------------------
 ; SaveSelfNonVolRegs

 ; Problem: VM needs to walk stack to find all oops to do GC etc.
 ; But callee-saved regs are saved wherever.
 ; Solution: when Self calls a C-routine that might walk the stack,
 ; go through me. Pass args the usual way, pass fn entry point in R11 (Temp1) and
 ; pass # of args (including receiver) in R12.
 
 
entry_point: set Temp1
arg_count:   set Temp2
excess_arg_count: set R31
frame_size   set R30
caller_sp    set R29
srcp         set R28
dstp         set R27

 ; frame contains saved nonvols, room for callee to save all r3-r10 possible incoming reg args
                ; frame includes all nonvols, all arg regs (for C to save into me) + space for mem args
                
 ; duplicated in SaveSelfNonVolRegs_frame_size
 base_fr_size:   set LinkageArea.size / size_of_gpr + NumRcvrAndArgRegisters + NumLocalNonVolRegisters; 


                export SaveSelfNonVolRegs_returnPC ; for stack-walking
                
                import_data byte_map_base, byte_map_base_RTOC_offset
                import_data SPLimit, SPLimit_RTOC_offset
                
                MACRO
                load_global_nonvol_regs
                lwz     ByteMapBaseReg, byte_map_base_RTOC_offset(RTOC)
                lwz     SPLimitReg,     SPLimit_RTOC_offset(RTOC)
                lwz     ByteMapBaseReg, 0(ByteMapBaseReg)
                lwz     SPLimitReg,     0(SPLimitReg)
                ENDM

                
                MACRO   ; need to reuse the load sequence, so macrofy it
                restore_nonvol_regs &base, &disp
                lmw     LowestLocalNonVolReg, (&disp -(size_of_gpr * NumLocalNonVolRegisters))(&base)
                ENDM
                
                start_exported_func     SaveSelfNonVolRegs
        
SaveSelfNonVolRegs_start:
                mflr    r0 ; save link
                stmw    LowestLocalNonVolReg, -(size_of_gpr * NumLocalNonVolRegisters)(sp)
                stw     r0, LinkageArea.savedPC(sp)
               
                ; which case?
                cmpwi   arg_count, NumRcvrAndArgRegisters
                bgt     extra_args;  have at least 1 extra
                
                ; common case: no extra args
                stwu    SP, -(((base_fr_size + 3) & ~3) * size_of_gpr) (SP); DUPLICATED in lmw below and in ContinueNLRFromC above
                
do_call:        mtlr    entry_point
                blrl
SaveSelfNonVolRegs_returnPC:
                b       @return_normally
                dc.l    0 ; mask
                b       @return_nlr
                dc.l    0 ; nmln, not sure if needed
                dc.l    0 ; ditto
                
                ; unwind stack and return
                
@return_normally:
                lwz     SP, LinkageArea.savedSP(SP) ; pop frame
                lwz     R0, LinkageArea.savedPC(SP)
                restore_nonvol_regs SP, 0
                mtlr    R0
                blr

@return_nlr:
                lwz     SP, LinkageArea.savedSP(SP) ; pop frame
                lwz     Temp1, LinkageARea.savedPC(SP)
                addi    Temp1, Temp1, non_local_return_offset
                restore_nonvol_regs SP, 0
                mtlr    Temp1
                blr
                
                                
                
                ; compute frame size: add # extra args to base, * oopSize and round to quadword
extra_args:     
                subi    excess_arg_count, arg_count, NumRcvrAndArgRegisters
                addi    frame_size, excess_arg_count, base_fr_size + 3 ; + 3 for rounding  
                andi.   frame_size, frame_size, 0xfffc; finish rounding
                slwi    frame_size, frame_size, 2 ; shift word count to byte count
                neg     frame_size, frame_size ; need to decrement SP
                
                mr      caller_sp, SP; will need this for arg copying
                stwux   SP, SP, frame_size ; finally! make frame
                
                ; now need to copy those excess args
                ; setup src and dst regs, need to point to word BEFORE the first word to move
                addi    srcp, caller_sp, LinkageArea.size  +  NumRcvrAndArgRegisters * size_of_gpr  -  size_of_gpr
                addi    dstp,        SP, LinkageArea.size  +  NumRcvrAndArgRegisters * size_of_gpr  -  size_of_gpr
                mtctr   excess_arg_count

@do_another:    lwzu    R0, size_of_gpr(srcp)
                stwu    R0, size_of_gpr(dstp)
                bdnz    @do_another
                
                b       do_call
                                  

 ; ------------------------------------------------------
 ; ContinueNLRFromC
 
 ; When C code wants to continue an NLR, it calls here
 
 ; Also need to restore nonvols if encounter a SaveSelfNonVolRegs_returnPC frame

        import_data     processSemaphore, procSem
        import_data     NLRResultFromC, resFromC
        import_data     NLRHomeIDFromC, homeIDFromC
        import_data     NLRHomeFromC,   homeFromC
        import_data     SaveSelfNonVolRegs_returnPC, save_retPC
        
ret_addr        set rcv ; return address
interp_flag     set arg1 ; nlr to interp?
self_ic_flag    set arg2 ; called from Self ic?
        
        start_exported_func ContinueNLRFromC    ; called by VM 

                                        ; pop VM frames
                lwz     Temp1, save_retPC(RTOC); get save stub return PC
                b       @skipFirstPop
@notFound:      lwz     sp, LinkageArea.savedSP(sp)     ; pop frame
@skipFirstPop:  lwz     r0, LinkageArea.savedPC(sp)
                cmpw    r0, Temp1                         ; look for savenonvol frame
                bne+    @not_saved
                lwz     Temp2, LinkageArea.savedSP(sp)  ; get top of savenonvol frame
                restore_nonvol_regs Temp2, 0
                
@not_saved:
                cmpw    r0, ret_addr                    ; test ret pc
                bne     @notFound

        cmpwi   interp_flag, 0          ; interp?
        beq     @cont                   ; no, goto compiled variant
        
        lwz     Temp1, procSem(RTOC) ; clear sema
        li      r0, 0
        stb     r0, 0(Temp1)
        
        mtlr    ret_addr
        blr
                
@cont: 
        ; now load NLR params from globals
        
        lwz     Temp1, resFromC(RTOC)
        lwz     NLRResultReg, 0(Temp1)
        
        lwz     Temp1, homeIDFromC(RTOC)
        lwz     NLRHomeIDReg, 0(Temp1)
        
        lwz     Temp1, homeFromC(RTOC); These two only needed if going back to self, just do anyway
        lwz     NLRHomeReg, 0(Temp1)        
        
        lwz     Temp1, LinkageArea.savedPC(sp) ; return
        addi    r0, Temp1, non_local_return_offset
        mtlr    r0 ; return thru inline cache
        
        lwz     Temp1, procSem(RTOC) ; clear sema
        li      r0, 0
        stb     r0, 0(Temp1)

        blr
                
                
; --------------------------------------------------------------
; ContinueAfterReturnTrap

; Note: we can simply restore nonvols by climing the stack,
; only because we are not doing true conversions yet!.
                
result_arg      set     arg0 ; note: is already in right place
pc_arg          set     arg1
sp_arg          set     arg2

                start_exported_func     ContinueAfterReturnTrap
                
                ; setup NLR regs
                
                                        ; pop VM frames
                lwz     Temp1, save_retPC(RTOC); get save stub return PC
                b       @loop_entry_point
                
@notFound:      lwz     r0, LinkageArea.savedPC(sp)
                cmpw    r0, Temp1                         ; look for savenonvol frame
                bne+    @not_saved
                lwz     Temp2, LinkageArea.savedSP(sp)  ; get top of savenonvol frame
                restore_nonvol_regs Temp2, 0
@not_saved:
                lwz     sp, LinkageArea.savedSP(sp)     ; pop frame
@loop_entry_point:                
                cmpw    sp, sp_arg
                bne     @notFound
                
                                
                lwz     Temp1, procSem(RTOC) ; clear sema
                li      r0, 0
                stb     r0, 0(Temp1)
                
                mtlr    pc_arg ; goto pc
                blr
                
; --------------------------------------------------------------
; ContinueNLRAfterReturnTrap
                
pc_arg          set     arg0
sp_arg          set     arg1
result_arg      set     arg2
homeFrame_arg   set     arg3
homeFrameID_arg set     arg4    

                start_exported_func     ContinueNLRAfterReturnTrap
                
                ; setup NLR regs
                
                mr      Temp1,        pc_arg
                mr      Temp2,        sp_arg
                mr      NLRResultReg, result_arg
                mr      NLRHomeReg,   homeFrame_arg
                mr      NLRHomeIDReg, homeFrameID_arg
                mr      R6, Temp1
                mr      R7, Temp2
                                        ; pop VM frames
                lwz     Temp1, save_retPC(RTOC); get save stub return PC
                b       @loop_entry_point
                
@notFound:      lwz     r0, LinkageArea.savedPC(sp)
                cmpw    r0, Temp1                         ; look for savenonvol frame
                bne+    @not_saved
                lwz     Temp2, LinkageArea.savedSP(sp)  ; get top of savenonvol frame
                restore_nonvol_regs Temp2, 0
@not_saved:
                lwz     sp, LinkageArea.savedSP(sp)     ; pop frame
@loop_entry_point:                
                cmpw    sp, R7
                bne     @notFound
                
                                
                lwz     Temp1, procSem(RTOC) ; clear sema
                li      r0, 0
                stb     r0, 0(Temp1)
                
                mtlr    R6 ; goto pc
                blr
                
 ; ---------------------------------------------------------
 ; SaveNVRet

 ; see comment in runtime.h or interpreter.h
 ;; Also known to RegisterLocator::update_addresses_from_VM_frame

fn             set       arg5

 ; frame contains saved nonvols, room for callee to save all r3-r10 possible incoming reg args
 frsize:       set LinkageArea.size + ((NumRcvrAndArgRegisters + NumNonVolRegisters) * size_of_gpr) ; will be saving all volatile registers + 2 for perform sel & del
 frsize:       set (frsize + 15) & ~15    ; round up to quadword


                export SaveNVRet ; for stack-walking

                start_exported_func     SaveNVAndCall5
        
                mflr    r0 ; save link
                stw     r0, LinkageArea.savedPC(sp)
                stw     fn, (LinkageArea.size + (fn - arg0) * size_of_gpr)(SP) ; save c entry point
        
                ; save nonvol gprs
                stmw    LowestNonVolReg, -(size_of_gpr * NumNonVolRegisters)(sp)
                stwu    sp, -frsize(sp) ; make frame
                mtlr    fn ; goto fn
                blrl
        
SaveNVRet:      
                lwz     sp, 0(sp)
                lmw     LowestNonVolReg, -(size_of_gpr * NumNonVolRegisters)(sp)
        
                lwz     r0, LinkageArea.savedPC(sp)
                mtlr    r0
                blr
; --------------------------------------------------------------
; EnterSelf

; copied from CallPrimitiveFromInterpreter

; also need to export  firstSelfFrameRetPC, firstSelfFrameSendDescEnd


  ; oop EnterSelf(oop recv, char* entryPoint, oop arg1) 
rcv_arg          set arg0
entry_point_arg  set arg1
arg1_arg         set arg2  

outgoing_arg_count set 2
fr_size          set ((LinkageArea.size + (outgoing_arg_count + NumGlobalNonVolRegisters) * size_of_gpr) + 15) & ~15

                 export_code_symbol firstSelfFrameSendDescEnd, fsfsde
                 export_code_symbol firstSelfFrameRetPC, fsfrp
                
 
                  
                  import_func  capture_NLR_parameters_from_registers, capt_NLR_regs

                  start_exported_func  EnterSelf
                  
                  ; save PC link
                  
                  mflr     r0
                  stw      r0, LinkageArea.savedPC(sp); save PC link (pc to return to)
                  
                  ; save global nonvols for C
                  subi     Temp1, SP, NumGlobalNonVolRegisters * size_of_gpr
                  stswi    LowestNonVolReg, Temp1, NumGlobalNonVolRegisters * size_of_gpr
                  load_global_nonvol_regs
                 
                  stwu    SP, -fr_size(SP)
                  
                  
                  ; call Self
                   
                  mtlr entry_point_arg
                  ; dont need to move rcv
                  mr   arg1, arg1_arg
                  
                  ; Inline cache format: DUPLICATED in SendDesc, ReturnTrap
                  blrl    ; go!
                  
                  ; inline cache
fsfrp:            b    fsfsde               
                  dc.l 0                       ; reg mask
                  b    contNLR
                  dc.l 0                       ; placeholder for nmlns
                  dc.l 0                       ; placeholder for nmlns
                  dc.l 0                       ; placeholder for selector
                  dc.l 20                      ; placeholder for StaticNormalLookupType
                                  
fsfsde:           lwz     sp,LinkageArea.savedSP(sp)
                  ; restore global nonvols for C
                  subi    Temp1, SP, NumGlobalNonVolRegisters * size_of_gpr
                  lswi    LowestNonVolReg, Temp1, NumGlobalNonVolRegisters * size_of_gpr
                  lwz     r0,LinkageArea.savedPC(sp)
                  mtlr    r0
                  blr

;        continue with NLR: prepare to call capt_NLR_regs with NLR reg params

contNLR:          lwz     Temp1, capt_NLR_regs(RTOC)
                  lwz     Temp1, 0(Temp1)
                  mtlr    Temp1
                  
                  ;; do not need this because they are already in the right registers!
                  ;mr      arg0, NLRResultReg
                  ;mr      arg1, NLRHomeReg
                  ;mr      arg2, NLRHomeIDReg
                  blrl
                  
                  ;; and back to caller (which is C code)
                  b       fsfsde ; restore stack & regs
                  
; ====================================================================

 
 ; SendMessage_stub: called from inline caches and prologue, post call, pre frame
 ; NonVols:
 ;   This routine goes via SaveSelfNonVolRegs because it calls out to C and C
 ;   may traverse the stack. This creates a coupling to RegisterLocator::update_addresses_from_VM_frame.
 ;   If that routine finds a frame for this stub, it can assume that all nonvols are stored
 ;   below its SP.
 
                 import_func  SendMessage, sm_C_func
                 export SendMessage_stub_returnPC ; for stack-walking
 
 num_outgoing_args: set 6 ; I pass 6 args to C (SendMessage) so need to leave that much stack space
    
 ; I save args for the send here (DUPLICATED in runtime_ppc.h)
 SendMessage_stub_volatile_register_sp_offset: equ  LinkageArea.size/oopSize + num_outgoing_args
 
 frsize:       set (SendMessage_stub_volatile_register_sp_offset + NumRcvrAndArgRegisters + 2) * oopSize ; will be saving all volatile registers + 2 for perform sel & del
 frsize:       set (frsize + 15) & ~15    ; round up to quadword
   
                start_exported_func SendMessage_stub
                 
                 ; save link
                 mflr    r0
                 stw     r0, LinkageArea.savedPC(SP)
   
                 stwu SP, -frsize(SP)  ; create frame
                 
                 ; save volatile regs
                 la    Temp1, (SendMessage_stub_volatile_register_sp_offset * oopSize)(SP)
                 stswi R3, Temp1, 0 ;; really 32
                 
                 ; setup args for SendMessage
                 
                 ; NOTE: next few carefully ordered to avoid aliasing and destroying values
                 ; and number of them must agree with no_outgoing_args above

                 mr     r8, r4; arg1
                 lwz    r7, frsize + PerformDelegateeLoc(SP); these offsets are relative to SP when stub was entered
                 lwz    r6, frsize + PerformSelectorLoc (SP); 
                 mr     r5, r3; receiver    ; destroys arg2 but we dont need arg2             
                 la     r4, frsize(SP);  lookup frame, is this right??
                 mflr   r3; ; REUSING LINK VALUE for sendDesc arg
                 
                 ; will be calling SendMessage, but save non vols on the way
                 lwz    Temp1, sm_C_func(RTOC)
                 lwz    Temp1, 0(Temp1)                 
                 li     Temp2, num_outgoing_args
                 bl     SaveSelfNonVolRegs_start
                 
                 ; returns entry point, use count register so orig link can be in link reg
                 
SendMessage_stub_returnPC:
                 mtctr  result
                 
                 ; now restore everything:
                 ; first vol regs
                 la    Temp1, (SendMessage_stub_volatile_register_sp_offset * oopSize)(SP)
                 lswi  R3, Temp1, 0 ; really 32
                 
                 la    SP, frsize(SP);  restore SP
                 lwz  R0, LinkageArea.savedPC(SP);  restore link
                 mtlr  R0
                 
                 bctr;  branch to counter reg
                 
; ======================================================================================                   

 
 ; SendDIMessage_stub: called from inline caches and prologue, post call, pre frame
 ; NonVols:
 ;   This routine goes via SaveSelfNonVolRegs because it calls out to C and C
 ;   may traverse the stack. This creates a coupling to RegisterLocator::update_addresses_from_VM_frame.
 ;   If that routine finds a frame for this stub, it can assume that all nonvols are stored
 ;   below its SP.
 
                 import_func  SendDIMessage, sdim_C_func
                 export SendDIMessage_stub_returnPC ; for stack-walking
 
 num_outgoing_args: set 6 ; I pass 6 args to C (SendDIMessage) so need to leave that much stack space
    
 ; I save args for the send here (DUPLICATED in runtime_ppc.h)
 SendDIMessage_stub_volatile_register_sp_offset: equ  LinkageArea.size/oopSize + num_outgoing_args
 
 frsize:       set (SendDIMessage_stub_volatile_register_sp_offset + NumRcvrAndArgRegisters + 2) * oopSize ; will be saving all volatile registers + 2 for perform sel & del
 frsize:       set (frsize + 15) & ~15    ; round up to quadword
   
                start_exported_func SendDIMessage_stub
                 
                 ; (Note callers link is passed in in DILinkReg)
                 stwu SP, -frsize(SP)  ; create frame
                 
                 ; save volatile regs
                 la    DITempReg, (SendDIMessage_stub_volatile_register_sp_offset * oopSize)(SP)
                 stswi R3, DITempReg, 0 ;; really 32
                 
                 ; setup args for SendDIMessage
                 
                 ; NOTE: next few carefully ordered to avoid aliasing and destroying values
                 ; and number of them must agree with no_outgoing_args above

                 mr     r8, r4; arg1
                 mr     r7, r3; rcvr
                 mr     r6, DICountReg; R0
                 mr     r5, DILinkReg; points right to the nmln and after the call
                 la     r4, frsize(SP);  lookup frame
                 mflr   r3; send desc: use callers link
                 stw    r3, LinkageArea.savedPC + frsize(SP); and save link for stack crawling
                 
                 ;; ahh... through with DI*Regs
               
                 ; will be calling SendDIMessage, but save non vols on the way
                 lwz    Temp1, sdim_C_func(RTOC)
                 lwz    Temp1, 0(Temp1)                 
                 li     Temp2, num_outgoing_args
                 bl     SaveSelfNonVolRegs_start
                 
                 ; returns entry point, use count register so orig link can be in link reg
                 
SendDIMessage_stub_returnPC:
                 mtctr  result
                 
                 ; now restore everything:
                 ; first vol regs
                 la    Temp1, (SendDIMessage_stub_volatile_register_sp_offset * oopSize)(SP)
                 lswi  R3, Temp1, 0 ; really 32
                 
                 la    SP, frsize(SP);  restore SP
                 lwz   R0, LinkageArea.savedPC(SP);  restore link
                 mtlr  R0
                 
                 bctr;  branch to counter reg
                 
; ======================================================================================                   

; ReturnTrap: return pointer is patched to me. I save registers and
; call HandleReturnTrap. Must look like an inline cache.
; Well, actually this may not be strictly necessary, but it guards
; against misusing the ret pc.

; Also for PPC, PrimCallReturnTrap is the same


                  export_code_symbol ReturnTrap,  ReturnTrap_ReturnTrap
                  export_code_symbol ReturnTrap2, ReturnTrap_ReturnTrap2
                  export_code_symbol PrimCallReturnTrap, ReturnTrap_PrimCallReturnTrap
                  export             ReturnTrap_returnPC
                  import_func  HandleReturnTrap,  ReturnTrap_HandleReturnTrap
                  start_exported_func ReturnTrap_start
                 
HandleReturnTrap_arg_count set 5

                  dc.l 0                       ; placeholder for call instruction
ReturnTrap_ReturnTrap:    
ReturnTrap_PrimCallReturnTrap:           
                  b    ReturnTrap_ReturnTrap2               
                  dc.l 0                       ; reg mask
                  b    ReturnTrap_beyond_for_NLR
                  dc.l 0                       ; placeholder for nmlns
                  dc.l 0                       ; placeholder for nmlns
                  dc.l 0                       ; placeholder for selector
                  dc.l 0                       ; placeholder for lookup type
                  dc.l 0                       ; placeholder for delegatee

ReturnTrap_ReturnTrap2:                       
                 ; result already in R3
                 mr     arg1, SP
                 li     arg2, 0 ; not NLR
                 li     arg3, 0 
                 li     arg4, 0
                 
                 ; will be calling SendMessage, but save non vols on the way
ReturnTrap_do_call          lwz    Temp1, ReturnTrap_HandleReturnTrap(RTOC)
                 lwz    Temp1, 0(Temp1)                 
                 li     Temp2, HandleReturnTrap_arg_count 
                 
                 bl     SaveSelfNonVolRegs_start
ReturnTrap_returnPC
                 dc.l   0 ; no return
                 
ReturnTrap_beyond_for_NLR: 
                 ; WARNING: carefully ordered to avoid clobbering values
                 mr     R7, NLRHomeIDReg
                 mr     R6, NLRHomeReg
                 li     R5, 1 ;  NLR
                 mr     R4, SP
                 ; result already in R3 WARNING: assumes NLRResultReg = R3
                
                 b      ReturnTrap_do_call
 
         end

# endif
# endif // TARGET_ARCH == PPC_ARCH
