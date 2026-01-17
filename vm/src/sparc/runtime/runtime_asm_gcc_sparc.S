/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "_runtime_asm_gcc_sparc.S.incl"

// XXX: can't include config.hh here, so FOO_VERSION are not defined
# if defined(__NetBSD__)        // TARGET_OS_VERSION == NETBSD_VERSION
#  include <sparc/trap.h>
#  define ST_FLUSH_WINDOWS ST_FLUSHWIN
# elif defined(__svr4__)        // TARGET_OS_VERSION == SOLARIS_VERSION
#  undef __cplusplus
#  include <sys/trap.h>
# else                          // TARGET_OS_VERSION == SUNOS_VERSION
#  include <sun4/trap.h>
# endif


!! void HandleReturnTrap(oop result, char* sp, bool nlr, frame* home, int32 homeID);
.global HandleReturnTrap

#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
!! char* HandleProfilerTrap(char* return_address)
.global HandleProfilerTrap
#endif

.global continuePC              ! extern char* continuePC;      // runtime.cpp
.global newSPLimit              ! extern char* newSPLimit;      // process.cpp
.global processSemaphore        ! extern bool8 processSemaphore; // process.cpp

/*
 * As we are returning up Self stack (NLR returns)
 * we might return into C++ (via firstSelfFrame_returnPC in runtime.s).
 * Before returning to C++, asm code calls this function,
 * which also sets NLRSupport::_have_NLR_through_C flag.
 */
!! oop capture_NLR_parameters_from_registers(oop result, int32 target_frame, int32 target_ID);
.global capture_NLR_parameters_from_registers

/*
 * These are used for communication with the assembly routine because
 * there aren't enough temporary registers to hold all this stuff.
 * Don't access these this way from C++;
 */
!! params for ContinueNLRFromC
.global NLRResultFromC          ! extern oop NLRResultFromC;
.global NLRHomeFromC            ! extern int32 NLRHomeFromC;
.global NLRHomeIDFromC          ! extern int32 NLRHomeIDFromC;



        .data

        !! buffer for saving global regs
        .align  8
ASMOBJ(saved_globals)
        .word   0, 0, 0, 0, 0, 0, 0, 0
        ASMEND(saved_globals)

#define SAVE_GLOBALS(_TMP)                \
        set     saved_globals, _TMP     ; \
        std     %g0, [_TMP     ]        ; \
        std     %g2, [_TMP +  8]        ; \
        std     %g4, [_TMP + 16]        ; \
        std     %g6, [_TMP + 24]

#define RESTORE_GLOBALS(_TMP)             \
        set     saved_globals, _TMP     ; \
        ldd     [_TMP     ], %g0        ; \
        ldd     [_TMP +  8], %g2        ; \
        ldd     [_TMP + 16], %g4        ; \
        ldd     [_TMP + 24], %g6


        !! buffer for saving o0..o7
        .align  8
ASMOBJ(saved_outregs)
        .word   0, 0, 0, 0, 0, 0, 0, 0
        ASMEND(saved_outregs)

#define SAVE_OUTS(_TMP)                   \
        set     saved_outregs, _TMP     ; \
        std     %i0, [_TMP     ]        ; \
        std     %i2, [_TMP +  8]        ; \
        std     %i4, [_TMP + 16]        ; \
        std     %i6, [_TMP + 24]

#define RESTORE_OUTS(_TMP)                \
        set     saved_outregs, _TMP     ; \
        ldd     [_TMP     ], %i0        ; \
        ldd     [_TMP +  8], %i2        ; \
        ldd     [_TMP + 16], %i4
        /* don't restore %i6 (FP) and %i7 (retPC) */


/* this choice of temps just matches the existing usage */
#define SAVE_REGISTERS          SAVE_GLOBALS(%l0);    SAVE_OUTS(%l1)
#define RESTORE_REGISTERS       RESTORE_GLOBALS(%l0); RESTORE_OUTS(%l1)


        .text

ASMLABEL(LowReturnAddress)
        !! SPARC VM uses different calling conventions for primitive
        !! (and C) calls as for Self calls, so VM needs to know if a
        !! return address is in this zone of [LowReturnAddress,
        !! HighReturnAddress]


        !! arrive here upon inline cache miss
