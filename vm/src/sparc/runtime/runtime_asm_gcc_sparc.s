/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

#include "_runtime_asm_gcc_sparc.s.incl"

# if TARGET_OS_VERSION == SOLARIS_VERSION
#  undef __cplusplus
#  include <sys/trap.h>
# else
#  include <sun4/trap.h>
# endif

! runtime routines

.global _SendMessage_stub, _SendMessage_stub_returnPC
.global _SendDIMessage_stub
.global _ReturnResult_stub
.global _ReturnResult_stub_result

#ifdef SIC_COMPILER
.global _HandleUncommonTrap
#endif
.global _DIRecompile_stub, _DIRecompile_stub_returnPC, _Recompile_stub, _Recompile_stub_returnPC
.global _MakeOld_stub, _MakeOld_stub_returnPC, _saved_globals, _saved_outregs

.global _ReturnTrap, _ReturnTrap2, _PrimCallReturnTrap, _ReturnTrap_returnPC, _ReturnTrapNLR_returnPC
.global _HandleReturnTrap
.global _ProfilerTrap
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
.global _HandleProfilerTrap
#endif
.global _ContinueAfterReturnTrap, _ContinueNLRAfterReturnTrap
.global _ContinueAfterProfilerInterrupt

.global _setSPLimitAndContinue, _setSPLimitAndContinueEnd, _newSPLimit, _continuePC
.global _processSemaphore
.global _EnterSelf, _ContinueNLRFromC, _DiscardStack, _firstSelfFrame_returnPC
.global _firstSelfFrameSendDescEnd
.global _NLRResultFromC, _NLRHomeFromC, _NLRHomeIDFromC, _capture_NLR_parameters_from_registers
.global _Set_Byte_Map_Base, _Byte_Map_Base, _FlushRegisterWindows_stub
.global  _FlushInstruction

.global _LowReturnAddress, _HighReturnAddress

.global _CallPrimitiveFromInterpreter

.global _currentFP, _currentFrame, _currentReturnAddr
.global _SwitchStack0, _SwitchStack1, _SwitchStack2, _SwitchStack3
.global _SwitchStack4
.global _setSPLimit, _currentSPLimit, _SetSPAndCall

        .seg    "data"
        .align  8
_saved_globals:                         ! buffer for saving global regs
        .word   0, 0, 0, 0, 0, 0, 0, 0
_saved_outregs:                         ! buffer for saving o0..o7
        .word   0, 0, 0, 0, 0, 0, 0, 0
        .seg    "text"

! arrive here upon inline cache miss

_LowReturnAddress:
_SendMessage_stub:              
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        mov     selector_for_performs,  nonvolatile_selector_for_performs ! save sel, next 2 are globals
        mov     delegatee_for_performs, nonvolatile_delegatee_for_performs ! save delegatee
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     selector_for_performs,  arg3    ! save these
        mov     delegatee_for_performs, arg4    ! two
        mov     iarg1, arg5             ! pass in arg1 to interp assignments
_SendMessage_stub_returnPC:
        call    _SendMessage            ! call routine to lookup & send message
        mov     %i7, arg0               ! inline cache addr
! return here
        mov     nonvolatile_selector_for_performs,  selector_for_performs  ! restore selector_for_performs
        mov     nonvolatile_delegatee_for_performs, delegatee_for_performs ! restore delegatee_for_performs
        jmp     result                  ! jump to the found method
        restore                         ! pop off frame 

#endif

! arrive here upon DI parent check failure
        
_SendDIMessage_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        mov     %sp, arg1               ! lookup frame pointer
        mov     diCache, arg2           ! di cache address
        mov     diVerified, arg3        ! verified parents count
        mov     ireceiver, arg4         ! receiver
        mov     iarg1, arg5             ! arg1 for interp assignments
        call    _SendDIMessage          ! call special di lookup routine
        mov     %i7, arg0               ! inline cache addr
        jmp     result                  ! jump to the found method
        restore                         ! pop off frame
#endif

        .seg "data"
