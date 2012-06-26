/* Sun-$Revision: 30.13 $ */
// $Revision: 30.13 $

/* Copyright 1998-2006 Sun Microsystems, Inc.
   See the LICENSE file for license information. */
   
// Mac implementation:

# pragma implementation

# if defined(MACTOOLBOX_LIB) || TARGET_API_MAC_CARBON

# if TARGET_OS_VERSION == MACOSX_VERSION && !TARGET_API_MAC_CARBON
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
  #  undef XLIB

# elif TARGET_API_MAC_CARBON
#   include <MacHeadersCarbon.pch++> // eschew the precompiled version because I sometimes use paths to compile against newer headers

# else // MACOS, precarbon
#  define frame     macintosh_frame // avoid conflict with our frames

#   include <MacHeaders.pch++> // precarbon_prefix.h sets include flags; precomp header does not work
// for debugging:  #   include <MacHeaders.pch++>
#   include <MachineExceptions.h>
#   include <Timer.h>
#   include <EPPC.h>
#   include <fp.h> // for rint
#   undef frame
# endif


# include "_macToolboxWindow.cpp.incl"

# if TARGET_OS_FAMILY == MACOS_FAMILY
#   include <MacHeadersCarbon.pch++> // eschew the precompiled version because I sometimes use paths to compile against newer headers
#   include "SIOUX.h" // quotes because we have modified it
#   include "SIOUXGlobals.h" // ditto
#   include <console.h>
# endif

static void activate_window_from_event(EventRecord* evt);


// UI2 wants each window to have its own event queue
class EventQueue {
  enum { eventQ_length = 100 };
  
  uint32         _count;
  uint32         read_pos;          // next element to 'get' 
  uint32         write_pos;         // last used element 
  EventRecord    evts[eventQ_length]; // the buffer representation
  EventRecord    last_put_event;    // last event put, for filtering
	
 public:	
 
  EventQueue() {
    _count = 0;  read_pos = 0;  write_pos = eventQ_length - 1;
    last_put_event.what = nullEvent; last_put_event.where.h = last_put_event.where.v = 0;
  }
  
  uint32 count() { return _count; }
  
  EventRecord* peek() {
    if (count() == 0) return NULL;
    return &evts[read_pos];
  }
  
  void remove_event() {
    //  lprintf("remove_event %d %d %d\n", evts[read_pos].what, evts[read_pos].where.h, evts[read_pos].where.v);
    if (count() == 0) fatal("no more events");
    --_count;
    incr_pos(read_pos);
  }

  void put(EventRecord* e) {
    if ( events_are_identical(e, &last_put_event ) ) {
      // eat redundant mouse-move's
    }
    else if ( count() != 0
         &&   events_are_same_kind(e, &last_put_event )
         &&   evt_just_moves_mouse(e))
      overwrite_last_event(e);
    else
      unfiltered_put(e); // do not overwrite last event       
      
   last_put_event = *e;
  }
  


 private:
 
  static bool evt_just_moves_mouse(EventRecord* e) {
    return  e->what == nullEvent
       ||   e->what == osEvt  && (e->message >> 24) == mouseMovedMessage;
  }

  void incr_pos(uint32& pos) {
    pos = pos == eventQ_length - 1  ?  0  :  pos + 1;
  }
  
  void incr_write_pos() {
    if (count() == eventQ_length)
      return; // full!
    ++_count;
    incr_pos(write_pos);
  }
  void unfiltered_put(EventRecord* e) {
    incr_write_pos();
    evts[write_pos] = *e;
  }
  void overwrite_last_event(EventRecord* e) {
    evts[write_pos] = *e;
  }
  static bool position_changed(EventRecord* e1, EventRecord* e2) {
    return e1->where.h != e2->where.h  ||  e1->where.v != e2->where.v;
  }

  static bool events_are_same_kind(EventRecord* e1, EventRecord* e2) {
    if ( evt_just_moves_mouse(e1)  &&  evt_just_moves_mouse(e2) )
      return true;
      
    return
        e1->what      == e2->what
    &&  e1->modifiers == e2->modifiers
    &&  e1->message   == e2->message;
  }

  static bool events_are_identical(EventRecord* e1, EventRecord* e2) {
    return
        e1->what      == e2->what
    &&  e1->modifiers == e2->modifiers
    &&  e1->message   == e2->message
    &&  e1->where.h   == e2->where.h
    &&  e1->where.v   == e2->where.v;
  }
};


