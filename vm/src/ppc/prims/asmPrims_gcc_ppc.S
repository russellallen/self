# if defined(__ppc__) || defined(__powerpc__)
// Sun-$Revision: 30.7 $

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

/* remove me from MW project when compiling under MW */

// some integer primitives


//  .include "../../src/ppc/runtime/asmDefs_gcc_ppc.hh"
# include "asmDefs_gcc_ppc.hh"



#define ret_prim_error(error_code)		  \
	import_data_address(r3, VMString)	; \
	lwz	r3, error_code(r3)		; \
	addi	r3, r3, Mark_Tag - Mem_Tag	; \
	blr


#define arith_prim(name, opcode)	  \
    start_exported_function(name)	; \
	or	r0, rcv, arg		; \
	andi.	r0, r0, Tag_Mask	; \
	beq	name ## _OK		; \
	ret_prim_error(badTypeOffset)	; \
name ## _OK:				  \
	/* clear sum ovfl bit */	  \
	mcrxr	0			; \
        opcode	rcv, rcv, arg	; \
        bnslr				; \
        ret_prim_error(overflowOffset)

arith_prim(smi_add_prim, addo. )
arith_prim(smi_sub_prim, subo. )
  
        
start_exported_function(smi_mul_prim)
        or      r0, rcv, arg
        andi.   r0, r0, Tag_Mask
        beq     smi_mul_prim_OK
        ret_prim_error(badTypeOffset)
smi_mul_prim_OK: 
        srawi   arg, arg, 2	// shift out tag
        mcrxr   0		// clear sum ovfl bit
        mullwo.	rcv, rcv, arg
        bnslr
        ret_prim_error(overflowOffset)
        

#define log_prim(name, opcode)		  \
    start_exported_function(name)	; \
	or	r0, rcv, arg		; \
	andi.	r0, r0, Tag_Mask	; \
	beq	name ## _OK		; \
	ret_prim_error(badTypeOffset)	; \
name ## _OK:				  \
	opcode	rcv, rcv, arg	; \
	blr
          
log_prim(smi_and_prim, and)
log_prim(smi_or_prim,   or)
log_prim(smi_xor_prim, xor)


start_exported_function(smi_complement_prim)
	andi.	r0, rcv, Tag_Mask
	beq	smi_complement_prim_OK
	ret_prim_error(badTypeOffset)
smi_complement_prim_OK: 
	not	r3, r3
	li	r0, Tag_Mask
	andc	r3, r3, r0
	blr

start_exported_function(smi_arithmetic_shift_left_prim)
	or	r0, rcv, arg
	andi.	r0, r0, Tag_Mask
	beq	smi_arithmetic_shift_left_prim_OK
	ret_prim_error(badTypeOffset)
smi_arithmetic_shift_left_prim_OK:
	srawi	arg, arg, 2	// shift out tag
	mr	r5, rcv
	slw.	rcv, rcv, arg
	xor.	r5, r5, rcv	// see if sign bit changed
	bgelr
	ret_prim_error(overflowOffset)


#define simple_shift_prim(name, opcode)	  \
    start_exported_function(name)	; \
	or	r0, rcv, arg		; \
	andi.	r0, r0, Tag_Mask	; \
	beq	1f			; \
	ret_prim_error(badTypeOffset)	; \
1:					  \
	/* shift out tag */		  \
	srawi	arg, arg, 2		; \
	opcode	rcv, rcv, arg

simple_shift_prim(smi_logical_shift_left_prim, slw)
	blr

simple_shift_prim(smi_logical_shift_right_prim, srw)
	li	Temp1, ~Tag_Mask // need to mask tag bits on right shift
	and	rcv, rcv, Temp1
	blr

simple_shift_prim(smi_arithmetic_shift_right_prim, sraw)
	li	Temp1, ~Tag_Mask // need to mask tag bits on right shift
	and	rcv, rcv, Temp1
	blr

# endif // TARGET_ARCH == PPC_ARCH
