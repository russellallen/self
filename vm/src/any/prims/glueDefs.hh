 /* Sun-$Revision: 30.15 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


/* This file contains the bulk of C and C++ glue. The top part of this file
   contains the implementation of glue; the glue user may wish to skip to the
   bottom of this file (search for ****) where the glue interface is defined.
   To use glue, include the file "_glueDefs.incl.c".
                                                  Ole Agesen, November 1991.
*/



/*****************************************************************************/
/*****************************************************************************/
/****************************Glue implementation******************************/
/*****************************************************************************/
/*****************************************************************************/




/* General macros. */

/* Pairs. */

# define extract1(a,b)         a
# define extract2(a,b)         b

# ifdef GCC
  // Preprocessor rules changed, ugh! -- dmu 7/03
  # define pick_first(X)         extract1 X
  # define pick_second(X)        extract2 X
# else
  # define pick_first(X)         CONC(extract1,X)
  # define pick_second(X)        CONC(extract2,X)
# endif


/* Triples. */

# define extract1_3(a,b,c)     a
# define extract2_3(a,b,c)     b
# define extract3_3(a,b,c)     c

# ifdef GCC
  // Preprocessor rules changed, ugh! -- dmu 7/03
  # define pick_first_3(X)       extract1_3 X
  # define pick_second_3(X)      extract2_3 X
  # define pick_third_3(X)       extract3_3 X
# else
  # define pick_first_3(X)       CONC(extract1_3,X)
  # define pick_second_3(X)      CONC(extract2_3,X)
  # define pick_third_3(X)       CONC(extract3_3,X)
# endif



/* Definition of meaning of aux when it is a pair or a 3-tuple. */

# define proxy_pntr_type(aux)             pick_first(aux)
# define proxy_type_seal(aux)            (pick_second(aux))

# define proxy_or_errno_pntr_type(aux)    pick_first_3(aux)
# define proxy_or_errno_type_seal(aux)   (pick_second_3(aux))
# define proxy_or_errno_error_value(aux) (pick_third_3(aux))

# define fct_proxy_pntr_type(aux)         pick_first_3(aux)
# define fct_proxy_type_seal(aux)        (pick_second_3(aux))
# define fct_proxy_argc(aux)             (pick_third_3(aux))



/* Common error check. */

# define cnvt_err(error_type, name, type)                                     \
    RETURN(glue_conversion_error(error_type,   ": " STR(name) ", " STR(type)))

# define check_cnvt(i, pred, type)                                            \
    if (!s_arg(i)->pred) cnvt_err(BADTYPEERROR, s_arg(i), type)



/* Asserting return - check for certain kinds of errors in debug version. */

# if GENERATE_DEBUGGING_AIDS
#   define RETURN(oop_value) return CheckAssertions  ?  check_glue_return(oop_value)  :  oop_value;
#else
#   define RETURN(oop_value) return oop_value;
# endif



/* Naming */

# define no_of_args_extension    __glueargc

# define s_arg(i)                CONC(s_arg_,i)
# define s_xtr(i)                CONC(s_xtr_,i)
# define C_arg(i)                CONC(C_arg_,i)
# define C_len(i)                CONC(C_len_,i)

# define no_of_args_var(gfname) XCONC(gfname,no_of_args_extension)




/* Argument conversions. */

/* Oop argument conversion. */

# define any_oop_dclr(i, aux)    oop s_arg(i)
# define any_oop_coun(i, aux)    1
# define any_oop_pass(i, aux)    C_arg(i)
# define any_oop_cnvt(i, aux)    oop C_arg(i) = s_arg(i);


# define     oop_dclr(i, aux)    oop s_arg(i)
# define     oop_coun(i, aux)    1
# define     oop_pass(i, aux)    C_arg(i)

# define     oop_cnvt(i, aux)                                                 \
    check_cnvt(i, CONC(is_,aux)(), aux)                                       \
    CONC(aux,Oop) C_arg(i) = CONC(aux,Oop)(s_arg(i));



/*  ean argument conversions. */

# define bool_dclr(i, aux)   oop s_arg(i)
# define bool_coun(i, aux)   1

# define bool_cnvt(i, aux)                                                    \
    int C_arg(i);                                                             \
    if (s_arg(i) == Memory->trueObj)                                          \
      C_arg(i) = true;                                                        \
    else if(s_arg(i) == Memory->falseObj)                                     \
      C_arg(i) = false;                                                       \
    else                                                                      \
      cnvt_err(BADTYPEERROR, s_arg(i), bool)

# define bool_pass(i, aux)   C_arg(i)


/* Integral argument conversions. */

# define scal_cnvt(i, type, has_ov_check, has_neg_check)                      \
    check_cnvt(i, is_smi(), type)                                             \
    type C_arg(i) = (type) smiOop(s_arg(i))->value();                         \
    if (has_ov_check  &&  as_smiOop(C_arg(i)) != s_arg(i))                    \
      cnvt_err(OVERFLOWERROR, s_arg(i), type)                                 \
    if (has_neg_check  &&  smiOop(s_arg(i))->value() < 0)                     \
      cnvt_err(BADSIGNERROR,  s_arg(i), type)


# define           char_cnvt(i, aux) scal_cnvt(i,          char,  true,  false)
# define    signed_char_cnvt(i, aux) scal_cnvt(i,   signed char,  true,  false)
# define  unsigned_char_cnvt(i, aux) scal_cnvt(i, unsigned char,  true,  true)

# define          short_cnvt(i, aux) scal_cnvt(i,          short, true,  false)
# define   signed_short_cnvt(i, aux) scal_cnvt(i,   signed short, true,  false)
# define unsigned_short_cnvt(i, aux) scal_cnvt(i, unsigned short, true,  true)

# define            int_cnvt(i, aux) scal_cnvt(i,            int, false, false)
# define     signed_int_cnvt(i, aux) scal_cnvt(i,     signed int, false, false)
# define   unsigned_int_cnvt(i, aux) scal_cnvt(i,   unsigned int, false, true)

# define           long_cnvt(i, aux) scal_cnvt(i,           long, false, false)
# define    signed_long_cnvt(i, aux) scal_cnvt(i,    signed long, false, false)
# define  unsigned_long_cnvt(i, aux) scal_cnvt(i,  unsigned long, false, true)

# define  long_long_cnvt(i, aux)                                              \
                         scal_cnvt(i,          long long, false, false)
# define  signed_long_long_cnvt(i, aux)                                       \
                         scal_cnvt(i,   signed long long, false, false)
# define  unsigned_long_long_cnvt(i, aux)                                     \
                         scal_cnvt(i, unsigned long long, false, true)

# define            smi_cnvt(i, aux) scal_cnvt(i,            smi, false, false)
# define   unsigned_smi_cnvt(i, aux) scal_cnvt(i,  /* NB: */ smi, false, true)


# define                char_dclr(i, aux) oop s_arg(i)
# define         signed_char_dclr(i, aux) oop s_arg(i)
# define       unsigned_char_dclr(i, aux) oop s_arg(i)

# define               short_dclr(i, aux) oop s_arg(i)
# define        signed_short_dclr(i, aux) oop s_arg(i)
# define      unsigned_short_dclr(i, aux) oop s_arg(i)

# define                 int_dclr(i, aux) oop s_arg(i)
# define          signed_int_dclr(i, aux) oop s_arg(i)
# define        unsigned_int_dclr(i, aux) oop s_arg(i)

# define                long_dclr(i, aux) oop s_arg(i)
# define         signed_long_dclr(i, aux) oop s_arg(i)
# define       unsigned_long_dclr(i, aux) oop s_arg(i)

# define           long_long_dclr(i, aux) oop s_arg(i)
# define    signed_long_long_dclr(i, aux) oop s_arg(i)
# define  unsigned_long_long_dclr(i, aux) oop s_arg(i)
               
# define                 smi_dclr(i, aux) oop s_arg(i)
# define        unsigned_smi_dclr(i, aux) oop s_arg(i)


# define                char_coun(i, aux) 1
# define         signed_char_coun(i, aux) 1
# define       unsigned_char_coun(i, aux) 1

# define               short_coun(i, aux) 1
# define        signed_short_coun(i, aux) 1
# define      unsigned_short_coun(i, aux) 1

# define                 int_coun(i, aux) 1
# define          signed_int_coun(i, aux) 1
# define        unsigned_int_coun(i, aux) 1

# define                long_coun(i, aux) 1
# define         signed_long_coun(i, aux) 1
# define       unsigned_long_coun(i, aux) 1

# define           long_long_coun(i, aux) 1
# define    signed_long_long_coun(i, aux) 1
# define  unsigned_long_long_coun(i, aux) 1

# define                 smi_coun(i, aux) 1
# define        unsigned_smi_coun(i, aux) 1


# define                char_pass(i, aux) C_arg(i)
# define         signed_char_pass(i, aux) C_arg(i)
# define       unsigned_char_pass(i, aux) C_arg(i)

# define               short_pass(i, aux) C_arg(i)
# define        signed_short_pass(i, aux) C_arg(i)
# define      unsigned_short_pass(i, aux) C_arg(i)

# define                 int_pass(i, aux) C_arg(i)
# define          signed_int_pass(i, aux) C_arg(i)
# define        unsigned_int_pass(i, aux) C_arg(i)

# define                long_pass(i, aux) C_arg(i)
# define         signed_long_pass(i, aux) C_arg(i)
# define       unsigned_long_pass(i, aux) C_arg(i)

# define           long_long_pass(i, aux) C_arg(i)
# define    signed_long_long_pass(i, aux) C_arg(i)
# define  unsigned_long_long_pass(i, aux) C_arg(i)

# define                 smi_pass(i, aux) C_arg(i)
# define        unsigned_smi_pass(i, aux) C_arg(i)



/* float argument conversions */

# define general_float_cnvt(i, type)                                          \
    check_cnvt(i, is_float(), type)                                           \
    type C_arg(i) = floatOop(s_arg(i))->value();

