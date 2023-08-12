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
ok2:    mov     ireceiver, receiver
        call    .mul
        sra     iarg1, Tag_Size, arg1
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
