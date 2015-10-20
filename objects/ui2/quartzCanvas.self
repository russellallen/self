 '$Revision: 30.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot'
        
         quartzCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules quartzCanvas.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bufferCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'bufferCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'clip' From:
             bootstrap remove: 'parent' From:
             globals abstractPixmapCanvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'bufferCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartzGlobals bufferCanvas.

CopyDowns:
globals abstractPixmapCanvas. copy 
SlotsToOmit: clip parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'bufferCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (nil)'
        
         layer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'bufferCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (nil)'
        
         winCanvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         fontDictionary = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'fontDictionary' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartzGlobals fontDictionary.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'fontDictionary' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         fonts <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'fontDictionary' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'quartzFontDictionary' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         windowCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'clip' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'platformWindow' From:
             globals abstractWindowCanvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartzGlobals windowCanvas.

CopyDowns:
globals abstractWindowCanvas. copy 
SlotsToOmit: clip parent platformWindow.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( | {
         'Comment: position of outer, top left corer on the screen\x7fModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (0@0)\x7fVisibility: private'
        
         cachedPosition <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( | {
         'Comment: size of whole window on the screen\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedSize <- (300)@(200).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (quartzGlobals unmappedPaintManager)'
        
         colorDict <- bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'unmappedPaintManager' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (quartzGlobals fontDictionary copyRemoveAll)\x7fVisibility: public'
        
         fontMap <- quartzGlobals fontDictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Canvas\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         quartzWindowCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartzWindowCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (quartz platformWindow deadCopy)\x7fVisibility: public'
        
         platformWindow <- quartz platformWindow deadCopy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'windowCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         redrawWindow <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c = ( |
            | 
            quartzCanvasTraits.bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            platformWindow close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         display = ( |
            | platformWindow display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         displayName = ( |
            | 
            display ifNil: 'quartz' IfNotNil: [ display name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = ( |
            | grafPort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsPending = ( |
            | platformWindow eventsPending).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | platformWindow gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         grafPort = ( |
            | platformWindow grafPort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: decoding update events\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSizeChanged = ( |
            | cachedSize != platformWindow size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         indexForColor: c = ( |
            | 
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         innerOriginOffsetFromBorder = ( |
            | 
            platformWindow innerOriginOffsetFromBorder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         innerPosition = ( |
            | 
            position + innerOriginOffsetFromBorder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | platformWindow ifNil: false IfNotNil: [|:w| w isOpen]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         nextEvent = ( |
            | platformWindow nextEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: opening and closing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWorld: wld OnDisplay: displayName At: pt Width: w Height: h = ( |
             bb.
             disp.
             insetDispBounds.
            | 
            bb: pt ## (w@h).
            disp: quartz directDisplay bestDisplayForBounds: bb.
            insetDispBounds: disp bounds indent: 30. "menu bar hack"
            bb: insetDispBounds intersect:  bb restrictTo: insetDispBounds.

            platformWindow: quartz platformWindow new.
            "w@h should be inside size, but size: below fixes it"
            platformWindow openDisplay: displayName 
                 BoundingBox: bb
                  WindowName: wld name.

            position: bb origin. "set cached position"
            size: bb size. "set cachedSize and make inside size w@h, not outside size"

            fontMap: fontMap copyRemoveAll.
            colorDict: colorDict copyForWindow: platformWindow Client: wld.
            imageDict: imageDict copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         peekEvent = ( |
            | platformWindow peekEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: image support\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: private'
        
         pixmapCacheEntry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> 'pixmapCacheEntry' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartzWindowCanvas pixmapCacheEntry.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmapCanvasPrototypeForMyScreen = ( |
            | 
            quartzGlobals bufferCanvas).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fComment: outer position\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | platformWindow isLive ifTrue: [platformWindow position] False: [cachedPosition]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fComment: outer position\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         position: pt = ( |
            | 
            cachedPosition: pt.
            platformWindow position: pt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'ModuleInfo: Module: quartzCanvas InitialContents: FollowSlot'
        
         quartzCanvasTraits* = bootstrap stub -> 'traits' -> 'quartzBufferCanvas' -> 'quartzCanvasTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         quartzWindow = ( |
            | platformWindow quartzWindow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fComment: inner size\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | platformWindow isLive ifTrue: [platformWindow size] False: [cachedSize]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: positioning and sizing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         size: pt = ( |
            | 
            cachedSize: pt.  
            platformWindow size: pt. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         translucentlyDo: blk = ( |
            | 
            quartzCanvasTraits.translucentlyDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Event = ( |
            | quartzGlobals ui2Event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         window = ( |
            | 
            platformWindow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withClip: newClip Do: blk = ( |
            | 
            quartzCanvasTraits.withClip: newClip Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: quartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         withMask: m Offset: o Do: blk = ( |
            | 
            quartzCanvasTraits.withMask: m Offset: o Do: blk).
        } | ) 



 '-- Side effects'

 globals modules quartzCanvas postFileIn
