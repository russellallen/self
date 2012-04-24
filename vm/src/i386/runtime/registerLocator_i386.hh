# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the RegisterLocator class.


# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

  oop** addresses() { fatal("Unused Intel");  return 0;  }
# endif // __i386__