// ===========================



  // Must track all window pointers because can get events for other windows;
  // So, implement a window set:
  class WindowSet  /* AllStatic */ {
    
    static const int _max_windows = 100;
    static WindowPtr _my_windows[_max_windows];
    static int       _num_windows;
    
   public:
    static void            add_window(WindowPtr);
    static void            rm_window(WindowPtr);
    static bool      includes_window(WindowPtr);
  };





// ===========================
// First: cross-platform functions:

// Creation, destruction:

MacToolboxWindow::MacToolboxWindow() {
  _old_port = NULL;
  _old_gdh  = NULL;
  _font_family_id = _font_size = _old_font_family_id = _old_font_size = 0;
  _is_open = false;  
  _mac_window = NULL;
  _font_info = new FontInfo();
  _min_w = _min_h = _max_w = _max_h = -1; // set to don't care
  _evtQ = NULL;
}

// (destructor is plat-independant)


// Open/Close:


bool MacToolboxWindow::open( char* /* display_name  unimp mac */,
                           int x, int y, int w, int h,
                           int min_w, int max_w, int min_h, int max_h, // -1 for don't care
                           char* window_name,  char* /*icon_name*/,
                           char* font_name,    int   font_size ) {
  if ( !open(zoomDocProc, x, y, x + w, y + h, window_name, true, (WindowPtr)front(), true, font_name, font_size))
    return false;
  if ( !change_size_hints(min_w, max_w, min_h, max_h)) { close();  return false; }
  activate();
  return true;
}


bool MacToolboxWindow::open( 
                    short procID,
                    int   left,
                    int   top, 
                    int   right, 
                    int   bottom, 
                    char* title,
                    bool  visible, 
                    void* behind, 
                    bool  has_close_box,
                    char* font_name,
                    int   font_size ) {
                    
  if (_font_info == NULL) _font_info = new FontInfo();
  if (!get_font_info(font_name, font_size, _font_info, _font_family_id))
    return false;
  _font_size = font_size;
  
  Rect bounds; SetRect(&bounds, left, top, right, bottom);
  Str255 ptitle;
  CopyCStringToPascal(title, ptitle);
  // lprintf("vis = %d, procID = %d, behind = %d, had_close_box = %d\n", visible, procID, behind, has_close_box);
  _mac_window = (void*)NewCWindow( NULL, &bounds, ptitle, (Boolean)visible, procID,
                                 (WindowPtr)behind, (Boolean)has_close_box, (long)this);
  WindowSet::add_window((WindowPtr)mac_window());
  _is_open = true;
  
  _red    =    redColor;
  _yellow = yellowColor;
  _black  =  blackColor;
  _white  =  whiteColor;
  
  _evtQ = new EventQueue;
  
  return true;                   
} 
 
 
bool MacToolboxWindow::get_font_info(char* font_name, int font_size, FontInfo* fi, short& ffam) {
  Str255 pfont_name;
  CopyCStringToPascal(font_name, pfont_name);
  GrafPtr current_port;
  GetPort(&current_port);
  short of = GetPortTextFont(current_port);
  short os = GetPortTextSize(current_port);
  FMFontFamily ff = FMGetFontFamilyFromName(pfont_name); 
  if (sizeof(ff) != sizeof(ffam))
    fatal("This type trick won't work");
  ffam = ff;
  if (ffam == kInvalidFontFamily)
    return false; // no font
  TextFont(ffam); TextSize(font_size);
  // Overwrites into fi!
  GetFontInfo(fi);
  TextFont(of);  TextSize(os);
  return true;
}


void MacToolboxWindow::close() {
  if (!is_open())   return; // been closed
  WindowSet::rm_window((WindowPtr)mac_window());
  DisposeWindow((WindowPtr)mac_window());
  delete _font_info;
  _font_info = NULL;
  _mac_window = NULL;
  _is_open = false;
  delete _evtQ;  _evtQ = NULL;
}


