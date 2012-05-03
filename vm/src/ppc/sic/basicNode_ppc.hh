# ifdef __ppc__
/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// included in node.hh

public:
    void resetSP();
    void restoreNonVolatileRegisters();
    void doReturn(fint offset);
    void restoreFrameAndReturn(bool haveStackFrame, fint offset);
# endif // __ppc__
