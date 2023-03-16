/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

#include "_runtime_asm_gcc_sparc.S.incl"

// XXX: can't include config.hh here, so FOO_VERSION are not defined
# if defined(__NetBSD__)	// TARGET_OS_VERSION == NETBSD_VERSION
#  include <sparc/trap.h>
#  define ST_FLUSH_WINDOWS ST_FLUSHWIN
# elif defined(__svr4__)	// TARGET_OS_VERSION == SOLARIS_VERSION
#  undef __cplusplus
#  include <sys/trap.h>
# else				// TARGET_OS_VERSION == SUNOS_VERSION
#  include <sun4/trap.h>
# endif

! runtime routines

.global SendMessage_stub, SendMessage_stub_returnPC
.global SendDIMessage_stub
.global ReturnResult_stub
.global ReturnResult_stub_result

#ifdef SIC_COMPILER
.global HandleUncommonTrap
#endif
.global DIRecompile_stub, DIRecompile_stub_returnPC, Recompile_stub, Recompile_stub_returnPC
.global MakeOld_stub, MakeOld_stub_returnPC, saved_globals, saved_outregs

.global ReturnTrap, ReturnTrap2, PrimCallReturnTrap, ReturnTrap_returnPC, ReturnTrapNLR_returnPC
.global HandleReturnTrap
.global ProfilerTrap
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
.global HandleProfilerTrap
#endif
.global ContinueAfterReturnTrap, ContinueNLRAfterReturnTrap
.global ContinueAfterProfilerInterrupt

.global setSPLimitAndContinue, setSPLimitAndContinueEnd, newSPLimit, continuePC
.global processSemaphore
.global EnterSelf, ContinueNLRFromC, DiscardStack, firstSelfFrame_returnPC
.global firstSelfFrameSendDescEnd
.global NLRResultFromC, NLRHomeFromC, NLRHomeIDFromC, capture_NLR_parameters_from_registers
.global Set_Byte_Map_Base, Byte_Map_Base, FlushRegisterWindows_stub
.global  FlushInstruction

.global LowReturnAddress, HighReturnAddress

.global CallPrimitiveFromInterpreter

.global currentFP, currentFrame, currentReturnAddr
.global SwitchStack0, SwitchStack1, SwitchStack2, SwitchStack3
.global SwitchStack4
.global setSPLimit, currentSPLimit, SetSPAndCall

        .seg    "data"
        .align  8
saved_globals:                         ! buffer for saving global regs
        .word   0, 0, 0, 0, 0, 0, 0, 0
saved_outregs:                         ! buffer for saving o0..o7
        .word   0, 0, 0, 0, 0, 0, 0, 0
        .seg    "text"

! arrive here upon inline cache miss

LowReturnAddress:
SendMessage_stub:              
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        mov     selector_for_performs,  nonvolatile_selector_for_performs ! save sel, next 2 are globals
        mov     delegatee_for_performs, nonvolatile_delegatee_for_performs ! save delegatee
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     selector_for_performs,  arg3    ! save these
        mov     delegatee_for_performs, arg4    ! two
        mov     iarg1, arg5             ! pass in arg1 to interp assignments
SendMessage_stub_returnPC:
        call    SendMessage            ! call routine to lookup & send message
        mov     %i7, arg0               ! inline cache addr
! return here
        mov     nonvolatile_selector_for_performs,  selector_for_performs  ! restore selector_for_performs
        mov     nonvolatile_delegatee_for_performs, delegatee_for_performs ! restore delegatee_for_performs
        jmp     result                  ! jump to the found method
        restore                         ! pop off frame 

#endif

! arrive here upon DI parent check failure
        
SendDIMessage_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        mov     %sp, arg1               ! lookup frame pointer
        mov     diCache, arg2           ! di cache address
        mov     diVerified, arg3        ! verified parents count
        mov     ireceiver, arg4         ! receiver
        mov     iarg1, arg5             ! arg1 for interp assignments
        call    SendDIMessage          ! call special di lookup routine
        mov     %i7, arg0               ! inline cache addr
        jmp     result                  ! jump to the found method
        restore                         ! pop off frame
#endif

        .seg "data"
! a place to hold the result of an access or assignment for the interpreter
! should be a register, but dont have any -- dmu
ReturnResult_stub_result:
        .word   0
        .seg "text"


