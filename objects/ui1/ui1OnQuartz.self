 '$Revision:$'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         ui1OnQuartz = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1OnQuartz.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbaContext = bootstrap define: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaContext' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals quartz context deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaContext' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz rgbaContext.

CopyDowns:
globals quartz context. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbaContext = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz rgbaContext.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fComment: ui1 true-colour offscreen: a CGLayer created from the window context, same object UI2 uses. copyArea:/presentToWindow: are drawLayer (traits quartz drawable). -- claude & dmu 6/10\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbaPixmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz rgbaPixmap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (quartz rgbaContext deadCopy)\x7fVisibility: private'
        
         context.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         height <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: CGLayer created from the window gc. The object drawLayer: receives.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         layer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: false = BGRA (alpha). Body pixmaps leave dest alone in the 3-D corners; world graphic is filled opaque sage.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         opaque <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         rgbaPixmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz rgbaPixmap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         width <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: window CGContext the layer was created from; sibling pixmaps create from this too.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         windowContext.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> () From: ( | {
         'Comment: indexed ui1 passes a colormapEntry (index as gray byte). Direct/UI2-style paints have red/green/blue in 0-1 and no index slot. Layer gcs are quartz context proxies and cannot have their parent changed.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         foregroundColor: cme = ( |
             a.
             gray.
            | 
            ((reflect: cme) includesKey: 'index') ifTrue: [
                indexFG: cme index.
                gray: cme index asFloat / 255.0.
                setGrayFillColorGray:   gray Alpha: 1.0.
                setGrayStrokeColorGray: gray Alpha: 1.0.
                ^ self
            ].
            a: cme alpha.
            setFillColorRed:   cme red
                       Green:  cme green
                        Blue:  cme blue
                       Alpha:  a.
            setStrokeColorRed: cme red
                        Green: cme green
                         Blue: cme blue
                        Alpha: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: windowBitmap image. Direct (32-bit RGBA shadow) uses that pixmap so depth is 32; 8-bit indexed keeps the platformWindow facade. ensureShadowSize before the return so a Cocoa resize recreates the BGRA shadow and IOSurface before update copies onto it.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         bitmapImage = ( |
            | 
            shadow ifNotNil: [
                ensureShadowSize.
                shadow depth > 8 ifTrue: [ ^ shadow ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         makeRGBAShadow = ( |
            | 
            shadow ifNotNil: [ shadow delete ].
            shadow: quartz rgbaPixmap createForSameScreenAs: self Size: size Depth: 32.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         platformPixmapForDepth: d = ( |
            | 
            d <= 8 ifTrue: [quartz indexedPixmap] False: [quartz rgbaPixmap]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'platformWindow' -> () From: ( | {
         'Comment: CGLayerCreateWithContext needs the window gc, as UI2 asLayerSize: does.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         windowContextForLayer = ( |
            | quartzWindow gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'Comment: Restore opaque drawing after a stippled fill. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillSolid = ( |
            | 
            setAlpha: 1.0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'Comment: 32-bit analog of X11 fillStippled: body-coloured paint at default 50% alpha. Density from stippleAlphaFrom:. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillStippled = ( |
            | 
            setAlpha: 0.5.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'Comment: paint red/green/blue are already 0-1 (CG range); do not divide by 255. Use the paint alpha so transparent (0) punches BGRA corners.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         foregroundColor: cme = ( |
             a.
            | 
            a: cme alpha.
            setFillColorRed:   cme red
                       Green:  cme green
                        Blue:  cme blue
                       Alpha:  a.
            setStrokeColorRed: cme red
                        Green: cme green
                         Blue: cme blue
                        Alpha: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         function: f = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'context' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         plane_mask: m = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'Comment: X11 setClipRectangle replaces the clip. Quartz clipToRect intersects, so restore the post-CTM GState saved at pixmap init, then clip. withClip: on this context uses clipToRectX directly so it does not pop that clean state.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipRectangle: r = ( |
            | 
            restoreGState.
            saveGState.
            r ifNotNil: [
                clipToRectX: r left Y: r top Width: r width Height: r height
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'Comment: X11 setNoClipMask. Pair of restore+save returns to the unclipped CTM saved at pixmap init.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         setNoClipMask = ( |
            | 
            restoreGState.
            saveGState.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'Comment: Direct CG alpha is the pattern density (ui1 arrowBlur: p). -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         stippleAlphaFrom: pattern = ( |
            | 
            setAlpha: pattern stippleAlpha.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaContext' -> () From: ( | {
         'Comment: Intersect clip under a nested GState. Must not call setClipRectangle: (that pops the clean state).\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | 
            withNewGStateDo: [
                newClip ifNotNil: [
                    clipToRectX: newClip left
                               Y: newClip top
                           Width: newClip width
                          Height: newClip height
                ].
                blk value
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: Stretch this pixmap onto destRect of destImage. Same identity-CTM dest math as copyArea:. Used to scale layer text with the zooming slab. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: srcRect StretchedTo: destRect On: destImage = ( |
             dgc.
             img.
             qDstX.
             qDstY.
            | 
            (destRect width <= 0) || [destRect height <= 0] ifTrue: [^ self].
            dgc: destImage gc.
            img: context createImageSnapshot.
            qDstX: destRect left.
            qDstY: destImage height - destRect bottom.
            dgc withClip: destRect Do: [
                dgc setIdentityCTM.
                dgc drawImage: img
                            X: qDstX
                            Y: qDstY
                        Width: destRect width
                       Height: destRect height.
            ].
            img release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: Same dest math as UI2 drawLayer (identity CTM, Y flipped). Source is a BGRA bitmap snapshot so alpha 0 corners source-over onto sage. Do not use y-down DrawImage with negative height (no-op / black).\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         copyArea: srcRect To: destImage At: destPt GC: g = ( |
             dgc.
             dstBottom.
             dstLeft.
             dstTop.
             img.
             qDstX.
             qDstY.
             z.
            | 
            dgc: destImage gc.
            img: context createImageSnapshot.
            z: dgc getCTM_A.
            dstLeft:   (destPt x - srcRect left) * z.
            dstTop:    (destPt y - srcRect top)  * z.
            dstBottom: dstTop + (height * z).
            qDstX: dstLeft.
            qDstY: destImage height - dstBottom.
            dgc withClip: destPt ## srcRect size Do: [
                dgc setIdentityCTM.
                dgc drawImage: img
                            X: qDstX
                            Y: qDstY
                        Width: width * z
                       Height: height * z.
            ].
            img release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         createForSameScreenAs: db Size: sz Depth: dp = ( |
            | copy initOffscreenSize: sz WindowContext: db windowContextForLayer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            context ifNotNil: [ context release ].
            layer ifNotNil: [ layer close ].
            layer: nil.
            context: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         depth = ( |
            | 32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: skip fillRectInteger (plane-mask/indexed byte path). Layer is true colour; fillRectX matches the window gc fills that already worked.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: r GC: gc = ( |
            | 
            gc fillRectX: r left Y: r top Width: r width Height: r height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: BGRA bitmap context (y-down). Paint RGB+alpha via rgbaContext foregroundColor:.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | context).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         indexedContext = ( |
            | context).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: BGRA bitmap (MakeRGBAOffscreen Opaque: false) so undrawn 3-D corners stay alpha 0. y-down CTM matches ui1. AA stays on; source-over of the snapshot is the silhouette, not AND/OR. WindowContext is unused for the backing (siblings still pass it).\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         initOffscreenSize: sz WindowContext: wgc = ( |
            | 
            width:  sz x.
            height: sz y.
            windowContext: wgc.
            layer: nil.
            context: quartz context
                makeRGBAOffscreenWidth: sz x
                                Height: sz y
                                Opaque: false.
            context setCTMForZeroAtTopHeight: sz y.
            context saveGState.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         isLive = ( |
            | context ifNil: false IfNotNil: [|:c| c isLive]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: id/region readback for hit-testing -- stubbed to 0 for now; Phase 2/3 adds an id buffer for the colour picker. -- claude & dmu 6/10\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         pixelValueAt: pt = ( |
            | 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: sibling pixmap prototype for bitmap copyFor: when this rgbaPixmap is the windowBitmap image.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         platformPixmapForDepth: d = ( |
            | 
            d <= 8 ifTrue: [quartz indexedPixmap] False: [quartz rgbaPixmap]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'Comment: same dest math as copyArea: identity CTM, snapshot source-over onto the window.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         presentToWindow: pw = ( |
            | 
            copyArea: size rect To: pw quartzWindow At: 0@0 GC: gc.
            pw quartzWindow gc flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         restoreCleanGStateIfPresent = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'rgbaPixmap' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         windowContextForLayer = ( |
            | windowContext).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         quartz = bootstrap define: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             traits ui1 graphics abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics quartz.

CopyDowns:
traits ui1 graphics abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (nil)'
        
         bufferCanvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: traits\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         quartzTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics quartzTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         window = ( |
            | ww).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         window: w = ( |
            | 

            ww: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (nil)'
        
         windowCanvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (nil)'
        
         ww.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct ones is white; paint moving arrows with the arrow colour. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowAnimColorFrom: uiColors = ( |
            | uiColors arrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         boxSizePlatformMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> 'boxSizePlatformMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics quartzTraits boxSizePlatformMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: colormaps\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         changeColorsFor: uiColors OffScreen: offScreen Cursor: cursor Animator: ranimator UpdateNow: updateNow = ( |
            | 
            updateNow value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         checkDepthOf: bitmap = ( |
            | 
            [bitmap depth = 32] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         copy = ( |
             r.
            | 
             [xxxxxx].
            r: resend.copy.
            r window:                        windowPrototype copy.

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: fading\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolve = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: 32-bit has no bitplanes or colormap acetate. X11 plane-mask / colormap-cycle animation is a no-op; the body still draws via displayThru / display.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolve: bod InWorld: world = ( |
            | 
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: window\x7fComment: X11 does open -a XQuartz so the window gets keystrokes after a click. Native Cocoa: order front and make key. Do not call C++ QuartzWindow::activate (that queues boundsChanged for first show).\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureFrontmost = ( |
            | 
            window platformWindow quartzWindow bringToFront.
            window platformWindow quartzWindow activate: true.
            window platformWindow quartzWindow setUserFocus.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fComment: no-op inside moveArrows after the full-window restore. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseAcetate: rect Colors: uiColors = ( |
            | 
            skipAcetateErase ifTrue: [ ^ self ].
            restoreStatic: rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow0: rect Transparent: transparent = ( |
            | restoreStatic: rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow1: rect Transparent: transparent = ( |
            | restoreStatic: rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         ersatzWorldMorphNameHolder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> 'ersatzWorldMorphNameHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics quartzTraits ersatzWorldMorphNameHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> 'ersatzWorldMorphNameHolder' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         name <- 'anon'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> 'ersatzWorldMorphNameHolder' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: fading acetate\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeInAcetate = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: 32-bit analog of X11 colormap acetate: interpolate item color between body (invisible on the slab) and text. In: true fades in after the slab is full size; false fades out before the slab shrinks. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeLayerText: layer In: fadingIn Animator: anim = ( |
             c.
             fromC.
             steps = 8.
             t.
             toC.
             w.
            | 
            w: layer world.
            fromC: fadingIn ifTrue: [layer uiColors body] False: [layer uiColors text].
            toC:   fadingIn ifTrue: [layer uiColors text] False: [layer uiColors body].
            0 to: steps Do: [ | :i |
                t: i asFloat / steps asFloat.
                c: fromC interpolate: t From: toC.
                w windowBitmap fillRectangle: layer zoomSlab front Color: layer uiColors body.
                layer drawItemsColor: c.
                w syncGraphics.
                times delay: anim delay.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: fading acetate\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeOutAcetate = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Comment: Time of last paced present. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         lastFrameTime <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: fading acetate\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAcetateVisible = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         makeOffscreenFor: win Size: sz = ( |
             b.
            | 
            b: bitmap copy.
            b image: (quartz rgbaPixmap createForSameScreenAs: win bitmap image Size: sz Depth: 32).
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: X11 draws the arrow on plane 0 then clears plane 1. 32-bit: draw then flush. Do not clear the window bitmap (that would wipe the scene).\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         moveArrowHeadUsing: moveBlock = ( |
            | 
            moveBlock value.
            window sync.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: X11 colormap-flips then times delay: 1. Direct restores the whole scene every frame; pace to targetFPS so Cocoa vsync can show the smear. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         moveArrows: doBlock Flip: flip = ( |
            | 
            restoreStatic: window bitmap size rect.
            skipAcetateErase: true.
            doBlock value.
            skipAcetateErase: false.
            window sync.
            paceFrame.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: 32-bit has no bitplanes or colormap acetate. X11 plane-mask / colormap-cycle animation is a no-op; the body still draws via displayThru / display.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         noPlaneMask = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         openWindowError = ( |
            | 
            'Could not open the Quartz ui1 window (direct).' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         openWindowOrCanvas: depth IfFail: fb = ( |
            | 
            [addWindowOnDisplay: dispName Bounds: b Limited: false].
            windowCanvas: 
              quartzGlobals windowCanvas
                copyOpenForWorld: (ersatzWorldMorphNameHolder copy name: window displayName)
                       OnDisplay: window displayName 
                              At: window position
                           Width: window size x 
                          Height: window size y.

            bufferCanvas: windowCanvas bufferCanvasForMyScreenBounds: (0@0) ## window size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         optimalNameForDisplay: disp = ( |
            | 
            'ui1 on ', disp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: Sleep only the leftover of 1/targetFPS since the last present. Late frames skip the wait. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         paceFrame = ( |
             elapsed.
             now.
             period.
             wait.
            | 
            (targetFPS asSmallInteger <= 0) ifTrue: [
                lastFrameTime: nil.
                ^ self
            ].
            now: times real.
            lastFrameTime ifNil: [ lastFrameTime: now. ^ self ].
            period: 1000.0 / (targetFPS asFloat max: 1.0).
            elapsed: now - lastFrameTime.
            wait: period - elapsed.
            wait >= 1 ifTrue: [ times delay: wait asInteger ].
            lastFrameTime: times real.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         patterns = ( |
            | macToolboxGlobals patterns).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         platformColormap = ( |
            | quartz colormap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         platformPixmap = ( |
            | 
            [xxxxx].
            quartz rgbaPixmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareForAnimationWithArrows = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToCopyAllLayers = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawArrows = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAcetate = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAcetate: w = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAll: w = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAllButArrow0: w = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0: w = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0InstallingBoth: w = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow1: w = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnBackground = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnInvisibleAcetate = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToMoveArrow0 = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToMoveArrow1 = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToMoveBlock = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToZoom = ( |
            | noPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Comment: Abstract present: graphic copyTo: offScreen, arrows on offScreen, offScreen copyTo: shadow, displayShadow presentToWindow. 0@0 BGRA snapshot copies carry sage+lobby pixels (sampled). Do not skip to graphic-only blit.\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         present: w = ( |
            | 
            resend.present: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: X11 erase of acetate/arrow planes: fill those bitplanes with transparent so the last-presented background shows through. 32-bit analog: copy that rect from acetateStatic (offScreen after present:, or graphic while a body is moving). sproutBodyFor: displays the new body onto graphic before the acetate grow, so restoring graphic flashed it. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         restoreStatic: rect = ( |
            | 
            window handler target world acetateStatic
                copy: rect To: window bitmap At: rect origin.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         returnFromSnapshot = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Comment: true: stretch text with the zooming slab. false: zoom an empty slab then fade text body-color \xe2\x86\x92 text-color (32-bit analog of X11 colormap acetate). Menus and sprouted bodies. Shared on traits so a running ui sees the slot after file-in. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         scaleText <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: moveArrows restores the whole static scene then draws; the X11 acetate erase in that block would punch the new arrows. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         skipAcetateErase <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: Stretch contents onto slab front. Nil contents is a no-op. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchContents: c Onto: slab Window: wb = ( |
            | 
            c ifNil: [^ self].
            (slab front width > 0) && [slab front height > 0] ifTrue: [
                c image copy: c size rect
                  StretchedTo: slab front
                            On: wb image.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Comment: Cap motion-blur presents at this many frames per second. 0 = uncapped. ui targetFPS: 60 -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: InitializeToExpression: (60)\x7fVisibility: public'
        
         targetFPS <- 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Comment: Same shape as x11Traits tryToOpenWindowForDisplay: open the window, then window finishOpening. Direct uses a windowCanvas, so install that platformWindow first. Same Verdana/Bold as indexed: Helvetica Neue Light+AA made slot names and contents fuzzy vs old ui1; Verdana Bold+AA was too heavy, so ui1 text draws with AA off. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         tryToOpenWindowForDisplay: disp IfFail: fb = ( |
            | 
            quartz lucidaSansFamily: 'Verdana'.
            quartz lucidaSansRomanSuffix: ''.
            quartz lucidaSansBoldSuffix: 'Bold'.
            resend.tryToOpenWindowForDisplay: disp IfFail: [|:e| ^ fb value: e].
            window platformWindow: windowCanvas platformWindow.
            window platformWindow makeRGBAShadow.
            window finishOpening.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         uiColorPalette = ( |
            | ui1 x11DirectColorPalette).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         windowPrototype = ( |
             w.
            | 
            w:  macToolboxGlobals window.
            [xxxxxxx].
            [[w bitmap depth > 8] assert.].
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot'
        
         worldPrototype = ( |
            | 
            [xxxxxxx].
            ui1 uiWorld).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: Slab-only zoom (no text). Used when layer text fades in after open / out before close. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         zoomEmptySlabFrom: s To: e Animator: anim Layer: layer = ( |
             pib.
             prev.
             w.
            | 
            pib: peakingInBetweener.
            anim noSlowInOut ifTrue: [ pib: linearInBetweener ].
            w: layer world.
            w prepareToDrawOnAcetate.
            prev: s.
            ((pib copyFrom: s To: e Steps: 8) delay: anim delay) do: [ | :newSlab |
                w eraseAcetate: (prev bound extend: 6).
                newSlab drawOn: w windowBitmap UIColors: layer uiColors.
                w syncGraphics.
                prev: newSlab.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct: 3-D slab plus front-face text scaled every frame, or empty-slab zoom then fade text. Layer understands world, uiColors, zoomSlab, contentsBitmapFromScreen:, drawItemsColor:. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomLayer: layer From: s To: e FromScreen: fromScreen Animator: anim = ( |
            | 
            scaleText ifTrue: [
                ^ zoomLayerScaling: layer From: s To: e FromScreen: fromScreen Animator: anim
            ].
            fromScreen ifTrue: [
                fadeLayerText: layer In: false Animator: anim.
                zoomEmptySlabFrom: s To: e Animator: anim Layer: layer.
                layer world eraseAcetate: (e bound extend: 6).
                layer world syncGraphics.
            ] False: [
                zoomEmptySlabFrom: s To: e Animator: anim Layer: layer.
                fadeLayerText: layer In: true Animator: anim.
            ].
            layer world prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: Zoom the 3-D slab with contents stretched onto the front face. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: private'
        
         zoomLayerScaling: layer From: s To: e FromScreen: fromScreen Animator: anim = ( |
             c.
             pib.
             prev.
             w.
            | 
            c: layer contentsBitmapFromScreen: fromScreen.
            pib: peakingInBetweener.
            anim noSlowInOut ifTrue: [ pib: linearInBetweener ].
            w: layer world.
            w prepareToDrawOnAcetate.
            prev: s.
            ((pib copyFrom: s To: e Steps: 8) delay: anim delay) do: [ | :newSlab |
                w eraseAcetate: (prev bound extend: 6).
                newSlab drawOn: w windowBitmap UIColors: layer uiColors.
                stretchContents: c Onto: newSlab Window: w windowBitmap.
                w syncGraphics.
                prev: newSlab.
            ].
            fromScreen ifTrue: [
                w eraseAcetate: (prev bound extend: 6).
                w syncGraphics.
            ].
            w prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'quartzTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct: 3-D slab plus front-face text scaled every frame. X11 zooms an empty slab then fades text in via colormap. fromScreen true is close (copy the drawn layer); false is open (render items). -- grok 08/26/26\x7fModuleInfo: Module: ui1OnQuartz InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomMenu: menu From: s To: e FromScreen: fromScreen Animator: anim = ( |
            | 
            zoomLayer: menu From: s To: e FromScreen: fromScreen Animator: anim).
        } | ) 



 '-- Side effects'

 globals modules ui1OnQuartz postFileIn
