#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)



inline void CacheStub::jump(char* addr) {
  // Was branch_to, but this caused problems because
  // CacheStub::moveTo_inner does not relocate these. -- dmu 12/03
  a->jmp((int32)addr, CodeAddressOperand);
}


# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)

# endif // __i386__