void MacToolboxWindow::warp_pointer(int x, int y) {
  // lprintf("warping to: %d, %d\n", x, y);
# if TARGET_OS_VERSION == MACOSX_VERSION
    CGPoint pt;
    pt.x = x;
    pt.y = y;
    const int n = 16;
    CGDisplayCount count = 0;
    CGDirectDisplayID dspys[n];
    CGDisplayErr err = CGGetDisplaysWithPoint( pt, n, dspys, &count);
    if (err != noErr) {
      lprintf("CGGetDisplaysWithPoint failed: %d\n", err);
      return;
    }
    // lprintf("CGGetDisplaysWithPoint count = %d\n", count);
    for (int i = 0;  i < count;  ++i) {
      // MUST adj pt to be relative to TL of display -- dmu 5/03
      CGRect bounds = CGDisplayBounds(dspys[i]);
      CGPoint adjusted_pt;
      adjusted_pt.x = pt.x - bounds.origin.x;
      adjusted_pt.y = pt.y - bounds.origin.y;
      err = CGDisplayMoveCursorToPoint( dspys[i], adjusted_pt);
      // lprintf("CGDisplayMoveCursorToPoint %d returned %d\n", i, err);
    }
# else
  Unused(x); Unused(y);
# endif
}


// Insets:

// Compute inset from outer to inner part of windows 
// by comparing portRect against strucRgn bounding box

// Strangely, on Mac, the inner part of the window includes the scroll bar.
// So, add that to offset for bottom/right. 

// Ah, but on Carbon, we can get content area, so ixnay the ollbarscray.
int MacToolboxWindow::inset_left() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = cr.left - sr.left;
  // warning1("inset_left = %d", r);
  return r;
}

int MacToolboxWindow::inset_top() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = cr.top - sr.top;
  // warning1("inset_top = %d", r);
  return r;
}

int MacToolboxWindow::inset_right() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = sr.right - cr.right;
  // warning1("inset_right = %d", r);
  return r;
}

int MacToolboxWindow::inset_bottom() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = sr.bottom - cr.bottom;
  // warning1("inset_bottom = %d", r);
  return r;
}


void MacToolboxWindow::get_window_region_rect(int wh, Rect* r) {
  RgnHandle wrh = NewRgn();
  OSStatus err = GetWindowRegion((WindowPtr)mac_window(), (WindowRegionCode)wh, wrh);
  if (err != noErr) {
    r->left = r->top = 0; r->bottom = r->right = 1;
  }
  else
    GetRegionBounds(wrh, r);
  DisposeRgn(wrh);
}


// Accessors:

bool MacToolboxWindow::is_open() { return _is_open; }
bool MacToolboxWindow::is_mono() { return false; } // mono not supported

// these should be inner
int  MacToolboxWindow::left()   { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.left; }
int  MacToolboxWindow::top()    { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.top;  } 
int  MacToolboxWindow::width()  { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.right  - r.left; }
int  MacToolboxWindow::height() { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.bottom - r.top; }


int MacToolboxWindow::screen_width() {
  GDHandle s = (GDHandle)screen();
  return (*s)->gdRect.right - (*s)->gdRect.left;
}

int MacToolboxWindow::screen_height() {
  // excludes menu bar
  GDHandle s = (GDHandle)screen();
  return (*s)->gdRect.bottom - (*s)->gdRect.top;
}
    
// If Screen this window is mostly on has no bar, return 0.    
int MacToolboxWindow::menubar_height() {
  return (GDHandle)screen() == GetMainDevice()  ?  GetMBarHeight()  :  0;
}

int MacToolboxWindow::font_width()  { return _font_info->widMax; }
int MacToolboxWindow::font_height() { 
  int h = _font_info->ascent + _font_info->descent; 
  assert(h >= 0, "negative font height?");
  return h;
}

char* MacToolboxWindow::default_fixed_font_name() { return "Monaco"; }
int   MacToolboxWindow::default_fixed_font_size() { return 9; }



// Handy operations:

// Long comments in this routine are extra stuff from the Mac toolbox assistant.

bool MacToolboxWindow::change_extent(int left, int top, int w, int h) {
  // Remember, left, top, w and h are for outer parts of window.  
  // convert to inner
  MoveWindow( (WindowPtr)mac_window(), left + inset_left(), top + inset_top(), false); 
  SizeWindow( (WindowPtr)mac_window(), w - inset_left() - inset_right(), h - inset_top() - inset_bottom(), true);              
  
  adjust_after_resize();        
  return true;
}


// On Mac, must redraw borders yourself:
void MacToolboxWindow::adjust_after_resize() { 
  set_port();
  draw_grow_icon_without_scroll_bar_borders();
  Rect bounds;
  GetPortBounds(GetWindowPort((WindowPtr)mac_window()), &bounds);
  InvalWindowRect((WindowPtr)mac_window(), &bounds);
  reset_port();
  full_redraw(); 
  if (TheSpy != NULL)
    TheSpy->adjust_after_resize(); // might be the spy
}

