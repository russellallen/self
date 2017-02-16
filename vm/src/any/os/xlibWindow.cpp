/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation

# include "_xlibWindow.cpp.incl"

# ifdef XLIB

// First: cross-plat fns:


// Creation, destruction:


XPlatformWindow::XPlatformWindow() : AbstractPlatformWindow() {
  _display   = NULL;
  _font_info = NULL;
}


// Open/Close:

bool XPlatformWindow::open( const char* display_name,
                            int x, int y, int w, int h,
                            int min_w, int max_w, int min_h, int max_h, // -1 for don't care
                            const char* window_name,  const char* icon_name,
                            const char* font_name,    int   /*font_size unimp X*/ ) {

  // (adapted from Spy open routine, needs font info for sizing)
  // XOpenDisplay fails silently if a signal is received during the call.
  // All signals except user interrupts are therefore blocked. 
  SignalBlocker sb(SignalBlocker::allow_user_int);
  
  if (!open_xdisplay(display_name)) { close();  return false; }
  
  bool debugMe = false;              // set to true when debugging X
  XSynchronize(_display, debugMe);  
  XSetErrorHandler(XErrorHandlers::handle_X_error);

  _screen_num     = DefaultScreen(_display);
  _display_width  = DisplayWidth (_display, _screen_num);
  _display_height = DisplayHeight(_display, _screen_num);
  
  _window_x = x;  _window_y = y;  _width = w;  _height = h;

  // create the window; will be resized and repositioned when reparented
  Window root = RootWindow(_display, _screen_num);
  
  _xwindow = XCreateSimpleWindow(  _display, root,
                                   _window_x, _window_y,
                                   width(), height(), 0,
                                   BlackPixel(_display, _screen_num),
                                   WhitePixel(_display, _screen_num));
  
  if (!set_font_info(font_name))                       {  close();  return false; }
  if (!change_size_hints(min_w, max_w, min_h, max_h))  {  close();  return false; }
  
  if (!set_name(     window_name))  {  close(); return false; }
  if (!set_icon_name(  icon_name))  {  close(); return false; }
  
  setup_events();  
  XMapWindow(_display, _xwindow);
  
 if (!setup_gcs())      {  close(); return false; }
 
  return true;
}



bool XPlatformWindow::open_xdisplay(const char *n) {
  if (n == NULL) n = "";
  _display = XOpenDisplay(n);
  if (_display == NULL) {
    warning2("cannot open X display '%s' a.k.a. '%s'! window won't work.",
             n, XDisplayName(n));
    return false;
  }
  return true;
}

  
bool XPlatformWindow::set_icon_name(const char* icon_name) {  
  XTextProperty iconName;
  if (XStringListToTextProperty((char**)&icon_name, 1, &iconName) == 0) {
    warning("X structure allocation for icon name failed--window won't work.");
    return false;
  }
  XSetWMIconName(_display, _xwindow, &iconName);
  return true;
}


bool XPlatformWindow::set_name(const char* window_name) {
  XTextProperty windowName;
  if (XStringListToTextProperty((char**)&window_name, 1, &windowName) == 0) {
    warning("X structure allocation for window name failed--window won't work.");
    return false;
  }
  XSetWMName(_display, _xwindow, &windowName);
  return true;
}


void XPlatformWindow::setup_events() {  
  // to catch the clientMessage event when user deletes
  _wmProtocolsAtom    = XInternAtom(_display, "WM_PROTOCOLS",     false);
  _wmDeleteWindowAtom = XInternAtom(_display, "WM_DELETE_WINDOW", false);
  XSetWMProtocols(_display, _xwindow, &_wmDeleteWindowAtom, 1);
  
  // choose events to receive
  long event_mask = ExposureMask | StructureNotifyMask;
  XSelectInput(_display, _xwindow, event_mask);
}


bool XPlatformWindow::tell_platform_size_hints() {
  if ( _min_w == -1)
    return true; // hack for don't care
    
  // tell window manager that we'd like our own size and position
  XSizeHints* size_hints;
  if ((size_hints = XAllocSizeHints()) == NULL) {
    warning("X structure allocation for size hints failed--spy won't work.");
    close();
    return false;
  }
  size_hints->flags = PPosition | PSize | PMinSize | PMaxSize;
  size_hints->min_width  = _min_w;
  size_hints->max_width  = _max_w;
  size_hints->min_height = _min_h;
  size_hints->max_height = _max_h;
  XSetWMNormalHints(_display, _xwindow, size_hints);
  return true;
}


