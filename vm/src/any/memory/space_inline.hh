/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


inline bool oldSpace::reserveFree() {
  return bytes_free() >= Memory->old_gen->VM_reserved_mem; 
}
