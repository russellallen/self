# if 0 // skip for unix
; // Sun-$Revision: 30.9 $

;/* Copyright 1992-2012 AUTHORS.
;   See the LICENSE file for license information. */


; some integer primitives

 include 'asmDefs_mw_ppc.hh'

 import_data VMString, vms


        Macro
        ret_prim_error  &error_code
        lwz             r3, vms(RTOC) ; get VMString
        lwz             r3, &error_code(r3)
        addi            r3, r3, Mark_Tag - Mem_Tag
        blr
        endM
        

        MACRO
        arith_prim &name, &opcode
        start_exported_func     &name   
        or      r0, rcv, arg
        andi.   r0, r0, smiMask
        bz      @ok
        ret_prim_error badTypeOffset
@ok:    mcrxr   0 ; clear sum ovfl bit
        &opcode rcv, rcv, arg
        bnslr
        ret_prim_error overflowOffset
        ENDM
        
        arith_prim smi_add_prim, addo.
        arith_prim smi_sub_prim, subo.
        
          
        start_exported_func     smi_mul_prim
        
        or      r0, rcv, arg
        andi.   r0, r0, smiMask
        bz      @ok
        ret_prim_error badTypeOffset
@ok:    srawi   arg, arg, 2 ; shift out tag
        mcrxr   0 ; clear sum ovfl bit
        mullwo. rcv, rcv, arg
        bnslr
        ret_prim_error overflowOffset
        

          MACRO
          log_prim &name, &opcode
          start_exported_func &name
          or    r0, rcv, arg
          andi. r0, r0, smiMask
          bz    @ok
          ret_prim_error badTypeOffset
@ok:      &opcode rcv, rcv, arg
          blr
          ENDM
          
          
          log_prim smi_and_prim, and
          log_prim smi_or_prim,   or
          log_prim smi_xor_prim, xor
          
          
                                start_exported_func smi_complement_prim
                                andi.     r0, rcv, smiMask
                                bz        @smi_complement_prim_ok
                                ret_prim_error badTypeOffset
@smi_complement_prim_ok:        not       r3, r3
                                li        r0, smiMask
                                andc    r3, r3, r0
                                blr

                                        start_exported_func smi_arithmetic_shift_left_prim      
                                        or      r0, rcv, arg
                                        andi.   r0, r0, smiMask
                                        bz      @smi_arithmetic_shift_left_prim_ok
                                        ret_prim_error badTypeOffset
@smi_arithmetic_shift_left_prim_ok:     srawi   arg, arg, 2 ; shift out tag
                                        mr      r5, rcv
                                        slw.    rcv, rcv, arg
                                        xor.    r5, r5, rcv ; see if sign bit changed
                                        bgelr
                                        ret_prim_error overflowOffset
        
        Macro
        simple_shift_prim &name, &opcode
        start_exported_func &name       
        or      r0, rcv, arg
        andi.   r0, r0, smiMask
        bz      @ok
        ret_prim_error badTypeOffset
@ok:    srawi   arg, arg, 2 ; shift out tag
        &opcode rcv, rcv, arg
        ENDM
        
        simple_shift_prim smi_logical_shift_left_prim, slw
        blr
        
        simple_shift_prim smi_logical_shift_right_prim, srw
        li     Temp1, ~smiMask; need to mask tag bits on right shift
        and    rcv, rcv, Temp1
        blr
        
        simple_shift_prim smi_arithmetic_shift_right_prim, sraw
        li     Temp1, ~smiMask; need to mask tag bits on right shift
        and    rcv, rcv, Temp1
        blr
        
        end
# endif
