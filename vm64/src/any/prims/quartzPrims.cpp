/* Sun-$Revision: 30.2 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "quartzPrims.hh"

# if defined(QUARTZ_LIB)

// Platform-specific includes BEFORE Self headers to avoid macro conflicts
# if !defined(__aarch64__)
  // x86_64: Carbon includes
  #  undef ASSEMBLER
  #  undef Alloc

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
# endif


# include "_quartzPrims.cpp.incl"

# ifndef DYNAMIC
# endif


// ======================================================================
// Shared helper functions (both platforms)
// ======================================================================

static oop byteVectorFromCFString(CFStringRef cfs, const char* primName, void* FH) {
  int len = CFStringGetLength(cfs);
  byteVectorOop r = Memory->byteVectorObj->cloneSize(len);
  CFIndex usedLen = -1;
  int nBytes = CFStringGetBytes(cfs, CFRangeMake(0, len), kCFStringEncodingMacRoman, 0, false, (UInt8*)r->bytes(), len, &usedLen);
  CFRelease(cfs);
  if (usedLen > len)
    fatal3("%s: used %d, max was %d", primName, usedLen, len);
  if (usedLen < len)  {
    failure(FH, "did not use full buffer");
    return NULL;
  }
  if (nBytes != len)  {
    failure(FH, "did not copy right amount");
    return NULL;
  }
  return r;
}


static void* reportOSError(OSStatus e, const char* n, void* FH)  {
    static char buf[1000];
    sprintf(buf, "%s failed: error %d", n, (int)e);
    failure(FH, buf);
    return NULL;
  }


// ======================================================================
// CoreGraphics wrappers (shared, work on both platforms)
// ======================================================================

CGLayer* CGLayerCreateWithContext_wrap(CGContextRef context, float w, float h) {
  return CGLayerCreateWithContext( context, CGSizeMake(w, h), NULL);
}


void CGContextSelectFont_wrap(CGContext* c, const char* s, float siz) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  return CGContextSelectFont(c, s, siz, kCGEncodingMacRoman);
#pragma clang diagnostic pop
}


float CGLayerWidth_wrap(CGLayer* la) {
  return CGLayerGetSize(la).width;
}

float CGLayerHeight_wrap(CGLayer* la) {
  return CGLayerGetSize(la).height;
}


void CGContextDrawLayerInRect_wrap( CGContext *con, CGLayer* lay, float x, float y, float width, float height ) {
  CGContextDrawLayerInRect( con, CGRectMake(x, y, width, height), lay);
}


void CGContextDrawLayerAtPoint_wrap( CGContext *con, CGLayer* lay, float x, float y ) {
  CGContextDrawLayerAtPoint( con, CGPointMake(x, y), lay);
}

static bool convertFloatObjVector( objVectorOop v, const char* prinName, void* FH, CGFloat*& floats, uint32& count) {
  count = v->length();
  floats = NEW_RESOURCE_ARRAY(CGFloat, count);
  int badI = -1;
  for (uint32 i = 0;  i < count;  ++i) {
    oop o = v->obj_at(i);
    floats[i] = o->is_float() ? floatOop(o)->value()
              : o->is_smi()   ? smiOop(o)->value()
              : ((badI = i), (i = count), 0.0);
  }
  if (badI != -1) {
    static char buf[1000];
    sprintf(buf, "%s failed: bad oop at: %d", prinName, badI);
    failure(FH, buf);
    return false;
  }
  return true;
}


void CGContextSetLineDash_wrap(CGContext* con, float phase, objVectorOop lengthsOop, void *FH ) {
  ResourceMark rm;
  uint32 count;
  CGFloat* lengths;
  if (convertFloatObjVector( lengthsOop, "CGContextSetLineDash", FH, lengths, count))
    CGContextSetLineDash( con, (CGFloat)phase, lengths, (size_t)count);
}


# define SIMPLE_RECT_WRAP(name) \
  void XCONC(name,_wrap) ( CGContext* con,  float x, float y, float width, float height ) { \
    name( con, CGRectMake(x, y, width, height)); \
  }



SIMPLE_RECT_WRAP(CGContextAddRect);
SIMPLE_RECT_WRAP(CGContextAddEllipseInRect);
SIMPLE_RECT_WRAP(CGContextFillRect);
SIMPLE_RECT_WRAP(CGContextStrokeRect);

void CGContextStrokeRectWithWidth_wrap( CGContext *con, float x, float y, float width, float height, float stroke_width) {
  CGContextStrokeRectWithWidth( con, CGRectMake(x, y, width, height), stroke_width);
}


SIMPLE_RECT_WRAP(CGContextClearRect);
SIMPLE_RECT_WRAP(CGContextFillEllipseInRect);
SIMPLE_RECT_WRAP(CGContextStrokeEllipseInRect);
SIMPLE_RECT_WRAP(CGContextClipToRect);

void CGContextSetFillColor_wrap(CGContext *con, float c1, float c2, float c3, float alpha) {
  CGFloat color[4] = {c1, c2, c3, alpha};
  CGContextSetFillColor(con, color);
}

void CGContextSetStrokeColor_wrap(CGContext *con, float c1, float c2, float c3, float alpha) {
  CGFloat color[4] = {c1, c2, c3, alpha};
  CGContextSetStrokeColor(con, color);
}

void CGContextSetFillPattern_wrap(CGContext *con, CGPatternRef p, float c1, float c2, float c3, float alpha) {
  CGFloat color[4] = {c1, c2, c3, alpha};
  CGContextSetFillPattern(con, p, color);
}

void CGContextSetStrokePattern_wrap(CGContext *con, CGPatternRef p, float c1, float c2, float c3, float alpha) {
  CGFloat color[4] = {c1, c2, c3, alpha};
  CGContextSetStrokePattern(con, p, color);
}

void CGContextSetPatternPhase_wrap(CGContext *con, float w, float h) {
  CGContextSetPatternPhase(con, CGSizeMake(w, h));
}

void CGContextSetRGBFillColor_wrap(CGContext *con, float r, float g, float b, float a) {
  CGContextSetRGBFillColor(con, r, g, b, a);
}

void CGContextSetRGBStrokeColor_wrap(CGContext *con, float r, float g, float b, float a) {
  CGContextSetRGBStrokeColor(con, r, g, b, a);
}

void CGContextDrawImage_wrap(CGContext *con, CGImage *im, float x, float y, float w, float h) {
  CGContextDrawImage(con, CGRectMake(x, y, w, h), im);
}

void CGContextSetShadowWithColor_wrap(CGContext *con, float x, float y, float blur, CGColor* c) {
  CGContextSetShadowWithColor(con, CGSizeMake(x, y), blur, c);
}

void CGContextSetShadowWithColor_wrap2(CGContext *con, float x, float y, float blur,
                                        float r, float g, float b, float a) {
  CGFloat comps[] = {r, g, b, a};
  CGColorSpaceRef cs = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
  CGColorRef c = CGColorCreate( cs, comps );
  CGContextSetShadowWithColor(con, CGSizeMake(x, y), blur, c);
  CGColorRelease(c);
  CGColorSpaceRelease(cs);
}

void CGContextSetShadow_wrap(CGContext *con, float x, float y, float blur) {
  CGContextSetShadow(con, CGSizeMake(x, y), blur);
}

void CGContextSetLineCap_wrap(CGContext *con, int cap) {
  CGContextSetLineCap(con, CGLineCap(cap));
}
void CGContextSetLineJoin_wrap(CGContext *con, int j) {
  CGContextSetLineJoin(con, CGLineJoin(j));
}
void CGContextSetBlendMode_wrap(CGContext *con, int j) {
  CGContextSetBlendMode(con, CGBlendMode(j));
}
void CGContextSetTextDrawingMode_wrap(CGContext *con, int j) {
  CGContextSetTextDrawingMode(con, CGTextDrawingMode(j));
}
void CGContextDrawPath_wrap(CGContext *con, int j) {
  CGContextDrawPath(con, CGPathDrawingMode(j));
}
void CGContextSetInterpolationQuality_wrap(CGContext *con, int j) {
  CGContextSetInterpolationQuality(con, CGInterpolationQuality(j));
}

void CGContextSetTextMatrix_wrap(CGContext* con, float a, float b, float c, float d, float tx, float ty) {
    CGContextSetTextMatrix(con, CGAffineTransformMake(a, b, c, d, tx, ty));
}
void CGContextConcatCTM_wrap(CGContext* con, float a, float b, float c, float d, float tx, float ty) {
    CGContextConcatCTM(con, CGAffineTransformMake(a, b, c, d, tx, ty));
}
objVectorOop CGContextGetCTM_wrap(CGContext* con) {
  CGAffineTransform ctm = CGContextGetCTM(con);
  objVectorOop r = Memory->objVectorObj->cloneSize(6);
  r->obj_at_put(0, as_floatOop(ctm.a ), false);
  r->obj_at_put(1, as_floatOop(ctm.b ), false);
  r->obj_at_put(2, as_floatOop(ctm.c ), false);
  r->obj_at_put(3, as_floatOop(ctm.d ), false);
  r->obj_at_put(4, as_floatOop(ctm.tx), false);
  r->obj_at_put(5, as_floatOop(ctm.ty), false);
  return r;
}
objVectorOop CGContextGetTextMatrix_wrap(CGContext* con) {
  CGAffineTransform ctm = CGContextGetTextMatrix(con);
  objVectorOop r = Memory->objVectorObj->cloneSize(6);
  r->obj_at_put(0, as_floatOop(ctm.a ), false);
  r->obj_at_put(1, as_floatOop(ctm.b ), false);
  r->obj_at_put(2, as_floatOop(ctm.c ), false);
  r->obj_at_put(3, as_floatOop(ctm.d ), false);
  r->obj_at_put(4, as_floatOop(ctm.tx), false);
  r->obj_at_put(5, as_floatOop(ctm.ty), false);
  return r;
}


// Window port bounds (shared signature, platform-specific implementation)

#if defined(__aarch64__)
  // ARM64: implemented via QuartzWindow methods (already defined in quartzWindow.mm)
  // GetWindowPortLeft, GetWindowPortRight, etc. are in quartzWindow.mm
#else
  int32 GetWindowPortLeft  (WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->left;   }
  int32 GetWindowPortRight (WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->right;  }
  int32 GetWindowPortTop   (WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->top;    }
  int32 GetWindowPortBottom(WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->bottom; }
#endif


float GetClipBoundingBoxX_wrap(    CGContext *c) { return CGContextGetClipBoundingBox(c).origin.x; }
float GetClipBoundingBoxY_wrap(    CGContext *c) { return CGContextGetClipBoundingBox(c).origin.y; }
float GetClipBoundingBoxWidth_wrap(CGContext *c) { return CGContextGetClipBoundingBox(c).size.width; }
float GetClipBoundingBoxHeight_wrap(CGContext *c) { return CGContextGetClipBoundingBox(c).size.height; }


CGImageRef CGImageCreate_wrap( float w, float h,
                               uint32 bitsPerComponent, uint32 bitsPerPixel,
                               uint32 bytesPerRow,
                               CGColorSpaceRef colorSpace,
                               uint32 bitmapInfo,
                               CGDataProviderRef provider,
                               objVectorOop decodeArrayOop,
                               bool shouldInterpolate,
                               uint32 colorRenderingIntent,
                               void* FH) {
  // Byte order flags (kCGBitmapByteOrder16/32) are invalid for <= 8 bpp
  if (bitsPerPixel <= 8)
    bitmapInfo &= ~kCGBitmapByteOrderMask;
  CGFloat* decodeArray; uint32 decodeLen;
  return
    convertFloatObjVector( decodeArrayOop, "CGImageCreate", FH, decodeArray, decodeLen)
      ?  CGImageCreate((size_t)w, (size_t)h, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpace,
                       bitmapInfo, provider, decodeArray, shouldInterpolate,
                       CGColorRenderingIntent(colorRenderingIntent))
      : NULL;
}


CGImageRef CGImageCreate_wrap( float w, float h,
                               uint32 bitsPerComponent, uint32 bitsPerPixel,
                               uint32 bytesPerRow,
                               CGColorSpaceRef colorSpace,
                               uint32 bitmapInfo,
                               CGDataProviderRef provider,
                               bool shouldInterpolate,
                               uint32 colorRenderingIntent) {
  // Byte order flags (kCGBitmapByteOrder16/32) are invalid for <= 8 bpp
  if (bitsPerPixel <= 8)
    bitmapInfo &= ~kCGBitmapByteOrderMask;
  return CGImageCreate((size_t)w, (size_t)h, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpace,
                       bitmapInfo, provider, NULL, shouldInterpolate,
                       CGColorRenderingIntent(colorRenderingIntent));
}


CGImageRef CGImageMaskCreate_wrap( float w, float h,
                               uint32 bitsPerComponent, uint32 bitsPerPixel,
                               uint32 bytesPerRow,
                               CGDataProviderRef provider,
                               objVectorOop decodeArrayOop,
                               bool shouldInterpolate,
                               void* FH) {
  CGFloat* decodeArray; uint32 decodeLen;
  return
    convertFloatObjVector( decodeArrayOop, "CGImageCreateMask", FH, decodeArray, decodeLen)
      ?  CGImageMaskCreate((size_t)w, (size_t)h, bitsPerComponent, bitsPerPixel, bytesPerRow,
                           provider, decodeArray, shouldInterpolate)
      : NULL;
}


CGImageRef CGImageMaskCreate_wrap( float w, float h,
                               uint32 bitsPerComponent, uint32 bitsPerPixel,
                               uint32 bytesPerRow,
                               CGDataProviderRef provider,
                               bool shouldInterpolate) {
  return CGImageMaskCreate((size_t)w, (size_t)h, bitsPerComponent, bitsPerPixel, bytesPerRow,
                           provider, NULL, shouldInterpolate);
}


CGImageRef CGImageCreateWithMaskingColors_wrap(CGImageRef im,
             float min1, float max1, float min2, float max2,
             float min3, float max3, float min4, float max4) {
  CGFloat comps[8] = {min1, max2, min2, max2, min3, max3, min4, max4};
  return CGImageCreateWithMaskingColors(im, comps);
}

CGImageRef CGImageCreateWithJPEGDataProvider_wrap(
   CGDataProviderRef source,
   objVectorOop decodeArrayOop,
   bool shouldInterpolate,
   uint32 colorRenderingIntent,
   void* FH) {
  CGFloat* decodeArray; uint32 decodeLen;
  return
    convertFloatObjVector( decodeArrayOop, "CGImageCreateWithJPEGDataProvider", FH,
                           decodeArray, decodeLen)
      ?  CGImageCreateWithJPEGDataProvider( source, decodeArray, shouldInterpolate, CGColorRenderingIntent(colorRenderingIntent))
      : NULL;
}


CGImageRef CGImageCreateWithJPEGDataProvider_wrap(
   CGDataProviderRef source,
   bool shouldInterpolate,
   uint32 colorRenderingIntent) {
  return CGImageCreateWithJPEGDataProvider( source, NULL, shouldInterpolate, CGColorRenderingIntent(colorRenderingIntent));
}

CGImageRef CGImageCreateWithPNGDataProvider_wrap(
   CGDataProviderRef source,
   objVectorOop decodeArrayOop,
   bool shouldInterpolate,
   uint32 colorRenderingIntent,
   void* FH) {
  CGFloat* decodeArray; uint32 decodeLen;
  return
    convertFloatObjVector( decodeArrayOop, "CGImageCreateWithPNGDataProvider", FH,
                           decodeArray, decodeLen)
      ?  CGImageCreateWithPNGDataProvider( source, decodeArray, shouldInterpolate, CGColorRenderingIntent(colorRenderingIntent))
      : NULL;
}

CGImageRef CGImageCreateWithPNGDataProvider_wrap(
   CGDataProviderRef source,
   bool shouldInterpolate,
   uint32 colorRenderingIntent) {
  return CGImageCreateWithPNGDataProvider( source, NULL, shouldInterpolate, CGColorRenderingIntent(colorRenderingIntent));
}


CGImageRef CGImageCreateWithImageInRect_wrap(CGImageRef im, float x, float y, float w, float h) {
  return CGImageCreateWithImageInRect( im, CGRectMake(x, y, w, h));
}


CGColorSpaceRef CGColorSpaceCreateIndexed_wrap(CGColorSpaceRef base, u_char* table, uint32 len ) {
  return CGColorSpaceCreateIndexed(base, len, table);
}

CGColorSpaceRef          CGColorSpaceCreateGenericGray_wrap() { return CGColorSpaceCreateWithName(kCGColorSpaceGenericGray); }

CGColorSpaceRef          CGColorSpaceCreateGenericRGB_wrap() { return CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB); }

CGColorSpaceRef          CGColorSpaceCreateGenericCMYK_wrap() { return CGColorSpaceCreateWithName(kCGColorSpaceGenericCMYK); }


static void releaseData(void* info, const void* data, size_t size) {
  FreeHeap((void*)data);
}

CGDataProviderRef CGDataProviderCreateFromBV(u_char* bytes, uint32 len) {
    u_char* stable_bytes = NEW_C_HEAP_ARRAY( u_char, len );
    copy_bytes((const char*)bytes, (char*)stable_bytes, len);
    return CGDataProviderCreateWithData(NULL, stable_bytes, len, releaseData);
}

CGDataProviderRef CGDataProviderCreateFromURL_wrap(u_char* bytes, uint32 len) {
  return CGDataProviderCreateWithURL(CFURLCreateWithBytes( kCFAllocatorDefault, bytes, len, kCFStringEncodingMacRoman, NULL));
}

CGImageSourceRef CGImageSourceCreateWithURL_wrap(u_char* bytes, uint32 len) {
  return CGImageSourceCreateWithURL(CFURLCreateWithBytes( kCFAllocatorDefault, bytes, len, kCFStringEncodingMacRoman, NULL), NULL);
}

CGImageRef CGImageSourceCreateImageAtIndex_wrap(CGImageSourceRef is, uint32 index) {
  return CGImageSourceCreateImageAtIndex(is, index, NULL);
}

uint32 CGGetDisplayCount_wrap(float x, float y, float w, float h, void* FH) {
  CGDisplayCount count;
  CGDisplayErr e =
    w == 0.0  &&  h == 0.0
      ? CGGetDisplaysWithPoint( CGPointMake(x, y), 0, NULL, &count)
      : CGGetDisplaysWithRect(  CGRectMake(x, y, w, h), 0, NULL, &count);
  if (e != CGDisplayNoErr) { reportOSError(e, "CGGetDisplayCount", FH); return 0; }
  return count;
}


CGDirectDisplayID CGGetDisplayAt_wrap(uint32 n, float x, float y, float w, float h, void* FH) {
  uint32 count;
  ResourceMark rm;
  CGDirectDisplayID *displays = NEW_RESOURCE_ARRAY(CGDirectDisplayID, n + 1);
  CGDisplayErr e =
    w == 0.0  &&  h == 0.0
      ? CGGetDisplaysWithPoint( CGPointMake(x, y),      n + 1, displays, &count)
      : CGGetDisplaysWithRect(  CGRectMake(x, y, w, h), n + 1, displays, &count);
  if (e != CGDisplayNoErr) { reportOSError(e, "CGGetDisplayAt", FH); return 0; }
  if (count < n + 1)       { failure(FH, "not enough displays"); return 0; }
  return displays[n];
}


uint32 CGGetActiveDisplayCount_wrap(void* FH) {
  uint32 count;
  CGDisplayErr e = CGGetActiveDisplayList( 0, NULL, &count);
  if (e != CGDisplayNoErr) { reportOSError(e, "CGGetActiveDisplayCount", FH); return 0; }
  return count;
}

CGDirectDisplayID CGGetActiveDisplayAt_wrap(uint32 n, void* FH) {
  uint32 count;
  ResourceMark rm;
  CGDirectDisplayID *displays = NEW_RESOURCE_ARRAY(CGDirectDisplayID, n + 1);
  CGDisplayErr e =  CGGetActiveDisplayList( n + 1, displays, &count);
  if (e != CGDisplayNoErr) { reportOSError(e, "CGGetActiveDisplayAt", FH); return 0; }
  if (count < n + 1)       { failure(FH, "not enough displays"); return 0; }
  return displays[n];
}


uint32 CGGetOnlineDisplayCount_wrap(void* FH) {
  uint32 count;
  CGDisplayErr e = CGGetOnlineDisplayList( 0, NULL, &count);
  if (e != CGDisplayNoErr) { reportOSError(e, "CGGetOnlineDisplayCount", FH); return 0; }
  return count;
}

CGDirectDisplayID CGGetOnlineDisplayAt_wrap(uint32 n, void* FH) {
  uint32 count;
  ResourceMark rm;
  CGDirectDisplayID *displays = NEW_RESOURCE_ARRAY(CGDirectDisplayID, n + 1);
  CGDisplayErr e =  CGGetOnlineDisplayList( n + 1, displays, &count);
  if (e != CGDisplayNoErr) { reportOSError(e, "CGGetOnlineDisplayAt", FH); return 0; }
  if (count < n + 1)       { failure(FH, "not enough displays"); return 0; }
  return displays[n];
}

float CGDirectDisplayX_wrap(CGDirectDisplayID d) { return CGDisplayBounds(d).origin.x; }
float CGDirectDisplayY_wrap(CGDirectDisplayID d) { return CGDisplayBounds(d).origin.y; }
float CGDirectDisplayWidth_wrap(CGDirectDisplayID d) { return CGDisplayBounds(d).size.width; }
float CGDirectDisplayHeight_wrap(CGDirectDisplayID d) { return CGDisplayBounds(d).size.height; }

CGDisplayErr CGDisplayMoveCursorToPoint_wrap(CGDirectDisplayID d, float x, float y) {
  return CGDisplayMoveCursorToPoint(d, CGPointMake(x, y));
}

int CGGetLastMouseDelta_x() {  int x, y;  CGGetLastMouseDelta(&x, &y); return x; }
int CGGetLastMouseDelta_y() {  int x, y;  CGGetLastMouseDelta(&x, &y); return y; }


oop CGContextGetPathCurrentPoint_wrap(CGContextRef c) {
  CGPoint p = CGContextGetPathCurrentPoint(c);
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.x), false);
  r->obj_at_put(1, as_floatOop(p.y), false);
  return r;
}


oop CGContextGetTextPosition_wrap(CGContextRef c) {
  CGPoint p = CGContextGetTextPosition(c);
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.x), false);
  r->obj_at_put(1, as_floatOop(p.y), false);
  return r;
}


oop CGContextGetPathBoundingBox_wrap(CGContextRef c) {
  CGRect x = CGContextGetPathBoundingBox(c);
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(x.origin.x), false);
  r->obj_at_put(1, as_floatOop(x.origin.y), false);
  r->obj_at_put(2, as_floatOop(x.size.width), false);
  r->obj_at_put(3, as_floatOop(x.size.height), false);
  return r;
}


bool CGContextPathContainsPoint_wrap(CGContextRef c, float x, float y, uint32 mode) {
  return CGContextPathContainsPoint(c, CGPointMake(x, y), (CGPathDrawingMode)mode);
}


void CGContextClipToMask_wrap(CGContextRef c, float x, float y, float w, float h, CGImageRef mask) {
  CGContextClipToMask(c, CGRectMake(x, y, w, h), mask);
}


void CGContextBeginTransparencyLayer_wrap(CGContextRef c) {
  CGContextBeginTransparencyLayer(c, NULL);
}


oop CGContextGetUserSpaceToDeviceSpaceTransform_wrap(CGContextRef c) {
  CGAffineTransform ctm = CGContextGetUserSpaceToDeviceSpaceTransform(c);
  objVectorOop r = Memory->objVectorObj->cloneSize(6);
  r->obj_at_put(0, as_floatOop(ctm.a ), false);
  r->obj_at_put(1, as_floatOop(ctm.b ), false);
  r->obj_at_put(2, as_floatOop(ctm.c ), false);
  r->obj_at_put(3, as_floatOop(ctm.d ), false);
  r->obj_at_put(4, as_floatOop(ctm.tx), false);
  r->obj_at_put(5, as_floatOop(ctm.ty), false);
  return r;
}

oop CGContextConvertPointToDeviceSpace_wrap(CGContextRef c, float x, float y) {
  CGPoint p = CGContextConvertPointToDeviceSpace(c, CGPointMake(x, y));
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.x), false);
  r->obj_at_put(1, as_floatOop(p.y), false);
  return r;
}

oop CGContextConvertPointToUserSpace_wrap(CGContextRef c, float x, float y) {
  CGPoint p = CGContextConvertPointToUserSpace(c, CGPointMake(x, y));
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.x), false);
  r->obj_at_put(1, as_floatOop(p.y), false);
  return r;
}

oop CGContextConvertSizeToDeviceSpace_wrap(CGContextRef c, float x, float y) {
  CGSize p = CGContextConvertSizeToDeviceSpace(c, CGSizeMake(x, y));
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.width),  false);
  r->obj_at_put(1, as_floatOop(p.height), false);
  return r;
}

oop CGContextConvertSizeToUserSpace_wrap(CGContextRef c, float x, float y) {
  CGSize p = CGContextConvertSizeToUserSpace(c, CGSizeMake(x, y));
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.width),  false);
  r->obj_at_put(1, as_floatOop(p.height), false);
  return r;
}

oop CGContextConvertRectToDeviceSpace_wrap(CGContextRef c, float xin, float y, float w, float h) {
  CGRect x = CGContextConvertRectToDeviceSpace(c, CGRectMake(xin, y, w, h));
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(x.origin.x), false);
  r->obj_at_put(1, as_floatOop(x.origin.y), false);
  r->obj_at_put(2, as_floatOop(x.size.width), false);
  r->obj_at_put(3, as_floatOop(x.size.height), false);
  return r;
}

oop CGContextConvertRectToUserSpace_wrap(CGContextRef c, float xin, float y, float w, float h) {
  CGRect x = CGContextConvertRectToUserSpace(c, CGRectMake(xin, y, w, h));
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(x.origin.x), false);
  r->obj_at_put(1, as_floatOop(x.origin.y), false);
  r->obj_at_put(2, as_floatOop(x.size.width), false);
  r->obj_at_put(3, as_floatOop(x.size.height), false);
  return r;
}

void CGContextSetRenderingIntent_wrap(CGContextRef c, uint32 i) {
     CGContextSetRenderingIntent(c, CGColorRenderingIntent(i));
}


// ======================================================================
// Platform-specific implementations
// ======================================================================

#if defined(__aarch64__)

// ======================================================================
// ARM64: Font mapping table
// ======================================================================

static const int FONT_MAP_MAX = 10000;
static CTFontDescriptorRef fontMap[FONT_MAP_MAX];
static uint32 fontMapCount = 0;

static uint32 registerFontDesc(CTFontDescriptorRef desc) {
    if (fontMapCount >= FONT_MAP_MAX) return 0;
    CFRetain(desc);
    fontMap[fontMapCount] = desc;
    return ++fontMapCount; // 1-based IDs
}

static CTFontDescriptorRef lookupFontDesc(uint32 id) {
    if (id == 0 || id > fontMapCount) return NULL;
    return fontMap[id - 1];
}

// Family mapping: uint32 -> CFStringRef family name
static CFStringRef familyMap[FONT_MAP_MAX];
static uint32 familyMapCount = 0;

static uint32 registerFamily(CFStringRef name) {
    if (familyMapCount >= FONT_MAP_MAX) return 0;
    CFRetain(name);
    familyMap[familyMapCount] = name;
    return ++familyMapCount; // 1-based IDs
}

static CFStringRef lookupFamily(uint32 id) {
    if (id == 0 || id > familyMapCount) return NULL;
    return familyMap[id - 1];
}


// ======================================================================
// ARM64: QD/Carbon window functions
// QDBeginCGContext_wrap and QDEndCGContext_wrap are in quartzWindow.mm
// GetWindowPortLeft/Right/Top/Bottom are in quartzWindow.mm
// SetPortWindowPort, GetWindowPort etc. are in quartzWindow.mm
// ======================================================================


// ======================================================================
// ARM64: ATS Font functions (CoreText replacements)
// ======================================================================

ATSFontFamilyRef ATSFontFamilyFindFromName_wrap( const char* name ) {
  CFStringRef cfs = CFStringCreateWithCString( NULL, name, kCFStringEncodingMacRoman);
  if (!cfs) return 0;

  // Check if this family name exists
  CTFontRef testFont = CTFontCreateWithName(cfs, 12.0, NULL);
  if (!testFont) { CFRelease(cfs); return 0; }

  CFStringRef familyName = CTFontCopyFamilyName(testFont);
  CFRelease(testFont);
  if (!familyName) { CFRelease(cfs); return 0; }

  // Check if already registered
  for (uint32 i = 0; i < familyMapCount; i++) {
      if (CFStringCompare(familyMap[i], familyName, 0) == kCFCompareEqualTo) {
          CFRelease(familyName);
          CFRelease(cfs);
          return i + 1;
      }
  }

  uint32 id = registerFamily(familyName);
  CFRelease(familyName);
  CFRelease(cfs);
  return id;
}


oop ATSFontFamilyGetName_wrap( ATSFontFamilyRef id, void* FH ) {
  CFStringRef name = lookupFamily(id);
  if (!name) return (oop)reportOSError(-1, "ATSFontFamilyGetName", FH);
  CFRetain(name); // byteVectorFromCFString releases it
  return byteVectorFromCFString(name, "ATSFontFamilyGetName", FH);
}


ATSFontRef ATSFontFindFromName_wrap( const char* name ) {
  CFStringRef cfs = CFStringCreateWithCString( NULL, name, kCFStringEncodingMacRoman);
  if (!cfs) return 0;

  CTFontRef font = CTFontCreateWithName(cfs, 12.0, NULL);
  CFRelease(cfs);
  if (!font) return 0;

  CTFontDescriptorRef desc = CTFontCopyFontDescriptor(font);
  CFRelease(font);
  if (!desc) return 0;

  uint32 id = registerFontDesc(desc);
  CFRelease(desc);
  return id;
}


ATSFontRef ATSFontFindFromPostScriptName_wrap( const char* name ) {
  CFStringRef cfs = CFStringCreateWithCString( NULL, name, kCFStringEncodingMacRoman);
  if (!cfs) return 0;

  // Create a font descriptor with the PostScript name
  CTFontDescriptorRef desc = CTFontDescriptorCreateWithNameAndSize(cfs, 0);
  CFRelease(cfs);
  if (!desc) return 0;

  // Verify it resolves to a real font
  CTFontRef font = CTFontCreateWithFontDescriptor(desc, 12.0, NULL);
  if (!font) { CFRelease(desc); return 0; }
  CFRelease(font);

  uint32 id = registerFontDesc(desc);
  CFRelease(desc);
  return id;
}


oop ATSFontGetName_wrap( ATSFontRef id, void* FH ) {
  CTFontDescriptorRef desc = lookupFontDesc(id);
  if (!desc) return (oop)reportOSError(-1, "ATSFontGetName", FH);

  CTFontRef font = CTFontCreateWithFontDescriptor(desc, 12.0, NULL);
  if (!font) return (oop)reportOSError(-1, "ATSFontGetName", FH);

  CFStringRef name = CTFontCopyDisplayName(font);
  CFRelease(font);
  if (!name) return (oop)reportOSError(-1, "ATSFontGetName", FH);

  return byteVectorFromCFString(name, "ATSFontGetName", FH);
}

oop ATSFontGetPostScriptName_wrap( ATSFontRef id, void* FH ) {
  CTFontDescriptorRef desc = lookupFontDesc(id);
  if (!desc) return (oop)reportOSError(-1, "ATSFontGetPostScriptName", FH);

  CTFontRef font = CTFontCreateWithFontDescriptor(desc, 12.0, NULL);
  if (!font) return (oop)reportOSError(-1, "ATSFontGetPostScriptName", FH);

  CFStringRef name = CTFontCopyPostScriptName(font);
  CFRelease(font);
  if (!name) return (oop)reportOSError(-1, "ATSFontGetPostScriptName", FH);

  return byteVectorFromCFString(name, "ATSFontGetPostScriptName", FH);
}


// Called directly by glue (not _wrap)
OSStatus ATSFontGetHorizontalMetrics(ATSFontRef fontID, ATSOptionFlags opts, ATSFontMetrics* metrics) {
  CTFontDescriptorRef desc = lookupFontDesc(fontID);
  if (!desc) return -1;

  CTFontRef font = CTFontCreateWithFontDescriptor(desc, 0, NULL);
  if (!font) return -1;

  CGFloat size = CTFontGetSize(font);
  if (size == 0) size = 1;

  metrics->version = 1;
  metrics->ascent = (float)(CTFontGetAscent(font) / size);
  metrics->descent = (float)(-CTFontGetDescent(font) / size);
  metrics->leading = (float)(CTFontGetLeading(font) / size);

  UniChar space = ' ';
  CGGlyph glyph;
  CGSize advance;
  CTFontGetGlyphsForCharacters(font, &space, &glyph, 1);
  CTFontGetAdvancesForGlyphs(font, kCTFontOrientationHorizontal, &glyph, &advance, 1);
  metrics->avgAdvanceWidth = (float)(advance.width / size);
  metrics->maxAdvanceWidth = metrics->avgAdvanceWidth;

  metrics->minLeftSideBearing = 0;
  metrics->minRightSideBearing = 0;
  metrics->stemWidth = 0;
  metrics->stemHeight = 0;
  metrics->capHeight = (float)(CTFontGetCapHeight(font) / size);
  metrics->xHeight = (float)(CTFontGetXHeight(font) / size);
  metrics->italicAngle = (float)CTFontGetSlantAngle(font);
  metrics->underlinePosition = (float)(CTFontGetUnderlinePosition(font) / size);
  metrics->underlineThickness = (float)(CTFontGetUnderlineThickness(font) / size);

  CFRelease(font);
  return noErr;
}

OSStatus ATSFontGetVerticalMetrics(ATSFontRef fontID, ATSOptionFlags opts, ATSFontMetrics* metrics) {
  // Most fonts don't have distinct vertical metrics; return horizontal
  return ATSFontGetHorizontalMetrics(fontID, opts, metrics);
}


// ======================================================================
// ARM64: Font Family Iterator (CoreText replacement)
// ======================================================================

ATSFontFamilyIterator ATSFontFamilyIteratorCreate_wrap( ATSFontContext iContext, ATSOptionFlags iOptions, void* FH ) {
  ATSFontFamilyIterator_ *it = new ATSFontFamilyIterator_();

  CTFontCollectionRef collection = CTFontCollectionCreateFromAvailableFonts(NULL);
  if (!collection) {
    failure(FH, "could not create font collection");
    delete it;
    return NULL;
  }

  CFArrayRef descs = CTFontCollectionCreateMatchingFontDescriptors(collection);
  CFRelease(collection);
  if (!descs) {
    failure(FH, "could not get font descriptors");
    delete it;
    return NULL;
  }

  // Extract unique family names
  CFMutableSetRef nameSet = CFSetCreateMutable(NULL, 0, &kCFTypeSetCallBacks);
  CFMutableArrayRef names = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);

  CFIndex count = CFArrayGetCount(descs);
  for (CFIndex i = 0; i < count; i++) {
      CTFontDescriptorRef desc = (CTFontDescriptorRef)CFArrayGetValueAtIndex(descs, i);
      CFStringRef family = (CFStringRef)CTFontDescriptorCopyAttribute(desc, kCTFontFamilyNameAttribute);
      if (family) {
          if (!CFSetContainsValue(nameSet, family)) {
              CFSetAddValue(nameSet, family);
              CFArrayAppendValue(names, family);
          }
          CFRelease(family);
      }
  }
  CFRelease(descs);
  CFRelease(nameSet);

  it->familyNames = names;
  it->count = CFArrayGetCount(names);
  it->index = 0;

  return it;
}


ATSFontFamilyRef ATSFontFamilyIteratorNext_wrap( ATSFontFamilyIterator it, void* FH) {
  if (!it || it->index >= it->count) {
      failure(FH, "iterator exhausted");
      return 0;
  }

  CFStringRef name = (CFStringRef)CFArrayGetValueAtIndex(it->familyNames, it->index);
  it->index++;

  // Check if already registered
  for (uint32 i = 0; i < familyMapCount; i++) {
      if (CFStringCompare(familyMap[i], name, 0) == kCFCompareEqualTo) {
          return i + 1;
      }
  }

  return registerFamily(name);
}


OSStatus ATSFontFamilyIteratorReset_wrap( ATSFontFamilyIterator it, ATSFontContext iContext, ATSOptionFlags iOptions ) {
  if (!it) return -1;
  it->index = 0;
  return noErr;
}


OSStatus ATSFontFamilyIteratorRelease_wrap(ATSFontFamilyIterator it) {
  if (!it) return -1;
  if (it->familyNames) CFRelease(it->familyNames);
  delete it;
  return noErr;
}


// ======================================================================
// ARM64: Font Iterator (CoreText replacement)
// ======================================================================

ATSFontIterator ATSFontIteratorCreate_wrap( ATSFontContext iContext, ATSOptionFlags iOptions, void* FH ) {
  ATSFontIterator_ *it = new ATSFontIterator_();

  CTFontCollectionRef collection = CTFontCollectionCreateFromAvailableFonts(NULL);
  if (!collection) {
    failure(FH, "could not create font collection");
    delete it;
    return NULL;
  }

  CFArrayRef descs = CTFontCollectionCreateMatchingFontDescriptors(collection);
  CFRelease(collection);
  if (!descs) {
    failure(FH, "could not get font descriptors");
    delete it;
    return NULL;
  }

  it->fontDescriptors = descs;
  it->count = CFArrayGetCount(descs);
  it->index = 0;

  return it;
}


ATSFontRef ATSFontIteratorNext_wrap( ATSFontIterator it, void* FH) {
  if (!it || it->index >= it->count) {
      failure(FH, "iterator exhausted");
      return 0;
  }

  CTFontDescriptorRef desc = (CTFontDescriptorRef)CFArrayGetValueAtIndex(it->fontDescriptors, it->index);
  it->index++;

  return registerFontDesc(desc);
}


OSStatus ATSFontIteratorReset_wrap( ATSFontIterator it, ATSFontContext iContext, ATSOptionFlags iOptions ) {
  if (!it) return -1;
  it->index = 0;
  return noErr;
}


OSStatus ATSFontIteratorRelease_wrap(ATSFontIterator it) {
  if (!it) return -1;
  if (it->fontDescriptors) CFRelease(it->fontDescriptors);
  delete it;
  return noErr;
}


// ======================================================================
// ARM64: ATSU Text Layout (CoreText replacement)
// ======================================================================

ATSUStyle ATSUCreateStyle_wrap(void* FH) {
  return new OpaqueATSUStyle();
}


ATSUStyle ATSUCreateAndCopyStyle_wrap(ATSUStyle s, void* FH) {
  OpaqueATSUStyle* copy = new OpaqueATSUStyle();
  if (s) {
    if (s->font) { copy->font = s->font; CFRetain(copy->font); }
    copy->fontSize = s->fontSize;
    copy->fontID = s->fontID;
  }
  return copy;
}


// Called directly by glue
OSStatus ATSUDisposeStyle(ATSUStyle style) {
  if (style) delete style;
  return noErr;
}


// Called directly by glue
OSStatus ATSUStyleSetFontIDAndSize(ATSUStyle iStyle, ATSUFontID fid, float fsize) {
  if (!iStyle) return -1;
  if (iStyle->font) { CFRelease(iStyle->font); iStyle->font = NULL; }

  iStyle->fontID = fid;
  iStyle->fontSize = fsize;

  CTFontDescriptorRef desc = lookupFontDesc(fid);
  if (desc) {
    iStyle->font = CTFontCreateWithFontDescriptor(desc, fsize, NULL);
  } else {
    // Fallback to system font
    iStyle->font = CTFontCreateWithName(CFSTR("Menlo"), fsize, NULL);
  }
  return noErr;
}


ATSUTextLayout ATSUCreateTextLayout_wrap(void* FH) {
  return new OpaqueATSUTextLayout();
}


ATSUTextLayout ATSUCreateAndCopyTextLayout_wrap(ATSUTextLayout s, void* FH) {
  OpaqueATSUTextLayout* copy = new OpaqueATSUTextLayout();
  if (s) {
    if (s->text && s->textLength > 0) {
      copy->text = (UniChar*)malloc(s->textLength * sizeof(UniChar));
      memcpy(copy->text, s->text, s->textLength * sizeof(UniChar));
      copy->textLength = s->textLength;
    }
    if (s->attrs) { copy->attrs = s->attrs; CFRetain(copy->attrs); }
    copy->context = s->context;
    // Recreate CTLine
    if (s->line && copy->text) {
      CFStringRef str = CFStringCreateWithCharactersNoCopy(NULL, copy->text, copy->textLength, kCFAllocatorNull);
      if (str) {
        CFAttributedStringRef attrStr = CFAttributedStringCreate(NULL, str, copy->attrs);
        CFRelease(str);
        if (attrStr) {
          copy->line = CTLineCreateWithAttributedString(attrStr);
          CFRelease(attrStr);
        }
      }
    }
  }
  return copy;
}


ATSUTextLayout ATSUCreateTextLayoutWithTextPtr_wrap(
  ATSUStyle     style,
  u_char* text,        int     len,
  int32  textOffset,   int32  textLength,
  void*   FH ) {

  OpaqueATSUTextLayout* layout = new OpaqueATSUTextLayout();

  // Convert to UniChar
  UniChar* unis = (UniChar*)malloc(len * sizeof(UniChar));
  for (int i = 0;  i < len;  ++i)
      unis[i] = (UniChar)text[i];

  layout->text = unis;
  layout->textLength = len;

  // Build attributes from style
  CFMutableDictionaryRef attrs = CFDictionaryCreateMutable(NULL, 0,
      &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);

  if (style && style->font) {
    CFDictionarySetValue(attrs, kCTFontAttributeName, style->font);
  }

  layout->attrs = attrs;

  // Handle ATSU sentinel values:
  // kATSUFromTextBeginning = 0, kATSUToTextEnd = -1
  if (textOffset < 0) textOffset = 0;
  if (textLength < 0 || textOffset + textLength > len)
      textLength = len - textOffset;

  // Create CFString from the specified range
  CFStringRef str = CFStringCreateWithCharacters(NULL, unis + textOffset, textLength);
  if (!str) {
    failure(FH, "could not create string from text");
    delete layout;
    return NULL;
  }

  // Create attributed string and CTLine
  CFAttributedStringRef attrStr = CFAttributedStringCreate(NULL, str, attrs);
  CFRelease(str);
  if (!attrStr) {
    failure(FH, "could not create attributed string");
    delete layout;
    return NULL;
  }

  layout->line = CTLineCreateWithAttributedString(attrStr);
  CFRelease(attrStr);

  return layout;
}


// Called directly by glue
OSStatus ATSTextLayoutSetContext(ATSUTextLayout lay, CGContextRef con) {
  if (!lay) return -1;
  lay->context = con;
  return noErr;
}


OSStatus ATSUDisposeTextLayout_wrap(ATSUTextLayout lay) {
  if (lay) delete lay;
  return noErr;
}


oop ATSUGetGlyphBounds_wrap( ATSUTextLayout     iTextLayout,
                             float              fTextBasePointX,
                             float              fTextBasePointY,
                             int                iBoundsCharStart,
                             int                iBoundsCharLength,
                             uint16             iTypeOfBounds,
                             void*              FH ) {
  if (!iTextLayout || !iTextLayout->line) {
    failure(FH, "invalid text layout");
    return NULL;
  }

  CGFloat ascent, descent, leading;
  double width = CTLineGetTypographicBounds(iTextLayout->line, &ascent, &descent, &leading);

  float L = fTextBasePointX;
  float T = fTextBasePointY - (float)ascent;
  float R = fTextBasePointX + (float)width;
  float B = fTextBasePointY + (float)descent;

  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(L), false);
  r->obj_at_put(1, as_floatOop(T), false);
  r->obj_at_put(2, as_floatOop(R), false);
  r->obj_at_put(3, as_floatOop(B), false);
  return r;
}


oop ATSUGetUnjustifiedBounds_wrap( ATSUTextLayout     iTextLayout,
                                   int                iLineStart,
                                   int                iLineLength,
                                   void*              FH ) {
  if (!iTextLayout || !iTextLayout->line) {
    failure(FH, "invalid text layout");
    return NULL;
  }

  CGFloat ascent, descent, leading;
  double width = CTLineGetTypographicBounds(iTextLayout->line, &ascent, &descent, &leading);

  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(0.0), false);         // textBefore
  r->obj_at_put(1, as_floatOop((float)ascent), false);
  r->obj_at_put(2, as_floatOop((float)width), false); // textAfter
  r->obj_at_put(3, as_floatOop((float)descent), false);
  return r;
}


oop ATSUMeasureTextImage_wrap( ATSUTextLayout     iTextLayout,
                               int                iLineStart,
                               int                iLineLength,
                               void*              FH ) {
  if (!iTextLayout || !iTextLayout->line) {
    failure(FH, "invalid text layout");
    return NULL;
  }

  CGFloat ascent, descent, leading;
  double width = CTLineGetTypographicBounds(iTextLayout->line, &ascent, &descent, &leading);

  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_smiOop(0), false);                     // left
  r->obj_at_put(1, as_smiOop((short)(-ascent)), false);       // top (negative = above baseline)
  r->obj_at_put(2, as_smiOop((short)width), false);           // right
  r->obj_at_put(3, as_smiOop((short)descent), false);         // bottom
  return r;
}


// ======================================================================
// ARM64: CGFont from font ID
// ======================================================================

CGFontRef CGFontCreateWithPlatformFont_wrap( uint32 fontRef ) {
  CTFontDescriptorRef desc = lookupFontDesc(fontRef);
  if (!desc) return NULL;

  CTFontRef ctFont = CTFontCreateWithFontDescriptor(desc, 0, NULL);
  if (!ctFont) return NULL;

  CGFontRef cgFont = CTFontCopyGraphicsFont(ctFont, NULL);
  CFRelease(ctFont);
  return cgFont;
}


// ======================================================================
// ARM64: Window region / structure widths
// ======================================================================

oop GetWindowRegion_wrap( WindowRef w, uint16 reg, void* FH) {
  if (!w) { failure(FH, "null window"); return NULL; }

  QuartzWindow* qw = QuartzWindow::getPlatformWindow(w, FH);
  if (!qw) return NULL;

  objVectorOop r = Memory->objVectorObj->cloneSize(4);

  if (reg == kWindowContentRgn) {
    r->obj_at_put(0, as_smiOop((short)qw->left()), false);
    r->obj_at_put(1, as_smiOop((short)qw->top()), false);
    r->obj_at_put(2, as_smiOop((short)(qw->left() + qw->width())), false);
    r->obj_at_put(3, as_smiOop((short)(qw->top() + qw->height())), false);
  } else {
    // kWindowStructureRgn - include window chrome
    r->obj_at_put(0, as_smiOop((short)(qw->left() - qw->inset_left())), false);
    r->obj_at_put(1, as_smiOop((short)(qw->top() - qw->inset_top())), false);
    r->obj_at_put(2, as_smiOop((short)(qw->left() + qw->width() + qw->inset_right())), false);
    r->obj_at_put(3, as_smiOop((short)(qw->top() + qw->height() + qw->inset_bottom())), false);
  }
  return r;
}


oop GetWindowStructureWidths_wrap( WindowRef w, void *FH) {
  if (!w) { failure(FH, "null window"); return NULL; }

  QuartzWindow* qw = QuartzWindow::getPlatformWindow(w, FH);
  if (!qw) return NULL;

  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_smiOop(qw->inset_left()),   false);
  r->obj_at_put(1, as_smiOop(qw->inset_top()),    false);
  r->obj_at_put(2, as_smiOop(qw->inset_right()),  false);
  r->obj_at_put(3, as_smiOop(qw->inset_bottom()), false);
  return r;
}


// ======================================================================
// ARM64: Event parameter access
// ======================================================================

oop GetEventClass_wrap(EventRef evt) {
  byteVectorOop r = Memory->byteVectorObj->cloneSize(4);
  uint32 cls = GetEventClass(evt);
  *(uint32*)(r->bytes()) = EndianU32_NtoB(cls);
  return r;
}


// Helper to find event parameter by name (big-endian input)
static EventParam* findEventParam(EventRef evt, uint32* name, uint32 name_len, void* FH) {
  if (name_len != 1) { failure(FH, "name length is not 1 32-bit int"); return NULL; }
  uint32 nativeName = EndianU32_BtoN(*name);
  EventParam* p = evt->findParam(nativeName);
  if (!p) {
    reportOSError(-1, "GetEventParam: param not found", FH);
    return NULL;
  }
  return p;
}


uint32 GetEventParam_uint32(EventRef evt, uint32* name, uint32 name_len,
                             uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return 0; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? p->uint32_val : 0;
}

int32 GetEventParam_int32(EventRef evt, uint32* name, uint32 name_len,
                           uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return 0; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? p->int32_val : 0;
}

uint16 GetEventParam_uint16(EventRef evt, uint32* name, uint32 name_len,
                              uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return 0; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? (uint16)p->uint32_val : 0;
}

int16 GetEventParam_int16(EventRef evt, uint32* name, uint32 name_len,
                           uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return 0; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? (int16)p->int32_val : 0;
}

uint8 GetEventParam_uint8(EventRef evt, uint32* name, uint32 name_len,
                           uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return 0; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? (uint8)p->uint32_val : 0;
}

Boolean GetEventParam_Boolean(EventRef evt, uint32* name, uint32 name_len,
                               uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return 0; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? (Boolean)p->bool_val : 0;
}

WindowRef GetEventParam_WindowRef(EventRef evt, uint32* name, uint32 name_len,
                                   uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return NULL; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? (WindowRef)p->ptr_val : NULL;
}

GrafPtr GetEventParam_GrafPtr(EventRef evt, uint32* name, uint32 name_len,
                               uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return NULL; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  // If it's a window ref, return its port
  if (p && p->ptr_val) {
    WindowRef w = (WindowRef)p->ptr_val;
    return GetWindowPort(w);
  }
  return NULL;
}

EventRef GetEventParam_EventRef(EventRef evt, uint32* name, uint32 name_len,
                                 uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return NULL; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? (EventRef)p->ptr_val : NULL;
}

CGContextRef GetEventParam_CGContextRef(EventRef evt, uint32* name, uint32 name_len,
                                         uint32* type, uint32 type_len, void* FH) {
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return NULL; }
  EventParam* p = findEventParam(evt, name, name_len, FH);
  return p ? (CGContextRef)p->ptr_val : NULL;
}


oop GetEventParam_CGPoint(EventRef evt, uint32* name, uint32 name_len, void* FH) {
  EventParam* p = findEventParam(evt, name, name_len, FH);
  if (!p) return NULL;
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p->point_val.x), false);
  r->obj_at_put(1, as_floatOop(p->point_val.y), false);
  return r;
}


oop GetEventParam_CGSize(EventRef evt, uint32* name, uint32 name_len, void* FH) {
  EventParam* p = findEventParam(evt, name, name_len, FH);
  if (!p) return NULL;
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p->size_val.w), false);
  r->obj_at_put(1, as_floatOop(p->size_val.h), false);
  return r;
}


oop GetEventParam_CGRect(EventRef evt, uint32* name, uint32 name_len, void* FH) {
  EventParam* p = findEventParam(evt, name, name_len, FH);
  if (!p) return NULL;
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(p->rect_val.x), false);
  r->obj_at_put(1, as_floatOop(p->rect_val.y), false);
  r->obj_at_put(2, as_floatOop(p->rect_val.w), false);
  r->obj_at_put(3, as_floatOop(p->rect_val.h), false);
  return r;
}


OSStatus SetMouseCoalescingEnabled_wrap(bool newState) {
  // No-op on Cocoa; event coalescing is handled by NSView/EventQueue
  return noErr;
}


#else // !__aarch64__ (x86_64 Carbon implementations)


CGContextRef QDBeginCGContext_wrap( OpaqueGrafPtr* port, void* FH ) {
  CGContextRef c;
  OSStatus e = QDBeginCGContext(port, &c);
  return  e != noErr  ?  (CGContextRef)reportOSError(e, "QDBeginContext", FH)  : c;
}



void QDEndCGContext_wrap( OpaqueGrafPtr* port, CGContext* carg, void* FH ) {
  CGContextRef c = carg;
  OSStatus e = QDEndCGContext(port, &c);
  if ( e != noErr) reportOSError(e, "QDEndCGContext", FH);
}



ATSFontFamilyRef ATSFontFamilyFindFromName_wrap( const char* name ) {
  CFStringRef cfs = CFStringCreateWithCStringNoCopy( NULL, name,
                     kCFStringEncodingMacRoman, kCFAllocatorNull);
  return ATSFontFamilyFindFromName( cfs, kNilOptions);
}


oop ATSFontFamilyGetName_wrap( ATSFontFamilyRef id, void* FH ) {
  CFStringRef cfs;
  OSStatus e = ATSFontFamilyGetName(id, NULL, &cfs);
  return  e != noErr  ?  (oop)reportOSError(e, "ATSFontFamilyGetName", FH)  :
                         byteVectorFromCFString(cfs, "ATSFontFamilyGetName", FH);
}



ATSFontRef ATSFontFindFromName_wrap( const char* name ) {
  CFStringRef cfs = CFStringCreateWithCStringNoCopy( NULL, name,
                     kCFStringEncodingMacRoman, kCFAllocatorNull);
  return ATSFontFindFromName( cfs, kNilOptions);
}


ATSFontRef ATSFontFindFromPostScriptName_wrap( const char* name ) {
  CFStringRef cfs = CFStringCreateWithCStringNoCopy( NULL, name,
                     kCFStringEncodingMacRoman, kCFAllocatorNull);
  return ATSFontFindFromPostScriptName( cfs, kNilOptions);
}


oop ATSFontGetName_wrap( ATSFontRef id, void* FH ) {
  CFStringRef cfs;
  OSStatus e = ATSFontGetName(id, NULL, &cfs);
  return  e != noErr  ?  (oop)reportOSError(e, "ATSFontGetName", FH)  :
                         byteVectorFromCFString(cfs, "ATSFontGetName", FH);
}

oop ATSFontGetPostScriptName_wrap( ATSFontRef id, void* FH ) {
  CFStringRef cfs;
  OSStatus e = ATSFontGetPostScriptName(id, NULL, &cfs);
  return  e != noErr  ?  (oop)reportOSError(e, "ATSFontGetPostScriptName", FH)  :
                         byteVectorFromCFString(cfs, "ATSFontGetPostScriptName", FH);
}


ATSFontFamilyIterator ATSFontFamilyIteratorCreate_wrap( ATSFontContext iContext, ATSOptionFlags iOptions, void* FH ) {
    ATSFontFamilyIterator it;
    OSStatus e = ATSFontFamilyIteratorCreate( iContext, NULL, NULL, iOptions, &it);
  return  e != noErr  ?  (ATSFontFamilyIterator)reportOSError(e, "ATSFontFamilyIteratorCreate", FH)  :  it;
}


ATSFontFamilyRef ATSFontFamilyIteratorNext_wrap( ATSFontFamilyIterator it, void* FH) {
    ATSFontFamilyRef fam;
    OSStatus e = ATSFontFamilyIteratorNext( it, &fam);
  return  e != noErr  ?  (ATSFontFamilyRef)reportOSError(e, "ATSFontFamilyIteratorNext", FH)  :  fam;
}


OSStatus ATSFontFamilyIteratorReset_wrap( ATSFontFamilyIterator it, ATSFontContext iContext, ATSOptionFlags iOptions ) {
    ATSFontFamilyIterator itx = it;
    return ATSFontFamilyIteratorReset( iContext, NULL, NULL, iOptions, &itx);
}


OSStatus ATSFontFamilyIteratorRelease_wrap(ATSFontFamilyIterator it) {
  ATSFontFamilyIterator x = it;
  return ATSFontFamilyIteratorRelease(&x);
}




ATSFontIterator ATSFontIteratorCreate_wrap( ATSFontContext iContext, ATSOptionFlags iOptions, void* FH ) {
    ATSFontIterator it;
    OSStatus e = ATSFontIteratorCreate( iContext, NULL, NULL, iOptions, &it);
  return  e != noErr  ?  (ATSFontIterator)reportOSError(e, "ATSFontIteratorCreate", FH)  :  it;
}


ATSFontRef ATSFontIteratorNext_wrap( ATSFontIterator it, void* FH) {
    ATSFontRef fam;
    OSStatus e = ATSFontIteratorNext( it, &fam);
  return  e != noErr  ?  (ATSFontRef)reportOSError(e, "ATSFontIteratorNext", FH)  :  fam;
}


OSStatus ATSFontIteratorReset_wrap( ATSFontIterator it, ATSFontContext iContext, ATSOptionFlags iOptions ) {
    ATSFontIterator itx = it;
    return ATSFontIteratorReset( iContext, NULL, NULL, iOptions, &itx);
}


OSStatus ATSFontIteratorRelease_wrap(ATSFontIterator it) {
  ATSFontIterator x = it;
  return ATSFontIteratorRelease(&x);
}


oop ATSUGetGlyphBounds_wrap( ATSUTextLayout     iTextLayout,
                             float              fTextBasePointX,
                             float              fTextBasePointY,
                             int                iBoundsCharStart,  // uint32
                             int                iBoundsCharLength, // uint32
                             uint16             iTypeOfBounds,
                             void*              FH ) {
  ATSUTextMeasurement iTextBasePointX = X2Fix(fTextBasePointX);
  ATSUTextMeasurement iTextBasePointY = X2Fix(fTextBasePointY);

  ATSTrapezoid b;
  ItemCount oActualNumberOfBounds;

  OSStatus e = ATSUGetGlyphBounds(
    iTextLayout,
    iTextBasePointX,  iTextBasePointY,
    iBoundsCharStart, iBoundsCharLength,
    iTypeOfBounds,
    1, //   ItemCount iMaxNumberOfBounds,
    &b, &oActualNumberOfBounds);       /* can be NULL */

  if (e != noErr) {
      return  (oop)reportOSError(e, "ATSUGetGlyphBounds", FH);
  }
  if (oActualNumberOfBounds < 1) {
   static char buf[1000];
    sprintf(buf, "ATSUGetGlyphBounds failed: returned %d bounds instead of 1", (int)oActualNumberOfBounds);
    failure(FH, buf);
    return NULL;
  }
  float L = min((float)Fix2X(b.upperLeft.x), (float)Fix2X(b.lowerLeft.x ));
  float T = max((float)Fix2X(b.upperLeft.y), (float)Fix2X(b.upperRight.y));

  float R = min((float)Fix2X(b.upperRight.x), (float)Fix2X(b.lowerRight.x));
  float B = max((float)Fix2X(b.lowerLeft.y ), (float)Fix2X(b.lowerRight.y));

  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(L), false);
  r->obj_at_put(1, as_floatOop(T), false);
  r->obj_at_put(2, as_floatOop(R), false);
  r->obj_at_put(3, as_floatOop(B), false);
  return r;
}




