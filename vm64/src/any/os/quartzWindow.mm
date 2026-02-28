/* Copyright 2007 David Ungar, 2024-2026 Russell Allen
   See the LICENSE file for license information. */

// ARM64 macOS: Cocoa implementation of quartzWindow
// Replaces Carbon APIs with NSWindow/NSEvent/CoreText

# pragma implementation

# if defined(QUARTZ_LIB) && defined(__aarch64__)

// The .mm file does not get the precompiled header (it's C++ only, not ObjC++).
// Include AppKit FIRST so system types are defined, then include Self headers.
// quartzWindow.hh will detect already-defined system types and skip its versions.
#import <AppKit/AppKit.h>
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>

// Undef Cocoa/AppKit macros that conflict with Self
#undef assert
#undef check
#undef verify

// Now include Self precompiled header and specific includes
# include "_precompiled.hh"
# include "_quartzWindow.cpp.incl"


// ======================================================================
// WindowSet implementation
// ======================================================================

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
      fatal("did not find _window");
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


// ======================================================================
// SelfContentView - NSView subclass that provides CGContext
// ======================================================================

@interface SelfContentView : NSView
@property (nonatomic, assign) QuartzWindow* quartzWindow;
@end

@implementation SelfContentView

- (BOOL)isFlipped {
    return NO; // Keep CoreGraphics coordinate system (origin at bottom-left)
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)acceptsFirstMouse:(NSEvent *)event {
    return YES;
}

- (void)mouseDown:(NSEvent *)event       { [self handleMouseEvent:event kind:kEventMouseDown]; }
- (void)mouseUp:(NSEvent *)event         { [self handleMouseEvent:event kind:kEventMouseUp]; }
- (void)mouseMoved:(NSEvent *)event      { [self handleMouseEvent:event kind:kEventMouseMoved]; }
- (void)mouseDragged:(NSEvent *)event    { [self handleMouseEvent:event kind:kEventMouseDragged]; }
- (void)rightMouseDown:(NSEvent *)event  { [self handleMouseEvent:event kind:kEventMouseDown]; }
- (void)rightMouseUp:(NSEvent *)event    { [self handleMouseEvent:event kind:kEventMouseUp]; }
- (void)rightMouseDragged:(NSEvent *)event { [self handleMouseEvent:event kind:kEventMouseDragged]; }
- (void)otherMouseDown:(NSEvent *)event  { [self handleMouseEvent:event kind:kEventMouseDown]; }
- (void)otherMouseUp:(NSEvent *)event    { [self handleMouseEvent:event kind:kEventMouseUp]; }
- (void)otherMouseDragged:(NSEvent *)event { [self handleMouseEvent:event kind:kEventMouseDragged]; }

- (void)scrollWheel:(NSEvent *)event {
    if (!_quartzWindow) return;

    OpaqueEventRef* evt = new OpaqueEventRef();
    evt->eventClass = kEventClassMouse;
    evt->eventKind = kEventMouseWheelMoved;
    evt->eventTime = [event timestamp];

    // Global screen coordinates (top-left origin)
    NSPoint locInWindow = [event locationInWindow];
    NSPoint locOnScreen = [[self window] convertPointToScreen:locInWindow];
    CGFloat screenH = [[NSScreen mainScreen] frame].size.height;
    evt->setParam_point(kEventParamMouseLocation, locOnScreen.x, screenH - locOnScreen.y);

    // Window-local coordinates (structure-relative, top-left origin)
    NSRect contentBounds = [self bounds];
    int insetLeft = _quartzWindow->inset_left();
    int insetTop  = _quartzWindow->inset_top();
    evt->setParam_point(kEventParamWindowMouseLocation,
                        insetLeft + locInWindow.x,
                        insetTop + (contentBounds.size.height - locInWindow.y));

    // Wheel axis and delta
    // Carbon convention: kEventMouseWheelAxisX = 0, kEventMouseWheelAxisY = 1
    if ([event deltaY] != 0) {
        evt->setParam_uint32(kEventParamMouseWheelAxis, typeMouseWheelAxis, 1); // kEventMouseWheelAxisY
        evt->setParam_int32(kEventParamMouseWheelDelta, typeSInt32, (int32)[event deltaY]);
    } else if ([event deltaX] != 0) {
        evt->setParam_uint32(kEventParamMouseWheelAxis, typeMouseWheelAxis, 0); // kEventMouseWheelAxisX
        evt->setParam_int32(kEventParamMouseWheelDelta, typeSInt32, (int32)[event deltaX]);
    }

    // Modifier keys
    NSUInteger mods = [event modifierFlags];
    uint32 carbonMods = 0;
    if (mods & NSEventModifierFlagShift)    carbonMods |= (1 << 9);
    if (mods & NSEventModifierFlagControl)  carbonMods |= (1 << 12);
    if (mods & NSEventModifierFlagOption)   carbonMods |= (1 << 11);
    if (mods & NSEventModifierFlagCommand)  carbonMods |= (1 << 8);
    if (mods & NSEventModifierFlagCapsLock) carbonMods |= (1 << 10); // capsLock
    evt->setParam_uint32(kEventParamKeyModifiers, typeUInt32, carbonMods);

    // Window reference and part code
    evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());
    evt->setParam_uint32(kEventParamWindowDefPart, typeUInt32, kPartInContent);

    _quartzWindow->put_event(evt);
    evt->release(); // put_event retains
}

