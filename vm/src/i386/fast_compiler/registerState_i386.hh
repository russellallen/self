# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef FAST_COMPILER

 public:
  int32 rcvrDepth; // track space used for outgoing rcvr

# endif // FAST_COMPILER
# endif // __i386__
