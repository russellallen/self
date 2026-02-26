# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the RegisterLocator class.


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

  oop** addresses() { fatal("Unused Intel");  return 0;  }
# endif // defined(__i386__) || defined(__x86_64__)
