/* Sun-$Revision: 30.3 $ */
// $Revision: 30.3 $

/* Copyright 2007 David Ungar
   See the LICENSE file for license information. */
   
// Mac Quartz implementation:

# pragma implementation

# if defined(QUARTZ_LIB) 

# if TARGET_OS_VERSION == MACOSX_VERSION  &&  !TARGET_API_MAC_CARBON
  #  undef Alloc
  #  undef Status

  #  include <Carbon/Carbon.h>
  #  include <ApplicationServices/ApplicationServices.h>
  
  // implicit by the above. 
  // #  include <CoreGraphics/CoreGraphics.h>
  
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

# endif


# include "_quartzWindow.cpp.incl"




int       WindowSet::_num_windows = 0;
WindowSet_WindowPtr WindowSet::_my_windows[WindowSet::_max_windows];

void WindowSet::add_window(WindowSet_WindowPtr w) {
  if (_num_windows >= _max_windows)  fatal("too many");
  _my_windows[_num_windows++] = w;
}

void WindowSet::rm_window(WindowSet_WindowPtr w) {
  int i;
  for (i = 0;  _my_windows[i] != w;  ++i)
    if (i >= _num_windows)
      fatal("did not find  _window");
  if (i == _num_windows - 1)   --_num_windows;
  else                         _my_windows[i] = _my_windows[--_num_windows];
}

bool WindowSet::includes_window(WindowSet_WindowPtr w) {
  for (int i = 0;  i < _num_windows;  ++i)
    if (_my_windows[i] == w) {
      if (i != 0) {
        WindowSet_WindowPtr w0 = _my_windows[0];
        _my_windows[0] = w;
        _my_windows[i] = w0;
      }
      return true;
    }
  return false;
}





// see MacWindows.h


// ===========================
// First: cross-platform functions:

// Creation, destruction:

QuartzWindow::QuartzWindow() : AbstractPlatformWindow(), _evtQ() { 
  _is_open = false;
  _my_event_handler_upp = NULL;
  _my_event_handler = NULL;
  _my_spy_event_handler_upp = NULL;
  _my_spy_event_handler = NULL;
  _bounds_changed = false;
  _was_closed = false;
  _quartz_win = NULL;
  myContext = NULL;
}


// (destructor is plat-independant)

bool QuartzWindow::open( const char* /* display_name  unimp mac */,
                           int x, int y, int w, int h,
                           int min_w, int max_w, int min_h, int max_h, // -1 for don't care
                           const char* window_name,  const char* /*icon_name*/,
                           const char* font_name,    int   font_size ) {

  int options[8] = {
    kHIWindowBitCloseBox        ,
    kHIWindowBitZoomBox         ,
    kHIWindowBitCollapseBox     ,
    kHIWindowBitResizable       ,
    // kHIWindowBitToolbarButton     ,
    // kHIWindowBitUnifiedTitleAndToolbar,
    // kHIWindowBitTextured         ,
    kHIWindowBitRoundBottomBarCorners,
    // ?kHIWindowBitCompositing,
    kHIWindowBitStandardHandler,
    0
  };

  if ( !open( kDocumentWindowClass, options,
             x, y, x + w, y + h, window_name, font_name, font_size))
    return false;
  if ( !change_size_hints(min_w, max_w, min_h, max_h)) { close();  return false; }
  init_font_info();
  activate();
  return true;
}


bool QuartzWindow::open( 
                    uint32  /* WindowClass */ wc,
                    int*    /* WindowAttributes  */  attrs,
                    int   left,
                    int   top, 
                    int   right, 
                    int   bottom, 
                    const char* title,
                    const char* font_name,
                    int   font_size ) {
  HIRect bounds = (HIRect) CGRectMake(left, top, right, bottom);
  
  OSStatus err =  HIWindowCreate(wc, attrs, NULL, kHICoordSpace72DPIGlobal, &bounds, &_quartz_win);
  if (err != noErr)
    return false;
  SetWRefCon(my_window(), (int32)this);

    
  CFStringRef cftitle = CFStringCreateWithCString(NULL, title, kCFStringEncodingMacRoman);
  SetWindowTitleWithCFString(my_window(), cftitle);
  CFRelease(cftitle);

  WindowSet::add_window(my_window());
  _is_open = true;
  
  init_colors();
  init_events();
  
  
  return true;                   
} 

