/* Sun-$Revision: 30.2 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "quartzPrims.hh"


// MW doesn't set it till headers below.
// So OR with TARGET_API_MAC_CARBON

# if defined(QUARTZ_LIB)

# if TARGET_OS_VERSION == MACOSX_VERSION
  #  undef ASSEMBLER
  #  undef Alloc
  
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


# include "_quartzPrims.cpp.incl"

# ifndef DYNAMIC
  // Removed to avoid warnings in Tiger -- dmu 5/05
  // # include "include_glue.hh"
# endif


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



CGLayer* CGLayerCreateWithContext_wrap(CGContextRef context, float w, float h) {
  return CGLayerCreateWithContext( context, CGSizeMake(w, h), NULL);
}


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


void CGContextSelectFont_wrap(CGContext* c, const char* s, float siz) {
  return CGContextSelectFont(c, s, siz, kCGEncodingMacRoman);
}


CGFontRef CGFontCreateWithPlatformFont_wrap( uint32 fontRef ) {
  return CGFontCreateWithPlatformFont( (void*)&fontRef );
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

static bool convertFloatObjVector( objVectorOop v, const char* prinName, void* FH, float*& floats, uint32& count) {
  count = v->length();
  floats = NEW_RESOURCE_ARRAY(float, count);
  int badI = -1;
  for (int i = 0;  i < count;  ++i) {
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
  float* lengths;
  if (convertFloatObjVector( lengthsOop, "CGContextSetLineDash", FH, lengths, count))
    CGContextSetLineDash( con, phase, lengths, count);
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
  float color[4] = {c1, c2, c3, alpha};
  CGContextSetFillColor(con, color);
}

void CGContextSetStrokeColor_wrap(CGContext *con, float c1, float c2, float c3, float alpha) {
  float color[4] = {c1, c2, c3, alpha};
  CGContextSetStrokeColor(con, color);
}

void CGContextSetFillPattern_wrap(CGContext *con, CGPatternRef p, float c1, float c2, float c3, float alpha) {
  float color[4] = {c1, c2, c3, alpha};
  CGContextSetFillPattern(con, p, color);
}

void CGContextSetStrokePattern_wrap(CGContext *con, CGPatternRef p, float c1, float c2, float c3, float alpha) {
  float color[4] = {c1, c2, c3, alpha};
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
  float comps[] = {r, g, b, a};
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

int32 GetWindowPortLeft  (WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->left;   }
int32 GetWindowPortRight (WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->right;  }
int32 GetWindowPortTop   (WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->top;    }
int32 GetWindowPortBottom(WindowRef w) { Rect r; return GetWindowPortBounds(w, &r)->bottom; }


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
  float* decodeArray; uint32 decodeLen;                                
  return
    convertFloatObjVector( decodeArrayOop, "CGImageCreate", FH, decodeArray, decodeLen)
      ?  CGImageCreate(w, h, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpace,
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
  return CGImageCreate(w, h, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpace,
                       bitmapInfo, provider, NULL, shouldInterpolate,
                       CGColorRenderingIntent(colorRenderingIntent));;
}
            

CGImageRef CGImageMaskCreate_wrap( float w, float h, 
                               uint32 bitsPerComponent, uint32 bitsPerPixel,
                               uint32 bytesPerRow, 
                               CGDataProviderRef provider,
                               objVectorOop decodeArrayOop,
                               bool shouldInterpolate,
                               void* FH) {
  float* decodeArray; uint32 decodeLen;                                
  return
    convertFloatObjVector( decodeArrayOop, "CGImageCreateMask", FH, decodeArray, decodeLen)
      ?  CGImageMaskCreate(w, h, bitsPerComponent, bitsPerPixel, bytesPerRow,
                           provider, decodeArray, shouldInterpolate)
      : NULL;
}
            

CGImageRef CGImageMaskCreate_wrap( float w, float h, 
                               uint32 bitsPerComponent, uint32 bitsPerPixel,
                               uint32 bytesPerRow, 
                               CGDataProviderRef provider,
                               bool shouldInterpolate) {
  return CGImageMaskCreate(w, h, bitsPerComponent, bitsPerPixel, bytesPerRow,
                           provider, NULL, shouldInterpolate);
}
            

CGImageRef CGImageCreateWithMaskingColors_wrap(CGImageRef im, 
             float min1, float max1, float min2, float max2,
             float min3, float max3, float min4, float max4) {
  float comps[8] = {min1, max2, min2, max2, min3, max3, min4, max4};
  return CGImageCreateWithMaskingColors(im, comps);
}

CGImageRef CGImageCreateWithJPEGDataProvider_wrap(
   CGDataProviderRef source,
   objVectorOop decodeArrayOop,
   bool shouldInterpolate,
   uint32 colorRenderingIntent,
   void* FH) {
  float* decodeArray; uint32 decodeLen;                                
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
  float* decodeArray; uint32 decodeLen;                                
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
  return e != CGDisplayNoErr
    ? (uint32)reportOSError(e, "CGGetDisplayCount", FH)
    : count;
}


CGDirectDisplayID CGGetDisplayAt_wrap(uint32 n, float x, float y, float w, float h, void* FH) {
  uint32 count;
  ResourceMark rm;
  CGDirectDisplayID *displays = NEW_RESOURCE_ARRAY(CGDirectDisplayID, n + 1);
  CGDisplayErr e = 
    w == 0.0  &&  h == 0.0
      ? CGGetDisplaysWithPoint( CGPointMake(x, y),      n + 1, displays, &count)
      : CGGetDisplaysWithRect(  CGRectMake(x, y, w, h), n + 1, displays, &count);
  return  e != CGDisplayNoErr  ?  (CGDirectDisplayID)reportOSError(e, "CGGetDisplayAt", FH)
  :       count < n + 1        ?  (CGDirectDisplayID)(failure(FH, "not enough displays"), NULL)
  :                               displays[n];
}


uint32 CGGetActiveDisplayCount_wrap(void* FH) {
  uint32 count;
  CGDisplayErr e = CGGetActiveDisplayList( 0, NULL, &count);
  return e != CGDisplayNoErr
    ? (uint32)reportOSError(e, "CGGetActiveDisplayCount", FH)
    : count;
}

CGDirectDisplayID CGGetActiveDisplayAt_wrap(uint32 n, void* FH) {
  uint32 count;
  ResourceMark rm;
  CGDirectDisplayID *displays = NEW_RESOURCE_ARRAY(CGDirectDisplayID, n + 1);
  CGDisplayErr e =  CGGetActiveDisplayList( n + 1, displays, &count);
  return  e != CGDisplayNoErr  ?  (CGDirectDisplayID)reportOSError(e, "CGGetActiveDisplayAt", FH)
  :       count < n + 1        ?  (CGDirectDisplayID)(failure(FH, "not enough displays"), NULL)
  :                               displays[n];
}


uint32 CGGetOnlineDisplayCount_wrap(void* FH) {
  uint32 count;
  CGDisplayErr e = CGGetOnlineDisplayList( 0, NULL, &count);
  return e != CGDisplayNoErr
    ? (uint32)reportOSError(e, "CGGetOnlineDisplayCount", FH)
    : count;
}

CGDirectDisplayID CGGetOnlineDisplayAt_wrap(uint32 n, void* FH) {
  uint32 count;
  ResourceMark rm;
  CGDirectDisplayID *displays = NEW_RESOURCE_ARRAY(CGDirectDisplayID, n + 1);
  CGDisplayErr e =  CGGetOnlineDisplayList( n + 1, displays, &count);
  return  e != CGDisplayNoErr  ?  (CGDirectDisplayID)reportOSError(e, "CGGetOnlineDisplayAt", FH)
  :       count < n + 1        ?  (CGDirectDisplayID)(failure(FH, "not enough displays"), NULL)
  :                               displays[n];
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
//  r->obj_at_put(0, as_floatOop(CGRectGetMinX(bounds)), false);
//  r->obj_at_put(1, as_floatOop(CGRectGetMinY(bounds)), false);
//  r->obj_at_put(2, as_floatOop(CGRectGetMaxX(bounds)), false);
//  r->obj_at_put(3, as_floatOop(CGRectGetMaxY(bounds)), false);
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

// GET_EVENT_PARAM_SCALAR(MenuRef)
// GET_EVENT_PARAM_SCALAR(ControlRef)
// GET_EVENT_PARAM_SCALAR(RgnHandle)
// GET_EVENT_PARAM_SCALAR(HIShapeRef)
// GET_EVENT_PARAM_SCALAR(GDHandle)


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

// const char*            WindowRef_seal = "WindowRef";

extern const char* EventRecord_seal;



# pragma warn_unusedarg off // glue, sigh

# define WHAT_GLUE FUNCTIONS
# undef  PRIMITIVE_GLUE_FLAG_CODE
# define PRIMITIVE_GLUE_FLAG_CODE BlockGlueFlag gf(quartz_semaphore);

  quartz1_glue

# undef  WHAT_GLUE

# endif
