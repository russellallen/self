/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


class codeLikeSlotsMap: public slotsMapDeps {
  // abstract class for objects with code  
 public:
  bool is_method_like()         { return true; }
  oop  mirror_reflectee(oop r)  {
    if (NakedMethods) return slotsMapDeps::mirror_reflectee(r);
    Unused(r); return ErrorCodes::vmString_prim_error(REFLECTTYPEERROR); }
  fint arg_count();
};