ASMFUNC(SendMessage_stub)
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        save    %sp, -CCFSZ, %sp        ! make new register window
        mov     selector_for_performs,  nonvolatile_selector_for_performs ! save sel, next 2 are globals
        mov     delegatee_for_performs, nonvolatile_delegatee_for_performs ! save delegatee
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     selector_for_performs,  arg3    ! save these
        mov     delegatee_for_performs, arg4    ! two
        mov     iarg1, arg5             ! pass in arg1 to interp assignments
  ASMLABEL(SendMessage_stub_returnPC)
        call    SendMessage             ! call routine to lookup & send message
         mov    %i7, arg0               ! inline cache addr
        !! return here
        mov     nonvolatile_selector_for_performs,  selector_for_performs  ! restore selector_for_performs
        mov     nonvolatile_delegatee_for_performs, delegatee_for_performs ! restore delegatee_for_performs
        jmp     result                  ! jump to the found method
         restore
#endif
        ASMEND(SendMessage_stub)


        !! arrive here upon DI parent check failure
ASMFUNC(SendDIMessage_stub)
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        save    %sp, -CCFSZ, %sp        ! make new register window
        mov     %sp, arg1               ! lookup frame pointer
        mov     diCache, arg2           ! di cache address
        mov     diVerified, arg3        ! verified parents count
        mov     ireceiver, arg4         ! receiver
        mov     iarg1, arg5             ! arg1 for interp assignments
        call    SendDIMessage           ! call special di lookup routine
         mov    %i7, arg0               ! inline cache addr
        jmp     result                  ! jump to the found method
         restore
#endif
        ASMEND(SendDIMessage_stub)



        .data
/*
 * a place to hold the result of an access or assignment for the
 * interpreter.  should be a register, but dont have any -- dmu
 */
ASMOBJ(ReturnResult_stub_result)
        .word   0
        ASMEND(ReturnResult_stub_result)


        .text
ASMFUNC(ReturnResult_stub) ! called instead of a real Self method to return a result
        sethi   %hi(ReturnResult_stub_result), %l0
        retl
         ld     [%l0 + %lo(ReturnResult_stub_result)], result
        ASMEND(ReturnResult_stub)


#ifdef SIC_COMPILER
ASMFUNC(HandleUncommonTrap)
        ! save all registers (including outs/globals) and call C handler
        save    %sp, -CCFSZ, %sp
        SAVE_REGISTERS
        !! make it look as if we were called by Self
        sethi   %hi(continuePC), %l1
        ld      [%l1 + %lo(continuePC)], %i7
        clr     [%l1 + %lo(continuePC)]
        sethi   %hi(processSemaphore), %o1
        mov     %i7, %o0
        call    recompileUncommon
         clrb   [%o1 + %lo(processSemaphore)]
        RESTORE_REGISTERS
        jmp     result
         restore
        ASMEND(HandleUncommonTrap)
#endif


ASMFUNC(Recompile_stub)
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a normal method's counter overflows
        ! called by a count stub or NIC nmethod
        ! do not overwrite the incoming args!
        save    %sp, -CCFSZ, %sp        ! create temporary frame to save regs
        SAVE_REGISTERS
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        clr     arg3                    ! no DI
        mov     recompileLinkReg, arg4  ! nmethod/stub calling us
  ASMLABEL(Recompile_stub_returnPC)
        call    Recompile               ! do the recompilation
         mov    %i7, arg0               ! inline cache addr

        ! we will only get here if recompilation didn't replace on stack
        RESTORE_REGISTERS
        jmp     result                  ! jump to the recompiled method
         restore
#endif
        ASMEND(Recompile_stub)


ASMFUNC(DIRecompile_stub)
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a DI method's counter overflows
        mov     diCache, %l0            ! save DI link
        mov     diVerified, %l1         ! save  DI count
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     diRecompileLink, arg3   ! DI method to recompile
                                        ! arg4 is ignored for DI recompiles
  ASMLABEL(DIRecompile_stub_returnPC)
        call    Recompile              ! do the recompilation
         mov    %i7, arg0               ! inline cache addr
        mov     %l0, diCache            ! restore DI link
        mov     %l1, diVerified         ! restore  DI count
        jmp     result                  ! jump to the recompiled method
         restore
#endif
        ASMEND(DIRecompile_stub)


        !! called when a young nmethod's counter overflows
        !! called by a count stub
        !! do not overwrite the incoming args!
