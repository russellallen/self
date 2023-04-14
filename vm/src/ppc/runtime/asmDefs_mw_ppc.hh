# if defined(__ppc__) || defined(__powerpc__)
#/* Sun-$Revision: 30.9 $ */

#/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
#   See the LICENSE file for license information. */

# global defs

first_nonvol_fpr        equ 14
end_nonvol_fpr          equ 32
size_of_fpr             equ 8
size_of_fpr_log         equ 3
alignment_of_fpr        equ 8
  
size_of_gpr             equ  4
oopSize                 equ  4

alignment_of_lsmul_top  equ 16
alignment_of_lsmul_top_log      equ 4
alignment_of_sp         equ 16

 
rcv     equ     r3
arg     equ     r4

arg0    equ     r3
arg1    equ     r4
arg2    equ     r5
arg3    equ     r6
arg4    equ     r7
arg5    equ     r8
arg6    equ     r9
arg7    equ     r10


result  equ     r3

NumRcvrAndArgRegisters equ 8 ; r3 - r10, need to leave this much stack space for unknown C routines


smiMask equ     3

; This whole group is DUPLICATED in regs_ppc.h
; AND Wired in! to EnterSelf
NLRHomeIDReg    equ     R5
NLRHomeReg      equ     R4
NLRResultReg    equ     R3

Temp1   equ     r11; 
Temp2   equ     r12; 

LowestNonVolReg      equ R13; 
ByteMapBaseReg       equ R13;
SPLimitReg           equ R14;
LowestLocalNonVolReg equ R15;
HighestNonVolReg     equ R31; 
NumNonVolRegisters        equ HighestNonVolReg - LowestNonVolReg      + 1; 
NumLocalNonVolRegisters   equ HighestNonVolReg - LowestLocalNonVolReg + 1; 
NumGlobalNonVolRegisters  equ LowestLocalNonVolReg - LowestNonVolReg;

DICountReg      equ     R0
DILinkReg       equ     Temp1
DITempReg       equ     Temp2
    
    
; DUPLICATED in frame_format_ppc.hh
PerformSelectorLoc_sp_offset  equ  -4
PerformDelegateeLoc_sp_offset equ  -8


  
  # WARNING THIS IS DUPLICATED IN sendDesc.h , offsets are relative to ret pc
  
non_local_return_offset  equ  8 ; offset of NLR instruction from call


#---------------------------------------------------------


;       must put .name[pr] in the code to define it

        MACRO # export a code location in another csect, name is the func name, no dot or brackets
        export_code_symbol     &name, &val
        export   &name[tc]
        export   &name[ds]
        toc
        tc      &name[tc], &name[ds]
        csect   &name[ds]
        dc.l    &val
        dc.l    TOC[tc0]
        endm
        
 
        MACRO # prologue for a func I define, name is the func name, no dot or brackets
        start_exported_func     &name
        export_code_symbol      &name, .&name[pr]
        export  .&name[pr]
        csect   .&name[pr]
        endm
        
                # import a func, extname is the func name (no dot) 
                # intname is rtoc rel label of word holding its addr
                MACRO 
                import_func     &extname, &intname
                import .&extname[pr]
                toc
&intname:       tc      &extname[tc], &extname[ds]
                csect   &extname[ds]
                dc.l    .&extname[pr]
                dc.l    TOC[tc0]                
                ENDM    

                # import data, extname is the data name (no dot) 
                # intname is rtoc rel label of word holding its addr
                MACRO 
                import_data     &extname, &intname
                import &extname[rw]
                toc
&intname:       tc      &extname[tc], &extname[rw]
                csect   &extname[ds]
                ENDM    
        
LinkageArea     record
savedSP         ds.l 1
savedCR         ds.l 1
savedPC         ds.l 1
moreUnk         ds.b 20 - * ; total must be 24, rtoc at 20
savedRTOC       ds.l 1
size            equ *
                endr


primitiveFailedOffset   equ 4
badTypeOffset           equ 8
divisionByZeroOffset    equ 16
overflowOffset          equ 20

Int_Tag         equ 0
Mem_Tag         equ 1
Float_Tag       equ 2
Mark_Tag        equ 3

; =====================================================
           import_func Untested_Stub, usf
           
           MACRO # call untested DOES NOT QUITE WORK
           Untested  &string, &tmp
           b @past
 @the_string: dc &string
            dc 0
 @past:     mflr R0
            lwz  &tmp, usf(rtoc)
            lwz  &tmp, 0(&tmp)
            mtctr &tmp
            bctrl 
            dc.l @the_string
            mtlr R0
            ENDM
            
# endif // __ppc__