oop ATSUGetUnjustifiedBounds_wrap( ATSUTextLayout     iTextLayout,
                                   int                iLineStart,  // uint32
                                   int                iLineLength, // uint32
                                   void*              FH ) {
  ATSUTextMeasurement oTextBefore, oTextAfter, oAscent, oDescent;
  OSStatus e = ATSUGetUnjustifiedBounds(
   iTextLayout, (uint32)iLineStart, (uint32)iLineLength,
   &oTextBefore, &oTextAfter, &oAscent, &oDescent );
  if (e != noErr) {
      return  (oop)reportOSError(e, "ATSUGetUnjustifiedBounds", FH);
  }
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(Fix2X(oTextBefore)), false);
  r->obj_at_put(1, as_floatOop(Fix2X(oAscent)),     false);
  r->obj_at_put(2, as_floatOop(Fix2X(oTextAfter)),  false);
  r->obj_at_put(3, as_floatOop(Fix2X(oDescent)),    false);
  return r;
}


oop ATSUMeasureTextImage_wrap( ATSUTextLayout     iTextLayout,
                               int                iLineStart,  // uint32
                               int                iLineLength, // uint32
                               void*              FH ) {
  ATSUTextMeasurement oTextBefore, oTextAfter, oAscent, oDescent;
  Rect rect;
  OSStatus e = ATSUMeasureTextImage(
   iTextLayout, (uint32)iLineStart, (uint32)iLineLength,
   0, 0, &rect);
  if (e != noErr) {
      return  (oop)reportOSError(e, "ATSUMeasureTextImage", FH);
  }
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_smiOop(rect.left), false);
  r->obj_at_put(1, as_smiOop(rect.top),  false);
  r->obj_at_put(2, as_smiOop(rect.right),     false);
  r->obj_at_put(3, as_smiOop(rect.bottom),    false);
  return r;
}