ASMFUNC(MakeOld_stub)
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        save    %sp, -CCFSZ, %sp        ! create temporary frame to save regs
        SAVE_REGISTERS
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        clr     arg3                    ! no DI
        mov     recompileLinkReg, arg4  ! nmethod/stub calling us
  ASMLABEL(MakeOld_stub_returnPC)
        call    MakeOld                 ! clear nmethod flag etc.
         mov    %i7, arg0               ! inline cache addr
        !! just continue
        RESTORE_REGISTERS
        jmp     result                  ! jump to the nmethod
         restore
#endif
        ASMEND(MakeOld_stub)


        !! oop EnterSelf(oop recv, char* entryPoint, oop arg1);
ASMFUNC(EnterSelf)
        save    %sp, -CCFSZ, %sp        ! make new register window
        mov     iarg2, arg1

        !! never branch to here, just need to mark this pc for testing
  ASMLABEL(firstSelfFrame_returnPC)
        call    iarg1                   ! call instruction
         mov    ireceiver, receiver     ! delay slot
        !! inline cache
        .word   0                       ! allocated registers
        ba,a    .LcontNLR               ! NLR code, word 1
         nop                            ! NLR code, word 2
        .word   0, 0                    ! placeholder for nmlns
        .word   0                       ! placeholder for selector
        .word   20                      ! lookup type = StaticNormalLookupType
  ASMLABEL(firstSelfFrameSendDescEnd)   ! end of sendDesc

        ret
         restore result, %g0, result
        .word   0, 0                    ! good bug-catcher

.LcontNLR:
        mov     NLRHomeReg, arg1        ! target_frame
        mov     NLRHomeIDReg, arg2      ! target_ID
        call    capture_NLR_parameters_from_registers
         mov    NLRResultReg, receiver  ! result
        ret                             ! return to C++
         restore result, %g0, result
        ASMEND(EnterSelf)



        !! oop ContinueNLRFromC(char* addr, bool isInterpreted, bool isSelfIC);
ASMFUNC(ContinueNLRFromC)               ! called by VM
        mov     arg0, NLRTempReg        ! return address
        mov     arg1, NLRResultReg      ! borrow this global to save interp flag
        mov     arg2, NLRHomeReg        ! called from Self ic? (must save)

        !! pop VM frames
0:      cmp     %i7, NLRTempReg         ! test ret pc
        bne     0b                      ! loop if not found
         restore                        !  pop another frame

        tst     NLRResultReg            ! isInterpreted?
        bz      .Lcont                  ! no, goto compiled variant
         nop

        !! interpreted, so just return
        sethi   %hi(processSemaphore), NLRTempReg
        retl
         clrb   [NLRTempReg + %lo(processSemaphore)]

        !! compiled
.Lcont:
        tst     NLRHomeReg              ! isSelfIC?
        !! now load NLR params from globals
        sethi   %hi(NLRResultFromC), NLRHomeReg
        ld      [NLRHomeReg + %lo(NLRResultFromC)], NLRResultReg
        sethi   %hi(NLRHomeIDFromC), NLRHomeReg
        ld      [NLRHomeReg + %lo(NLRHomeIDFromC)], NLRHomeIDReg
        sethi   %hi(NLRHomeFromC), NLRHomeReg
        bnz     .LcontIC
         ld     [NLRHomeReg + %lo(NLRHomeFromC)], NLRHomeReg

        !! return thru inline cache of primitive
        sethi   %hi(processSemaphore), NLRTempReg
        jmp     %o7 + (8 + non_local_return_offset - primitive_end_offset)
         clrb   [NLRTempReg + %lo(processSemaphore)]
        nop

.LcontIC:
        !! return thru normal inline cache
        sethi   %hi(processSemaphore), NLRTempReg
        jmp     %o7 + non_local_return_offset
         clrb   [NLRTempReg + %lo(processSemaphore)]
        nop
        ASMEND(ContinueNLRFromC)


        !! cf. LowReturnAddress above
ASMLABEL(HighReturnAddress)
        !! SPARC VM uses different calling conventions for primitive
        !! (and C) calls as for Self calls, so VM needs to know if a
        !! return address is in this zone of [LowReturnAddress,
        !! HighReturnAddress]



        !! discard entire Self stack (no zapping)
