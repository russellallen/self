/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "platformWindow_unix.hh"
# pragma implementation "platformWindow.hh"


# include "_platformWindow.cpp.incl"

// Platform-independant functions:


bool AbstractPlatformWindow::change_size_hints(int min_w, int max_w, int min_h, int max_h) {
  // supposed to be for outside
  _min_w = min_w;  _max_w = max_w;  _min_h = min_h;  _max_h = max_h;
  return tell_platform_size_hints();
}