ReturnResult_stub:   ! called instead of a real Self method to return a result
        sethi   %hi(ReturnResult_stub_result), %l0
        retl
        ld      [%l0+%lo(ReturnResult_stub_result)], result



#ifdef SIC_COMPILER
HandleUncommonTrap:
        ! save all registers (including outs/globals) and call C handler
        save    %sp, (16 + 8) * -4, %sp
        set     saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     saved_outregs, %l1
        std     %i0, [%l1]              ! save out regs
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        ! make it look as if we were called by Self
        sethi   %hi(continuePC), %l1
        ld      [%l1 + %lo(continuePC)], %i7
        st      %g0, [%l1 + %lo(continuePC)]       ! clear continuePC
        sethi   %hi(processSemaphore), %o1
        mov     %i7, %o0
        call    recompileUncommon
        stb     %g0, [%o1 + %lo(processSemaphore)]    ! clear semaphore
        set     saved_globals, %l0     ! reload addr just to be sure
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     saved_outregs, %l1     ! reload addr just to be sure
        ldd     [%l1]    ,  %i0         ! restore out regs
        ldd     [%l1 + 8],  %i2  
        ldd     [%l1 + 16], %i4 
                ! dont reload i6/7 = FP/retPC
        jmp     result
        restore %g0, %g0, %g0
#endif

Recompile_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a normal method''s counter overflows
        ! called by a count stub or NIC nmethod
        ! do not overwrite the incoming args!
        save    %sp, (16 + 8) * -4, %sp ! create temporary frame to save regs
        set     saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     %g0, arg3               ! no DI
        mov     recompileLinkReg, arg4  ! nmethod/stub calling us
Recompile_stub_returnPC:
        call    Recompile              ! do the recompilation
        mov     %i7, arg0               ! inline cache addr

        ! we will only get here if recompilation didn''t replace on stack
        set     saved_globals, %l0     ! reload addr just to be sure
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     saved_outregs, %l1     ! reload addr just to be sure
        ldd     [%l1]    ,  %i0         ! restore out regs
        ldd     [%l1 + 8],  %i2  
        ldd     [%l1 + 16], %i4 
                ! dont reload i6/7 = FP/retPC
        jmp     result                  ! jump to the recompiled method
        restore %g0, %g0, %g0           ! pop off frame
#endif

DIRecompile_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a DI method''s counter overflows
        mov     diCache, %l0            ! save DI link
        mov     diVerified, %l1         ! save  DI count
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     diRecompileLink, arg3   ! DI method to recompile
                                        ! arg4 is ignored for DI recompiles
DIRecompile_stub_returnPC:
        call    Recompile              ! do the recompilation
        mov     %i7, arg0               ! inline cache addr
        mov     %l0, diCache            ! restore DI link
        mov     %l1, diVerified         ! restore  DI count
        jmp     result                  ! jump to the recompiled method
        restore                         ! pop off frame
#endif

MakeOld_stub:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! called when a young nmethod''s counter overflows
        ! called by a count stub
        ! do not overwrite the incoming args!
        save    %sp, (16 + 8) * -4, %sp ! create temporary frame to save regs
        set     saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        mov     %sp, arg1               ! lookup frame pointer
        mov     ireceiver, arg2         ! receiver
        mov     %g0, arg3               ! no DI
        mov     recompileLinkReg, arg4  ! nmethod/stub calling us
MakeOld_stub_returnPC:        
        call    MakeOld                ! clear nmethod flag etc.
        mov     %i7, arg0               ! inline cache addr

        ! just continue
        set     saved_globals, %l0     ! reload addr just to be sure
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     saved_outregs, %l1     ! reload addr just to be sure
        ldd     [%l1]    ,  %i0         ! restore out regs
        ldd     [%l1 + 8],  %i2  
        ldd     [%l1 + 16], %i4 
                ! dont reload i6/7 = FP/retPC
        jmp     result                  ! jump to the nmethod
        restore %g0, %g0, %g0           ! pop off frame
#endif

EnterSelf:
        ! gets receiver, entry point, arg1 in i0, i1, i2
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        mov     %i2, arg1

firstSelfFrame_returnPC:   ! never branch to here, just need to mark this pc for testing
        call    %i1
        mov     %i0, receiver

        ! inline cache
        .word   0                       ! allocated registers
        ba,a    contNLR
        nop
        .word   0, 0                    ! placeholder for nmlns
        .word   0                       ! placeholder for selector
        .word   20                      ! lookup type = StaticNormalLookupType
