/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


! some integer primitives

# include "_asmPrims_sparc.S.incl"

.global smi_add_prim, smi_sub_prim, smi_mul_prim
.global smi_complement_prim
.global smi_and_prim, smi_xor_prim
.global smi_or_prim
.global smi_arithmetic_shift_left_prim
.global smi_logical_shift_left_prim
.global smi_arithmetic_shift_right_prim
.global smi_logical_shift_right_prim

.global breakpoint_prim, gdb_breakpoint

.global VMString


#define arith(rcv, arg, do)                                                   \
        do      rcv, arg, t;                                                  \
        bvs,a   whichError;                                                  \
        or      rcv, arg, t;                                                  \
        retl;                                                                 \
        mov     t, result

smi_add_prim: arith(receiver, arg1, taddcc)
smi_sub_prim: arith(receiver, arg1, tsubcc)

whichError:
        andcc   t, Tag_Mask, t
        cmp     t, 0
        bne,a   handleError
        mov     badTypeOffset, arg1
        mov     overflowOffset, arg1
handleError:                    /* arg1 = offset into VMString array */
        sethi   %hi(VMString), result
        or      result, %lo(VMString), result
        ld      [result + arg1], result /* fetch error string */
        retl
        add     result, Mark_Tag - Mem_Tag, result      /* markify result */

smi_mul_prim:
        andcc   receiver, Tag_Mask, %g0
        beq,a   ok1
        andcc   arg1, Tag_Mask, %g0
        ba      handleError
        mov     badTypeOffset, arg1
ok1:    beq,a   ok2
        save    %sp, (16 + 8) * -4, %sp
        ba      handleError
        mov     badTypeOffset, arg1
ok2:
#if __sparc_v8__ || __sparc_v9__
        sra     iarg1, Tag_Size, arg1
        smul    ireceiver, %o1, %o0
        rd      %y, %o1         /* like .mul */
#else
        mov     ireceiver, receiver
        call    .Lmul           /* NB: local copy below */
        sra     iarg1, Tag_Size, arg1
#endif
        sethi   %hi(0x80000000), %g1
        andcc   %o0, %g1, %g0      /* test sign bit of lower part of result */
        beq,a   upper
        subcc   %o1, %g0, %g0      /* test high word of 64bit result */
        sethi   %hi(0xffffffff), %g1
        or      %g1, %lo(0xffffffff), %g1
        subcc   %o1, %g1, %g0
upper:  beq,a   done
        mov     %o0, iresult

        sethi   %hi(VMString), iresult
        or      iresult, %lo(VMString), iresult
        ld      [iresult + overflowOffset], iresult    /* fetch error string */
        add     iresult, Mark_Tag - Mem_Tag, iresult    /* markify result */

done:   ret
        restore

smi_complement_prim:
        andcc   receiver, Tag_Mask, %g0
        bz      1f
        nop
        ba      handleError
        mov     badTypeOffset, arg1
1:      retl
        xor     receiver, intMask, result


#define typetest2(rcvr, arg)                                                  \
        or      rcvr, arg, t;                                                 \
        andcc   t, Tag_Mask, t;                                               \
        cmp     t, 0;                                                         \
        bne,a   handleError;                                                  \
        mov     badTypeOffset, arg1;                                          \


#define bitwise(op, arg)                                                      \
        typetest2(receiver,arg);                                              \
        retl;                                                                 \
        op      receiver, arg, result

smi_and_prim: bitwise(and, arg1)
smi_or_prim: bitwise(or, arg1)
smi_xor_prim: bitwise(xor, arg1)


smi_arithmetic_shift_left_prim:
        typetest2(receiver, arg1)
        sra     arg1, Tag_Size, t
        sll     receiver, t, t
        xorcc   receiver, t, %g0
        bge,a   2f
        mov     t, result
        ba      handleError
        mov     overflowOffset, arg1
2:      retl
        nop

smi_logical_shift_left_prim:
        typetest2(receiver, arg1)
        sra     arg1, Tag_Size, t
        retl
        sll     receiver, t, receiver

#define shift(op)                                                             \
        typetest2(receiver,arg1);                                             \
        sra     arg1, Tag_Size, t;                                            \
        op      receiver, t, receiver;                                        \
        retl;                                                                 \
        and     receiver, intMask, result

smi_arithmetic_shift_right_prim: shift(sra)
smi_logical_shift_right_prim: shift(srl)


the_gdb_breakpoint:
        save    %sp, (16 + 8) * -4, %sp
        mov     %g0, %o7        ! prevent gdb from screwing up
                                ! (without this, it may think this frame is
                                ! a Self frame)
gdb_breakpoint:
        nop
        nop
        ret
        restore

breakpoint_prim:
        save    %sp, (16 + 8) * -4, %sp ! make new register window
        ! The call is needed to print the Self stack in gdb, including
        ! the last frame.
        call    the_gdb_breakpoint
        mov     %i0, %o0
        ret
        restore