void QuartzWindow::init_colors() {
  float redc[]    = {1.0, 0.0, 0.0, 1.0};
  float yellowc[] = {1.0, 1.0, 0.0, 1.0};
  float blackc[]  = {0.0, 0.0, 0.0, 1.0};
  float grayc[]   = {0.5, 0.5, 0.5, 1.0};
  float whitec[]  = {1.0, 1.0, 1.0, 1.0};
  _color_space = CGColorSpaceCreateDeviceRGB();
  _red    = (int) CGColorCreate( _color_space, redc);
  _yellow = (int) CGColorCreate( _color_space, yellowc);
  _black  = (int) CGColorCreate( _color_space, blackc);
  _gray   = (int) CGColorCreate( _color_space, grayc);
  _white  = (int) CGColorCreate( _color_space, whitec);
}




void QuartzWindow::init_font_info() {
  CFStringRef desired = CFStringCreateWithCString(
    kCFAllocatorDefault, default_fixed_font_name(), kCFStringEncodingMacRoman);
    
  ATSFontIterator fi;
  OSStatus e = ATSFontIteratorCreate( kATSFontContextLocal, NULL, NULL,
                                      kATSOptionFlagsDefaultScope, &fi);
  if (e) fatal1("could not create ATSFontIterator %d", e);
  
  ATSFontRef font;
  for (;;) {
    ATSFontIteratorNext( fi, &font);
    if (!font)
      fatal("could not find font");
    CFStringRef name;
    ATSFontGetName( font, kATSOptionFlagsDefault, &name);
    if ( kCFCompareEqualTo == CFStringCompare( desired, name, kCFCompareCaseInsensitive | kCFCompareAnchored))
      break;
  }  
  _default_font = font;
  e = ATSFontGetHorizontalMetrics(font, kATSOptionFlagsDefault, &_metrics);
  if (e) fatal1("could not get metrics %d", e);
  e = ATSFontIteratorRelease(&fi);
  if (e) fatal1("could not release ATSFontIterator %d", e);
  CFRelease(desired);
}


void QuartzWindow::activate() {
  WindowPtr wp = my_window();
  if (!IsWindowVisible(wp))
    ShowWindow(wp);
  SelectWindow(wp);
  OSStatus e = SetUserFocusWindow(wp); 
  if (e) lprintf("SetUserFocus %d\n", e);
  
  e = ActivateWindow(wp, true);
  if (e) lprintf("ActivateWindow %d\n", e);
}



void QuartzWindow::close() {
  if (!is_open())
    return;
  CGrafPtr gp = GetWindowPort(my_window());
  if (gp != NULL) // already closed by std handler
    QDEndCGContext( gp, &myContext );
  CGColorRelease((CGColorRef) _red);
  CGColorRelease((CGColorRef) _yellow);
  CGColorRelease((CGColorRef) _black);
  CGColorRelease((CGColorRef) _gray);
  CGColorRelease((CGColorRef) _white);
  CGColorSpaceRelease(_color_space);
  WindowSet::rm_window(my_window());
  if (gp != NULL)
    DisposeWindow(my_window());
  _is_open = false; 
  DisposeEventHandlerUPP(_my_event_handler_upp);
  DisposeEventHandlerUPP(_my_spy_event_handler_upp);
  _my_event_handler = NULL;
  _my_spy_event_handler = NULL;
  _quartz_win = NULL;
}


static CGDirectDisplayID screen(void* w) {
  HIRect bounds;
  OSStatus err = HIWindowGetBounds((WindowRef)w, kWindowGlobalPortRgn, 
                                   kHICoordSpace72DPIGlobal, &bounds);
  if (err) {
    lprintf("GetWindowRegion failed: %d\n", err);
    return CGMainDisplayID();
  }
  CGDirectDisplayID display;
  CGDisplayCount displayCount;
  CGDisplayErr e = CGGetDisplaysWithRect(bounds, 1, 
                                         &display, &displayCount);
  return (displayCount && !e) ? display : CGMainDisplayID();
}


int QuartzWindow::screen_width() {
  return CGDisplayPixelsWide(screen(my_window()));
}

int QuartzWindow::screen_height() {
  return CGDisplayPixelsHigh(screen(my_window()));
}
    
int QuartzWindow::menubar_height() {
  return screen(my_window()) == CGMainDisplayID() ? GetMBarHeight() : 0;
}



// Insets:

// Compute inset from outer to inner part of windows 
// by comparing portRect against strucRgn bounding box

