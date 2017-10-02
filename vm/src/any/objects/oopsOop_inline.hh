#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "oop_inline.hh"
# include "oopsOop.hh"




inline void oopsOopClass::at_put(fint which, oop contents, bool cs) {
  Memory->store(oops(which), contents, cs); }
