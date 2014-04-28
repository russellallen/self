/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



inline void oopsOopClass::at_put(fint which, oop contents, bool cs) {
  Memory->store(oops(which), contents, cs); }
