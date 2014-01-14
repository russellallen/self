 'Sun-$Revision: 30.15 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot'
        
         ui = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            snapshotAction addSchedulerInitialMessage:
              message copy receiver: ui Selector: 'returnFromSnapshot'.
            ui invalidateCaches.
            ui slotsInPasteBuffer: vector.
            prompt updateUI: true.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         ui = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (ping)\x7fVisibility: private'
        
         alarm <- bootstrap stub -> 'globals' -> 'ping' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (realAnimator)\x7fVisibility: public'
        
         animator <- bootstrap stub -> 'globals' -> 'realAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (20@20)\x7fVisibility: private'
        
         bodyPos <- 20@20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (boxSize)\x7fVisibility: public'
        
         boxSizing <- bootstrap stub -> 'globals' -> 'boxSize' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)'
        
         cachedColormap0 <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)'
        
         cachedColormap1 <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)'
        
         cachedColormapBothArrowPlanes <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)'
        
         cachedColormapNoAcetate <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)\x7fVisibility: public'
        
         colormap0 <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)\x7fVisibility: public'
        
         colormap1 <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)\x7fVisibility: public'
        
         colormapBothArrowPlanes <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColormap)\x7fVisibility: public'
        
         colormapNoAcetate <- bootstrap stub -> 'globals' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (dummyAnimator)'
        
         danimator <- bootstrap stub -> 'globals' -> 'dummyAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: public'
        
         hiddenSlotDict <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isCacheValid <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: public'
        
         offscreenHomeDict <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         ui = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         prevDisplayName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (realAnimator)'
        
         ranimator <- bootstrap stub -> 'globals' -> 'realAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (false)'
        
         reporting <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (vector)\x7fVisibility: public'
        
         slotsInPasteBuffer <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         stopping <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'ui copy').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | ui).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiColorPalette)\x7fVisibility: public'
        
         uiColors <- bootstrap stub -> 'globals' -> 'uiColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiPatternPalette)\x7fVisibility: public'
        
         uiPatterns <- bootstrap stub -> 'globals' -> 'uiPatternPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: ( ( | isActive = false | ) )\x7fVisibility: private'
        
         uiProcess <-  ( | isActive = false | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         unflushableCache <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (uiWorld)\x7fVisibility: private'
        
         world <- bootstrap stub -> 'globals' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         activateUpdating = ( |
            | 
            alarm: ping copyMessage: (message copy receiver: self
                                                   Selector: 'updateCheaply')
                  RepeatingInterval: minUpdateInterval).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj = ( |
            | 
            ifRunning: [add: obj WithMessages: vector]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj At: pos = ( |
            | 
            ifRunning: [ | args |
                args: vector copySize: 2.
                args at: 0 Put: obj.
                args at: 1 Put: pos.
                handler queue: 'requestAdd:At:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m = ( |
            | 
            ifRunning: [
                add: obj WithMessages: list copyRemoveAll add: m ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 = ( |
            | 
            ifRunning: [ add: obj WithMessages: (m1 & m2) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 With: m3 = ( |
            | 
            ifRunning: [ add: obj WithMessages: (m1 & m2 & m3) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 With: m3 With: m4 = ( |
            | 
            ifRunning: [
                add: obj WithMessages: (m1 & m2 & m3 & m4) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 With: m3 With: m4 With: m5 = ( |
            | 
            ifRunning: [
                add: obj WithMessages: (m1 & m2 & m3 & m4 & m5) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj WithMessages: msgs = ( |
            | 
            ifRunning: [ | args |
                args: vector copySize: 2.
                args at: 0 Put: obj.
                args at: 1 Put: msgs.
                handler queue: 'requestAdd:WithMessages:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         addMirror: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestAddMirror:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         addMirror: mirr At: pos = ( |
            | 
            ifRunning: [
                handler queue: 'requestAddMirror:At:'
                           With: (mirr & pos) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         addMirror: mirr Sprout: name = ( |
            | 
            ifRunning: [
                handler queue: 'requestAddMirror:Sprout:'
                           With: (mirr & name) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         animationOff = ( |
            | 
            preferences blurBodies: false.
            animator: danimator.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         animationOn = ( |
            | 
            preferences blurBodies: true.
            animator: ranimator.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         anticipation = ( |
            | ranimator noAnticipation: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         arcs = ( |
            | ranimator straightLines: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         areEventsPending = ( |
            | handler messagesReady || [stdin dataReady]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         banishAll = ( |
            | 
            ifRunning: [ requestSend: 'banishAllBodies' To: world ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         beginRun = ( |
            | 
            (process this copySend: message copy receiver: self Selector: 'run')
              resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyPosInc = (10)@(20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyPosOrig = (20)@(20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         cacheFlushable = ( |
            | unflushableCache: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         cacheUnflushable = ( |
            | unflushableCache: true. invalidateCaches).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         checkCaches = ( |
            | 
            isCacheValid not || [window displayName != prevDisplayName]
              ifTrue: [ initializeCaches ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         checkColor8IfFail: fblock = ( |
             dispName.
            | 
            "get the interpreted display name before display is closed"
            dispName: window interpretedDisplayName.
            window isColor8 ifFalse: [
                interposeVirtual8BitWindowIfFail: [
                    window closeAsync.              
                    ('\nThe opened X display, \'', dispName,
                     '\', is not an 8-bit monitor.') printLine.
                    fblock value.
                ].
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapCacheFinalize = ( |
            | deleteCachedColormaps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapCacheInitialize = ( |
            | 
            uiColors restore.     "install personal color preferences"
            createCachedColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapFinalize = ( |
            | deleteColormaps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapInitialize = ( |
            | 
            makeAndConvertColormaps.
            installColormap0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         continue = ( |
            | beginRun).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         convertColormaps = ( |
            | 
            colormap0 colorsFromCache: cachedColormap0.
            colormap1 colorsFromCache: cachedColormap1.
            colormapBothArrowPlanes
                      colorsFromCache: cachedColormapBothArrowPlanes.
            colormapNoAcetate colorsFromCache: cachedColormapNoAcetate.
            ranimator convertColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Comment: usually, you should just use the prototype instead of copying your own\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy init).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         couldNotStart = ( |
            | 
            '\nCould not start the ui!\n' printLine.
            process this suspend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         createCachedColormaps = ( |
            | 
            deleteCachedColormaps.
            cachedColormap0: uiColormap copyWithRep: cachedColormap copy.
            cachedColormap1: uiColormap copyWithRep: cachedColormap copy.
            cachedColormapBothArrowPlanes:
                             uiColormap copyWithRep: cachedColormap copy.
            cachedColormapNoAcetate:
                             uiColormap copyWithRep: cachedColormap copy.
            fillCachedColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         createColormaps = ( |
            | 
            createCachedColormaps.
            convertColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         createRoot: mirr = ( | {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 bod.
                } 
            | 
            resetBodyPosition.
            bod: world sproutBodyFor: mirr
                      Constrain: [|:b| b location]
                             To: nextBodyPosition.
            world sproutTypeInFor: bod.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = ( |
            | window cursor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         deactivateUpdating = ( |
            | alarm stop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         deleteCachedColormaps = ( |
            | 
            cachedColormap0 delete.
            cachedColormap1 delete.
            cachedColormapBothArrowPlanes delete.
            cachedColormapNoAcetate delete.
            ranimator deleteCachedColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         deleteColormaps = ( |
            | 
            colormap0 delete.
            colormap1 delete.
            colormapBothArrowPlanes delete.
            colormapNoAcetate delete.
            ranimator deleteColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         demo = ( |
            | uiDemo start).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         desprout: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestDesprout:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         dummyAnimatorDo: block = ( | {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 save.
                } 
            | 
            save: animator.
            animator: danimator.
            block value.
            animator: save.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         exists: mirr = ( |
            | world exists: mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         fillCachedColormaps = ( |
            | 
            cachedColormap0 arrowPlane0MakeText: uiColors text
                                 TextBackground: uiColors body
                                     Background: uiColors background
                                          Arrow: uiColors arrow
                                         ColorA: uiColors bodyLight
                                         ColorB: uiColors unused
                                         ColorC: uiColors bodyDark
                                    Transparent: uiColors transparent
                             ArrowPlusTopPlanes: uiColors arrowPlusTopPlanes.

            cachedColormap1 arrowPlane1MakeText: uiColors text
                                 TextBackground: uiColors body
                                     Background: uiColors background
                                          Arrow: uiColors arrow
                                         ColorA: uiColors bodyLight
                                         ColorB: uiColors unused
                                         ColorC: uiColors bodyDark
                                    Transparent: uiColors transparent
                             ArrowPlusTopPlanes: uiColors arrowPlusTopPlanes.

            cachedColormapBothArrowPlanes
                        bothArrowPlanesMakeText: uiColors text
                                 TextBackground: uiColors body
                                     Background: uiColors background
                                          Arrow: uiColors arrow
                                         ColorA: uiColors bodyLight
                                         ColorB: uiColors unused
                                         ColorC: uiColors bodyDark
                                    Transparent: uiColors transparent
                             ArrowPlusTopPlanes: uiColors arrowPlusTopPlanes.

            cachedColormapNoAcetate makeNoAcetateFrom: cachedColormap0
                                          Transparent: uiColors transparent.
            ranimator createCachedColormapsUI: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: ending\x7fComment: _\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         finalize = ( |
            | 
            colormapFinalize.
            deactivateUpdating.
            world delete.
            finalizePatterns.
            boxSizing deleteFonts.
            window closeAsync.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         finalizePatterns = ( |
            | uiPatterns finalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         find: mirr Do: block = ( |
            | 
            find: mirr Do: block IfAbsent: missingBoxBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         find: mirr Do: block IfAbsent: missingBoxBlock = ( |
            | 
            world findBody: mirr
                   IfFound: [ | :box | block value: box. world display. ]
                    IfNone: [ missingBoxBlock value: mirr ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirst: fb IfPresent: pb IfAbsent: ab = ( |
            | 
            world bodies findFirst: fb IfPresent: pb IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         flushCaches = ( |
            | 
            colormapCacheFinalize.
            invalidateCaches.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         followThrough = ( |
            | ranimator noFollowThrough: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         forkAndSend: msg CauseOfBirth: birthString PutResultAt: pt = ( |
            | 
            "send msg asynchronously, reporting errors in a notifier,
             and put the result object on the screen point pt.
             May be called in ui process or in any other process -- dmu"
            ifRunning: [ | p |
                "fork for asynchrony"
                p: process this copySend: 
                    message copy receiver: self
                                 Selector: 'send:CatchErrorsAndPutResultAt:'
                                     With: msg
                                     With: pt.
                p causeOfBirth: birthString.
                p resume.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         fullScreen = ( |
            | (-5 @ -26) ##! (1280 @ 1024)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         fullScreenGXWithSpy = ( |
            | (-5 @ -26) ##! (1152 @ 797)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         fullSpeed = ( |
            | ranimator delay: preferences uiAnimationDelay).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fComment: update all objects on the world, stopping for naught & sync w/ sema\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         fullUpdate = ( |
            | 
            "so prompt can send this before ui is started"
            ifRunning: [| s. args. |
                s: semaphore copyBinary wait.
                args: (vector copySize: 1) at: 0 Put: s.
                handler queue: 'requestFullUpdate:' With: args.
                s wait.
                [areEventsPending] whileTrue.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         getInitialRectFrom: win = ( |
             lastRect.
             protoRect.
            | 
            preferences uiFullScreen ifTrue: [ ^ fullScreen ].
            lastRect: win position ##! win size.
            protoRect: ui1GraphicsGlobals window position ##! ui1GraphicsGlobals window size.
            lastRect = protoRect ifTrue: [ preferences initialWindowRect ]
                                  False: [ window position ##! window size ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         handler = ( |
            | window handler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         hide: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestHide:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         iconify: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestIconify:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         ifRunning: b = ( |
            | uiProcess isActive ifTrue: b. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         init = ( |
            | 
            hiddenSlotDict:    dictionary copyRemoveAll.
            offscreenHomeDict: dictionary copyRemoveAll.
            cachedColormap0:               cachedColormap0 copy.
            cachedColormap1:               cachedColormap1 copy.
            cachedColormapBothArrowPlanes: cachedColormapBothArrowPlanes copy.
            cachedColormapNoAcetate:       cachedColormapNoAcetate       copy.
            cacheUnflushable.
            resetInitialRect.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         initAnimators = ( |
            | 
            "animator is one of these guys"
            ranimator uiColors: uiColors.
            danimator uiColors: uiColors.
            ranimator uiPatterns: uiPatterns.
            danimator uiPatterns: uiPatterns.
            ranimator world: world.
            danimator world: world.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeCaches = ( | {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 sb.
                } 
            | 
            'initializing ui caches...' print.
            unflushableCache ifFalse: [ flushCaches ].

            prevDisplayName: window displayName.

            ranimator: realAnimator copy.
            danimator: dummyAnimator copy.
            animator: ranimator.

            initializeColorsAndPatterns.

            colormapCacheInitialize.
            validateCaches.
            ' done.' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeColorsAndPatterns = ( |
            | 
            uiColors: uiColorPalette copy.
            uiPatterns: uiPatternPalette copy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePatterns = ( |
            | uiPatterns initializeFor: window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         installColormap0 = ( |
            | colormap0 installAndFixMultiprocessorColormapBugIfPreferencesSaySo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         internalAdd: mirr = ( |
            | internalAdd: mirr Messages: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Blueprint: bp = ( |
            | 
            internalAdd: mirr Blueprint: bp At: nextBodyPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Blueprint: bp At: pos = ( |
            | 
            world findBody: mirr
                   IfFound: [ | :bod | bod raise ]
                    IfNone: [ world summonBodyFor: mirr Blueprint: bp
                                        Constrain: [ | :b | b location ]
                                               To: pos ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Messages: msgs = ( |
            | 
            internalAdd: mirr Messages: msgs At: nextBodyPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Messages: msgs At: pos = ( |
            | 
            world findBody: mirr
                   IfFound: [ | :bod | bod wiggle ]
                    IfNone: [ world summonBodyFor: mirr Messages: msgs
                                        Constrain: [ | :b | b location ]
                                               To: pos ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: emulating\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         interposeVirtual8BitWindowIfFail: fb = ( |
             tryExperiment = bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            [todo ui1 dmu experimental].
            tryExperiment ifFalse: [
              ^ fb value: 'not trying'
            ].
            window: virtual8BitWindow copyForWindow: window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         invalidateAllColormaps = ( |
            | 
            cachedColormap0 invalidate.
            cachedColormap1 invalidate.
            cachedColormapBothArrowPlanes invalidate.
            cachedColormapNoAcetate invalidate.
            colormap0 invalidate.
            colormap1 invalidate.
            colormapBothArrowPlanes invalidate.
            colormapNoAcetate invalidate.
            ranimator invalidateAllColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         invalidateCaches = ( |
            | isCacheValid: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown: keycode String: str At: pos Event: event = ( |
            | 
            resend.keyDown: keycode String: str At: pos Event: event.
            (world componentContaining: pos) keyPress: keycode String: str.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDownAt: pos Event: event = ( |
            | 
            resend.leftButtonDownAt: pos Event: event.
            (world componentContaining: pos) leftButtonDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonUpAt: pos Event: event = ( |
            | 
            resend.leftButtonUpAt: pos Event: event.
            (world componentContaining: pos) leftButtonUp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         linearlySpaced = ( |
            | ranimator noSlowInOut: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowManagement\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         lower = ( |
            | window lower).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         makeAndConvertColormaps = ( |
            | 
            colormap0: uiColormap copyWithRep:
                                     cachedColormap0 convertForWindow: window.
            colormap1: uiColormap copyWithRep:
                                     cachedColormap1 convertForWindow: window.
            colormapBothArrowPlanes: uiColormap copyWithRep:
                       cachedColormapBothArrowPlanes convertForWindow: window.
            colormapNoAcetate:
              uiColormap copyWithRep:
                            cachedColormapNoAcetate convertForWindow: window.
            ranimator makeAndConvertColormapsFor: window.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         makeCachedColormap0 = ( |
            | 
            cachedColormap0 delete.
            cachedColormap0: uiColormap copyWithRep: cachedColormap copy.
            cachedColormap0 arrowPlane0MakeText: uiColors text
                                 TextBackground: uiColors body
                                     Background: uiColors background
                                          Arrow: uiColors arrow
                                         ColorA: uiColors bodyLight
                                         ColorB: uiColors unused
                                         ColorC: uiColors bodyDark
                                    Transparent: uiColors transparent
                             ArrowPlusTopPlanes: uiColors arrowPlusTopPlanes.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: colormapHandling\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         makeColormap0 = ( |
            | 
            makeCachedColormap0.
            colormap0 colorsFromCache: cachedColormap0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: updateParameters\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         maxUpdateInterval = 60000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDownAt: pos Event: event = ( |
            | 
            resend.middleButtonDownAt: pos Event: event.
            (world componentContaining: pos) middleButtonDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonUpAt: pos Event: event = ( |
            | 
             resend.middleButtonUpAt: pos Event: event.
             (world componentContaining: pos) middleButtonUp. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: updateParameters\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         minUpdateInterval = 3000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         missingBoxBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui' -> 'missingBoxBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui missingBoxBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'missingBoxBlock' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'missingBoxBlock' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot'
        
         value: mirr = ( |
            | 
            warning: mirr name, ' is not currently displayed on the ui').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         missingSlotBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui' -> 'missingSlotBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui missingSlotBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'missingSlotBlock' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'missingSlotBlock' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot'
        
         value: name With: mirr = ( |
            | 
            warning: mirr name, ' does not have a slot "', name, '"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         motionBlur = ( |
            | preferences blurBodies: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         move: mirr To: pos = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestMove:To:'
                           With: (mirr & pos) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         nextBodyPosition = ( |
            | 
            bodyPos: bodyPos + bodyPosInc.
            (size rect includes: bodyPos) ifFalse: [ resetBodyPosition ].
            bodyPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         noAnticipation = ( |
            | ranimator noAnticipation: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         noFollowThrough = ( |
            | ranimator noFollowThrough: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         noMotionBlur = ( |
            | preferences blurBodies: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         openWindowError = ( |
            | 
            'The ui runs only on an 8-bit color X display.' printLine.
            ''                                              printLine.
            'To change the ui display type:               ' printLine.
            '  preferences xDisplay: \'YOUR-DISPLAY\' '     printLine.
            ''                                              printLine.
            'To start the ui type:'                         printLine. 
            '  ui demo'                                     printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         openWindowOn: disp = ( |
             rect.
            | 
            ui1GraphicsGlobals: disp isEmpty ifTrue: [error: 'No Display'] False: [x11Globals].
            rect: getInitialRectFrom: ui1GraphicsGlobals window.
            [todo ui1 dmu experimental].
            window: ui1GraphicsGlobals window copy.
            window name: 'The Self World'.
            window iconName: 'ui'.
            window iconFilename: preferences uiIconFile.
            window position: rect topLeft.
            window size: rect size.
            window useQueueingHandlerFor: self.
            tryToOpenWindowForDisplay: disp IfFail: [ | :err |
                ('\n', err) printLine.
                openWindowError.
                couldNotStart.
            ].
            checkColor8IfFail: [ 
                openWindowError.
                couldNotStart
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         optimalNameForDisplay: disp = ( |
             myhost.
            | 
            disp isEmpty  ifTrue: [^'']. "Carbon"
            myhost: os nodename , ':'.
            (myhost isPrefixOf: disp) ifTrue: [ 
               "use :0 rather than name:0 -- much faster"
               disp copyFrom: myhost size - 1
            ] False: [
               disp
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         queueingParent* = bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         quit = ( |
            | handler queue: 'realQuit' With: vector copySize: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowManagement\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         raise = ( |
            | window raise).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         raise: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestRaise:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         realQuit = ( |
            | programmingLog close. stopping: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: releasing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjects = ( |
            | 
            "send from memory prior to GC"
            releaseUnneededHiddenSlotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: releasing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         releaseUnneededHiddenSlotInfo = ( |
            | 
            hiddenSlotDict: hiddenSlotDict copyFilteredBy: [
                | :slots. :mir |
                world exists: mir
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestRemove:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         removeRequests: str = ( |
            | handler removeMessages: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         repopulate: bods = ( |
            | 
            bods reverseDo: [ | :bod | bod resproutOn: world ].
            textEditorDisplayGlitchHack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestAdd: obj At: pos = ( |
            | 
            internalAdd: (reflect: obj) Messages: list copyRemoveAll At: pos.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestAdd: obj WithMessages: msgs = ( |
            | 
            internalAdd: (reflect: obj) Messages: msgs.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestAddMirror: mirr = ( |
            | 
            internalAdd: mirr Messages: vector.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestAddMirror: mirr At: pos = ( |
            | 
            internalAdd: mirr Messages: list copyRemoveAll At: pos.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestAddMirror: mirr Sprout: name = ( | {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 bod.
                } 
            | 
            bod: internalAdd: mirr Messages: vector.
            bod sprout: name IfAbsent: missingSlotBlock.
            bod raise.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestDesprout: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod desprout: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestFullUpdate: s = ( |
            | 
            world updateBodiesUntil: false.
            s signal.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestHide: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod hide: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestIconify: mirr = ( |
            | 
            find: mirr Do: [ | :bod | bod iconifyRemainCentered ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestMove: mirr To: pos = ( |
            | 
            find: mirr Do: [ | :bod | bod moveTo: pos ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestRaise: mirr = ( |
            | find: mirr Do: [ | :bod | bod raise ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestRemove: mirr = ( |
            | find: mirr Do: [ | :bod | bod banish ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestSend: unaryMsg To: obj = ( |
            | 
            "sends a message within the ui process"
            "if the message causes an error, the ui crashes"
            unaryMsg sendTo: obj.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestSend: msg To: obj Args: args = ( |
            | 
            "sends a message within the ui process"
            "if the message causes an error, the ui crashes"
            msg sendTo: obj WithArguments: args.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestShow: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod show: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestShowAll: mirr = ( |
            | 
            find: mirr Do: [ | :bod | bod showAll ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestShowContentsOf: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod showContentsOf: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestSprout: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod sprout: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestUpdate = ( |
            | 
            removeRequests: 'update'.
            world updateBodiesUntil: [areEventsPending].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestUpdate: mirr = ( |
            | 
            find: mirr Do: [ | :bod | bod update ] IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         requestUpdateCheaply = ( |
             actualDutyCycle.
             debug = bootstrap stub -> 'globals' -> 'false' -> ().
             finishTime <- 0.
             startTime <- 0.
             stopTime <- 0.
            | 
            removeRequests: 'updateCheaply'.
            startTime: times real.
            stopTime:  startTime + (alarm interval * updateDutyCycle) round.
            world updateBodiesUntil: [
                areEventsPending  ||  [times real > stopTime]
            ].
            finishTime: times real.

            "Try to adjust update interval to achieve desired duty cycle.
             Since there is an epilog time (after the time test),
             This will probably oscillate, but it should be ok--dmu"

            areEventsPending ifTrue: [^self]. "cannot tell in this case"
            finishTime > stopTime ifTrue: [
                "ran out of time"      
                alarm interval: maxUpdateInterval min: alarm interval * 2.
                ^self.
            ].
            actualDutyCycle: (finishTime - startTime) /= alarm interval.

            debug ifTrue: [ alarm interval print. ' -> ' print. ].
            alarm interval: 
              minUpdateInterval max: 
                maxUpdateInterval min:
                   (alarm interval * (actualDutyCycle / updateDutyCycle))
                      round asSmallInteger.
            debug ifTrue: [ alarm interval printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         resetBodyPosition = ( |
            | bodyPos: bodyPosOrig).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         resetInitialRect = ( |
            | 
            window: ui1GraphicsGlobals window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         resetWindowRect = ( |
            | 
            "send this when the ui is not running to force the
             next ui start to use preferences initialWindowRect"
            "do not send this to a running ui!"
            window: ui1GraphicsGlobals window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         respond = ( |
            | 
            [ stopping ] whileFalse: [ handler next ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         restart = ( | {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 bods.
                } 
            | 
            bods: world bodies.
            setUpOn: preferences xDisplay Initial: [
              bods isEmpty ifTrue: [ createRoot: reflect: startObj ]
                            False: [ repopulate: bods              ]
            ].
            beginRun.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         returnFromSnapshot = ( |
            | 
            stopping ifFalse: [ 
              "hack to avoid starting ui1 unintentionally"
              invalidateAllColormaps.
              cacheUnflushable.
              restart.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDownAt: pos Event: event = ( |
            | 
            resend.rightButtonDownAt: pos Event: event.
            (world componentContaining: pos) rightButtonDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonUpAt: pos Event: event = ( |
            | 
            resend.rightButtonUpAt: pos Event: event.
            (world componentContaining: pos) rightButtonUp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: _\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         run = ( |
            | 
            uiProcess: process this.
            programmingLog open.
            respond.
            finalize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         send: msg CatchErrorsAndPutResultAt: pt = ( | {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            "send msg, reporting errors in a notifier, and putting the result
             in the desired place on screen. Probably wont work if 
             called in the ui process -- dmu"
            ifRunning: [ | p |
              r: msg sendIfFail: [| :errObj |
                uiNotifier copySyncOn: world
                              Message: errObj errorString
                                   At: pt.
                ^ self
              ].
              fullUpdate.
              add: r At: pt.
             ].
             r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         send: unaryMsg To: obj = ( |
            | 
            "sends a message within the ui process"
            "if the message causes an error, the ui crashes"
            ifRunning: [
                handler queue: 'requestSend:To:'
                         With: (unaryMsg & obj) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         send: msg To: obj Args: args = ( |
            | 
            "sends a message within the ui process"
            "if the message causes an error, the ui crashes"
            ifRunning: [
                handler queue: 'requestSend:To:Args:'
                         With: (msg & obj & args) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         setBoxSizing = ( |
            | boxSizing: boxSize copyFor: window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         setUpOn: disp Initial: createObjBlock = ( |
            | 
            openWindowOn: disp.

            setBoxSizing.

            checkCaches.
            ranimator delay: preferences uiAnimationDelay.
            danimator delay: preferences uiAnimationDelay.

            initializePatterns.

            colormapInitialize.

            world: (window isColor8 ifTrue: [uiWorld] False: [uiWorld32]) copy createForUI: self.

            initAnimators.

            dummyAnimatorDo: createObjBlock.

            activateUpdating.
            stopping: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         show: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestShow:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         showAll: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestShowAll:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         showContentsOf: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestShowContentsOf:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | window size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         slowInOut = ( |
            | ranimator noSlowInOut: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         slowMotion = ( |
            | ranimator delay: slowness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         slowness <- 200.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestSprout:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | startOn: preferences xDisplay).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         startObj = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         startOn: disp = ( |
            | startOn: disp With: startObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         startOn: disp With: obj = ( |
            | 
            setUpOn: disp Initial: [ createRoot: reflect: obj ].
            beginRun.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         startWith: obj = ( |
            | 
            startOn: preferences xDisplay With: obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui InitialContents: FollowSlot'
        
         straightLines = ( |
            | ranimator straightLines: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | testOn: preferences xDisplay).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         testDeleting = ( |
            | 
            world bodies first banish.
            world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         testDesprouting = ( |
            | 
            ((world bodies last) slots first) contents button desprout.
            world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         testGo = ( |
            | 
            world display.
            world banishAllBodies.
            internalAdd: reflect: lobby. 

            requestShowAll: reflect: lobby.
            testSprouting: 2.  "test sprouting <a large method>"
            testSprouting: 1.
            testDesprouting.
            testDeleting.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         testIfBadDisplay: fblock = ( |
             disp.
            | 
            disp: preferences xDisplay.
            testUI parent: ui copy.
            testUI window: x11Globals window copy.
            testUI tryToOpenWindowForDisplay: disp
                   IfFail: [ | :err | ^ fblock value: err ].
            testUI checkColor8IfFail: [ ^ fblock value: 'not 8-bit monitor' ].
            testUI window closeAsync.
            test).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         testOn: disp = ( |
            | 
            testUI parent: ui copy.
            testUI setUpOn: disp Initial: [ testUI createRoot: reflect: lobby].
            testUI testGo.
            testUI finalize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         testSprouting: n = ( | {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 clickOnMe.
                }  {
                 'ModuleInfo: Module: ui InitialContents: FollowSlot'
                
                 i <- 0.
                } 
            | 
            world bodies first showAll.
            world bodies first slots size < n ifTrue: [
                error: 'not that many slots in this object' ].
            world bodies first slots do: [ | :slot |
                i: i succ.  
                i = n ifTrue: [ clickOnMe: slot contents button ]. ].
            clickOnMe sprout.
            world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         testUI = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui testUI.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui testUI cursor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         moveTo: pt = ( |
            | location: pt. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         while: whileBlock Do: doBlock = ( |
            | 
            location:  location + (100@100).
            doBlock value: location.
            doBlock value: location. "for motion blur"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         makeTransporterPutMeAfter = bootstrap stub -> 'globals' -> 'ui' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: InitializeToExpression: (ui copy)\x7fVisibility: private'
        
         parent* <- ui copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | traits ui testUI).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         textEditorDisplayGlitchHack = ( |
            | 
            "This hack fixes a texteditor display glitch"
            world bodies do: [|:e |
             ((reflect: e) lookupKey: 'methodView') isEmpty ifFalse: [
               e onTop ifTrue: [ e methodView draw. e methodView basicDraw ]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: private'
        
         tryToOpenWindowForDisplay: disp IfFail: fblock = ( |
            | 
            window displayName:  optimalNameForDisplay: disp.
            [todo ui1 dmu experimental].
            disp isEmpty "hack" 
                ifTrue: [window openIfFail: fblock]
                 False: [window openDepth: 8 IfFail: fblock].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fComment: update all objects on the world, stopping only for events\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         update = ( |
            | 
            "so prompt can send this before ui is started"
            ifRunning: [ | args = vector copySize: 0 |
                handler queue: 'requestUpdate' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         update: aMirror = ( |
            | "update this particular object (if visible)"
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: aMirror.
                handler queue: 'requestUpdate:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fComment: update all objects on the world, stopping for events, 
               but do not use too much time\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         updateCheaply = ( |
            | 
            ifRunning: [ | args = vector copySize: 0 |
                handler queue: 'requestUpdateCheaply' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: updateParameters\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDutyCycle = 0.1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         validateCaches = ( |
            | isCacheValid: true. cacheFlushable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         windowChanged: rect Event: event = ( |
            | 
            resend.windowChanged: rect Event: event.
            world windowChanged.
            world draw.
            resetBodyPosition.
            world display.
            textEditorDisplayGlitchHack.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         windowExposed: rect Last: last Event: event = ( |
            | 
            resend.windowExposed: rect Last: last Event: event.
            last ifTrue: [
              world display.
              textEditorDisplayGlitchHack
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui InitialContents: FollowSlot\x7fVisibility: public'
        
         windowQuit: win Event: event = ( |
            | 
            resend.windowQuit: win Event: event.
            quit).
        } | ) 



 '-- Side effects'

 globals modules ui postFileIn
