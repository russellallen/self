/* Copyright 2007 David Ungar, 2024-2026 Russell Allen
   See the LICENSE file for license information. */

// Contains platform-specific declarations for quartzWindow.
// This file is included into middle of class declaration.

#ifndef QUARTZWINDOW_HH
#define QUARTZWINDOW_HH

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# if !defined(QUARTZ_LIB)

class QuartzWindow {}; // dummy

# else

class EventQueue;


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


// ======================================================================
// ARM64 macOS: Use Cocoa/CoreText instead of Carbon
// ======================================================================
#if defined(__aarch64__)

// We do NOT include <Carbon/Carbon.h> on ARM64.
// Instead, we define compatibility types so the generated glue code compiles.
// The underlying implementations use Cocoa (NSWindow, NSEvent) and CoreText.

#include <CoreGraphics/CoreGraphics.h>
#include <CoreText/CoreText.h>
#include <ImageIO/ImageIO.h>

// These system headers bring in <assert.h> which overrides Self's 2-arg assert macro.
// Undo that, same as the x86_64/Carbon path does.
#undef assert
#undef assert_type
#undef assert_smi
#undef assert_byteVector
#undef assert_objVector
#include "asserts.hh"
#undef verify
#undef check

// --- Carbon compatibility types ---
// These match Carbon's opaque pointer patterns so the glue code compiles unchanged.
// Note: OSStatus and noErr are already provided by MacTypes.h (via CoreGraphics.h)

// Window types
struct OpaqueWindowPtr {
    void* nsWindow;     // NSWindow* (stored as void* for C++ compatibility)
    void* nsView;       // SelfContentView* (NSView subclass)
    void* quartzWindow; // back-pointer to QuartzWindow
};
typedef OpaqueWindowPtr* WindowRef;

// Graphics port - bridges to CGContext
struct OpaqueGrafPtr {
    void* nsView;       // SelfContentView*
    void* nsWindow;     // NSWindow*
    void* quartzWindow; // back-pointer to QuartzWindow
};
typedef OpaqueGrafPtr* GrafPtr;

// Event type
struct EventParam {
    uint32 name;        // 4-char code parameter name
    uint32 type;        // 4-char code parameter type
    union {
        uint32 uint32_val;
        int32  int32_val;
        uint16 uint16_val;
        int16  int16_val;
        uint8  uint8_val;
        uint8  bool_val;
        void*  ptr_val;       // for WindowRef, GrafPtr, EventRef, CGContextRef
        struct { double x, y; } point_val;
        struct { double w, h; } size_val;
        struct { double x, y, w, h; } rect_val;
    };
};

struct OpaqueEventRef {
    uint32 eventClass;
    uint32 eventKind;
    double eventTime;
    static const int MAX_PARAMS = 16;
    EventParam params[MAX_PARAMS];
    int paramCount;
    int refCount;

    OpaqueEventRef() : eventClass(0), eventKind(0), eventTime(0),
                       paramCount(0), refCount(1) {}

    void retain() { ++refCount; }
    void release() { if (--refCount <= 0) delete this; }

    void setParam_uint32(uint32 name, uint32 type, uint32 val) {
        if (paramCount >= MAX_PARAMS) return;
        params[paramCount].name = name;
        params[paramCount].type = type;
        params[paramCount].uint32_val = val;
        paramCount++;
    }
    void setParam_int32(uint32 name, uint32 type, int32 val) {
        if (paramCount >= MAX_PARAMS) return;
        params[paramCount].name = name;
        params[paramCount].type = type;
        params[paramCount].int32_val = val;
        paramCount++;
    }
    void setParam_point(uint32 name, double x, double y) {
        if (paramCount >= MAX_PARAMS) return;
        params[paramCount].name = name;
        params[paramCount].type = 'hipt'; // typeHIPoint
        params[paramCount].point_val.x = x;
        params[paramCount].point_val.y = y;
        paramCount++;
    }
    void setParam_size(uint32 name, double w, double h) {
        if (paramCount >= MAX_PARAMS) return;
        params[paramCount].name = name;
        params[paramCount].type = 'hisz'; // typeHISize
        params[paramCount].size_val.w = w;
        params[paramCount].size_val.h = h;
        paramCount++;
    }
    void setParam_rect(uint32 name, double x, double y, double w, double h) {
        if (paramCount >= MAX_PARAMS) return;
        params[paramCount].name = name;
        params[paramCount].type = 'rect';
        params[paramCount].rect_val.x = x;
        params[paramCount].rect_val.y = y;
        params[paramCount].rect_val.w = w;
        params[paramCount].rect_val.h = h;
        paramCount++;
    }
    void setParam_ptr(uint32 name, uint32 type, void* val) {
        if (paramCount >= MAX_PARAMS) return;
        params[paramCount].name = name;
        params[paramCount].type = type;
        params[paramCount].ptr_val = val;
        paramCount++;
    }

