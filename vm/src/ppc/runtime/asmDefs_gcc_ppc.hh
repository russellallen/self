# if defined(__ppc__) || defined(__powerpc__)
// Sun-$Revision: 30.9 $ 

// Copyright 1992-9 Sun Microsystems, Inc. and Stanford University.
//   See the LICENSE file for license information. 

#if TARGET_OS_VERSION == NETBSD_VERSION
#define r0  0
#define r1  1
#define r2  2
#define r3  3
#define r4  4
#define r5  5
#define r6  6
#define r7  7
#define r8  8
#define r9  9
#define r10 10
#define r11 11
#define r12 12
#define r13 13
#define r14 14
#define r15 15
#define r16 16
#define r17 17
#define r18 18
#define r19 19
#define r20 20
#define r21 21
#define r22 22
#define r23 23
#define r24 24
#define r25 25
#define r26 26
#define r27 27
#define r28 28
#define r29 29
#define r30 30
#define r31 31

#define f14 14
#define f15 15
#define f16 16
#define f17 17
#define f18 18
#define f19 19
#define f20 20
#define f21 21
#define f22 22
#define f23 23
#define f24 24
#define f25 25
#define f26 26
#define f27 27
#define f28 28
#define f29 29
#define f30 30
#define f31 31

#define ha16(x) x@ha
#define hi16(x) x@h
#define lo16(x) x@l

#endif


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


// This whole group is DUPLICATED in regs_ppc.h
// AND Wired in! to EnterSelf
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
    
    
// DUPLICATED in frame_format_ppc.hh
PerformSelectorLoc_sp_offset  =  -(NumLocalNonVolRegisters + 1) * oopSize
PerformDelegateeLoc_sp_offset =  -(NumLocalNonVolRegisters + 2) * oopSize

// WARNING THIS IS DUPLICATED IN sendDesc.h , offsets are relative to ret pc
  
non_local_return_offset  =  8 // offset of NLR instruction from call


// ---------------------------------------------------------

# if defined(__APPLE__)
  # define C_SYM(name) _##name
# elif defined(__ELF__)
  # define C_SYM(name) name
# else
  # error what?
# endif


#define start_exported_function(name)		\
	.globl C_SYM(name);			\
    C_SYM(name):


#define load_global_address(tmp_reg, data_sym)	\
	.globl C_SYM(data_sym);			\
	load_addr(tmp_reg, C_SYM(data_sym))
       
#define import_data_address(tmp_reg, data_sym)	\
	load_global_address(tmp_reg, data_sym)

#define import_function_address(tmp_reg, fun_sym)	\
	load_global_address(tmp_reg, fun_sym)
	//  huh? (Why was this in mpw version?) lwz    $0, 0($0)

        
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

// =====================================================
            
	// call untested DOES NOT QUITE WORK
#define Untested(string, tmp)				  \
	b 3f						; \
1:	.asciz string					; \
2:	C_SYM(Untested_Stub)				; \
							  \
3:	mflr	r0					; \
	import_function_address(tmp, C_SYM(Untested_stub)); \
	mtctr	tmp					; \
	bctrl						; \
	mtlr	r0
            

#define load_addr(targ, val)		  \
	addis	targ, 0, hi16(val)	; \
	ori	targ, targ, lo16(val)

#define load_val(targ, val)		  \
	addis	targ, 0, ha16(val)	; \
	lwz	targ, lo16(val)
 
# endif // __ppc__
