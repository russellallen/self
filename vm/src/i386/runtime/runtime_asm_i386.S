# ifdef __i386__
 // Sun-$Revision: 1.8 $


 // Copyright 1992-2012 AUTHORS.
 //   See the LICENSE file for license information.



# include "asmDefs_i386.hh"

  .text
        
    start_exported_function currentFrame
        // must be ebp cause caller may change esp
        movl %ebp, %eax
        # if GENERATE_DEBUGGING_AIDS
          .globl C_SYM(CheckAssertions)
          testb $255, C_SYM(CheckAssertions)
          jz 2f
          
          enter $8, $0
          pushl Temp2
          movl %eax, Temp2
          addl $8, Temp2 // so it points to 1st C arg, Self rcvr
          testl $(frame_word_alignment * oopSize  -  1), Temp2 // alignment check
          jz 1f
          popl Temp2 // for debugger
          hlt
          leave
        1:
          popl Temp2
          leave
        2:
        # endif
        ret
        
    start_exported_function currentReturnAddr
        hlt // unused?

    start_exported_function set_SPLimitReg
                hlt

    start_exported_function save1Arg
                hlt

  //-----------------------------------------------------------------
                
               


  
//  1. make new stack frame & save all registers in it
//  2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1]
//  3. if (!init)        restore fp, return addr from calleeSaveAddr[0], [1]
//                        clear semaphore, restore regs & return to return addr
//  4 else                setup new stack fp,sp starting at calleeSaveAddr[0]
//                        (ensure trap if return past top)
//                        clear semaphore, jump to calleeSaveAddr[1]


 
 // process switch primitive
 // NOTE ASSUMES switching within same code segment:
 //   void  SetSPAndCall( char** callerSaveAddr, char** calleeSaveAddr,
 //                      bool init, bool* semaphore)// (bool == char)

  
# define callerSaveAddr  8 // remember pc and ebp
# define calleeSaveAddr  12
# define init            16
# define semaphore       20
# define pcWasSet        24 

        
# define saveAddr_SP  0
# define saveAddr_PC  (0 + size_of_reg)

# define saved_esi_offset  -4
# define saved_edi_offset  -8
# define saved_ebx_offset  -12

  
// first make new stack frame & save all registers in it

start_exported_function SetSPAndCall

  
  enter  $24, $0 // space for three saved regs, two already saved = 5 = 20, next mult of 16 is 24
  //  2. if (callerSaveAddr) store fp, return addr into callerSaveAddr[0], [1]
  cmpl $0, callerSaveAddr(%ebp)
  je  noSave
  
  movl callerSaveAddr(%ebp), %eax
  movl %esp, saveAddr_SP(%eax)
  subl $8, saveAddr_SP(%eax) // make it look like an sp, with saved PC and base reg
  movl 4(%ebp), %ecx
  movl %ecx, saveAddr_PC(%eax)
noSave: 

  movl %esi, saved_esi_offset(%ebp)
  movl %edi, saved_edi_offset(%ebp)
  movl %ebx, saved_ebx_offset(%ebp)

  // sp now aligned
  
  pushl $0 // mock return PC
  pushl %ebp // save bp, but DONT change the bp, we still needed
  // esp should now be same as what we saved above        

  movl semaphore(%ebp), %eax
  movb $0, 0(%eax)
        
  movl calleeSaveAddr(%ebp), %eax
  movb pcWasSet(%ebp), %cl   // will need this 
  movl saveAddr_SP(%eax), %esp
  movl saveAddr_PC(%eax), %eax
  
  cmpb $0, init(%ebp)
  jne  firstTimeThisProcess

//  3. if (!init)        restore fp, return addr from calleeSaveAddr[0], [1]
//                       clear semaphore, restore regs & return to return addr
  movl (%esp), %ebp // restore ebp
  movl saved_esi_offset(%ebp), %esi
  movl saved_edi_offset(%ebp), %edi
  movl saved_ebx_offset(%ebp), %ebx

  // restore cond codes?
          
  leave

  movl %eax, (%esp) // overrwrite return addr with new PC
        
  # if GENERATE_DEBUGGING_AIDS
    .globl C_SYM(CheckAssertions)
    testb $255, C_SYM(CheckAssertions)
    jz 1f
    
    movl %esp, %eax
    addl $4, %eax // return below will pop
    testl $(frame_byte_alignment - 1), %eax
    jz 1f
    hlt
  1:
  # endif
  
  // if PC was set, we are returning to the START of a function
  // It will expect the esp to be 4 less than a multiple of 16
  // Normally we are returning into the middle, after the prologue,
  // so it expects the esp to be 8 less.
  testb %cl, %cl
  jz returning_into_middle
  jmp_reg_indir %esp
  
