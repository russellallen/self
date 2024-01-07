/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef FAST_COMPILER

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// returns register string with appropriate bit set if l is a location
// described by the register mask
RegisterString registerMaskBit(Location l, fint stackLocs, fint nonRegisterArgs);
inline RegisterString regStringToMask(RegisterString s) { return s >> L0; }
inline RegisterString regMaskToString(RegisterString s) { return s << L0; }


inline Location pickRegister(RegisterString& s, RegisterString mask) { return pick(s, mask); }

# endif // FAST_COMPILER
