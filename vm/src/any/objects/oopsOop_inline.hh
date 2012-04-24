/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif



inline void oopsOopClass::at_put(fint which, oop contents, bool cs) {
  Memory->store(oops(which), contents, cs); }
