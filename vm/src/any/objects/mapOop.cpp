/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "mapOop.hh"
# include "_mapOop.cpp.incl" 

bool mapOopClass::equal(mapOop other) {
  if (this == other) return true;
  if (map_addr()->is_block()  &&  other->map_addr()->is_block()) {
    // blocks are the same if block method is the same
    return ((blockMap*)  map_addr())->value() ==
      ((blockMap*)other->map_addr())->value();
  } else {
    return false;
  }
}