ASMFUNC(DiscardStack)
        restore                         ! pop caller's frame
        set     firstSelfFrame_returnPC, NLRTempReg
0:      cmp     %o7, NLRTempReg         ! test ret pc
        bne     0b                      ! loop if not found
         restore                        ! pop another frame

        !! Discarded stack up to and including EnterSelf.  The current
        !! frame is the one that made the call to EnterSelf, but that
        !! might have been not the topmost Self call.  Make a trip to
        !! C++ to check nesting.

        !! NB: must jump (tail call) to preserve return address in %o7
        sethi   %hi(continue_discard_stack), NLRTempReg
        jmp     NLRTempReg + %lo(continue_discard_stack)
         clr    result                  ! XXX???
        .word   0, 0                    ! should never get here
        ASMEND(DiscardStack)


ASMFUNC(currentFP)
        retl
         mov    %fp, result
        ASMEND(currentFP)


ASMFUNC(currentFrame)
        retl
         mov    %sp, result
        ASMEND(currentFrame)


ASMFUNC(currentReturnAddr)
        retl
         mov    %i7, result
        ASMEND(currentReturnAddr)



/*
 * Switch to VM stack, and call a function with <N> arguments:
 *
 * char* SwitchStack<N>(char* fn_start, char* newSP,
 *                      void* arg1, ..., void* argN);
 *
 * Since args are in registers, just use SwitchStack4 that
 * passes 4 for all of them.
 */
ASMFUNC(SwitchStack0)
ASMFUNC(SwitchStack1)
ASMFUNC(SwitchStack2)
ASMFUNC(SwitchStack3)
ASMFUNC(SwitchStack4)
        mov     arg1, %sp               ! set SP
        mov     arg0, t                 ! save function pointer
        mov     arg2, arg0              ! copy arguments
        mov     arg3, arg1
        mov     arg4, arg2
        jmp     t                       ! jump to continuation
         mov    arg5, arg3
        retl                            ! return result
         nop
        ASMEND(SwitchStack4)
        ASMEND(SwitchStack3)
        ASMEND(SwitchStack2)
        ASMEND(SwitchStack1)
        ASMEND(SwitchStack0)


ASMFUNC(setSPLimit)
        mov     arg0, splimit
        set     saved_globals, %o1
        retl
         st     splimit, [%o1 + splimit_offset]
        ASMEND(setSPLimit)


ASMFUNC(setSPLimitAndContinue)
        !! caution: this is executed in the context of the running
        !! program --> don't touch registers or condition codes
        save    %sp, -CCFSZ, %sp                ! get a new window
        sethi   %hi(continuePC), %l0
        ld      [%l0 + %lo(continuePC)], %l1    ! %l1 = continuePC
        clr     [%l0 + %lo(continuePC)]
        sethi   %hi(newSPLimit), %l2
        ld      [%l2 + %lo(newSPLimit)], splimit   ! splimit = newSPLimit
        clr     [%l2 + %lo(newSPLimit)]
        set     saved_globals, %l3
        st      splimit, [%l3 + splimit_offset]
        sethi   %hi(processSemaphore), %l3
        clrb    [%l3 + %lo(processSemaphore)]
        jmp     %l1
         restore
  ASMLABEL(setSPLimitAndContinueEnd)
        ASMEND(setSPLimitAndContinue)


ASMFUNC(currentSPLimit)
        retl
         mov    splimit, %o0
        ASMEND(currentSPLimit)


ASMFUNC(Byte_Map_Base)
        retl
         mov    byte_map_base, %o0
        ASMEND(Byte_Map_Base)


ASMFUNC(Set_Byte_Map_Base)
        mov     arg0, byte_map_base
        set     saved_globals, %o1
        retl
         st     byte_map_base, [%o1 + byte_map_base_offset]
        ASMEND(Set_Byte_Map_Base)


ASMFUNC(FlushRegisterWindows_stub)
        ta      ST_FLUSH_WINDOWS
        retl
         nop
        ASMEND(FlushRegisterWindows_stub)


ASMFUNC(FlushInstruction)
        retl
         iflush %o0
        ASMEND(FlushInstruction)


