/* Sun-$Revision: 30.2 $ */

/* Copyright 2007 David Ungar
   See the LICENSE file for license information. */

// Contains platform-specific declarations for MacToolboxWindow.
// This file is included into middle of class declaration.

# pragma once

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if !defined(QUARTZ_LIB)

class QuartzWindow {}; // dummy

# else

class EventQueue;
class EventRecord;


  // Must track all window pointers because can get events for other windows;
  // So, implement a window set:
  
  typedef void* WindowSet_WindowPtr;
class WindowSet  /* AllStatic */ {
    
    static const int _max_windows = 100;
    static WindowSet_WindowPtr _my_windows[_max_windows];
    static int       _num_windows;
    
   public:
    static void            add_window(WindowSet_WindowPtr);
    static void            rm_window(WindowSet_WindowPtr);
    static bool      includes_window(WindowSet_WindowPtr);
};


#  undef ASSEMBLER
#  undef Alloc
#  undef Status

#  include <Carbon/Carbon.h>
#  include <ApplicationServices/ApplicationServices.h>

// remove Carbon macros to avoid name collisions
#  undef assert
#  undef assert_type
#  undef assert_smi
#  undef assert_byteVector
#  undef assert_objVector

#  include "asserts.hh"
#  undef verify
#  undef check
// #  undef XLIB



// UI2 wants each window to have its own event queue
class EventQueue {
  enum { eventQ_length = 1000 };
  
  uint32         _count;
  uint32         read_pos;          // next element to 'get' 
  uint32         write_pos;         // last used element 
  EventRef       evts[eventQ_length]; // the buffer representation
  EventRef       last_put_event;    // last event put, for filtering
	
 public:	
 
  EventQueue() {
    _count = 0;  read_pos = 0;  write_pos = eventQ_length - 1;
    last_put_event = NULL;
  }
  
  uint32 count() { return _count; }
  
  EventRef peek() {
    if (count() == 0) return NULL;
    EventRef e = evts[read_pos];
    RetainEvent(e); // Self will do a releae, but need to not release it yet
    return e;
  }
  
  
  EventRef get() {
    if (count() == 0) return NULL;
    EventRef e = evts[read_pos];
    remove_event();
    return e;
  }
  

  void put(EventRef e) {
    RetainEvent(e); // Self will eventually release it
    EventRef lpe = last_put_event;
    uint32 c1 = GetEventClass(lpe),  c2 = GetEventClass(e);
    uint32 k1 = GetEventKind( lpe),  k2 = GetEventKind( e);
    uint16 a1, a2;
    int32 d1, d2, dt;
    
    // To keep Self from falling behind, coalesce both mouse motion events
    // and also mouse wheel events.
    
    # define GET_AXIS(evt, d) \
      GetEventParameter(evt, kEventParamMouseWheelAxis, typeMouseWheelAxis, NULL, sizeof(d), NULL, &d)
    # define GET_DELTA(evt, d) \
      GetEventParameter(evt, kEventParamMouseWheelDelta, typeSInt32, NULL, sizeof(d), NULL, &d)
    
    # define SET_DELTA(evt, s) \
      SetEventParameter(evt, kEventParamMouseWheelDelta, typeSInt32, sizeof(s), &s)

         if ( count() == 0   ||   c1 != kEventClassMouse   ||   c2 != kEventClassMouse )
                unfiltered_put(e); // do not overwrite
            
    else if ( (    k1 == kEventMouseMoved  ||  k1 == kEventMouseDragged)
         &&   (    k2 == kEventMouseMoved  ||  k2 == kEventMouseDragged
               ||  k2 == kEventMouseUp     ||  k2 == kEventMouseDown
               ||  k2 == kEventMouseWheelMoved )  )
               overwrite_last_event(e);

    else if ( k1 == kEventMouseWheelMoved   &&   k2 == kEventMouseWheelMoved 
         &&   GET_AXIS(  lpe, a1) == noErr  &&   GET_AXIS( e, a2) == noErr   &&   a1 == a2
         &&   GET_DELTA( lpe, d1) == noErr  &&   GET_DELTA(e, d2) == noErr
         &&   (( dt = d1 + d2 ), true)      &&   SET_DELTA(e, dt) == noErr )
               overwrite_last_event(e);
    else
               unfiltered_put(e); // do not overwrite last event       

    last_put_event = e;
    
    # undef GET_AXIS
    # undef GET_DELTA
    # undef SET_DELTA
  }
  


 private:
 
  void incr_pos(uint32& pos) {
    pos = pos == eventQ_length - 1  ?  0  :  pos + 1;
  }
  