- (void)keyDown:(NSEvent *)event {
    [self handleKeyEvent:event kind:kEventRawKeyDown];
}

- (void)keyUp:(NSEvent *)event {
    [self handleKeyEvent:event kind:kEventRawKeyUp];
}

- (void)flagsChanged:(NSEvent *)event {
    [self handleKeyEvent:event kind:kEventRawKeyModifiersChanged];
}

- (void)handleMouseEvent:(NSEvent *)event kind:(uint32)kind {
    if (!_quartzWindow) return;

    OpaqueEventRef* evt = new OpaqueEventRef();
    evt->eventClass = kEventClassMouse;
    evt->eventKind = kind;
    evt->eventTime = [event timestamp];

    // Global screen coordinates (top-left origin) — kEventParamMouseLocation
    NSPoint locInWindow = [event locationInWindow];
    NSPoint locOnScreen = [[self window] convertPointToScreen:locInWindow];
    CGFloat screenH = [[NSScreen mainScreen] frame].size.height;
    double globalX = locOnScreen.x;
    double globalY = screenH - locOnScreen.y;
    evt->setParam_point(kEventParamMouseLocation, globalX, globalY);

    // Window-local coordinates (structure-relative, top-left origin)
    // Carbon's kEventParamWindowMouseLocation is relative to the window's
    // structure region (including title bar), not the content area.
    NSRect contentBounds = [self bounds];
    int insetLeft = _quartzWindow->inset_left();
    int insetTop  = _quartzWindow->inset_top();
    double localX = insetLeft + locInWindow.x;
    double localY = insetTop + (contentBounds.size.height - locInWindow.y);
    evt->setParam_point(kEventParamWindowMouseLocation, localX, localY);

    // Button number: Carbon uses 1=left, 2=right, 3=middle
    uint16 button = 1;
    switch ([event type]) {
        case NSEventTypeRightMouseDown:
        case NSEventTypeRightMouseUp:
        case NSEventTypeRightMouseDragged:
            button = 2;
            break;
        case NSEventTypeOtherMouseDown:
        case NSEventTypeOtherMouseUp:
        case NSEventTypeOtherMouseDragged:
            button = (uint16)[event buttonNumber] + 1;
            break;
        default:
            button = 1;
            break;
    }
    evt->setParam_uint32(kEventParamMouseButton, typeMouseButton, button);

    // Mouse chord: bitmask of buttons currently held
    // Carbon: bit 0 = primary, bit 1 = secondary, bit 2 = tertiary
    NSUInteger pressed = [NSEvent pressedMouseButtons];
    uint32 chord = 0;
    if (pressed & (1 << 0)) chord |= 1;  // left
    if (pressed & (1 << 1)) chord |= 2;  // right
    if (pressed & (1 << 2)) chord |= 4;  // middle
    evt->setParam_uint32(kEventParamMouseChord, typeUInt32, chord);

    // Click count
    NSInteger clickCount = 0;
    if (kind == kEventMouseDown || kind == kEventMouseUp) {
        clickCount = [event clickCount];
    }
    evt->setParam_uint32(kEventParamClickCount, typeUInt32, (uint32)clickCount);

    // Modifier keys
    NSUInteger mods = [event modifierFlags];
    uint32 carbonMods = 0;
    if (mods & NSEventModifierFlagShift)    carbonMods |= (1 << 9);  // shiftKey
    if (mods & NSEventModifierFlagControl)  carbonMods |= (1 << 12); // controlKey
    if (mods & NSEventModifierFlagOption)   carbonMods |= (1 << 11); // optionKey
    if (mods & NSEventModifierFlagCommand)  carbonMods |= (1 << 8);  // cmdKey
    if (mods & NSEventModifierFlagCapsLock) carbonMods |= (1 << 10); // capsLock
    evt->setParam_uint32(kEventParamKeyModifiers, typeUInt32, carbonMods);

    // Window reference
    evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());

    // Window part code: inContent = 3 (Carbon HIToolbox part code)
    evt->setParam_uint32(kEventParamWindowDefPart, typeUInt32, kPartInContent);

    _quartzWindow->put_event(evt);
    evt->release(); // put_event retains
}

