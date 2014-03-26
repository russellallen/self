#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "asm_abstract.hh"
# include "regs.hh"



# if defined(__ppc__)
# include "frame_format_ppc.hh"
# elif defined(__i386__)
# include "frame_format_i386.hh"
# else
# include "frame_format_sparc.hh"
# endif