# define       float_cnvt(i, aux) general_float_cnvt(i, float)
# define      double_cnvt(i, aux) general_float_cnvt(i, double)
# define long_double_cnvt(i, aux) general_float_cnvt(i, long double)

# define       float_dclr(i, aux) oop s_arg(i)
# define      double_dclr(i, aux) oop s_arg(i)
# define long_double_dclr(i, aux) oop s_arg(i)

# define       float_coun(i, aux) 1
# define      double_coun(i, aux) 1
# define long_double_coun(i, aux) 1

# define       float_pass(i, aux) C_arg(i)
# define      double_pass(i, aux) C_arg(i)
# define long_double_pass(i, aux) C_arg(i)


/* byte vector and string argument conversions */
/* string conversions copy, bv and cbv do not. bv does not allow canonical
   strings to be passed. Warning: only use cbv conversion if the function
   being called does not modify the argument.  */

# define bv_string(i, with_len, allow_null, copy, ptr_type, allow_canonical)  \
    ptr_type C_arg(i);                                                        \
    int      C_len(i);                                                        \
    /* The cast oop(smiOop_zero) is necessary because of a g++-1.94 bug. */   \
    if (allow_null && s_arg(i) == oop(smiOop_zero)) {                         \
      C_arg(i) = NULL;                                                        \
      C_len(i) = 0;                                                           \
    } else {                                                                  \
      check_cnvt(i, is_byteVector(), ptr_type)                                \
      if (!allow_canonical && s_arg(i)->is_string())                          \
        cnvt_err(BADTYPEERROR, s_arg(i), ptr_type)                            \
      if (copy) {                                                             \
        C_arg(i) = (ptr_type)                                                 \
                   byteVectorOop(s_arg(i))->copy_null_terminated(C_len(i));   \
        if (C_len(i) != byteVectorOop(s_arg(i))->length())                    \
          cnvt_err(NULLCHARERROR, s_arg(i), ptr_type)                         \
         /* This case always sets length, but sometimes it is ignored. */     \
      } else /* No copying. */ {                                              \
        C_arg(i) = (ptr_type)byteVectorOop(s_arg(i))->bytes();                \
        if (with_len) {                                                       \
          C_len(i) = byteVectorOop(s_arg(i))->length() / sizeof(*C_arg(i));   \
          /* first test is an optimization -- dmu & ole */                    \
         if (sizeof(*C_arg(i))          != 1                                  \
          && sizeof(*C_arg(i))*C_len(i) != byteVectorOop(s_arg(i))->length()) \
           cnvt_err(BADSIZEERROR, s_arg(i), ptr_type)                         \
        }                                                                     \
      }                                                                       \
    }


# define              bv_cnvt(i, aux) bv_string(i,false,false,false,aux,false)
# define          bv_len_cnvt(i, aux) bv_string(i,true, false,false,aux,false)
# define         bv_null_cnvt(i, aux) bv_string(i,false,true, false,aux,false)
# define     bv_len_null_cnvt(i, aux) bv_string(i,true, true, false,aux,false)

# define             cbv_cnvt(i, aux) bv_string(i,false,false,false,aux,true)
# define         cbv_len_cnvt(i, aux) bv_string(i,true, false,false,aux,true)
# define        cbv_null_cnvt(i, aux) bv_string(i,false,true, false,aux,true)
# define    cbv_len_null_cnvt(i, aux) bv_string(i,true, true, false,aux,true)

# define          string_cnvt(i, aux) bv_string(i,false,false,true,char*,true)
# define      string_len_cnvt(i, aux) bv_string(i,true, false,true,char*,true)
# define     string_null_cnvt(i, aux) bv_string(i,false,true, true,char*,true)
# define string_len_null_cnvt(i, aux) bv_string(i,true, true, true,char*,true)


# define              bv_dclr(i, aux) oop s_arg(i)
# define          bv_len_dclr(i, aux) oop s_arg(i)
# define         bv_null_dclr(i, aux) oop s_arg(i)
# define     bv_len_null_dclr(i, aux) oop s_arg(i)

# define             cbv_dclr(i, aux) oop s_arg(i)
# define         cbv_len_dclr(i, aux) oop s_arg(i)
# define        cbv_null_dclr(i, aux) oop s_arg(i)
# define    cbv_len_null_dclr(i, aux) oop s_arg(i)

# define          string_dclr(i, aux) oop s_arg(i)
# define      string_len_dclr(i, aux) oop s_arg(i)
# define     string_null_dclr(i, aux) oop s_arg(i)
# define string_len_null_dclr(i, aux) oop s_arg(i)


# define              bv_coun(i, aux) 1
# define          bv_len_coun(i, aux) 1
# define         bv_null_coun(i, aux) 1
# define     bv_len_null_coun(i, aux) 1

# define             cbv_coun(i, aux) 1
# define         cbv_len_coun(i, aux) 1
# define        cbv_null_coun(i, aux) 1
# define    cbv_len_null_coun(i, aux) 1

# define          string_coun(i, aux) 1
# define      string_len_coun(i, aux) 1
# define     string_null_coun(i, aux) 1
# define string_len_null_coun(i, aux) 1


# define              bv_pass(i, aux) C_arg(i)
# define          bv_len_pass(i, aux) C_arg(i), C_len(i)
# define         bv_null_pass(i, aux)     bv_pass(i, aux)
# define     bv_len_null_pass(i, aux) bv_len_pass(i, aux)

# define             cbv_pass(i, aux)     bv_pass(i, aux)
# define         cbv_len_pass(i, aux) bv_len_pass(i, aux)
# define        cbv_null_pass(i, aux)     bv_pass(i, aux)
# define    cbv_len_null_pass(i, aux) bv_len_pass(i, aux)

# define          string_pass(i, aux)     bv_pass(i, aux)
# define      string_len_pass(i, aux) bv_len_pass(i, aux)
# define     string_null_pass(i, aux)     bv_pass(i, aux)
# define string_len_null_pass(i, aux) bv_len_pass(i, aux)



/* proxy argument conversions */

# define ANY_SEAL     the_actual_seal

# define general_proxy_cnvt(i, aux, allow_null)                               \
    proxy_pntr_type(aux) C_arg(i);                                            \
    check_cnvt(i, is_proxy(), aux)                                            \
    if (proxyOop(s_arg(i))->is_live()) {                                      \
      void *the_actual_seal = proxyOop(s_arg(i))->get_type_seal();            \
      if (the_actual_seal != (void*)proxy_type_seal(aux))                     \
        cnvt_err(BADTYPESEALERROR, s_arg(i), aux)                             \
      C_arg(i) = (proxy_pntr_type(aux)) proxyOop(s_arg(i))->get_pointer();    \
      if (!allow_null  &&  C_arg(i) == 0)                                     \
        cnvt_err(NULLPOINTERERROR, s_arg(i), aux)                             \
    } else                                                                    \
      cnvt_err(DEADPROXYERROR, s_arg(i), aux)                                 \


# define      proxy_dclr(i, aux)    oop s_arg(i)
# define      proxy_coun(i, aux)    1
# define      proxy_pass(i, aux)    C_arg(i)
# define      proxy_cnvt(i, aux)    general_proxy_cnvt(i, aux, false)

# define proxy_null_dclr(i, aux)    proxy_dclr(i, aux)
# define proxy_null_coun(i, aux)    proxy_coun(i, aux)
# define proxy_null_pass(i, aux)    proxy_pass(i, aux)
# define proxy_null_cnvt(i, aux)    general_proxy_cnvt(i, aux, true)



/* a polymorphic argument conversion suitable for syscall or lprintf */

# define any_cnvt(i, aux)                                                     \
    aux C_arg(i);                                                             \
    if (s_arg(i)->is_smi()) {                                                 \
      if (!s_xtr(i)->is_smi())                                                \
        cnvt_err(BADTYPEERROR, s_arg(i),                                      \
            any (when first part is smi, second part must be smi))            \
      *(int*)& C_arg(i) = smiOop(s_arg(i))->value()                           \
                        | smiOop(s_xtr(i))->value() << 16;                    \
    } else if (s_arg(i)->is_byteVector()) {                                   \
      if (!s_xtr(i)->is_smi())                                                \
        cnvt_err(BADTYPEERROR, s_arg(i),                                      \
            any (when first part is byte vector, second part must be smi))    \
      smi offset = smiOop(s_xtr(i))->value();                                 \
      if (unsigned(offset) >= byteVectorOop(s_arg(i))->length())              \
        cnvt_err(BADINDEXERROR, s_arg(i), any)                                \
      *(char **)& C_arg(i) = byteVectorOop(s_arg(i))->bytes(offset);          \
    } else if (s_arg(i)->is_float()) {                                        \
      *(float*)& C_arg(i) = floatOop(s_arg(i))->value();                      \
    } else if (s_arg(i)->is_proxy()) {                                        \
      if (!proxyOop(s_arg(i))->is_live())                                     \
        cnvt_err(DEADPROXYERROR, s_arg(i), any)                               \
      *(void **)& C_arg(i) = proxyOop(s_arg(i))->get_pointer();               \
    } else                                                                    \
      cnvt_err(BADTYPEERROR, s_arg(i), any)

# define any_dclr(i, aux) oop s_arg(i),  oop s_xtr(i)
# define any_coun(i, aux) 2
# define any_pass(i, aux) C_arg(i)




/* Calling and failure handling. */

/* This bunch of macros correspond to return types. */

