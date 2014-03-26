#pragma once
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef IN_PRIM_TABLE
# if defined(__ppc__)
# include "prim_table_arch_ppc.hh"
# elif defined(__i386__)
# include "prim_table_arch_i386.hh"
# else
# include "prim_table_arch_sparc.hh"
# endif
# endif
