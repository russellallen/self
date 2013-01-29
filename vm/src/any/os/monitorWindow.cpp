/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "monitorWindow_unix.hh"
# pragma implementation "monitorWindow.hh"


# include "_monitorWindow.cpp.incl"

MonitorWindow::MonitorWindow() {
  _m = NULL;
  pw = NULL;
}


bool MonitorWindow::open_and_resize(Monitor* m) {
  _m = m;
  
  pw = 0;
# ifdef QUARTZ_LIB
  if (!SpyDisplay[0]) {
    pw = (AbstractPlatformWindow*) new QuartzWindow;
  }
# endif
  
# ifdef XLIB
  if (!pw) {
    pw = (AbstractPlatformWindow*) new XPlatformWindow;
  }
# endif
  
  if (!pw) {
    warning("no window system for spy");
    return false;
  }
  
  // open the window, and resize for the spy
  // set size hints to don't care cause we will resize window below
  if (!  pw->open( compute_display_name(),
                  100, 100, 500, 500,
                  -1,  -1,  -1,  -1,
                  compute_window_name(),
                  "Spy",
                  SpyFont[0] ? SpyFont : pw->default_fixed_font_name(),
                  pw->default_fixed_font_size()))
    return false;
  
  // Spy uses fixed-width font and sizes window accordingly.
  // On some platforms, cannot get font till window is open.
  // So, now that window is opened, can ask spy for height, and
  // can set window place/size and size limits.
  if (!pw->change_extent( initial_left(), initial_top(), initial_width(), initial_height()))  { close();  return false; }
  if (!pw->change_size_hints( -1,  initial_width(), initial_height(), initial_height()))       { close();  return false; }
  return true;
}




const char* MonitorWindow::compute_display_name() {
  const char* ev = OS::get_environment_variable("DISPLAY");
  const char* prim = SpyDisplay;
  return  prim && prim[0]  ?  prim
       :  ev               ?  ev
       :  ":0";
}

    
const char* MonitorWindow::compute_window_name() {
  const char *username= OS::get_user_name();
  const char *hostName= OS::get_host_name();
  const char* window_base_name = "Self Spy of ";
  char* window_name =
    (char*)selfs_malloc(strlen(window_base_name) + strlen(username) + 1
                        + strlen(hostName) + 1);
  sprintf(window_name, "Self Spy of %s@%s", username, hostName);
  return window_name;
}


void MonitorWindow::close() {
  if (pw->is_open())
    pw->close();
  if (my_monitor()->is_active())
    my_monitor()->deactivate(); 
}


void MonitorWindow::adjust_after_resize() {
  my_monitor()->adjust_after_resize();
 pw->adjust_after_resize();
}
                 

void MonitorWindow::full_redraw() {
  // Do not call  PlatformWindow::full_redraw();
  // It does Begin/End Updates which mess up the spy.
  my_monitor()->full_redraw();
}


// Based on screen size, foctors in insets, that is size of window frame
int MonitorWindow::initial_left()   { return  0; }
int MonitorWindow::initial_top()    { return  pw->screen_height() - initial_height(); }
int MonitorWindow::initial_width()  { return  pw->screen_width(); }
int MonitorWindow::initial_height() { return  my_monitor()->contents_height() + pw->inset_top() + pw->inset_bottom(); }

int MonitorWindow::width()  { return pw->width(); }
int MonitorWindow::height() { return pw->height(); }

int MonitorWindow::font_width()  { return pw->font_width(); }
int MonitorWindow::font_height() { return pw->font_height(); }
