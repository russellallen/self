# ifdef __i386__
# // Sun-$Revision: 1.6 $

#/* Copyright 1992-2012 AUTHORS.
#   See the LICENSE file for license information. */

# // some integer primitives


#  // .include "../../src/i386/runtime/asmDefs_gcc_i386.hh"
# include "asmDefs_gcc_i386.hh"


        // C calling convention for prims for now
        MACRO(ret_prim_error, error_code)
            .globl C_SYM(VMString)
            leal   C_SYM(VMString), %eax
        
        # if defined(__APPLE__) \
         || (defined(__linux__) && defined(__clang__) && !defined(NO_INTEGRATED_AS_clang))
            movl   $0(%eax), %eax
        
        # elif defined(__linux__) || (defined(SOLARIS) && SOLARIS)
            movl   \error_code(%eax), %eax
        
        # else
          # error what?
        # endif
        
           addl   $(Mark_Tag - Mem_Tag), %eax
            ret    // do not cut back stack on failure; need to save the fail block
        ENDMACRO
        
  
ret_bad_type: ret_prim_error badTypeOffset
ret_overflow: ret_prim_error overflowOffset  
         
        MACRO(setup_arith_prim, name rcreg argreg)
        # if defined(__APPLE__) \
        || (defined(__linux__) && defined(__clang__) && !defined(NO_INTEGRATED_AS_clang))
            start_exported_function $0
             movl    8(%esp), $2
             testl   $(Tag_Mask), $2
             jne     ret_bad_type
             movl    4(%esp), $1
             testl   $(Tag_Mask), $1
             jne     ret_bad_type
        # elif defined(__linux__) || (defined(SOLARIS) && SOLARIS)
            start_exported_function \name
             movl    8(%esp), \argreg
             testl   $(Tag_Mask), \argreg
             jne     ret_bad_type
             movl    4(%esp), \rcreg
             testl   $(Tag_Mask), \rcreg
             jne     ret_bad_type
        # else
          # error what?
        # endif
        ENDMACRO
        
        setup_arith_prim smi_add_prim, %eax, %ecx
        addl %ecx, %eax
        jo ret_overflow
        ret

        setup_arith_prim smi_sub_prim, %eax, %ecx
        subl %ecx, %eax
        jo ret_overflow
        ret

       setup_arith_prim smi_mul_prim, %eax, %ecx
       sarl  $ Tag_Size, %ecx
       imul  %ecx, %eax
       jo ret_overflow
       ret

       setup_arith_prim smi_and_prim, %eax, %ecx
       andl %ecx, %eax
       ret

       setup_arith_prim smi_or_prim, %eax, %ecx
       orl %ecx, %eax
       ret

       setup_arith_prim smi_xor_prim, %eax, %ecx
       xorl %ecx, %eax
       ret
        
       start_exported_function smi_complement_prim
       movl 4(%esp), %eax
       testl $ Tag_Mask, %eax
       jne   ret_bad_type
       xorl  $~Tag_Mask, %eax
       ret
      
       setup_arith_prim  smi_arithmetic_shift_left_prim, %eax, %ecx
       movl %eax, %ebx
       sarl  $ Tag_Size, %ecx
       sall  %cl, %eax
       xorl  %eax, %ebx
       jl   ret_overflow
       ret
      
       setup_arith_prim  smi_logical_shift_left_prim, %eax, %ecx
       sarl  $ Tag_Size, %ecx
       shll  %cl, %eax
       ret
      
       setup_arith_prim  smi_arithmetic_shift_right_prim, %eax, %ecx
       sarl  $ Tag_Size, %ecx
       sarl  %cl, %eax
       andl  $~Tag_Mask, %eax
       ret
      
       setup_arith_prim  smi_logical_shift_right_prim, %eax, %ecx
       sarl  $ Tag_Size, %ecx
       shrl  %cl, %eax
       andl  $~Tag_Mask, %eax
       ret
 
# endif // TARGET_ARCH == I386_ARCH