returning_into_middle:  
  # if GENERATE_DEBUGGING_AIDS
    .globl C_SYM(SpendTimeForDebugging)
    testb $255, C_SYM(SpendTimeForDebugging)
    jz 2f
  
    movl $0, %eax
    movl $0, %ecx
    movl $0, %edx
    
  2:
  
 # endif
                
  ret 
        
 //  4 else                setup new stack fp,sp starting at calleeSaveAddr[0]
 //                        (ensure trap if return past top)
 //                        clear semaphore, jump to calleeSaveAddr[1]



firstTimeThisProcess:
  
  movl $0, %ebp // null link, stop frame tracing from passing here

  testb %cl, %cl
  jz 1f
  // pc was set-- we are entering a function
  subl $8, %esp // esp needs to be fixed
1:
  
# if GENERATE_DEBUGGING_AIDS
  .globl C_SYM(SpendTimeForDebugging)
  testb $255, C_SYM(SpendTimeForDebugging)
  jz 2f
  
  movl $0, %ebx
  movl $0, %ecx
  movl $0, %edx
2:  
  
 # endif

  .globl  C_SYM(ReturnOffTopOfProcess)
  pushl $ C_SYM(ReturnOffTopOfProcess)
  jmp_reg %eax

        
// =============================================
// SwitchStack0 switches back toVm stack with 0 arguments
//; Actually it passes 4 args, so it can be reused to implement the others
        
        
# define newPC  8
# define newSP  12
# define a1  16
# define a2  20
# define a3  24
# define a4  28        


start_exported_function SwitchStack0 
start_exported_function SwitchStack1
start_exported_function SwitchStack2
start_exported_function SwitchStack3
start_exported_function SwitchStack4
  
          
          enter $2*oopSize, $0   // save old bp, keep sp aligned
          # if GENERATE_DEBUGGING_AIDS
            .globl      C_SYM(CheckAssertions)
            testb $255, C_SYM(CheckAssertions)
            jz 2f
            testl $(frame_word_alignment * oopSize  - 1), %esp
            jz 1f
            hlt
          1:
          2:
          # endif
          movl newSP(%ebp), %esp // setup new stack pointer (new pointer is 0xXXXXXXX8 )
          // going to push four things on, need sp to be four less and aligned, so need to push 6
          pushl   $0
          pushl   $0
          pushl   a4(%ebp)
          pushl   a3(%ebp)
          pushl   a2(%ebp)
          pushl   a1(%ebp) // after four pushes, is still aligned!
          # if GENERATE_DEBUGGING_AIDS
            .globl      C_SYM(CheckAssertions)
            testb $255, C_SYM(CheckAssertions)
            jz 2f

            testl $(frame_word_alignment * oopSize  - 1), %esp
            jz 1f
            hlt
          1:
          2:
          # endif
          call_disp_reg_indir newPC,%ebp
          leave
          ret
        
        
// ===========================================

// CallPrimitiveFromInterpreter
        
        
  // called with entry point, rcv, argp, arg_count
  


  start_exported_function CallPrimitiveFromInterpreter
  hlt
  
 
 // ---------------------------------------------------------
 // ContinueNLRFromC
 
 // When C code wants to continue an NLR, it calls here
 
# define ret_addr        4  // return address
# define interp_flag     8 // nlr to interp?
# define self_ic_flag   12 // called from Self ic?
        

