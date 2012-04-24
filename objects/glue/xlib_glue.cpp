/* Sun-$Revision: 30.13 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */


# if defined(MACOSX_VERSION) && (TARGET_OS_VERSION == MACOSX_VERSION)
  typedef SelfX11Cursor Cursor;
# endif

# include "_glueDefs.cpp.incl"

# define Status int // cause I had to undef it earlier

# include <X11/Xlib.h>
# include <X11/Xutil.h>
# include <X11/Xutil.h>
# include <X11/extensions/shape.h>
# include "xlib.primMaker.hh"

// Display_seal is declared here
# include "xlibPrims.hh"

#ifdef DYNAMIC
VERIFYCHECKSUM
#endif

// Display_seal is defined in the VM
# define xTypeSealsDo(template)						      \
    template(Foo)							      \
    template(Atom)							      \
    template(Colormap)							      \
    template(Cursor)							      \
    template(Drawable)							      \
    template(Font)							      \
    template(GC)							      \
    template(Pixmap)							      \
    template(Screen)							      \
    template(Visual)							      \
    template(Window)							      \
    template(XCharStruct)						      \
    template(XColor)							      \
    template(XEvent)							      \
    template(XFontStruct)						      \
    template(XGCValues)							      \
    template(XImage)							      \
    template(XSizeHints)						      \
    template(XTextProperty)						      \
    template(XTextProperty_value)					      \
    template(XVisualInfo)						      \
    template(XWindowAttributes)						      \
    template(XWMHints)							      \
    template(XSetWindowAttributesWrap)					      \
    template(Region)

# define defineXTypeSeals(stem)						      \
    const char* CONC(stem,_seal) = STR(stem);

xTypeSealsDo(defineXTypeSeals)

// All events need to have the same type seal. For convenience, define
// extra names for them, so that we can write the templates more concisely.
// E.g., can use 'XAnyEvent' instead of 'proxy {XAnyEvent *} XEvent_seal'.
const char* XAnyEvent_seal            = XEvent_seal;
const char* XButtonEvent_seal         = XEvent_seal;
const char* XClientMessageEvent_seal  = XEvent_seal;
const char* XColormapEvent_seal       = XEvent_seal;
const char* XConfigureEvent_seal      = XEvent_seal;
const char* XCrossingEvent_seal       = XEvent_seal;
const char* XEnterWindowEvent_seal    = XEvent_seal;
const char* XExposeEvent_seal         = XEvent_seal;
const char* XFocusChangeEvent_seal    = XEvent_seal;
const char* XGraphicsExposeEvent_seal = XEvent_seal;
const char* XKeyEvent_seal            = XEvent_seal;
const char* XLeaveWindowEvent_seal    = XEvent_seal;
const char* XMapEvent_seal            = XEvent_seal;
const char* XMappingEvent_seal        = XEvent_seal;
const char* XMotionEvent_seal         = XEvent_seal;
const char* XNoExposeEvent_seal       = XEvent_seal;
const char* XReparentEvent_seal       = XEvent_seal;
const char* XUnmapEvent_seal          = XEvent_seal;
const char* XVisibilityEvent_seal     = XEvent_seal;


// This class is simply a wrapper around the XSetWindowAttributes structure
// and the mask used by X to determine which fields to care about.  It only
// provides setter methods since it is meant to be a structure used to set
// window properties - thus it assumes you know what you are putting in and
// you won't need to get it out later.
// I created this class because I was doing this in Self anyway (less cleanly)
// and the X function that uses it took too many arguments.  So this is the
// somewhat over-blown solution.  But I thought it was the easiest :)
// RCD - 7/20/94
class XSetWindowAttributesWrap {
public:
  XSetWindowAttributesWrap  () : attrMask(0L), winAttrs(new XSetWindowAttributes) {}
  ~XSetWindowAttributesWrap () { delete winAttrs; }

  void backgroundPixmap (Pixmap pixmap) {
    winAttrs->background_pixmap = pixmap;
    attrMask                  |= CWBackPixmap;
  }