#if !__sparc_v8__ && !__sparc_v9__
/*
 * FIXME: NetBSD v8 .mul stub in lib/libarch/sparc/v8/sparc_v8.S
 * doesn't follow .mul ABI.  .mul returns the upper half in %o1, but
 * the real smul instruction (in the v8 stub) returns it in %y.
 *
 * Copy .mul from common/lib/libc/arch/sparc/gen/mul.S here:
 *
 * Signed multiply, from Appendix E of the Sparc Version 8
 * Architecture Manual.
 *
 * Returns %o0 * %o1 in %o1%o0 (i.e., %o1 holds the upper 32 bits of
 * the 64-bit product).
 *
 * This code optimizes short (less than 13-bit) multiplies.
 */
.Lmul:
	mov	%o0, %y		! multiplier -> Y
	andncc	%o0, 0xfff, %g0	! test bits 12..31
	be	.Lmul_shortway	! if zero, can do it the short way
	andcc	%g0, %g0, %o4	! zero the partial product and clear N and V

	/*
	 * Long multiply.  32 steps, followed by a final shift step.
	 */
	mulscc	%o4, %o1, %o4	! 1
	mulscc	%o4, %o1, %o4	! 2
	mulscc	%o4, %o1, %o4	! 3
	mulscc	%o4, %o1, %o4	! 4
	mulscc	%o4, %o1, %o4	! 5
	mulscc	%o4, %o1, %o4	! 6
	mulscc	%o4, %o1, %o4	! 7
	mulscc	%o4, %o1, %o4	! 8
	mulscc	%o4, %o1, %o4	! 9
	mulscc	%o4, %o1, %o4	! 10
	mulscc	%o4, %o1, %o4	! 11
	mulscc	%o4, %o1, %o4	! 12
	mulscc	%o4, %o1, %o4	! 13
	mulscc	%o4, %o1, %o4	! 14
	mulscc	%o4, %o1, %o4	! 15
	mulscc	%o4, %o1, %o4	! 16
	mulscc	%o4, %o1, %o4	! 17
	mulscc	%o4, %o1, %o4	! 18
	mulscc	%o4, %o1, %o4	! 19
	mulscc	%o4, %o1, %o4	! 20
	mulscc	%o4, %o1, %o4	! 21
	mulscc	%o4, %o1, %o4	! 22
	mulscc	%o4, %o1, %o4	! 23
	mulscc	%o4, %o1, %o4	! 24
	mulscc	%o4, %o1, %o4	! 25
	mulscc	%o4, %o1, %o4	! 26
	mulscc	%o4, %o1, %o4	! 27
	mulscc	%o4, %o1, %o4	! 28
	mulscc	%o4, %o1, %o4	! 29
	mulscc	%o4, %o1, %o4	! 30
	mulscc	%o4, %o1, %o4	! 31
	mulscc	%o4, %o1, %o4	! 32
	mulscc	%o4, %g0, %o4	! final shift

	! If %o0 was negative, the result is
	!	(%o0 * %o1) + (%o1 << 32))
	! We fix that here.

	tst	%o0
	bge	1f
	rd	%y, %o0

	! %o0 was indeed negative; fix upper 32 bits of result by subtracting 
	! %o1 (i.e., return %o4 - %o1 in %o1).
	retl
	sub	%o4, %o1, %o1

1:
	retl
	mov	%o4, %o1

.Lmul_shortway:
	/*
	 * Short multiply.  12 steps, followed by a final shift step.
	 * The resulting bits are off by 12 and (32-12) = 20 bit positions,
	 * but there is no problem with %o0 being negative (unlike above).
	 */
	mulscc	%o4, %o1, %o4	! 1
	mulscc	%o4, %o1, %o4	! 2
	mulscc	%o4, %o1, %o4	! 3
	mulscc	%o4, %o1, %o4	! 4
	mulscc	%o4, %o1, %o4	! 5
	mulscc	%o4, %o1, %o4	! 6
	mulscc	%o4, %o1, %o4	! 7
	mulscc	%o4, %o1, %o4	! 8
	mulscc	%o4, %o1, %o4	! 9
	mulscc	%o4, %o1, %o4	! 10
	mulscc	%o4, %o1, %o4	! 11
	mulscc	%o4, %o1, %o4	! 12
	mulscc	%o4, %g0, %o4	! final shift

	/*
	 *  %o4 has 20 of the bits that should be in the low part of the
	 * result; %y has the bottom 12 (as %y's top 12).  That is:
	 *
	 *	  %o4		    %y
	 * +----------------+----------------+
	 * | -12- |   -20-  | -12- |   -20-  |
	 * +------(---------+------)---------+
	 *  --hi-- ----low-part----
	 *
	 * The upper 12 bits of %o4 should be sign-extended to form the
	 * high part of the product (i.e., highpart = %o4 >> 20).
	 */

	rd	%y, %o5
	sll	%o4, 12, %o0	! shift middle bits left 12
	srl	%o5, 20, %o5	! shift low bits right 20, zero fill at left
	or	%o5, %o0, %o0	! construct low part of result
	retl
	sra	%o4, 20, %o1	! ... and extract high part of result
#endif /* !__sparc_v8__ && !__sparc_v9__ */
