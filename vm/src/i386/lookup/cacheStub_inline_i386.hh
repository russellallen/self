# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)



inline void CacheStub::jump(char* addr) {
  // Was branch_to, but this caused problems because
  // CacheStub::moveTo_inner does not relocate these. -- dmu 12/03
  a->jmp((smi)addr, CodeAddressOperand);
}


# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // defined(__i386__) || defined(__x86_64__)