  void backgroundPixel (unsigned long pixel) {
    winAttrs->background_pixel = pixel;
    attrMask                 |= CWBackPixel;
  }

  void borderPixmap (Pixmap pixmap) {
    winAttrs->border_pixmap = pixmap;
    attrMask              |= CWBorderPixmap;
  }

  void borderPixel (unsigned long pixel) {
    winAttrs->border_pixel = pixel;
    attrMask             |= CWBorderPixel;
  }

  void bitGravity (int gravity) {
    winAttrs->bit_gravity = gravity;
    attrMask            |= CWBitGravity;
  }

  void winGravity (int gravity) {
    winAttrs->win_gravity = gravity;
    attrMask            |= CWWinGravity;
  }

  void backingStore (int when) {
    winAttrs->backing_store = when;
    attrMask              |= CWBackingStore;
  }

  void backingPlanes (unsigned long planes) {
    winAttrs->backing_planes = planes;
    attrMask               |= CWBackingPlanes;
  }

  void backingPixel (unsigned long pixel) {
    winAttrs->backing_pixel = pixel;
     attrMask             |= CWBackingPixel;
  }

  void saveUnder (Bool yesOrNo) {
    winAttrs->save_under = yesOrNo;
    attrMask           |= CWSaveUnder;
  }

  void eventMask (long mask) {
    winAttrs->event_mask = mask;
    attrMask           |= CWEventMask;
  }

  void doNotPropagateMask (long mask) {
    winAttrs->do_not_propagate_mask = mask;
    attrMask                      |= CWDontPropagate;
  }

  void overrideRedirect (Bool yesOrNo) {
    winAttrs->override_redirect = yesOrNo;
    attrMask                  |= CWOverrideRedirect;
  }

  void colormap (Colormap cmap) {
    winAttrs->colormap = cmap;
    attrMask         |= CWColormap;
  }

  void cursor (Cursor cursor) {
    winAttrs->cursor = cursor;
    attrMask       |= CWCursor;
  }

  unsigned long          mask     () { return attrMask; }
  XSetWindowAttributes * rawAttrs () { return winAttrs; }

private:
  unsigned long 	attrMask;
  XSetWindowAttributes *winAttrs;
};


oop XNextEvent_wrap(Display *display, bool peek,
                    objVectorOop eventProtos, void *FH) {
  XEvent *evt = new XEvent();
  if (peek)
    XPeekEvent(display, evt);
  else
    XNextEvent(display, evt);
  int type = evt->type;
  if (type < 0 || type >= eventProtos->length()) {
    char err[50];
    sprintf(err, "unknown X event, type = %d", type);
    failure(FH, err);
    delete evt;
    return NULL;
  }
  oop proto = eventProtos->obj_at(type);
  if (!proto->is_proxy()) {
    prim_failure(FH, BADTYPEERROR);
    delete evt;
    return NULL;
  }
  proxyOop res = proxyOop(proto)->clone();
  res->set_pointer(evt);
  res->set_type_seal(XEvent_seal);
  return res;
}


void XGetGCValues_wrap(Display* display, GC gc, unsigned long valuemask,
		       XGCValues *values_return, void* FH) {
  int status = XGetGCValues(display, gc, valuemask, values_return);
  if (status == 0) {
    failure(FH, "XGetGCValues failed--valuemask may be invalid");
  }
}

Window XCreateIOWindow_wrap(Display* display, Window win,
                            int x, int y,
                            unsigned int width, unsigned int height,
                            int depth, Visual* visual,
                            XSetWindowAttributesWrap* winAttrs) {
  return XCreateWindow(display, win, x, y, width, height, 0, depth,
                       InputOutput,
                       visual, winAttrs->mask(), winAttrs->rawAttrs());
}

void XChangeWindowAttributes_wrap(Display *display, Window win,
                                  XSetWindowAttributesWrap *winAttrs) {
  XChangeWindowAttributes(display, win,
                          winAttrs->mask(), winAttrs->rawAttrs());
}

XWindowAttributes *XGetWindowAttributes_wrap(Display *display, 
                                             Window win, void *FH) {
  XWindowAttributes *attrs = new XWindowAttributes();
  if (!XGetWindowAttributes(display, win, attrs)) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    delete attrs;
    return NULL;
  }
  return attrs;
}