firstSelfFrameSendDescEnd:
        ret
        restore result, %g0, result

        .word   0, 0                    ! good bug-catcher

contNLR:
        mov     NLRHomeReg, arg1
        mov     NLRHomeIDReg, arg2
        call    capture_NLR_parameters_from_registers
        mov     NLRResultReg, receiver
        ret                             ! return to C++
        restore result, %g0, result
        
ContinueNLRFromC:                      ! called by VM 
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

        sethi   %hi(processSemaphore), NLRTempReg
        retl                            ! interp, so just return
        stb     %g0, [NLRTempReg + %lo(processSemaphore)]    ! clear semaphore

cont:   tst     NLRHomeReg              ! find out how to return
                                        ! now load NLR params from globals
        sethi   %hi(NLRResultFromC), NLRHomeReg
        ld      [NLRHomeReg+%lo(NLRResultFromC)], NLRResultReg
        sethi   %hi(NLRHomeIDFromC), NLRHomeReg
        ld      [NLRHomeReg+%lo(NLRHomeIDFromC)], NLRHomeIDReg
        sethi   %hi(NLRHomeFromC), NLRHomeReg
        bne     contIC
        ld      [NLRHomeReg+%lo(NLRHomeFromC)], NLRHomeReg
        sethi   %hi(processSemaphore), NLRTempReg
        jmp     %o7+8  +   non_local_return_offset-primitive_end_offset
        stb     %g0, [NLRTempReg + %lo(processSemaphore)]    ! clear semaphore
        ! return thru inline cache of primitive
        nop
contIC: sethi   %hi(processSemaphore), NLRTempReg
        jmp     %o7 + non_local_return_offset
        ! return thru normal inline cache
        stb     %g0, [NLRTempReg + %lo(processSemaphore)]    ! clear semaphore
        nop

DiscardStack:                          ! discard entire Self stack (no zapping)
HighReturnAddress:
        restore                         ! pop caller''s frame
        sethi   %hi(firstSelfFrame_returnPC), NLRTempReg
        add     NLRTempReg, %lo(firstSelfFrame_returnPC), NLRTempReg

3:      cmp     %o7, NLRTempReg         ! test ret pc
        bne     3b                      ! loop if not found
        restore                         ! pop another frame

        sethi   %hi(continue_discard_stack), NLRTempReg    ! don''t use call!
        jmp     NLRTempReg + %lo(continue_discard_stack)   ! (it destroys o7)
        mov     %g0, receiver

        .word 0,0                       ! should never get here

currentFP:
        retl
        mov     %fp, result
        
currentFrame:
        retl
        mov     %sp, result

currentReturnAddr:
        retl
        mov     %i7, result

SwitchStack0:                          ! switch to vm stack
SwitchStack1:  
SwitchStack2:  
SwitchStack3:  
SwitchStack4:  
        mov     arg1, %sp               ! set SP
        mov     arg0, t                 ! save function pointer
        mov     arg2, arg0              ! copy arguments
        mov     arg3, arg1
        mov     arg4, arg2
        jmp     t                       ! jump to continuation
        mov     arg5, arg3
        retl                            ! return result
        nop

setSPLimit:
        mov     receiver, splimit 
        set     saved_globals, %o1
        retl
        st      splimit, [%o1 + splimit_offset]

setSPLimitAndContinue:
        ! caution: this is executed in the context of the running
        ! program --> don''t touch registers or condition codes
        save    %sp, (16 + 8) * -4, %sp         ! get a new window
        sethi   %hi(continuePC), %l0
        ld      [%l0 + %lo(continuePC)], %l1   ! %l1 = continuePC
        st      %g0, [%l0 + %lo(continuePC)]   ! clear continuePC
        sethi   %hi(newSPLimit), %l2
        ld      [%l2 + %lo(newSPLimit)], splimit   ! splimit = newSPLimit
        st      %g0, [%l2 + %lo(newSPLimit)]     ! clear newSPLimit
        set     saved_globals, %l3
        st      splimit, [%l3 + splimit_offset]
        sethi   %hi(processSemaphore), %l3
        stb     %g0, [%l3 + %lo(processSemaphore)]    ! clear semaphore
        jmp     %l1
        restore
setSPLimitAndContinueEnd:

currentSPLimit:
        retl
        mov     splimit, %o0