ATSUStyle ATSUCreateStyle_wrap(void* FH) {
  ATSUStyle style;
  OSStatus e = ATSUCreateStyle(&style);
  return  e != noErr  ?  (ATSUStyle)reportOSError(e, "ATSUCreateStyle", FH)  :  style;
}


ATSUStyle ATSUCreateAndCopyStyle_wrap(ATSUStyle s, void* FH) {
  ATSUStyle style;
  OSStatus e = ATSUCreateAndCopyStyle(s, &style);
  return  e != noErr  ?  (ATSUStyle)reportOSError(e, "ATSUCreateAndCopyStyle", FH)  :  style;
}



ATSUTextLayout ATSUCreateTextLayout_wrap(void* FH) {
  ATSUTextLayout layout;
  OSStatus e = ATSUCreateTextLayout(&layout);
  return  e != noErr  ?  (ATSUTextLayout)reportOSError(e, "ATSUCreateTextLayout", FH)  :  layout;
}


ATSUTextLayout ATSUCreateAndCopyTextLayout_wrap(ATSUTextLayout s, void* FH) {
  ATSUTextLayout layout;
  OSStatus e = ATSUCreateAndCopyTextLayout(s, &layout);
  return  e != noErr  ?  (ATSUTextLayout)reportOSError(e, "ATSUCreateAndCopyTextLayout", FH)  :  layout;
}



