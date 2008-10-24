'Sun-$Revision: 30.2 $'

primitiveMaker reader copy beNoisy staticLinking create: 'quartz' Flag: 'quartz_semaphore' From: '

    -- Copyright 2007 David Ungar.
    -- See the LICENSE file for license information.
 
 traits: traits quartz directDisplay
 macroName:	   quartz1


 visibility: publicSlot
 
    // typedef UInt32 CFTypeID;
    // typedef UInt32 CFOptionFlags;
    // typedef UInt32 CFHashCode;
    // typedef SInt32 CFIndex;

    // typedef enum {
    //    kCFCompareLessThan = -1,
    //    kCFCompareEqualTo = 0,
    //    kCFCompareGreaterThan = 1
    //  } CFComparisonResult;
    
    
    void main = proxy CGDirectDisplayID CGDirectDisplayID_seal { quartz directDisplay deadCopy } call CGMainDisplayID 
    
    proxy CGDirectDisplayID CGDirectDisplayID_seal pixelHeight       = int call CGDisplayPixelsHigh
    proxy CGDirectDisplayID CGDirectDisplayID_seal pixelWidth        = int call CGDisplayPixelsWide
    
    void getDisplayCountX: float Y: float Width: float Height: float \
      = unsigned_int call CGGetDisplayCount_wrap passFailHandle
      
    void getDisplayAt: unsigned_int X: float Y: float Width: float Height: float \
      = proxy CGDirectDisplayID CGDirectDisplayID_seal { quartz directDisplay deadCopy } call CGGetDisplayAt_wrap passFailHandle
    
    
    void getActiveDisplayCount \
      = unsigned_int call CGGetActiveDisplayCount_wrap passFailHandle
      
    void getActiveDisplayAt: unsigned_int \
      = proxy CGDirectDisplayID CGDirectDisplayID_seal { quartz directDisplay deadCopy } call CGGetActiveDisplayAt_wrap passFailHandle
    
    void getOnlineDisplayCount \
      = unsigned_int call CGGetOnlineDisplayCount_wrap passFailHandle
      
    void getOnlineDisplayAt: unsigned_int \
      = proxy CGDirectDisplayID CGDirectDisplayID_seal { quartz directDisplay deadCopy } call CGGetOnlineDisplayAt_wrap passFailHandle
      
    proxy CGDirectDisplayID CGDirectDisplayID_seal getX      = float call CGDirectDisplayX_wrap
    proxy CGDirectDisplayID CGDirectDisplayID_seal getY      = float call CGDirectDisplayY_wrap
    proxy CGDirectDisplayID CGDirectDisplayID_seal getWidth  = float call CGDirectDisplayWidth_wrap
    proxy CGDirectDisplayID CGDirectDisplayID_seal getHeight = float call CGDirectDisplayHeight_wrap
    
    proxy CGDirectDisplayID CGDirectDisplayID_seal bitsPerPixel = unsigned_int call CGDisplayBitsPerPixel
    proxy CGDirectDisplayID CGDirectDisplayID_seal bitsPerSample = unsigned_int call CGDisplayBitsPerSample
    proxy CGDirectDisplayID CGDirectDisplayID_seal samplesPerPixel = unsigned_int call CGDisplaySamplesPerPixel
    proxy CGDirectDisplayID CGDirectDisplayID_seal bytesPerRow = unsigned_int call CGDisplayBytesPerRow
    
    void captureAll = must_be_zero call CGCaptureAllDisplays
    void captureAllOptions: unsigned_int = must_be_zero call CGCaptureAllDisplaysWithOptions
    void releaseAll = must_be_zero call CGReleaseAllDisplays
    
    proxy CGDirectDisplayID CGDirectDisplayID_seal hideCursor = must_be_zero call CGDisplayHideCursor
    proxy CGDirectDisplayID CGDirectDisplayID_seal showCursor = must_be_zero call CGDisplayShowCursor
    
    proxy CGDirectDisplayID CGDirectDisplayID_seal moveCursorToX: float Y: float = must_be_zero call CGDisplayMoveCursorToPoint_wrap
    
    void lastMouseDeltaX = int call CGGetLastMouseDelta_x
    void lastMouseDeltaY = int call CGGetLastMouseDelta_y


 traits: traits quartz platformWindow


 visibility: publicSlot
    
    void new = QuartzWindow { quartz platformWindow deadCopy }  new
    QuartzWindow delete = void delete
   
   
   
   QuartzWindow openDisplay: string \
	 Left: int Top: int Width: int Height: int  \
	 MinWidth: int MaxWidth: int MinHeight: int MaxHeight: int \
	 WindowName: string  IconName: string \
	 FontName: string  FontSize: int \
	   =  must_be_nonzero callMember open
	   
	 QuartzWindow setLeft: int Top: int Width: int Height: int \
	    = must_be_nonzero callMember change_extent
	    
	 QuartzWindow setMinWidth: int MaxWidth: int MinHeight: int MaxHeight: int \
	   = must_be_nonzero callMember change_size_hints
	   
	 QuartzWindow basicClose = void callMember close
	 
   
   -- skipped a bunch
   
   QuartzWindow raw_isOpen = bool callMember is_open
   
   QuartzWindow height = int callMember height
   QuartzWindow width  = int callMember width
   QuartzWindow left   = int callMember left
   QuartzWindow top    = int callMember top
   
   // QuartzWindow screen = proxy void* GDPtr_seal {quartz gDevice deadCopy} callMember screen
   
   QuartzWindow screenWidth = int callMember screen_width
   QuartzWindow screenHeight = int callMember screen_height
   
   QuartzWindow getQuartzWindow = proxy void* OpaqueWindowPtr_seal {quartz window deadCopy} callMember my_window
   
   QuartzWindow insetLeft   = int callMember inset_left
   QuartzWindow insetTop    = int callMember inset_top
   QuartzWindow insetRight  = int callMember inset_right
   QuartzWindow insetBottom = int callMember inset_bottom
   
      
   QuartzWindow eventsPending = int callMember events_pending passFailHandle
   QuartzWindow nextEvent     = OpaqueEventRef {quartz event deadCopy} callMember next_event passFailHandle
   QuartzWindow peekEvent     = OpaqueEventRef {quartz event deadCopy} callMember peek_event passFailHandle 
   
   QuartzWindow    addHandledEventClass: cbv_len uint32* Kind: unsigned_int = must_be_zero callMember    AddHandledEvent_wrap passFailHandle
   QuartzWindow removeHandledEventClass: cbv_len uint32* Kind: unsigned_int = must_be_zero callMember RemoveHandledEvent_wrap passFailHandle

   QuartzWindow warpPointerToX: int Y: int = void callMember warp_pointer

      
   
   traits: traits quartz window
   visibility: publicSlot
   
   OpaqueWindowPtr setPortWindowPort = void call SetPortWindowPort
   OpaqueWindowPtr getPort       = OpaqueGrafPtr {quartz graf deadCopy } call GetWindowPort
   OpaqueWindowPtr getPortTop    = int call GetWindowPortTop
   OpaqueWindowPtr getPortLeft   = int call GetWindowPortLeft
   OpaqueWindowPtr getPortBottom = int call GetWindowPortBottom
   OpaqueWindowPtr getPortRight  = int call GetWindowPortRight
   
   void unmappedFetchFromClipboard = oop call QuartzWindow::get_scrap_text 
   void unmappedStoreToClipboard: cbv_len char* = must_be_zero call QuartzWindow::put_scrap_text 
   
   OpaqueWindowPtr activate: bool = must_be_zero call ActivateWindow
   OpaqueWindowPtr isVisible = bool call IsWindowVisible
   OpaqueWindowPtr select = void call SelectWindow
   OpaqueWindowPtr setUserFocus = must_be_zero call SetUserFocusWindow
   OpaqueWindowPtr bringToFront = void call BringToFront
   OpaqueWindowPtr sendBehind: OpaqueWindowPtr = void call SendBehind
   OpaqueWindowPtr show = void call ShowWindow
   OpaqueWindowPtr isValid = bool call IsValidWindowRef
   
   OpaqueWindowPtr raw_getStructureWidths = oop call GetWindowStructureWidths_wrap passFailHandle
   OpaqueWindowPtr raw_getRegion: unsigned_short = oop call GetWindowRegion_wrap passFailHandle
   
   OpaqueWindowPtr getPlatformWindow = QuartzWindow {quartz platformWindow deadCopy} call QuartzWindow::getPlatformWindow passFailHandle

   
   
   traits: traits quartz graf
   visibility: publicSlot
   
   OpaqueGrafPtr beginContext = CGContext { quartz context deadCopy } call QDBeginCGContext_wrap passFailHandle
   OpaqueGrafPtr   endContext: CGContext = void call QDEndCGContext_wrap passFailHandle
   
   OpaqueGrafPtr getWindow = OpaqueWindowPtr { quartz window deadCopy} call GetWindowFromPort

   
   traits: traits quartz layer
   visibility: publicSlot
   
   void createWithContext: CGContext Width: float Height: float = CGLayer { quartz layer deadCopy }  call CGLayerCreateWithContext_wrap
   CGLayer retain = void call CGLayerRetain
   CGLayer release = void call CGLayerRelease
   CGLayer width = float call CGLayerWidth_wrap
   CGLayer height = float call CGLayerHeight_wrap
   CGLayer getGC = CGContext { quartz context deadCopy } call CGLayerGetContext
    
   
   
   traits: traits quartz cgFont
   visibility: publicSlot
   
   void createID: unsigned_int = CGFont { quartz cgFont deadCopy } call CGFontCreateWithPlatformFont_wrap
   CGFont retain = void call CGFontRetain
   CGFont release = void call CGFontRelease
   
   
   traits: traits quartz context
   visibility: publicSlot
   
   
   CGContext drawLayer: CGLayer X: float Y: float Width: float Height: float = void call CGContextDrawLayerInRect_wrap
   CGContext drawLayer: CGLayer X: float Y: float = void call CGContextDrawLayerAtPoint_wrap
   
   CGContext saveGState = void call CGContextSaveGState
   CGContext restoreGState = void call CGContextRestoreGState
   CGContext scaleCTM_X: float Y: float = void call CGContextScaleCTM
   CGContext translateCTM_X: float Y: float = void call CGContextTranslateCTM
   CGContext rotateCTM_Radians: float = void call CGContextRotateCTM
   CGContext concatCTMMatrix_A: float B: float C: float D: float TX: float TY: float = void call CGContextConcatCTM_wrap

   CGContext raw_getCTM = oop call CGContextGetCTM_wrap
   
   CGContext setLineWidth: float = void call CGContextSetLineWidth
   CGContext setLineCap: int = void call CGContextSetLineCap_wrap
   CGContext setLineJoin: int = void call CGContextSetLineJoin_wrap
   CGContext setMiterLimit: float = void call CGContextSetMiterLimit
   
   CGContext setLineDashPhase: float Lengths: oop objVector = void call CGContextSetLineDash_wrap passFailHandle
   CGContext setFlatness: float = void call CGContextSetFlatness 
   CGContext setAlpha: float = void call CGContextSetAlpha
   CGContext setBlendMode: int = void call CGContextSetBlendMode_wrap
   CGContext beginPath = void call CGContextBeginPath
   CGContext moveToPointX: float Y: float = void call CGContextMoveToPoint
   CGContext addLineToPointX: float Y: float = void call CGContextAddLineToPoint
   CGContext addCurveToPointCP1X: float CP1Y: float CP2X: float CP2Y: float X: float Y: float = void call CGContextAddCurveToPoint
   CGContext addQuadCurveToPointCPX: float CPY: float X: float Y: float = void call CGContextAddQuadCurveToPoint
   CGContext closePath = void call CGContextClosePath
   CGContext addRectX: float Y: float Width: float Height: float = void call CGContextAddRect_wrap
   CGContext addEllipseInRectX: float Y: float Width: float Height: float = void call CGContextAddEllipseInRect_wrap
   CGContext addArcX: float Y: float Radius: float StartAngle: float EndAngle: float Clockwise: bool = void call CGContextAddArc
   CGContext addArcToPointX1: float Y1: float X2: float Y2: float Radius: float = void call CGContextAddArcToPoint
   CGContext addPath: CGPath = void call CGContextAddPath
   CGContext replacePathWithStrokedPath = void call CGContextReplacePathWithStrokedPath
   CGContext isPathEmpty = bool call CGContextIsPathEmpty
   CGContext raw_getPathCurrentPoint = oop call CGContextGetPathCurrentPoint_wrap
   CGContext raw_getPathBoundingBox = oop call CGContextGetPathBoundingBox_wrap
   CGContext pathContainsPointX: float Y: float Mode: unsigned_int = bool call CGContextPathContainsPoint_wrap
   CGContext drawPathMode: int = void call CGContextDrawPath_wrap
   CGContext fillPath = void call CGContextFillPath
   CGContext eoFillPath = void call CGContextEOFillPath
   CGContext strokePath = void call CGContextStrokePath
   CGContext fillRectX: float Y: float Width: float Height: float = void call CGContextFillRect_wrap
   CGContext strokeRectX: float Y: float Width: float Height: float = void call CGContextStrokeRect_wrap
   CGContext strokeRectX: float Y: float Width: float Height: float StrokeWidth: float = void call CGContextStrokeRectWithWidth_wrap
   CGContext clearRectX: float Y: float Width: float Height: float = void call CGContextClearRect_wrap
   CGContext fillEllipseX: float Y: float Width: float Height: float = void call CGContextFillEllipseInRect_wrap
   CGContext strokeEllipseX: float Y: float Width: float Height: float = void call CGContextStrokeEllipseInRect_wrap
   
   CGContext clip = void call CGContextClip
   CGContext eoClip = void call CGContextEOClip
   CGContext clipToX: float Y: float Width: float Height: float Mask: CGImage = void call CGContextClipToMask_wrap
   
   CGContext getClipX = float call GetClipBoundingBoxX_wrap
   CGContext getClipY = float call GetClipBoundingBoxY_wrap
   CGContext getClipWidth = float call GetClipBoundingBoxWidth_wrap
   CGContext getClipHeight = float call GetClipBoundingBoxHeight_wrap
   
   CGContext clipToRectX: float Y: float Width: float Height: float = void call CGContextClipToRect_wrap
   // CGContextClipToRects
   
   CGContext setFillColor: CGColor = void call CGContextSetFillColorWithColor
   CGContext setStrokeColor: CGColor = void call CGContextSetStrokeColorWithColor
   CGContext setFillColorSpace: CGColorSpace = void call CGContextSetFillColorSpace
   CGContext setStrokeColorSpace: CGColorSpace = void call CGContextSetStrokeColorSpace
   
   CGContext setFillColorX: float Y: float Z: float Alpha: float = void call CGContextSetFillColor_wrap
   CGContext setStrokeColorX: float Y: float Z: float Alpha: float = void call CGContextSetStrokeColor_wrap

   CGContext setFillPattern: CGPattern Red: float Green: float Blue: float Alpha: float = void call CGContextSetFillPattern_wrap
   CGContext setStrokePattern: CGPattern  Red: float Green: float Blue: float Alpha: float = void call CGContextSetStrokePattern_wrap
   
   CGContext setPatternPhaseWidth: float Height: float = void call CGContextSetPatternPhase_wrap

   CGContext setGrayFillColorGray: float Alpha: float = void call CGContextSetGrayFillColor
   CGContext setGrayStrokeColorGray: float Alpha: float = void call CGContextSetGrayStrokeColor

   CGContext setFillColorRed: float Green: float Blue: float Alpha: float = void call CGContextSetRGBFillColor_wrap
   CGContext setStrokeColorRed: float Green: float Blue: float Alpha: float = void call CGContextSetRGBStrokeColor_wrap

   CGContext setRenderingIntent: unsigned_int = void call CGContextSetRenderingIntent_wrap

   CGContext drawImage: CGImage X: float Y: float Width: float Height: float = void call CGContextDrawImage_wrap
   CGContext interpolationQuality = int call CGContextGetInterpolationQuality
   CGContext interpolationQuality: int = void call CGContextSetInterpolationQuality_wrap
   
   CGContext setShadowOffsetX: float OffsetY: float Blur: float Color: CGColor = void call CGContextSetShadowWithColor_wrap
   CGContext setShadowOffsetX: float OffsetY: float Blur: float Red: float Green: float Blue: float Alpha: float \
     = void call CGContextSetShadowWithColor_wrap2
   CGContext setShadowOffsetX: float OffsetY: float Blur: float = void call CGContextSetShadow_wrap
   
   CGContext drawShading: CGShading = void call CGContextDrawShading
   
   CGContext setCharacterSpacing: float = void call CGContextSetCharacterSpacing
   CGContext setTextPositionX: float Y: float = void call CGContextSetTextPosition
   CGContext raw_getTextPosition = oop call CGContextGetTextPosition_wrap
   CGContext setTextMatrix_A: float B: float C: float D: float TX: float TY: float = void call CGContextSetTextMatrix_wrap
   CGContext raw_getTextMatrix = oop call CGContextGetTextMatrix_wrap
   CGContext setTextDrawingMode: int = void call CGContextSetTextDrawingMode_wrap
   
   CGContext setFont: CGFont = void call CGContextSetFont
   CGContext setFontSize: float = void call CGContextSetFontSize
   CGContext selectFont: string Size: float  = void call CGContextSelectFont_wrap
   
   CGContext showText: bv_len char* = void call CGContextShowText
   // CGContextShowGlyphs
   // CGContextShowGlyphsWithAdvances
   CGContext showTextAtX: float Y: float Text: cbv_len char* = void call CGContextShowTextAtPoint
   // CGContextShowGlyphsAtPoint
   // skip PDF
   CGContext retain = void call CGContextRetain
   CGContext release = void call CGContextRelease
   CGContext flush = void call CGContextFlush
   CGContext synchronize = void call CGContextSynchronize
   
   CGContext setShouldAntialias: bool = void call CGContextSetShouldAntialias
   CGContext setAllowsAntialiasing: bool = void call CGContextSetAllowsAntialiasing
   CGContext setShouldSmoothFonts: bool = void call CGContextSetShouldSmoothFonts
   
   CGContext beginTransparencyLayer = void call CGContextBeginTransparencyLayer_wrap
   CGContext   endTransparencyLayer = void call CGContextEndTransparencyLayer

   CGContext raw_getUserSpaceToDeviceSpaceTransform = oop call CGContextGetUserSpaceToDeviceSpaceTransform_wrap
   CGContext raw_convertPointToDeviceSpaceX: float Y: float = oop call CGContextConvertPointToDeviceSpace_wrap
   CGContext raw_convertPointToUserSpaceX: float Y: float = oop call CGContextConvertPointToUserSpace_wrap
   CGContext raw_convertSizeToUserSpaceWidth: float Height: float = oop call CGContextConvertSizeToUserSpace_wrap
   CGContext raw_convertSizeToDeviceSpaceWidth: float Height: float = oop call CGContextConvertSizeToDeviceSpace_wrap
   CGContext raw_convertRectToDeviceSpaceX: float Y: float Width: float Height: float = oop call CGContextConvertRectToDeviceSpace_wrap
   CGContext raw_convertRectToUserSpaceX:   float Y: float Width: float Height: float = oop call  CGContextConvertRectToUserSpace_wrap
   
   
   
   
   traits: traits quartz atsFont
   visibility: privateSlot
   
   void findIDFromName:            string_null  = unsigned_int call ATSFontFindFromName_wrap
   void findIDFromPostScriptName:  string_null  = unsigned_int call ATSFontFindFromPostScriptName_wrap
   
   void getNameID:           unsigned_int    = oop call ATSFontGetName_wrap passFailHandle
   void getPostScriptNameID: unsigned_int    = oop call ATSFontGetPostScriptName_wrap passFailHandle

   // Use kATSOptionFlagsDefault for options = 0
   void getHorizontalMetricsID: unsigned_int Options: unsigned_int Into: ATSFontMetrics = must_be_zero call ATSFontGetHorizontalMetrics
   void getVerticalMetricsID:   unsigned_int Options:   unsigned_int Into: ATSFontMetrics = must_be_zero call ATSFontGetVerticalMetrics

 
   traits: traits quartz atsFontFamily
   visibility: privateSlot
   
   void findIDFromName:          string_null  = unsigned_int call ATSFontFamilyFindFromName_wrap

   void getNameID:          unsigned_int    = oop call ATSFontFamilyGetName_wrap passFailHandle

   traits: traits quartz atsFontMetrics
   visibility: publicSlot

    void new = ATSFontMetrics { quartz atsFontMetrics deadCopy }  new
    ATSFontMetrics delete = void delete

   ATSFontMetrics version = unsigned_int getMember version
   ATSFontMetrics ascent               = float        getMember ascent
   ATSFontMetrics descent              = float        getMember descent
   ATSFontMetrics leading              = float        getMember leading
   ATSFontMetrics avgAdvanceWidth      = float        getMember avgAdvanceWidth
   ATSFontMetrics maxAdvanceWidth      = float        getMember maxAdvanceWidth
   ATSFontMetrics minLeftSideBearing   = float        getMember minLeftSideBearing
   ATSFontMetrics minRightSideBearing  = float        getMember minRightSideBearing
   ATSFontMetrics stemWidth            = float        getMember stemWidth
   ATSFontMetrics stemHeight           = float        getMember stemHeight
   ATSFontMetrics capHeight            = float        getMember capHeight
   ATSFontMetrics xHeight              = float        getMember xHeight
   ATSFontMetrics italicAngle          = float        getMember italicAngle
   ATSFontMetrics underlinePosition    = float        getMember underlinePosition
   ATSFontMetrics underlineThickness   = float        getMember underlineThickness
 


   traits: traits quartz atsFontFamilyIterator
   visibility: publicSlot

    // context: kATSFontContextLocal 2, options: kATSOptionFlagsUnRestrictedScope 2 << 12
    void createContext: unsigned_int Options: unsigned_int = ATSFontFamilyIterator_ { quartz atsFontFamilyIterator deadCopy }  call ATSFontFamilyIteratorCreate_wrap passFailHandle

    ATSFontFamilyIterator_ resetContext: unsigned_int Options: unsigned_int = must_be_zero  call ATSFontFamilyIteratorReset_wrap
    
    ATSFontFamilyIterator_ next = unsigned_int call ATSFontFamilyIteratorNext_wrap passFailHandle
    
    ATSFontFamilyIterator_ release = must_be_zero call ATSFontFamilyIteratorRelease_wrap

 


   traits: traits quartz atsFontIterator
   visibility: publicSlot

    // context: kATSFontContextLocal 2, options: kATSOptionFlagsDefaultScope 0
    void createContext: unsigned_int Options: unsigned_int = ATSFontIterator_ { quartz atsFontIterator deadCopy }  call ATSFontIteratorCreate_wrap passFailHandle

    ATSFontIterator_ resetContext: unsigned_int Options: unsigned_int = must_be_zero  call ATSFontIteratorReset_wrap
    
    ATSFontIterator_ next = unsigned_int call ATSFontIteratorNext_wrap passFailHandle
    
    ATSFontIterator_ release = must_be_zero call ATSFontIteratorRelease_wrap
    
    traits: traits quartz textLayout
    visibility: privateSlot
    
    OpaqueATSUTextLayout raw_getUnjustifiedBoundsStart: int Count: int = oop call ATSUGetUnjustifiedBounds_wrap passFailHandle
    OpaqueATSUTextLayout raw_measureTextImageStart: int Count: int = oop call ATSUMeasureTextImage_wrap passFailHandle
    OpaqueATSUTextLayout raw_getGlyphBoundsAtX: float Y: float Start: int Count: int  BoundsType: unsigned_short \
        = oop call ATSUGetGlyphBounds_wrap passFailHandle


    void create = OpaqueATSUTextLayout { quartz textLayout deadCopy } call ATSUCreateTextLayout_wrap passFailHandle
    OpaqueATSUTextLayout createAndCopy =  OpaqueATSUTextLayout { quartz textLayout deadCopy } call ATSUCreateAndCopyTextLayout_wrap passFailHandle

    void createForStyle: OpaqueATSUStyle Bytes: cbv_len u_char* From: int Size: int = OpaqueATSUTextLayout { quartz textLayout deadCopy } call ATSUCreateTextLayoutWithTextPtr_wrap passFailHandle
    
    OpaqueATSUTextLayout dispose = must_be_zero call ATSUDisposeTextLayout_wrap

    OpaqueATSUTextLayout setContext: CGContext = must_be_zero call ATSTextLayoutSetContext

    
    
    traits: traits quartz textStyle
    visibility: publicSlot
    
    void create = OpaqueATSUStyle { quartz textStyle deadCopy } call ATSUCreateStyle_wrap passFailHandle
    OpaqueATSUStyle createAndCopy =  OpaqueATSUStyle { quartz textStyle deadCopy } call ATSUCreateAndCopyStyle_wrap passFailHandle
    OpaqueATSUStyle dispose = must_be_zero call ATSUDisposeStyle
    OpaqueATSUStyle setFontID: unsigned_int Size: float = must_be_zero call ATSUStyleSetFontIDAndSize
    
    
    
    traits: traits quartz image
    visibility: publicSlot
    
    void typeID = unsigned_int call CGImageGetTypeID
    
    void createWidth: unsigned_int Height: unsigned_int BitsPerComponent: unsigned_int BitsPerPixel: unsigned_int \
          BytesPerRow: unsigned_int ColorSpace: CGColorSpace BitmapInfo: unsigned_int DataProvider: CGDataProvider \
          DecodeArray: oop objVector ShouldInterpolate: bool ColorRenderingIntent: unsigned_int \
          = CGImage {quartz image deadCopy} call CGImageCreate_wrap passFailHandle
          
    void createWidth: unsigned_int Height: unsigned_int BitsPerComponent: unsigned_int BitsPerPixel: unsigned_int \
          BytesPerRow: unsigned_int ColorSpace: CGColorSpace BitmapInfo: unsigned_int DataProvider: CGDataProvider \
          ShouldInterpolate: bool ColorRenderingIntent: unsigned_int \
          = CGImage {quartz image deadCopy} call CGImageCreate_wrap
          
    void createMaskWidth: unsigned_int Height: unsigned_int BitsPerComponent: unsigned_int BitsPerPixel: unsigned_int \
          BytesPerRow: unsigned_int DataProvider: CGDataProvider \
          DecodeArray: oop objVector ShouldInterpolate: bool \
          = CGImage {quartz image deadCopy} call CGImageMaskCreate_wrap passFailHandle
          
    void createMaskWidth: unsigned_int Height: unsigned_int BitsPerComponent: unsigned_int BitsPerPixel: unsigned_int \
          BytesPerRow: unsigned_int DataProvider: CGDataProvider \
          ShouldInterpolate: bool \
          = CGImage {quartz image deadCopy} call CGImageMaskCreate_wrap 
          
    CGImage createCopy = CGImage { quartz image deadCopy } call CGImageCreateCopy
    
    void createWithJPEGDataProvider: CGDataProvider DecodeArray: oop objVector ShouldInterpolate: bool \
           ColorRenderingIntent: unsigned_int \
            = CGImage { quartz image deadCopy } call CGImageCreateWithJPEGDataProvider_wrap passFailHandle
            
    void createWithJPEGDataProvider: CGDataProvider ShouldInterpolate: bool \
           ColorRenderingIntent: unsigned_int \
            = CGImage { quartz image deadCopy } call CGImageCreateWithJPEGDataProvider_wrap 
            
    void createWithPNGDataProvider: CGDataProvider DecodeArray: oop objVector ShouldInterpolate: bool \
           ColorRenderingIntent: unsigned_int \
            = CGImage { quartz image deadCopy } call CGImageCreateWithPNGDataProvider_wrap passFailHandle
            
    void createWithPNGDataProvider: CGDataProvider ShouldInterpolate: bool \
           ColorRenderingIntent: unsigned_int \
            = CGImage { quartz image deadCopy } call CGImageCreateWithPNGDataProvider_wrap 
            

    CGImage createWithImageInRect_X: float Y: float Width: float Height: float \
              = CGImage { quartz image deadCopy } call CGImageCreateWithImageInRect_wrap
    
    CGImage createWithMask: CGImage = CGImage {quartz image deadCopy } call CGImageCreateWithMask
    CGImage createWithMaskingColors_MinC1: float MaxC1: float MinC2: float MaxC2: float \
                                    MinC3: float MaxC3: float MinC4: float MaxC4: float \
                                    = CGImage {quartz image deadCopy } call CGImageCreateWithMaskingColors_wrap

    CGImage createCopyWithColorSpace: CGColorSpace = CGImage {quartz image deadCopy} call CGImageCreateCopyWithColorSpace
    
    CGImage retain = void call CGImageRetain
    CGImage release = void call CGImageRelease
    CGImage isMask = bool call CGImageIsMask
    CGImage width  = unsigned_int call CGImageGetWidth
    CGImage height = unsigned_int call CGImageGetHeight
    CGImage bitsPerComponent = unsigned_int call CGImageGetBitsPerComponent
    CGImage bitsPerPixel = unsigned_int call CGImageGetBitsPerPixel
    CGImage bytesPerRow = unsigned_int call CGImageGetBytesPerRow
    CGImage colorSpace = CGColorSpace { quartz colorSpace deadCopy } call CGImageGetColorSpace
    CGImage alphaInfo = unsigned_int call CGImageGetAlphaInfo
    CGImage dataProvider = CGDataProvider {quartz dataProvider deadCopy} call CGImageGetDataProvider
    // CGImage decodeArray = float-array call CGImageGetDecode
    CGImage getShouldInterpolate = bool call CGImageGetShouldInterpolate
    CGImage bitmapInfo = unsigned_int call CGImageGetBitmapInfo
    
