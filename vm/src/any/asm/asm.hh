#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "asm_abstract.hh"
# include "oop_inline.hh"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

# if    !GENERATE_DEBUGGING_AIDS

# endif

# if defined(__ppc__)
# include "asm_ppc.hh"
# elif defined(__i386__)
# include "asm_i386.hh"
# else
# include "asm_sparc.hh"
# endif



# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