// A helper I lifted from the SDK:

void MacToolboxWindow::draw_grow_icon_without_scroll_bar_borders()
{ 
  RgnHandle saveClipRgn = NewRgn();
  Rect tempRect;

  if ( saveClipRgn )
  {
    Rect portBounds;

    GetClip( saveClipRgn );
    
    GetPortBounds( GetWindowPort( (WindowPtr)mac_window() ), &portBounds );

    SetRect( &tempRect,
        portBounds.right-15,
        portBounds.bottom-15,
        portBounds.right,
        portBounds.bottom );
    ClipRect( &tempRect );
    DrawGrowIcon( (WindowPtr)mac_window() );
    
    SetClip( saveClipRgn );
    DisposeRgn( saveClipRgn );
  }
  else
    DrawGrowIcon( (WindowPtr)mac_window() );
}


void MacToolboxWindow::full_redraw() {
  post_draw(false);
  if (TheSpy != NULL)
    TheSpy->full_redraw(); // might be the spy
}

 
// Drawing: 


bool MacToolboxWindow::pre_draw(bool incremental) {
  if ( get_graphics_semaphore())  return false;
  set_port();
  Rect bounds;
  GetPortBounds( GetWindowPort( (WindowPtr)mac_window() ), &bounds );
  ClipRect(&bounds);
  if (!incremental) {
    EraseRect(&bounds);
  }
  return true;
}


void MacToolboxWindow::post_draw(bool incremental) {
  if (!incremental)
    draw_grow_icon_without_scroll_bar_borders();
  reset_port();
}


void MacToolboxWindow::set_port() {
  GetGWorld((CGrafPtr*)&_old_port, (GDHandle*)&_old_gdh);
  SetPort(GetWindowPort((WindowPtr)mac_window()));
  TextFont(_font_family_id);
  TextSize(_font_size);
}

void MacToolboxWindow::reset_port() { 
  SetGWorld((CGrafPtr)_old_port, (GDHandle)_old_gdh);
  TextFont(_old_font_family_id);
  TextSize(_old_font_size);
}


void MacToolboxWindow::draw_text(const char* text, int x, int y)  { 
  int bc = strlen(text);
  /* note: text orig is top L, rect orig is bot L */ 
  // Mac draws ugly boxes for \n
  char* text_with_crs = (char*) alloca(bc + 1);
  for (int i = 0;  i <= bc;  ++i)
    text_with_crs[i] = text[i] == '\n'  ?  '\r'  :  text[i];
  short w = TextWidth( text_with_crs, 0, bc ); 
  Rect r; 
  SetRect(&r, x, y - font_height(), x + w, y); 
  EraseRect(&r);  
  MoveTo(x, y); 
  DrawText( text_with_crs, 0, bc ); 
} 

void MacToolboxWindow::draw_line(int x1, int y1, int x2, int y2) {
  MoveTo(x1, y1); PenNormal(); LineTo(x2, y2); 
}


void MacToolboxWindow::draw_rectangle_black(int x, int y, int w, int h) {
  if (w > 0 && h > 0) {
    Rect r;
    SetRect(&r, x, y-1, x+w, y+h);
    PenNormal();
    FrameRect(&r);
  }
}


void MacToolboxWindow::clear_rectangle(int x, int y, int w, int h) {
  if (w > 0 && h > 0) {
    Rect r; SetRect(&r, x, y-1, x+w, y+h); EraseRect(&r); 
  }
}


void MacToolboxWindow::fill_rectangle_black(int x, int y, int w, int h) {
  if (w > 0 && h > 0) { 
    Rect r;     
    SetRect(&r, x, y-1, x+w, y+h);  
    PaintRect(&r); 
  } 
}

void MacToolboxWindow::set_color(int c) { ForeColor(c); }


void MacToolboxWindow::set_thickness(int t) { PenSize(t, t); }
void MacToolboxWindow::set_grey()  { static Pattern p; GetQDGlobalsGray(&p);  PenPat(&p); }
void MacToolboxWindow::set_solid() { static Pattern p; GetQDGlobalsBlack(&p); PenPat(&p); }
void MacToolboxWindow::set_xor()   { PenMode(patXor);  }
void MacToolboxWindow::set_copy()  { PenMode(patCopy); }