ATSUTextLayout ATSUCreateTextLayoutWithTextPtr_wrap(
  ATSUStyle     style,
  u_char* text,        int     len,
  int32  textOffset,   int32  textLength,
  void*   FH ) {

  ATSUTextLayout layout;
  ResourceMark rm;

  UniChar* unis = NEW_C_HEAP_ARRAY(UniChar, len);
  for (uint i = 0;  i < len;  ++i)
      unis[i] = UniChar(text[i]);  // hack to unicode

  OSStatus e = ATSUCreateTextLayoutWithTextPtr(
                 unis, (uint32)textOffset, (int32)textLength, len,
                 1,  (const UniCharCount*)&textLength,  &style,
                 &layout);
  return  e != noErr  ?  (ATSUTextLayout)reportOSError(e, "ATSUCreateTextLayoutWithTextPtr", FH)  :  layout;
}


OSStatus ATSTextLayoutSetContext(ATSUTextLayout lay, CGContextRef con) {
  ATSUAttributeTag tag[1] = {kATSUCGContextTag};
  ByteCount       count[1] = {sizeof(con)};
  ATSUAttributeValuePtr val[1] = {con};
  return ATSUSetLayoutControls( lay, 1, tag, count, val);
}


OSStatus ATSUStyleSetFontIDAndSize(ATSUStyle iStyle, ATSUFontID fid, float fsize) {
  ATSUAttributeTag        tags[2] = {kATSUFontTag, kATSUSizeTag};
  Fixed ffsize = X2Fix(fsize);
  ByteCount             counts[2] = {sizeof(ATSUFontID*), sizeof(Fixed*)};
  ATSUAttributeValuePtr   vals[2] = {&fid, &ffsize};
  return ATSUSetAttributes( iStyle, 2, tags, counts, vals);
}


