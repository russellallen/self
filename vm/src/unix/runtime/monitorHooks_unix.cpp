/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "_monitorHooks_unix.cpp.incl"


void TrackCHeapInMonitor::reset() { 
  // Do platform-dependent reset
  set_allocated( 0 );
}