bool MacToolboxWindow::get_graphics_semaphore() {
  // Carbon under OSX runs the spy asynchronously, just like on Solaris.
  // But, when running the spy and UI2, Self locks up in a loop sometimes.
  // Maybe the graphics toolbox is not reentrant, let's try the same scheme
  // used for X to avoid drawing from the spy in the midst of a signal if
  // the self is in the midst of a MacToolbox operation. -- dmu 9/01
  extern bool macToolbox_semaphore;
  return macToolbox_semaphore;
}
 

// Platform-specific helpers:

void* MacToolboxWindow::screen() {
  // locate window on avail graphics devices
  Rect windRect;   get_window_region_rect( kWindowGlobalPortRgn, &windRect);


  long greatestArea = 0;
  // check window against all gdRects in gDevice list to see
  // which gdRect contains largest area of window
  GDHandle gdZoomOnThisDevice = NULL;
  for (GDHandle gdNthDevice =  GetDeviceList();
                gdNthDevice != NULL;
                gdNthDevice =  GetNextDevice(gdNthDevice)) {
                
    if ( TestDeviceAttribute(gdNthDevice, screenDevice)
    &&   TestDeviceAttribute(gdNthDevice, screenActive) ) {
      // The SetRect routine calculates intersection, returns true if nonempty
      Rect theSect;
      bool sectFlag = SectRect(&windRect, &(*gdNthDevice)->gdRect, &theSect);
      // find which screen holds greatest area
      long sectArea = long(theSect.right - theSect.left)
                    * long(theSect.bottom- theSect.top);
      if ( sectArea > greatestArea ) {
        greatestArea = sectArea;
        gdZoomOnThisDevice = gdNthDevice;
      }
    }
  }
  return (void**)gdZoomOnThisDevice;
}

void* MacToolboxWindow::screen_pointer() { return *(GDHandle)screen(); }


bool MacToolboxWindow::tell_platform_size_hints() { return true; }



// Convert WindowPtr to MacToolboxWindow by using refcon
MacToolboxWindow* MacToolboxWindow::as_win_from_mac_win(const void* /*really WindowPtr*/ ww) {
  WindowPtr win = (WindowPtr)ww;
  if (!WindowSet::includes_window(win))  return NULL;
  MacToolboxWindow* w = (MacToolboxWindow*) GetWRefCon(win);
  assert(w->_mac_window == (void*)win, "");
  return w;
}

MacToolboxWindow* MacToolboxWindow::as_win_from_event(const EventRecord* evt) {
  return as_win_from_mac_win(WindowPtr(evt->message));
}



// Events:


void MacToolboxWindow::handle_update_event(EventRecord* e) {
  BeginUpdate((WindowPtr)mac_window());
  full_redraw();
  EndUpdate((WindowPtr)mac_window());
  put_event(e);
}


void MacToolboxWindow::handle_activate_event(EventRecord* e) {
  InitCursor();
  if (e->modifiers & activeFlag) {
    set_port();
    draw_grow_icon_without_scroll_bar_borders(); // prevent scroll bar lines it draws otherwise
    reset_port();
  }
  put_event(e);
}


void MacToolboxWindow::handle_misc_event(EventRecord* e) {
  put_event(e);
}


void MacToolboxWindow::mouse_down_in_content_region(EventRecord* evt) {
  evt->message = (uint32)this; // for Self event filtering
  put_event(evt);
}

void MacToolboxWindow::mouse_down_in_drag_bar(EventRecord* evt) {
  Rect r;
  GetRegionBounds(GetGrayRgn(), &r);
  DragWindow((WindowPtr)mac_window(), evt->where, &r);
}

  
void MacToolboxWindow::mouse_down_in_grow_box(EventRecord* evt) {
  // set up limiting rectangle
  Rect bbox;
  get_growth_limit(&bbox);
  
  //  call Window Manager to let user drag size box
  long int new_size = GrowWindow( (WindowPtr)mac_window(), evt->where, &bbox );
  if (new_size != 0) {
    change_extent( left() - inset_left(), // left, top are inner, change_extent is outer
                    top() - inset_top(),
                   LoWord(new_size) + inset_left() + inset_right(), // map inner -> outer
                   HiWord(new_size) + inset_top()  + inset_bottom());
                   
    static EventRecord e;
    e.message = (uint32)this;
    e.what = updateEvt;
    e.when = evt->when;
    put_event(&e);
  }
  adjust_after_resize();
}