void XMoveWindowBy_wrap(Display* display, Window win,
                            int x, int y) {
  int old_x, old_y;
  unsigned int w, h, b, d;
  Window pw;

  if (!XGetGeometry(display, win, &pw, &old_x, &old_y, &w, &h, &b, &d)) {
    return;
  }
  XMoveWindow(display, win, x + old_x, y + old_y);
}


int XSetWMProtocol_wrap(Display* display,  Window window,  Atom protocol) {
  Atom ps[1];
  ps[0] = protocol;
  return XSetWMProtocols(display, window, ps, 1);
}

void XQueryColors_wrap(Display* display,
		       Colormap colormap,
		       objVectorOop colors_oop,
		       void *FH) {
  XColor** pcolors = (XColor**)colors_oop->convertProxyArray(XColor_seal);
  if (!pcolors) {
    prim_failure(FH, BADTYPEERROR);
    return;
  }
  int32 count = colors_oop->length();
  XColor* colors = NEW_RESOURCE_ARRAY(XColor, count);
  int32 i;
  for (i = 0;  i < count;  i++) {
    colors[i] = *pcolors[i];
  }
  XQueryColors(display, colormap, colors, count);
  for (i = 0; i < count; i++) {
    *pcolors[i] = colors[i];
  }
}

void XStoreColors_wrap(Display* display, Colormap colormap,
		       objVectorOop colors_oop, void *FH) {
  XColor** pcolors = (XColor**)colors_oop->convertProxyArray(XColor_seal);
  if (!pcolors) {
    prim_failure(FH, BADTYPEERROR);
    return;
  }
  int32 count = colors_oop->length();
  XColor* colors = NEW_RESOURCE_ARRAY(XColor, count);
  for (int32 i = 0; i < count; i++) {
    colors[i] = *pcolors[i];
  }
  XStoreColors(display, colormap, colors, count);
}

void XAllocColorCells_wrap(Display* display, Colormap colormap, bool contig,
			   objVectorOop plane_masks_return_oop,
			   objVectorOop pixels_return_oop, void *FH) {

  unsigned int nplanes = plane_masks_return_oop->length();
  unsigned int npixels = pixels_return_oop->length();
  int i;

  ResourceMark rm;

  if (npixels <= 0) {
    prim_failure(FH, BADSIZEERROR);
    return;
  }

  unsigned long* plane_masks_return = NEW_RESOURCE_ARRAY(unsigned long, nplanes);
  unsigned long* pixels_return      = NEW_RESOURCE_ARRAY(unsigned long, npixels);

  if (!XAllocColorCells(display, colormap, contig,
                        plane_masks_return, nplanes,
			pixels_return,      npixels)) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return;
  }

  for (i = 0; i < nplanes; i++)
    plane_masks_return_oop->obj_at_put(i, as_smiOop(plane_masks_return[i]), 
                                       false);
  for (i = 0; i < npixels; i++)
    pixels_return_oop->obj_at_put(i, as_smiOop(pixels_return[i]), false);
}

void XFreeColorCells_wrap(Display* display, Colormap colormap,
		      objVectorOop pixels_oop, unsigned long planes, void *FH) {
  int npixels = pixels_oop->length();
  unsigned long* pixels = (unsigned long*)pixels_oop->convertIntArray();
  if (!pixels) {
    prim_failure(FH, BADTYPEERROR);
    return;
  }

  XFreeColors(display, colormap, pixels, npixels, planes);
}

void XFillPolygon_wrap(Display* display, Drawable d, GC gc,
		       objVectorOop xsOop, objVectorOop ysOop,
		       int shape, int mode, void* FH) {
  if (!xlib_semaphore)  fatal("xlib_semaphore should be set");
  int32* xs = xsOop->convertIntArray();
  int32* ys = ysOop->convertIntArray();
  if (!xs || !ys) {
    prim_failure(FH, BADTYPEERROR);
    return;
  }
  int n = xsOop->length();
  if (n != ysOop->length()) {
    failure(FH, "different number of x and y coordinates");
    return;
  }
  XPoint *points= new XPoint[n];

  for (int i = 0; i < n; i++) {
    points[i].x = xs[i];
    points[i].y = ys[i];
  }

  XFillPolygon(display, d, gc, points, n, shape, mode);
  delete [] points;
}

