/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline smiOop blockOopClass::desc() {
  return ((blockMap*) map())->desc();
}

inline slotsOop blockOopClass::value() {
  return ((blockMap*) map())->value();
}

inline bool oopClass::is_block_with_code() {
  return is_block() && blockOop(this)->value()->has_code();
}