# define                   void_omit_if_void(tokens)
# define                    any_omit_if_void(tokens)       tokens
# define                    oop_omit_if_void(tokens)       tokens
# define                   bool_omit_if_void(tokens)       tokens
# define                   char_omit_if_void(tokens)       tokens
# define            signed_char_omit_if_void(tokens)       tokens
# define          unsigned_char_omit_if_void(tokens)       tokens
# define                  short_omit_if_void(tokens)       tokens
# define           signed_short_omit_if_void(tokens)       tokens
# define         unsigned_short_omit_if_void(tokens)       tokens
# define                    int_omit_if_void(tokens)       tokens
# define             signed_int_omit_if_void(tokens)       tokens
# define           unsigned_int_omit_if_void(tokens)       tokens
# define                   long_omit_if_void(tokens)       tokens
# define            signed_long_omit_if_void(tokens)       tokens
# define          unsigned_long_omit_if_void(tokens)       tokens
# define              long_long_omit_if_void(tokens)       tokens
# define       signed_long_long_omit_if_void(tokens)       tokens
# define     unsigned_long_long_omit_if_void(tokens)       tokens
# define                    smi_omit_if_void(tokens)       tokens
# define           unsigned_smi_omit_if_void(tokens)       tokens
# define                  float_omit_if_void(tokens)       tokens
# define                 double_omit_if_void(tokens)       tokens
# define            long_double_omit_if_void(tokens)       tokens
# define                 string_omit_if_void(tokens)       tokens
# define                  proxy_omit_if_void(tokens)       tokens
# define             proxy_null_omit_if_void(tokens)       tokens
# define         proxy_or_errno_omit_if_void(tokens)       tokens
# define              fct_proxy_omit_if_void(tokens)       tokens
# define         fct_proxy_null_omit_if_void(tokens)       tokens
# define           int_or_errno_omit_if_void(tokens)       tokens
# define   specific_failure_int_omit_if_void(tokens)       tokens
# define   specific_success_int_omit_if_void(tokens)       tokens

# define omit_if_void(cnvt, tokens)  CONC(cnvt,_omit_if_void)(tokens)


typedef class {
 public:
  int     fh_magic;
  bool    failed;  /* Set true if primitive fails. */
  markOop msg;     /* This is where the failure message is stored. */
} failure_handle;

# define FH_MAGIC 115410919


# define     _call_statement(call_exp, cnvt_res, aux_res)                     \
    omit_if_void(cnvt_res, res = ) call_exp;

# define fail_call_statement(call_exp, cnvt_res, aux_res)                     \
    failure_handle the_failure_handle;                                        \
    the_failure_handle.fh_magic = FH_MAGIC;                                   \
    the_failure_handle.failed   = false;         /* Set true on failure. */   \
    omit_if_void(cnvt_res, res =) call_exp;      /* The call.            */   \
    if (the_failure_handle.failed)               /* Check for failure.   */   \
      RETURN(the_failure_handle.msg)             /* Do an error return.  */   \


# define call_stmt(call_exp, cnvt_res, aux_res, fail_opt)                     \
     CONC(fail_opt,_call_statement)(call_exp, cnvt_res, aux_res)





/* Argument declarations for return type */

# define                    any_dclr_res_arg()
# define                    oop_dclr_res_arg()
# define                   void_dclr_res_arg()
# define                   bool_dclr_res_arg()
# define                   char_dclr_res_arg()
# define            signed_char_dclr_res_arg()
# define          unsigned_char_dclr_res_arg()
# define                  short_dclr_res_arg()
# define           signed_short_dclr_res_arg()
# define         unsigned_short_dclr_res_arg()
# define                    int_dclr_res_arg()
# define             signed_int_dclr_res_arg()
# define           unsigned_int_dclr_res_arg()
# define                   long_dclr_res_arg()
# define            signed_long_dclr_res_arg()
# define          unsigned_long_dclr_res_arg()
# define              long_long_dclr_res_arg()
# define       signed_long_long_dclr_res_arg()
# define     unsigned_long_long_dclr_res_arg()
# define                    smi_dclr_res_arg()
# define           unsigned_smi_dclr_res_arg()
# define                  float_dclr_res_arg()
# define                 double_dclr_res_arg()
# define            long_double_dclr_res_arg()
# define                 string_dclr_res_arg()
# define                  proxy_dclr_res_arg() , oop s_arg(res)
# define             proxy_null_dclr_res_arg() , oop s_arg(res)
# define         proxy_or_errno_dclr_res_arg() , oop s_arg(res)
# define              fct_proxy_dclr_res_arg() , oop s_arg(res)
# define         fct_proxy_null_dclr_res_arg() , oop s_arg(res)
# define           int_or_errno_dclr_res_arg()
# define   specific_failure_int_dclr_res_arg()
# define   specific_success_int_dclr_res_arg()

/* Argument declarations for return type */

# define                    oop_dclr_res_arg_nc()
# define                   void_dclr_res_arg_nc()
# define                   bool_dclr_res_arg_nc()
# define                   char_dclr_res_arg_nc()
# define            signed_char_dclr_res_arg_nc()
# define          unsigned_char_dclr_res_arg_nc()
# define                  short_dclr_res_arg_nc()
# define           signed_short_dclr_res_arg_nc()
# define         unsigned_short_dclr_res_arg_nc()
# define                    int_dclr_res_arg_nc()
# define             signed_int_dclr_res_arg_nc()
# define           unsigned_int_dclr_res_arg_nc()
# define                   long_dclr_res_arg_nc()
# define            signed_long_dclr_res_arg_nc()
# define          unsigned_long_dclr_res_arg_nc()
# define              long_long_dclr_res_arg_nc()
# define       signed_long_long_dclr_res_arg_nc()
# define     unsigned_long_long_dclr_res_arg_nc()
# define                    smi_dclr_res_arg_nc()
# define           unsigned_smi_dclr_res_arg_nc()
# define                  float_dclr_res_arg_nc()
# define                 double_dclr_res_arg_nc()
# define            long_double_dclr_res_arg_nc()
# define                 string_dclr_res_arg_nc()
# define                  proxy_dclr_res_arg_nc() oop s_arg(res)
# define             proxy_null_dclr_res_arg_nc() oop s_arg(res)
# define         proxy_or_errno_dclr_res_arg_nc() oop s_arg(res)
# define              fct_proxy_dclr_res_arg_nc() oop s_arg(res)
# define         fct_proxy_null_dclr_res_arg_nc() oop s_arg(res)
# define           int_or_errno_dclr_res_arg_nc()
# define   specific_failure_int_dclr_res_arg_nc()
# define   specific_success_int_dclr_res_arg_nc()


/* Argument count for result arg */

# define                    any_count_res_arg() 0
# define                    oop_count_res_arg() 0
# define                   void_count_res_arg() 0
# define                   bool_count_res_arg() 0
# define                   char_count_res_arg() 0
# define            signed_char_count_res_arg() 0
# define          unsigned_char_count_res_arg() 0
# define                  short_count_res_arg() 0
# define           signed_short_count_res_arg() 0
# define         unsigned_short_count_res_arg() 0
# define                    int_count_res_arg() 0
# define             signed_int_count_res_arg() 0
# define           unsigned_int_count_res_arg() 0
# define                   long_count_res_arg() 0
# define            signed_long_count_res_arg() 0
# define          unsigned_long_count_res_arg() 0
# define              long_long_count_res_arg() 0
# define       signed_long_long_count_res_arg() 0
# define     unsigned_long_long_count_res_arg() 0
# define                    smi_count_res_arg() 0
# define           unsigned_smi_count_res_arg() 0
# define                  float_count_res_arg() 0
# define                 double_count_res_arg() 0
# define            long_double_count_res_arg() 0
# define                 string_count_res_arg() 0
# define                  proxy_count_res_arg() 1
# define             proxy_null_count_res_arg() 1
# define         proxy_or_errno_count_res_arg() 1
# define              fct_proxy_count_res_arg() 1
# define         fct_proxy_null_count_res_arg() 1
# define           int_or_errno_count_res_arg() 0
# define   specific_failure_int_count_res_arg() 0
# define   specific_success_int_count_res_arg() 0


/* Type checks for result argument. */

# define check_res_proxy(is_whatever, whatever)                               \
    check_cnvt(res, is_whatever(), whatever)                                  \
    if (proxyOop(s_arg(res))->is_live())                                      \
      cnvt_err(LIVEPROXYERROR, s_arg(res), aux)

# define check_res_prox  check_res_proxy(is_proxy,       proxy)
# define check_res_fctPr check_res_proxy(is_fctProxy, fctProxy)

# define                    any_check_res_arg()
# define                    oop_check_res_arg()
# define                   void_check_res_arg()
# define                   bool_check_res_arg()
# define                   char_check_res_arg()
# define            signed_char_check_res_arg()
# define          unsigned_char_check_res_arg()
# define                  short_check_res_arg()
# define           signed_short_check_res_arg()
# define         unsigned_short_check_res_arg()
# define                    int_check_res_arg()
# define             signed_int_check_res_arg()
# define           unsigned_int_check_res_arg()
# define                   long_check_res_arg()
# define            signed_long_check_res_arg()
# define          unsigned_long_check_res_arg()
# define              long_long_check_res_arg()
# define       signed_long_long_check_res_arg()
# define     unsigned_long_long_check_res_arg()
# define                    smi_check_res_arg()
# define           unsigned_smi_check_res_arg()
# define                  float_check_res_arg()
# define                 double_check_res_arg()
# define            long_double_check_res_arg()
# define                 string_check_res_arg()
# define                  proxy_check_res_arg() check_res_prox
# define             proxy_null_check_res_arg() check_res_prox
# define         proxy_or_errno_check_res_arg() check_res_prox
# define              fct_proxy_check_res_arg() check_res_fctPr
# define         fct_proxy_null_check_res_arg() check_res_fctPr
# define           int_or_errno_check_res_arg()
# define   specific_failure_int_check_res_arg() 
# define   specific_success_int_check_res_arg() 



/* Preservation of result argument. */

# define pres_res_arg   preserved pres(s_arg(res));