// Strangely, on Mac, the inner part of the window includes the scroll bar.
// So, add that to offset for bottom/right. 

// Ah, but on Carbon, we can get content area, so ixnay the ollbarscray.
int QuartzWindow::inset_left() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = cr.left - sr.left;
  // warning1("inset_left = %d", r);
  return r;
}

int QuartzWindow::inset_top() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = cr.top - sr.top;
  // warning1("inset_top = %d", r);
  return r;
}

int QuartzWindow::inset_right() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = sr.right - cr.right;
  // warning1("inset_right = %d", r);
  return r;
}

int QuartzWindow::inset_bottom() {
  Rect cr;  get_window_region_rect( kWindowContentRgn,    &cr);
  Rect sr;  get_window_region_rect( kWindowStructureRgn,  &sr);
  int r = sr.bottom - cr.bottom;
  // warning1("inset_bottom = %d", r);
  return r;
}



void QuartzWindow::get_window_region_rect(int wh, Rect* r) {
  HIRect bounds;
  OSStatus err = HIWindowGetBounds(my_window(), wh, 
                                   kHICoordSpace72DPIGlobal, &bounds);
  if (err) {
    lprintf("HIWindowGetBounds failed: %d\n", err);
    r->left = r->top = 0; r->bottom = r->right = 1;
  } else {
    r->left   = (short) CGRectGetMinX(bounds);
    r->top    = (short) CGRectGetMinY(bounds);
    r->bottom = (short) CGRectGetMaxY(bounds);
    r->right  = (short) CGRectGetMaxX(bounds);
  }
}


int  QuartzWindow::left()   { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.left; }
int  QuartzWindow::top()    { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.top;  } 
int  QuartzWindow::width()  { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.right  - r.left; }
int  QuartzWindow::height() { Rect r;  get_window_region_rect( kWindowContentRgn, &r);  return  r.bottom - r.top; }





int QuartzWindow::font_width()  { 
  return ceil(_metrics.maxAdvanceWidth * default_fixed_font_size()); 
}
int QuartzWindow::font_height() { 
  return ceil(_metrics.leading) * default_fixed_font_size(); 
}

const char* QuartzWindow::default_fixed_font_name() { return "Monaco"; }
int   QuartzWindow::default_fixed_font_size() { return 9; }


// Handy operations:

// Long comments in this routine are extra stuff from the Mac toolbox assistant.

bool QuartzWindow::change_extent(int left, int top, int w, int h) { 
  // Remember, left, top, w and h are for outer parts of window.  
  // convert to inner
  CGrafPtr gp = GetWindowPort(my_window());
  if (gp != NULL) // already closed by std handler
    QDEndCGContext( gp, &myContext );
  myContext = NULL;  
  MoveWindow( my_window(), left + inset_left(), top + inset_top(), false); 
  SizeWindow( my_window(), w - inset_left() - inset_right(), h - inset_top() - inset_bottom(), true);              

  adjust_after_resize();        
  return true;
 }
 

bool QuartzWindow::tell_platform_size_hints() { 
  HISize minSize, maxSize; // sizes of content region

  minSize.width  =  _min_w == -1 ?        0  :  (_min_w - inset_left() - inset_right());
  minSize.height =  _min_h == -1 ?        0  :  (_min_h - inset_top()  - inset_bottom());
  maxSize.width  =  _max_w == -1 ?  1000000  :  (_max_w - inset_left() - inset_right());
  maxSize.height =  _max_h == -1 ?  1000000  :  (_max_h - inset_top()  - inset_bottom());
  OSStatus e = SetWindowResizeLimits(  my_window(),  &minSize, &maxSize);
  return e == noErr; 
}


void QuartzWindow::setupCTM() {
  CGContextTranslateCTM(myContext, 0, height());
  CGContextScaleCTM(myContext, 1, -1);
}

// On Mac, must redraw borders yourself:
void QuartzWindow::adjust_after_resize() { 
  if (myContext) {
    CGAffineTransform x = CGContextGetCTM(myContext);
    CGContextScaleCTM(myContext, 1.0 / x.a, 1.0 / x.d);
    CGContextTranslateCTM(myContext, -x.tx, -x.ty);
    setupCTM();
  }  
  if (TheSpy != NULL)
    TheSpy->adjust_after_resize(); // might be the spy
}

 
// Drawing: 