start_exported_function ContinueNLRFromC    //; called by VM 
                movl ret_addr(%esp), NLRResultReg // borrow these regs
                movl interp_flag(%esp), NLRHomeReg        // called from Self ic? (must save)
                
 2:             leave
                cmpl (%esp), NLRResultReg  // test ret addr
                jne 2b
                testl NLRHomeReg, NLRHomeReg // interp?
                jne  3f // no, compiled
                
               .globl C_SYM(NLRResultFromC), C_SYM(NLRHomeIDFromC), C_SYM(NLRHomeFromC)
                movl  C_SYM(NLRResultFromC), NLRResultReg
                movl  C_SYM(NLRHomeIDFromC), NLRHomeIDReg
                movl  C_SYM(NLRHomeFromC),   NLRHomeReg

                movb $0, C_SYM(processSemaphore)
                

                addl $ non_local_return_offset, (%esp)
3:              ret                
                
                                      
                
// --------------------------------------------------------------
// ContinueAfterReturnTrap

                
# define result_arg      4 
# define pc_arg          8
# define sp_arg          12


                start_exported_function ContinueAfterReturnTrap
               movl result_arg(%esp), ResultReg
               movl pc_arg(%esp), %edx
               movl sp_arg(%esp), %esp
               movl (%esp), %ebp // restore base pointer
               addl $8, %esp // passed in sp of patched frame AFTER pushing pc, ebp, want sp BEFORE
               movl $0, C_SYM(processSemaphore)
               jmp_reg %edx
                
// --------------------------------------------------------------
// ContinueNLRAfterReturnTrap
                
# undef pc_arg
# define pc_arg          4
# undef sp_arg
# define sp_arg          8
# undef result_arg
# define result_arg      12
# define homeFrame_arg   16
# define homeFrameID_arg 20    

                start_exported_function ContinueNLRAfterReturnTrap
                movl result_arg(%esp), NLRResultReg
                movl homeFrame_arg(%esp), NLRHomeReg
                movl homeFrameID_arg(%esp), NLRHomeIDReg
                movl pc_arg(%esp), NLRTempReg
                movl sp_arg(%esp), %esp
                movl (%esp), %ebp // restore base pointer
                addl $8, %esp // passed in sp of patched frame AFTER pushing pc, ebp, want sp BEFORE
                movb $0, C_SYM(processSemaphore)
                jmp_reg NLRTempReg
                
 // ---------------------------------------------------------
// EnterSelf

// copied from CallPrimitiveFromInterpreter

// also need to export  firstSelfFrame_returnPC, firstSelfFrameSendDescEnd


  // oop EnterSelf(oop recv, char* entryPoint, oop arg1)
# define rcv_arg          8 
# define entry_point_arg  12
# define arg1_arg         16 

                  
start_exported_function EnterSelf

                   enter $0, $0 // 6 to come, 2 done = 0
                                    
                   // save preserved regs
                   pushl %edi
                   pushl %esi
                   pushl %ebx
                   
                   // will also reuse next three locs
                   
                   pushl $0 // need three words starting from here
                   
                   // push args
                   pushl arg1_arg(%ebp)
                   pushl  rcv_arg(%ebp)
 
                   align_send_desc_call_rm
                   call_disp_reg_indir entry_point_arg,%ebp
start_exported_function firstSelfFrame_returnPC
                   jmp_label send_desc_end      // XXXintel may not need this if do it like sparc, offset 2/2, len 5
                  .long 0                       // reg mask  XXXintel not needed, offset 3/3 len 4
                   jmp_label contNLR             // XXXintel could be short inst if fix sendDesc offsets
                  .globl  C_SYM(firstSelfFrame_nmlns) // for alignment checking
                  .long 0                       // placeholder for nmlns, offset 1/0 WRONG
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for selector
                  .long 20                      // placeholder for StaticNormalLookupType
                                  
start_exported_function firstSelfFrameSendDescEnd
send_desc_end:
                  movl  12(%esp), %ebx
                  movl  16(%esp), %esi
                  movl  20(%esp), %edi
                  leave
                  ret
  
//        continue with NLR: prepare to call capture_NLR_parameters_from_registers with NLR reg params

                 .globl C_SYM(capture_NLR_parameters_from_registers)
                  // reuse three arg locations
contNLR:          movl NLRHomeIDReg,  8(%esp)
                  movl NLRHomeReg,    4(%esp)
                  movl NLRResultReg,   (%esp)
                  call C_SYM(capture_NLR_parameters_from_registers)
                  jmp send_desc_end // back to caller (is c code)
                  