traits: traits quartz imageSource
visibility: publicSlot
    void createWithURL: cbv_len u_char* = CGImageSource {quartz imageSource deadCopy} call CGImageSourceCreateWithURL_wrap 
    CGImageSource release = void call CFRelease
    CGImageSource createImageAt: unsigned_int = CGImage {quartz image deadCopy} call CGImageSourceCreateImageAtIndex_wrap
    CGImageSource getCount = unsigned_int call CGImageSourceGetCount

traits: traits quartz colorSpace
visibility: publicSlot

    // kCGColorSpaceGenericGray
    // kCGColorSpaceGenericRGB
    // kCGColorSpaceGenericCMYK
    
    void getTypeID = unsigned_int call CGColorSpaceGetTypeID
    
    void createDeviceGray = CGColorSpace { quartz colorSpace deadCopy } call CGColorSpaceCreateDeviceGray
    void createDeviceRGB  = CGColorSpace { quartz colorSpace deadCopy } call CGColorSpaceCreateDeviceRGB
    void createDeviceCMYK = CGColorSpace { quartz colorSpace deadCopy } call CGColorSpaceCreateDeviceCMYK
    // CGColorSpaceCreateCalibratedGray
    // CGColorSpaceCreateCalibratedRGB
    // CGColorSpaceCreateLab
    // CGColorSpaceCreateICCBased
    
    void createIndexedBasedOn: CGColorSpace ColorTable: cbv_len u_char* = CGColorSpace { quartz colorSpace deadCopy } call CGColorSpaceCreateIndexed_wrap
    CGColorSpace createPattern = CGColorSpace { quartz colorSpace deadCopy } call CGColorSpaceCreatePattern
    
    // CGColorSpaceCreateWithPlatformColorSpace
    
    void createGenericGray = CGColorSpace {quartz colorSpace deadCopy} call CGColorSpaceCreateGenericGray_wrap
    void createGenericRGB  = CGColorSpace {quartz colorSpace deadCopy} call CGColorSpaceCreateGenericRGB_wrap
    void createGenericCMYK = CGColorSpace {quartz colorSpace deadCopy} call CGColorSpaceCreateGenericCMYK_wrap
    
    CGColorSpace numberOfComponents = unsigned_int call CGColorSpaceGetNumberOfComponents

    CGColorSpace retain  = void call CGColorSpaceRetain
    CGColorSpace release = void call CGColorSpaceRelease

