#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

 public:
  enum {
    isShiftedMask = architectureSpecificMask
  };
  
 unknown:
  bool isShifted()              { return anySet(desc, isShiftedMask); }



# endif // FAST_COMPILER or SIC_COMPILER
# endif // __ppc__