bool QuartzWindow::pre_draw(bool incremental) {
  if ( get_graphics_semaphore())  return false;
  if (!_is_open) return false;
  if (_was_closed) {
    TheSpy->deactivate();
    _was_closed = false;
    return false;
  }
  if ( myContext == NULL ) {
    // Self does this for Self windows, so only do it for Spy windows--that's why it's here and not in open
    SetPortWindowPort(my_window());
    QDBeginCGContext( GetWindowPort(my_window()), &myContext);
    setupCTM();
    CGContextSetTextMatrix(myContext, CGAffineTransformMake( 1, 0, 0, -1, 0, 0));
    CGContextSelectFont(myContext, 
      default_fixed_font_name(), default_fixed_font_size(), kCGEncodingMacRoman);
    CGContextSetShouldAntialias(myContext, false);
    
    EventTypeSpec es[] = { 
      {kEventClassWindow, kEventWindowBoundsChanged},
      {kEventClassWindow, kEventWindowClose}
    };
    OSStatus e = AddEventTypesToHandler(_my_spy_event_handler,  sizeof(es) / sizeof(es[0]),  es);
    if (e != noErr) fatal1("could not add types to handler %d\n", e);
  }
  if (_bounds_changed) {
    _bounds_changed = false;
    adjust_after_resize();
  }
  if (!incremental) {
    Rect r;  get_window_region_rect( kWindowContentRgn, &r);
    clear_rectangle(0, 0, r.right - r.left, r.bottom - r.top);
  }
  return true;
}


void QuartzWindow::post_draw(bool incremental) {
  CGContextFlush(myContext);
}

  
 
void QuartzWindow::full_redraw() {
  if (TheSpy != NULL)
    TheSpy->full_redraw(); // might be the spy
}





void QuartzWindow::draw_text(const char* text, int x, int y)  { 
  int len = strlen(text);
  int h = font_height();
  
  clear_rectangle(x, y-h, len * font_width(), h);
  CGContextSetTextPosition(myContext, x, y);
  CGContextShowText(myContext, text, len);
} 

void QuartzWindow::draw_line(int x1, int y1, int x2, int y2) {
  CGContextBeginPath(myContext);
  CGContextMoveToPoint(myContext, x1, y1);
  CGContextAddLineToPoint(myContext, x2, y2);
  CGContextStrokePath(myContext);
}


void QuartzWindow::draw_rectangle_black(int x, int y, int w, int h) {
  set_color(black());
  CGContextStrokeRectWithWidth(myContext, CGRectMake(x, y, w, h), 1.0);
}


void QuartzWindow::clear_rectangle(int x, int y, int w, int h) {
  set_color(white());
  CGContextFillRect(myContext, CGRectMake(x-1, y-1, w+1, h+1));
  set_color(black());
}


void QuartzWindow::fill_rectangle(int x, int y, int w, int h) {
  CGContextFillRect(myContext, CGRectMake(x, y-1, w, h+1));
}

void QuartzWindow::set_color(int c) { 
  CGContextSetFillColorWithColor(   myContext, (CGColorRef)c );
  CGContextSetStrokeColorWithColor( myContext, (CGColorRef)c );
}


void QuartzWindow::set_thickness(int t) {
  CGContextSetLineWidth(myContext, max(1, t));
}

void QuartzWindow::set_xor()   { CGContextSetBlendMode(myContext, kCGBlendModeDifference);  }
void QuartzWindow::set_copy()  { CGContextSetBlendMode(myContext, kCGBlendModeNormal);  }




bool QuartzWindow::get_graphics_semaphore() {
  // Carbon under OSX runs the spy asynchronously, just like on Solaris.
  // But, when running the spy and UI2, Self locks up in a loop sometimes.
  // Maybe the graphics toolbox is not reentrant, let's try the same scheme
  // used for X to avoid drawing from the spy in the midst of a signal if
  // the self is in the midst of a Quartz operation. -- dmu 9/01
  extern bool quartz_semaphore;
  return quartz_semaphore;
}