# define                    any_pres_res_arg()
# define                    oop_pres_res_arg()
# define                   void_pres_res_arg()
# define                   bool_pres_res_arg()
# define                   char_pres_res_arg()
# define            signed_char_pres_res_arg()
# define          unsigned_char_pres_res_arg()
# define                  short_pres_res_arg()
# define           signed_short_pres_res_arg()
# define         unsigned_short_pres_res_arg()
# define                    int_pres_res_arg()
# define             signed_int_pres_res_arg()
# define           unsigned_int_pres_res_arg()
# define                   long_pres_res_arg()
# define            signed_long_pres_res_arg()
# define          unsigned_long_pres_res_arg()
# define              long_long_pres_res_arg()
# define       signed_long_long_pres_res_arg()
# define     unsigned_long_long_pres_res_arg()
# define                    smi_pres_res_arg()
# define           unsigned_smi_pres_res_arg()
# define                  float_pres_res_arg()
# define                 double_pres_res_arg()
# define            long_double_pres_res_arg()
# define                 string_pres_res_arg()
# define                  proxy_pres_res_arg() pres_res_arg
# define             proxy_null_pres_res_arg() pres_res_arg
# define         proxy_or_errno_pres_res_arg() pres_res_arg
# define              fct_proxy_pres_res_arg() pres_res_arg
# define         fct_proxy_null_pres_res_arg() pres_res_arg
# define           int_or_errno_pres_res_arg()
# define   specific_failure_int_pres_res_arg() 
# define   specific_success_int_pres_res_arg() 



/* Determination of return type. */

# define                    any_ret_type(dummy, aux)  aux
# define                    oop_ret_type(dummy, aux)  oop
# define                   void_ret_type(dummy, aux)  void
# define                   bool_ret_type(dummy, aux)  bool
# define                   char_ret_type(dummy, aux)  char
# define            signed_char_ret_type(dummy, aux)  signed char
# define          unsigned_char_ret_type(dummy, aux)  unsigned char
# define                  short_ret_type(dummy, aux)  short
# define           signed_short_ret_type(dummy, aux)  signed short
# define         unsigned_short_ret_type(dummy, aux)  unsigned short
# define                    int_ret_type(dummy, aux)  int
# define             signed_int_ret_type(dummy, aux)  signed int
# define           unsigned_int_ret_type(dummy, aux)  unsigned int
# define                   long_ret_type(dummy, aux)  long
# define            signed_long_ret_type(dummy, aux)  signed long
# define          unsigned_long_ret_type(dummy, aux)  unsigned long
# define              long_long_ret_type(dummy, aux)  long long
# define       signed_long_long_ret_type(dummy, aux)  signed long long
# define     unsigned_long_long_ret_type(dummy, aux)  unsigned long long
# define                    smi_ret_type(dummy, aux)  smi
# define           unsigned_smi_ret_type(dummy, aux)  smi   /* Yes. */
# define                  float_ret_type(dummy, aux)  float
# define                 double_ret_type(dummy, aux)  double
# define            long_double_ret_type(dummy, aux)  long double
# define                 string_ret_type(dummy, aux)  char *
# define                  proxy_ret_type(dummy, aux)  proxy_pntr_type(aux)
# define             proxy_null_ret_type(dummy, aux)  proxy_pntr_type(aux)
# define         proxy_or_errno_ret_type(dummy, aux)  proxy_or_errno_pntr_type(aux)
# define              fct_proxy_ret_type(dummy, aux)  fct_proxy_pntr_type(aux)
# define         fct_proxy_null_ret_type(dummy, aux)  fct_proxy_pntr_type(aux)
# define           int_or_errno_ret_type(dummy, aux)  int
# define   specific_failure_int_ret_type(dummy, aux)  int
# define   specific_success_int_ret_type(dummy, aux)  int




/* Return value conversions. */

# define no_ovfl_ret              RETURN(as_smiOop(res))

# define ovfl_ret                                                             \
    if (as_smiOop(res)->value() != res || res > smiOop_max->value())          \
      cnvt_err(OVERFLOWERROR, result, integer)                                \
    RETURN(as_smiOop(res))

# define general_float_ret        RETURN(as_floatOop(res))


# define          bool_ret(dummy, aux)                                        \
    RETURN(res ? Memory->trueObj : Memory->falseObj)

# define                void_ret(dummy, aux)  RETURN(smiOop_zero)
# define                 oop_ret(dummy, aux)  RETURN(res)
# define                 any_ret(dummy, aux)  no_ovfl_ret

# define                char_ret(dummy, aux)  no_ovfl_ret
# define         signed_char_ret(dummy, aux)  no_ovfl_ret
# define       unsigned_char_ret(dummy, aux)  no_ovfl_ret
# define               short_ret(dummy, aux)  no_ovfl_ret
# define        signed_short_ret(dummy, aux)  no_ovfl_ret
# define      unsigned_short_ret(dummy, aux)  no_ovfl_ret
# define                 int_ret(dummy, aux)     ovfl_ret
# define          signed_int_ret(dummy, aux)     ovfl_ret
# define        unsigned_int_ret(dummy, aux)     ovfl_ret
# define                long_ret(dummy, aux)     ovfl_ret
# define         signed_long_ret(dummy, aux)     ovfl_ret
# define       unsigned_long_ret(dummy, aux)     ovfl_ret
# define           long_long_ret(dummy, aux)     ovfl_ret
# define    signed_long_long_ret(dummy, aux)     ovfl_ret
# define  unsigned_long_long_ret(dummy, aux)     ovfl_ret
# define                 smi_ret(dummy, aux)     ovfl_ret
# define        unsigned_smi_ret(dummy, aux)     ovfl_ret

# define               float_ret(dummy, aux)  general_float_ret
# define              double_ret(dummy, aux)  general_float_ret
# define         long_double_ret(dummy, aux)  general_float_ret


# define proxy_null_or_errno_ret(dummy, type_seal)                            \
    proxyOop result = proxyOop(s_arg(res));                                   \
    result->set_pointer((void *)res);                                         \
    result->set_type_seal((void *)type_seal);                                 \
    RETURN(result)

# define proxy_null_ret(dummy, aux)                                           \
    proxy_null_or_errno_ret(dummy, proxy_type_seal(aux))                      \

# define proxy_ret(dummy, aux)                                                \
    if (res) { proxy_null_ret(dummy, aux) }                                   \
    cnvt_err(NULLPOINTERERROR, result, proxy aux)                             \

# define proxy_or_errno_ret(dummy, aux)                                       \
    if (res == proxy_or_errno_error_value(aux))                               \
    RETURN(ErrorCodes::os_prim_error(errno))                                  \
    proxy_null_or_errno_ret(dummy, proxy_or_errno_type_seal(aux))


# define fct_proxy_null_ret(dummy, aux)                                       \
    fctProxyOop result = fctProxyOop(s_arg(res));                             \
    result->set_pointer(fctType(res));                                        \
    result->set_type_seal((void *)fct_proxy_type_seal(aux));                  \
    result->set_noOfArgs(fct_proxy_argc(aux));                                \
    RETURN(result)

# define fct_proxy_ret(dummy, aux)                                            \
    if (res) { fct_proxy_null_ret(dummy, aux) }                               \
    cnvt_err(NULLPOINTERERROR, result, fctProxy aux)                          \

# define string_ret(dummy, aux)                                               \
    if (res == NULL)                                                          \
      cnvt_err(NULLPOINTERERROR, result, string)                              \
    { stringOop str= new_string_or_fail(res);                                 \
      if (oop(str) == failedAllocationOop)                                    \
        cnvt_err(OUTOFMEMORYERROR, result, string)                            \
      else                                                                    \
        RETURN(str) }

# define int_or_errno_ret(dummy, aux)                                         \
    if (res != aux) { int_ret(dummy, aux) }                                   \
    RETURN(ErrorCodes::os_prim_error(errno))

# define   specific_failure_int_ret(dummy, aux) \
    if (res != aux) { int_ret(dummy, aux) } \
    RETURN(ErrorCodes::vmString_prim_error(PRIMITIVEFAILEDERROR))
    
# define   specific_success_int_ret(dummy, aux)  \
    if (res == aux) { int_ret(dummy, aux) } \
    RETURN(ErrorCodes::os_prim_error(res))



/* Passing failure handle to the called fct. */

# define        _fail_pass_0
# define        _fail_pass_N
# define    fail_fail_pass_0                     &the_failure_handle
# define    fail_fail_pass_N                   , &the_failure_handle

# define pass_failure_handle_0(dummy, fail_opt)  CONC(fail_opt,_fail_pass_0)
# define pass_failure_handle_N(dummy, fail_opt)  CONC(fail_opt,_fail_pass_N)



/* Dispatch utilities for glue_f_opt_*. */

# define dclr_arg(i, cnvt, aux)  CONC(cnvt,_dclr)(i, aux)
# define coun_arg(i, cnvt, aux)  CONC(cnvt,_coun)(i, aux)
# define cnvt_arg(i, cnvt, aux)  CONC(cnvt,_cnvt)(i, aux)
# define pass_arg(i, cnvt, aux)  CONC(cnvt,_pass)(i, aux)


# define     dclr_res_arg(cnvt,    aux) CONC(cnvt,_dclr_res_arg)()
# define     dclr_res_arg_nc(cnvt, aux) CONC(cnvt,_dclr_res_arg_nc)()
# define    check_res_arg(cnvt,    aux) CONC(cnvt,_check_res_arg)()
# define    count_res_arg(cnvt,    aux) CONC(cnvt,_count_res_arg)()
# define preserve_res_arg(cnvt,    aux) CONC(cnvt,_pres_res_arg)()

# define    dclr_res(cnvt, aux)  omit_if_void(cnvt, ret_type(cnvt, aux) res;)
# define    ret_type(cnvt, aux)  CONC(cnvt,_ret_type)(dummy, aux)
# define convert_res(cnvt, aux)  CONC(cnvt,_ret)(dummy, aux)