// ====================================================================

 
 // SendMessage_stub: called from inline caches and prologue, post call, pre frame
 
 
// char* SendMessage(sendDesc* ic,
//                    frame* lookupFrame,
//                    oop receiver,
//                    oop perform_selector,
//                    oop perform_delegatee,
//                    oop arg1);
 
# define num_outgoing_args  6 // I pass 6 args to C (SendMessage) so need to leave that much stack space
    
 // I save args for the send here (DUPLICATED in runtime.h)
   
                               
                start_exported_function SendMessage_stub
                
                enter $0, $0 // will be pushing 6, already pushed 2 pc, esp, so need zero padding
                
                pushl 12(%ebp) // arg1
                pushl PerformDelegateeLoc // perform_delg
                pushl PerformSelectorLoc // perform_sel
                pushl 8(%ebp) // rcvr
                pushl %ebp // lookup frame, yes, sp of self frame
                pushl 4(%ebp) // inline cache
                
                .globl  C_SYM(SendMessage)
                call C_SYM(SendMessage)
                 
                 // returns entry point
                 
start_exported_function SendMessage_stub_returnPC // for stack-walking
                leave
                jmp_reg CResultReg

                 
// ======================================================================================                   

 
 // SendDIMessage_stub: called from inline caches and prologue, post call, pre frame
 
 // stack has link back to prologue & nmln, count, link back to caller of method with DI, incoming args
 

start_exported_function SendDIMessage_stub
                 enter $0, $0 // create frame, going to push 6, already pushed two, no padding
                 
                 // setup args for SendDIMessage
                 
                 pushl 12(%ebp) // arg1, ebp points to saved ebp
                 pushl  8(%ebp) // rcvr
                 pushl DICountReg   // count
                 pushl DIInlineCacheReg   // points right to the nmlln and after the call
                 pushl %ebp    // lookup frame??
                 pushl 4(%ebp)  // send desc: use caller's link
               
                 .globl C_SYM(SendDIMessage)
                 call   C_SYM(SendDIMessage)

                 // returns entry point
                 
start_exported_function SendDIMessage_stub_returnPC // for stack-walking
                 // unwind orig call, and enter at entry point
                 leave
                 jmp_reg CResultReg
                 
// ======================================================================================                   




// MakeOld_stub
// called when a young nmethod''s counter overflows.
// called by a count stub.

// The bit with might need _Perform selector...
// What if a method being called when MakeOld/Recompile is called
// is being _Performed? Might need to save these two. -- dmu 2/03

// num_outgoing_args = 5 // I pass 5 args to C (MakeOld) so need to leave that much stack space
    
//  MakeOld_stub_volatile_register_sp_offset = LinkageArea_size/oopSize + num_outgoing_args
 
// frsize  = (MakeOld_stub_volatile_register_sp_offset + NumRcvrAndArgRegisters + NumLocalNonVolRegisters + 2 /* might need _Perform selector & del */) * oopSize

// frsize = round(frsize, alignment_of_C_sp)    // round up to quadword

# if !defined(SIC_COMPILER)
   start_exported_function MakeOld
   hlt
# endif

start_exported_function MakeOld_stub
   // (Note: two PCs on stack: orig ret addr, and stub's ret addr    
   
                popl Temp1 // keep stack aligned, save regpc here
                
                enter $0, $0 // note already pushd 2, will push 2 + 5, total 9, need 3 push 3 zeros below
                
                pushl PerformSelectorLoc
                pushl PerformDelegateeLoc         
                
                pushl $0 // keep frame clean for GC
                pushl $0 
                pushl $0
                 // setup args for MakeOld
                 
                pushl Temp1
                pushl $0 // no DI
                pushl 8(%ebp)
                pushl %ebp // lookup frame
                pushl 4(%ebp)
                
                .globl C_SYM(MakeOld)
                call   C_SYM(MakeOld)
start_exported_function MakeOld_stub_returnPC // for stack-walking
                
                // returns entry point
                movl -4(%ebp), PerformSelectorLoc
                movl -8(%ebp), PerformDelegateeLoc
                leave
                jmp_reg %eax
  
// ======================================================================================  



