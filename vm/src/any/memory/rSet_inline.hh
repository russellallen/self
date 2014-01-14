/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline char* rSet::byte_map_end() {
  return byte_for(Memory->old_gen->high_boundary); }

inline void rSet::clear() { clear(byte_map, byte_map_end()); }
