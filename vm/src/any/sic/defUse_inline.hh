/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# ifdef SIC_COMPILER

  inline DUInfo* PRegBBIndex::defUseInfo() { return bb->defUseInfo(this); }


# endif // SIC_COMPILER
