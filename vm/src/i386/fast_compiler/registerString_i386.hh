# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



// returns register string with appropriate bit set if l is a location
// described by the register mask
RegisterString registerMaskBit(Location l, fint stackLocs, fint nonRegisterArgs);
inline RegisterString regStringToMask(RegisterString s) { return s; } // no register offset on I386
inline RegisterString regMaskToString(RegisterString s) { return s; } // no register offset on I386

// dont use regs for NIC
inline Location pickRegister(RegisterString& s, RegisterString mask) { return UnAllocated; /*return pickReverse(s, mask);*/ }


# endif // FAST_COMPILER
# endif // __i386__