void XDrawLines_wrap(Display* display, Drawable d, GC gc,
		     objVectorOop xsOop, objVectorOop ysOop,
		     int mode, void* FH) {
  int32* xs = xsOop->convertIntArray();
  int32* ys = ysOop->convertIntArray();
  if (!xs || !ys) {
    prim_failure(FH, BADTYPEERROR);
    return;
  }
  int n = xsOop->length();
  if (n != ysOop->length()) {
    failure(FH, "different number of x and y coordinates");
    return;
  }
  XPoint *points= new XPoint[n];

  for (int i = 0; i < n; i++) {
    points[i].x = xs[i];
    points[i].y = ys[i];
  }

  XDrawLines(display, d, gc, points, n, mode);
  delete [] points;
}


// Note: str is an object vector containing 16-bit unsigned integer
// values. Each such integer represents a 2-byte X char.

void XDrawString16_wrap(Display *display, Drawable drawable,
                        GC gc, int x, int y, objVectorOop str, void *FH) {
  if (!xlib_semaphore)  fatal("xlib_semaphore should be set");
  int len = str->length();
  assert(sizeof(XChar2b) == sizeof(unsigned short),
         "XDrawString16_wrap: bad int sizes");
  XChar2b *xstr = (XChar2b *)str->convertUnsignedShortArray();
  if (xstr == NULL)
    prim_failure(FH, BADTYPEERROR);
  else
    XDrawString16(display, drawable, gc, x, y, xstr, str->length());
}


XFontStruct* XLoadQueryFont_wrap(Display* display, const char* name, void* FH) {
  XFontStruct* font_struct = XLoadQueryFont(display, name);
  if (font_struct == NULL) {
    failure(FH, "font does not exist");
    return NULL;
  }
  return font_struct;
}

void XSetClipRectangle_wrap(Display* display, GC gc,
			    int  x,    int y,
			    int width, int height) {
  XRectangle rect;
  rect.x = x; rect.y = y; rect.width = width; rect.height = height;
  XSetClipRectangles(display, gc, 0, 0, &rect, 1, Unsorted);
}

Atom XClientMessageEvent_atomAt_wrap(XClientMessageEvent* rcvr,
				     unsigned int index, void* FH) {
  if (    sizeof(rcvr->data.l[0]) * index
      >=  sizeof(rcvr->data.l)) {
    prim_failure(FH, BADINDEXERROR);
    return 0;
  }
  return rcvr->data.l[index];
}

int XStringToTextProperty_wrap(XTextProperty* textProperty, char* string) {
  return XStringListToTextProperty(&string, 1, textProperty);
}

int XLookupString_wrap(XKeyEvent* event, char* string, int len,
                       objVectorOop keySym) {
  KeySym ks;
  int n = XLookupString(event, string, len, &ks, NULL);
  if (keySym->length() >= 1) keySym->obj_at_put(0, as_smiOop(ks), false);
  return n;
}

unsigned int XQueryBestStippleWidth(Display* display, Drawable which_screen,
				    unsigned int width, unsigned int height,
				    void* FH) {
  unsigned int width_return, height_return;
  if (!XQueryBestStipple(display, which_screen, width, height, &width_return,
			 &height_return)) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return 0;
  }
  return width_return;
}

unsigned int XQueryBestStippleHeight(Display* display, Drawable which_screen,
				     unsigned int width, unsigned int height,
				     void* FH) {
  unsigned int width_return, height_return;
  if (!XQueryBestStipple(display, which_screen, width, height, &width_return,
			 &height_return)) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return 0;
  }
  return height_return;
}

unsigned int XQueryBestTileWidth(Display* display, Drawable which_screen,
				 unsigned int width, unsigned int height,
				 void* FH) {
  unsigned int width_return, height_return;
  if (!XQueryBestTile(display, which_screen, width, height, &width_return,
		      &height_return)) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return 0;
  }
  return width_return;
}

