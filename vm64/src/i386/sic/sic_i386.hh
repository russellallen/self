# if defined(__i386__) || defined(__x86_64__)
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// included in sic.hh


public:
  fint   max_no_of_outgoing_args_and_rcvr();
  fint   number_of_memory_locals();

public:
  Label* nlrLabel;     // used for caching NLR return

private:

# endif // defined(__i386__) || defined(__x86_64__)
