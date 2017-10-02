#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */



//# if TARGET_OS_FAMLIY == UNIX_FAMILY
# include "include_glue_unix.hh"
//# endif

// MacOS or OS X
# if defined(QUARTZ_LIB)
# include     "quartz.primMaker.hh"
# endif
