# ifdef __ppc__
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

 public:
  enum {
    isShiftedMask = architectureSpecificMask
  };
  
 unknown:
  bool isShifted()              { return anySet(desc, isShiftedMask); }



# endif // FAST_COMPILER or SIC_COMPILER
# endif // __ppc__