# define set_no_of_args(gfname, argc)    smi no_of_args_var(gfname) = argc;

# define C_glue_decl(gfname, oop_list)                                        \
    extern "C" oop gfname oop_list


# define C_declaration(cnvt_res, aux_res, fname)                              \
    extern "C" ret_type(cnvt_res, aux_res) fname(...)



# define do_WHAT_GLUE(a,b,c,d,e,f,g,h,i,j)                                    \
             >>>>>>> You forgot to set WHAT_GLUE! <<<<<<<


# define do_PROTOTYPES(cnvt_res, aux_res, fname, gfname, fail_opt,            \
                       bx, argc, oop_list, cvt_list, pass_list)               \
    C_glue_decl(gfname, oop_list);


# define do_C_DECLS(cnvt_res, aux_res, fname, gfname, fail_opt,               \
                    bx, argc, oop_list, cvt_list, pass_list)                  \
    C_declaration(cnvt_res, aux_res, fname)

# define PRIMITIVE_GLUE_FLAG_CODE

# define do_FUNCTIONS(cnvt_res, aux_res, fname, gfname, fail_opt,             \
                         bx, argc, oop_list, cvt_list, pass_list)             \
    set_no_of_args(gfname, argc)                                              \
    C_glue_decl(gfname, oop_list) {                                           \
      ResourceMark rm;                                                        \
      PRIMITIVE_GLUE_FLAG_CODE;                                               \
      preserve_res_arg(cnvt_res, aux_res)                                     \
      cvt_list                                                                \
      dclr_res(cnvt_res, aux_res)                                             \
      call_stmt(fname pass_list, cnvt_res, aux_res, fail_opt)                 \
      bx                                                                      \
      convert_res(cnvt_res, aux_res)                                          \
    }


/* The macro glue_f_opt_N is the most general one.
   Here's a description of the arguments:
       cnvt_res:    first component of return conversion.
       aux_res:     second component of return conversion.
       fname:       normally name of the fct to call. However, sometimes fname
                    is not the name of a function, but an expression to
                    evaluate; e.g. when assigning/reading a global variable.
       gfname:      name of the glue fct to declare.
       fail_opt:    either fail or <empty>; indicates whether call can fail.
       argc:        integer, no of arguments that gfname takes.
       bx:          a hook, extra statements to insert after call in body
                    of glue fct.
       oop_list:    argument list, used for declaring glue fct gfname.
       cvt_list:    statements to convert from Self args to C args.
       pass_list:   argument list, used for calling fname.
*/

# define glue_f_opt_N(cnvt_res, aux_res, fname, gfname, fail_opt,             \
                      bx, argc, oop_list, cvt_list, pass_list)                \
    XCONC(do_,WHAT_GLUE)(cnvt_res, aux_res, fname, gfname, fail_opt,          \
                         bx, argc, oop_list, cvt_list, pass_list)             \



# define coun_args_0   0

# define coun_args_1(c0,a0)                                                   \
         coun_args_0 +                                                        \
         coun_arg(0, c0, a0)

# define coun_args_2(c0,a0, c1,a1)                                            \
         coun_args_1(c0,a0) +                                                 \
         coun_arg(1, c1, a1)

# define coun_args_3(c0,a0, c1,a1, c2,a2)                                     \
         coun_args_2(c0,a0, c1,a1) +                                          \
         coun_arg(2, c2, a2)

# define coun_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         coun_args_3(c0,a0, c1,a1, c2,a2) +                                   \
         coun_arg(3, c3, a3)

# define coun_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         coun_args_4(c0,a0, c1,a1, c2,a2, c3,a3) +                            \
         coun_arg(4, c4, a4)

# define coun_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         coun_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4) +                     \
         coun_arg(5, c5, a5)

# define coun_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         coun_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5) +              \
         coun_arg(6, c6, a6)

# define coun_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)  \
         coun_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6) +       \
         coun_arg(7, c7, a7)

# define coun_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8)                                                   \
         coun_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7) +\
         coun_arg(8, c8, a8)

# define coun_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9)                                           \
         coun_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8) +                                                 \
         coun_arg(9, c9, a9)

# define coun_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10)                                  \
         coun_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9) +                                         \
         coun_arg(10, c10, a10)

# define coun_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11)                         \
         coun_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10) +                                \
         coun_arg(11, c11, a11)

# define coun_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                \
         coun_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11) +                       \
         coun_arg(12, c12, a12)

# define coun_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)       \
         coun_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12) +              \
         coun_arg(13, c13, a13)



# define dclr_args_0()

# define dclr_args_1(c0,a0)                                                   \
         dclr_args_0()                                                        \
         dclr_arg(0, c0,a0)

# define dclr_args_2(c0,a0, c1,a1)                                            \
         dclr_args_1(c0,a0) ,                                                 \
         dclr_arg(1, c1, a1)

# define dclr_args_3(c0,a0, c1,a1, c2,a2)                                     \
         dclr_args_2(c0,a0, c1,a1) ,                                          \
         dclr_arg(2, c2, a2)

# define dclr_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         dclr_args_3(c0,a0, c1,a1, c2,a2) ,                                   \
         dclr_arg(3, c3, a3)

# define dclr_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         dclr_args_4(c0,a0, c1,a1, c2,a2, c3,a3) ,                            \
         dclr_arg(4, c4, a4)

# define dclr_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         dclr_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4) ,                     \
         dclr_arg(5, c5, a5)

# define dclr_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         dclr_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5) ,              \
         dclr_arg(6, c6, a6)

# define dclr_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,         \
                     c7,a7)                                                   \
         dclr_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6) ,       \
         dclr_arg(7, c7, a7)

# define dclr_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,         \
                     c7,a7, c8,a8)                                            \
         dclr_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,         \
                     c7,a7) ,                                                 \
         dclr_arg(8, c8, a8)

# define dclr_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9)                                    \
         dclr_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,         \
                     c7,a7, c8,a8) ,                                          \
         dclr_arg(9, c9, a9)

# define dclr_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10)                           \
         dclr_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9) ,                                  \
         dclr_arg(10, c10, a10)

# define dclr_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11)                  \
         dclr_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10) ,                         \
         dclr_arg(11, c11, a11)

# define dclr_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)         \
         dclr_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11) ,                \
         dclr_arg(12, c12, a12)

# define dclr_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)\
         dclr_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11, c12,a12) ,       \
         dclr_arg(13, c13, a13)



# define pass_args_0

# define pass_args_1(c0,a0)                                                   \
         pass_arg(0, c0, a0)

# define pass_args_2(c0,a0, c1,a1)                                            \
         pass_args_1(c0,a0) ,                                                 \
         pass_arg(1, c1, a1)

# define pass_args_3(c0,a0, c1,a1, c2,a2)                                     \
         pass_args_2(c0,a0, c1,a1) ,                                          \
         pass_arg(2, c2, a2)

# define pass_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         pass_args_3(c0,a0, c1,a1, c2,a2) ,                                   \
         pass_arg(3, c3, a3)

# define pass_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         pass_args_4(c0,a0, c1,a1, c2,a2, c3,a3) ,                            \
         pass_arg(4, c4, a4)

# define pass_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         pass_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4) ,                     \
         pass_arg(5, c5, a5)

# define pass_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         pass_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5) ,              \
         pass_arg(6, c6, a6)

# define pass_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)  \
         pass_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6) ,       \
         pass_arg(7, c7, a7)

# define pass_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8)                                                   \
         pass_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7) ,\
         pass_arg(8, c8, a8)

# define pass_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9)                                           \
         pass_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8) ,                                                 \
         pass_arg(9, c9, a9)

# define pass_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10)                                  \
         pass_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9) ,                                         \
         pass_arg(10, c10, a10)

# define pass_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11)                         \
         pass_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10) ,                                \
         pass_arg(11, c11, a11)

# define pass_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                \
         pass_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11) ,                       \
         pass_arg(12, c12, a12)

# define pass_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)       \
         pass_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12) ,              \
         pass_arg(13, c13, a13)
         

# define cnvt_args_0

# define cnvt_args_1(c0,a0)                                                   \
         cnvt_args_0                                                          \
         cnvt_arg(0, c0, a0)

# define cnvt_args_2(c0,a0, c1,a1)                                            \
         cnvt_args_1(c0,a0)                                                   \
         cnvt_arg(1, c1, a1)

# define cnvt_args_3(c0,a0, c1,a1, c2,a2)                                     \
         cnvt_args_2(c0,a0, c1,a1)                                            \
         cnvt_arg(2, c2, a2)

# define cnvt_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         cnvt_args_3(c0,a0, c1,a1, c2,a2)                                     \
         cnvt_arg(3, c3, a3)

# define cnvt_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         cnvt_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         cnvt_arg(4, c4, a4)

# define cnvt_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         cnvt_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         cnvt_arg(5, c5, a5)

# define cnvt_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         cnvt_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         cnvt_arg(6, c6, a6)

# define cnvt_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)  \
         cnvt_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         cnvt_arg(7, c7, a7)

# define cnvt_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8)                                                   \
         cnvt_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)  \
         cnvt_arg(8, c8, a8)

# define cnvt_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9)                                           \
         cnvt_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8)                                                   \
         cnvt_arg(9, c9, a9)

# define cnvt_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10)                                  \
         cnvt_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9)                                           \
         cnvt_arg(10, c10, a10)

# define cnvt_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11)                         \
         cnvt_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10)                                  \
         cnvt_arg(11, c11, a11)

# define cnvt_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                \
         cnvt_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11)                         \
         cnvt_arg(12, c12, a12)

# define cnvt_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)       \
         cnvt_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                \
         cnvt_arg(13, c13, a13)




# define glue_f_opt_0(cr, ar, fname, gfname, fail_opt, bx)                    \
                                                                              \
    glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                         \
         count_res_arg(cr,ar) +                                               \
         coun_args_0,                                                         \
        (dclr_args_0()                                                        \
         dclr_res_arg_nc(cr,ar)),                                             \
         cnvt_args_0                                                          \
         check_res_arg(cr,ar),                                                \
        (pass_args_0 pass_failure_handle_0(dummy, fail_opt))                  \
      )


