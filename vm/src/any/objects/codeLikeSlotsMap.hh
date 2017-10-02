#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "errorCodes.hh"
# include "slotsMapDeps.hh"



class codeLikeSlotsMap: public slotsMapDeps {
  // abstract class for objects with code  
 public:
  bool is_method_like()         { return true; }
  oop  mirror_reflectee(oop r)  {
    if (NakedMethods) return slotsMapDeps::mirror_reflectee(r);
    Unused(r); return ErrorCodes::vmString_prim_error(REFLECTTYPEERROR); }
  fint arg_count();
};

