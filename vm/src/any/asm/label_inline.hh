#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "asm_inline.hh"
# include "label.hh"



# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)


#if GENERATE_DEBUGGING_AIDS

inline void Label::  trackLabel()  { theAssembler->  trackLabel(this); }
inline void Label::untrackLabel()  { theAssembler->untrackLabel(this); }

#endif // GENERATE_DEBUGGING_AIDS


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