# define glue_f_opt_1(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0)                                                  \
                                                                              \
    glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                         \
         count_res_arg(cr,ar) +                                               \
         coun_args_1(c0,a0),                                                  \
        (                                                                     \
         dclr_args_1(c0,a0)                                                   \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_1(c0,a0)                                                   \
         check_res_arg(cr,ar),                                                \
        (pass_args_1(c0,a0) pass_failure_handle_N(dummy, fail_opt))           \
      )


# define glue_f_opt_2(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0, c1,a1)                                           \
                                                                              \
    glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                         \
         count_res_arg(cr,ar) +                                               \
         coun_args_2(c0,a0, c1,a1),                                           \
        (                                                                     \
         dclr_args_2(c0,a0, c1,a1)                                            \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_2(c0,a0, c1,a1)                                            \
         check_res_arg(cr,ar),                                                \
        (pass_args_2(c0,a0, c1,a1) pass_failure_handle_N(dummy, fail_opt))    \
      )


# define glue_f_opt_3(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0, c1,a1, c2,a2)                                    \
                                                                              \
    glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                         \
         count_res_arg(cr,ar) +                                               \
         coun_args_3(c0,a0, c1,a1, c2,a2),                                    \
        (                                                                     \
         dclr_args_3(c0,a0, c1,a1, c2,a2)                                     \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_3(c0,a0, c1,a1, c2,a2)                                     \
         check_res_arg(cr,ar),                                                \
        (pass_args_3(c0,a0, c1,a1, c2,a2)                                     \
         pass_failure_handle_N(dummy, fail_opt))                              \
      )


# define glue_f_opt_4(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0, c1,a1, c2,a2, c3,a3)                             \
                                                                              \
    glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                         \
         count_res_arg(cr,ar) +                                               \
         coun_args_4(c0,a0, c1,a1, c2,a2, c3,a3),                             \
        (                                                                     \
         dclr_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         check_res_arg(cr,ar),                                                \
        (pass_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                              \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_5(cr, ar, fname, gfname, fail_opt, bx,                    \
    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                                        \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4),                      \
        (                                                                     \
         dclr_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         check_res_arg(cr,ar),                                                \
        (pass_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                       \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_6(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)               \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5),               \
        (                                                                     \
         dclr_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         check_res_arg(cr,ar),                                                \
        (pass_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_7(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)        \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6),        \
        (                                                                     \
         dclr_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         check_res_arg(cr,ar),                                                \
        (pass_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)         \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_8(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7) \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7), \
        (                                                                     \
         dclr_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,         \
                     c7,a7)                                                   \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)  \
         check_res_arg(cr,ar),                                                \
        (pass_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)  \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_9(cr, ar, fname, gfname, fail_opt, bx,                    \
                      c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8)                                                  \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8),                                                  \
        (                                                                     \
         dclr_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,         \
                     c7,a7, c8,a8)                                            \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8)                                                   \
         check_res_arg(cr,ar),                                                \
        (pass_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,  \
                     c8,a8)                                                   \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_10(cr, ar, fname, gfname, fail_opt, bx,                   \
                       c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,\
                       c8,a8, c9,a9)                                          \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9),                                          \
        (                                                                     \
         dclr_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9)                                    \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9)                                           \
         check_res_arg(cr,ar),                                                \
        (pass_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9)                                           \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_11(cr, ar, fname, gfname, fail_opt, bx,                   \
                       c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,\
                       c8,a8, c9,a9, c10,a10)                                 \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10),                                 \
        (                                                                     \
         dclr_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10)                           \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10)                                  \
         check_res_arg(cr,ar),                                                \
        (pass_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10)                                  \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_12(cr, ar, fname, gfname, fail_opt, bx,                   \
                       c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,\
                       c8,a8, c9,a9, c10,a10, c11,a11)                        \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11),                        \
        (                                                                     \
         dclr_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11)                  \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11)                         \
         check_res_arg(cr,ar),                                                \
        (pass_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11)                         \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_13(cr, ar, fname, gfname, fail_opt, bx,                   \
                       c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,\
                       c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)               \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12),               \
        (                                                                     \
         dclr_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)         \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                \
         check_res_arg(cr,ar),                                                \
        (pass_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )


# define glue_f_opt_14(cr, ar, fname, gfname, fail_opt, bx,                   \
                       c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,\
                       c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)      \
                                                                              \
      glue_f_opt_N(cr, ar, fname, gfname, fail_opt, bx,                       \
         count_res_arg(cr,ar) +                                               \
         coun_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13),      \
        (                                                                     \
         dclr_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,        \
                      c7,a7, c8,a8, c9,a9, c10,a10, c11,a11, c12,a12,         \
                      c13,a13)                                                \
         dclr_res_arg(cr,ar)                                                  \
         ),                                                                   \
         cnvt_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)       \
         check_res_arg(cr,ar),                                                \
        (pass_args_14(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7, \
                      c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)       \
         pass_failure_handle_N(dummy, fail_opt)                               \
        )                                                                     \
      )



/* C++ glue definitions. */

/* Naming. */

# define rcvr_name   receiver

# define rcvr_dclr(cnvt_rec, aux_rec)    dclr_arg(rcvr_name, cnvt_rec, aux_rec)
# define rcvr_cnvt(cnvt_rec, aux_rec)    cnvt_arg(rcvr_name, cnvt_rec, aux_rec)
# define rcvr_coun(cnvt_rec, aux_rec)    coun_arg(rcvr_name, cnvt_rec, aux_rec)




/*****************************************************************************/
/*****************************************************************************/
/****************************Interface to glue********************************/
/*****************************************************************************/
/*****************************************************************************/

/* The rest of this file contains the user interface to the C and C++ glue
   languages. Everything above this point can be considered implementation
   and safely ignored by the typical user.


   C glue.

   C glue supports Self programs accessing C functions and data. These are
   the main parts of C glue:
     1. Calling C functions. The macros C_func_n (where n is 0, 1, 2, ... max)
        support this.
     2. Reading/assigning a global variable. C_get_var and C_set_var supports
        this.
     3. Reading/assigning a component in a struct, that the Self programmer
        has a pointer to (e.g. proxy). C_get_comp and C_set_comp provides
        this option.
   Also, the C++ glue for new (CC_new_0) may be used to create C structs.

   All of these facilities are implemented as C++ preprocessor macros that
   expand into a C++ function doing the appropriate things. For a more
   detailed description of the macros, see the relevant group of macros below.
   Note that the glue macros expand into C++ functions, even though they
   provide a Self/C interface.

   Before embarking on the actual macros, a list of argument conversions and
   return conversions follow. Also a list of arguments names is given.
   Refer to this list, when writing macro calls.


   Argument conversions:

   An argument given at the Self level (Self object) is converted by the glue
   into one or more C (C++) values. Each conversion is specified by giving a
   pair ci,ai. ci is the main specifier, ai is often empty, but sometimes
   provides additional information used by the conversion. All the conversions
   are listed below. For details about how to use them, please see the Self
   system manual.

   These argument conversions all require ai to be empty:

      char,             signed_char,        unsigned_char,
      short,            signed_short,       unsigned_short,
      int,              signed_int,         unsigned_int,
      long,             signed_long,        unsigned_long,
      long_long,        signed_long_long,   unsigned_long_long,
      float,            double,             long_double,
      bool,             any_oop,
      smi,              unsigned_smi,
      string,           string_len,     string_null,    string_len_null,

   The remaining argument conversions are:

      bv,               bv_len,         bv_null,        bv_len_null,
     cbv,              cbv_len,        cbv_null,       cbv_len_null,
      proxy,            proxy_null,     oop,            any.

   The bv and cbv conversions all expect ai to be a C pointer type.
   The proxy conversion expects ai to be a pair (C pointer type, type seal).
   The oop conversion expects ai to be the name of an oop subclass, e.g.
   byteVector, foreign, proxy, ... .
   The any conversion expects ai to be the name of any C type which is big
   enough to store one of an int, a float or a pointer.



   Return conversions:

   Before a C (C++) value is returned to Self, it must be converted into a
   corresponding Self object. How this conversion takes place, is specified
   similarly to the way arguments are converted, i.e. using a pair ci,ai.
   Following is a list of all possible return value conversions.

   Return value conversions for which ai is empty:

      char,             signed_char,            unsigned_char,
      short,            signed_short,           unsigned_short,
      int,              signed_int,             unsigned_int,
      long,             signed_long,            unsigned_long,
      long_long,        signed_long_long,       unsigned_long_long,
      float,            double,                 long_double,
      void,             bool,                   oop,
      smi,              string,                 int_or_errno.

   The remaining return value conversions are:

      proxy,            proxy_null,     proxy_or_errno
      fct_proxy,        fct_proxy_null,
      
      specific_failure_int
      specific_success_int

   The proxy conversions require the second argument to be a pair
   (C pointer type, type seal).
   The fct_proxy conversions require the second argument to be a triple
   (C pointer type, type seal, arg_count).
   Both proxy and fct_proxy cause the glue to take an additional argument,
   (following the other arguments), that contains a dead proxy or
   dead function proxy to receive the new value and type seal.
   The int_or_errno option takes one more argument giving the return value
   that signals an error (typically 0 or -1). For int_or_errno, it is
   simply supplied in the aux portion (e.g. int_or_errno, -1, ).
   For proxy_or_errno, it is supplied as the last in the aux list
   (e.g. proxy, (int, FD_seal, -1),).
   
   The specific_failure_int and specific_success_int options expect the callee to
   return an int. A specific int is given as the second argument.
   specific_failure_int fails the primitive if the result matches the second argument,
   specific_success_int fails the primitive if the result DOES NOT match the second argument.
   

   Argument names.

   It has been attempted to use consistent names for macro arguments. The
   following names are used (note that not all of the macros take all of
   the following arguments; the names of the macros that do take a given
   argument are listed in parenthesis):
i
      cnvt_res,aux_res:  The return value conversion to apply to the result
                         before returning it to Self. (C_func_n, C_get_var,
                         C_get_comp, CC_mber_n).
      fexp:              An expression that evaluates to a function, e.g.
                         fct_name or (*fp), where fp is a global function
                         pointer. (C_func_n).
      gfname:            The name of the function, which the glue macro
                         should expand into. (all glue macros).
      fail_opt:          either <empty>: the C/C++ routine is not passed a
                                         failure handle.
                         or     fail:    the C/C++ routine is passed a
                                         failure handle.
                         (C_func_n, CC_mber_n).
      ci,ai:             (i = 0, 1, ...), how to convert the i'th argument
                         from Self to C/C++ representation before passing it
                         to the C/C++ routine. (C_func_n, CC_mber_n, CC_new_n).
      cnvt_rec,aux_rec:  The conversion to apply (to the first Self level
                         argument) to obtain the object upon which to invoke
                         the member function (i.e. the receiver). CC_delete
                         uses these arguments to obtain the object to delete.
                         (CC_mber_n, CC_delete).
      cnvt_str,aux_str:  The conversion used to obtain the struct from which
                         a component is read or assigned.
                         (C_get_comp, C_set_comp).
      comp:              The component to get or set in the struct, e.g.
                         .i_count. Note the initial dot in the value for comp!
                         It must be included since it is not supplied
                         automatically. This allows leaving the comp field
                         empty, thereby supporting pointers to things other
                         than structs. (C_get_comp, C_set_comp).
      expr_c0,expr_a0:   How to convert the Self level argument to the C value
                         that is assigned to a variable or component.
                         Conversions producing more than one C value (e.g.
                         bv_len) will result in the last (!) value being
                         assigned to var. (C_set_var, C_set_comp).
      var:               The variable to be assigned (or more generally any
                         C expression that evalues to an r-value in a global
                         context). (C_set_var).
      expr:              The variable to be read (or more generally any C
                         expression that is meaningful in a global context).
                         (C_get_var).
      class:             Name of the class to create an instance of.
                         (CC_new_n).
      mname:             Name of the member function (actually any expression
                         such that receiver->mname evaluates to a member
                         function). (CC_mber_n).
*/