OSStatus ATSUDisposeTextLayout_wrap(ATSUTextLayout lay) {
  void* oText;
  OSStatus e = ATSUGetTextLocation(lay, &oText, NULL, NULL, NULL, NULL);
  if (!e)  FreeHeap(oText);
  return ATSUDisposeTextLayout(lay);
}


oop GetWindowRegion_wrap( WindowRef w, uint16 reg, void* FH) {
  //
  // TODO: GetWindoRegion is deprecated and not avialiable in >=10.7
  // For now, we emulate with HIWindowGetBounds
  //
  HIRect bounds;
  OSStatus err = HIWindowGetBounds((WindowRef)w, reg,
                                   kHICoordSpace72DPIGlobal, &bounds);
  if (err) {
    return  (oop)reportOSError(err, "GetWindowRegion", FH);
  }

  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_smiOop((short)CGRectGetMinX(bounds)), false);
  r->obj_at_put(1, as_smiOop((short)CGRectGetMinY(bounds)), false);
  r->obj_at_put(2, as_smiOop((short)CGRectGetMaxX(bounds)), false);
  r->obj_at_put(3, as_smiOop((short)CGRectGetMaxY(bounds)), false);

  return r;
}


oop GetWindowStructureWidths_wrap( WindowRef w, void *FH) {
  Rect rect;
  OSStatus e = GetWindowStructureWidths(w, &rect);
  if (e != noErr) {
    return  (oop)reportOSError(e, "GetWindowStructureWidths", FH);
  }
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_smiOop(rect.left  ),  false);
  r->obj_at_put(1, as_smiOop(rect.top   ),  false);
  r->obj_at_put(2, as_smiOop(rect.right ),  false);
  r->obj_at_put(3, as_smiOop(rect.bottom),  false);

  return r;
}


