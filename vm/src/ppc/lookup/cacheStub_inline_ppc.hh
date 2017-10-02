#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


inline void CacheStub::jump(char* addr) {
  // Was branch_to, but this caused problems because
  // CacheStub::moveTo_inner does not relocate these. -- dmu 12/03
  a->long_branch_to((pc_t)addr, CodeAddressOperand, Temp2, false);
}

# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // __ppc__
