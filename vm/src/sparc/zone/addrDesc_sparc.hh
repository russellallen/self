/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma interface

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

 public:
  enum {
    inDelaySlotMask = architectureSpecificMask
  };
  
 unknown:
  bool inDelaySlot()            { return anySet(desc, inDelaySlotMask); }


# endif // FAST_COMPILER or SIC_COMPILER
