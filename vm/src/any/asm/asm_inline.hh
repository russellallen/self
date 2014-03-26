#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "addrDesc.hh"
# include "asm_inline_abstract.hh"
# include "debug.hh"
# include "fields.hh"
# include "label.hh"
# include "nmethod_inline.hh"
# include "prim.hh"
# include "stringOop.hh"
# include "tracing.hh"

# if  !GENERATE_DEBUGGING_AIDS


# endif

# if defined(__ppc__)
# include "asm_inline_ppc.hh"
# elif defined(__i386__)
# include "asm_inline_i386.hh"
# else
# include "asm_inline_sparc.hh"
# endif