oop GetEventClass_wrap(EventRef evt) {
  byteVectorOop r = Memory->byteVectorObj->cloneSize(4);
  *(uint32*)(r->bytes()) = EndianU32_NtoB(GetEventClass(evt));
  return r;
}

# define GET_EVENT_PARAM_SCALAR(typename) \
  typename XCONC(GetEventParam_,typename)(EventRef evt, uint32* name, uint32 name_len, \
                                           uint32* type, uint32 type_len, void* FH) { \
  if (name_len != 1) { failure(FH, "name length is not 1 32-bit int"); return 0; } \
  if (type_len != 1) { failure(FH, "type length is not 1 32-bit int"); return 0; } \
  typename r; \
  OSStatus e = GetEventParameter( evt, EndianU32_BtoN(*name), EndianU32_BtoN(*type), \
                                  NULL, sizeof(r), NULL, &r); \
  if (e == noErr)  return r; \
  reportOSError(e, "GetEventParamScalar", FH); \
  return 0; \
}


GET_EVENT_PARAM_SCALAR(uint32)
GET_EVENT_PARAM_SCALAR(int32)
GET_EVENT_PARAM_SCALAR(uint16)
GET_EVENT_PARAM_SCALAR(int16)
GET_EVENT_PARAM_SCALAR(uint8)
GET_EVENT_PARAM_SCALAR(Boolean)

