# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


public:
  virtual fint  number_of_memory_locals() = 0;

# endif // defined(__i386__) || defined(__x86_64__)