- (void)handleKeyEvent:(NSEvent *)event kind:(uint32)kind {
    if (!_quartzWindow) return;

    OpaqueEventRef* evt = new OpaqueEventRef();
    evt->eventClass = kEventClassKeyboard;
    evt->eventKind = kind;
    evt->eventTime = [event timestamp];

    // Key code
    evt->setParam_uint32(kEventParamKeyCode, typeUInt32, (uint32)[event keyCode]);

    // Character code
    if (kind != kEventRawKeyModifiersChanged) {
        NSString* chars = [event characters];
        if ([chars length] > 0) {
            evt->setParam_uint32(kEventParamKeyMacCharCodes, typeUInt32,
                                 (uint32)[chars characterAtIndex:0]);
        }
    }

    // Modifier keys
    NSUInteger mods = [event modifierFlags];
    uint32 carbonMods = 0;
    if (mods & NSEventModifierFlagShift)    carbonMods |= (1 << 9);
    if (mods & NSEventModifierFlagControl)  carbonMods |= (1 << 12);
    if (mods & NSEventModifierFlagOption)   carbonMods |= (1 << 11);
    if (mods & NSEventModifierFlagCommand)  carbonMods |= (1 << 8);
    if (mods & NSEventModifierFlagCapsLock) carbonMods |= (1 << 10); // capsLock
    evt->setParam_uint32(kEventParamKeyModifiers, typeUInt32, carbonMods);

    // Window reference
    evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());

    _quartzWindow->put_event(evt);
    evt->release(); // put_event retains
}

- (BOOL)wantsUpdateLayer {
    return YES;
}

- (void)updateLayer {
    if (!_quartzWindow) return;
    CGContextRef bitmapCtx = _quartzWindow->bitmapContext();
    if (!bitmapCtx) return;
    CGImageRef image = CGBitmapContextCreateImage(bitmapCtx);
    if (!image) return;
    self.layer.contents = (__bridge id)image;
    CGImageRelease(image);
}

@end


// ======================================================================
// SelfWindowDelegate - handles window lifecycle events
// ======================================================================

@interface SelfWindowDelegate : NSObject <NSWindowDelegate>
@property (nonatomic, assign) QuartzWindow* quartzWindow;
@end

@implementation SelfWindowDelegate

- (void)windowDidResize:(NSNotification *)notification {
    if (_quartzWindow) {
        _quartzWindow->set_bounds_changed();

        OpaqueEventRef* evt = new OpaqueEventRef();
        evt->eventClass = kEventClassWindow;
        evt->eventKind = kEventWindowBoundsChanged;
        evt->eventTime = [[NSProcessInfo processInfo] systemUptime];
        evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());
        _quartzWindow->put_event(evt);
        evt->release();
    }
}

- (void)windowDidMove:(NSNotification *)notification {
    if (_quartzWindow) {
        OpaqueEventRef* evt = new OpaqueEventRef();
        evt->eventClass = kEventClassWindow;
        evt->eventKind = kEventWindowBoundsChanged;
        evt->eventTime = [[NSProcessInfo processInfo] systemUptime];
        evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());
        _quartzWindow->put_event(evt);
        evt->release();
    }
}

- (BOOL)windowShouldClose:(NSWindow *)sender {
    if (_quartzWindow) {
        _quartzWindow->set_was_closed();

        OpaqueEventRef* evt = new OpaqueEventRef();
        evt->eventClass = kEventClassWindow;
        evt->eventKind = kEventWindowClose;
        evt->eventTime = [[NSProcessInfo processInfo] systemUptime];
        evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());
        _quartzWindow->put_event(evt);
        evt->release();
    }
    return NO; // Let Self handle the close
}

- (void)windowDidBecomeKey:(NSNotification *)notification {
    if (_quartzWindow) {
        OpaqueEventRef* evt = new OpaqueEventRef();
        evt->eventClass = kEventClassWindow;
        evt->eventKind = kEventWindowHandleActivate;
        evt->eventTime = [[NSProcessInfo processInfo] systemUptime];
        evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());
        _quartzWindow->put_event(evt);
        evt->release();
    }
}

- (void)windowDidResignKey:(NSNotification *)notification {
    if (_quartzWindow) {
        OpaqueEventRef* evt = new OpaqueEventRef();
        evt->eventClass = kEventClassWindow;
        evt->eventKind = kEventWindowHandleDeactivate;
        evt->eventTime = [[NSProcessInfo processInfo] systemUptime];
        evt->setParam_ptr(kEventParamWindowRef, typeWindowRef, _quartzWindow->my_window());
        _quartzWindow->put_event(evt);
        evt->release();
    }
}

@end


// ======================================================================
// Bitmap blitting helper — bypasses drawRect for immediate display
// ======================================================================

static void blitBitmapToView(SelfContentView* view, CGContextRef bitmapCtx) {
    if (!view || !bitmapCtx) return;
    CGImageRef image = CGBitmapContextCreateImage(bitmapCtx);
    if (!image) return;
    // Directly set layer contents — bypasses the drawRect/display cycle
    // which is unreliable for imperative drawing on modern macOS.
    CALayer* layer = [view layer];
    if (layer) {
        [CATransaction begin];
        [CATransaction setDisableActions:YES]; // no implicit animation
        layer.contents = (__bridge id)image;
        [CATransaction commit];
    }
    CGImageRelease(image);
}


// ======================================================================
// NSApplication initialization (must be called before any Cocoa use)
// ======================================================================