Byte_Map_Base:
        retl
        mov     byte_map_base, %o0 

Set_Byte_Map_Base:
        mov     receiver, byte_map_base
        set     saved_globals, %o1
        retl
        st      byte_map_base, [%o1 + byte_map_base_offset]

FlushRegisterWindows_stub:
        ta      ST_FLUSH_WINDOWS
        retl
        nop

FlushInstruction:
        retl
        iflush  %o0

SetSPAndCall:
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        ta      ST_FLUSH_WINDOWS        ! save registers
        tst     iarg0                   ! save process status?
        beq     dontSave
        mov     iarg3, t1               ! save semaphore address

        st      %fp, [iarg0]            ! save sp and ret addr of curr proc
        add     %i7, 8, %i7
        st      %i7, [iarg0+4]
dontSave:
        tst     iarg2                   ! init ?
        bne     initProcess            ! yes, initial transfer
        mov     iarg1, t2               ! get callee save address

        ld      [t2+0], %fp             ! switch to new stack
        ld      [t2+4], t               ! get pc
        restore                         ! restore context
        jmp     t                       ! jump to code of new process
        stb     %g0, [t1]               ! clear semaphore

initProcess:
        ld      [t2+0], %sp             ! switch to new stack
        ld      [t2+4], t               ! get pc
        add     %sp, 64, %fp            ! set up fp
        mov     %g0, %o7                ! so that ret addr is not random
        jmp     t                       ! and jump to code of new process
        stb      %g0, [t1]              ! clear semaphore

ReturnTrap:
        ! this code must look like an inline cache
        .word   0                       ! call instruction
        .word   0                       ! delay slot
        .word   0                       ! allocated registers
        ba      convNLR                ! NLR code, word 1
        save    %sp, (16 + 8) * -4, %sp ! NLR code, word 2
        .word   0, 0                    ! nmlns
        .word   0                       ! selector
        .word   0                       ! lookupType
        nop                             ! could be delegatee
        ! fall through

ReturnTrap2:   ! called via uncommon trap
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        set     saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
conv:  mov     %fp, arg1
        mov     0, arg2                 ! not a NLR
        mov     0, arg3
        mov     0, arg4
ReturnTrap_returnPC:
        call    HandleReturnTrap
        mov     iresult, arg0           ! result of returning method
        .word   0,0                     ! should never return

convNLR:
        set     saved_globals, %l0
        std     %g0, [%l0]              ! save global regs
        std     %g2, [%l0 + 8]  
        std     %g4, [%l0 + 16] 
        std     %g6, [%l0 + 24] 
        set     saved_outregs, %l1
        std     %i0, [%l1]              ! save incoming args
        std     %i2, [%l1 + 8]  
        std     %i4, [%l1 + 16] 
        std     %i6, [%l1 + 24] 
        mov     %fp, arg1
        mov     1, arg2                 ! is a NLR
        mov     NLRHomeReg, arg3
        mov     NLRHomeIDReg, arg4
ReturnTrapNLR_returnPC:
        call    HandleReturnTrap
        mov     NLRResultReg, receiver
        .word   0,0                     ! should never return

ProfilerTrap:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! this code must look like an inline cache
        .word   0                       ! call instruction
        .word   0                       ! delay slot
        .word   0                       ! allocated registers
        ba      returnProfilerNLR      ! NLR code, word 1
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
        call    HandleProfilerTrap
        nop
        mov     arg0, t2
        mov     t1, arg0
        ! jump to the result of C call
        jmp     t2
        restore
        nop
        .word   0,0                     ! should never return
        sethi   %hi(processSemaphore), %g1
        stb     %g0, [%g1 + %lo(processSemaphore)]    ! clear semaphore
#endif

returnProfilerNLR:
        ! Retrieve the real return address from the frame and 
        ! return to the non local return point
        ld      [%fp+current_pc_offset], %o7
        jmp     %o7+non_local_return_offset
        nop
        .word   0,0



PrimCallReturnTrap:                    ! normal return point for prims
        ! this code must look like a primitive call
        ! better to keep this separate because of different NLR offset
        ba      convNLR                ! NLR code, word 1
        save    %sp, (16 + 8) * -4, %sp ! NLR code, word 2
        ba      conv
        save    %sp, (16 + 8) * -4, %sp

