# if defined(__ppc__) || defined(__powerpc__)
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
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