! a place to hold the result of an access or assignment for the interpreter
! should be a register, but dont have any -- dmu
_ReturnResult_stub_result:
        .word   0
        .seg "text"


_ReturnResult_stub:   ! called instead of a real Self method to return a result
        sethi   %hi(_ReturnResult_stub_result), %l0
        retl
        ld      [%l0+%lo(_ReturnResult_stub_result)], result



#ifdef SIC_COMPILER
_HandleUncommonTrap:
        ! save all registers (including outs/globals) and call C handler
        save    %sp, (16 + 8) * -4, %sp
        set     _saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     _saved_outregs, %l1
        std     %i0, [%l1]              ! save out regs
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        ! make it look as if we were called by Self
        sethi   %hi(_continuePC), %l1
        ld      [%l1 + %lo(_continuePC)], %i7
        st      %g0, [%l1 + %lo(_continuePC)]       ! clear continuePC
        sethi   %hi(_processSemaphore), %o1
        mov     %i7, %o0
        call    _recompileUncommon
        stb     %g0, [%o1 + %lo(_processSemaphore)]    ! clear semaphore
        set     _saved_globals, %l0     ! reload addr just to be sure
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     _saved_outregs, %l1     ! reload addr just to be sure
        ldd     [%l1]    ,  %i0         ! restore out regs
        ldd     [%l1 + 8],  %i2  
        ldd     [%l1 + 16], %i4 
                ! dont reload i6/7 = FP/retPC
        jmp     result
        restore %g0, %g0, %g0
#endif

_Recompile_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a normal method''s counter overflows
        ! called by a count stub or NIC nmethod
        ! do not overwrite the incoming args!
        save    %sp, (16 + 8) * -4, %sp ! create temporary frame to save regs
        set     _saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     _saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     %g0, arg3               ! no DI
        mov     recompileLinkReg, arg4  ! nmethod/stub calling us
_Recompile_stub_returnPC:
        call    _Recompile              ! do the recompilation
        mov     %i7, arg0               ! inline cache addr

        ! we will only get here if recompilation didn''t replace on stack
        set     _saved_globals, %l0     ! reload addr just to be sure
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     _saved_outregs, %l1     ! reload addr just to be sure
        ldd     [%l1]    ,  %i0         ! restore out regs
        ldd     [%l1 + 8],  %i2  
        ldd     [%l1 + 16], %i4 
                ! dont reload i6/7 = FP/retPC
        jmp     result                  ! jump to the recompiled method
        restore %g0, %g0, %g0           ! pop off frame
#endif

_DIRecompile_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a DI method''s counter overflows
        mov     diCache, %l0            ! save DI link
        mov     diVerified, %l1         ! save  DI count
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     diRecompileLink, arg3   ! DI method to recompile
                                        ! arg4 is ignored for DI recompiles
_DIRecompile_stub_returnPC:
        call    _Recompile              ! do the recompilation
        mov     %i7, arg0               ! inline cache addr
        mov     %l0, diCache            ! restore DI link
        mov     %l1, diVerified         ! restore  DI count
        jmp     result                  ! jump to the recompiled method
        restore                         ! pop off frame
#endif

_MakeOld_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a young nmethod''s counter overflows
        ! called by a count stub
        ! do not overwrite the incoming args!
        save    %sp, (16 + 8) * -4, %sp ! create temporary frame to save regs
        set     _saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     _saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     %g0, arg3               ! no DI
        mov     recompileLinkReg, arg4  ! nmethod/stub calling us
_MakeOld_stub_returnPC:        
        call    _MakeOld                ! clear nmethod flag etc.
        mov     %i7, arg0               ! inline cache addr

        ! just continue
        set     _saved_globals, %l0     ! reload addr just to be sure
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     _saved_outregs, %l1     ! reload addr just to be sure
        ldd     [%l1]    ,  %i0         ! restore out regs
        ldd     [%l1 + 8],  %i2  
        ldd     [%l1 + 16], %i4 
                ! dont reload i6/7 = FP/retPC
        jmp     result                  ! jump to the nmethod
        restore %g0, %g0, %g0           ! pop off frame
#endif

