/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline ResultType simpleLookup::resultType() {
  return result()->resultType(selector());
}
 
inline void simpleLookup::setResult(oop resultMethod, oop resultMethodHolderOrMap) {
  _result= resultMethodHolderOrMap == MH_NOT_A_RESEND
       ? (abstractSlotRef*) new    nonexistentSlotRef(resultMethod)
       : (abstractSlotRef*) new counterfactualSlotRef(resultMethod, resultMethodHolderOrMap);
}


// caller must preserve args!

inline oop simpleLookup::evaluateResult(oop* argp, int32 nargs, nmethod* nm) {

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)
  if (!Interpret) {
    assert(nargs <= 1, "have not implemented compiled evaluation > 1 arg");
    assert(nm != 0, "need an nmethod");
    return EnterSelf( receiver,
                      nm->insts(),
                      nargs == 0  ?  badOop  :  argp[0]);
  }
# else
  Unused(nm);
# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)

  return result()->interpret( receiver,
                              selector(),
                              delegatee(),
                              argp,
                              nargs);
}



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

inline char* simpleLookup::interpretResultForCompiledSender(oop arg1) {
  return result()->interpretForCompiledSender( receiver, selector(), arg1);
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)


inline void simpleLookup::assert_methodHolder_is_object() {
  assert(  methodHolder_or_map() != MH_TBD 
  &&      !methodHolder_or_map()->is_map(),
         "should be a real method holder now (or 0)"); }
