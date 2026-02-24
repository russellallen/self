"
Copyright 1992-2026 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
"

"Template used by primitiveMaker to create Xft primitives."

(primitiveMaker reader copy staticLinking) create: 'xft' Flag: 'xlib_semaphore' From: ('

  -- Copyright 1992-2026 AUTHORS.
  -- See the legal/LICENSE file for license information and legal/AUTHORS for authors.

  macroName: xft
  glueLibraryName: xft_glue.o

','

traits: traits xlib display

  -- xft
  Display xftFontOpenNameOnScreen: int Name: string \
            = XftFont {xlib xftFont deadCopy} call XftFontOpenName canAWS

  Display xftDrawCreate: proxy Drawable ANY_SEAL \
                 Visual: Visual \
                 Colormap: proxy Colormap Colormap_seal \
            = XftDraw {xlib xftDraw deadCopy} call XftDrawCreate canAWS

  Display xftTextExtents8: XftFont \
                   String: string_len_null \
                  Extents: XGlyphInfo \
            = void call XftTextExtents8_wrap canAWS

  Display xftColorAllocValue: Visual \
                    Colormap: proxy Colormap Colormap_seal \
                 RenderColor: XRenderColor \
                    XftColor: XftColor \
            = bool call XftColorAllocValue canAWS


traits: traits xlib xftFont
 visibility: publicSlot
  void new = XftFont {xlib xftFont deadCopy} new
  XftFont delete = void delete
  XftFont ascent = int getMember ascent


traits: traits xlib xGlyphInfo
 visibility: publicSlot
  void new = XGlyphInfo {xlib xGlyphInfo deadCopy} new
  XGlyphInfo delete = void delete
  XGlyphInfo width = unsigned_short getMember width
  XGlyphInfo height = unsigned_short getMember height
  XGlyphInfo x = short getMember x
  XGlyphInfo y = short getMember y
  XGlyphInfo xOff = short getMember xOff
  XGlyphInfo yOff = short getMember yOff


traits: traits xlib xRenderColor
 visibility: publicSlot
  void new = XRenderColor {xlib xRenderColor deadCopy} new
  XRenderColor delete = void delete
  XRenderColor red = unsigned_short getMember red
  XRenderColor green = unsigned_short getMember green
  XRenderColor blue = unsigned_short getMember blue
  XRenderColor alpha = unsigned_short getMember alpha
  XRenderColor red: unsigned_short = void setMember red
  XRenderColor green: unsigned_short = void setMember green
  XRenderColor blue: unsigned_short = void setMember blue
  XRenderColor alpha: unsigned_short = void setMember alpha


traits: traits xlib xftColor
 visibility: publicSlot
  void new = XftColor {xlib xftColor deadCopy} new
  XftColor delete = void delete


traits: traits xlib xftDraw
 visibility: publicSlot
  XftDraw xftDrawString8: XftColor \
                    Font: XftFont \
                       X: int \
                       Y: int \
                  String: string_len_null \
          = void call XftDrawString8_wrap canAWS
')