ContinueNLRAfterReturnTrap:
        mov     arg2, NLRResultReg      ! set up NLR registers
        mov     arg3, NLRHomeReg
        mov     arg4, NLRHomeIDReg
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        ta      ST_FLUSH_WINDOWS        ! flush all reg windows
        mov     iarg1, %fp              ! set fp (= sp of Self frame above)
        sub     %fp, 64, %sp            ! set sp
        sethi   %hi(processSemaphore), %l2
        stb     %g0, [%l2 + %lo(processSemaphore)]    ! clear semaphore
        jmp     iarg0
        restore iarg2, %g0, result      ! set result

ContinueAfterReturnTrap:
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        ta      ST_FLUSH_WINDOWS        ! flush all reg windows
        mov     iarg0, %l1              ! save 1st arg (return PC)
        mov     iarg1, %l2              ! save 2nd arg (FP)
        set     saved_globals, %l0
        ldd     [%l0]    ,  %g0         ! restore global regs
        ldd     [%l0 + 8],  %g2  
        ldd     [%l0 + 16], %g4 
        ldd     [%l0 + 24], %g6
        set     saved_outregs, %l0
        ldd     [%l0]    ,  %i0         ! restore o0-o5 of caller
        ldd     [%l0 + 8],  %i2  
        ldd     [%l0 + 16], %i4 
        mov     %l2, %fp                ! set fp (= sp of Self frame above)
        sub     %fp, 64, %sp            ! set sp
        sethi   %hi(processSemaphore), %l2
        stb     %g0, [%l2 + %lo(processSemaphore)]    ! clear semaphore
        jmp     %l1
        restore %g0, %g0, %g0           ! pop stack frame

ContinueAfterProfilerInterrupt:
#if defined(FAST_COMPILER) || defined(SIC_COMPILER)
        ! caution: this is executed in the context of the running
        ! program --> don''t touch registers or condition codes
        save    %sp, (16 + 8) * -4, %sp         ! get a new window

        ta      ST_FLUSH_WINDOWS                ! flush register windows

        ! load continue pc.
        sethi   %hi(continuePC), %l0
        ld      [%l0 + %lo(continuePC)], %l1   ! %l1 = continuePC
        st      %g0, [%l0 + %lo(continuePC)]   ! clear continuePC

        ! load the address of profiler_return_addr (def in nprofiler.c)
        sethi   %hi(profiler_return_addr), %l0
        ld      [%l0 + %lo(profiler_return_addr)], %l2 !

        ! store the continue pc 
        st      %l1, [%l2+0]

        ! store %o7 from previous frame which is %i7 in this frame
        st      %i7, [%l2+8]

        ! store %i7 from the previous frame
        ld      [%fp+60], %l3
        st      %l3, [%l2+16]

        ! store %fp
        st      %fp, [%l2+24]

        sethi   %hi(processSemaphore), %l3
        stb     %g0, [%l3 + %lo(processSemaphore)]    ! clear semaphore

        jmp     %l1
        restore
#endif
        
        
! called with entry point, rcv, argp, arg_count

CallPrimitiveFromInterpreter:
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
.global initializePrimDesc

initializePrimDesc:
        save    %sp, (16 + 8) * -4, %sp         ! get a new window
        nop
        call    _GLOBAL_$I$name__8PrimDesc
        nop
        ret
        restore
# endif

#if !(defined(__NetBSD__) || defined(__svr4__))	// TARGET_OS_VERSION == SUNOS_VERSION
# error wrong.
.global mapToLoad

#define mapLoad(reg, body)                                                    \
.global CONC(reg,mapLoadHandler);                                             \
CONC(reg,mapLoadHandler):                                                     \
        body                                                                  \

#define doLoad(reg)                                                           \
        /* load mapToLoad into reg, then continue at continuePC */            \
        /* CAUTION: do not change any other register! */                      \
        save  %sp, (16 + 8) * -4, %sp;       /* get a new window */           \
        sethi %hi(mapToLoad), %l0;                                            \
        ld    [%l0 + %lo(mapToLoad)], %l0;/* load map temporarily into l0 */  \
        sethi %hi(continuePC), %l1;                                           \
        ld    [%l1 + %lo(continuePC)], %l2;                                   \
        st    %g0, [%l1 + %lo(continuePC)];                                   \
        sethi %hi(processSemaphore), %l1;                                     \
        stb    %g0, [%l1 + %lo(processSemaphore)];                            \
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

