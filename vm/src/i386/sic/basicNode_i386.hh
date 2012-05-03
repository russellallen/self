# ifdef __i386__
/* Sun-$Revision: 1.4 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// included in node.hh

public:
    void restoreFrameAndReturn(bool haveStackFrame, fint offset);
# endif // __i386__