static bool cocoa_initialized = false;

static void ensure_cocoa_initialized() {
  if (cocoa_initialized) return;
  cocoa_initialized = true;

  @autoreleasepool {
    [NSApplication sharedApplication];
    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
    [NSApp finishLaunching];
  }
}


// ======================================================================
// QuartzWindow implementation
// ======================================================================

QuartzWindow::QuartzWindow() : AbstractPlatformWindow(), _evtQ() {
  _is_open = false;
  _ns_window = NULL;
  _ns_view = NULL;
  _bounds_changed = false;
  _was_closed = false;
  _quartz_win = NULL;
  myContext = NULL;
  _bitmapContext = NULL;
  _bitmapData = NULL;
  _bitmapWidth = 0;
  _bitmapHeight = 0;
  _default_ct_font = NULL;
  _color_space = NULL;
  memset(&_windowPtr, 0, sizeof(_windowPtr));
  memset(&_grafPtr, 0, sizeof(_grafPtr));
}


void QuartzWindow::destroyBitmapContext() {
  if (_bitmapContext) {
    CGContextRelease(_bitmapContext);
    _bitmapContext = NULL;
  }
  if (_bitmapData) {
    free(_bitmapData);
    _bitmapData = NULL;
  }
  _bitmapWidth = 0;
  _bitmapHeight = 0;
  myContext = NULL;
}

void QuartzWindow::ensureBitmapContext() {
  int w = width();
  int h = height();
  if (w <= 0) w = 1;
  if (h <= 0) h = 1;
  if (_bitmapContext && _bitmapWidth == w && _bitmapHeight == h)
    return;
  destroyBitmapContext();
  size_t bytesPerRow = (size_t)w * 4;
  _bitmapData = calloc((size_t)h, bytesPerRow);
  if (!_bitmapData) fatal("could not allocate bitmap buffer");
  _bitmapContext = CGBitmapContextCreate(
      _bitmapData, w, h, 8, bytesPerRow,
      _color_space, kCGImageAlphaNoneSkipLast);
  if (!_bitmapContext) fatal("could not create bitmap context");
  _bitmapWidth = w;
  _bitmapHeight = h;
  // Clear to white so uncovered areas aren't black
  CGContextSetRGBFillColor(_bitmapContext, 1.0, 1.0, 1.0, 1.0);
  CGContextFillRect(_bitmapContext, CGRectMake(0, 0, w, h));
}


