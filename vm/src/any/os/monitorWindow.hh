#pragma once
/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "platformWindow.hh"



// I implement a window specialized for the spy.

class Monitor;

class MonitorWindow: public CHeapObj  {
 protected:
  Monitor* _m; // backpointer to the spy
  Monitor* my_monitor() { return _m; }
  
 public:
  AbstractPlatformWindow *pw;
  
 public:
  MonitorWindow();
  
  bool  open_and_resize(Monitor*); // opens window and resizes for spy
  void  close();
  
  // Handy operations:
  void  adjust_after_resize();
  void  full_redraw();
  
  int      width(),      height();
  int font_width(), font_height();
  
protected:
  // Desired default size/place of spy window (spanning bottom of screen):
  int   initial_left(),  initial_top(),  initial_width(),  initial_height();

  // platform fns:
  const char* compute_window_name();
  const char* compute_display_name();
}; 
