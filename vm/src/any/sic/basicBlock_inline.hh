#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "basicBlock.hh"
# include "defUse_inline.hh"



# ifdef SIC_COMPILER

  inline  DUInfo* BB::defUseInfo(PRegBBIndex* whichPReg) {
    return duInfo.info->nth(whichPReg->index); 
  }

# endif // SIC_COMPILER