bool QuartzWindow::open( const char* /* display_name */,
                           int x, int y, int w, int h,
                           int min_w, int max_w, int min_h, int max_h,
                           const char* window_name,  const char* /*icon_name*/,
                           const char* font_name,    int   font_size ) {

  int options[8] = {
    kHIWindowBitCloseBox,
    kHIWindowBitZoomBox,
    kHIWindowBitCollapseBox,
    kHIWindowBitResizable,
    kHIWindowBitRoundBottomBarCorners,
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
                    uint32  wc,
                    int*    attrs,
                    int   left,
                    int   top,
                    int   right,
                    int   bottom,
                    const char* title,
                    const char* font_name,
                    int   font_size ) {

  ensure_cocoa_initialized();

  @autoreleasepool {
    // Create NSWindow
    // Note: Carbon used (left, top, right-left, bottom-top) but passed as (left, top, right, bottom)
    // The caller passes right=left+width, bottom=top+height
    int w = right - left;
    int h = bottom - top;

    // Convert top-left origin to bottom-left for Cocoa
    NSScreen* screen = [NSScreen mainScreen];
    CGFloat screenH = screen.frame.size.height;
    CGFloat cocoaY = screenH - top - h;

    NSRect frame = NSMakeRect(left, cocoaY, w, h);

    NSWindowStyleMask style = NSWindowStyleMaskTitled
                            | NSWindowStyleMaskClosable
                            | NSWindowStyleMaskMiniaturizable
                            | NSWindowStyleMaskResizable;

    NSWindow* nsWin = [[NSWindow alloc] initWithContentRect:frame
                                        styleMask:style
                                        backing:NSBackingStoreBuffered
                                        defer:NO];

    NSString* nsTitle = [NSString stringWithUTF8String:title];
    [nsWin setTitle:nsTitle];
    [nsWin setAcceptsMouseMovedEvents:YES];

    // Create content view
    SelfContentView* view = [[SelfContentView alloc] initWithFrame:[[nsWin contentView] bounds]];
    view.quartzWindow = this;
    [view setWantsLayer:YES];
    [view setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [nsWin setContentView:view];

    // Create and set delegate
    SelfWindowDelegate* delegate = [[SelfWindowDelegate alloc] init];
    delegate.quartzWindow = this;
    [nsWin setDelegate:delegate];

    // Store references
    _ns_window = (__bridge_retained void*)nsWin;
    _ns_view = (__bridge_retained void*)view;

    // Set up WindowRef compatibility struct
    _windowPtr.nsWindow = _ns_window;
    _windowPtr.nsView = _ns_view;
    _windowPtr.quartzWindow = this;
    _quartz_win = &_windowPtr;

    // Set up GrafPtr compatibility struct
    _grafPtr.nsView = _ns_view;
    _grafPtr.nsWindow = _ns_window;
    _grafPtr.quartzWindow = this;

    WindowSet::add_window(_quartz_win);
    _is_open = true;

    init_colors();
    init_events();

    return true;
  }
}

void QuartzWindow::init_colors() {
  CGFloat redc[]    = {1.0, 0.0, 0.0, 1.0};
  CGFloat yellowc[] = {1.0, 1.0, 0.0, 1.0};
  CGFloat blackc[]  = {0.0, 0.0, 0.0, 1.0};
  CGFloat grayc[]   = {0.5, 0.5, 0.5, 1.0};
  CGFloat whitec[]  = {1.0, 1.0, 1.0, 1.0};
  _color_space = CGColorSpaceCreateDeviceRGB();
  _red    = (long int) CGColorCreate( _color_space, redc);
  _yellow = (long int) CGColorCreate( _color_space, yellowc);
  _black  = (long int) CGColorCreate( _color_space, blackc);
  _gray   = (long int) CGColorCreate( _color_space, grayc);
  _white  = (long int) CGColorCreate( _color_space, whitec);
}


void QuartzWindow::init_font_info() {
  @autoreleasepool {
    NSString* fontName = [NSString stringWithUTF8String:default_fixed_font_name()];
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)fontName,
                                           (CGFloat)default_fixed_font_size(), NULL);
    if (!font) {
      // Fallback to Menlo
      font = CTFontCreateWithName(CFSTR("Menlo"), (CGFloat)default_fixed_font_size(), NULL);
    }
    if (!font) fatal("could not find font");

    _default_ct_font = font;

    // Fill ATSFontMetrics from CTFont
    _metrics.version = 1;
    _metrics.ascent = (float)(CTFontGetAscent(font) / CTFontGetSize(font));
    _metrics.descent = (float)(-CTFontGetDescent(font) / CTFontGetSize(font));
    _metrics.leading = (float)(CTFontGetLeading(font) / CTFontGetSize(font));

    // Get advance width from space character
    UniChar space = ' ';
    CGGlyph glyph;
    CGSize advance;
    CTFontGetGlyphsForCharacters(font, &space, &glyph, 1);
    CTFontGetAdvancesForGlyphs(font, kCTFontOrientationHorizontal, &glyph, &advance, 1);
    _metrics.avgAdvanceWidth = (float)(advance.width / CTFontGetSize(font));
    _metrics.maxAdvanceWidth = _metrics.avgAdvanceWidth; // monospace font

    _metrics.minLeftSideBearing = 0;
    _metrics.minRightSideBearing = 0;
    _metrics.stemWidth = 0;
    _metrics.stemHeight = 0;
    _metrics.capHeight = (float)(CTFontGetCapHeight(font) / CTFontGetSize(font));
    _metrics.xHeight = (float)(CTFontGetXHeight(font) / CTFontGetSize(font));
    _metrics.italicAngle = (float)CTFontGetSlantAngle(font);
    _metrics.underlinePosition = (float)(CTFontGetUnderlinePosition(font) / CTFontGetSize(font));
    _metrics.underlineThickness = (float)(CTFontGetUnderlineThickness(font) / CTFontGetSize(font));
  }
}


void QuartzWindow::activate() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    SelfContentView* view = (__bridge SelfContentView*)_ns_view;
    if (![nsWin isVisible])
      [nsWin orderFront:nil];
    [nsWin makeKeyAndOrderFront:nil];
    [nsWin makeFirstResponder:view];
  }
}


void QuartzWindow::close() {
  if (!is_open())
    return;
  @autoreleasepool {
    destroyBitmapContext();
    CGColorRelease((CGColorRef) _red);
    CGColorRelease((CGColorRef) _yellow);
    CGColorRelease((CGColorRef) _black);
    CGColorRelease((CGColorRef) _gray);
    CGColorRelease((CGColorRef) _white);
    if (_color_space) CGColorSpaceRelease(_color_space);
    if (_default_ct_font) CFRelease(_default_ct_font);
    _default_ct_font = NULL;

    WindowSet::rm_window(_quartz_win);

    NSWindow* nsWin = (__bridge_transfer NSWindow*)_ns_window;
    SelfContentView* view = (__bridge_transfer SelfContentView*)_ns_view;
    view.quartzWindow = nil;
    id delegate = [nsWin delegate];
    if ([delegate isKindOfClass:[SelfWindowDelegate class]]) {
        ((SelfWindowDelegate*)delegate).quartzWindow = nil;
    }
    [nsWin setDelegate:nil];
    [nsWin close];
    _ns_window = NULL;
    _ns_view = NULL;

    _is_open = false;
    _quartz_win = NULL;
  }
}


int QuartzWindow::screen_width() {
  @autoreleasepool {
    return (int)[[NSScreen mainScreen] frame].size.width;
  }
}

