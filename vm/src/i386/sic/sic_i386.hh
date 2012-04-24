# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif

// included in sic.hh


public:
  int32  max_no_of_outgoing_args_and_rcvr();
  int32  number_of_memory_locals();

public:
  Label* nlrLabel;     // used for caching NLR return

private:

# endif // __i386__
