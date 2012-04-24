/* Sun-$Revision: 30.10 $ */

/* Copyright 1998-2006 Sun Microsystems, Inc.
   See the LICENSE file for license information. */

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// An OS-specific basic window, specialized for the spy.
// Includes standard drawing API, and support for one font.

class AbstractPlatformWindow: public CHeapObj {
 protected:
  // State:
  long int  _red, _yellow, _black, _white, _gray;
  int _min_w, _max_w, _min_h, _max_h; // these are for outer part of window

 public:
  // Creation/destruction:
  AbstractPlatformWindow() {}
  
  // Opening/closing:
  // There also may be a platform-specific open
  // All positions & sizes include window frame as well as inner part.
  virtual bool open( const char* display_name,
                     int x, int y, int w, int h,
                     int min_w, int max_w, int min_h, int max_h, // -1 for don't care
                     const char* window_name,  const char* icon_name,
                     const char* font_name,    int   font_size ) = 0;
  virtual void close() = 0;
  
  
  // Accessors:
  virtual bool is_open() = 0;
  virtual bool is_mono() = 0;
  virtual int  left() = 0, top() = 0, width() = 0, height() = 0;  
  virtual int  screen_width() = 0, screen_height() = 0, menubar_height() = 0;
  virtual int  font_width() = 0, font_height() = 0;
  virtual const char* default_fixed_font_name() = 0;
  virtual int   default_fixed_font_size() = 0;
  
  virtual void*  xdisplay() { return NULL; }

  
  
  // Handy operations:  
  // The parameters for the next two operations are for the OUTER part of the window.
  // The inset... methods give the inset between the outer parts and the inner.
  virtual bool  change_extent(int left, int top, int w, int h) = 0;
  virtual bool  change_size_hints( int min_w, int max_w, int min_h, int max_h );
  virtual int   inset_left() = 0, inset_top() = 0, inset_right() = 0, inset_bottom() = 0;
  virtual void  adjust_after_resize() = 0;
  virtual void  full_redraw() = 0;
    
  
  // Drawing:
  // Enclose a set of drawing commands in pre_ and post_:
  virtual bool  pre_draw(bool incr) = 0; // dont proceed if I return false
  virtual void  post_draw(bool incr) = 0;
   
  virtual void  draw_text( const char* text, int x, int y ) = 0;
  virtual void  draw_line(int x1, int y1, int x2, int y2) = 0;
  virtual void  draw_rectangle_black(int x, int y, int w, int h) = 0;
  
  virtual void  fill_rectangle(int x, int y, int w, int h) = 0;
  virtual void  clear_rectangle(int x, int y, int w, int h) = 0;
  
  void  clear_square(int x, int y, int s) { clear_rectangle      (x, y, s, s); }
  void   draw_square(int x, int y, int s) {  draw_rectangle_black(x, y, s, s); }

  virtual void  set_color(int c) = 0; // param is result of red()... below
  virtual void  set_thickness(int t) = 0;
  virtual void  set_xor() = 0;
  virtual void  set_copy() = 0;
  
  long int red()    { return _red; }
  long int yellow() { return _yellow; }
  long int black()  { return _black; }
  long int white()  { return _white; }
  long int gray()   { return _gray; }

 protected:
  // Platform-specific fn:
  virtual bool tell_platform_size_hints() = 0;
  
};