int QuartzWindow::screen_height() {
  @autoreleasepool {
    return (int)[[NSScreen mainScreen] frame].size.height;
  }
}

int QuartzWindow::menubar_height() {
  return (int)[[NSApp mainMenu] menuBarHeight];
}


int QuartzWindow::left() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect content = [nsWin contentRectForFrameRect:[nsWin frame]];
    return (int)content.origin.x;
  }
}

int QuartzWindow::top() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect content = [nsWin contentRectForFrameRect:[nsWin frame]];
    CGFloat screenH = [[NSScreen mainScreen] frame].size.height;
    return (int)(screenH - content.origin.y - content.size.height);
  }
}

int QuartzWindow::width() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect content = [nsWin contentRectForFrameRect:[nsWin frame]];
    return (int)content.size.width;
  }
}

int QuartzWindow::height() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect content = [nsWin contentRectForFrameRect:[nsWin frame]];
    return (int)content.size.height;
  }
}


int QuartzWindow::inset_left() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect frame = [nsWin frame];
    NSRect content = [nsWin contentRectForFrameRect:frame];
    return (int)(content.origin.x - frame.origin.x);
  }
}

int QuartzWindow::inset_top() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect frame = [nsWin frame];
    NSRect content = [nsWin contentRectForFrameRect:frame];
    return (int)((frame.origin.y + frame.size.height) - (content.origin.y + content.size.height));
  }
}

int QuartzWindow::inset_right() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect frame = [nsWin frame];
    NSRect content = [nsWin contentRectForFrameRect:frame];
    return (int)((frame.origin.x + frame.size.width) - (content.origin.x + content.size.width));
  }
}

int QuartzWindow::inset_bottom() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSRect frame = [nsWin frame];
    NSRect content = [nsWin contentRectForFrameRect:frame];
    return (int)(content.origin.y - frame.origin.y);
  }
}


int QuartzWindow::font_width()  {
  return ceil(_metrics.maxAdvanceWidth * default_fixed_font_size());
}
int QuartzWindow::font_height() {
  return ceil(_metrics.leading) * default_fixed_font_size();
}

const char* QuartzWindow::default_fixed_font_name() { return "Monaco"; }
int   QuartzWindow::default_fixed_font_size() { return 9; }


bool QuartzWindow::change_extent(int left, int top, int w, int h) {
  @autoreleasepool {

    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    CGFloat screenH = [[NSScreen mainScreen] frame].size.height;

    // Convert from outer coordinates to content coordinates
    int contentLeft = left + inset_left();
    int contentTop = top + inset_top();
    int contentW = w - inset_left() - inset_right();
    int contentH = h - inset_top() - inset_bottom();

    CGFloat cocoaY = screenH - contentTop - contentH;
    NSRect contentRect = NSMakeRect(contentLeft, cocoaY, contentW, contentH);
    NSRect frameRect = [nsWin frameRectForContentRect:contentRect];
    [nsWin setFrame:frameRect display:YES];

    adjust_after_resize();
    return true;
  }
}


bool QuartzWindow::tell_platform_size_hints() {
  @autoreleasepool {
    NSWindow* nsWin = (__bridge NSWindow*)_ns_window;
    NSSize minSize, maxSize;
    minSize.width  =  _min_w == -1 ?        0  :  (_min_w - inset_left() - inset_right());
    minSize.height =  _min_h == -1 ?        0  :  (_min_h - inset_top()  - inset_bottom());
    maxSize.width  =  _max_w == -1 ?  1000000  :  (_max_w - inset_left() - inset_right());
    maxSize.height =  _max_h == -1 ?  1000000  :  (_max_h - inset_top()  - inset_bottom());
    [nsWin setContentMinSize:minSize];
    [nsWin setContentMaxSize:maxSize];
    return true;
  }
}


void QuartzWindow::setupCTM() {
  CGContextTranslateCTM(myContext, 0, height());
  CGContextScaleCTM(myContext, 1, -1);
}

void QuartzWindow::adjust_after_resize() {
  // Don't destroy bitmap here — ensureBitmapContext() will detect the size
  // mismatch and recreate on the next actual draw call. In the meantime,
  // drawRect: can blit the old bitmap (stretched to fit).
  myContext = NULL;  // force CTM re-setup on next pre_draw
  if (TheSpy != NULL)
    TheSpy->adjust_after_resize();
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
  if (_bounds_changed) {
    _bounds_changed = false;
    adjust_after_resize();
  }
  ensureBitmapContext();
  bool fresh = (myContext != _bitmapContext);  // detect new or recreated context
  myContext = _bitmapContext;
  if (fresh && myContext) {
    setupCTM();
    CGContextSetTextMatrix(myContext, CGAffineTransformMake( 1, 0, 0, -1, 0, 0));
    CGContextSelectFont(myContext,
      default_fixed_font_name(), default_fixed_font_size(), kCGEncodingMacRoman);
    CGContextSetShouldAntialias(myContext, false);
  }
  if (fresh || !incremental) {
    clear_rectangle(0, 0, width(), height());
  }
  return true;
}