bool XPlatformWindow::set_font_info(const char* font_name) {  
  // must set _font_info here so that font_height() is defined for BOTTOM 
  _font_info = XLoadQueryFont(_display, font_name);
  return _font_info != NULL;
}


bool XPlatformWindow::setup_gcs() {
  // create 3 gc's and set their attributes
  unsigned long valuemask = 0;
  XGCValues values;
  _gc = XCreateGC(_display, _xwindow, valuemask, &values);
  
  XSetFont(_display, _gc, _font_info->fid);
  XSetForeground(_display, _gc, BlackPixel(_display, _screen_num));
  XSetBackground(_display, _gc, WhitePixel(_display, _screen_num));
  
  // 16x16 grey stipple pixmap (16x16 is preferred stipple size)
  const int grey_width = 16;
  const int grey_height = 16;
  static unsigned char grey_bits[] = {
    0x55, 0x55, 0xaa, 0xaa, 0x55, 0x55, 0xaa, 0xaa, 0x55, 0x55, 0xaa, 0xaa,
    0x55, 0x55, 0xaa, 0xaa, 0x55, 0x55, 0xaa, 0xaa, 0x55, 0x55, 0xaa, 0xaa,
    0x55, 0x55, 0xaa, 0xaa, 0x55, 0x55, 0xaa, 0xaa};
  Pixmap stipple = XCreateBitmapFromData(_display, _xwindow,
                                         (const char *)grey_bits,
                                         grey_width, grey_height);
  XSetStipple(_display, _gc, stipple);
  
  _black= BlackPixel(_display, _screen_num);
  _white= WhitePixel(_display, _screen_num);
  _is_mono = DefaultDepth(_display, _screen_num) == 1;
  if (_is_mono)
    _red= _yellow= _gray= _black;
  else {
    Colormap cmap= DefaultColormap(_display, _screen_num);
    XColor col1, col2;
    _red= XAllocNamedColor(_display, cmap, "red", &col1, &col2)
      ? col1.pixel : _black;
    _yellow= XAllocNamedColor(_display, cmap, "gold", &col1, &col2)
      ? col1.pixel : _black;
    _gray= XAllocNamedColor(_display, cmap, "gray", &col1, &col2)
      ? col1.pixel : _black;
  }
  return true;
}


void XPlatformWindow::close() { 
  if (_font_info != NULL) { XFreeFont(_display, _font_info); _font_info = NULL; }
  if (_gc        != NULL) { XFreeGC(  _display, _gc);               _gc = NULL; }
  if (_display   != NULL) { XCloseDisplay(_display);           _display = NULL; }
}



// Insets from outer to inner portion of window. Not sure what to do for X here, these are guesses.
int  XPlatformWindow::inset_left()    { return 0; }  // Mac needs this
int  XPlatformWindow::inset_right()   { return 0; }  // Mac needs this
int  XPlatformWindow::inset_top()     { return 0; }  // Mac needs this
int  XPlatformWindow::inset_bottom()  { return 0; }  // Mac needs this


// Accessors:

bool XPlatformWindow::is_open() { return _xwindow != None; }
bool XPlatformWindow::is_mono() { return _is_mono; }

int  XPlatformWindow::left()   { return _window_x; }
int  XPlatformWindow::top()    { return _window_y; }
int  XPlatformWindow::width()  { return _width; }
int  XPlatformWindow::height() { return _height; }

int  XPlatformWindow::screen_width()   { return _display_width; }
int  XPlatformWindow::screen_height()  { return _display_height; }
int  XPlatformWindow::menubar_height() { return 0; } // none in X
  
int  XPlatformWindow::font_width() { return _font_info->max_bounds.width; }
int  XPlatformWindow::font_height() { return _font_info->max_bounds.ascent + _font_info->max_bounds.descent; }

const char* XPlatformWindow::default_fixed_font_name() { return "fixed"; }
int   XPlatformWindow::default_fixed_font_size() { return 10; }


// Handy operations;