traits: traits quartz dataProvider
    void getTypeID = unsigned_int call CGDataProviderGetTypeID
    // CGDataProviderCreate
    void createForBytes: cbv_len u_char* = CGDataProvider {quartz dataProvider deadCopy} call CGDataProviderCreateFromBV
    
    void createFromURL: cbv_len u_char* = CGDataProvider {quartz dataProvider deadCopy} call CGDataProviderCreateFromURL_wrap

    CGDataProvider retain  = void call CGDataProviderRetain
    CGDataProvider release = void call CGDataProviderRelease
    
traits: traits quartz pattern
 visibility: publicSlot
 
    
    
traits: traits quartz event
  visibility: publicSlot    
    

    OpaqueEventRef release = void call ReleaseEvent
    OpaqueEventRef getClass = oop call GetEventClass_wrap
    OpaqueEventRef getKind = unsigned_int call GetEventKind
    OpaqueEventRef getSecondsSinceBoot = float call GetEventTime

    OpaqueEventRef getUnsignedParam:  cbv_len uint32* Type: cbv_len uint32* = unsigned_int call GetEventParam_uint32 passFailHandle
    OpaqueEventRef getSignedParam: cbv_len uint32* Type: cbv_len uint32* = int call GetEventParam_int32 passFailHandle
    OpaqueEventRef getUnsignedShortParam:  cbv_len uint32* Type: cbv_len uint32* = unsigned_int call GetEventParam_uint16 passFailHandle
    OpaqueEventRef getSignedShortParam: cbv_len uint32* Type: cbv_len uint32* = int call GetEventParam_int16 passFailHandle
    OpaqueEventRef getUnsignedCharParam:  cbv_len uint32* Type: cbv_len uint32* = unsigned_int call GetEventParam_uint8 passFailHandle
    OpaqueEventRef getBooleanParam: cbv_len uint32* Type: cbv_len uint32* = unsigned_int call GetEventParam_Boolean passFailHandle

    OpaqueEventRef getWindowParam: cbv_len uint32* Type: cbv_len uint32* = OpaqueWindowPtr {quarz window deadCopy} call GetEventParam_WindowRef passFailHandle
    OpaqueEventRef getGrafParam: cbv_len uint32* Type: cbv_len uint32* = OpaqueGrafPtr {quartz graf deadCopy} call GetEventParam_GrafPtr passFailHandle
    OpaqueEventRef getEventParam: cbv_len uint32* Type: cbv_len uint32* = OpaqueEventRef {quartz event deadCopy} call GetEventParam_EventRef passFailHandle
    OpaqueEventRef getContextParam: cbv_len uint32* Type: cbv_len uint32* = CGContext {quartz context deadCopy} call GetEventParam_CGContextRef passFailHandle
    
    OpaqueEventRef raw_getPointParam: cbv_len uint32* = oop call GetEventParam_CGPoint passFailHandle
    OpaqueEventRef raw_getSizeParam: cbv_len uint32* = oop call GetEventParam_CGSize passFailHandle
    OpaqueEventRef raw_getRectParam: cbv_len uint32* = oop call GetEventParam_CGRect passFailHandle
    
    void setMouseCoalescingEnabled: bool = must_be_zero call SetMouseCoalescingEnabled_wrap
  '
