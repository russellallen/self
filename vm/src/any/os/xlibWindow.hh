#pragma once
/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// Contains platform-specific declarations for PlatformWindow.
// This file is included into middle of class declaration.
# include "platformWindow.hh"


# ifdef XLIB

class XPlatformWindow: public AbstractPlatformWindow {

 protected:
  Display*      _display;  // xErrorHandler checks the spy's X display
  int           _screen_num;
  int           _display_width, _display_height;
  Window        _xwindow;
  int           _window_x, _window_y;
  int           _width,  _height;  
  XFontStruct*  _font_info;  
  Atom          _wmProtocolsAtom, _wmDeleteWindowAtom;
  GC            _gc;
  bool          _is_mono;

 public:
  XPlatformWindow();
 ~XPlatformWindow() {close(); }

  
  bool open( const char* display_name,
             int x, int y, int w, int h,
             int min_w, int max_w, int min_h, int max_h, // -1 for don't care
             const char* window_name,  const char* icon_name,
             const char* font_name,    int   font_size );
             
  void close();
  
  bool is_open();
  bool is_mono();
  
  int  left(), top(), width(), height();  
  int  screen_width(), screen_height(), menubar_height();
  int  font_width(), font_height();
  const char* default_fixed_font_name();
  int   default_fixed_font_size();
  
  
  // Handy operations:  
  // The parameters for the next two operations are for the OUTER part of the window.
  // The inset... methods give the inset between the outer parts and the inner.
  virtual bool  change_extent(int left, int top, int w, int h);
  virtual int   inset_left(), inset_top(), inset_right(), inset_bottom();
  virtual void  adjust_after_resize();
  virtual void  full_redraw();
    
  
  // Drawing:
  // Enclose a set of drawing commands in pre_ and post_:
  virtual bool  pre_draw(bool incr); // dont proceed if I return false
  virtual void  post_draw(bool incr);
   
  void  draw_text( const char* text, int x, int y );
  void  draw_line(int x1, int y1, int x2, int y2);
  void  draw_rectangle_black(int x, int y, int w, int h);
  
  void  fill_rectangle(int x, int y, int w, int h);
  void  clear_rectangle(int x, int y, int w, int h);
  
  void  set_color(int c); // param is result of red()... below
  void  set_thickness(int t);
  void  set_xor();
  void  set_copy();
  
 protected:
  // Platform-specific fn:
  bool tell_platform_size_hints();


 public:  
  // Accessors:
  void*  xdisplay() { return _display; }
  
  
 protected:
  // Open helpers
  bool  open_xdisplay(const char*);
  void  setup_events();
  bool  set_name(const char*);
  bool  set_icon_name(const char*);
  bool  set_font_info(const char*);
  bool  setup_gcs();
  
  // Drawing helpers
  bool    get_graphics_semaphore(); // X is not reentrant
    
  // Events:
  // for window systems (like X) where you can poll window events, return false if window is closed
  bool    handle_polled_events();
  void    handle_reparent_event(XEvent&);

};


# endif // XLIB