void QuartzWindow::post_draw(bool incremental) {
  @autoreleasepool {
    SelfContentView* view = (__bridge SelfContentView*)_ns_view;
    blitBitmapToView(view, _bitmapContext);
  }
}


void QuartzWindow::full_redraw() {
  if (TheSpy != NULL)
    TheSpy->full_redraw();
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
  CGContextSetFillColorWithColor(   myContext, (CGColorRef)(long)c );
  CGContextSetStrokeColorWithColor( myContext, (CGColorRef)(long)c );
}

void QuartzWindow::set_thickness(int t) {
  CGContextSetLineWidth(myContext, max(1, t));
}

void QuartzWindow::set_xor()   { CGContextSetBlendMode(myContext, kCGBlendModeDifference);  }
void QuartzWindow::set_copy()  { CGContextSetBlendMode(myContext, kCGBlendModeNormal);  }


bool QuartzWindow::get_graphics_semaphore() {
  extern bool quartz_semaphore;
  return quartz_semaphore;
}


void QuartzWindow::warp_pointer(int x, int y) {
    CGPoint pt;
    pt.x = x;
    pt.y = y;
    const int n = 16;
    CGDisplayCount count = 0;
    CGDirectDisplayID dspys[n];
    CGDisplayErr err = CGGetDisplaysWithPoint( pt, n, dspys, &count);
    if (err != kCGErrorSuccess) return;
    for (uint32 i = 0;  i < count;  ++i) {
      CGRect bounds = CGDisplayBounds(dspys[i]);
      CGPoint adjusted_pt;
      adjusted_pt.x = pt.x - bounds.origin.x;
      adjusted_pt.y = pt.y - bounds.origin.y;
      CGDisplayMoveCursorToPoint( dspys[i], adjusted_pt);
    }
}


// Clipboard

oop QuartzWindow::get_scrap_text() {
  @autoreleasepool {
    NSPasteboard* pb = [NSPasteboard generalPasteboard];
    NSString* str = [pb stringForType:NSPasteboardTypeString];
    if (!str) return new_string("", 0);

    const char* utf8 = [str UTF8String];
    int len = (int)strlen(utf8);
    byteVectorOop r = Memory->byteVectorObj->cloneSize(len, CANFAIL);
    if (r->is_mark()) return new_string("", 0);
    memcpy(r->bytes(), utf8, len);
    return r;
  }
}

int QuartzWindow::put_scrap_text(const char* s, int len) {
  @autoreleasepool {
    NSPasteboard* pb = [NSPasteboard generalPasteboard];
    [pb clearContents];
    NSString* str = [[NSString alloc] initWithBytes:s length:len encoding:NSUTF8StringEncoding];
    if (!str) return -1;
    [pb setString:str forType:NSPasteboardTypeString];
    return 0;
  }
}


// Convert WindowRef to QuartzWindow
QuartzWindow* QuartzWindow::getPlatformWindow(WindowRef ww, void* FH) {
    if (!WindowSet::includes_window(ww))  { failure(FH, "not a QuartzPlatformWindow"); return NULL; }
    QuartzWindow* w = (QuartzWindow*) ww->quartzWindow;
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


void QuartzWindow::init_events() {
  // On Cocoa, events are handled by the NSView/NSWindowDelegate
  // No explicit event handler installation needed
}

OSStatus QuartzWindow::AddHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH) {
  // On Cocoa, we receive all events automatically via the view/delegate
  // This is a no-op but returns success
  if (ec_len != 1) { failure(FH, "class needs to have four bytes"); return -1; }
  return noErr;
}

OSStatus QuartzWindow::RemoveHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH) {
  if (ec_len != 1) { failure(FH, "class needs to have four bytes"); return -1; }
  return noErr;
}


void QuartzWindow::check_carbon_events() {
  if (!cocoa_initialized) {
    return;  // No Cocoa yet, nothing to pump
  }

  // On Cocoa, pump the event loop briefly
  @autoreleasepool {
    BlockGlueFlag f(quartz_semaphore);
    for (;;) {
      NSEvent* event = [NSApp nextEventMatchingMask:NSEventMaskAny
                              untilDate:nil
                              inMode:NSDefaultRunLoopMode
                              dequeue:YES];
      if (!event) break;
      [NSApp sendEvent:event];
    }
    // Refresh display for all windows from their current bitmap state.
    // This provides progressive rendering during long QDBegin/QDEnd draws.
    for (int i = 0; i < WindowSet::num_windows(); i++) {
      OpaqueWindowPtr* wr = (OpaqueWindowPtr*)WindowSet::get_window(i);
      if (wr && wr->nsView && wr->quartzWindow) {
        QuartzWindow* qw = (QuartzWindow*)wr->quartzWindow;
        if (qw->bitmapContext()) {
          SelfContentView* v = (__bridge SelfContentView*)wr->nsView;
          blitBitmapToView(v, qw->bitmapContext());
        }
      }
    }
  }
}


// ======================================================================
// Carbon-compatible window functions (called by glue)
// ======================================================================