void QuartzWindow::warp_pointer(int x, int y) {
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


#define kUTTypeOldMacText CFSTR("com.apple.traditional-mac-plain-text")


oop QuartzWindow::get_scrap_text() {
  // See Pasteboard Manager Programming guide
  PasteboardRef       clipboard;
  PasteboardSyncFlags syncFlags;
  CFDataRef           textData = NULL;
  ItemCount           itemCount;
  
  if (PasteboardCreate(kPasteboardClipboard, &clipboard) != noErr) 
    goto BailOut;
  
  if (PasteboardSynchronize(clipboard) & kPasteboardModified)
    goto BailOut;

  if (PasteboardGetItemCount(clipboard, &itemCount) != noErr) 
    goto BailOut;
  
  for(UInt32 itemIndex = 1; itemIndex <= itemCount; itemIndex++) {
    PasteboardItemID itemID = 0;
    CFArrayRef       flavorTypeArray = NULL;
    CFIndex          flavorCount = 0;

    if (PasteboardGetItemIdentifier(clipboard, itemIndex, &itemID) != noErr)
      continue;
  
    if (PasteboardCopyItemFlavors(clipboard, itemID, &flavorTypeArray) != noErr)
      continue;

    flavorCount = CFArrayGetCount(flavorTypeArray);
     
    for(CFIndex flavorIndex = 0; flavorIndex < flavorCount; flavorIndex++) {
      CFStringRef flavorType;
      CFDataRef   flavorData;
      CFIndex     flavorDataSize;
      char        flavorText[256];
      
      
      flavorType = (CFStringRef)CFArrayGetValueAtIndex( flavorTypeArray,// 6
                                                       flavorIndex );
      
      if (UTTypeConformsTo(flavorType, kUTTypeOldMacText)) {
        
        if (PasteboardCopyItemFlavorData(clipboard, itemID, flavorType, 
                                         &flavorData) != noErr)
          continue;
          
        flavorDataSize = CFDataGetLength(flavorData);

        // allocate new string.
        byteVectorOop r = Memory->byteVectorObj->cloneSize(flavorDataSize, CANFAIL);
        if (r->is_mark()) {
          CFRelease (flavorData);
          CFRelease (flavorTypeArray);
          goto BailOut;          
        }
        // copy over
        CFDataGetBytes(flavorData, CFRangeMake(0,CFDataGetLength(flavorData)),
                       (UInt8 *)r->bytes());          
        CFRelease(flavorData);
        CFRelease(flavorTypeArray);
        return r;
      } // else try next      
    }
    CFRelease(flavorTypeArray);
  }  
  
BailOut:
  
  return new_string("", 0);
}

int QuartzWindow::put_scrap_text(const char* s, int len) {
  // See Pasteboard Manager Programming guide
  PasteboardRef clipboard;
  OSStatus      err;
  CFDataRef     textData = CFDataCreate(kCFAllocatorDefault, 
                                        (const UInt8*)s, len);
  if (textData == NULL) return -1;
  if ((err = PasteboardCreate(kPasteboardClipboard, &clipboard)) != noErr) return err;
  if ((err = PasteboardClear(clipboard)) != noErr) return err;

  return PasteboardPutItemFlavor(clipboard, (PasteboardItemID)s, 
                                 kUTTypeOldMacText, textData, 
                                 kPasteboardFlavorNoFlags);
  
}

// Convert WindowPtr to QuartzWindow by using refcon
QuartzWindow* QuartzWindow::getPlatformWindow(WindowRef ww, void* FH) {
    if (!WindowSet::includes_window(ww))  { failure(FH, "not a QuartzPLatformWindow"); return NULL; }
    QuartzWindow* w = (QuartzWindow*) GetWRefCon(ww);
    assert(w->my_window() == ww, "");
    return w;
}



// Events


int  QuartzWindow::events_pending(void* FH) { 
  if (!is_open())  { failure(FH, "window is closed"); return 0; }
  return _evtQ.count(); 
}

EventRef  QuartzWindow::peek_event(void* FH) {
  if (!is_open())  { failure(FH, "window is closed"); return 0; }
  EventRef e = _evtQ.peek();
  if (e == NULL) {
    failure(FH, "no more events");
    return NULL;
  }
  return e;
}
  

EventRef  QuartzWindow::next_event(void* FH) {
  if (!is_open())  { failure(FH, "window is closed"); return 0; }
  EventRef e = _evtQ.get();
  if (e == NULL) {
    failure(FH, "no more events");
    return NULL;
  }
  return e;
}

void QuartzWindow::put_event(EventRef e) {
  _evtQ.put(e);
}


static OSStatus handle_event(EventHandlerCallRef handler_call_chain, EventRef e, void* data) {
  QuartzWindow *w = (QuartzWindow*)data;
  return w->handle_event(handler_call_chain, e);
}


static OSStatus handle_spy_event(EventHandlerCallRef handler_call_chain, EventRef e, void* data) {
  QuartzWindow *w = (QuartzWindow*)data;
    if ( GetEventClass(e) == kEventClassWindow ) 
      switch (GetEventKind(e)) {
        case kEventWindowBoundsChanged:  w->set_bounds_changed();  break;
        case kEventWindowClose:          w->set_was_closed();      break;
      }
    return noErr;
}      


void QuartzWindow::init_events() {
  _my_event_handler_upp = NewEventHandlerUPP(::handle_event);
  OSStatus e = InstallWindowEventHandler(my_window(), _my_event_handler_upp, 0, NULL, this, &_my_event_handler);
  if (e != noErr) fatal1("could not install event handler: %d\n", e);
  
  _my_spy_event_handler_upp = NewEventHandlerUPP(::handle_spy_event);
  e = InstallWindowEventHandler(my_window(), _my_spy_event_handler_upp, 0, NULL, this, &_my_spy_event_handler);
  if (e != noErr) fatal1("could not install spy event handler: %d\n", e);
}

OSStatus QuartzWindow::AddHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH) {
  if (ec_len != 1)  { failure( FH, "class needs to have four bytes"); return NULL; }
  EventTypeSpec es;
  es.eventClass = EndianU32_BtoN(*eclass);
  es.eventKind = ekind;
  return AddEventTypesToHandler(_my_event_handler, 1, &es);
}

