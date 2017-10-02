#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "top.hh"

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)



# if defined(__ppc__)
# include "disasm_ppc.hh"
# elif defined(__i386__)
# include "disasm_i386.hh"
# else
# include "disasm_sparc.hh"
# endif


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