_EnterSelf:
        ! gets receiver, entry point, arg1 in i0, i1, i2
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        mov     %i2, arg1

_firstSelfFrame_returnPC:   ! never branch to here, just need to mark this pc for testing
        call    %i1
        mov     %i0, receiver

        ! inline cache
        .word   0                       ! allocated registers
        ba,a    contNLR
        nop
        .word   0, 0                    ! placeholder for nmlns
        .word   0                       ! placeholder for selector
        .word   20                      ! lookup type = StaticNormalLookupType
_firstSelfFrameSendDescEnd:
        ret
        restore result, %g0, result

        .word   0, 0                    ! good bug-catcher

contNLR:
        mov     NLRHomeReg, arg1
        mov     NLRHomeIDReg, arg2
        call    _capture_NLR_parameters_from_registers
        mov     NLRResultReg, receiver
        ret                             ! return to C++
        restore result, %g0, result
        
_ContinueNLRFromC:                      ! called by VM 
        mov     receiver, NLRTempReg    ! return address
        mov     arg1, NLRResultReg      ! borrow this global to save interp flag
        mov     arg2, NLRHomeReg        ! called from Self ic? (must save)

                                        ! pop VM frames
1:      cmp     %i7, NLRTempReg         ! test ret pc
        bne     1b                      ! loop if not found
        restore                         ! pop another frame

        tst     NLRResultReg            ! interp?
        beq     cont                    ! no, goto compiled variant
        nop

        sethi   %hi(_processSemaphore), NLRTempReg
        retl                            ! interp, so just return
        stb     %g0, [NLRTempReg + %lo(_processSemaphore)]    ! clear semaphore

cont:   tst     NLRHomeReg              ! find out how to return
                                        ! now load NLR params from globals
        sethi   %hi(_NLRResultFromC), NLRHomeReg
        ld      [NLRHomeReg+%lo(_NLRResultFromC)], NLRResultReg
        sethi   %hi(_NLRHomeIDFromC), NLRHomeReg
        ld      [NLRHomeReg+%lo(_NLRHomeIDFromC)], NLRHomeIDReg
        sethi   %hi(_NLRHomeFromC), NLRHomeReg
        bne     contIC
        ld      [NLRHomeReg+%lo(_NLRHomeFromC)], NLRHomeReg
        sethi   %hi(_processSemaphore), NLRTempReg
        jmp     %o7+8  +   non_local_return_offset-primitive_end_offset
        stb     %g0, [NLRTempReg + %lo(_processSemaphore)]    ! clear semaphore
        ! return thru inline cache of primitive
        nop
contIC: sethi   %hi(_processSemaphore), NLRTempReg
        jmp     %o7 + non_local_return_offset
        ! return thru normal inline cache
        stb     %g0, [NLRTempReg + %lo(_processSemaphore)]    ! clear semaphore
        nop

_DiscardStack:                          ! discard entire Self stack (no zapping)
_HighReturnAddress:
        restore                         ! pop caller''s frame
        sethi   %hi(_firstSelfFrame_returnPC), NLRTempReg
        add     NLRTempReg, %lo(_firstSelfFrame_returnPC), NLRTempReg

3:      cmp     %o7, NLRTempReg         ! test ret pc
        bne     3b                      ! loop if not found
        restore                         ! pop another frame

        sethi   %hi(_continue_discard_stack), NLRTempReg    ! don''t use call!
        jmp     NLRTempReg + %lo(_continue_discard_stack)   ! (it destroys o7)
        mov     %g0, receiver

        .word 0,0                       ! should never get here

_currentFP:
        retl
        mov     %fp, result
        
_currentFrame:
        retl
        mov     %sp, result

_currentReturnAddr:
        retl
        mov     %i7, result

_SwitchStack0:                          ! switch to vm stack
_SwitchStack1:  
_SwitchStack2:  
_SwitchStack3:  
_SwitchStack4:  
        mov     arg1, %sp               ! set SP
        mov     arg0, t                 ! save function pointer
        mov     arg2, arg0              ! copy arguments
        mov     arg3, arg1
        mov     arg4, arg2
        jmp     t                       ! jump to continuation
        mov     arg5, arg3
        retl                            ! return result
        nop

