#pragma once
# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


// included in sic.hh


public:
  int32  max_no_of_outgoing_args_and_rcvr();
  int32  number_of_memory_locals();

public:
  Label* nlrLabel;     // used for caching NLR return

private:

# endif // __i386__