  void incr_write_pos() {
    if (count() == eventQ_length)
      return; // full!
    ++_count;
    incr_pos(write_pos);
  }
  void unfiltered_put(EventRef e) {
    incr_write_pos();
    evts[write_pos] = e;
  }
  void overwrite_last_event(EventRef e) {
    ReleaseEvent(evts[write_pos]); // Self won't get to release this
    evts[write_pos] = e;
  }
  
  void remove_event() {
    //  lprintf("remove_event %d %d %d\n", evts[read_pos].what, evts[read_pos].where.h, evts[read_pos].where.v);
    if (count() == 0) fatal("no more events");
    --_count;
    incr_pos(read_pos);
  }
};


class QuartzWindow: public AbstractPlatformWindow {
 protected:
  bool _is_open;
  EventHandlerUPP _my_event_handler_upp;
  EventHandlerRef _my_event_handler;
  EventHandlerUPP _my_spy_event_handler_upp;
  EventHandlerRef _my_spy_event_handler;
  EventQueue _evtQ;  
  bool _bounds_changed;
  bool _was_closed;
  ATSFontMetrics _metrics;
  ATSFontRef     _default_font;
  CGColorSpaceRef _color_space;
  WindowRef  _quartz_win;  // MacOS window pointer
  CGContextRef myContext;
  

 public:
  
  QuartzWindow();
 ~QuartzWindow() { close(); }

  bool open( const char* display_name,
                     int x, int y, int w, int h,
                     int min_w, int max_w, int min_h, int max_h, // -1 for don't care
                     const char* window_name,  const char* icon_name,
                     const char* font_name,    int   font_size );
  void activate();
  void close();
  
  
  // Accessors:
  bool is_open() { return _is_open; }
  bool is_mono() { return false; } // not supported

  int  left(), top(), width(), height();  
  
  // The inset... methods give the inset between the outer parts and the inner.
  virtual int   inset_left(), inset_top(), inset_right(), inset_bottom();

  void warp_pointer(int x, int y);
  void  full_redraw();
  
  void set_bounds_changed() { _bounds_changed = true; }
  void set_was_closed() { _was_closed = true; }
  int  screen_width(), screen_height(), menubar_height();
  int  font_width(), font_height();
  const char* default_fixed_font_name();
  int   default_fixed_font_size();

  WindowRef my_window() { return _quartz_win; }
  
  void*  xdisplay() { return NULL; }

  
  
  // Handy operations:  
  // The parameters for the next two operations are for the OUTER part of the window.
  bool  change_extent(int left, int top, int w, int h);
  void  adjust_after_resize();
    
  
  // Drawing:
  // Enclose a set of drawing commands in pre_ and post_:
  virtual bool  pre_draw(bool incr); // dont proceed if I return false
  virtual void  post_draw(bool incr);
   
  void  draw_text( const char* text, int x, int y );
  void  draw_line(int x1, int y1, int x2, int y2);
  void  draw_rectangle_black(int x, int y, int w, int h);
  
  void  fill_rectangle(int x, int y, int w, int h);
  void  clear_rectangle(int x, int y, int w, int h);

  virtual void  set_color(int c); // param is result of red()... below
  virtual void  set_thickness(int t);
  virtual void  set_xor();
  virtual void  set_copy();

  static oop get_scrap_text();
  static int put_scrap_text(const char* s, int len);


  static void   check_carbon_events();
  int           events_pending(void* FH);
  EventRef      next_event(void* FH);
  EventRef      peek_event(void* FH);
  void          put_event(EventRef e);
    
  OSStatus handle_event(EventHandlerCallRef handler_call_chain, EventRef e);
  OSStatus handle_spy_event(EventHandlerCallRef handler_call_chain, EventRef e);
  
  OSStatus    AddHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH);
  OSStatus RemoveHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH);

 protected:
  
  void init_events();
  void init_colors();
  void init_font_info();

  void get_window_region_rect(int, Rect*);
  virtual bool tell_platform_size_hints();

  bool get_graphics_semaphore();
  void setupCTM();
  
  
  // Mac-specific open call:        
   
  // values for behind parameter in platform-specific open below
  // static void* /* really WindowPtr */ behind_all() { return NULL; }
  // static void* /* really WindowPtr */ front()      { return (void*)-1; }
  
public:         
          
  
  virtual bool  open( 
          uint32 /* WindowClass */,
          uint32 /* WindowAttributes */,
          int   left            = 100,
          int   top             = 100, 
          int   right           = 200, 
          int   bottom          = 200, 
          const char* title     = "",
          const char* font_name = "Monaco",
          int   font_size       = 10 );


public:
  static QuartzWindow* getPlatformWindow(WindowRef ww, void* FH);

};


# endif // QUARTZ_LIB
