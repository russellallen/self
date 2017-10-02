// Can't use "#pragma once" here as it causes a crash when
// loading 'worldBuilder.self' at the point it prompts the
// user whether to load UI2.
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef IN_PRIM_TABLE
//# if TARGET_OS_FAMLIY == UNIX_FAMILY
# include "prim_table_os_unix.hh"
//# endif
# endif
