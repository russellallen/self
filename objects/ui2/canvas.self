 '30.17.1'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         canvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'canvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals canvas.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'canvas' -> () From: ( | {
         'Category: canvas state\x7fComment: nil or the clipping rectangle\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         clip.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'canvas' -> () From: ( | {
         'Category: canvas state\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         colorLocked <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'canvas' -> () From: ( | {
         'Category: canvas state\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         offset <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         canvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( |
             {} = 'Comment: A canvas is a two-dimensional medium on which morphs are drawn
     in a device and scale independent manner. Canvases keep track of the
     current scale, offset, and clipping rectangle, as well as the underlying
     drawing medium (such as a window or pixmap).\x7fModuleInfo: Creator: traits canvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'canvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'canvas' -> () From: ( | {
         'Category: canvas state\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         redrawBox.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'canvas' -> () From: ( | {
         'Category: canvas state\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         scale <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWithin: r From: startAngle Spanning: spanAngle Color: c = ( |
            | 
            setColor: c.
            drawable drawArcWithin: (transformRect: r)
                           From: startAngle
                       Spanning: spanAngle
                             GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWithin: r From: startAngle Spanning: spanAngle Width: w Color: c = ( |
            | 
            setColor: c.
            drawable drawArcWithin: (transformRect: r)
                           From: startAngle
                       Spanning: spanAngle
                          Width: (scaleNum: w)
                             GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: splines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bSpline: controlPoints Width: w Color: c = ( |
            | 
            bSpline
                computeSegments: controlPoints
                 ForEachGroupDo: [| :pList | lines: pList Width: w Color: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: splines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c = ( |
             segs.
            | 
            segs: bezier computeSegments: pt1 To: c1 To: c2 To: pt2.
            lines: segs Width: w Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: splines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         catmullRomSpline: controlPoints Width: w Color: c = ( |
            | 
            catmullRomSpline
                computeSegments: controlPoints
                 ForEachGroupDo: [| :pList | lines: pList Width: w Color: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         childResponsibility = ( |
            | error: 'a child should implement this method').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: circles\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         circleCenteredAt: pt Diameter: d Color: c = ( |
             r.
            | 
            r: (pt - d half) ## (d @ d).
            arcWithin: r From: 0 Spanning: 360 Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: circles\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         circleCenteredAt: pt Diameter: d Width: w Color: c = ( |
             r.
            | 
            r: (pt - d half) ## ( d @ d).
            arcWithin: r From: 0 Spanning: 360 Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyClip: r = ( |
            | copyOffset: 0@0 Scale: 1 Clip: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOffset: o = ( |
            | copyOffset: o Scale: 1 Clip: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOffset: o Clip: r = ( |
            | copyOffset: o Scale: 1 Clip: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOffset: o Scale: s = ( |
            | copyOffset: o Scale: s Clip: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOffset: o Scale: s Clip: r = ( |
             new.
            | 
            new: copy.

            1 = scale ifTrue: [
                new offset: (offset x + o x) asInteger @ (offset y + o y) asInteger.
                new scale: s.
            ] False: [
                new offset:
                    ((offset x + (o x asFloat * scale) asInteger) @
                     (offset y + (o y asFloat * scale) asInteger) ).
                new scale: scale * s.
            ].

            r ifNotNil: [
                clip ifNil: [
                    new clip: r.
                ] IfNotNil: [
                    new clip: clip intersect: r.
                ].
            ].
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyPixmapAt: p Into: aPixmapCanvas = ( |
            | 
            drawable copyArea: (p ## aPixmapCanvas size)
                To: aPixmapCanvas drawable At: 0@0 GC: aPixmapCanvas gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReset = ( |
             new.
            | 
            new: copy.
            new offset: 0@0.
            new scale: 1.
            new clip:  nil.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyScale: s = ( |
            | copyOffset: 0@0 Scale: s Clip: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: context\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyScale: s Clip: r = ( |
            | copyOffset: 0@0 Scale: s Clip: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: lines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLine: pt1 To: pt2 DashSize: d Offset: o Color: c = ( |
            | 
            setColor: c.
            drawable drawDashedLine: (transformPt: pt1) To: (transformPt: pt2) DashSize: d Offset: o GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: lines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLine: pt1 To: pt2 Width: w DashSize: d Offset: o Color: c = ( |
            | 
            setColor: c.
            drawable drawDashedLine: (transformPt: pt1) To: (transformPt: pt2) Width: (scaleNum: w) DashSize: d Offset: o GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: arcs\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: r From: startAngle Spanning: spanAngle Color: c = ( |
            | 
            setColor: c.
            drawable fillArcWithin: (transformRect: r)
                           From: startAngle
                       Spanning: spanAngle
                             GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: circles\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillCircleCenteredAt: pt Diameter: d Color: c = ( |
             r.
            | 
            r: (pt - d half) ## (d @ d).
            fillArcWithin: r From: 0 Spanning: 360 Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: modes\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillColor: c = ( |
            | 
            setColor: c.
            drawable fillRectangle: ((0@0) # size) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: circles\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillEllipseIn: rect Color: c = ( |
            | 
            fillArcWithin: rect From: 0 Spanning: 360 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: pointList Color: c = ( |
             xv.
             yv.
            | 
            xv: vector copySize: pointList size.
            yv: vector copySize: pointList size.
            pointList do: [| :p. :i |
                xv at: i Put: p x.
                yv at: i Put: p y.
            ].
            fillPolygonXs: xv Ys: yv Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonXs: xList Ys: yList Color: c = ( |
            | 
            "Warning: this method modifies the contents of xList and
             yList. It meant for use with clients who need to copy
             their coordinates into temporary vectors anyway, and
             saves considerable time by avoiding unnecessary storage
             allocation and garbage collection."

            1 = scale ifTrue: [| xOffset. yOffset |
                xOffset: offset x.
                yOffset: offset y.
                xList size do: [| :i |
                    xList at: i Put: ((xList at: i) + xOffset) asSmallInteger.
                    yList at: i Put: ((yList at: i) + yOffset) asSmallInteger.
                ].
            ] False: [| s. xOffset. yOffset |
                s: scale asFloat.
                xOffset: offset x asInteger.
                yOffset: offset y asInteger.
                xList size do: [| :i |
                    xList at: i Put: ((s * (xList at: i) asFloat) asInteger + xOffset) asSmallInteger.
                    yList at: i Put: ((s * (yList at: i) asFloat) asInteger + yOffset) asSmallInteger.
                ].
            ].

            setColor: c.
            drawable fillPolygonIntegerXs: xList Ys: yList GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: rectangles\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: r Color: c = ( |
            | 
            setColor: c.
            drawable fillRectangle: (transformRect: r) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         gcIfFail: fb = ( |
            | gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         grayMask = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | size y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: images\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         image: i At: pt = ( |
             cachedData.
            | 

            " no point in drawing empty image,
              and it would crash X -- dmu "

            ( i width = 0 )  || [ i height = 0 ]
              ifTrue: [^ self].

            cachedData: pixmapAndMaskFor: i.

            i masked ifTrue: [
                withMask: cachedData mask Offset: pt Do: [
                    pastePixmap: cachedData pixmap At: pt.
                ].
            ] False: [
                pastePixmap: cachedData pixmap At: pt.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         isSameDisplayAs: aCanvas = ( |
            | display = aCanvas display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: lines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Color: c = ( |
            | 
            setColor: c.
            drawable drawLine: (transformPt: pt1) To: (transformPt: pt2) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: lines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Width: w Color: c = ( |
            | 
            setColor: c.
            drawable drawLine: (transformPt: pt1) To: (transformPt: pt2) Width: (scaleNum: w) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: lines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         lines: pointList Color: c = ( |
             pts.
            | 
            setColor: c.
            pts: pointList copyMappedBy: [| :pt | transformPt: pt].
            drawable drawLines: pts GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: lines\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         lines: pointList Width: w Color: c = ( |
             pts.
            | 
            setColor: c.
            pts: pointList copyMappedBy: [| :pt | transformPt: pt].
            drawable drawLines: pts Width: (scaleNum: w) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: p = ( |
             sz.
            | 
            sz: aPixmapCanvas size.
            pastePixmap: aPixmapCanvas At: p Src: 0@0 Width: sz x Height: sz y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: dst Src: src Width: w Height: h = ( |
            | 
            colorLocked ifTrue: [
                fillRectangle: (dst ## (w@h)) Color: nil.  "colors are ignored when locked"
            ] False: [
                aPixmapCanvas drawable copyArea: (src ## (w@h))
                    To: drawable At: (transformPt: dst) GC: gc.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: p Width: w Height: h = ( |
            | 
            pastePixmap: aPixmapCanvas At: p Src: 0@0 Width: w Height: h.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         pixmapAndMaskFor: image = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: points\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         point: p Color: c = ( |
            | 
            setColor: c.
            drawable drawPoint: (transformPt: p) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Color: c = ( |
            | 
            lines: (pointList copyAddLast: pointList first) Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: polygons\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Width: w Color: c = ( |
            | 
            lines: (pointList copyAddLast: pointList first) Width: w Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: rectangles\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: r Color: c = ( |
            | 
            setColor: c.
            drawable drawRectangle: (transformRect: r) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: rectangles\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: r Width: w Color: c = ( |
            | 
            setColor: c.
            drawable drawRectangle: (transformRect: r) Width: (scaleNum: w) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleNum: n = ( |
            | 
            "This method is an optimization of:
                ((scale * n) asInteger)"

            1 = scale
                ifTrue: n
                 False: [(n asFloat * scale asFloat) asInteger]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: modes\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         setColor: c = ( |
            | colorLocked ifFalse: [gc foreground: indexForColor: c].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: text\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         text: s At: pt = ( |
            | text: s At: pt Color: paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: text\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         text: s At: pt Color: c = ( |
            | 
            text: s At: pt FontSpec: fontSpec Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: text\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         text: s At: pt FontSpec: fSpec Color: c = ( |
            | 
            " password font is really courier "
            fSpec name = 'password'  ifTrue: [
              ^ text: ( '' copySize: s size FillingWith: '*' )
                  At: pt
            FontSpec: (fSpec copyName: 'courier')
               Color: c
            ].

            setColor: c.
            gc font: (idForFontSpec:   fSpec  copySize:  scaleNum: fSpec size).
            drawable drawString: s At: (transformPt: pt) GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         transformPt: p = ( |
             s.
            | 
            "This method is an optimization of:
                ((p * scale) + offset) asInteger)"

            1 = scale ifTrue: [ ^(p + offset) ].

            "general case: scale is not one"
            s: scale asFloat.
            (((s * p x asFloat) asInteger + offset x) @
             ((s * p y asFloat) asInteger + offset y) )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         transformRect: r = ( |
            | 
            rectangle from: (transformPt: r origin)
                        To: (transformPt: r corner)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         translucentlyDo: blk = ( |
            | 
            withPattern: grayMask Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | size x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: modes\x7fCategory: antialiasing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withAntialiasingDo: blk = ( |
            | 
            drawable withAntialiasing: true Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
             oldClip.
             r.
            | 
            "Execute the given block, doing all drawing with the
             given clipping rectangle. Nested clipping rectangles
             are composed."

            oldClip: clip.
            r: (transformRect: newClip).
            oldClip ifNotNil: [ r: r intersect: oldClip ].
            (0 = r width) || [0 = r height] ifTrue: [ ^self ].

            clip: r.
            gc setClipRectangle: r.
            blk value.
            oldClip ifNil: [
                gc setNoClipMask.
            ] IfNotNil: [
                gc setClipRectangle: oldClip.
            ].
            clip: oldClip.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withColor: c Do: blk = ( |
            | 
            "Execute the given block, doing all drawing with the given color.
             This method supports faster shadow drawing: since all shadows have
             the same color, it saves a lot of time to not set the foreground
             color of the gc on every call."

            gc foreground: (indexForColor: c).
            colorLocked: true.
            blk onReturn: [colorLocked: false].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withMask: m Offset: o Do: blk = ( |
            | 
            "Execute the given block, doing all drawing through the given
             clip mask (a pixmapCanvas of depth 1)."

            gc setClipMask: m pixMap  Origin:  transformPt: o.
            blk value.
            gc setNoClipMask.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withPattern: p Do: blk = ( |
            | 
            "Execute the given block, doing all drawing with the given stipple
             pattern (a pixmapCanvas of depth 1)."

            gc fillStippled.
            gc stipple: p pixMap.
            blk value.
            gc fillSolid.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'canvas' -> () From: ( | {
         'Category: drawing\x7fCategory: modes\x7fCategory: antialiasing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withoutAntialiasingDo: blk = ( |
            | 
            drawable withAntialiasing: false Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractPixmapCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'abstractPixmapCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals canvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractPixmapCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractPixmapCanvas.

CopyDowns:
globals canvas. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractPixmapCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( |
             {} = 'Comment: A canvas that draws to an offscreen pixmap.\x7fModuleInfo: Creator: traits abstractPixmapCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractPixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractWindowCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'abstractWindowCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals canvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractWindowCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractWindowCanvas.

CopyDowns:
globals canvas. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         imageDict <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractWindowCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( |
             {} = 'Comment: A canvas that draws directly to an X window.\x7fModuleInfo: Creator: traits abstractWindowCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         platformWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         colorRecordingCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'colorRecordingCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals canvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colorRecordingCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colorRecordingCanvas.

CopyDowns:
globals canvas. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorRecordingCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         client.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         colorRecordingCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( |
             {} = 'Comment: A canvas that does nothing, used for performance measurements.
        Setting computeCurves to true forces the point lists for spline and Bezier
        curves to be computed even though the curves will not be drawn.\x7fModuleInfo: Creator: traits colorRecordingCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorRecordingCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorRecordingCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         winCanvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot'
        
         canvas = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'canvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'canvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules canvas.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot'
        
         myComment <- 'Canvases: the drawing surfaces of ui2.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (\'30.17.1\')\x7fVisibility: public'
        
         revision <- '30.17.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'canvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'quartzCanvas
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         nullCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'nullCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals canvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'nullCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals nullCanvas.

CopyDowns:
globals canvas. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         nullCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( |
             {} = 'Comment: A canvas that does nothing, used for performance measurements.
        Setting computeCurves to true forces the point lists for spline and Bezier
        curves to be computed even though the curves will not be drawn.\x7fModuleInfo: Creator: traits nullCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'nullCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'bufferCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            (gcIfFail: [^ self]) 
             isLive ifTrue: [
                gc     delete.
                pixMap delete.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSameScreenAs: win Width: w Height: h = ( |
            | 
            copyForSameScreenAs: win
                Width: w Height: h
                Depth: win drawable screen depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSameScreenAs: wc Width: w Height: h Depth: d = ( |
            | 
            wc isOpen ifFalse: [
            error: 'cannot create a pixmapCanvas on a closed windowCanvas'
            ].
            copy initForSameScreenAs: wc Width: w Height: h Depth: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | winCanvas display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: converting ui2Image\'s\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawFromImage: im = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = ( |
            | pixMap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         grayMask = ( |
            | winCanvas grayMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec = ( |
            | 
            winCanvas idForFontSpec: fSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | winCanvas indexForColor: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         initForSameScreenAs: aWindowCanvas Width: w Height: h Depth: d = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | 
            pixMap isNil not && [ pixMap isLive && [ winCanvas isOpen ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'canvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         pixmapAndMaskFor: image = ( |
            | winCanvas pixmapAndMaskFor: image).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | 
            isOpen ifTrue: 'open' False: 'closed').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> () From: ( | {
         'Category: colorsAndFonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec = ( |
            | 
            winCanvas structForFontSpec: fSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmapCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractPixmapCanvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals pixmapCanvas.

CopyDowns:
globals abstractPixmapCanvas. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         gc <- bootstrap stub -> 'globals' -> 'xlib' -> 'graphicsContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fComment: for xlib\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         xPixmapCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xPixmapCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pixMap <- bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: accessing\x7fComment: Return my bounding box
in the world.
-- Ungar, 1/24/95\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         boundingBoxInWorld = ( |
            | 
            offset negate ## size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         boundingBoxOnScreen = ( |
            | 
            position ## size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bufferCanvasForMyScreenBounds: b = ( |
            | 
            pixmapCanvasPrototypeForMyScreen
              copyForSameScreenAs: self
                            Width: b width
                           Height: b height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         buildGrayMask = ( |
            | 
            grayMask: childResponsibility.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOpenForWorld: wld OnDisplay: displayName At: pt Width: w Height: h = ( |
            | 
            copy openForWorld: wld OnDisplay: displayName At: pt Width: w Height: h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: colors and fonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         idForFontSpec: fSpec = ( |
            | 
            fSpec name = 'pasword'  ifTrue: [
              ^ idForFontSpec: fSpec copyName: 'courier'
            ].
            fontMap idForFontSpec: fSpec WindowCanvas: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         imageUsed: image = ( |
             entry.
            | 
            "Update the timestamp of the pixmap cache entry for the given image.
             Used to garbage-collect old cached pixmaps."

            entry: imageDict at: image IfAbsent: [ ^self ].
            entry lastUsed: time current.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: colors and fonts\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | colorDict indexForColor: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         invalidateCachedPixmaps = ( |
            | 
            imageDict copy do: [| :entry. :image |
                image contentsChangedFlag: true.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | 
            drawable isLive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWorld: wld OnDisplay: displayName At: pt Width: w Height: h = ( |
            | 
            "pt is window frame location,
            w.h is inner size"
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'canvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmapAndMaskFor: image = ( |
             entry.
             update <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            "Return the cached pixmap and optional mask pixmap for the given image."

            entry: imageDict at: image IfAbsent: [| newEntry |
                newEntry: pixmapCacheEntry copy.
                imageDict at: image Put: newEntry.
                update: true. "triggers update below"
                newEntry.
            ]. 

            "if the image contents have changed, update its cache entry"
            update ifTrue: [
                updatePixmapCacheEntry: entry ForImage: image.
            ].
            entry lastUsed: time current.
            entry).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmapCanvasPrototypeForMyScreen = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         releasePixmapsUnusedSince: aTime = ( |
            | 
            imageDict copy do: [| :entry. :image |
                aTime >= entry lastUsed ifTrue: [
                    imageDict removeKey: image IfAbsent: nil.
                    entry pixmap close.
                    entry mask   close.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         reportPixmapColorsTo: paintMgr = ( |
            | 
            "Report the colors used by cached pixmaps."

            imageDict do: [| :entry. :image |
                (image colorsFor: paintMgr) do: [| :c | paintMgr colorInUse: c ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | 
            isOpen ifTrue: 'open' False: 'closed').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: colors and fonts\x7fComment: name e.g. helvetica
style e.g. bold
size e.g. 11\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         structForFontSpec: fSpec = ( |
             fs.
             xName.
            | 
            fs: fSpec name = 'password' ifTrue: [fSpec copyName: 'courier'] False: [fSpec].
            fontMap structForFontSpec: fs WindowCanvas: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         updatePixmapCacheEntry: entry ForImage: image = ( |
             cachedMask.
             cachedPixmap.
             h.
             pc.
             w.
            | 
            cachedPixmap: entry pixmap.
            cachedMask:   entry mask.
            w: image width.
            h: image height.
            pc: pixmapCanvasPrototypeForMyScreen.

            ((cachedPixmap isOpen) &&
             [(cachedPixmap size x = w) &&
             [(cachedPixmap size y = h)]]) ifFalse: [
                cachedPixmap close.
                cachedPixmap: pc copyForSameScreenAs: self
                    Width: w Height: h.
            ].

            image masked ifTrue: [
                ((cachedMask isOpen) &&
                 [(cachedMask size x = w) &&
                 [(cachedMask size y = h)]]) ifFalse: [
                    cachedMask close.
                    cachedMask: pc copyForSameScreenAs: self
                        Width: w Height: h Depth: 1.
                ].
            ] False: [
                cachedMask close.
                cachedMask: pc.
            ].

            image copyIntoPixmap: cachedPixmap Mask: cachedMask.
            entry pixmap: cachedPixmap.
            entry mask:   cachedMask.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: cursor manipulation\x7fComment: Move cursor to point p
in world coordinates,
as if mouse moved.
-- Ungar, 6/20/95\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         warpCursorTo: p = ( |
            | 
            platformWindow warpPointerTo: p + offset.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fComment: This one is for X windows.\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         windowCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'platformWindow' From:
             globals abstractWindowCanvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals windowCanvas.

CopyDowns:
globals abstractWindowCanvas. copy 
SlotsToOmit: parent platformWindow.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         winCanvas <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         colorDict <- bootstrap stub -> 'globals' -> 'paintManager' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fontMap <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'fontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         gc <- bootstrap stub -> 'globals' -> 'xlib' -> 'graphicsContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         grayMask <- bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fComment: for the X window system\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         xWindowCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xWindowCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'xWindowCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         platformWindow <- bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'Comment: Position of the window on the screen. The client must update
this slot in response to X configure events.\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         redrawWindow <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'windowCanvas' -> () From: ( | {
         'Comment: Size of the window on the screen. The client must update
this slot in response to X configure events.\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWithin: r From: startAngle Spanning: spanAngle Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWithin: r From: startAngle Spanning: spanAngle Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bSpline: controlPoints Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         catmullRomSpline: controlPoints Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         circleCenteredAt: pt Diameter: d Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         circleCenteredAt: pt Diameter: d Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyPixmapAt: p Into: aPixmapCanvas = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLine: pt1 To: pt2 DashSize: d Offset: o Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLine: pt1 To: pt2 Width: w DashSize: d Offset: o Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | winCanvas display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: r From: startAngle Spanning: spanAngle Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillCircleCenteredAt: pt Diameter: d Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillColor: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: pointList Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonXs: xList Ys: yList Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: r Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: misc\x7fComment: From Jecel:
This should hopefully fix the bug when trying to free colors in the color map\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | winCanvas gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         grayMask = ( |
            | 'dummy gray mask').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         image: i At: pt = ( |
            | 
            winCanvas imageUsed: i.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'canvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: dst Src: src Width: w Height: h = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: p Width: w Height: h = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         point: p Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: r Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: r Width: w Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         text: s At: pt FontSpec: fSpec Color: c = ( |
            | 
            client colorInUse: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withAntialiasingDo: blk = ( |
            | blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | 
            blk value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withColor: c Do: blk = ( |
            | 
            client colorInUse: c.
            blk value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withMask: m Offset: o Do: blk = ( |
            | 
            blk value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withPattern: p Do: blk = ( |
            | 
            blk value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorRecordingCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withoutAntialiasingDo: blk = ( |
            | blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWithin: r From: startAngle Spanning: spanAngle Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         arcWithin: r From: startAngle Spanning: spanAngle Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bSpline: controlPoints Width: w Color: c = ( |
            | 
            computeCurves ifTrue: [
                resend.bSpline: controlPoints Width: w Color: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c = ( |
            | 
            computeCurves ifTrue: [
                resend.bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         catmullRomSpline: controlPoints Width: w Color: c = ( |
            | 
            computeCurves ifTrue: [
                resend.catmullRomSpline: controlPoints Width: w Color: c.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         circleCenteredAt: pt Diameter: d Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         circleCenteredAt: pt Diameter: d Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         computeCurves <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         copyPixmapAt: p Into: aPixmapCanvas = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLine: pt1 To: pt2 DashSize: d Offset: o Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLine: pt1 To: pt2 Width: w DashSize: d Offset: o Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         display = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'nullCanvas' -> 'display' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits nullCanvas display.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         syncDiscardingIf: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: events\x7fComment: Dummy X display.\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsPending = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: r From: startAngle Spanning: spanAngle Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillCircleCenteredAt: pt Diameter: d Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillColor: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: pointList Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonXs: xList Ys: yList Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: r Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         grayMask = ( |
            | 'dummy gray mask').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         image: i At: pt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         line: pt1 To: pt2 Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'canvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: dst Src: src Width: w Height: h = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pastePixmap: aPixmapCanvas At: p Width: w Height: h = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         point: p Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         polygon: pointList Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: r Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         rectangle: r Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         text: s At: pt FontSpec: fSpec Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withAntialiasingDo: blk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | blk value. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withColor: c Do: blk = ( |
            | blk value. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withMask: m Offset: o Do: blk = ( |
            | blk value. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: economiesOfScale\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withPattern: p Do: blk = ( |
            | blk value. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'nullCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withoutAntialiasingDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'Comment: Set to the current time every time this
image is displayed. Could be used for pruning
the pixmapCache some day.
\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         lastUsed <- bootstrap stub -> 'globals' -> 'time' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         mask = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> 'mask' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartzWindowCanvas pixmapCacheEntry mask.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> 'mask' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot'
        
         close = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> 'mask' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot'
        
         isOpen = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         mask: x = ( |
            | 
            "No masks, use Alpha instead"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: InitializeToExpression: (quartzGlobals bufferCanvas)\x7fVisibility: public'
        
         pixmap <- bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'bufferCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'Category: converting ui2Image\'s\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawFromImage: im = ( |
             colorTable.
             disp.
             h.
             pixmapImage.
             w.
            | 
            w: im width.
            h: im height.
            disp: display.

            pixmapImage: disp xCreateImage: disp screen defaultVisual
                Depth: pixMap depth
               Format: pixMap zPixmap
                Width: w 
               Height: h 
            BitmapPad: 16.

            colorTable: (im colorsFor: winCanvas colorDict).
            colorTable mapBy: [| :c | indexForColor: c].

            pixmapImage xImagePutData: im pixelData MappedBy: colorTable.
            disp xPutImage: pixMap GC: gc Image: pixmapImage
                SrcX: 0 SrcY: 0 DestX: 0 DestY: 0 Width: w Height: h.
            pixmapImage delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'Category: converting ui2Image\'s\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawMaskFromImage: im = ( |
             bitMapColorTable.
             bitmapImage.
             disp.
             h.
             w.
            | 
            w: im width.
            h: im height.
            disp: display.
            "only build the mask image if necessary"
            bitmapImage: disp xCreateImage: disp screen defaultVisual
                  Depth: 1 Format: pixMap zPixmap
                  Width: w Height: h BitmapPad: 16.

            bitMapColorTable: im colors copy mapBy:               1.
            bitMapColorTable at: im transparentPixelValue Put:    0.

            bitmapImage xImagePutData: im pixelData MappedBy: bitMapColorTable.
            disp xPutImage: pixMap GC: gc Image: bitmapImage
                      SrcX: 0 SrcY: 0 DestX: 0 DestY: 0 Width: w Height: h.
            bitmapImage delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         initForSameScreenAs: aWindowCanvas Width: w Height: h Depth: d = ( |
            | 
            winCanvas: aWindowCanvas.
            pixMap: pixMap createForSameScreenAs: aWindowCanvas drawable Size: w@h Depth: d.
            gc: xlib graphicsContext createForSameScreenAs: pixMap.
            gc graphics_exposures: false.
            size: w@h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xPixmapCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractPixmapCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         buildGrayMask = ( |
            | 
            grayMask:
                pixmapCanvasPrototypeForMyScreen
                   copyForSameScreenAs: self Width: 16 Height: 16 Depth: 1.
            16 do: [| :row |
                16 do: [| :col |
                    grayMask gc foreground: ((row + col) % 2).
                    grayMask drawable drawPoint: row@col GC: grayMask gc.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            display isLive ifTrue: [
                colorDict   close.
                gc          delete.
                platformWindow        delete.
                display     close.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         displayName = ( |
            | display name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = ( |
            | platformWindow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: events\x7fComment: X displays deal with events\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsPending = ( |
            | display eventsPending).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsToCatch = ( |
            | 
            xlib events pointerMotionMask     ||
            xlib events buttonPressMask       ||
            xlib events buttonReleaseMask     ||
            xlib events keyPressMask          ||
            xlib events keyReleaseMask        ||
            xlib events exposureMask          ||
            xlib events structureNotifyMask   ||
            xlib events enterWindowMask       ||
            xlib events leaveWindowMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: coordinate transformations\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         innerOriginOffsetFromBorder = ( |
            | 5@26).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: events\x7fComment: X gets event based on display\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         nextEvent = ( |
            | display nextEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         openDisplayNamed: displayName = ( |
             count <- 0.
             n.
            | 
            n: displayName.

            "For Linux, default to local display"
            host osName = 'linux' ifTrue: [n: ''].

            [ | err |
              err: [|:exit|
                ^ xlib display open: n
                             IfFail: [|:err| exit value: err].
              ] exitValue.
              ( userQuery askMultipleChoice: 'Could not open display "', n, '", error: ', err
                                   Choices: ('Try Again' & 'Try Local Display' & 'Give Up') asVector
                                   Results: ( [ n: userQuery askString: 'Display name?' DefaultAnswer: n ]
                                            & [ n: '' ]
                                            & [ process this abort ] ) asVector
              ) value.
              count: count succ.
              count = 5 ifTrue: [
                'Failed to open display five times!!\n' print.
                process this abort
              ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWorld: wld OnDisplay: displayName At: pt Width: w Height: h = ( |
             c.
            | 
            wld doubleBuffering: true.
            display isLive ifFalse: [
                display: openDisplayNamed: displayName.
            ].
            display screen depth < 8 ifTrue: [
                 display close. 
                 ^ error: 'Sorry, you must use a color/grayscale display.
            (Screen depths of ', 
                     display screen depth printString,
                     ' are not currently supported.)'].
            platformWindow: xlib window createOnDisplay: display At: pt Size: w@h.
            platformWindow name: wld name.
            platformWindow catchWMDelete.
            platformWindow eventMask: eventsToCatch.
            platformWindow selectInput.
            platformWindow map.
            size: w@h.
            gc: xlib graphicsContext createForSameScreenAs: platformWindow.
            gc graphics_exposures: false.
            fontMap: fontMap copyRemoveAll.
            colorDict: colorDict copyForWindow: platformWindow Client: wld.
            imageDict: imageDict copyRemoveAll.
            buildGrayMask.
            display flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         originalDisplayName = ( |
            | 
            display originalName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         peekEvent = ( |
            | display peekEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: private'
        
         pixmapCacheEntry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xWindowCanvas pixmapCacheEntry.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'Comment: Set to the current time every time this
image is displayed. Could be used for pruning
the pixmapCache some day.
\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         lastUsed <- bootstrap stub -> 'globals' -> 'time' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         mask <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( | {
         'ModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmap <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'pixmapCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmapCanvasPrototypeForMyScreen = ( |
            | 
            x11Globals pixmapCanvas).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         scalableFont = ( |
            | x11Globals scalableFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Event = ( |
            | x11Globals ui2Event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fModuleInfo: Module: canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         window = ( |
            | platformWindow).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'quartzCanvas' From: 'ui2'



 '-- Side effects'

 globals modules canvas postFileIn