unsigned int XQueryBestTileHeight(Display* display, Drawable which_screen,
				     unsigned int width, unsigned int height,
				     void* FH) {
  unsigned int width_return, height_return;
  if (!XQueryBestTile(display, which_screen, width, height, &width_return,
		      &height_return)) {
    prim_failure(FH, PRIMITIVEFAILEDERROR);
    return 0;
  }
  return height_return;
}

XVisualInfo* XMatchVisualInfo_wrap(Display* display, int screen, int depth,
				   int vclass, void *FH) {
  XVisualInfo* vinfo_return = new XVisualInfo;
  if (!XMatchVisualInfo(display, screen, depth, vclass, vinfo_return)) {
    delete vinfo_return;
    failure(FH, "no matching visual found");
    return NULL;
  }
  return vinfo_return;
}


int maxAscent(XFontStruct* font_struct) {
  return font_struct->max_bounds.ascent;
}

int maxDescent(XFontStruct* font_struct) {
  return font_struct->max_bounds.descent;
}

int maxCharWidth(XFontStruct* font_struct) {
  return font_struct->max_bounds.width;
}

int perCharWidth(XFontStruct* font_struct, int ch) {
  return font_struct->per_char[ch].width;
}

inline void XFree_XSizeHints_wrap(XSizeHints *p) {XFree((char*)p);}
inline void XFree_XWMHints_wrap  (XWMHints   *p) {XFree((char*)p);}

inline XEvent* asXEvent(XEvent* e) {return e;}


void XStoreBytes_wrap(Display* display, char* buffer, void *FH) {
  if (!XStoreBytes(display, buffer, strlen(buffer))) {
    failure(FH, "xStoreBytes failed");
  }
}

char *XFetchBytes_wrap(Display* display, void *FH) {
  char* result;
  int   size;
  char* buffer;
  if ((result = XFetchBytes(display, &size)) == 0) {
    failure(FH, "xFetchBytes failed");
    return NULL;
  }

  // null terminate the string before returning.
  buffer = (char*) malloc(size + 1);
  strncpy(buffer, result, size);
  buffer[size] = '\0';

  XFree(result);
  return buffer;
}


XImage* XCreateImage_wrap(Display* display, Visual* visual,
                          unsigned int depth, int format,
                          unsigned int width, unsigned int height,
                          int bitmapPadding) {

  // Doesn't work without this. -- dmu 1/2000
  unsigned int pixel_size = depth == 24  ?  32  :  depth;
  unsigned int bit_width = width * pixel_size;

  assert(bitmapPadding == 8 || bitmapPadding == 16 || bitmapPadding == 32,
         "XCreateImage_wrap assumes padding is power of two");

  // round up by padding
  unsigned int padded_bit_width =  (bit_width + bitmapPadding - 1) 
                                & ~(bitmapPadding - 1);

  static const unsigned int bits_per_byte = 8;
  char* data = (char*) malloc((padded_bit_width * height) / bits_per_byte);

  return XCreateImage(
    display, visual, depth, format, 0, data, width, height, bitmapPadding, 0);
}


void XImagePutData_wrap(XImage* image, char* pixels, int pixelsLen, objVectorOop map, void* FH) {
  int mapLen = map->length();
  for (int i = 0;  i < mapLen;  ++i)
    if (!map->obj_at(i)->is_smi()) {
      prim_failure(FH, BADTYPEERROR);
      return;
    }
  
  int w = image->width;
  int h = image->height;
  int x, y;

  if (pixelsLen < (w * h)) return;
  for (y = 0; y < h; y++) {
    int rowOffset = y * w;
    for (x = 0; x < w; x++) {
      unsigned int mapIndex = (unsigned char)pixels[rowOffset + x];
      if (mapIndex < mapLen) {
        oop p = map->obj_at(mapIndex);
        XPutPixel(image, x, y, smiOop(p)->value());
      } else {
        XPutPixel(image, x, y, 0);
      }
    }
  }
}