_setSPLimit:
        mov     receiver, splimit 
        set     _saved_globals, %o1
        retl
        st      splimit, [%o1 + splimit_offset]

_setSPLimitAndContinue:
        ! caution: this is executed in the context of the running
        ! program --> don''t touch registers or condition codes
        save    %sp, (16 + 8) * -4, %sp         ! get a new window
        sethi   %hi(_continuePC), %l0
        ld      [%l0 + %lo(_continuePC)], %l1   ! %l1 = continuePC
        st      %g0, [%l0 + %lo(_continuePC)]   ! clear continuePC
        sethi   %hi(_newSPLimit), %l2
        ld      [%l2 + %lo(_newSPLimit)], splimit   ! splimit = newSPLimit
        st      %g0, [%l2 + %lo(_newSPLimit)]     ! clear newSPLimit
        set     _saved_globals, %l3
        st      splimit, [%l3 + splimit_offset]
        sethi   %hi(_processSemaphore), %l3
        stb     %g0, [%l3 + %lo(_processSemaphore)]    ! clear semaphore
        jmp     %l1
        restore
_setSPLimitAndContinueEnd:

_currentSPLimit:
        retl
        mov     splimit, %o0

_Byte_Map_Base:
        retl
        mov     byte_map_base, %o0 

_Set_Byte_Map_Base:
        mov     receiver, byte_map_base
        set     _saved_globals, %o1
        retl
        st      byte_map_base, [%o1 + byte_map_base_offset]

_FlushRegisterWindows_stub:
        ta      ST_FLUSH_WINDOWS
        retl
        nop

_FlushInstruction:
        retl
        iflush  %o0

_SetSPAndCall:
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        ta      ST_FLUSH_WINDOWS        ! save registers
        tst     iarg0                   ! save process status?
        beq     _dontSave
        mov     iarg3, t1               ! save semaphore address

        st      %fp, [iarg0]            ! save sp and ret addr of curr proc
        add     %i7, 8, %i7
        st      %i7, [iarg0+4]
_dontSave:
        tst     iarg2                   ! init ?
        bne     _initProcess            ! yes, initial transfer
        mov     iarg1, t2               ! get callee save address

        ld      [t2+0], %fp             ! switch to new stack
        ld      [t2+4], t               ! get pc
        restore                         ! restore context
        jmp     t                       ! jump to code of new process
        stb     %g0, [t1]               ! clear semaphore

_initProcess:
        ld      [t2+0], %sp             ! switch to new stack
        ld      [t2+4], t               ! get pc
        add     %sp, 64, %fp            ! set up fp
        mov     %g0, %o7                ! so that ret addr is not random
        jmp     t                       ! and jump to code of new process
        stb      %g0, [t1]              ! clear semaphore

_ReturnTrap:
        ! this code must look like an inline cache
        .word   0                       ! call instruction
        .word   0                       ! delay slot
        .word   0                       ! allocated registers
        ba      _convNLR                ! NLR code, word 1
        save    %sp, (16 + 8) * -4, %sp ! NLR code, word 2
        .word   0, 0                    ! nmlns
        .word   0                       ! selector
        .word   0                       ! lookupType
        nop                             ! could be delegatee
        ! fall through

_ReturnTrap2:   ! called via uncommon trap
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        set     _saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     _saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
_conv:  mov     %fp, arg1
        mov     0, arg2                 ! not a NLR
        mov     0, arg3
        mov     0, arg4
_ReturnTrap_returnPC:
        call    _HandleReturnTrap
        mov     iresult, arg0           ! result of returning method
        .word   0,0                     ! should never return

_convNLR:
        set     _saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     _saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        mov     %fp, arg1
        mov     1, arg2                 ! is a NLR
        mov     NLRHomeReg, arg3
        mov     NLRHomeIDReg, arg4
_ReturnTrapNLR_returnPC:
        call    _HandleReturnTrap
        mov     NLRResultReg, receiver
        .word   0,0                     ! should never return

