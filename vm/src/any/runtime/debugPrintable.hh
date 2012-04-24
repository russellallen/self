/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// these printing functions are conveniently called from the debugger

extern "C" {
# if  GENERATE_DEBUGGING_AIDS
  void pp(void* p);
#endif
  void pp_short(void* p);
# if  GENERATE_DEBUGGING_AIDS
  void pr(oop p);
  void pm(Map* p);
#endif
}