bool XPlatformWindow::change_extent(int left, int top, int w, int h) { 
  // left, top in global coordinates
  // don't need to adjust by insets for X
  XMoveResizeWindow(_display, _xwindow, left, top, w, h);
  _window_x = left;
  _window_y = top;
  _width = w;
  _height = h;
  return true;
}
void XPlatformWindow::adjust_after_resize() { 
  if (TheSpy != NULL)
    TheSpy->adjust_after_resize(); // in case this is the spy
}
void XPlatformWindow::full_redraw() {
  if (TheSpy != NULL)
    TheSpy->full_redraw(); // in case this is the spy
}


// Drawing:

bool XPlatformWindow:: pre_draw( bool incremental) {
  if ( get_graphics_semaphore())  return false;   //  (X isn't reentrant)
  if (!handle_polled_events())    return false;   // returns if user selects QUIT
  return true;
}


void XPlatformWindow::post_draw( bool ) { /* XFlush(_display); should be needed but was not there before */ }

void XPlatformWindow::draw_text(const char* text, int x, int y) {
  XDrawImageString(_display, _xwindow, _gc, x, y, text, strlen(text));
}

void XPlatformWindow::draw_line(int x1, int y1, int x2, int y2) {
  XDrawLine(_display, _xwindow, _gc, x1, y1, x2, y2);
}

void XPlatformWindow::draw_rectangle_black(int x, int y, int w, int h) {
  if (w > 0 && h > 0)
    XDrawRectangle(_display, _xwindow, _gc, x, y, w, h);
}
      

void XPlatformWindow::clear_rectangle(int x, int y, int w, int h) {
  if (w > 0 && h > 0)
    XClearArea(_display, _xwindow, x, y, w, h, false);
}


// X drawing functions
// the X calls do the wrong thing if w or h is 0, so suppress these calls 

void XPlatformWindow::fill_rectangle(int x, int y, int w, int h) {
  if (w > 0 && h > 0)
    XFillRectangle(_display, _xwindow, _gc, x, y, w, h);
}

void XPlatformWindow::set_color(int c)     { XSetForeground    (_display, _gc, c); }
void XPlatformWindow::set_thickness(int t) { XSetLineAttributes(_display, _gc, t, LineSolid, CapButt, JoinMiter); }
void XPlatformWindow::set_xor()            { XSetFunction      (_display, _gc, GXxor);  }
void XPlatformWindow::set_copy()           { XSetFunction      (_display, _gc, GXcopy); }


bool XPlatformWindow::get_graphics_semaphore() { 
  // if you draw while X may be drawing something else, check this
  // and don't draw if it is true
  extern bool xlib_semaphore; 
  return xlib_semaphore;
}


// Events:


bool XPlatformWindow::handle_polled_events() {
  XEvent event;
  // OS X, spy breaks this:  for(int n = XPending(_display); n > 0; --n) {
  // So use while loop:
  while ( XPending(_display) > 0 ) {
    XNextEvent(_display, &event);
    switch (event.type) {
    
     case Expose:
      if (event.xexpose.count != 0) break;
      full_redraw(); // force redraw
      break;
      
     case ConfigureNotify:
      _width  = event.xconfigure.width;
      _height = event.xconfigure.height;
      adjust_after_resize();
      break;
      
     case ReparentNotify: 
      handle_reparent_event(event);
      break;
      
     case ClientMessage:
      if ((event.xclient.message_type = _wmProtocolsAtom)
          && (event.xclient.data.l[0] = _wmDeleteWindowAtom)) {
        // user has selected Quit from window's menu
        close();
        return false;
      }
      break;
      
     default:
      break;
    }
  }
  return true;
}


void XPlatformWindow::handle_reparent_event(XEvent& event) {
  Window root;
  int x, y;
  unsigned w, h, border_width, depth;
  if (XGetGeometry(_display, event.xreparent.parent, &root, &x, &y,
                   &w, &h, &border_width, &depth) == 0) 
    return;
  int wdelta = w - width();
  // sanity check: sometimes X gives weird width
  if (wdelta < 0) {
    if (XGetGeometry(_display, event.xreparent.parent, &root, &x, &y,
                     &w, &h, &border_width, &depth) == 0) 
      return;
    wdelta = w - width();
    if (wdelta < 0) {
      return;    // just ignore if X continues to report weird width
    }
  }
  _width = width() - wdelta;
  int display_height = DisplayHeight(_display,
                                     DefaultScreen(_display));

  XMoveResizeWindow(_display, _xwindow, event.xreparent.x,
                    _display_height - h + event.xreparent.y,
                    width(), height());
  tell_platform_size_hints();
}

# endif // XLIB
