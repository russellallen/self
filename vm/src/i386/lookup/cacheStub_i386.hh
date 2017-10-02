#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

// included into class CacheStub

 private:
   Label* br_if_not_smi();
   Label* br_if_not_float();
   void  add_case(nmethod* nm, CountStub* stArg, pc_t addr);



# endif  // defined(FAST_COMPILER) || defined(SIC_COMPILER)
# endif // __i386__