/*
 * void SetSPAndCall(char** callerSaveAddr, char** calleeSaveAddr,
 *                  bool init, bool8* semaphore, bool8 pcWasSet);
 *
 * 1. make new stack frame & save all registers in it
 * 2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1];
 * 3. if (!init)          restore fp, return addr from calleeSaveAddr[0], [1]
 *                        clear semaphore, restore regs & return to return addr;
 * 4. else                setup new stack fp,sp starting at calleeSaveAddr[0]
 *                        (ensure trap if return past top)
 *                        clear semaphore, jump to calleeSaveAddr[1].
 */
ASMFUNC(SetSPAndCall)
        save    %sp, -CCFSZ, %sp        ! make new register window
        ta      ST_FLUSH_WINDOWS        ! save registers

        tst     iarg0                   ! save process status?
        bz      0f
         mov    iarg3, t1               ! get semaphore address
        st      %fp, [iarg0]            ! save sp and ret addr of curr proc
        inc     8, %i7                  ! move past the call's delay slot
        st      %i7, [iarg0 + 4]
0:
        tst     iarg2                   ! init?
        bnz     .LinitProcess           ! yes, initial transfer
         mov    iarg1, t2               ! get callee save address

        ld      [t2 + 0], %fp           ! switch to new stack
        ld      [t2 + 4], t             ! get pc
        restore                         ! restore context
        jmp     t                       ! jump to code of new process
         clrb   [t1]                    ! clear semaphore

.LinitProcess:
        ld      [t2 + 0], %sp           ! switch to new stack
        ld      [t2 + 4], t             ! get pc
        add     %sp, 64, %fp            ! set up fp
        clr     %o7                     ! so that ret addr is not random
        jmp     t                       ! and jump to code of new process
         clrb   [t1]                    ! clear semaphore
        ASMEND(SetSPAndCall)


ASMFUNC(ReturnTrap)
        !! this code must look like an inline cache
        .word   0                       ! call instruction
        .word   0                       ! delay slot
        .word   0                       ! allocated registers
        ba      convNLR                 ! NLR code, word 1
         save   %sp, -CCFSZ, %sp        ! NLR code, word 2
        .word   0, 0                    ! nmlns
        .word   0                       ! selector
        .word   0                       ! lookupType
        nop                             ! could be delegatee
        !! end of sendDesc
        !! fall through
  ASMLABEL(ReturnTrap2)                 ! called via uncommon trap
        save    %sp, -CCFSZ, %sp        ! make new register window
        SAVE_REGISTERS
conv:
        !! HandleReturnTrap(result, %fp, false, NULL, 0)
        mov     %fp, arg1               ! sp
        mov     0, arg2                 ! NLR = false
        mov     0, arg3                 ! home = NULL
        mov     0, arg4                 ! homeID = 0
  ASMLABEL(ReturnTrap_returnPC)
        call    HandleReturnTrap
         mov    iresult, arg0           ! result of returning method
        .word   0,0                     ! should never return

convNLR:
        !! HandleReturnTrap(result, %fp, true, NLRHomeReg, NLRHomeIDReg)
        SAVE_REGISTERS
        mov     %fp, arg1               ! sp
        mov     1, arg2                 ! NLR = true
        mov     NLRHomeReg, arg3        ! home
        mov     NLRHomeIDReg, arg4      ! homeID
  ASMLABEL(ReturnTrapNLR_returnPC)
        call    HandleReturnTrap
         mov    NLRResultReg, receiver  ! result
        .word   0,0                     ! should never return
        ASMEND(ReturnTrap)


ASMLABEL(ProfilerTrap)
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        !! this code must look like an inline cache
        .word   0                       ! call instruction
        .word   0                       ! delay slot
        .word   0                       ! allocated registers
        ba      returnProfilerNLR       ! NLR code, word 1
         nop                            ! NLR code, word 2
        .word   0, 0                    ! nmlns
        .word   0                       ! selector
        .word   0                       ! lookupType
        nop                             ! could be delegatee
        !! end of sendDesc
        !! Call char* HandleProfilerTrap(char* return_address) in frame.cpp
        ld      [%fp + current_pc_offset], t1
        save    %sp, -CCFSZ, %sp        ! make new register window
        mov     t1, arg0
        call    HandleProfilerTrap
         nop
        !! jump to the result of C call
        mov     result, t2
        mov     t1, arg0
        jmp     t2
         restore
        nop
        .word   0,0                     ! should never return
        sethi   %hi(processSemaphore), %g1
        clrb    [%g1 + %lo(processSemaphore)]
