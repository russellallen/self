#pragma once
# ifdef __ppc__
// Sun-$Revision: 30.9 $ 

// Copyright 1992-9 Sun Microsystems, Inc. and Stanford University.
//   See the LICENSE file for license information. 

# define round(x, y) (((x) + (y)-1) & ~((y)-1))

// global defs

first_nonvol_fpr        = 14
end_nonvol_fpr          = 32
size_of_fpr             = 8
size_of_fpr_log         = 3
alignment_of_fpr        = 8
  
size_of_gpr             =  4
oopSize                 =  4 // Warning: Duplicated in util.hh

alignment_of_lsmul_top  = 16
alignment_of_lsmul_top_log      = 4
alignment_of_sp         = 16

 
# define sp    r1
# define rtoc  r2

# define rcv r3
# define arg r4

# define arg0   r3
# define arg0No  3
# define arg1   r4
# define arg2   r5
# define arg3   r6
# define arg4   r7
# define arg5   r8
# define arg6   r9
# define arg7   r10


# define result r3

// DUPLICATED in regs_ppc.h
NumRcvrAndArgRegisters = 8 // r3 - r10, need to leave this much stack space for unknown C routines


; This whole group is DUPLICATED in regs_ppc.h
; AND Wired in! to EnterSelf
# define NLRHomeIDReg r5
# define NLRHomeReg   r4
# define NLRResultReg r3

NumNLRRegisters = 3

# define Temp1 r11 
# define Temp2 r12 

# define LowestNonVolReg        r13
# define LowestNonVolRegNo       13
# define ByteMapBaseReg         r13
# define SPLimitReg             r14
# define LowestLocalNonVolReg   r15
# define LowestLocalNonVolRegNo  15
# define HighestNonVolReg       r31
# define HighestNonVolRegNo      31


NumNonVolRegisters        =     HighestNonVolRegNo -      LowestNonVolRegNo + 1
NumLocalNonVolRegisters   =     HighestNonVolRegNo - LowestLocalNonVolRegNo + 1 
NumGlobalNonVolRegisters  = LowestLocalNonVolRegNo -      LowestNonVolRegNo

NonVolRegisterSize = NumNonVolRegisters * size_of_gpr

# define RecompileLinkReg  Temp1
# define RecompileTempReg  Temp2

# define DICountReg r0
# define DILinkReg  Temp1
# define DITempReg  Temp2
    
    
; DUPLICATED in frame_format_ppc.hh
PerformSelectorLoc_sp_offset  =  -(NumLocalNonVolRegisters + 1) * oopSize
PerformDelegateeLoc_sp_offset =  -(NumLocalNonVolRegisters + 2) * oopSize

// WARNING THIS IS DUPLICATED IN sendDesc.h , offsets are relative to ret pc
  
non_local_return_offset  =  8 ; offset of NLR instruction from call


// ---------------------------------------------------------



    .macro start_exported_function // name
    .globl _$0
_$0:
    .endmacro

        .macro load_global_address // temp reg, data symbol
        .globl _$1
        load_addr $0, _$1
        .endmacro
       
        .macro import_data_address // tmp reg, data sym
        load_global_address $0,$1
        .endmacro

        .macro import_function_address // tmpreg, fun sym
        load_global_address $0,$1
        //  huh? (Why was this in mpw version?) lwz    $0, 0($0)                 
        .endmacro
        
// LinkageArea record:
LinkageArea_savedSP = 0
LinkageArea_savedCR = size_of_gpr
LinkageArea_savedPC = 2 * size_of_gpr
LinkageArea_savedRTOC = 20
LinkageArea_size = 24

/* WARNING THIS IS DUPLICATED IN format_ppc.h */
current_pc_offset    = LinkageArea_savedRTOC



primitiveFailedOffset   = 4
badTypeOffset           = 8
divisionByZeroOffset    = 16
overflowOffset          = 20

// Warning: Duplicated in tag.hh
Int_Tag         = 0
Mem_Tag         = 1
Float_Tag       = 2
Mark_Tag        = 3

Tag_Mask        = 3

; =====================================================
            
           // call untested DOES NOT QUITE WORK
           .macro Untested  // &string, &tmp
            b 3f
1:          .asciz $1
2:          _Untested_Stub

3:          mflr r0
            import_function_address $2,Untested_stub
            mtctr $2
            bctrl 
            mtlr r0
            .endmacro
            

    .macro load_addr // targ, val
    addis  $0,  0, hi16($1)
    ori    $0, $0, lo16($1)
    .endmacro

    .macro load_val // targ, val
    addis  $0, 0, ha16($1)
    lwz    $0, lo16($1)
    .endmacro
 
# endif // __ppc__
