#pragma once
# ifdef __ppc__
/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */



// included in node.hh

public:
    void resetSP();
    void restoreNonVolatileRegisters();
    void doReturn(fint offset);
    void restoreFrameAndReturn(bool haveStackFrame, fint offset);
# endif // __ppc__
