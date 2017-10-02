#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER



// returns register string with appropriate bit set if l is a location
// described by the register mask
RegisterString registerMaskBit(Location l, fint stackLocs, fint nonRegisterArgs);
inline RegisterString regStringToMask(RegisterString s) { return s; } // no register offset on PPC
inline RegisterString regMaskToString(RegisterString s) { return s; } // no register offset on PPC


// PPC allocates registers in reverse
inline Location pickRegister(RegisterString& s, RegisterString mask) { return pickReverse(s, mask); }


# endif // FAST_COMPILER
# endif // __ppc__