// ReturnTrap: return pointer is patched to me. I save registers and
// call HandleReturnTrap. Must look like an inline cache.
// Well, actually this may not be strictly necessary, but it guards
// against misusing the ret pc.

// Also for Intel, PrimCallReturnTrap is the same



// DUPLICATED in frame_format_i386.hh

dummy:             hlt

                   align_send_desc_call_rm
                   call  dummy // dummy
start_exported_function ReturnTrap
start_exported_function PrimCallReturnTrap          
                   jmp_label    rt2         // XXXintel may not need this if do it like sparc
                  .long 0                       // reg mask  XXXintel not needed
rt_NLR_pc:
                  jmp_label ReturnTrap_beyond_for_NLR // XXXintel could be short inst if fix sendDesc offsets
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for nmlns
                  .long 0                       // placeholder for selector
                  .long 0                       // placeholder for StaticNormalLookupType
                  .long 0                       // placeholder for delegatee 

start_exported_function ReturnTrap2
rt2:                     
                  pushl $ C_SYM(ReturnTrap) // put back return PC for VM
                  enter $0, $0
                  pushl $0 // padding
                  pushl $0 // nlrHomeID
                  pushl $0 // nlrHome
                  pushl $0 // nlr
ReturnTrap_merge:
                  pushl %ebp
                  pushl %eax
                  .globl C_SYM(HandleReturnTrap)
                  call   C_SYM(HandleReturnTrap)
start_exported_function ReturnTrap_returnPC
start_exported_function ReturnTrapNLR_returnPC
                  hlt // no return
                  
ReturnTrap_beyond_for_NLR:
                  pushl $ C_SYM(ReturnTrap) // put back return PC for VM vs. rt_NLR_pc
                  enter $0, $0
                  pushl $0 // padding
                  pushl NLRHomeIDReg
                  pushl NLRHomeReg
                  pushl $1 // nlr
                  jmp ReturnTrap_merge                  
                  
 
// ======================================================================================  



// ProfilerTrap: return pointer is patched to me. I save registers and
// call HandleProfilerTrap. Must look like an inline cache.
// Well, actually this may not be strictly necessary, but it guards
// against misusing the ret pc.




start_exported_function ProfilerTrap
hlt


// ==============================


// maybe do not need this

start_exported_function FlushInstruction
      movl 4(%esp), %eax
      //       clflush (%eax): as generates sfence!
      // 0f ae/7
      clflush (%eax)
      ret


// =========================================

// implement write system call lib routine

/*
start_exported_function WRITE
  li r0, 4
   sc
  blr
  blr
*/



// ====================================================================
 // Recompile_stub: called when a normal method''s counter overflows.  called by a 
 // NIC nmethod or PIC.  caller must store its link register (which contains the
 // sendDesc) into Temp2 AND save it on the frame.  it must then jump AND link to us, 
 // so that the link register contains the nmethod/stub.  see CodeGen::checkRecompilation.
 // it's ugly but i couldn't find a better way.    -mabdelmalek 12/02
 // see comment on SendMessage_stub on why we save the non-volatile registers
 
 // Intel: just push pc in called nmethod onto stack -- dmu 4/06
 
# if !defined(SIC_COMPILER)
   start_exported_function Recompile
   hlt
# endif 


  
                               
start_exported_function Recompile_stub

                  popl Temp1 // ptr into callee
                  enter $4, $0 // create frame, already pushed 2 words, will be pushing 5 more total 7 need one pad
                  pushl Temp1  // the nmethod whose count overflowed
                  pushl $0    // no DI
                  pushl 8(%ebp)   // receiver
                  pushl %ebp   // lookup frame
                  pushl 4(%ebp) // the inline cache that called the overflowing method
                 
                 .globl C_SYM(Recompile)
                 call   C_SYM(Recompile)
                 
                 // returns entry point                 
start_exported_function Recompile_stub_returnPC // for stack-walking
                 leave
                 jmp_reg CResultReg

                 
start_exported_function swap_bytes
  movl 4(%esp), %ecx
  movl 0(%ecx), %eax
  bswap %eax
  movl %eax, 0(%ecx)
  ret
# endif // TARGET_ARCH == I386_ARCH