#endif
returnProfilerNLR:
        !! Retrieve the real return address from the frame and
        !! return to the non local return point
        ld      [%fp + current_pc_offset], %o7
        jmp     %o7 + non_local_return_offset
         nop
        .word   0,0
        ASMEND(ProfilerTrap)


        !! normal return point for prims
ASMFUNC(PrimCallReturnTrap)
        !! this code must look like a primitive call
        !! better to keep this separate because of different NLR offset
        ba      convNLR                 ! NLR code, word 1
        save    %sp, -CCFSZ, %sp        ! NLR code, word 2
        ba      conv
        save    %sp, -CCFSZ, %sp
        ASMEND(PrimCallReturnTrap)


ASMFUNC(ContinueNLRAfterReturnTrap)
        mov     arg2, NLRResultReg      ! set up NLR registers
        mov     arg3, NLRHomeReg
        mov     arg4, NLRHomeIDReg
        save    %sp, -CCFSZ, %sp        ! make new register window
        ta      ST_FLUSH_WINDOWS        ! flush all reg windows
        mov     iarg1, %fp              ! set fp (= sp of Self frame above)
        sub     %fp, 64, %sp            ! set sp
        sethi   %hi(processSemaphore), %l2
        clrb    [%l2 + %lo(processSemaphore)]
        jmp     iarg0
         restore iarg2, %g0, result     ! set result
        ASMEND(ContinueNLRAfterReturnTrap)


ASMFUNC(ContinueAfterReturnTrap)
        save    %sp, -CCFSZ, %sp        ! make new register window
        ta      ST_FLUSH_WINDOWS        ! flush all reg windows
        mov     iarg0, %l1              ! save 1st arg (return PC)
        mov     iarg1, %l2              ! save 2nd arg (FP)
        RESTORE_GLOBALS(%l0)
        RESTORE_OUTS(%l0)               ! NB: not the usual %l1 like elsewhere
        mov     %l2, %fp                ! set fp (= sp of Self frame above)
        sub     %fp, 64, %sp            ! set sp
        sethi   %hi(processSemaphore), %l2
        clrb    [%l2 + %lo(processSemaphore)]
        jmp     %l1
         restore
        ASMEND(ContinueAfterReturnTrap)


ASMFUNC(ContinueAfterProfilerInterrupt)
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        !! caution: this is executed in the context of the running
        !! program --> don't touch registers or condition codes
        save    %sp, -CCFSZ, %sp                ! get a new window
        ta      ST_FLUSH_WINDOWS                ! flush register windows

        !! load continue pc.
        sethi   %hi(continuePC), %l0
        ld      [%l0 + %lo(continuePC)], %l1    ! %l1 = continuePC
        clr     [%l0 + %lo(continuePC)]

        !! load the address of profiler_return_addr (def in nprofiler.c)
        sethi   %hi(profiler_return_addr), %l0
        ld      [%l0 + %lo(profiler_return_addr)], %l2

        !! store the continue pc
        st      %l1, [%l2 + 0]

        !! store %o7 from previous frame which is %i7 in this frame
        st      %i7, [%l2 + 8]

        !! store %i7 from the previous frame
        ld      [%fp + 15 * 4], %l3
        st      %l3, [%l2 + 16]

        !! store %fp
        st      %fp, [%l2 + 24]

        sethi   %hi(processSemaphore), %l3
        clrb    [%l3 + %lo(processSemaphore)]

        jmp     %l1             ! continuePC
         restore
#endif
        ASMEND(ContinueAfterProfilerInterrupt)


!! called with entry point, rcv, argp, arg_count
ASMFUNC(CallPrimitiveFromInterpreter)
        !! compute the frame size we need
        subcc   %o3, 5, %o4             ! will pass five non-rcv args in reg
        blt,a   0f                      ! if o4 < 0, make it be 0
         clr    %o4                     !  clear if branch taken
