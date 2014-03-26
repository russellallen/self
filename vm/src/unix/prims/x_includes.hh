#pragma once
// Sun-$Revision: 30.11 $

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


// includes for X
# ifdef XLIB
# define Cursor SelfX11Cursor // prevent clash with Carbon
# include <X11/Xlib.h>
# include <X11/Xutil.h>
# undef Cursor
# if TARGET_OS_VERSION == MACOSX_VERSION
#     undef Status
# endif
# endif