void XImageGetData_wrap(XImage* image, char* pixels, int pixelsLen) {
  int w = image->width;
  int h = image->height;
  int x, y;

  if (pixelsLen < (w * h)) return;
  for (y = 0; y < h; y++) {
    int rowOffset = y * w;
    for (x = 0; x < w; x++) {
      pixels[rowOffset + x] = (char)XGetPixel(image, x, y);
    }
  }
}

Window XTranslateCoordinates_wrap(Display *display, 
                                  Window src_w, Window dst_w,
                                  objVectorOop src_coords, void *FH) {
  if (src_coords->length() < 3)  {   // Yes, 3. We need a place for the bool
                                     // result of XTranslateCoordinates.
    prim_failure(FH, BADSIZEERROR);
    return NULL;
  }
  oop ox, oy, ret;
  int newX, newY;
  Window child;
  ox = src_coords->obj_at(0);
  oy = src_coords->obj_at(1);
  if (!ox->is_smi() || !oy->is_smi()) {
    prim_failure(FH, BADTYPEERROR);
    return NULL;
  }
  if (XTranslateCoordinates(display, src_w, dst_w, 
                            smiOop(ox)->value(), smiOop(oy)->value(),
                            &newX, &newY, &child))
    ret = Memory->trueObj;
  else
    ret = Memory->falseObj;
  src_coords->obj_at_put(0, as_smiOop(newX), false);
  src_coords->obj_at_put(1, as_smiOop(newY), false);
  src_coords->obj_at_put(2, ret);    // This one needs storecheck!
  return child;
}



static oop timeAsVector(Time time) {
  const unsigned long ms_per_day = 1000 * 60 * 60 * 24;
  objVectorOop result = Memory->objVectorObj->cloneSize(2);
  result->obj_at_put(0, as_smiOop(time/ms_per_day), false);
  result->obj_at_put(1, as_smiOop(time%ms_per_day), false);
  return result;
}

// Extracting time stamp for events
oop xButtonEvent_time(XButtonEvent* evt) {
 return timeAsVector(evt->time); }
oop xCrossingEvent_time(XCrossingEvent* evt) {
 return timeAsVector(evt->time); }
oop xKeyEvent_time(XKeyEvent* evt) {
 return timeAsVector(evt->time); }
oop xMotionEvent_time(XMotionEvent* evt) {
 return timeAsVector(evt->time); }


//
//	X Shape wrappers
//
Bool XShapeQueryExtension_wrap(Display* display) {
	int	ev, err;
  return XShapeQueryExtension(display, &ev, &err);
}

// -- Not really necessary to define this wrapper, can call directly
void XShapeCombineRegion_wrap(Display* display, Drawable d, int dkind,
			      int x, int y, Region r, int op) {
  XShapeCombineRegion(display, d, dkind, x, y, r, op);
}

// NOTE: Pixmap m MUST have a depth of 1
// -- Not really necessary to define this wrapper, can call directly
void XShapeCombineMask_wrap(Display* display, Drawable d, int dkind,
			    int x, int y, Pixmap m, int op) {
  XShapeCombineMask(display, d, dkind, x, y, m, op);
}

// -- Not really necessary to define this wrapper, can call directly
void XShapeCombineShape_wrap(Display* display, Drawable d, int dkind,
			     int x, int y, Pixmap m, int skind, int op) {
  XShapeCombineShape(display, d, dkind, x, y, m, skind, op);
}

#ifdef WHAT_TO_DO
// r is an array of rectangles, nr is number of rectangles in the array.
// No clue how to pass this array from self--not defined for now.
void XShapeCombineRectangles_wrap(Display* display, Drawable d, int dkind,
				  int x, int y, XRectangle *r, int nr,
				  int op, int order) {
  XShapeCombineRectangles(display, d, dkind, x, y, r, nr, op, order);
}
#endif

// special wrapper to handle a single rectangle at a time
void XShapeCombineRectangle_wrap(Display* display, Drawable d, int dkind,
				  int x, int y,
				  unsigned int width, unsigned int height,
				  int op) {
  XRectangle rect;
  rect.x = x; rect.y = y; rect.width = width; rect.height = height;
  XShapeCombineRectangles(display, d, dkind, 0, 0, &rect, 1, op, Unsorted);
}