void MacToolboxWindow::get_growth_limit(Rect* bbox) {
  // growth limits apply to inside of window
  // -1 means don't care
  // if limit is -1, use max/min, also adjust outer to inner
  SetRect( bbox, 
           _min_w == -1  ?  min_doc_size  :  max(_min_w - inset_left() - inset_right (), min_doc_size),
           _min_h == -1  ?  min_doc_size  :  max(_min_h - inset_top () - inset_bottom(), min_doc_size),
           _max_w == -1  ?  max_doc_size  :  min(_max_w - inset_left() - inset_right (), max_doc_size),
           _max_h == -1  ?  max_doc_size  :  min(_max_h - inset_top () - inset_bottom(), max_doc_size) );
}


void MacToolboxWindow::zoom(int winPart) {
 //  zooming to standard state
  GDHandle gdZoomOnThisDevice = (GDHandle)screen();
    
  // Create zoom rect
  Rect r = (*gdZoomOnThisDevice)->gdRect;
  
  Point s;  s.h = r.right - r.left;  s.v = r.bottom - r.top;

  // if main device, allow for menu bar height
  if (gdZoomOnThisDevice == GetMainDevice()) 
    s.h -= GetMBarHeight();
    
  // inset by 3 pixels!
  s.h -= 3;  s.v -= 3;
  ZoomWindowIdeal((WindowPtr)mac_window(), winPart, &s);
}


// MacToolboxWindow set:

int       WindowSet::_num_windows = 0;
WindowPtr WindowSet::_my_windows[WindowSet::_max_windows];

void WindowSet::add_window(WindowPtr w) {
  if (_num_windows >= _max_windows)  fatal("too many");
  _my_windows[_num_windows++] = w;
}

void WindowSet::rm_window(WindowPtr w) {
  int i;
  for (i = 0;  _my_windows[i] != w;  ++i)
    if (i >= _num_windows)
      fatal("did not find  _window");
  if (i == _num_windows - 1)   --_num_windows;
  else                         _my_windows[i] = _my_windows[--_num_windows];
}

bool WindowSet::includes_window(WindowPtr w) {
  for (int i = 0;  i < _num_windows;  ++i)
    if (_my_windows[i] == w)  return true;
  return false;
}


int  MacToolboxWindow::events_pending(void* FH) { 
  if (!is_open())  { failure(FH, "window is closed"); return 0; }
  return _evtQ->count(); 
}

EventRecord*  MacToolboxWindow::peek_event(void* FH) {
  if (!is_open())  { failure(FH, "window is closed"); return 0; }
  EventRecord* e = _evtQ->peek();
  if (e == NULL) {
    failure(FH, "no more events");
    return NULL;
  }
  EventRecord* r = new EventRecord;
  *r = *e;
  return r;
}
  
EventRecord*  MacToolboxWindow::next_event(void* FH) {
  if (!is_open())  { failure(FH, "window is closed"); return 0; }
  EventRecord* r = peek_event(FH);
  if (r != NULL)
    _evtQ->remove_event();
  return r;
}

void MacToolboxWindow::put_event(EventRecord* e) {
  _evtQ->put(e);
}


// =============================================
// Was before Mac Helpers in os_mac.cpp


class MouseDownHandler {
 private:   
  EventRecord*     evt;
  MacToolboxWindow*  win;
  WindowPtr        theWin;
  int              winPart;
  
 public:
  MouseDownHandler(EventRecord* e) { 
    evt = e;  
    winPart = FindWindow(evt->where, &theWin);
    win = MacToolboxWindow::as_win_from_mac_win(theWin);
  }
  
  // return true if went down in a platwin content area
  bool handle_event() {
    // See Listing 4-9(Tb) in Window Manager
    bool r = false;
    switch (winPart) {
     case inMenuBar:      menu_bar();         break; 
     case inContent:  r = content_region();   break;
     case inDrag:         drag_bar();         break;
     case inGoAway:       close_box();        break;
     case inGrow:         grow_box();         break;
     case inZoomIn:       zoom_in_or_out();   break;
     case inZoomOut:      zoom_in_or_out();   break;
     
     default:                                 break;
    }
    return r;
  }

private:
  void menu_bar() {
    unsigned long menu_selection = MenuSelect(evt->where);
    short menu_id   = HiWord(menu_selection);
    short menu_item = LoWord(menu_selection);
    // steps to put in:
    // enable/disable menu items
    // let user choose command (HiliteMenu?)
    // do command
    MenuHandle mh = GetMenuHandle(menu_id);
    if (mh != NULL) {
      Boolean is_enabled = IsMenuItemEnabled(mh, menu_item);
      Str255 is;
      GetMenuItemText(mh, menu_item, is);
      char cis[256];
      CopyPascalStringToC(is, cis);
      lprintf("menu item %s, enabledFlags %x\n", cis, is_enabled);
      warning("unimp mac; menus");
    }
    
    lprintf("Menu id: %d, menu item %d\n", menu_id, menu_item);
    HiliteMenu(0);
  }
  
