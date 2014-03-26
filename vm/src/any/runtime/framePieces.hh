#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "frame_format.hh"
# include "space_inline.hh"
# include "top.hh"




# if defined(__ppc__)
# include "framePieces_ppc.hh"
# elif defined(__i386__)
# include "framePieces_i386.hh"
# else
# include "framePieces_sparc.hh"
# endif

