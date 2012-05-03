# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)



inline void CacheStub::jump(char* addr) {
  // Was branch_to, but this caused problems because
  // CacheStub::moveTo_inner does not relocate these. -- dmu 12/03
  a->jmp((int32)addr, CodeAddressOperand);
}


# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // __i386__