OSStatus QuartzWindow::RemoveHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH) {
  if (ec_len != 1)  { failure( FH, "class needs to have four bytes"); return NULL; }
  EventTypeSpec es;
  es.eventClass = EndianU32_BtoN(*eclass);
  es.eventKind = ekind;
  return RemoveEventTypesFromHandler(_my_event_handler, 1, &es);
}
 
 
static uint16 get_short_event_parm(EventRef evt, EventParamName n, EventParamType t) {
  uint16 r = NULL;
  OSStatus e = GetEventParameter(evt, n, t, NULL, sizeof(r), NULL, &r);
  uint32 nb = EndianU32_NtoB(n);
  if (e) lprintf("scalar event parm failed: %4.4s, %d\n", (char*)&n, e);
  return r;
}
 
 
static void* get_scalar_event_parm(EventRef evt, EventParamName n, EventParamType t) {
  void* r = NULL;
  OSStatus e = GetEventParameter(evt, n, t, NULL, sizeof(r), NULL, &r);
  if (e == noErr || e == -9870) return r;
  uint32 nb = EndianU32_NtoB(n);
  lprintf("scalar event parm failed: %4.4s, %d\n", (char*)&n, e);
  return r;
}

void print_event(EventRef evt) {
  uint32 cl = EndianU32_NtoB(GetEventClass(evt));
  uint32 ki = /*EndianU32_NtoB*/(GetEventKind(evt));
  lprintf("Event class: %4.4s kind: %d  ",
    (char*)&cl, ki);
    
  lprintf("\tbtn: 0x%x  ", get_scalar_event_parm(evt, kEventParamMouseButton, typeMouseButton));
 // lprintf("\ttarg: 0x%x\n", get_scalar_event_parm(evt, kEventParamDirectObject, typeWildCard));
  lprintf("\ttarg: 0x%x  ", get_scalar_event_parm(evt, kEventParamPostTarget, typeEventTargetRef));
  lprintf("\twind: 0x%x  ", get_scalar_event_parm(evt, kEventParamWindowRef, typeWindowRef));
  lprintf("\tgrafport: 0x%x\n", get_scalar_event_parm(evt, kEventParamGrafPort, typeGrafPtr));
}


OSStatus QuartzWindow::handle_event(EventHandlerCallRef handler_call_chain, EventRef e) {
  put_event(e);
 
  // Hack: if this is a user-level window (not SPY) and if it is window-close,
  // must leave it for Self, otherwise let standard handler do it
  if ( myContext == NULL  &&  GetEventClass
  &&   GetEventClass(e) == kEventClassWindow 
  &&   GetEventKind(e)  == kEventWindowClose )
    return noErr;

  return CallNextEventHandler(handler_call_chain, e); 
  // In future, could return either eventNotHandledErr or noErr
}


void QuartzWindow::check_carbon_events() {
  BlockGlueFlag f(quartz_semaphore);

  for (;;) {
    EventRef evt;
    ReceiveNextEvent(0, NULL, kEventDurationNoWait, true, &evt);
    if (!evt) return;
    SendEventToEventTarget(evt, GetEventDispatcherTarget());
  }
}





# endif // QUARTZ_LIB
