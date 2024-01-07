# ifdef __i386__
# // Sun-$Revision: 1.6 $

#/* Copyright 1992-2012 AUTHORS.
#   See the LICENSE file for license information. */

# // some integer primitives


#  // .include "../../src/i386/runtime/asmDefs_gcc_i386.hh"
# include "asmDefs_gcc_i386.hh"


        // C calling convention for prims for now
        .globl  C_SYM(VMString)
#define ret_prim_error(error_code)                \
        leal    C_SYM(VMString), %eax           ; \
        movl    error_code(%eax), %eax          ; \
        addl    $(Mark_Tag - Mem_Tag), %eax     ; \
        ret // do not cut back stack on failure; need to save the fail block

ret_bad_type: ret_prim_error(badTypeOffset)
ret_overflow: ret_prim_error(overflowOffset)



#define setup_arith_prim(name, rcreg, argreg)     \
  start_exported_function(name)                 ; \
        movl    8(%esp), argreg                 ; \
        testl   $(Tag_Mask), argreg             ; \
        jne     ret_bad_type                    ; \
        movl    4(%esp), rcreg                  ; \
        testl   $(Tag_Mask), rcreg              ; \
        jne     ret_bad_type


setup_arith_prim(smi_add_prim, %eax, %ecx)
        addl %ecx, %eax
        jo ret_overflow
        ret
        end_exported_function(smi_add_prim)


setup_arith_prim(smi_sub_prim, %eax, %ecx)
        subl %ecx, %eax
        jo ret_overflow
        ret
        end_exported_function(smi_sub_prim)


setup_arith_prim(smi_mul_prim, %eax, %ecx)
       sarl  $ Tag_Size, %ecx
       imul  %ecx, %eax
       jo ret_overflow
       ret
       end_exported_function(smi_mul_prim)


setup_arith_prim(smi_and_prim, %eax, %ecx)
       andl %ecx, %eax
       ret
       end_exported_function(smi_and_prim)


setup_arith_prim(smi_or_prim, %eax, %ecx)
       orl %ecx, %eax
       ret
       end_exported_function(smi_or_prim)


setup_arith_prim(smi_xor_prim, %eax, %ecx)
       xorl %ecx, %eax
       ret
       end_exported_function(smi_xor_prim)


start_exported_function(smi_complement_prim)
       movl 4(%esp), %eax
       testl $ Tag_Mask, %eax
       jne   ret_bad_type
       xorl  $~Tag_Mask, %eax
       ret
       end_exported_function(smi_complement_prim)


setup_arith_prim(smi_arithmetic_shift_left_prim, %eax, %ecx)
       movl %eax, %ebx
       sarl  $ Tag_Size, %ecx
       sall  %cl, %eax
       xorl  %eax, %ebx
       jl   ret_overflow
       ret
       end_exported_function(smi_arithmetic_shift_left_prim)


setup_arith_prim(smi_logical_shift_left_prim, %eax, %ecx)
       sarl  $ Tag_Size, %ecx
       shll  %cl, %eax
       ret
       end_exported_function(smi_logical_shift_left_prim)


setup_arith_prim(smi_arithmetic_shift_right_prim, %eax, %ecx)
       sarl  $ Tag_Size, %ecx
       sarl  %cl, %eax
       andl  $~Tag_Mask, %eax
       ret
       end_exported_function(smi_arithmetic_shift_right_prim)


setup_arith_prim(smi_logical_shift_right_prim, %eax, %ecx)
       sarl  $ Tag_Size, %ecx
       shrl  %cl, %eax
       andl  $~Tag_Mask, %eax
       ret
       end_exported_function(smi_logical_shift_right_prim)

# endif // TARGET_ARCH == I386_ARCH