    EventParam* findParam(uint32 name) {
        for (int i = 0; i < paramCount; i++)
            if (params[i].name == name) return &params[i];
        return NULL;
    }
};
typedef OpaqueEventRef* EventRef;

// Carbon event constants used by VM code.
enum {
    kEventClassMouse    = 'mous',
    kEventClassKeyboard = 'keyb',
    kEventClassWindow   = 'wind',
};
enum {
    kEventMouseDown        = 1,
    kEventMouseUp          = 2,
    kEventMouseMoved       = 5,
    kEventMouseDragged     = 6,
    kEventMouseEntered     = 8,
    kEventMouseExited      = 9,
    kEventMouseWheelMoved  = 10,
};
enum {
    kEventRawKeyDown              = 1,
    kEventRawKeyUp                = 2,
    kEventRawKeyRepeat            = 3,
    kEventRawKeyModifiersChanged  = 4,
};
enum {
    kEventWindowBoundsChanged = 27,
    kEventWindowClose         = 72,
    kEventWindowActivated     = 5,
    kEventWindowDeactivated   = 6,
};
enum {
    kEventParamMouseLocation   = 'mloc',
    kEventParamMouseButton     = 'mbtn',
    kEventParamMouseWheelAxis  = 'mwax',
    kEventParamMouseWheelDelta = 'mwdl',
    kEventParamKeyCode         = 'kcod',
    kEventParamKeyMacCharCodes = 'kchr',
    kEventParamKeyModifiers    = 'kmod',
    kEventParamWindowRef       = 'wind',
    kEventParamDirectObject    = '----',
};
// Custom event parameter types for our Cocoa compatibility layer.
// Some overlap with AEDataModel.h / AERegistry.h constants; guard those.
enum {
    typeMouseButton    = 'mbtn',
    typeMouseWheelAxis = 'mwax',
    typeHIPoint        = 'hipt',
    typeHISize         = 'hisz',
    typeGrafPtr        = 'graf',
    typeWindowRef      = 'wind',
#ifndef __AEDATAMODEL__
    // These are also defined by AEDataModel.h
    typeSInt32         = 'long',
    typeUInt32         = 'magn',
    typeEventRef       = 'evnt',
    typeEventTargetRef = 'etag',
#endif
};

// Carbon-compatible function declarations (implemented in quartzWindow.mm)
inline void RetainEvent(EventRef e) { if (e) e->retain(); }
inline void ReleaseEvent(EventRef e) { if (e) e->release(); }
inline uint32 GetEventClass(EventRef e) { return e ? e->eventClass : 0; }
inline uint32 GetEventKind(EventRef e) { return e ? e->eventKind : 0; }
inline double GetEventTime(EventRef e) { return e ? e->eventTime : 0.0; }

// QDBeginCGContext/QDEndCGContext replacements (implemented in quartzWindow.mm)
CGContextRef QDBeginCGContext_wrap(OpaqueGrafPtr* port, void* FH);
void QDEndCGContext_wrap(OpaqueGrafPtr* port, CGContext* carg, void* FH);

// Window functions (implemented in quartzWindow.mm)
void    SetPortWindowPort(WindowRef w);
GrafPtr GetWindowPort(WindowRef w);
int32   GetWindowPortLeft(WindowRef w);
int32   GetWindowPortRight(WindowRef w);
int32   GetWindowPortTop(WindowRef w);
int32   GetWindowPortBottom(WindowRef w);
bool    IsWindowVisible(WindowRef w);
void    ShowWindow(WindowRef w);
void    SelectWindow(WindowRef w);
OSStatus ActivateWindow(WindowRef w, bool activate);
OSStatus SetUserFocusWindow(WindowRef w);
void    BringToFront(WindowRef w);
void    SendBehind(WindowRef front, WindowRef behind);
bool    IsValidWindowRef(WindowRef w);
WindowRef GetWindowFromPort(GrafPtr p);