//
//	X Region wrappers
//
//	The destination region is the first parameter in most calls
//	so the calls are sensible in Self. Function calls generated
//	by primitiveMaker pass the first parameter by reference.
Region XCreateRegion_wrap() {
  Region r;
  r = XCreateRegion();
  return (r);
}

void XDestroyRegion_wrap(Region r) {
  XDestroyRegion(r);
}

Bool XEmptyRegion_wrap(Region r) {
  return XEmptyRegion(r);
}

Bool XEqualRegion_wrap(Region r1, Region r2) {
  return XEqualRegion(r1, r2);
}

void XUnionRegion_wrap(Region d, Region s1, Region s2) {
  XUnionRegion(s1, s2, d);
}

// Reversed source region with rectangle in calling parameters
// to make it look better in the Self template.
void XUnionRectWithRegion_wrap(Region d, Region s,
			       int x, int y, int width, int height) {
  XRectangle rect;
  rect.x = x; rect.y = y; rect.width = width; rect.height = height;
  XUnionRectWithRegion(&rect, s, d);
}

void XIntersectRegion_wrap(Region d, Region s1, Region s2) {
  XIntersectRegion(s1, s2, d);
}

void XXorRegion_wrap(Region d, Region s1, Region s2) {
  XXorRegion(s1, s2, d);
}

void XOffsetRegion_wrap(Region r, int x, int y) {
  XOffsetRegion(r, x, y);
}

void XSubtractRegion_wrap(Region d, Region s1, Region s2) {
  XSubtractRegion(s1, s2, d);
}



# define XEvent_member_wraps_Do(template)				      \
    template(XAnyEvent,xany)						      \
    template(XButtonEvent,xbutton)					      \
    template(XCirculateEvent,xcirculate)				      \
    template(XCirculateRequestEvent,xcirculaterequest)			      \
    template(XClientMessageEvent,xclient)				      \
    template(XColormapEvent,xcolormap)					      \
    template(XConfigureEvent,xconfigure)				      \
    template(XConfigureRequestEvent,xconfigurerequest)			      \
    template(XCreateWindowEvent,xcreatewindow)				      \
    template(XCrossingEvent,xcrossing)					      \
    template(XDestroyWindowEvent,xdestroywindow)			      \
    template(XErrorEvent,xerror)					      \
    template(XExposeEvent,xexpose)					      \
    template(XFocusChangeEvent,xfocus)					      \
    template(XGraphicsExposeEvent,xgraphicsexpose)			      \
    template(XGravityEvent,xgravity)					      \
    template(XKeyEvent,xkey)						      \
    template(XKeymapEvent,xkeymap)					      \
    template(XMapEvent,xmap)						      \
    template(XMapRequestEvent,xmaprequest)				      \
    template(XMappingEvent,xmapping)					      \
    template(XMotionEvent,xmotion)					      \
    template(XNoExposeEvent,xnoexpose)					      \
    template(XPropertyEvent,xproperty)					      \
    template(XReparentEvent,xreparent)					      \
    template(XResizeRequestEvent,xresizerequest)			      \
    template(XSelectionClearEvent,xselectionclear)			      \
    template(XSelectionEvent,xselection)				      \
    template(XSelectionRequestEvent,xselectionrequest)			      \
    template(XUnmapEvent,xunmap)					      \
    template(XVisibilityEvent,xvisibility)

# define define_XEvent_member_wrap(type,member)				      \
    type* CONC3(get_,member,_wrap) (XEvent* e) {return & e->member;}

XEvent_member_wraps_Do(define_XEvent_member_wrap)


# define WHAT_GLUE FUNCTIONS
# undef  PRIMITIVE_GLUE_FLAG_CODE
# define PRIMITIVE_GLUE_FLAG_CODE BlockGlueFlag gf(xlib_semaphore); // must be right before xlib_glue
    xlib_glue
# undef WHAT_GLUE