  bool content_region() {
    bool r = false; // did mouse go down in content region?
    // if FrontWindow is movable-modal should call SysBeep(30)
    if (win != NULL) {
        win->mouse_down_in_content_region(evt);
        r = true;
    }
    return r;
  }
  
  void drag_bar() {  
    // {if a movable modal is active, ignore click in an inactive title bar}
    if ( theWin != FrontWindow() ) {
      switch (GetWindowKind(FrontWindow())) {
       case dBoxProc:
       case plainDBox:
       case altDBoxProc:
       case movableDBoxProc:
        SysBeep(30);
        return;
       default:
        break;
      }
    }
    if (win != NULL)
      win->mouse_down_in_drag_bar(evt);
  }

  void grow_box() { 
    if (win != NULL)
      win->mouse_down_in_grow_box(evt); 
  }

  void close_box() {
    if (TrackGoAway(theWin, evt->where))  
      if (win != NULL)  {
        win->close();
      }
  }
  
  void zoom_in_or_out() {   
    // call TrackBox to handle mouse until button is released
    if ( TrackBox(theWin, evt->where, winPart))
      if (win != NULL)
        win->zoom(winPart);
  }
};

// ===========================================================


// Self needs window activate/deactivate when you drag into a window with the button down
// Argument is a null-event


static void activate_window_from_event(EventRecord* evt) {
  WindowPtr wp;
  WindowPartCode wpc = FindWindow(evt->where, &wp);
  if (FrontWindow() == wp  &&  IsWindowHilited(wp)) {
    return; // is already active
  }
  MacToolboxWindow* pw = MacToolboxWindow::as_win_from_mac_win(wp);
  if (pw == NULL  ||  pw == TheSpy->mw()->pw) {
    return; // is NOT a PW or is the spy, bleh
  }
  
  pw->activate();
}


void MacToolboxWindow::activate() {
  WindowPtr wp = (WindowPtr)mac_window();
    
  SelectWindow(wp);
  /*
   * Problem: Running MacToolbox (Carbon) windows from OS X terminal,
   * the only way to select the window for type-in is to option-click it.
   * I have tried adding the following without success at getting the typing
   * focus. -- dmu 9/01
   * BringToFront(wp);
   * HiliteWindow(wp, true);
   * # if TARGET_OS_VERSION == MACOSX_VERSION
   *   ActivateWindow(wp, true);
   * # endif
  */
  
  if (!IsWindowVisible(wp))
    ShowWindow(wp);
}




// Events

static void handle_my_event(EventRecord* evt) {
  BlockGlueFlag gf(macToolbox_semaphore); // need to block spy while events do redraws
  static bool button_is_down = false;
  
  WindowPtr w;
  static WindowPtr last_active_w = NULL;
  
  # if TARGET_OS_VERSION == MACOSX_VERSION
    if ( evt->what == osEvt 
    &&  (evt->message >> 24) == suspendResumeMessage
    &&  (evt->message & resumeFlag)) {
      // This seems to be the only event we get under OSX
      // until you option-click. So, could put activate_window in here
      // if I ever figure out how to activate_window.
      // Better still, should just activate_window when it is first created
      // to better resemble OS 9 behavior. -- dmu 9/01
    }
  # endif
  
  switch (evt->what) {
   case activateEvt:
   case updateEvt:
     w = (WindowPtr)evt->message;
     break;
   default:
     w = last_active_w;
     break;
   }
   
  MacToolboxWindow* pw = MacToolboxWindow::as_win_from_mac_win(w);
  if (pw != NULL) 
    switch (evt->what) {
     case updateEvt:     pw->handle_update_event(evt);   break;
     case activateEvt:   pw->handle_activate_event(evt); break;
     
     case mouseDown: 
      {
        MouseDownHandler mdh(evt);
        button_is_down = mdh.handle_event();
      }
      break;
     
     case nullEvent:
      pw->handle_misc_event(evt);
      if (button_is_down)
         activate_window_from_event(evt);
       break;
       
     case mouseUp:
       button_is_down = false; // fall through!
     case keyDown:
     case keyUp:
     case autoKey:
     case diskEvt:
     case osEvt:
     default:
      pw->handle_misc_event(evt);
      break;
    }
  
  switch (evt->what) {
   case activateEvt: 
   case updateEvt:
    last_active_w = (WindowPtr)evt->message;
    break;
  }
}