_ProfilerTrap:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! this code must look like an inline cache
        .word   0                       ! call instruction
        .word   0                       ! delay slot
        .word   0                       ! allocated registers
        ba      _returnProfilerNLR      ! NLR code, word 1
        nop                             ! NLR code, word 2
        .word   0, 0                    ! nmlns
        .word   0                       ! selector
        .word   0                       ! lookupType
        nop                             ! could be delegatee
        ! end of sendDesc
        ! Call char* HandleProfilerTrap(char* return_address) in frame.c
        ld      [%fp+current_pc_offset], t1
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        mov     t1, arg0
        call    _HandleProfilerTrap
        nop
        mov     arg0, t2
        mov     t1, arg0
        ! jump to the result of C call
        jmp     t2
        restore
        nop
        .word   0,0                     ! should never return
        sethi   %hi(_processSemaphore), %g1
        stb     %g0, [%g1 + %lo(_processSemaphore)]    ! clear semaphore
#endif

_returnProfilerNLR:
        ! Retrieve the real return address from the frame and 
        ! return to the non local return point
        ld      [%fp+current_pc_offset], %o7
        jmp     %o7+non_local_return_offset
        nop
        .word   0,0



_PrimCallReturnTrap:                    ! normal return point for prims
        ! this code must look like a primitive call
        ! better to keep this separate because of different NLR offset
        ba      _convNLR                ! NLR code, word 1
        save    %sp, (16 + 8) * -4, %sp ! NLR code, word 2
        ba      _conv
        save    %sp, (16 + 8) * -4, %sp

_ContinueNLRAfterReturnTrap:
        mov     arg2, NLRResultReg      ! set up NLR registers
        mov     arg3, NLRHomeReg
        mov     arg4, NLRHomeIDReg
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        ta      ST_FLUSH_WINDOWS        ! flush all reg windows
        mov     iarg1, %fp              ! set fp (= sp of Self frame above)
        sub     %fp, 64, %sp            ! set sp
        sethi   %hi(_processSemaphore), %l2
        stb     %g0, [%l2 + %lo(_processSemaphore)]    ! clear semaphore
        jmp     iarg0
        restore iarg2, %g0, result      ! set result

_ContinueAfterReturnTrap:
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        ta      ST_FLUSH_WINDOWS        ! flush all reg windows
        mov     iarg0, %l1              ! save 1st arg (return PC)
        mov     iarg1, %l2              ! save 2nd arg (FP)
        set     _saved_globals, %l0
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     _saved_outregs, %l0
        ldd     [%l0]    ,  %i0         ! restore o0-o5 of caller
        ldd     [%l0 + 8],  %i2  
        ldd     [%l0 + 16], %i4 
        mov     %l2, %fp                ! set fp (= sp of Self frame above)
        sub     %fp, 64, %sp            ! set sp
        sethi   %hi(_processSemaphore), %l2
        stb     %g0, [%l2 + %lo(_processSemaphore)]    ! clear semaphore
        jmp     %l1
        restore %g0, %g0, %g0           ! pop stack frame

_ContinueAfterProfilerInterrupt:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! caution: this is executed in the context of the running
        ! program --> don''t touch registers or condition codes
        save    %sp, (16 + 8) * -4, %sp         ! get a new window

        ta      ST_FLUSH_WINDOWS                ! flush register windows

        ! load continue pc.
        sethi   %hi(_continuePC), %l0
        ld      [%l0 + %lo(_continuePC)], %l1   ! %l1 = continuePC
        st      %g0, [%l0 + %lo(_continuePC)]   ! clear continuePC

        ! load the address of _profiler_return_addr (def in nprofiler.c)
        sethi   %hi(_profiler_return_addr), %l0
        ld      [%l0 + %lo(_profiler_return_addr)], %l2 !

        ! store the continue pc 
        st      %l1, [%l2+0]

        ! store %o7 from previous frame which is %i7 in this frame
        st      %i7, [%l2+8]

        ! store %i7 from the previous frame
        ld      [%fp+60], %l3
        st      %l3, [%l2+16]

        ! store %fp
        st      %fp, [%l2+24]

        sethi   %hi(_processSemaphore), %l3
        stb     %g0, [%l3 + %lo(_processSemaphore)]    ! clear semaphore

        jmp     %l1
        restore