// ATS Font compatibility types
// CoreText provides ATSFontRef (via ATSFONTREF_DEFINED) but not the rest.
#ifndef ATSFONTREF_DEFINED
typedef uint32 ATSFontRef;
#endif
typedef uint32 ATSFontFamilyRef;
typedef uint32 ATSFontContext;
typedef uint32 ATSOptionFlags;
typedef uint32 ATSUFontID;
#ifndef __ATSFONT__
// Only define these enums when ATSFont.h is not available
enum {
    kATSFontContextLocal = 1,
    kATSOptionFlagsDefault = 0,
    kATSOptionFlagsDefaultScope = 0,
};
#endif

// ATSFontMetrics - must have exact same field names as Carbon version
// because the glue uses C_get_comp with .fieldName access
#ifndef __ATSTYPES__
struct ATSFontMetrics {
    uint32 version;
    float  ascent;
    float  descent;
    float  leading;
    float  avgAdvanceWidth;
    float  maxAdvanceWidth;
    float  minLeftSideBearing;
    float  minRightSideBearing;
    float  stemWidth;
    float  stemHeight;
    float  capHeight;
    float  xHeight;
    float  italicAngle;
    float  underlinePosition;
    float  underlineThickness;

    ATSFontMetrics() { memset(this, 0, sizeof(*this)); }
};
#endif

// Font iterator types (opaque structs)
struct ATSFontIterator_ {
    CFArrayRef fontDescriptors; // array of CTFontDescriptorRef
    CFIndex    count;
    CFIndex    index;
};
typedef ATSFontIterator_* ATSFontIterator;

struct ATSFontFamilyIterator_ {
    CFArrayRef familyNames;  // array of CFStringRef family names
    CFIndex    count;
    CFIndex    index;
};
typedef ATSFontFamilyIterator_* ATSFontFamilyIterator;

// ATSU Text Layout compatibility
struct OpaqueATSUTextLayout {
    CTLineRef  line;
    UniChar*   text;        // owned copy of text
    CFIndex    textLength;
    CGContextRef context;   // associated CGContext
    CFDictionaryRef attrs;  // text attributes
    int        refCount;

    OpaqueATSUTextLayout() : line(NULL), text(NULL), textLength(0),
                              context(NULL), attrs(NULL), refCount(1) {}
    ~OpaqueATSUTextLayout();
};
typedef OpaqueATSUTextLayout* ATSUTextLayout;

// ATSU Style compatibility
struct OpaqueATSUStyle {
    CTFontRef  font;        // current font
    float      fontSize;
    uint32     fontID;      // our mapped font ID

    OpaqueATSUStyle() : font(NULL), fontSize(12.0), fontID(0) {}
    ~OpaqueATSUStyle();
};
typedef OpaqueATSUStyle* ATSUStyle;

#ifndef __FIXMATH__
// Fixed-point conversion (only when FixMath.h is not available)
typedef int32 Fixed;
inline Fixed X2Fix(double x) { return (Fixed)(x * 65536.0); }
inline double Fix2X(Fixed f) { return (double)f / 65536.0; }
#endif

// EndianU32 — system may already define these as macros
#ifndef EndianU32_BtoN
inline uint32 EndianU32_BtoN(uint32 x) {
    return CFSwapInt32BigToHost(x);
}
#endif
#ifndef EndianU32_NtoB
inline uint32 EndianU32_NtoB(uint32 x) {
    return CFSwapInt32HostToBig(x);
}
#endif

// HIRect/HISize/HIPoint are just CGRect/CGSize/CGPoint on modern macOS
typedef CGRect  HIRect;
typedef CGSize  HISize;
typedef CGPoint HIPoint;

// kDocumentWindowClass and related
enum {
    kDocumentWindowClass = 6,
    kHIWindowBitCloseBox = 1,
    kHIWindowBitZoomBox = 2,
    kHIWindowBitCollapseBox = 4,
    kHIWindowBitResizable = 8,
    kHIWindowBitRoundBottomBarCorners = 32,
    kHIWindowBitStandardHandler = 256,
    kWindowContentRgn = 33,
    kWindowStructureRgn = 32,
};

#ifndef __PASTEBOARD__
// Pasteboard types for clipboard (only when Pasteboard.h is not available)
typedef void* PasteboardRef;
#endif

#else // !__aarch64__ (x86_64 keeps Carbon)

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

#endif // __aarch64__