void MacToolboxWindow::check_mac_events() {
  check_mac_events(false, everyEvent);
}

void MacToolboxWindow::check_mac_events(bool give_time_to_other_apps, int mask) {
 
  give_time_to_other_apps = false; // makes menu more responsive 
  
  EventRecord evt;
  bool isSuspended = false;
  # if TARGET_OS_FAMILY == MACOS_FAMILY
    IntervalTimer::disable_all(false); // in case event gives time to other proc
  # else // OS X: prevent weird spy crash
    macToolbox_semaphore = true;
  # endif
  do {
    // May have to uncomment next line to run on Intel in the debugger
    // But if you do, the UI will not track the mouse when menuing -- dmu 4/06
    // if (!EventAvail(mask, &evt)) break; // Intel Macs lock up without this
    WaitNextEvent( mask, &evt, (isSuspended || give_time_to_other_apps  ?  1  :  0), NULL ); // was 1 instead of zero but buttons sluggish
    isSuspended = handle_event(&evt);
  } while ( evt.what != nullEvent   ||  isSuspended); 
   
  # if TARGET_OS_FAMILY == MACOS_FAMILY
    IntervalTimer::enable_all();
  # else
    macToolbox_semaphore = false;
  # endif
}


bool MacToolboxWindow::handle_event(EventRecord* evt) {
  bool isSuspended= false;
  uint32 os_msg = evt->message >> 24;
  if ( evt->what == osEvt ) {
    switch (os_msg) {
     case suspendResumeMessage:
      isSuspended = (evt->message & resumeFlag) ? false : true;
      break;
      
     default:
      break;
    }
  }
  if ( evt->what == kHighLevelEvent ) {
    OSErr r = AEProcessAppleEvent(evt);
    if (r != noErr)
      warning1("ignoring failed Apple event:, %d", (int)r);
  }

  
  WindowPtr theWin;
  int winPart = FindWindow(evt->where, &theWin);
  
  # if TARGET_OS_FAMILY == MACOS_FAMILY
    bool SIOUXDidIt = SIOUXHandleOneEvent(evt); // let sioux evt even if null
    if (SIOUXQuitting) // quit menu item
      OS::terminate(0);
    
    if (!SIOUXDidIt ) {
      handle_my_event(evt);
    }
  # else
    handle_my_event(evt);
  # endif
  return isSuspended;
}




oop MacToolboxWindow::get_scrap_text() {
  // Listing 2-4(MTb), Inside mac: Mor Mac Toolbox pg 2-21
  ScrapRef s;
  if (GetCurrentScrap(&s) == noErr) {
    long size_of_text_data = 0;
    if ( GetScrapFlavorSize(s, 'TEXT', &size_of_text_data) == noErr ) {
      byteVectorOop r = Memory->byteVectorObj->cloneSize(size_of_text_data, CANFAIL);
      if (!r->is_mark()
      &&  GetScrapFlavorData(s, 'TEXT', &size_of_text_data, r->bytes()) == noErr)
        return r;
    }
  }
  return new_string("", 0);
}


int MacToolboxWindow::put_scrap_text(char* s, int len) {
  // Listting 2-1(MTb) Writing data to the scrap, Inside Mac: More Mac Toolbox, pg 2-16
  OSStatus      err = ClearCurrentScrap();   if (err != noErr)  return err;
  ScrapRef sc;  err = GetCurrentScrap(&sc);  if (err != noErr)  return err;
  
  return PutScrapFlavor( sc, 'TEXT', kScrapFlavorMaskNone, len, s );
}


// ==================================================
  


oop MacToolboxWindow::test_window_prim(oop rcvr) {
  // put window on screen and process events till closed
  MacToolboxWindow w;
  w.open(zoomDocProc, 100, 100, 300, 200, "Test Window");
  // XXX Menu bar event broken
  // XXX growth destroys scroll bars
  
  for ( ; w.is_open(); check_mac_events() ) {}
  return rcvr;
}




# endif // MACTOOLBOX_LIB