void SetPortWindowPort(WindowRef w) {
    // No-op on Cocoa
}

GrafPtr GetWindowPort(WindowRef w) {
    if (!w) return NULL;
    QuartzWindow* qw = (QuartzWindow*)w->quartzWindow;
    return qw->my_grafPtr();
}

int32 GetWindowPortLeft(WindowRef w) {
    if (!w) return 0;
    QuartzWindow* qw = (QuartzWindow*)w->quartzWindow;
    return 0; // port bounds start at 0
}

int32 GetWindowPortRight(WindowRef w) {
    if (!w) return 0;
    QuartzWindow* qw = (QuartzWindow*)w->quartzWindow;
    return qw->width();
}

int32 GetWindowPortTop(WindowRef w) {
    if (!w) return 0;
    return 0;
}

int32 GetWindowPortBottom(WindowRef w) {
    if (!w) return 0;
    QuartzWindow* qw = (QuartzWindow*)w->quartzWindow;
    return qw->height();
}

bool IsWindowVisible(WindowRef w) {
    if (!w) return false;
    @autoreleasepool {
        NSWindow* nsWin = (__bridge NSWindow*)w->nsWindow;
        return [nsWin isVisible];
    }
}

void ShowWindow(WindowRef w) {
    if (!w) return;
    @autoreleasepool {
        NSWindow* nsWin = (__bridge NSWindow*)w->nsWindow;
        [nsWin orderFront:nil];
    }
}

void SelectWindow(WindowRef w) {
    if (!w) return;
    @autoreleasepool {
        NSWindow* nsWin = (__bridge NSWindow*)w->nsWindow;
        [nsWin makeKeyAndOrderFront:nil];
    }
}

OSStatus ActivateWindow(WindowRef w, bool activate) {
    if (!w) return -1;
    @autoreleasepool {
        NSWindow* nsWin = (__bridge NSWindow*)w->nsWindow;
        if (activate)
            [nsWin makeKeyWindow];
        return noErr;
    }
}

OSStatus SetUserFocusWindow(WindowRef w) {
    if (!w) return -1;
    @autoreleasepool {
        NSWindow* nsWin = (__bridge NSWindow*)w->nsWindow;
        [nsWin makeKeyWindow];
        return noErr;
    }
}

void BringToFront(WindowRef w) {
    if (!w) return;
    @autoreleasepool {
        NSWindow* nsWin = (__bridge NSWindow*)w->nsWindow;
        [nsWin orderFront:nil];
    }
}

void SendBehind(WindowRef front, WindowRef behind) {
    if (!front) return;
    @autoreleasepool {
        NSWindow* nsFront = (__bridge NSWindow*)front->nsWindow;
        if (behind) {
            NSWindow* nsBehind = (__bridge NSWindow*)behind->nsWindow;
            [nsFront orderWindow:NSWindowBelow relativeTo:[nsBehind windowNumber]];
        } else {
            [nsFront orderBack:nil];
        }
    }
}

bool IsValidWindowRef(WindowRef w) {
    return w && WindowSet::includes_window(w);
}

WindowRef GetWindowFromPort(GrafPtr p) {
    if (!p) return NULL;
    QuartzWindow* qw = (QuartzWindow*)p->quartzWindow;
    return qw ? qw->my_window() : NULL;
}


// ======================================================================
// QDBeginCGContext / QDEndCGContext replacements for ARM64
// ======================================================================

CGContextRef QDBeginCGContext_wrap(OpaqueGrafPtr* port, void* FH) {
    QuartzWindow* qw = (QuartzWindow*)port->quartzWindow;
    if (!qw) { failure(FH, "no QuartzWindow"); return NULL; }
    qw->ensureBitmapContext();
    CGContextRef ctx = qw->bitmapContext();
    if (!ctx) { failure(FH, "could not get bitmap context"); return NULL; }
    CGContextSaveGState(ctx);
    // Reset CTM to identity — Self GUI code sets its own transforms
    CGAffineTransform ctm = CGContextGetCTM(ctx);
    CGContextConcatCTM(ctx, CGAffineTransformInvert(ctm));
    return ctx;
}

void QDEndCGContext_wrap(OpaqueGrafPtr* port, CGContext* carg, void* FH) {
    if (carg) CGContextRestoreGState(carg);
    QuartzWindow* qw = (QuartzWindow*)port->quartzWindow;
    @autoreleasepool {
        SelfContentView* view = (__bridge SelfContentView*)port->nsView;
        blitBitmapToView(view, qw ? qw->bitmapContext() : NULL);
    }
}


// ======================================================================
// ATSU compatibility types - destructor implementations
// ======================================================================

OpaqueATSUTextLayout::~OpaqueATSUTextLayout() {
    if (line) CFRelease(line);
    if (text) free(text);
    if (attrs) CFRelease(attrs);
}

OpaqueATSUStyle::~OpaqueATSUStyle() {
    if (font) CFRelease(font);
}


# endif // QUARTZ_LIB && __aarch64__