0:      inc     (16 + 1 + 6), %o4       ! add extra words for frame
        inc     1, %o4                  ! round up to even
        and     %o4, 0xfffffffe, %o4
        sll     %o4, 2, %o4             ! in bytes
        neg     %o4

        save    %sp, %o4, %sp           ! get new window
        mov     %i0, %l0                ! save entry_point
        mov     %i2, %l1                ! save argp
        mov     %i3, %l2                ! save arg count

        !! setup register args
        mov     %i1, %o0                ! setup rcv

        !! setup args from mem to regs
        tst %l2;  ble 2f;  nop;  ld [%l1], %o1;  inc 4, %l1;  deccc %l2;
        tst %l2;  ble 2f;  nop;  ld [%l1], %o2;  inc 4, %l1;  deccc %l2;
        tst %l2;  ble 2f;  nop;  ld [%l1], %o3;  inc 4, %l1;  deccc %l2;
        tst %l2;  ble 2f;  nop;  ld [%l1], %o4;  inc 4, %l1;  deccc %l2;
        tst %l2;  ble 2f;  nop;  ld [%l1], %o5;  inc 4, %l1;  deccc %l2;
        tst %l2;  ble 2f;

        !! setup mem->stack args
        sll     %l2, 2, %l3                 ! arg size in bytes
        add     %sp, (16 + 6 + 1) * 4, %l4  ! compute addr of first stack arg
                                            ! 16 for regs, 1 for aggr ptr, 6 for reg args into mem
        deccc   4, %l3
1:      ld      [%l1 + %l3], %l5        ! get arg from argp[]
        st      %l5, [%l4 + %l3]        ! store arg in our frame
        bgt,a   1b
         deccc  4, %l3

        !! our frame is set up, call the primitive
2:      call    %l0
         nop
        mov     result, iresult
        ret
         restore
        ASMEND(CallPrimitiveFromInterpreter)



# ifdef OLD_GCC     /* see prim.c */
ASMFUNC(initializePrimDesc)
        save    %sp, -CCFSZ, %sp                ! get a new window
        nop
        call    _GLOBAL_$I$name__8PrimDesc
         nop
        ret
         restore
        ASMEND(initializePrimDesc)
# endif

#if !(defined(__NetBSD__) || defined(__svr4__)) // TARGET_OS_VERSION == SUNOS_VERSION
# error wrong.

.global mapToLoad       ! extern oop mapToLoad; // uncommonBranch_sparc.cpp

#define mapLoad(_REG, _BODY)            \
  ASMFUNC(CONC(_REG,mapLoadHandler))    \
    _BODY

/*
 * load mapToLoad into _REG, then continue at continuePC
 * CAUTION: do not change any other register!
 */
#define doLoad(_REG)                              \
        save    %sp, -CCFSZ, %sp                ; \
        sethi   %hi(mapToLoad), %l0             ; \
        ld      [%l0 + %lo(mapToLoad)], %l0     ; \
        sethi   %hi(continuePC), %l1            ; \
        ld      [%l1 + %lo(continuePC)], %l2    ; \
        clr     [%l1 + %lo(continuePC)]         ; \
        sethi   %hi(processSemaphore), %l1      ; \
        clrb    [%l1 + %lo(processSemaphore)]   ; \
        jmp     %l2                             ; \
         restore %l0, %g0, _REG /* set result (map) reg */

mapLoad(G1, doLoad(%g1))
mapLoad(G2, doLoad(%g2))
mapLoad(G3, doLoad(%g3))
mapLoad(G4, doLoad(%g4))
mapLoad(G5, doLoad(%g5))

mapLoad(L0, doLoad(%l0))
mapLoad(L1, doLoad(%l1))
mapLoad(L2, doLoad(%l2))
mapLoad(L3, doLoad(%l3))
mapLoad(L4, doLoad(%l4))
mapLoad(L5, doLoad(%l5))
mapLoad(L6, doLoad(%l6))
mapLoad(L7, doLoad(%l7))

mapLoad(O0, doLoad(%o0))
mapLoad(O1, doLoad(%o1))
mapLoad(O2, doLoad(%o2))
mapLoad(O3, doLoad(%o3))
mapLoad(O4, doLoad(%o4))
mapLoad(O5, doLoad(%o5))

mapLoad(I1, doLoad(%i1))
mapLoad(I2, doLoad(%i2))
mapLoad(I3, doLoad(%i3))
mapLoad(I4, doLoad(%i4))
mapLoad(I5, doLoad(%i5))

#endif // SUNOS_VERSION