GET_EVENT_PARAM_SCALAR(WindowRef)
GET_EVENT_PARAM_SCALAR(GrafPtr)
GET_EVENT_PARAM_SCALAR(EventRef)
GET_EVENT_PARAM_SCALAR(CGContextRef)


oop GetEventParam_CGPoint(EventRef evt, uint32* name, uint32 name_len, void* FH) {
  if (name_len != 1) failure(FH, "name length is not 1 32-bit int");
  HIPoint p;
  OSStatus e = GetEventParameter( evt, EndianU32_BtoN(*name), typeHIPoint,
                                  NULL, sizeof(p), NULL, &p);
  if (e != noErr)  return (oop)reportOSError(e, "GetEventParam_CGPoint", FH);
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.x), false);
  r->obj_at_put(1, as_floatOop(p.y), false);
  return r;
}


oop GetEventParam_CGSize(EventRef evt, uint32* name, uint32 name_len, void* FH) {
  if (name_len != 1) failure(FH, "name length is not 1 32-bit int");
  HISize p;
  OSStatus e = GetEventParameter( evt, EndianU32_BtoN(*name), typeHISize,
                                  NULL, sizeof(p), NULL, &p);
  if (e != noErr)  return (oop)reportOSError(e, "GetEventParam_CGSize", FH);
  objVectorOop r = Memory->objVectorObj->cloneSize(2);
  r->obj_at_put(0, as_floatOop(p.width), false);
  r->obj_at_put(1, as_floatOop(p.height), false);
  return r;
}