/* Calling C functions.

   C glue supports calling functions taking 0, 1, ... arguments through the
   macros CC_func_n. These macros expand into a C++ function definition that
   acts as a wrapper around a call of C function. The wrapper converts
   arguments from Self objects to C values, results from C values to Self
   objects and performs some type checking.
*/


# define  C_func_0(cnvt_res, aux_res, fexp, gfname, fail_opt)                 \
      glue_f_opt_0(cnvt_res, aux_res, fexp, gfname, fail_opt,)

# define  C_func_1(cnvt_res, aux_res, fexp, gfname, fail_opt, c0,a0)          \
      glue_f_opt_1(cnvt_res, aux_res, fexp, gfname, fail_opt,, c0,a0)

# define  C_func_2(cnvt_res, aux_res, fexp, gfname, fail_opt, c0,a0, c1,a1)   \
      glue_f_opt_2(cnvt_res, aux_res, fexp, gfname, fail_opt,, c0,a0, c1,a1)

# define  C_func_3(cnvt_res, aux_res, fexp, gfname, fail_opt,                 \
                   c0,a0, c1,a1, c2,a2)                                       \
      glue_f_opt_3(cnvt_res, aux_res, fexp, gfname, fail_opt,,                \
                   c0,a0, c1,a1, c2,a2)

# define  C_func_4(cnvt_res, aux_res, fexp, gfname, fail_opt,                 \
                   c0,a0, c1,a1, c2,a2, c3,a3)                                \
      glue_f_opt_4(cnvt_res, aux_res, fexp, gfname, fail_opt,,                \
                   c0,a0, c1,a1, c2,a2, c3,a3)

# define  C_func_5(cnvt_res, aux_res, fexp, gfname, fail_opt,                 \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                         \
      glue_f_opt_5(cnvt_res, aux_res, fexp, gfname, fail_opt,,                \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)

# define  C_func_6(cnvt_res, aux_res, fexp, gfname, fail_opt,                 \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                  \
      glue_f_opt_6(cnvt_res, aux_res, fexp, gfname, fail_opt,,                \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)

# define  C_func_7(cnvt_res, aux_res, fexp, gfname, fail_opt,                 \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)           \
      glue_f_opt_7(cnvt_res, aux_res, fexp, gfname, fail_opt,,                \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)

# define  C_func_8(cnvt_res, aux_res, fexp, gfname, fail_opt,                 \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)    \
      glue_f_opt_8(cnvt_res, aux_res, fexp, gfname, fail_opt,,                \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)

# define  C_func_9(cnvt_res, aux_res, fexp, gfname, fail_opt,                 \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8)                                                     \
      glue_f_opt_9(cnvt_res, aux_res, fexp, gfname, fail_opt,,                \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8)

# define  C_func_10(cnvt_res, aux_res, fexp, gfname, fail_opt,                \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9)                                             \
      glue_f_opt_10(cnvt_res, aux_res, fexp, gfname, fail_opt,,               \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9)

# define  C_func_11(cnvt_res, aux_res, fexp, gfname, fail_opt,                \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10)                                    \
      glue_f_opt_11(cnvt_res, aux_res, fexp, gfname, fail_opt,,               \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10)

# define  C_func_12(cnvt_res, aux_res, fexp, gfname, fail_opt,                \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11)                           \
      glue_f_opt_12(cnvt_res, aux_res, fexp, gfname, fail_opt,,               \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11)

# define  C_func_13(cnvt_res, aux_res, fexp, gfname, fail_opt,                \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                  \
      glue_f_opt_13(cnvt_res, aux_res, fexp, gfname, fail_opt,,               \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)
                    
# define  C_func_14(cnvt_res, aux_res, fexp, gfname, fail_opt,                \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)         \
      glue_f_opt_14(cnvt_res, aux_res, fexp, gfname, fail_opt,,               \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11, c12,a12, c13,a13)




/* Get/set global variables.

   This is supported through the macros C_get_var and C_set_var. These
   macros expand into a C++ function definitions. The function for get will
   read the value of the variable, and convert it to a corresponding Self
   object. The function for set will take a Self object argument, do type
   checking and convert it to a C value which is assigned to the variable.
*/


# define C_get_var(cnvt_res, aux_res, expr, gfname)                           \
      glue_f_opt_N(cnvt_res, aux_res, expr, gfname, /* no fail */,,           \
                   count_res_arg(cnvt_res,aux_res),                           \
                   (dclr_res_arg_nc(cnvt_res,aux_res)),                       \
                   check_res_arg(cnvt_res,aux_res), )


# define C_set_var(var, expr_c0,expr_a0, gfname)                              \
      glue_f_opt_N(void,,                                                     \
                   var = pass_args_1(expr_c0,expr_a0),                        \
                   gfname, /* no fail */,,                                    \
                   coun_args_1(expr_c0,expr_a0),                              \
                  (dclr_args_1(expr_c0,expr_a0)),                             \
                   cnvt_args_1(expr_c0,expr_a0),                              \
                   /* No arg list. */                                         \
        )





/* Get/set components of structs given by proxies.

   These two macros allow a component of a struct to be read or assigned. The
   struct is given by a pair of conversions, just like function arguments
   (often the conversion is proxy or oop). The macros expand into C++
   functions that form a wrapper around the operation on the struct. For
   C_get_comp, the wrapper converts a Self object to a corresponding C value
   and assigns it to the given component of the struct. For C_set_comp, the
   wrapper reads the C value of the given component and converts it into a
   corresponding Self object that is returned.
*/


# define C_get_comp(cnvt_res,aux_res, cnvt_strc,aux_strc, comp, gfname)       \
      glue_f_opt_N(cnvt_res, aux_res,                                         \
         (*C_arg(0)) comp, gfname, /* no fail */, ,                           \
         count_res_arg(cnvt_res,aux_res) +                                    \
         coun_args_1(cnvt_strc,aux_strc),                                     \
        (dclr_args_1(cnvt_strc,aux_strc)                                      \
         dclr_res_arg(cnvt_strc,aux_strc)),                                   \
         cnvt_args_1(cnvt_strc,aux_strc)                                      \
         check_res_arg(cnvt_res,aux_res),                                     \
         /* do not pass args */                                               \
      )


# define C_set_comp(cnvt_strc,aux_strc, comp, expr_c0,expr_a0, gfname)        \
    glue_f_opt_N(void,,                                                       \
                    (*C_arg(0)) comp = C_arg(1),                              \
                    gfname, /* no fail */,,                                   \
                    coun_args_2( cnvt_strc,aux_strc,  expr_c0,expr_a0),       \
                   (dclr_args_2( cnvt_strc,aux_strc,  expr_c0,expr_a0)),      \
                    cnvt_args_2( cnvt_strc,aux_strc,  expr_c0,expr_a0),       \
                    /* don't pass args */                                     \
    )



/* ------------------------------------------------------------------------- */

/* C++ glue.

   Since C++ is a superset of C, all C glue macros can be used with C++.
   In addition, C++ glue provides direct support for:
     1. Calling destructors (deleting objects). Use the macro CC_delete.
     2. Calling constructors (creating new objects). Use the macros
        CC_new_n, where n is one of 0, 1, 2, ..., 8.
     3. Calling (public) member functions on objects given by arguments
        from Self. (To call (public) member functions on global objects,
        use the C glue facility for calling a function given by a global
        expression).
   Overloading is not well handled.
   Like C glue, these facilities are implemented as C++ macros that
   expand into C++ functions doing the appropriate things and in addition
   convert Self objects to C values and vice versa. For a more detailed
   description of each facility, see the relevant group of macros below.
*/





