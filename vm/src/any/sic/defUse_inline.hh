#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "basicBlock.hh"
# include "defUse.hh"



# ifdef SIC_COMPILER

  inline DUInfo* PRegBBIndex::defUseInfo() { return bb->defUseInfo(this); }


# endif // SIC_COMPILER
