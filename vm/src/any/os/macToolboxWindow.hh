/* Sun-$Revision: 30.7 $ */

/* Copyright 1998-2006 Sun Microsystems, Inc.
   See the LICENSE file for license information. */

// Contains platform-specific declarations for MacToolboxWindow.
// This file is included into middle of class declaration.

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if defined(MACTOOLBOX_LIB) || __MWERKS__

class EventQueue;
class FontInfo;
class EventRecord;
class Rect;

class MacToolboxWindow: public AbstractPlatformWindow {

 protected:
  // State:  
  void* /* really WindowPtr */  _mac_window;  // MacOS window pointer
  bool       _is_open;
  
  FontInfo*  _font_info;
  short      _font_family_id;
  short      _font_size;
  
  // For saving/restoring state across pre_/post_ redraw
  // These may not be strictly necessary
  void* /* really CGrafPtr */   _old_port;
  void* /* really GDHandle */   _old_gdh;
  short      _old_font_family_id;
  short      _old_font_size;
  

 public:
  MacToolboxWindow();
  ~MacToolboxWindow() { close(); }
  
  bool open( char* display_name,
             int x, int y, int w, int h,
             int min_w, int max_w, int min_h, int max_h, // -1 for don't care
             char* window_name,  char* icon_name,
             char* font_name,    int   font_size );
             
  void close();
  void activate();
  
  bool is_open();
  bool is_mono();
  
  int  left(), top(), width(), height();  
  int  screen_width(), screen_height(), menubar_height();
  int  font_width(), font_height();
  char* default_fixed_font_name();
  int   default_fixed_font_size();
  
  void* /* really WindowPtr */ mac_window() { return (void*) _mac_window; }
  
  
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
  
  void  fill_rectangle_black(int x, int y, int w, int h);
  void  clear_rectangle(int x, int y, int w, int h);
  
  void  set_color(int c); // param is result of red()... below
  void  set_thickness(int t);
  void  set_grey();
  void  set_solid();
  void  set_xor();
  void  set_copy();
  
 protected:
  // Platform-specific fn:
  bool tell_platform_size_hints();

             
  // On Mac, can get fiont info before opening a window.
  // Returns true if succeeds.
  static bool get_font_info(
          /*  in params: */ char*     font_name,  int    font_size, 
          /* out params: */ FontInfo* font_info,  short& font_family);
          
          
  // Mac-specific open call:        
   
  // values for behind parameter in platform-specific open below
  static void* /* really WindowPtr */ behind_all() { return NULL; }
  static void* /* really WindowPtr */ front()      { return (void*)-1; }
  
  /*
   * ProcID's:
          documentProc    = 0;  {standard document }
                          { window, no zoom box}
          dBoxProc        = 1;  {alert box or modal }
                          { dialog box}
          plainDBox      = 2;  {plain box}
          altDBoxProc      = 3;  {plain box with shadow}
          noGrowDocProc    = 4;  {movable window, }
                          { no size box or zoom box}
          movableDBoxProc  = 5;  {movable modal dialog box}
          zoomDocProc      = 8;  {standard document window}
          zoomNoGrow      = 12;  {zoomable, nonresizable }
                          { window}
          rDocProc        = 16;  {rounded-corner window}
   */
 public:         
          
  
  virtual bool  open( 
          short procID          = 0,
          int   left            = 100,
          int   top             = 100, 
          int   right           = 200, 
          int   bottom          = 200, 
          char* title           = "",
          bool  visible         = true, 
          void* behind          = front(), /* void* is really WindowPtr*/
          bool  has_close_box   = true,
          char* font_name       = "Monaco",
          int   font_size       = 10 );
          
  // Accessors:
  
  void*  /* really GDHandle */ screen();
  void*  /* really GDPtr    */ screen_pointer(); // not the handle, but the pointer
  
  void warp_pointer(int x, int y);
 
  // Event helpers: convert from WindowPtr or events to my address
  
  static MacToolboxWindow* as_win_from_mac_win(const void*);
  static MacToolboxWindow* as_win_from_event(const EventRecord*);
  
  
  // Events: (sent from os_mac.c)
    
  virtual void   handle_update_event(          EventRecord*);
  virtual void   handle_activate_event(        EventRecord*);
  virtual void   handle_misc_event(            EventRecord*);
  virtual void   mouse_down_in_content_region( EventRecord*);
  virtual void   mouse_down_in_drag_bar(       EventRecord*);
  virtual void   mouse_down_in_grow_box(       EventRecord*);  
  virtual void   zoom(int winPart);
 
  
 protected:
  // Drawing helpers:
  
  void set_port(), reset_port();
  void draw_grow_icon_without_scroll_bar_borders();
  bool get_graphics_semaphore();
  
  
  // Layout helpers:
  
  static const int min_doc_size = 64,  max_doc_size = (1 << 15) - 1;    

  void get_window_region_rect(int, Rect*);

  // Event helpers:
         
  virtual void get_growth_limit(Rect*);

  
 public:
  static bool   handle_event(EventRecord*);
  static void   check_mac_events();
  static void   check_mac_events(bool give_time_to_other_apps, int mask);
  int           events_pending(void* FH);
  EventRecord*  next_event(void* FH);
  EventRecord*  peek_event(void* FH);
  void          put_event(EventRecord* e);
   
 protected:  
  EventQueue* _evtQ;
  
 public:
  static oop get_scrap_text();
  static int put_scrap_text(char* s, int len);
  
  
  static oop test_window_prim(oop rcvr);


  
};


# endif // MACTOOLBOX_LIB