#endif
        
        
! called with entry point, rcv, argp, arg_count

_CallPrimitiveFromInterpreter:
        subcc   %o3, 5, %o4             ! will pass five non-rcv args in reg
        blt,a   1f                      ! if o4 < 0, make it be 0
        clr %o4                         ! clear if branch taken
        
1:      add     %o4, (16 + 1 + 6), %o4  ! add extra words for frame
        add     %o4, 1, %o4             ! round up to even
        and     %o4, 0xfffffffe, %o4
        sll     %o4, 2, %o4             ! in bytes
        sub     %g0, %o4, %o4           ! negative

        save    %sp, %o4, %sp           ! get new window
        mov     %i0, %l0                ! save entry_point
        mov     %i2, %l1                ! save argp
        mov     %i3, %l2                ! save arg count
! setup register args
        mov     %i1, %o0                ! setup rcv

! setup args from mem to regs   
        tst %l2;  ble 2f; nop; ld  [%l1], %o1;  add %l1, 4, %l1;  subcc  %l2, 1, %l2;
        tst %l2;  ble 2f; nop; ld  [%l1], %o2;  add %l1, 4, %l1;  subcc  %l2, 1, %l2;
        tst %l2;  ble 2f; nop; ld  [%l1], %o3;  add %l1, 4, %l1;  subcc  %l2, 1, %l2;
        tst %l2;  ble 2f; nop; ld  [%l1], %o4;  add %l1, 4, %l1;  subcc  %l2, 1, %l2;
        tst %l2;  ble 2f; nop; ld  [%l1], %o5;  add %l1, 4, %l1;  subcc  %l2, 1, %l2;
        tst %l2;  ble 2f; 
        
! setup mem->stack args
        sll     %l2, 2, %l3                 ! arg size in bytes
        add     %sp, (16 + 6 + 1) * 4, %l4  ! compute addr of first stack arg
                                            ! 16 for regs, 1 for aggr ptr, 6 for reg args into mem
        subcc   %l3, 4, %l3
1:      ld      [%l1+%l3], %l5          ! get arg
        st      %l5, [%l4+%l3]          ! store arg
        bgt,a   1b
        subcc   %l3, 4, %l3
        
2:      call    %l0                     ! call the prim
        nop
        mov     %o0, %i0                ! return result
        ret                             ! return to interp
        restore                         ! restore frame


# ifdef OLD_GCC     /* see prim.c */
.global _initializePrimDesc

_initializePrimDesc:
        save    %sp, (16 + 8) * -4, %sp         ! get a new window
        nop
        call    __GLOBAL_$I$name__8PrimDesc
        nop
        ret
        restore
# endif

#if TARGET_OS_VERSION == SUNOS_VERSION
.global _mapToLoad

#define mapLoad(reg, body)                                                    \
.global CONC3(_,reg,_mapLoadHandler);                                         \
CONC3(_,reg,_mapLoadHandler):                                                 \
        body                                                                  \

#define doLoad(reg)                                                           \
        /* load mapToLoad into reg, then continue at continuePC */            \
        /* CAUTION: do not change any other register! */                      \
        save  %sp, (16 + 8) * -4, %sp;       /* get a new window */           \
        sethi %hi(_mapToLoad), %l0;                                           \
        ld    [%l0 + %lo(_mapToLoad)], %l0;/* load map temporarily into l0 */ \
        sethi %hi(_continuePC), %l1;                                          \
        ld    [%l1 + %lo(_continuePC)], %l2;                                  \
        st    %g0, [%l1 + %lo(_continuePC)];                                  \
        sethi %hi(_processSemaphore), %l1;                                    \
        stb    %g0, [%l1 + %lo(_processSemaphore)];                           \
        jmpl  %l2 + 0, %g0;                  /* return to normal program */   \
        restore %l0, %g0, reg;               /* and set result (map) reg */   \

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

