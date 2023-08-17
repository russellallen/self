/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "fctProxyOop.hh"
# include "_fctProxyOop.cpp.incl"



smi fctProxyOopClass::get_noOfArgs_prim(void *FH) {
  if (!is_live()) {
    prim_failure(FH, DEADPROXYERROR);
    return 0;
  }
  return get_noOfArgs();
}


oop fctProxyOopClass::set_noOfArgs_prim(smi n, void *FH) {
  if (!is_live()) {
    prim_failure(FH, DEADPROXYERROR);
    return NULL;
  }
  set_noOfArgs(n);
  return this;
}


# if  GENERATE_DEBUGGING_AIDS
bool fctProxyOopClass::verify() {
  bool flag = proxyOopClass::verify();
  if (!addr()->noOfArgs->is_smi()) {
    error1("fctProxyOop %#lx: noOfArgs isn't a smi", this);
    flag = false;
  }
  return flag;
}
# endif


#define CALL_TEMPLATE(name, comma, declList, argList, nargs)                  \
  inline oop fctProxyOopClass::name(declList) {                               \
    if (!is_fctProxy())                                                       \
      return ErrorCodes::vmString_prim_error(BADTYPEERROR);                                        \
    if (!is_live())                                                           \
      return ErrorCodes::vmString_prim_error(DEADPROXYERROR);                                      \
    if (get_noOfArgs() != nargs && get_noOfArgs() != unknownNoOfArgs)         \
      return ErrorCodes::vmString_prim_error(WRONGNOOFARGSERROR);                                  \
    oop res = (*get_pointer()) (argList);                                     \
    assert(res->verify_oop_mark_ok(),"should be an oop");                     \
    return res;                                                               \
  }                                                                           \
                                                                              \
  oop name(oop rcvr comma declList) {                                         \
    return fctProxyOop(rcvr)->name(argList); }                                \


// what a hack
#define C ,

CALL_TEMPLATE(call0_prim, , , , 0)

CALL_TEMPLATE(call1_prim, C, 
              oop a1, 
              a1, 
              1)

CALL_TEMPLATE(call2_prim, C, 
              oop a1 C oop a2, 
              a1 C a2,
              2)

CALL_TEMPLATE(call3_prim, C, 
              oop a1 C oop a2 C oop a3,
              a1 C a2 C a3,
              3)

CALL_TEMPLATE(call4_prim, C, 
              oop a1 C oop a2 C oop a3 C oop a4,
              a1 C a2 C a3 C a4,
              4)

CALL_TEMPLATE(call5_prim, C, 
              oop a1 C oop a2 C oop a3 C oop a4 C oop a5, 
              a1 C a2 C a3 C a4 C a5,
              5)

CALL_TEMPLATE(call6_prim, C, 
              oop a1 C oop a2 C oop a3 C oop a4 C oop a5 C oop a6, 
              a1 C a2 C a3 C a4 C a5 C a6,
              6)

CALL_TEMPLATE(call7_prim, C, 
              oop a1 C oop a2 C oop a3 C oop a4 C oop a5 C oop a6 C oop a7, 
              a1 C a2 C a3 C a4 C a5 C a6 C a7,
              7)

CALL_TEMPLATE(call8_prim, C, 
              oop a1 C oop a2 C oop a3 C oop a4 C oop a5 C oop a6 C oop a7 C oop a8, 
              a1 C a2 C a3 C a4 C a5 C a6 C a7 C a8,
              8)

CALL_TEMPLATE(call9_prim, C, 
              oop a1 C oop a2 C oop a3 C oop a4 C oop a5 C oop a6 C oop a7 C oop a8 C oop a9, 
              a1 C a2 C a3 C a4 C a5 C a6 C a7 C a8 C a9,
              9)

CALL_TEMPLATE(call10_prim, C, 
              oop a1 C oop a2 C oop a3 C oop a4 C oop a5 C oop a6 C oop a7 C oop a8 C oop a9 C oop a10, 
              a1 C a2 C a3 C a4 C a5 C a6 C a7 C a8 C a9 C a10,
              10)


# define C_C_TEMPLATE(declList, argList)                                      \
  oop fctProxyOopClass::declList {                                            \
    if (!is_live())                                                           \
      return ErrorCodes::vmString_prim_error(DEADPROXYERROR);                                      \
    byteVectorOop res= Memory->byteVectorObj->cloneSize(sizeof(void*));       \
    *(void**) res->bytes() =  (*get_pointer()) argList;                       \
    return res;                                                               \
  }

C_C_TEMPLATE(call_and_convert0(), ())
C_C_TEMPLATE(call_and_convert1(void* a1), (a1))
C_C_TEMPLATE(call_and_convert2(void* a1, void* a2), (a1, a2))
C_C_TEMPLATE(call_and_convert3(void* a1, void* a2, void* a3), 
             (a1, a2, a3))
C_C_TEMPLATE(call_and_convert4(void* a1, void* a2, void* a3, void* a4),
             (a1, a2, a3, a4))
C_C_TEMPLATE(call_and_convert5(void* a1, void* a2, void* a3, void* a4, 
                               void* a5),
             (a1, a2, a3, a4, a5))
C_C_TEMPLATE(call_and_convert6(void* a1, void* a2, void* a3, void* a4, 
                               void* a5, void* a6), 
             (a1, a2, a3, a4, a5, a6))
C_C_TEMPLATE(call_and_convert7(void* a1, void* a2, void* a3, void* a4, 
                               void* a5, void* a6, void* a7), 
             (a1, a2, a3, a4, a5, a6, a7))
C_C_TEMPLATE(call_and_convert8(void* a1, void* a2, void* a3, void* a4, 
                               void* a5, void* a6, void* a7, void* a8), 
             (a1, a2, a3, a4, a5, a6, a7, a8))
C_C_TEMPLATE(call_and_convert9(void* a1, void* a2, void* a3, void* a4, 
                               void* a5, void* a6, void* a7, void* a8,
                               void* a9), 
             (a1, a2, a3, a4, a5, a6, a7, a8, a9))
C_C_TEMPLATE(call_and_convert10(void* a1, void* a2, void* a3, void* a4, 
                                void* a5, void* a6, void* a7, void* a8,
                                void* a9, void* a10), 
             (a1, a2, a3, a4, a5, a6, a7, a8, a9, a10))