/* Calling destructors, delete.

   The delete operator must be specific to each class - else we can not
   guarantee that the destructor in the object is called properly. To create
   a delete operator for a specific class, invoke the macro CC_delete. It
   takes these arguments:
   If the object to be deleted is given by a proxy, then this proxy will be
   killed.
*/


# define CC_delete(cnvt_rec, aux_rec, gfname)                                 \
    glue_f_opt_N(void,, delete C_arg(rcvr_name), gfname, /* no fail */,       \
                 if (s_arg_receiver->is_proxy())                              \
                   proxyOop(s_arg_receiver)->kill();,                         \
                 rcvr_coun(cnvt_rec, aux_rec) + coun_args_0,                  \
                (rcvr_dclr(cnvt_rec, aux_rec)   dclr_args_0()),               \
                 rcvr_cnvt(cnvt_rec, aux_rec)   cnvt_args_0,                  \
                 /* Empty pass list - we are not really calling a fct. */     \
      )




/* Calling constructors, new.

   C++ glue supports calling constructors taking 0, 1, ... arguments. Calling
   a constructor is similar to calling a C function, so please refer to the
   description of C_func_n above. The main difference is that constructors
   are not allowed to fail.
*/


# define CC_new_0(cnvt_res, aux_res, class, gfname)                           \
     glue_f_opt_0(cnvt_res, aux_res, new class, gfname, /* no fail */,)


# define CC_new_1(cnvt_res, aux_res, class, gfname, c0,a0)                    \
     glue_f_opt_1(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0)

# define CC_new_2(cnvt_res, aux_res, class, gfname, c0,a0, c1,a1)             \
     glue_f_opt_2(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1)

# define CC_new_3(cnvt_res, aux_res, class, gfname, c0,a0, c1,a1, c2,a2)      \
     glue_f_opt_3(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1, c2,a2)

# define CC_new_4(cnvt_res, aux_res, class, gfname,                           \
                  c0,a0, c1,a1, c2,a2, c3,a3)                                 \
     glue_f_opt_4(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1, c2,a2, c3,a3)

# define CC_new_5(cnvt_res, aux_res, class, gfname,                           \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                          \
     glue_f_opt_5(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)

# define CC_new_6(cnvt_res, aux_res, class, gfname,                           \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                   \
     glue_f_opt_6(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)

# define CC_new_7(cnvt_res, aux_res, class, gfname,                           \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)           \
     glue_f_opt_7(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)

# define CC_new_8(cnvt_res, aux_res, class, gfname,                           \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)    \
     glue_f_opt_8(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)

# define CC_new_9(cnvt_res, aux_res, class, gfname,                           \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,     \
                  c8,a8)                                                      \
     glue_f_opt_9(cnvt_res, aux_res, new class, gfname, /* no fail */,,       \
                  c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,     \
                  c8,a8)

# define CC_new_10(cnvt_res, aux_res, class, gfname,                          \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8, c9,a9)                                              \
     glue_f_opt_10(cnvt_res, aux_res, new class, gfname, /* no fail */,,      \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8, c9,a9)

# define CC_new_11(cnvt_res, aux_res, class, gfname,                          \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8, c9,a9, c10,a10)                                     \
     glue_f_opt_11(cnvt_res, aux_res, new class, gfname, /* no fail */,,      \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8, c9,a9, c10,a10)




/* Calling member functions.

   C++ glue supports calling member functions taking 0, 1, ... arguments
   through the macros CC_mber_n (n = 0, 1,...). Calling a member
   function is similar to both calling a C function and getting the value
   of a component in a C struct, so please refer to the description of
   C_func_n and C_get_comp above.
   The object on which the member function is invoked, is specified using the
   same kind of conversions as for arguments (typically a proxy or oop
   conversion will be used).
   The macros CC_mber_n expand into C++ functions that take Self objects
   as arguments, checks types, converts to C++ values and then invokes the
   member function on the relevant object. Finally, the C++ return value is
   converted to a Self object.
*/

# define CC_mber_0(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt)                                   \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) + coun_args_0,                            \
     (                                                                        \
       rcvr_dclr(cnvt_rec, aux_rec)   dclr_args_0()                           \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)   cnvt_args_0                             \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_0 pass_failure_handle_0(dummy, fail_opt))                    \
    )


# define CC_mber_1(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0)                                                     \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) + coun_args_1(c0,a0),                     \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) , dclr_args_1(c0,a0)                      \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)   cnvt_args_1(c0,a0)                      \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_1(c0,a0) pass_failure_handle_N(dummy, fail_opt))             \
    )


# define CC_mber_2(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1)                                              \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) + coun_args_2(c0,a0, c1,a1),              \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) , dclr_args_2(c0,a0, c1,a1)               \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)   cnvt_args_2(c0,a0, c1,a1)               \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_2(c0,a0, c1,a1) pass_failure_handle_N(dummy, fail_opt))      \
    )


# define CC_mber_3(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1, c2,a2)                                       \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) + coun_args_3(c0,a0, c1,a1, c2,a2),       \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_3(c0,a0, c1,a1, c2,a2)                                       \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)   cnvt_args_3(c0,a0, c1,a1, c2,a2)        \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_3(c0,a0, c1,a1, c2,a2)                                       \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_4(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1, c2,a2, c3,a3)                                \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_4(c0,a0, c1,a1, c2,a2, c3,a3),                               \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                                \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)                                           \
       cnvt_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                                \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_4(c0,a0, c1,a1, c2,a2, c3,a3)                                \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_5(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                         \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4),                        \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                         \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)                                           \
       cnvt_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                         \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_5(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4)                         \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_6(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                  \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5),                 \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                  \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)                                           \
       cnvt_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                  \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_6(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5)                  \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_7(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)           \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6),          \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)           \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)                                           \
       cnvt_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)           \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_7(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6)           \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_8(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)    \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7),   \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,           \
                   c7,a7)                                                     \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)                                           \
       cnvt_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)    \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_8(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7)    \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_9(cnvt_res, aux_res, cnvt_rec, aux_rec,                      \
                   mname, gfname, fail_opt,                                   \
                   c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,           \
                   c7,a7, c8,a8)                                              \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8),                                                    \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,           \
                   c7,a7, c8,a8)                                              \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)                                           \
       cnvt_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8)                                                     \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_9(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,    \
                   c8,a8)                                                     \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_10(cnvt_res, aux_res, cnvt_rec, aux_rec,                     \
                    mname, gfname, fail_opt,                                  \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9)                                      \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9),                                            \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9)                                      \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       rcvr_cnvt(cnvt_rec, aux_rec)                                           \
       cnvt_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9)                                             \
       check_res_arg(cnvt_res,aux_res),                                       \
      (pass_args_10(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9)                                             \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_11(cnvt_res, aux_res, cnvt_rec, aux_rec,                     \
                    mname, gfname, fail_opt,                                  \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9, c10,a10)                             \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10),                                   \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9, c10,a10)                             \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       cnvt_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10)                                    \
       rcvr_cnvt(cnvt_rec, aux_rec),                                          \
       check_res_arg(cnvt_res,aux_res)                                        \
      (pass_args_11(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10)                                    \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_12(cnvt_res, aux_res, cnvt_rec, aux_rec,                     \
                    mname, gfname, fail_opt,                                  \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9, c10,a10, c11,a11)                    \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11),                          \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9, c10,a10, c11,a11)                    \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       cnvt_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11)                           \
       rcvr_cnvt(cnvt_rec, aux_rec),                                          \
       check_res_arg(cnvt_res,aux_res)                                        \
      (pass_args_12(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11)                           \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )


# define CC_mber_13(cnvt_res, aux_res, cnvt_rec, aux_rec,                     \
                    mname, gfname, fail_opt,                                  \
                    c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)           \
    glue_f_opt_N(cnvt_res, aux_res, C_arg(rcvr_name)->mname,                  \
       gfname, fail_opt,,                                                     \
       count_res_arg(cnvt_res,aux_res) +                                      \
       rcvr_coun(cnvt_rec, aux_rec) +                                         \
       coun_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11, c12,a12),                 \
      (                                                                       \
       rcvr_dclr(cnvt_rec, aux_rec) ,                                         \
       dclr_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6,          \
                    c7,a7, c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)           \
       dclr_res_arg(cnvt_res,aux_res)                                         \
      ),                                                                      \
       cnvt_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                  \
       rcvr_cnvt(cnvt_rec, aux_rec),                                          \
       check_res_arg(cnvt_res,aux_res)                                        \
      (pass_args_13(c0,a0, c1,a1, c2,a2, c3,a3, c4,a4, c5,a5, c6,a6, c7,a7,   \
                    c8,a8, c9,a9, c10,a10, c11,a11, c12,a12)                  \
       pass_failure_handle_N(dummy, fail_opt))                                \
    )

// Macro for checksum verification in a dynamic library
extern int glue_checksum;
# define VERIFYCHECKSUM                                                       \
    int glue_library_checksum = GLUE_CHECKSUM;                                \
    extern "C" bool verify_checksum() { return glue_checksum == glue_library_checksum; }

// Current glue flags
extern bool xlib_semaphore, quartz_semaphore;

// Blocks a flag during a primitive call.
class BlockGlueFlag {
  bool* flag;
    // X misses updates sometimes; see if this fixes it
    SignalBlocker *sb;
 public:
  BlockGlueFlag(bool& fl) {
    flag = &fl;
    if (flag == &xlib_semaphore  &&  BlockSignalsForXGlue)
      sb = new SignalBlocker(SignalBlocker::block_signals_self_uses);
    *flag = true;
  }
  ~BlockGlueFlag() {
    *flag = false;
    if (flag == &xlib_semaphore  &&  BlockSignalsForXGlue)
      delete sb;
  }
};

