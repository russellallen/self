/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline bool oldSpace::reserveFree() {
  return bytes_free() >= Memory->old_gen->VM_reserved_mem; 
}
