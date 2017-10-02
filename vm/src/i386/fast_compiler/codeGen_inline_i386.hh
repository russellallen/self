#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "codeGen.hh"


# if   !GENERATE_DEBUGGING_AIDS


# endif


# if defined(FAST_COMPILER)

  inline void CodeGen::jumpTo(void* target, Location reg, Location link = UnAllocated ) {
    fatal("not needed for intel");  
  }

# endif // FAST_COMPILER

# endif // __i386__