oop GetEventParam_CGRect(EventRef evt, uint32* name, uint32 name_len, void* FH) {
  if (name_len != 1) failure(FH, "name length is not 1 32-bit int");
  CGRect x;
  OSStatus e = GetEventParameter( evt, EndianU32_BtoN(*name), typeHISize,
                                  NULL, sizeof(x), NULL, &x);
  if (e != noErr)  return (oop)reportOSError(e, "GetEventParam_CGRect", FH);
  objVectorOop r = Memory->objVectorObj->cloneSize(4);
  r->obj_at_put(0, as_floatOop(x.origin.x), false);
  r->obj_at_put(1, as_floatOop(x.origin.y), false);
  r->obj_at_put(2, as_floatOop(x.size.width), false);
  r->obj_at_put(3, as_floatOop(x.size.height), false);
  return r;
}

OSStatus SetMouseCoalescingEnabled_wrap(bool newState) {
  return SetMouseCoalescingEnabled(newState, NULL);
}


CGFontRef CGFontCreateWithPlatformFont_wrap( uint32 fontRef ) {
  return CGFontCreateWithPlatformFont( (void*)&fontRef );
}


#endif // __aarch64__


// ======================================================================
// Seal constants (same on both platforms)
// ======================================================================

const char*       CGDirectDisplayID_seal = "CGDirectDisplayID";
const char*            QuartzWindow_seal = "QuartzWindow";
const char*                 CGLayer_seal = "CGLayer";
const char*               CGContext_seal = "CGContext";
const char*          ATSFontMetrics_seal = "ATSFontMetrics";
const char*  ATSFontFamilyIterator__seal = "ATSFontFamilyIterator";
const char*        ATSFontIterator__seal = "ATSFontIterator";
const char*    OpaqueATSUTextLayout_seal = "OpaqueATSUTextLayout";
const char*         OpaqueATSUStyle_seal = "OpaqueATSUStyle";
const char*                  CGFont_seal = "CGFont";
const char*                  CGPath_seal = "CGPath";
const char*                 CGColor_seal = "CGColor";
const char*            CGColorSpace_seal = "CGColorSpace";
const char*               CGPattern_seal = "CGPattern";
const char*                 CGImage_seal = "CGImage";
const char*           CGImageSource_seal = "CGImageSource";
const char*               CGShading_seal = "CGShading";
const char*          CGDataProvider_seal = "CGDataProvider";
const char*          OpaqueEventRef_seal = "OpaqueEventRef";
const char*           OpaqueGrafPtr_seal = "OpaqueGrafPtr";
const char*         OpaqueWindowPtr_seal = "OpaqueWindowPtr";

extern const char* EventRecord_seal;


// ======================================================================
// Glue inclusion
// ======================================================================

# pragma warn_unusedarg off // glue, sigh

# define WHAT_GLUE FUNCTIONS
# undef  PRIMITIVE_GLUE_FLAG_CODE
# define PRIMITIVE_GLUE_FLAG_CODE BlockGlueFlag gf(quartz_semaphore);

  quartz1_glue

# undef  WHAT_GLUE

# endif
