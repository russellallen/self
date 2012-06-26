/* Sun-$Revision: 30.11 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "macToolboxPrims.hh"

# if defined(MACTOOLBOX_LIB) || TARGET_API_MAC_CARBON

# if TARGET_OS_VERSION == MACOSX_VERSION && !TARGET_API_MAC_CARBON
  #  undef ASSEMBLER
  #  undef Alloc
  
  #  include <Carbon/Carbon.h>

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


# include "_macToolboxPrims.cpp.incl"

# ifndef DYNAMIC
  // Removed to avoid warnings in Tiger -- dmu 5/05
  // # include "include_glue.hh"
# endif

char*  MacToolboxWindow_seal = "MacToolboxWindow";
char*         GDevice_seal = "GDevice";
char*           GDPtr_seal = "GDPtr";
char*          PixMap_seal = "PixMap";
char*            ITab_seal = "ITab";
char*      ColorTable_seal = "ColorTable";
char*         CTabPtr_seal = "CTabPtr";
char*          BitMap_seal = "BitMap";
char* MacToolboxCursor_seal = "MacToolboxCursor";
char*         Pattern_seal = "Pattern";
char*   OpaqueGrafPtr_seal = "OpaqueGrafPtr";
char*        GrafVars_seal = "GrafVars";
char* OpaqueRgnHandle_seal = "OpaqueRgnHandle";
char*          PixPat_seal = "PixPat";
char*        RGBColor_seal = "RGBColor";
char*           Point_seal = "Point";
char*            Rect_seal = "Rect";
char*      FMetricRec_seal = "FMetricRec";
char*      WidthTable_seal = "WidthTable";
char* OpaqueWindowPtr_seal = "OpaqueWindowPtr";
char*         Polygon_seal = "Polygon";
char*         PolyPtr_seal = "PolyPtr";
char*     EventRecord_seal = "EventRecord";
char*       ColorSpec_seal = "ColorSpec";

// Mac trucks in handles...
static ITab*          gdITable_wrap(GDPtr* gd)      { return *             (*gd)->gdITable;   }
static PixMap*          gdPMap_wrap(GDPtr* gd)      { return *             (*gd)->gdPMap;     }
static GDPtr*         gdNextGD_wrap(GDPtr* gd)      { return (GDPtr*)      (*gd)->gdNextGD;   }
static Rect*            gdRect_wrap(GDPtr* gd)      { return &             (*gd)->gdRect;     }
static Rect*            bounds_wrap(PixMap* pm)     { return &             pm->bounds;     }

static PixMap*      portPixMap_wrap(CGrafPtr gp)    { return *             GetPortPixMap(gp); }
static WidthTable*        wTab_wrap(FMetricRec* fm) { return *(WidthTable**)fm->wTabHandle; }

static PixPat*        bkPixPat_wrap(CGrafPtr gp)  { PixPat* pp = NULL; return * GetPortBackPixPat(gp, &pp); }
static PixPat*        pnPixPat_wrap(CGrafPtr gp)  { PixPat* pp = NULL; return * GetPortPenPixPat (gp, &pp); }
static PixPat*      fillPixPat_wrap(CGrafPtr gp)  { PixPat* pp = NULL; return * GetPortFillPixPat(gp, &pp); }

static short   gdRefNum_wrap (GDPtr* g) { return (*g)->gdRefNum; }
static short   gdType_wrap   (GDPtr* g) { return (*g)->gdType; }
static short   gdResPref_wrap(GDPtr* g) { return (*g)->gdResPref; }
static short   gdFlags_wrap  (GDPtr* g) { return (*g)->gdFlags; }
static int     gdRefCon_wrap (GDPtr* g) { return (*g)->gdRefCon; }
static int     gdMode_wrap   (GDPtr* g) { return (*g)->gdMode; }
static short   gdCCBytes_wrap  (GDPtr* g) { return (*g)->gdCCBytes; }
static short   gdCCDepth_wrap  (GDPtr* g) { return (*g)->gdCCDepth; }

static RGBColor*  rgbColor_wrap(ColorSpec* cs) { return &cs->rgb; }
static void   set_rgbColor_wrap(ColorSpec* cs, RGBColor* rgb) { cs->rgb = *rgb; }


static void  rgbForeColor_wrap(unsigned short r, unsigned short g, unsigned short b) {
  static RGBColor c; c.red = r;  c.green = g;  c.blue = b;
  RGBForeColor(&c);
}

static void       rgbBackColor_wrap(unsigned short r, unsigned short g, unsigned short b) {
  static RGBColor c; c.red = r;  c.green = g;  c.blue = b;
  RGBBackColor(&c);
}


static unsigned short  getCPixelR_wrap(unsigned short h, unsigned short v) {
  RGBColor c;  GetCPixel(h, v, &c);  return c.red; 
}  
static unsigned short  getCPixelG_wrap(unsigned short h, unsigned short v) {
  RGBColor c;  GetCPixel(h, v, &c);  return c.green; 
}  
static unsigned short  getCPixelB_wrap(unsigned short h, unsigned short v) {
  RGBColor c;  GetCPixel(h, v, &c);  return c.blue; 
}  
  



static GWorldPtr  newGWorld_wrap(short depth,  short L, short T, short R, short B,
                                  CTabPtr* ct, GDPtr* gd, unsigned long flags, void* FH) {
  GWorldPtr res;
  static Rect r; r.left = L;  r.top = T;  r.right = R;  r.bottom = B;
  // passing addresses of args is risky in general, but seemingly ok here -- dmu 7/99
  QDErr e = NewGWorld( &res, depth, &r, ct, gd, flags);
  if (e != noErr) {
    static char buf[1000];
    sprintf(buf, "NewGWorld failed: error %d", e);
    failure(FH, buf);
    return NULL;
  }
  if (!LockPixels(GetGWorldPixMap(res))) {
    failure(FH, "LockPixels failed");
    DisposeGWorld(res);
    return NULL;
  }
  return res;
}


static long double   ascent_wrap(FMetricRec* fm) { return Fix2X(fm->ascent); }
static long double  descent_wrap(FMetricRec* fm) { return Fix2X(fm->descent); }
static long double  leading_wrap(FMetricRec* fm) { return Fix2X(fm->leading); }
static long double   widMax_wrap(FMetricRec* fm) { return Fix2X(fm->widMax); }

static bool   isOutline_wrap(short n_h, short n_v, short d_h, short d_v) { 
  Point numer;  numer.h = n_h;  numer.v = n_v;
  Point denom;  denom.h = d_h;  denom.v = d_v;
  return IsOutline(numer, denom);
}

static oop FMGetFontFamilyName_wrap(short id, void* FH) {
  Str255 pname;
  pname[0] = 0;
  FMGetFontFamilyName(id, pname);
  if (pname[0] == 0)  { failure(FH, "font ID is unknown");  return NULL; }
  return new_string((char*)&pname[1], (int)pname[0]);
}

static int FMGetFontFamilyFromName_wrap(char* name, int len, void* FH) {
  if (len > 255)  { failure(FH, "font name exceeds 255 characters");  return 0; }
  Str255 pname; // mac needs pascal string
  strncpy((char*)pname + 1, name, (unsigned)len);
  pname[0] = len;
  FMFontFamily ff = FMGetFontFamilyFromName(pname);
  if (ff == kInvalidFontFamily)  failure(FH, "font does not exist");
  return ff;
}


static int  outlineMetrics_wrap( oop result_object,
                                 char* text, short byteCount,
                                 short numerH, short numerV, 
                                 short denomH, short denomV,
                                 void* FH ) { 
  failure_handle* fh = (failure_handle*)FH;
  Point numer, denom;  
  numer.h = numerH;  numer.v = numerV;  
  denom.h = denomH;  denom.v = denomV;
  
  short yMin, yMax;
  ResourceMark rm;
  Fixed*     awArray = NEW_RESOURCE_ARRAY(Fixed, byteCount);
  Fixed*    lsbArray = NEW_RESOURCE_ARRAY(Fixed, byteCount);
  Rect*  boundsArray = NEW_RESOURCE_ARRAY(Rect,  byteCount);
  
  OSErr r = OutlineMetrics(byteCount, text, numer, denom,
                           &yMax, &yMin, 
                           awArray, lsbArray, boundsArray);
  if (r != noErr)
    return r; // fail the primitive
    
  // now fill in the result
  bool inObj;
  oop* yMinp        = result_object->get_slot_data_address_if_present("yMin"       , inObj);  if (!inObj) {failure(FH, "no assignable yMin slot in receiver"); return 0; }
  oop* yMaxp        = result_object->get_slot_data_address_if_present("yMax"       , inObj);  if (!inObj) {failure(FH, "no assignable yMax slot in receiver"); return 0; }
  oop* awArrayp     = result_object->get_slot_data_address_if_present("awArray"    , inObj);  if (!inObj) {failure(FH, "no assignable awArray slot in receiver"); return 0; }
  oop* lsbArrayp    = result_object->get_slot_data_address_if_present("lsbArray"   , inObj);  if (!inObj) {failure(FH, "no assignable lsbArray slot in receiver"); return 0; }
  oop* boundsArrayp = result_object->get_slot_data_address_if_present("boundsArray", inObj);  if (!inObj) {failure(FH, "no assignable boundsArray slot in receiver"); return 0; }

  
  // convert Fixed to floats, Rects to 4-tuples
  oop     awArray_obj = Memory->objVectorObj->ov_clone_prim( byteCount,     Memory->nilObj, FH); if (fh->failed) return 0;
  oop    lsbArray_obj = Memory->objVectorObj->ov_clone_prim( byteCount,     Memory->nilObj, FH); if (fh->failed) return 0;
  oop boundsArray_obj = Memory->objVectorObj->ov_clone_prim( byteCount * 4, Memory->nilObj, FH); if (fh->failed) return 0;
  
  for (int i = 0;  i < byteCount;  ++i) {
     awArray_obj->obj_at_put( i, as_floatOop(Fix2X( awArray[i]))); 
    lsbArray_obj->obj_at_put( i, as_floatOop(Fix2X(lsbArray[i])));
    
    boundsArray_obj->obj_at_put(4*i + 0, as_smiOop( boundsArray[i].left   ));
    boundsArray_obj->obj_at_put(4*i + 1, as_smiOop( boundsArray[i].top    ));
    boundsArray_obj->obj_at_put(4*i + 2, as_smiOop( boundsArray[i].right  ));
    boundsArray_obj->obj_at_put(4*i + 3, as_smiOop( boundsArray[i].bottom ));
  }
  
  Memory->store(         yMinp, as_smiOop(yMin));
  Memory->store(         yMaxp, as_smiOop(yMax));
  Memory->store(      awArrayp,     awArray_obj);
  Memory->store(     lsbArrayp,    lsbArray_obj);
  Memory->store(  boundsArrayp, boundsArray_obj);

  return r;
}


static oop titleHandle_wrap(WindowPtr wr) { 
  Str255 title;
  GetWTitle(wr, title);
  return new_string((char*) &title[1], title[0]); 
}

static CGrafPtr getGWorld_port_wrap  () { CGrafPtr   cg;  GDevice** gdh;  GetGWorld(&cg, &gdh);  return cg; }
static GDPtr*   getGWorld_device_wrap() { CGrafPtr   cg;  GDPtr*    gdh;  GetGWorld(&cg, &gdh);  return gdh; }


static short stringWidth_wrap(char* str, int len, void* FH) { 
  if (len > 255) { failure(FH, "String too long: exceeds 255 bytes"); return 0; }
  Str255 pstr;
  pstr[0] = len;
  strncpy((char*)&pstr[1], str, len);
  return StringWidth(pstr);
}


static int  copyDeepMask_wrap( BitMap*     srcBits,
                               BitMap*     maskBits,
                               CGrafPtr    dst, GDPtr* dstDev,
                               Rect*       srcRect,   
                               Rect*       maskRect,
                               Rect*       dstRect,
                               short       mode, 
                               RgnHandle   maskRgn,
                               void* FH ) {
 if ((maskBits == NULL) != (maskRect == NULL)) {
    failure(FH, "(maskBits == NULL) != (maskRect == NULL)");
    return 0;
  }
  
  const BitMap* dstBits = GetPortBitMapForCopyBits(dst);
  
  CGrafPtr oldgp; GDevice** oldgd;  GetGWorld(&oldgp, &oldgd);
  
  SetGWorld(dst, dstDev);
    
  ForeColor(blackColor);
  BackColor(whiteColor);
  
  if (maskBits == NULL)
    CopyBits(srcBits, dstBits, srcRect, dstRect, mode, maskRgn);
  else if (mode == srcCopy  &&  maskRgn == NULL)
    CopyMask(srcBits, maskBits, dstBits, srcRect, maskRect, dstRect);
  else
    CopyDeepMask(srcBits, maskBits, dstBits, srcRect, maskRect, dstRect, mode, maskRgn);

  short e = QDError();
  
  SetGWorld( oldgp, oldgd);
  
  return e;
}


static void frameArc_wrap( short L, short T, short R, short B, short startAngle, short arcAngle ) {
  Rect r;
  r.left  = L;  r.top    = T;
  r.right = R;  r.bottom = B;
  FrameArc(&r, startAngle, arcAngle);
}
                     
static void paintArc_wrap( short L, short T, short R, short B, short startAngle, short arcAngle ) {
  Rect r;
  r.left  = L;  r.top    = T;
  r.right = R;  r.bottom = B;
  PaintArc(&r, startAngle, arcAngle);
}


static void lineTo_wrap( short X, short Y ) {
  Point p;  p.h = X;  p.v = Y;
  LineTo(p.h, p.v);
}


static void frameRect_wrap( short L, short T, short R, short B) {
  Rect r;
  r.left  = L;  r.top    = T;
  r.right = R;  r.bottom = B;
  FrameRect(&r);
}


static void paintRect_wrap( short L, short T, short R, short B) {
  Rect r;
  r.left  = L;  r.top    = T;
  r.right = R;  r.bottom = B;
  PaintRect(&r);
}


static void drawText_wrap( char* txt, int len ) {
  extern bool macToolbox_semaphore; 
  if (!macToolbox_semaphore) 
    fatal("macToolbox_semaphore should be set");
  ResourceMark rm;
  char* t = NEW_RESOURCE_ARRAY( char, len );
  // Mac draws ugly boxes for \n
  for (int i = 0;  i < len;  ++i) {
    char c = txt[i];
    t[i] =  c == '\n'  ?  '\r' : c;
  }
  DrawText(t, 0, len);
}


static void clipRect_wrap( short L, short T, short R, short B ) {
  static Rect r;
  r.left = L;  r.top = T;  r.right = R;  r.bottom = B;
  ClipRect(&r);
}


// encapsulate long primitive in a class
class DrawImage {
 public:

  static void do_it( GrafPtr gp,
                    short width, short height, short depth,
                    u_char* pixels, int pix_len,
                    objVectorOop reds, objVectorOop greens, objVectorOop blues,
                    void* FH) {
                        
   if (!check_arguments(gp, width, height, depth, pix_len, FH))
     return;
   
   
   static RGBColor colors[256];
   uint32 color_len = package_colors( colors, reds, greens, blues, FH);
   assert(sizeof(colors)/sizeof(colors[0]) >= color_len, "wrote past end of array; better reboot");
   if (color_len == 0)  return;
   
   // NOTE: gp must already be current PORT
   set_pixels(width, height, pixels, color_len, colors, reds, greens, blues, FH);
  }

 private:

  static bool check_arguments(GrafPtr gp,
                        short width, short height, short depth,
                        int pix_len,
                        void* FH) {
    static char buf[500];
    if (depth != 8) {
     sprintf(buf, "depth is %d, but must be 8 for this implementation", depth);
     failure(FH, buf);
     return false;
    }
    Rect port_rect;
    Rect* r = GetPortBounds(gp, &port_rect);
    assert(r == &port_rect, "huh?");
    if ( width   >  port_rect.right   -  port_rect.left
    ||   height  >  port_rect.bottom  -  port_rect.top ) {
     sprintf(buf, "too big: extent is %d @ %d, but portRect is %d @ %d  #  %d @ %d",
             width, height, port_rect.left, port_rect.top, port_rect.right, port_rect.bottom);
     failure(FH, buf);
     return false;
    }
    if ( width * height  >  pix_len ) {
     sprintf(buf, "pixels array is too short: pixels size = %d, width @ height = %d @ %d",
             pix_len, width, height);
     failure(FH, buf);
     return false;
    }
    return true;
  }


  static uint32 package_colors(RGBColor* colors,
                               objVectorOop reds, 
                               objVectorOop greens, 
                               objVectorOop blues,
                               void* FH) {
    uint32 color_len = min(reds->length(), min(greens->length(), blues->length())); 
    RGBColor* cp = colors;
    for (int i = 0;  i < color_len;  ++i, ++cp) {
      oop roop = reds->obj_at(i);  oop goop = greens->obj_at(i);  oop boop = blues->obj_at(i);
      if (!(roop->is_smi()  &&  goop->is_smi()  &&  boop->is_smi())) {
        failure(FH, "reds, greens, blues must all contain smiOops");
        return 0;
      }
      cp->red = smiOop(roop)->value();  cp->green = smiOop(goop)->value();  cp->blue = smiOop(boop)->value();
    }
    return color_len;
  }
  
  
  static void set_pixels(int width, int height, 
                         u_char* pixels, 
                         uint32 color_len,
                         RGBColor* colors,
                         objVectorOop reds, 
                         objVectorOop greens, 
                         objVectorOop blues,
                         void* FH ) {
   // NOTE: gp must already be current PORT
   int pixelsIndex = 0;
   for (int y = 0;  y < height;  ++y) 
     for (int x = 0;  x < width;  ++ x) {
       u_char pxl = pixels[pixelsIndex++];
       if (pxl >= color_len) {
         static char buf[300];
         sprintf(buf, "pixel value %d >= min(red_length, green_length, blue_length) %d,%d,%d",
                 pxl, reds->length(), greens->length(), blues->length());
         failure(FH, buf);
         return;
       }
       SetCPixel(x, y, &colors[pxl]);
     }
  }
};


CTabPtr* newColorTable(int size) {
  // size below allocs for one extra colorspec, but is more robust
  // against future declaration changes.
  ColorTable* ct = (ColorTable*)selfs_malloc(sizeof(ColorTable) + size * sizeof(ColorSpec));
  ct->ctSize = size;
  ct->ctSeed = (long)ct;
  ct->ctFlags = 0;
  for (int i = 0;  i < size;  ++i) {
    ct->ctTable[i].value = i;
    ct->ctTable[i].rgb.red = ct->ctTable[i].rgb.green = ct->ctTable[i].rgb.blue = 0;
  }
  CTabPtr* cp = (CTabPtr*)selfs_malloc(sizeof(CTabPtr));
  *cp = ct;
  return cp;
}


void setFromColorSpecVector_wrap( CTabPtr* cp, objVectorOop contents, void* FH ) {
  static char buf[300];
  ColorTable* ct = *cp;
  if (ct->ctSize != contents->length()) {
    sprintf(buf, "length of color table (%d) != length of contents vector (%d)",
            ct->ctSize, contents->length());
    failure(FH, buf);
    return;
  }
  char* errorWhat = NULL;
  int i;
  for ( i = 0;  i < ct->ctSize;  ++i) {
    oop x = contents->obj_at(i);
    if (!x->is_proxy()) {  errorWhat = "non-proxy";   break;  }
    proxyOop p = (proxyOop)x;
    if (!p->is_live())  {  errorWhat = "dead proxy";  break;  }
    if (p->get_type_seal() != ColorSpec_seal) {
       errorWhat = "proxy which is not a ColorSpec";  
       break;
    }
    ColorSpec* cs = (ColorSpec*)p->get_pointer();
    if (cs == NULL)     {  errorWhat = "null proxy";  break; }
    ct->ctTable[i] = *cs;
  }
  CTabChanged(cp);
  if (errorWhat != NULL) {
    static char buf[300];
    sprintf(buf, "contents vector contains a %s at: %d", errorWhat, i);
    failure(FH, buf);
  }
}

// -------------------------------------------------- (ee


bool macOSEvent_isResume(EventRecord *evt)
{
  return (evt->message >> 24 == suspendResumeMessage) && (evt->message && 0x1 == 0x1);
}

bool macOSEvent_isSuspend(EventRecord *evt)
{
  return (evt->message >> 24 == suspendResumeMessage) && (evt->message && 0x1 == 0x0);
}

bool macOSEvent_isMouseMoved(EventRecord *evt)
{
  return evt->message >> 24 == mouseMovedMessage;
}



# pragma warn_unusedarg off // glue, sigh

# define WHAT_GLUE FUNCTIONS
# undef  PRIMITIVE_GLUE_FLAG_CODE
# define PRIMITIVE_GLUE_FLAG_CODE BlockGlueFlag gf(macToolbox_semaphore);

  macToolbox1_glue
  macToolbox2_glue
  macToolbox3_glue
  macToolbox4_glue
  macToolbox5_glue
  macToolbox6_glue

# undef  WHAT_GLUE

# endif