// ======================================================================
// EventQueue - shared between ARM64 and x86_64
// ======================================================================

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
    RetainEvent(e); // Self will do a release, but need to not release it yet
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

    // To keep Self from falling behind, coalesce both mouse motion events
    // and also mouse wheel events.

#if defined(__aarch64__)
    // On ARM64, coalesce mouse motion and wheel events
         if ( count() == 0   ||   c1 != kEventClassMouse   ||   c2 != kEventClassMouse )
                unfiltered_put(e); // do not overwrite

    else if ( (    k1 == kEventMouseMoved  ||  k1 == kEventMouseDragged)
         &&   (    k2 == kEventMouseMoved  ||  k2 == kEventMouseDragged
               ||  k2 == kEventMouseUp     ||  k2 == kEventMouseDown
               ||  k2 == kEventMouseWheelMoved )  )
               overwrite_last_event(e);

    else if ( k1 == kEventMouseWheelMoved   &&   k2 == kEventMouseWheelMoved ) {
        // Coalesce wheel events: add deltas if same axis
        EventParam* a1 = lpe->findParam(kEventParamMouseWheelAxis);
        EventParam* a2 = e->findParam(kEventParamMouseWheelAxis);
        EventParam* d1 = lpe->findParam(kEventParamMouseWheelDelta);
        EventParam* d2 = e->findParam(kEventParamMouseWheelDelta);
        if (a1 && a2 && a1->uint16_val == a2->uint16_val && d1 && d2) {
            int32 dt = d1->int32_val + d2->int32_val;
            d2->int32_val = dt;
            overwrite_last_event(e);
        } else {
            unfiltered_put(e);
        }
    }
    else
               unfiltered_put(e); // do not overwrite last event
#else
    uint16 a1, a2;
    int32 d1, d2, dt;

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

    # undef GET_AXIS
    # undef GET_DELTA
    # undef SET_DELTA
#endif

    last_put_event = e;
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
    if (count() == 0) fatal("no more events");
    --_count;
    incr_pos(read_pos);
  }
};


// ======================================================================
// QuartzWindow class
// ======================================================================

class QuartzWindow: public AbstractPlatformWindow {
 protected:
  bool _is_open;
#if defined(__aarch64__)
  // Cocoa: store NSWindow/NSView as void* for C++ compatibility
  void* _ns_window;      // NSWindow*
  void* _ns_view;        // SelfContentView* (NSView subclass)
  OpaqueWindowPtr  _windowPtr;  // the WindowRef struct
  OpaqueGrafPtr    _grafPtr;    // the GrafPtr struct
#else
  EventHandlerUPP _my_event_handler_upp;
  EventHandlerRef _my_event_handler;
  EventHandlerUPP _my_spy_event_handler_upp;
  EventHandlerRef _my_spy_event_handler;
#endif
  EventQueue _evtQ;
  bool _bounds_changed;
  bool _was_closed;
  ATSFontMetrics _metrics;
#if defined(__aarch64__)
  CTFontRef      _default_ct_font;
#else
  ATSFontRef     _default_font;
#endif
  CGColorSpaceRef _color_space;
#if defined(__aarch64__)
  WindowRef  _quartz_win;   // points to _windowPtr
#else
  WindowRef  _quartz_win;   // Carbon WindowRef
#endif
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
#if defined(__aarch64__)
  GrafPtr   my_grafPtr() { return &_grafPtr; }
#endif

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

#if defined(__aarch64__)
  // ARM64: event handling stubs for compatibility
  OSStatus    AddHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH);
  OSStatus RemoveHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH);
#else
  OSStatus handle_event(EventHandlerCallRef handler_call_chain, EventRef e);
  OSStatus handle_spy_event(EventHandlerCallRef handler_call_chain, EventRef e);

  OSStatus    AddHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH);
  OSStatus RemoveHandledEvent_wrap( uint32* eclass, uint ec_len, uint ekind, void* FH);
#endif

 protected:

  void init_events();
  void init_colors();
  void init_font_info();

#if !defined(__aarch64__)
  void get_window_region_rect(int, Rect*);
#endif
  virtual bool tell_platform_size_hints();

  bool get_graphics_semaphore();
  void setupCTM();


  // Mac-specific open call:

public:


  virtual bool  open(
          uint32  /* WindowClass */,
          int*    /* WindowAttributes */,
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

#endif // QUARTZWINDOW_HH
