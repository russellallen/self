#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "asm_inline.hh"
# include "cacheStub.hh"



# if defined(FAST_COMPILER) || defined(SIC_COMPILER)

# if defined(__ppc__)
# include "cacheStub_inline_ppc.hh"
# elif defined(__i386__)
# include "cacheStub_inline_i386.hh"
# else
# include "cacheStub_inline_sparc.hh"
# endif


# endif
