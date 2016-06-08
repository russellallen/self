'Sun-$Revision: 30.7 $'

"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."

"CAUTION: This file is not part of the documented Self world.  It may be
 be changed or removed at any time, and it will not be documented.
 This file can be removed without affecting the Self world in any way."


"Template used by primitiveMaker to create Xlib primitives."


(primitiveMaker reader copy staticLinking) create: 'xlib' Flag: 'xlib_semaphore' From: ('

  -- Copyright 1992-2012 AUTHORS.
  -- See the LICENSE file for license information.

  macroName: xlib
  glueLibraryName: xlib_glue.o


','


traits: traits xlib display
  -- display
  // XOpenDisplay and XCloseDisplay are (statically) defined in the VM
 visibility: publicSlot
  void xDisplayName: string = string call XDisplayName canAWS
  Display defaultScreen = int call DefaultScreen
 visibility: privateSlot
  Display defaultScreenOfDisplay \
	    = Screen {xlib screen deadCopy} call DefaultScreenOfDisplay 
  Display connectionNumber = int call ConnectionNumber

  -- vendor info
 visibility: publicSlot
  Display xServerVendor  = string call XServerVendor
  Display xVendorRelease = int    call XVendorRelease

  -- visual info 
 visibility: publicSlot
  Display xMatchVisualInfoScreen: int Depth: int Class: int \
    	    = XVisualInfo {xlib xVisualInfo deadCopy} \
	      call XMatchVisualInfo_wrap passFailHandle canAWS

  -- event handling
 visibility: publicSlot
  Display xEventsQueued: int     = int  call XEventsQueued canAWS
  Display xPending               = int  call XPending      canAWS
  Display xNextEventInto: XEvent = void call XNextEvent    canAWS
  Display xPeekEventInto: XEvent = void call XPeekEvent    canAWS
  Display xPutBackEvent: XEvent  = void call XPutBackEvent canAWS

  Display xCheckType: int  OfEvent: XEvent = bool call XCheckTypedEvent canAWS
  Display xCheckMask: long OfEvent: XEvent = bool call XCheckMaskEvent  canAWS

  Display xNextEventPeek: bool Protos: oop objVector \
             = oop call XNextEvent_wrap passFailHandle canAWS

  -- synchronization
  Display xFlush                  = void call XFlush       canAWS
  Display xSynchronize: bool      = void call XSynchronize canAWS
  Display xSyncDiscardingIf: bool = void call XSync	   canAWS

  -- beeping
  Display xBell: int              = void call XBell

  -- gc
  Display xChangeGC: proxy GC GC_seal \
          ValueMask: unsigned_long \
             Values: XGCValues \
            = void call XChangeGC canAWS 

  // the following uses ANY_SEAL because drawables can be pixmaps or windows
  // since pixmaps and windows are integers, this will not cause a crash
  Display xCreateGCDrawable: proxy Drawable ANY_SEAL \
                    ValueMask: unsigned_long \
                       Values: XGCValues \
            = proxy GC GC_seal {xlib graphicsContext deadCopy} \
              call XCreateGC canAWS
  Display xFreeGC: proxy GC GC_seal = void call XFreeGC canAWS

  Display xGetGCValuesGC: proxy GC GC_seal \
		 ValueMask: unsigned_long \
		    Values: XGCValues \
    	    = void call XGetGCValues_wrap passFailHandle canAWS

  Display xSetGC: proxy GC GC_seal Foreground: unsigned_long \
            = void call XSetForeground canAWS
  Display xSetGC: proxy GC GC_seal Background: unsigned_long \
            = void call XSetBackground canAWS
  Display xSetGC: proxy GC GC_seal Function: int \
            = void call XSetFunction canAWS
  Display xSetGC: proxy GC GC_seal PlaneMask: unsigned_long \
            = void call XSetPlaneMask canAWS
  Display xSetGC: proxy GC GC_seal LineAttributesWidth: unsigned_int \
					       LineStyle: int \
					        CapStyle: int \
					       JoinStyle: int \
            = void call XSetLineAttributes canAWS

  Display xSetGC: proxy GC GC_seal DashesOffset: int \
				     DashList: bv_len char* \
            = void call XSetDashes canAWS

  Display xSetGC: proxy GC GC_seal Font: proxy Font Font_seal \
            = void call XSetFont canAWS
  Display xSetGC: proxy GC GC_seal GraphicsExposures: bool \
            = void call XSetGraphicsExposures canAWS
  Display xSetGC: proxy GC GC_seal FillStyle: int \
	    = void call XSetFillStyle canAWS
  Display xSetGC: proxy GC GC_seal FillRule: int \
	    = void call XSetFillRule canAWS
  Display xSetGC: proxy GC GC_seal Stipple: proxy Pixmap Pixmap_seal \
	    = void call XSetStipple canAWS
  Display xSetGC: proxy GC GC_seal SubwindowMode: int \
	    = void call XSetSubwindowMode canAWS
  Display xSetGC: proxy GC GC_seal Tile: proxy Pixmap Pixmap_seal \
	    = void call XSetTile canAWS


  Display xSetClipOrigin: proxy GC GC_seal X: int Y: int \
            = void call XSetClipOrigin canAWS
  Display xSetClipMask: proxy GC GC_seal \
		  Pixmap: proxy_null Pixmap Pixmap_seal \
            = void call XSetClipMask canAWS
  Display xSetClipRectangle: proxy GC GC_seal \
			    X: int \
			    Y: int \
			Width: int \
		       Height: int \
            = void call XSetClipRectangle_wrap canAWS

  Display xQueryBestStippleWidth: proxy Drawable ANY_SEAL \
			     Width: int \
			    Height: int \
	    = unsigned_long call XQueryBestStippleWidth passFailHandle canAWS
  Display xQueryBestStippleHeight: proxy Drawable ANY_SEAL \
			      Width: int \
			     Height: int \
	    = unsigned_long call XQueryBestStippleHeight passFailHandle canAWS

  Display xQueryBestTileWidth: proxy Drawable ANY_SEAL \
			  Width: int \
			 Height: int \
	    = unsigned_long call XQueryBestTileWidth passFailHandle canAWS

  Display xQueryBestTileHeight: proxy Drawable ANY_SEAL \
			   Width: int \
			  Height: int \
	    = unsigned_long call XQueryBestTileHeight passFailHandle canAWS

  Display xTranslateCoordinatesSrcWindow: proxy Window Window_seal \
                               DstWindow: proxy Window Window_seal \
                             Coordinates: oop objVector \
            = proxy_null Window Window_seal {xlib window deadCopy} \
              call XTranslateCoordinates_wrap passFailHandle canAWS

  -- atom
 visibility: privateSlot
  Display xInternAtom: string OnlyIfExists: bool \
            = proxy Atom Atom_seal {xlib atom deadCopy} call XInternAtom canAWS


  -- window
 visibility: publicSlot
  Display xCreateIOWindowIn: proxy Window Window_seal \
                          X: int \
                          Y: int \
                      Width: unsigned_int \
                     Height: unsigned_int \
                      Depth: int \
		     Visual: Visual \
                 Attributes: XSetWindowAttributesWrap \
            = proxy Window Window_seal {xlib window deadCopy} \
	      call XCreateIOWindow_wrap canAWS

  Display xCreateSimpleWindowIn: proxy Window Window_seal \
                                X: int \
                                Y: int \
                            Width: unsigned_int \
                           Height: unsigned_int \
                      BorderWidth: unsigned_int \
                           Border: long \
                       Background: long \
            = proxy Window Window_seal {xlib window deadCopy} \
	      call XCreateSimpleWindow canAWS

  Display xChangeWindowAttributesIn: proxy Window Window_seal \
                         Attributes: XSetWindowAttributesWrap \
            = void call XChangeWindowAttributes_wrap canAWS

  Display xGetWindowAttributesIn: proxy Window Window_seal \
            = XWindowAttributes {xlib xWindowAttributes deadCopy} \
              call XGetWindowAttributes_wrap passFailHandle canAWS

  Display xSendEventToWindow: proxy Window Window_seal \
                         Propogate: bool \
                         EventMask: unsigned_long \
                         Event: XEvent \
            = int call XSendEvent canAWS

  Display xSetWMProtocolOfWindow: proxy Window Window_seal \
		          Protocol: proxy Atom Atom_seal \
	 = int call XSetWMProtocol_wrap canAWS
  Display xSetWMNameOfWindow: proxy Window Window_seal To: XTextProperty \
            = void call XSetWMName canAWS
  Display xSetWMIconNameOfWindow: proxy Window Window_seal To: XTextProperty \
            = void call XSetWMIconName canAWS
  Display xSetWMHintsOfWindow: proxy Window Window_seal To: XWMHints \
            = void call XSetWMHints canAWS
  Display xSetWMNormalHintsOfWindow: proxy Window Window_seal To: XSizeHints \
            = void call XSetWMNormalHints canAWS

  Display xSelectInputOfWindow: proxy Window Window_seal EventMask: long \
            = void call XSelectInput canAWS

  Display xMapWindow: proxy Window Window_seal = void call XMapWindow canAWS
  Display xRaiseWindow: proxy Window Window_seal \
            = void call XRaiseWindow canAWS
  Display xLowerWindow: proxy Window Window_seal \
            = void call XLowerWindow canAWS
  Display xMoveWindow: proxy Window Window_seal X: int Y: int \
	    = void call XMoveWindow canAWS
  Display xMoveWindowBy: proxy Window Window_seal X: int Y: int \
	    = void call XMoveWindowBy_wrap canAWS
  Display xMoveWindow: proxy Window Window_seal ByX: int Y: int \
	    = void call XMoveWindowBy_wrap canAWS
  Display xMoveResizeWindow: proxy Window Window_seal \
                          X: int Y: int W: int H: int \
            = void call XMoveResizeWindow

  Display xSetInputFocusWindow: proxy Window Window_seal \
                      RevertTo: int \
                          Time: int \
            = void call XSetInputFocus

  Display xUnmapWindow: proxy Window Window_seal \
            = void call XUnmapWindow canAWS

  Display xDestroyWindow: proxy Window Window_seal \
            = void call XDestroyWindow canAWS


  -- subwindows
  Display xCirculateSubwindows: proxy Window Window_seal Direction: int \
	    = void call XCirculateSubwindows
  Display xCirculateSubwindowsDown: proxy Window Window_seal \
	    = void call XCirculateSubwindowsDown
  Display xCirculateSubwindowsUp: proxy Window Window_seal \
	    = void call XCirculateSubwindowsUp

  Display xMapSubwindows: proxy Window Window_seal \
	    = void call XMapSubwindows
  Display xUnmapSubwindows: proxy Window Window_seal \
	    = void call XUnmapSubwindows
  Display xDestroySubwindows: proxy Window Window_seal \
	    = void call XDestroySubwindows

  
  -- cursor
  Display xWarpPointerSrcWindow: proxy_null Window Window_seal \
                       DestWindow: proxy_null Window Window_seal \
                             SrcX: int \
                             SrcY: int \
                         SrcWidth: unsigned_int \
                        SrcHeight: unsigned_int \
                            DestX: int \
                            DestY: int \
            = void call XWarpPointer canAWS

  Display xGrabPointerWindow: proxy Window Window_seal \
                   OwnerEvents: bool \
                     EventMask: unsigned_int \
                   PointerMode: int \
                  KeyboardMode: int \
                     ConfineTo: proxy_null Window Window_seal \
                        Cursor: proxy_null Cursor Cursor_seal \
                          Time: unsigned_long \
            = int call XGrabPointer  canAWS                        
  Display xUngrabPointerTime: unsigned_long = void call XUngrabPointer canAWS

  Display xUngrabButton: int \
              Modifiers: int \
                 Window: proxy Window Window_seal \
     = void call XUngrabButton canAWS

  Display xDefineCursorWindow: proxy      Window Window_seal \
                         Cursor: proxy_null Cursor Cursor_seal \
            = void call XDefineCursor canAWS
  Display xUndefineCursorWindow: proxy Window Window_seal \
            = void call XUndefineCursor canAWS

  Display xCreatePixmapCursorSource: proxy      Pixmap Pixmap_seal \
                                 Mask: proxy_null Pixmap Pixmap_seal \
                      ForegroundColor: XColor \
                      BackgroundColor: XColor \
                                    X: unsigned_int \
                                    Y: unsigned_int \
            = proxy Cursor Cursor_seal {xlib cursor deadCopy} \
              call XCreatePixmapCursor canAWS
  Display xFreeCursor: proxy Cursor Cursor_seal = void call XFreeCursor canAWS

  Display xCreateFontCursorType: int \
            = proxy Cursor Cursor_seal {xlib cursor deadCopy} \
              call XCreateFontCursor


  -- colormap
  Display xCreateColormapWindow: proxy Window Window_seal \
                           Visual: Visual \
                         Allocate: bool \
            = proxy Colormap Colormap_seal {xlib colormap deadCopy} \
              call XCreateColormap canAWS
  Display xFreeColormap: proxy Colormap Colormap_seal \
            = void call XFreeColormap canAWS

  Display xSetWindow: proxy Window Window_seal \
              Colormap: proxy Colormap Colormap_seal \
            = void call XSetWindowColormap canAWS

  Display xQueryColorsInColormap: proxy Colormap Colormap_seal \
                    Colors: oop objVector \
            = void call XQueryColors_wrap passFailHandle canAWS
  Display xStoreColorsInColormap: proxy Colormap Colormap_seal \
                    Colors: oop objVector \
            = void call XStoreColors_wrap passFailHandle canAWS

  Display xQueryColorInColormap: proxy Colormap Colormap_seal Color: XColor \
            = void call XQueryColor canAWS
  Display xStoreColorInColormap: proxy Colormap Colormap_seal Color: XColor \
            = void call XStoreColor canAWS

  Display xAllocColorInColormap: proxy Colormap Colormap_seal \
	          Color: XColor \
	    = int call XAllocColor canAWS

  Display xAllocColorCellsInColormap: proxy Colormap Colormap_seal \
				Contig: bool \
		      PlaneMasksReturn: oop objVector \
			  PixelsReturn: oop objVector \
	    = void call XAllocColorCells_wrap passFailHandle canAWS

  Display xFreeColorCellsInColormap: proxy Colormap Colormap_seal \
			       Pixels: oop objVector \
			       Planes: unsigned_long \
	    = void call XFreeColorCells_wrap passFailHandle canAWS

  -- pixmap
  // the following uses ANY_SEAL because drawables can be pixmaps or windows
  // since pixmaps and windows are integers, this will not cause a crash
  Display xCreateBitmapDrawable: proxy Drawable ANY_SEAL \
                             Data: cbv char* \
                            Width: unsigned_int \
                           Height: unsigned_int \
            = proxy Pixmap Pixmap_seal {xlib pixmap deadCopy} \
	      call XCreateBitmapFromData canAWS

  // the following uses ANY_SEAL because drawables can be pixmaps or windows
  // since pixmaps and windows are integers, this will not cause a crash
  Display xCreatePixmap: proxy Drawable ANY_SEAL \
    	    	    Width: unsigned_int \
		   Height: unsigned_int \
		    Depth: unsigned_int \
    	    = proxy Pixmap Pixmap_seal {xlib pixmap deadCopy} \
	      call XCreatePixmap canAWS
  Display xFreePixmap: proxy Pixmap Pixmap_seal \
            = void call XFreePixmap canAWS

  -- shapes
  Display xShapeQueryExtension \
            = bool call XShapeQueryExtension_wrap canAWS

  Display xShapeCombineRegion: proxy Drawable ANY_SEAL \
		     DestKind: int \
			    X: int \
			    Y: int \
		       Region: proxy Region Region_seal \
		    Operation: int \
            = void call XShapeCombineRegion_wrap canAWS

  // Note: Mask must be a Pixmap with depth of 1
  Display xShapeCombineMask: proxy Drawable ANY_SEAL \
		     DestKind: int \
			    X: int \
			    Y: int \
                         Mask: proxy_null Pixmap Pixmap_seal \
		    Operation: int \
            = void call XShapeCombineMask_wrap canAWS

  Display xShapeCombineShape: proxy Drawable ANY_SEAL \
		    DestKind: int \
			   X: int \
			   Y: int \
		       Shape: proxy Drawable ANY_SEAL \
		   ShapeKind: int \
		   Operation: int \
            = void call XShapeCombineShape_wrap canAWS

  Display xShapeCombineRectangle: proxy Drawable ANY_SEAL \
			DestKind: int \
			       X: int \
			       Y: int \
			   Width: unsigned_int \
			  Height: unsigned_int \
		       Operation: int \
            = void call XShapeCombineRectangle_wrap canAWS

','

  -- drawing
  // the following uses ANY_SEAL because drawables can be pixmaps or windows
  // since pixmaps and windows are integers, this will not cause a crash

  Display xClearAreaIn: proxy Window Window_seal \
                     X: int Y: int Width: unsigned_int Height: unsigned_int \
             Exposures: bool \
    	    = void call XClearArea canAWS

  Display xCopyAreaSrc: proxy Drawable ANY_SEAL \
		    Dest: proxy Drawable ANY_SEAL \
		      GC: proxy GC GC_seal \
		    SrcX: int \
		    SrcY: int \
		   Width: unsigned_int \
		  Height: unsigned_int \
		   DestX: int \
		   DestY: int \
    	    = void call XCopyArea canAWS

  Display xDrawPoint: proxy Drawable ANY_SEAL \
		    GC: proxy GC GC_seal \
		     X: int \
		     Y: int \
    	    = void call XDrawPoint canAWS

  Display xDrawLine: proxy Drawable ANY_SEAL \
		   GC: proxy GC GC_seal \
		   X1: int \
		   Y1: int \
		   X2: int \
		   Y2: int \
	    = void call XDrawLine canAWS

  Display xDrawLines: proxy Drawable ANY_SEAL \
		    GC: proxy GC GC_seal \
	            Xs: oop objVector \
		    Ys: oop objVector \
	          Mode: int \
	    = void call XDrawLines_wrap passFailHandle canAWS

  Display xDrawRectangle: proxy Drawable ANY_SEAL \
			GC: proxy GC GC_seal \
			 X: int \
			 Y: int \
		     Width: unsigned_int \
		    Height: unsigned_int \
    	    = void call XDrawRectangle canAWS

  Display xFillRectangle: proxy Drawable ANY_SEAL \
			GC: proxy GC GC_seal \
			 X: int \
			 Y: int \
		     Width: unsigned_int \
		    Height: unsigned_int \
    	    = void call XFillRectangle canAWS

  Display xFillPolygon: proxy Drawable ANY_SEAL \
		      GC: proxy GC GC_seal \
		      Xs: oop objVector \
		      Ys: oop objVector \
		   Shape: int \
		    Mode: int \
    	    = void call XFillPolygon_wrap passFailHandle canAWS

  Display xDrawArc: proxy Drawable ANY_SEAL \
    	       	  GC: proxy GC GC_seal \
		   X: int \
		   Y: int \
	       Width: unsigned_int \
	      Height: unsigned_int \
	  StartAngle: int \
	    EndAngle: int \
    	    = void call XDrawArc canAWS

  Display xFillArc: proxy Drawable ANY_SEAL \
    	       	  GC: proxy GC GC_seal \
		   X: int \
		   Y: int \
	       Width: unsigned_int \
	      Height: unsigned_int \
	  StartAngle: int \
	    EndAngle: int \
    	    = void call XFillArc canAWS

  Display xDrawString: proxy Drawable ANY_SEAL \
	           GC: proxy GC GC_seal \
	            X: int \
	            Y: int \
	       String: string_len_null \
	    = void call XDrawString canAWS

  Display xDrawString16: proxy Drawable ANY_SEAL \
                     GC: proxy GC GC_seal \
                      X: int \
                      Y: int \
           StringVector: oop objVector \
             = void call XDrawString16_wrap passFailHandle canAWS 

  -- font
  Display xQueryFont: proxy Font Font_seal \
    	    = XFontStruct {xlib xFontStruct deadCopy} \
	      call XQueryFont canAWS
  Display xLoadQueryFont: string_null \
    	    = XFontStruct {xlib xFontStruct deadCopy} \
	      call XLoadQueryFont_wrap passFailHandle canAWS
  Display xFreeFont: XFontStruct = void call XFreeFont canAWS


  -- image
  Display xCreateImage: Visual \
		   Depth: unsigned_int \
		  Format: int \
		   Width: unsigned_int \
		  Height: unsigned_int \
	       BitmapPad: int \
    	    = XImage {xlib xImage deadCopy} call XCreateImage_wrap canAWS

  Display xGetImage: proxy Drawable ANY_SEAL \
		    X: int \
		    Y: int \
		Width: unsigned_int \
	       Height: unsigned_int \
	    PlaneMask: unsigned_long \
	       Format: int \
    	    = XImage {xlib xImage deadCopy} call XGetImage canAWS

  Display xPutImage: proxy Drawable ANY_SEAL \
                   GC: proxy GC GC_seal \
                Image: XImage \
		 SrcX: int \
		 SrcY: int \
		DestX: int \
		DestY: int \
		Width: unsigned_int \
	       Height: unsigned_int \
    	    = void call XPutImage canAWS

  Display xGetSubImage: proxy Drawable ANY_SEAL \
		       X: int \
		       Y: int \
		   Width: unsigned_int \
		  Height: unsigned_int \
	       PlaneMask: unsigned_long \
		  Format: int \
	       DestImage: XImage \
	           DestX: int \
		   DestY: int \
	    = XImage {xlib xImage deadCopy} call XGetSubImage canAWS


  -- cut and paste buffers
  Display xStoreBytes: string \
    	    = void call XStoreBytes_wrap passFailHandle canAWS

  Display xFetchBytes \
    	    = string call XFetchBytes_wrap passFailHandle canAWS

','



traits: traits xlib window
 visibility: publicSlot
  void nullWindow \
    	    = proxy_null Window Window_seal {xlib window deadCopy} get NULL 



traits: traits xlib window
 visibility: publicSlot
  proxy_null int Window_seal windowDescriptor = int call MYSELF



traits: traits xlib pixmap
 visibility: publicSlot
  void nullPixmap \
    	    = proxy_null Pixmap Pixmap_seal {xlib pixmap deadCopy} get NULL 



','


traits: traits xlib region
 visibility: publicSlot
  void nullRegion \
    	    = proxy_null Region Region_seal {xlib region deadCopy} get NULL 
  void xCreateRegion = proxy Region Region_seal {xlib region deadCopy} \
	      call XCreateRegion_wrap canAWS
  proxy Region Region_seal xDestroyRegion = void call XDestroyRegion_wrap canAWS

  proxy Region Region_seal xEmptyRegion = bool call XEmptyRegion_wrap canAWS

  proxy Region Region_seal xEqualRegion: proxy Region Region_seal \
	   = bool call XEqualRegion_wrap canAWS

  proxy Region Region_seal xUnionRegion: proxy Region Region_seal \
		Region: proxy Region Region_seal \
            = void call XUnionRegion_wrap canAWS

  proxy Region Region_seal xUnionRectWithRegion: proxy Region Region_seal \
			     X: int \
			     Y: int \
    	  	  	 Width: unsigned_int \
			Height: unsigned_int \
            = void call XUnionRectWithRegion_wrap canAWS

  proxy Region Region_seal xIntersectRegion: proxy Region Region_seal \
		    Region: proxy Region Region_seal \
            = void call XIntersectRegion_wrap canAWS

  proxy Region Region_seal xXorRegion: proxy Region Region_seal \
	      Region: proxy Region Region_seal \
            = void call XXorRegion_wrap canAWS

  proxy Region Region_seal xSubtractRegion: proxy Region Region_seal \
		   Region: proxy Region Region_seal \
            = void call XSubtractRegion_wrap canAWS

  proxy Region Region_seal xOffsetX: int Y: int \
            = void call XOffsetRegion_wrap canAWS

','



traits: traits xlib cursor
 visibility: publicSlot
  void nullCursor \
    	    = proxy_null Cursor Cursor_seal {xlib cursor deadCopy} get NULL 



traits: traits xlib screen
 visibility: publicSlot
  Screen rootWindowOfScreen \
            = proxy Window Window_seal {xlib window deadCopy} \
	      call RootWindowOfScreen
  Screen defaultVisualOfScreen \
            = Visual {xlib visual deadCopy} call DefaultVisualOfScreen
  Screen defaultGCOfScreen \
            = proxy GC GC_seal {xlib graphicsContext deadCopy} \
	      call DefaultGCOfScreen
  Screen defaultColormapOfScreen \
	    = proxy Colormap Colormap_seal {xlib colormap deadCopy} \
	      call DefaultColormapOfScreen

  Screen blackPixelOfScreen = long call BlackPixelOfScreen
  Screen whitePixelOfScreen = long call WhitePixelOfScreen

  Screen widthOfScreen        = int call WidthOfScreen
  Screen widthMMOfScreen      = int call WidthMMOfScreen
  Screen heightOfScreen       = int call HeightOfScreen
  Screen defaultDepthOfScreen = int call DefaultDepthOfScreen

  Screen xScreenNumberOfScreen = int call XScreenNumberOfScreen canAWS



traits: traits xlib xVisualInfo
 visibility: publicSlot
  void new = XVisualInfo {xlib xVisualInfo deadCopy} new
  XVisualInfo delete = void delete

  XVisualInfo        visual = Visual {xlib visual deadCopy} getMember visual
  XVisualInfo      visualID = int getMember visualid
  XVisualInfo visualID: int = void setMember visualid
  XVisualInfo        screen = int getMember screen
  XVisualInfo         depth = int getMember depth
  XVisualInfo    depth: int = void setMember depth
  // next field assumes c++ compilation, change to getMember class for c
  XVisualInfo         class = int getMember c_class   	
  XVisualInfo      red_mask = unsigned_long getMember red_mask
  XVisualInfo    green_mask = unsigned_long getMember green_mask
  XVisualInfo     blue_mask = unsigned_long getMember blue_mask
  XVisualInfo     cmap_size = int getMember colormap_size
  XVisualInfo  bits_per_rgb = int getMember bits_per_rgb



traits: traits xlib xFontStruct
 visibility: publicSlot
  XFontStruct xTextWidth: string_len_null = int call XTextWidth canAWS
  XFontStruct fid               = proxy Font Font_seal {xlib font deadCopy} \
			            getMember fid
  XFontStruct ascent            = int  getMember ascent
  XFontStruct descent           = int  getMember descent
  XFontStruct max_char_or_byte2 = int  getMember max_char_or_byte2
  XFontStruct min_char_or_byte2 = int  getMember min_char_or_byte2
  XFontStruct per_char          = bool getMember per_char

  XFontStruct maxCharWidth      = int call maxCharWidth
  XFontStruct maxAscent         = int call maxAscent
  XFontStruct maxDescent        = int call maxDescent
  XFontStruct perCharWidth: int = int call perCharWidth


traits: traits xlib visual
 visibility: publicSlot
  Visual xVisualIDFromVisual = int call XVisualIDFromVisual

traits: traits xlib xCharStruct
 visibility: publicSlot
  XCharStruct width   = int getMember width
  XCharStruct ascent  = int getMember ascent
  XCharStruct descent = int getMember descent



traits: traits xlib xGCValues
 visibility: publicSlot
  void new = XGCValues {xlib xGCValues deadCopy} new
  XGCValues delete = void delete

  XGCValues function     = int getMember function
  XGCValues plane_mask	 = unsigned_long getMember plane_mask
  XGCValues foreground	 = unsigned_long getMember foreground
  XGCValues background	 = unsigned_long getMember background
  XGCValues line_width	 = int getMember line_width
  XGCValues fill_style	 = int getMember fill_style
  XGCValues fill_rule    = int getMember fill_rule
  XGCValues graphics_exposures = bool getMember graphics_exposures
  XGCValues font	 = proxy Font Font_seal {xlib font deadCopy} \
			   getMember font
  XGCValues stipple      = proxy Pixmap Pixmap_seal {xlib pixmap deadCopy } \
			   getMember stipple
  XGCValues tile         = proxy Pixmap Pixmap_seal {xlib pixmap deadCopy } \
			   getMember tile

  XGCValues font:       proxy Font Font_seal = void setMember font
  XGCValues background: unsigned_long        = void setMember background
  XGCValues foreground: unsigned_long        = void setMember foreground
  XGCValues function: int                    = void setMember function


traits: traits xlib xColor
 visibility: publicSlot
  void new = XColor {xlib xColor deadCopy} new
  XColor delete = void delete

  XColor pixel = int  getMember pixel
  XColor red   = int  getMember red
  XColor green = int  getMember green
  XColor blue  = int  getMember blue
  XColor flags = char getMember flags

  XColor pixel: int  = void setMember pixel
  XColor red:   int  = void setMember red
  XColor green: int  = void setMember green
  XColor blue:  int  = void setMember blue
  XColor flags: char = void setMember flags



traits: traits xlib xImage
 visibility: publicSlot
  XImage xGetPixelX: int Y: int = unsigned_long call XGetPixel canAWS
  XImage xPutPixelX: int Y: int Value: unsigned_long = void call XPutPixel canAWS

  XImage xSubImageX: int Y: int Width: unsigned_int Height: unsigned_int \
	    = XImage {xlib xImage deadCopy} call XSubImage canAWS

  XImage xImagePutData: bv_len char* MappedBy: oop objVector \
    	    = void call XImagePutData_wrap canAWS passFailHandle

  XImage xImageGetData: bv_len char* \
    	    = void call XImageGetData_wrap canAWS

  XImage xDestroyImage = void call XDestroyImage canAWS
', '


traits: traits xlib events xEvent
 visibility: publicSlot
  void new = XEvent {xlib events xEvent deadCopy} new
 visibility: privateSlot
  XEvent basicDelete = void delete
 visibility: publicSlot
  XEvent type = int getMember type

traits: traits xlib events xButtonEvent
 visibility: publicSlot
  XButtonEvent rawTime = oop call xButtonEvent_time
  XButtonEvent x       = int getMember x
  XButtonEvent y       = int getMember y
  XButtonEvent x_root  = int getMember x_root
  XButtonEvent y_root  = int getMember y_root
  XButtonEvent state   = unsigned_int getMember state
  XButtonEvent button  = unsigned_int getMember button
  XButtonEvent window  = proxy Window Window_seal {xlib window deadCopy} \
                          getMember window



traits: traits xlib events xClientMessageEvent
 visibility: publicSlot
  void new = XClientMessageEvent {xlib events xClientMessageEvent deadCopy} new
  XClientMessageEvent type: int = void setMember type
  XClientMessageEvent serial = unsigned_int getMember serial
  XClientMessageEvent serial: unsigned_int = void setMember serial
  XClientMessageEvent sendEvent = bool getMember send_event
  XClientMessageEvent sendEvent: bool = void setMember send_event
  XClientMessageEvent display = Display {xlib display deadCopy} getMember display
  XClientMessageEvent display: Display = void setMember display
  XClientMessageEvent window \
	= proxy Window Window_seal {xlib window deadCopy} getMember window
  XClientMessageEvent window: proxy Window Window_seal = void setMember window
  XClientMessageEvent message_type \
        = proxy Atom Atom_seal {xlib atom deadCopy} getMember message_type
  XClientMessageEvent message_type: proxy Atom Atom_seal \
        = void setMember message_type
  XClientMessageEvent format = int getMember format
  XClientMessageEvent format: int = void setMember format
  XClientMessageEvent atomAt: unsigned_int \
        = proxy Atom Atom_seal {xlib atom deadCopy} \
	  call XClientMessageEvent_atomAt_wrap passFailHandle
  XClientMessageEvent at: unsigned_int Atom: proxy Atom Atom_seal \
        = void call XClientMessageEvent_at_Atom_wrap passFailHandle
  XClientMessageEvent at: unsigned_int Long: long \
        = void call XClientMessageEvent_at_Long_wrap passFailHandle
 visibility: privateSlot
  XClientMessageEvent basicDelete = void delete


traits: traits xlib events xColormapEvent
 visibility: publicSlot
  XColormapEvent c_new   = bool getMember c_new
  XColormapEvent state   = unsigned_int getMember state
  XColormapEvent window  = proxy Window Window_seal {xlib window deadCopy} \
                             getMember window



traits: traits xlib events xConfigureEvent
 visibility: publicSlot
  XConfigureEvent x       = int getMember x
  XConfigureEvent y       = int getMember y
  XConfigureEvent width   = int getMember width 
  XConfigureEvent height  = int getMember height
  XConfigureEvent display = Display {xlib display deadCopy} getMember display
  XConfigureEvent window  = proxy Window Window_seal {xlib window deadCopy} \
                             getMember window



traits: traits xlib events xCrossingEvent
 visibility: publicSlot
  XCrossingEvent rawTime = oop call xCrossingEvent_time
  XCrossingEvent window  = proxy Window Window_seal {xlib window deadCopy} \
                             getMember window
  XCrossingEvent x       = int getMember x
  XCrossingEvent y       = int getMember y



traits: traits xlib events xExposeEvent
 visibility: publicSlot
  XExposeEvent x      = int getMember x
  XExposeEvent y      = int getMember y
  XExposeEvent width  = int getMember width 
  XExposeEvent height = int getMember height
  XExposeEvent count  = int getMember count
  XExposeEvent window = proxy Window Window_seal {xlib window deadCopy} \
                          getMember window


traits: traits xlib events xFocusChangeEvent
 visibility: publicSlot
  XFocusChangeEvent serial  = unsigned_long getMember serial
  XFocusChangeEvent display = Display {xlib display deadCopy} getMember display
  XFocusChangeEvent window  = proxy Window Window_seal {xlib window deadCopy} \
                              getMember window
  XFocusChangeEvent mode    = int getMember mode
  XFocusChangeEvent detail  = int getMember detail


traits: traits xlib events xGraphicsExposeEvent
 visibility: publicSlot
  XGraphicsExposeEvent x      = int getMember x
  XGraphicsExposeEvent y      = int getMember y
  XGraphicsExposeEvent width  = int getMember width 
  XGraphicsExposeEvent height = int getMember height
  XGraphicsExposeEvent count  = int getMember count
  // the next can return either a pixmap or a window (ie, any drawable).
  // current glue cannot handle this kind of thing.  to get at this member, you
  // will need to write a C wrapper that will return the right kind of proxy.
  // XGraphicsExposeEvent drawable \
  //   	    = proxy Window Window_seal {xlib window deadCopy} getMember drawable



traits: traits xlib events xKeyEvent
 visibility: publicSlot
  XKeyEvent rawTime = oop call xKeyEvent_time
  XKeyEvent x       = int getMember x
  XKeyEvent y       = int getMember y
  XKeyEvent x_root  = int getMember x_root
  XKeyEvent y_root  = int getMember y_root
  XKeyEvent state   = unsigned_int getMember state
  XKeyEvent keycode = unsigned_int getMember keycode
  XKeyEvent window  = proxy Window Window_seal {xlib window deadCopy} \
                        getMember window

  XKeyEvent xLookupStringReturn: bv_len char* KeySymReturn: oop objVector \
    	    = int call XLookupString_wrap canAWS



traits: traits xlib events xMapEvent
 visibility: publicSlot
  XMapEvent window = proxy Window Window_seal {xlib window deadCopy} \
		       getMember window



traits: traits xlib events xMotionEvent
 visibility: publicSlot
  XMotionEvent rawTime = oop call xMotionEvent_time
  XMotionEvent x       = int getMember x
  XMotionEvent y       = int getMember y
  XMotionEvent x_root  = int getMember x_root
  XMotionEvent y_root  = int getMember y_root
  XMotionEvent state   = unsigned_int getMember state
  XMotionEvent is_hint = char getMember is_hint
  XMotionEvent window  = proxy Window Window_seal {xlib window deadCopy} \
                           getMember window



traits: traits xlib events xNoExposeEvent
 visibility: publicSlot
  // the next can return either a pixmap or a window (ie, any drawable).
  // current glue cannot handle this kind of thing.  to get at this member, you
  // will need to write a C wrapper that will return the right kind of proxy.
  // XNoExposeEvent drawable
  //        = proxy Window Window_seal {xlib window deadCopy} getMember drawable



traits: traits xlib events xReparentEvent
 visibility: publicSlot
  XReparentEvent x      = int getMember x
  XReparentEvent y      = int getMember y
  XReparentEvent window = proxy Window Window_seal {xlib window deadCopy} \
			    getMember window
  XReparentEvent parent_window \
    	    = proxy Window Window_seal {xlib window deadCopy} getMember parent



traits: traits xlib events xUnmapEvent
 visibility: publicSlot
  XUnmapEvent window = proxy Window Window_seal {xlib window deadCopy} \
                         getMember window



traits: traits xlib events xVisibilityEvent
 visibility: publicSlot
  XVisibilityEvent state  = unsigned_int getMember state
  XVisibilityEvent window = proxy Window Window_seal {xlib window deadCopy} \
                              getMember window


', '


traits: traits xlib xSizeHints
 visibility: publicSlot
  void new = XSizeHints {xlib xSizeHints deadCopy} call XAllocSizeHints
  XSizeHints delete = void call XFree_XSizeHints_wrap canAWS

  XSizeHints flags = long getMember flags

  XSizeHints min_width  = int getMember min_width
  XSizeHints min_height = int getMember min_height
  XSizeHints max_width  = int getMember max_width
  XSizeHints max_height = int getMember max_height
  XSizeHints x          = int getMember x
  XSizeHints y          = int getMember y

  XSizeHints flags: long = void setMember flags

  XSizeHints min_width:  int = void setMember min_width
  XSizeHints min_height: int = void setMember min_height
  XSizeHints max_width:  int = void setMember max_width
  XSizeHints max_height: int = void setMember max_height
  XSizeHints x: int          = void setMember x
  XSizeHints y: int          = void setMember y


traits: traits xlib xWMHints
 visibility: publicSlot
  void new = XWMHints {xlib xWMHints deadCopy} call XAllocWMHints      
  XWMHints delete = void call XFree_XWMHints_wrap canAWS

  XWMHints flags         = long getMember flags
  XWMHints input         = bool getMember input
  XWMHints initial_state = int getMember initial_state
  XWMHints icon_x        = int getMember icon_x
  XWMHints icon_y        = int getMember icon_y
  XWMHints icon_pixmap   = proxy Pixmap Pixmap_seal {xlib pixmap deadCopy} \
                             getMember icon_pixmap
  XWMHints icon_window   = proxy Window Window_seal {xlib window deadCopy} \
                             getMember icon_window
  XWMHints icon_mask     = proxy Pixmap Pixmap_seal {xlib pixmap deadCopy} \
                             getMember icon_mask

  XWMHints flags: long        = void setMember flags
  XWMHints input: bool	= void setMember input
  XWMHints initial_state: int = void setMember initial_state
  XWMHints icon_x: int        = void setMember icon_x
  XWMHints icon_y: int	= void setMember icon_y
  XWMHints icon_pixmap: proxy Pixmap Pixmap_seal = void setMember icon_pixmap
  XWMHints icon_window: proxy Window Window_seal = void setMember icon_window
  XWMHints icon_mask:   proxy Pixmap Pixmap_seal = void setMember icon_mask



traits: traits xlib xTextProperty
 visibility: publicSlot
  void new = XTextProperty {xlib xTextProperty deadCopy} new
 visibility: privateSlot
  void freeValue: proxy {char*} XTextProperty_value_seal = void call XFree 
  XTextProperty basicDelete = void delete
  XTextProperty value \
    	    = proxy {unsigned char*} XTextProperty_value_seal {proxy deadCopy} \
	      getMember value
 visibility: publicSlot
  XTextProperty xStringToTextProperty: string \
    	    = int call XStringToTextProperty_wrap canAWS


traits: traits xlib xWindowAttributes
 visibility: publicSlot
  XWindowAttributes delete          = void delete
  XWindowAttributes x               = int getMember x
  XWindowAttributes y               = int getMember y
  XWindowAttributes width           = int getMember width
  XWindowAttributes height          = int getMember height
  XWindowAttributes border_width    = int getMember border_width
  XWindowAttributes depth           = int getMember depth
  XWindowAttributes visual = Visual {xlib visual deadCopy} getMember visual

  XWindowAttributes root \
       = proxy Window Window_seal {xlib window deadCopy} getMember root

  // next field assumes c++ compilation, change to getMember class for c
  XWindowAttributes class           = int getMember c_class
  XWindowAttributes bit_gravity     = int getMember bit_gravity
  XWindowAttributes win_gravity     = int getMember win_gravity
  XWindowAttributes backing_store   = int getMember backing_store
  XWindowAttributes backing_planes  = unsigned_long getMember backing_planes
  XWindowAttributes backing_pixel   = unsigned_long getMember backing_pixel
  XWindowAttributes save_under      = bool getMember save_under

  XWindowAttributes colormap \
        = proxy Colormap Colormap_seal {xlib colormap deadCopy} \
          getMember colormap

  XWindowAttributes map_installed   = bool getMember map_installed
  XWindowAttributes map_state       = int getMember map_state
  XWindowAttributes all_event_masks = long getMember all_event_masks
  XWindowAttributes your_event_mask = long getMember your_event_mask

  XWindowAttributes do_not_propagate_mask \
        = long getMember do_not_propagate_mask

  XWindowAttributes override_redirect = bool getMember override_redirect
  XWindowAttributes screen = Screen {xlib screen deadCopy} getMember screen


traits: traits xlib xSetWindowAttributes
 visibility: publicSlot
  void new = XSetWindowAttributesWrap {xlib xSetWindowAttributes deadCopy} new
  XSetWindowAttributesWrap delete = void delete

  XSetWindowAttributesWrap backgroundPixmap: proxy Pixmap Pixmap_seal \
        = void callMember backgroundPixmap

  XSetWindowAttributesWrap backgroundPixel: unsigned_long \
        = void callMember backgroundPixel

  XSetWindowAttributesWrap borderPixmap: proxy Pixmap Pixmap_seal \
        = void callMember borderPixmap

  XSetWindowAttributesWrap borderPixel: unsigned_long \
        = void callMember borderPixel

  XSetWindowAttributesWrap   bitGravity: int = void callMember bitGravity
  XSetWindowAttributesWrap   winGravity: int = void callMember winGravity
  XSetWindowAttributesWrap backingStore: int = void callMember backingStore
  XSetWindowAttributesWrap backingPlanes: unsigned_long \
        = void callMember backingPlanes

  XSetWindowAttributesWrap backingPixel: unsigned_long \
        = void callMember backingPixel

  XSetWindowAttributesWrap saveUnder: bool = void callMember saveUnder
  XSetWindowAttributesWrap eventMask: long = void callMember eventMask

  XSetWindowAttributesWrap doNotPropagateMask: long \
        = void callMember doNotPropagateMask

  XSetWindowAttributesWrap overrideRedirect: bool \
        = void callMember overrideRedirect

  XSetWindowAttributesWrap colormap: proxy Colormap Colormap_seal \
        = void callMember colormap

  XSetWindowAttributesWrap cursor: proxy Cursor Cursor_seal \
        = void callMember cursor
')

