 'Sun-$Revision: 30.15 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         ui1 = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            snapshotAction addSchedulerInitialMessage:
              message copy receiver: ui1 ui Selector: 'returnFromSnapshot'.
            ui1 ui invalidateCaches.
            ui1 ui slotsInPasteBuffer: vector.
            prompt updateUI: true.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui1\x7fComment: So the demo my fingers know will work. \"togglers all\"\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         togglers = ( |
            | ui1 togglers).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui1\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         ui = ( |
            | ui1 ui).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui1\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         ui1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         ui = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 ui.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (ping)\x7fVisibility: private'
        
         alarm <- bootstrap stub -> 'globals' -> 'ping' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (ui1 realAnimator)\x7fVisibility: public'
        
         animator <- bootstrap stub -> 'globals' -> 'ui1' -> 'realAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (20@20)\x7fVisibility: private'
        
         bodyPos <- 20@20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (ui1 boxSize)\x7fVisibility: public'
        
         boxSizing <- bootstrap stub -> 'globals' -> 'ui1' -> 'boxSize' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (ui1 dummyAnimator)'
        
         danimator <- bootstrap stub -> 'globals' -> 'ui1' -> 'dummyAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (traits ui1 graphics x11)\x7fVisibility: public'
        
         graphics <- bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: public'
        
         hiddenSlotDict <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isCacheValid <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: public'
        
         offscreenHomeDict <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         ui = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 ui.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (ui1 realAnimator)'
        
         ranimator <- bootstrap stub -> 'globals' -> 'ui1' -> 'realAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (false)'
        
         reporting <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (vector)\x7fVisibility: public'
        
         slotsInPasteBuffer <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         stopping <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'ui1 ui copy').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | ui1 ui).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         uiColors.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (ui1 uiPatternPalette)\x7fVisibility: public'
        
         uiPatterns <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: ( ( | isActive = false | ) )\x7fVisibility: private'
        
         uiProcess <-  ( | isActive = false | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         unflushableCache <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (ui1 uiWorld)\x7fVisibility: private'
        
         world <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         ui1 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         graphics = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         abstract = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstract' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics abstract.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: traits\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics abstractTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstract' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         prevDisplayName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: X11 paints ones on an arrow bitplane; the colormap shows it as arrow. Direct ones is white paint. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowAnimColorFrom: uiColors = ( |
            | uiColors ones).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         boxSizePlatformMixin = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         couldNotStart = ( |
            | 
            '\nCould not start the ui!\n' printLine.
            process this suspend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseAcetate: rect Colors: uiColors = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow0: rect Transparent: transparent = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow1: rect Transparent: transparent = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: fading acetate\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeInAcetate = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct interpolates text body \xe2\x86\x92 text after the slab is full size. X11 no-op (colormap acetate). -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeLayerText: layer In: fadingIn Animator: anim = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: fading acetate\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         fadeOutAcetate = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         finalize = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         flushCaches = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeColorCachesColors: uiColors Animator: ranimator = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeColorsWindow: window Animator: ranimator = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: fading acetate\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAcetateVisible = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         makeOffscreenFor: win Size: sz = ( |
            | 
            subclassResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         optimalNameForDisplay: disp = ( |
            | '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         patterns = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         platformColormap = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         platformPixmap = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAll: w = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAllButArrow0: w = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0: w = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0InstallingBoth: w = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow1: w = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnInvisibleAcetate = ( |
            | 
            childResponsibility.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: drawing\x7fComment: the pre-seam ui1 uiWorld display body: render to the X window and flush. X needs no offscreen shadow/blit. -- claude & dmu 6/2026\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         present: w = ( |
            | 
            w displayNoUpdate.
            w update.
            w syncGraphics.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: Alias of scaleText. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleMenuText = ( |
            | scaleText).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: Alias of scaleText:. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleMenuText: b = ( |
            | scaleText: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct stores the flag on its traits. X11 ignores; zoom still does colormap acetate. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleText = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct stores the flag on its traits. X11 ignores; zoom still does colormap acetate. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         scaleText: b = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct stretches a contents bitmap onto the slab front. X11 no-op. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         stretchContents: c Onto: slab Window: wb = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fComment: Direct paces presents to this fps. X11 moveArrows already delays 1. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         targetFPS = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         targetFPS: n = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         tryToOpenWindowForDisplay: disp IfFail: fb = ( |
            | 
            window displayName: optimalNameForDisplay: disp.
            openWindowOrCanvas: windowDepth IfFail: [|:e| ^ fb value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: window\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         window = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: window\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         windowDepth = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         windowPrototype = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         worldPrototype = ( |
            | 
            childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: behaviors\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyNamed: nm = ( |
            | 
            (prototypeNamed: nm) copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: behaviors\x7fComment: Map a backend name to its backend object. quartz/direct (and empty on macOS) -> 32-bit Quartz; anything else is X11. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeNamed: nm = ( |
            | 
            ((nm = 'quartz') || [nm = 'direct']) ifTrue: [^ quartz].
            (nm isEmpty && [host osName == 'macOSX']) ifTrue: [^ quartz].
            x11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: traits\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         x11Traits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11Traits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         activateUpdating = ( |
            | 
            [updateCheaply]. "browsing"
            alarm: ping copyMessage: (message copy receiver: self
                                                   Selector: 'updateCheaply')
                  RepeatingInterval: minUpdateInterval).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj = ( |
            | 
            ifRunning: [add: obj WithMessages: vector]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj At: pos = ( |
            | 
            ifRunning: [ | args |
                args: vector copySize: 2.
                args at: 0 Put: obj.
                args at: 1 Put: pos.
                handler queue: 'requestAdd:At:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m = ( |
            | 
            ifRunning: [
                add: obj WithMessages: list copyRemoveAll add: m ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 = ( |
            | 
            ifRunning: [ add: obj WithMessages: (m1 & m2) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 With: m3 = ( |
            | 
            ifRunning: [ add: obj WithMessages: (m1 & m2 & m3) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 With: m3 With: m4 = ( |
            | 
            ifRunning: [
                add: obj WithMessages: (m1 & m2 & m3 & m4) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj With: m1 With: m2 With: m3 With: m4 With: m5 = ( |
            | 
            ifRunning: [
                add: obj WithMessages: (m1 & m2 & m3 & m4 & m5) asList ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: obj WithMessages: msgs = ( |
            | 
            ifRunning: [ | args |
                args: vector copySize: 2.
                args at: 0 Put: obj.
                args at: 1 Put: msgs.
                handler queue: 'requestAdd:WithMessages:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         addMirror: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestAddMirror:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         addMirror: mirr At: pos = ( |
            | 
            ifRunning: [
                handler queue: 'requestAddMirror:At:'
                           With: (mirr & pos) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         addMirror: mirr Sprout: name = ( |
            | 
            ifRunning: [
                handler queue: 'requestAddMirror:Sprout:'
                           With: (mirr & name) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         animationOff = ( |
            | 
            preferences blurBodies: false.
            animator: danimator.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         animationOn = ( |
            | 
            preferences blurBodies: true.
            animator: ranimator.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         anticipation = ( |
            | ranimator noAnticipation: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         arcs = ( |
            | ranimator straightLines: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         areEventsPending = ( |
            | handler messagesReady || [stdin dataReady]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: 0-1 density for arrow motion blur (X11 stipple and Direct alpha). ui arrowBlur: 0.5 -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowBlur = ( |
            | preferences arrowBlur).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Set density 0-1 and rebuild every live ui clone. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowBlur: p = ( |
            | 
            preferences arrowBlur: p asFloat.
            runningUIsDo: [ | :u |
                u uiPatterns blurArrow setDensity: preferences arrowBlur.
                u uiPatterns blurArrow createFor: u window.
            ].
            preferences arrowBlur).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Arrow motion blur only. Boxes have motionBlur. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         arrowMotionBlur = ( |
            | preferences blurArrows: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         banishAll = ( |
            | 
            ifRunning: [ requestSend: 'banishAllBodies' To: world ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         beginRun = ( |
            | 
            [run]. "browsing"
            (process this copySend: message copy receiver: self Selector: 'run')
              resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyPosInc = (10)@(20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         bodyPosOrig = (20)@(20).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         cacheFlushable = ( |
            | unflushableCache: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         cacheUnflushable = ( |
            | unflushableCache: true. invalidateCaches).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         checkCaches = ( |
            | 
            isCacheValid not || [graphics window displayName != graphics prevDisplayName]
              ifTrue: [ initializeCaches ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         closeAllWindows = ( |
            | 
            (browse childrenOf: traits ui1 ui) do: [|:x| x reflectee closeWindow]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         closeWindow = ( |
            | window close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         continue = ( |
            | beginRun).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Comment: usually, you should just use the prototype instead of copying your own\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            ( resend.copy graphics: graphics copy) init).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         createRoot: mirr = ( | {
                 'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
                
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fComment: In order for \"ui1 togglers all\" to work in a copy of the ui1 ui,
(e.g. \"ui1 ui copy start\"),
the ui1 togglers all method, run from a descendant of ui1 editorWithReceiver,
must have some way of figuring out which ui1 uiWorld to put the new ui1 togglers into.
-- dmu 7/26\x7fModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (nil)'
        
         currentWorld <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = ( |
            | window cursor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         deactivateUpdating = ( |
            | alarm stop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         demo = ( |
            | ui1 uiDemo start).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         desprout: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestDesprout:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         dummyAnimatorDo: block = ( | {
                 'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
                
                 save.
                } 
            | 
            save: animator.
            animator: danimator.
            block value.
            animator: save.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         ensureFrontmost = ( |
            | graphics ensureFrontmost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         exists: mirr = ( |
            | world exists: mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Alias of fadeTextIn. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         fadeMenuTextIn = ( |
            | fadeTextIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Direct: zoom an empty slab then fade text color body \xe2\x86\x92 text (old ui1 colormap acetate). Menus and sprouted bodies. No-op setter on X11 graphics. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         fadeTextIn = ( |
            | 
            graphics scaleText: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: ending\x7fComment: _\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         finalize = ( |
            | 
            graphics finalize.
            deactivateUpdating.
            world delete.
            finalizePatterns.
            boxSizing deleteFonts.
            window closeAsync.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         finalizePatterns = ( |
            | uiPatterns finalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         find: mirr Do: block = ( |
            | 
            find: mirr Do: block IfAbsent: missingBoxBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         find: mirr Do: block IfAbsent: missingBoxBlock = ( |
            | 
            world findBody: mirr
                   IfFound: [ | :box | block value: box. world display. ]
                    IfNone: [ missingBoxBlock value: mirr ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirst: fb IfPresent: pb IfAbsent: ab = ( |
            | 
            world bodies findFirst: fb IfPresent: pb IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         flushCaches = ( |
            | 
            graphics flushCaches.
            invalidateCaches.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         followThrough = ( |
            | ranimator noFollowThrough: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         forkAndSend: msg CauseOfBirth: birthString PutResultAt: pt = ( |
            | 
            "send msg asynchronously, reporting errors in a notifier,
             and put the result object on the screen point pt.
             May be called in ui1 ui process or in any other process -- dmu"
            [send: 0 CatchErrorsAndPutResultAt: 0]. "browsing"
            ifRunning: [ | p |
                "fork for asynchrony"
                p: process this copySend: 
                    message copy receiver: self
                                 Selector: 'send:CatchErrorsAndPutResultAt:'
                                     With: msg
                                     With: pt.
                p causeOfBirth: birthString.
                currentWorld: world.
                p resume.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         fullScreen = ( |
            | (-5 @ -26) ##! (1280 @ 1024)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         fullScreenGXWithSpy = ( |
            | (-5 @ -26) ##! (1152 @ 797)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         fullSpeed = ( |
            | ranimator delay: preferences uiAnimationDelay).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fComment: update all objects on the world, stopping for naught & sync w/ sema\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         fullUpdate = ( |
            | 
            "so prompt can send this before ui1 ui is started"
            ifRunning: [| s. args. |
                s: semaphore copyBinary wait.
                args: (vector copySize: 1) at: 0 Put: s.
                handler queue: 'requestFullUpdate:' With: args.
                s wait.
                [areEventsPending] whileTrue.]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         getInitialRectFrom: win = ( |
             lastRect.
             protoRect.
            | 
            preferences uiFullScreen ifTrue: [ ^ fullScreen ].
            lastRect: win position ##! win size.
            protoRect: windowPrototype position ##! windowPrototype size.
            lastRect = protoRect ifTrue: [ preferences initialWindowRect ]
                                  False: [ window position ##! window size ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         handler = ( |
            | window handler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         hide: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestHide:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         iconify: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestIconify:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         ifRunning: b = ( |
            | uiProcess isActive ifTrue: b. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         init = ( |
            | 
            hiddenSlotDict:    dictionary copyRemoveAll.
            offscreenHomeDict: dictionary copyRemoveAll.
            cacheUnflushable.
            resetInitialRect.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeCaches = ( |
             sb.
            | 
            'initializing ui caches...' print.
            unflushableCache ifFalse: [ flushCaches ].

            graphics prevDisplayName: window displayName.

            ranimator: ui1 realAnimator copy.
            danimator: ui1 dummyAnimator copy.
            animator: ranimator.

            initializeColorsAndPatterns.

            uiColors restore.     "install personal color preferences"
            graphics initializeColorCachesColors: uiColors Animator: ranimator.

            validateCaches.
            ' done.' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeColorsAndPatterns = ( |
            | 
            uiColors: graphics uiColorPalette copy.
            uiPatterns: ui1 uiPatternPalette copy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePatterns = ( |
            | 
            uiPatterns initializeFor: window Patterns: graphics patterns).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         internalAdd: mirr = ( |
            | internalAdd: mirr Messages: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Blueprint: bp = ( |
            | 
            internalAdd: mirr Blueprint: bp At: nextBodyPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Blueprint: bp At: pos = ( |
            | 
            world findBody: mirr
                   IfFound: [ | :bod | bod raise ]
                    IfNone: [ world summonBodyFor: mirr Blueprint: bp
                                        Constrain: [ | :b | b location ]
                                               To: pos ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Messages: msgs = ( |
            | 
            internalAdd: mirr Messages: msgs At: nextBodyPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: addingObjects\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         internalAdd: mirr Messages: msgs At: pos = ( |
            | 
            world findBody: mirr
                   IfFound: [ | :bod | bod wiggle ]
                    IfNone: [ world summonBodyFor: mirr Messages: msgs
                                        Constrain: [ | :b | b location ]
                                               To: pos ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         invalidateCaches = ( |
            | isCacheValid: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown: keycode String: str At: pos Event: event = ( |
            | 
            resend.keyDown: keycode String: str At: pos Event: event.
            (world componentContaining: pos) keyPress: keycode String: str.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDownAt: pos Event: event = ( |
            | 
            resend.leftButtonDownAt: pos Event: event.
            (world componentContaining: pos) leftButtonDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonUpAt: pos Event: event = ( |
            | 
            resend.leftButtonUpAt: pos Event: event.
            (world componentContaining: pos) leftButtonUp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         linearlySpaced = ( |
            | ranimator noSlowInOut: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowManagement\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         lower = ( |
            | window lower).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: updateParameters\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         maxUpdateInterval = 60000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Alias of textScalesWithSlab. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         menuTextScalesWithSlab = ( |
            | textScalesWithSlab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDownAt: pos Event: event = ( |
            | 
            resend.middleButtonDownAt: pos Event: event.
            (world componentContaining: pos) middleButtonDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonUpAt: pos Event: event = ( |
            | 
             resend.middleButtonUpAt: pos Event: event.
             (world componentContaining: pos) middleButtonUp. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: updateParameters\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         minUpdateInterval = 3000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         missingBoxBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'missingBoxBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 ui missingBoxBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'missingBoxBlock' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'missingBoxBlock' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         value: mirr = ( |
            | 
            warning: mirr name, ' is not currently displayed on the ui').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         missingSlotBlock = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'missingSlotBlock' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 ui missingSlotBlock.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'missingSlotBlock' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'missingSlotBlock' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         value: name With: mirr = ( |
            | 
            warning: mirr name, ' does not have a slot "', name, '"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Box (body) motion blur only. Arrows have arrowMotionBlur. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         motionBlur = ( |
            | preferences blurBodies: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         move: mirr To: pos = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestMove:To:'
                           With: (mirr & pos) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         nextBodyPosition = ( |
            | 
            bodyPos: bodyPos + bodyPosInc.
            (size rect includes: bodyPos) ifFalse: [ resetBodyPosition ].
            bodyPos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         noAnticipation = ( |
            | ranimator noAnticipation: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Arrow motion blur only. Boxes have noMotionBlur. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         noArrowMotionBlur = ( |
            | preferences blurArrows: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         noFollowThrough = ( |
            | ranimator noFollowThrough: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Box (body) motion blur only. Arrows have noArrowMotionBlur. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         noMotionBlur = ( |
            | preferences blurBodies: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         openWindowOn: disp = ( |
             rect.
            | 
            rect: getInitialRectFrom: window.
            [todo ui1 dmu experimental].

            window name: 'The Self World'.
            window iconName: 'ui'.
            window iconFilename: preferences uiIconFile.
            window position: rect topLeft.
            window size: rect size.
            window useQueueingHandlerFor: self.
            graphics tryToOpenWindowForDisplay: disp IfFail: [ | :err |
                ('\n', err) printLine.
               graphics openWindowError.
               graphics couldNotStart.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         queueingParent* = bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         quit = ( |
            | 
            self = testUI ifFalse: [ handler queue: 'realQuit' With: vector copySize: 0]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowManagement\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         raise = ( |
            | window raise).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         raise: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestRaise:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: ending\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         realQuit = ( |
            | programmingLog close. stopping: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: releasing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjects = ( |
            | 
            "send from memory prior to GC"
            releaseUnneededHiddenSlotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: releasing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         releaseUnneededHiddenSlotInfo = ( |
            | 
            hiddenSlotDict: hiddenSlotDict copyFilteredBy: [
                | :slots. :mir |
                world exists: mir
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestRemove:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         removeRequests: str = ( |
            | handler removeMessages: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         repopulate: bods = ( |
            | 
            bods reverseDo: [ | :bod | bod resproutOn: world ].
            textEditorDisplayGlitchHack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestAdd: obj At: pos = ( |
            | 
            internalAdd: (reflect: obj) Messages: list copyRemoveAll At: pos.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestAdd: obj WithMessages: msgs = ( |
            | 
            internalAdd: (reflect: obj) Messages: msgs.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestAddMirror: mirr = ( |
            | 
            internalAdd: mirr Messages: vector.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestAddMirror: mirr At: pos = ( |
            | 
            internalAdd: mirr Messages: list copyRemoveAll At: pos.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestAddMirror: mirr Sprout: name = ( | {
                 'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
                
                 bod.
                } 
            | 
            bod: internalAdd: mirr Messages: vector.
            bod sprout: name IfAbsent: missingSlotBlock.
            bod raise.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestDesprout: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod desprout: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestFullUpdate: s = ( |
            | 
            world updateBodiesUntil: false.
            s signal.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestHide: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod hide: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestIconify: mirr = ( |
            | 
            find: mirr Do: [ | :bod | bod iconifyRemainCentered ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestMove: mirr To: pos = ( |
            | 
            find: mirr Do: [ | :bod | bod moveTo: pos ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestRaise: mirr = ( |
            | find: mirr Do: [ | :bod | bod raise ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestRemove: mirr = ( |
            | find: mirr Do: [ | :bod | bod banish ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestSend: unaryMsg To: obj = ( |
            | 
            "sends a message within the ui1 ui process"
            "if the message causes an error, the ui1 ui crashes"
            unaryMsg sendTo: obj.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestSend: msg To: obj Args: args = ( |
            | 
            "sends a message within the ui1 ui process"
            "if the message causes an error, the ui1 ui crashes"
            msg sendTo: obj WithArguments: args.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestShow: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod show: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestShowAll: mirr = ( |
            | 
            find: mirr Do: [ | :bod | bod showAll ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestShowContentsOf: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod showContentsOf: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestSprout: name On: mirr = ( |
            | 
            find: mirr Do: [ | :bod |
                bod sprout: name IfAbsent: missingSlotBlock ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestUpdate = ( |
            | 
            removeRequests: 'update'.
            world updateBodiesUntil: [areEventsPending].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         requestUpdate: mirr = ( |
            | 
            find: mirr Do: [ | :bod | bod update ] IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests synchronous\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: bodyPositioning\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         resetBodyPosition = ( |
            | bodyPos: bodyPosOrig).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         resetInitialRect = ( |
            | 
            window: windowPrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         resetWindowRect = ( |
            | 
            "send this when the ui1 ui is not running to force the
             next ui1 ui start to use preferences initialWindowRect"
            "do not send this to a running ui1 ui!"
            window: windowPrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: responding\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         respond = ( |
            | 
            [ stopping ] whileFalse: [ handler next ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         restart = ( | {
                 'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
                
                 bods.
                } 
            | 
            bods: world bodies.
            setUpOn: ((host osName == 'macOSX') ifTrue: 'quartz' False: [os environmentAt: 'DISPLAY' IfFail: ':0']) Initial: [
              bods isEmpty ifTrue: [ createRoot: reflect: startObj ]
                            False: [ repopulate: bods              ]
            ].
            beginRun.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         returnFromSnapshot = ( |
            | 
            stopping ifFalse: [ 
              "hack to avoid starting ui1 unintentionally"
              graphics returnFromSnapshot.
              cacheUnflushable.
              restart.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDownAt: pos Event: event = ( |
            | 
            resend.rightButtonDownAt: pos Event: event.
            (world componentContaining: pos) rightButtonDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonUpAt: pos Event: event = ( |
            | 
            resend.rightButtonUpAt: pos Event: event.
            (world componentContaining: pos) rightButtonUp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: _\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         run = ( |
            | 
            uiProcess: process this.
            programmingLog open.
            respond.
            finalize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Every ui clone whose process is active (same census as closeAllWindows). -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         runningUIsDo: blk = ( |
            | 
            (browse childrenOf: traits ui1 ui) do: [ | :m. u. |
                u: m reflectee.
                u uiProcess isActive ifTrue: [ blk value: u ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         send: msg CatchErrorsAndPutResultAt: pt = ( | {
                 'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            "send msg, reporting errors in a notifier, and putting the result
             in the desired place on screen. Probably wont work if 
             called in the ui1 ui process -- dmu"
            ifRunning: [ | p |
              r: msg sendIfFail: [| :errObj |
                ui1 uiNotifier copySyncOn: world
                              Message: errObj errorString
                                   At: pt.
                ^ self
              ].
              fullUpdate.
              add: r At: pt.
             ].
             r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         send: unaryMsg To: obj = ( |
            | 
            "sends a message within the ui1 ui process"
            "if the message causes an error, the ui1 ui crashes"
            ifRunning: [
                handler queue: 'requestSend:To:'
                         With: (unaryMsg & obj) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         send: msg To: obj Args: args = ( |
            | 
            "sends a message within the ui1 ui process"
            "if the message causes an error, the ui1 ui crashes"
            ifRunning: [
                handler queue: 'requestSend:To:Args:'
                         With: (msg & obj & args) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         setBoxSizing = ( |
            | 
            [xxxxxxx].
             boxSizing: ui1 boxSize copyFor: window BoxSizeMixin: graphics boxSizePlatformMixin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: route the X display path to the x11 graphics object; it used to fall through to (preferences xDisplay) -- a display, not a graphics backend -- which broke ui1 ui start on X11. -- claude & dmu 6/2026\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         setUpOn: disp Initial: createObjBlock = ( |
            | 
            graphics: traits ui1 graphics copyNamed: disp.
            openWindowOn: disp.

            setBoxSizing.

            checkCaches.
            ranimator delay: preferences uiAnimationDelay.
            danimator delay: preferences uiAnimationDelay.

            initializePatterns.

            graphics initializeColorsWindow: window Animator: ranimator.
            world: graphics worldPrototype copy createForUI: self.

            initAnimators.

            dummyAnimatorDo: createObjBlock.

            activateUpdating.
            stopping: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         show: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestShow:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         showAll: mirr = ( |
            | 
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: mirr.
                handler queue: 'requestShowAll:' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         showContentsOf: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestShowContentsOf:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | window size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         slowInOut = ( |
            | ranimator noSlowInOut: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         slowMotion = ( |
            | ranimator delay: slowness).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         slowness <- 200.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: name On: mirr = ( |
            | 
            ifRunning: [ | args |
                handler queue: 'requestSprout:On:'
                           With: (name & mirr) asVector ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: Quartz on macOS, X11 on Linux/BSD. Same verb as desktop open. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( |
            | 
            (host osName == 'macOSX') ifTrue: [openOnQuartz] False: [openOnX11]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: X11 ui1 on that display. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnDisplay: d = ( |
            | 
            ((d = 'quartz') || [d = 'direct']) ifTrue: [
                error: 'openOnDisplay: takes an X display name; use openOnQuartz'
            ].
            startOn: d With: startObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: 32-bit true-colour Quartz ui1. Error on non-macOS. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnQuartz = ( |
            | 
            host osName == 'macOSX' ifFalse: [
                error: 'Quartz is only available on macOS'
            ].
            startOn: 'quartz' With: startObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: Classic 8-bit X11 ui1 on desktop xDisplayName. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         openOnX11 = ( |
             n.
            | 
            n: os environmentAt: 'DISPLAY' IfFail: ':0'.
            n isEmpty ifTrue: [n: ':0'].
            openOnDisplay: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: Same as open. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            open).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         startObj = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: Compatibility dispatcher. quartz/direct/empty-on-macOS -> openOnQuartz; x11 -> openOnX11; else openOnDisplay:. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         startOn: dispOrBackend = ( |
            | 
            ((dispOrBackend = 'quartz')
              || [dispOrBackend = 'direct']
              || [dispOrBackend isEmpty && [host osName == 'macOSX']]) ifTrue: [
                ^ openOnQuartz
            ].
            dispOrBackend = 'x11' ifTrue: [^ openOnX11].
            openOnDisplay: dispOrBackend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         startOn: disp With: obj = ( |
            | 
            setUpOn: disp Initial: [ createRoot: reflect: obj ].
            beginRun.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: Alias of openOnDisplay:. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         startOnDisplay: d = ( |
            | 
            openOnDisplay: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: Alias of openOnQuartz. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         startOnQuartz = ( |
            | 
            openOnQuartz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fComment: Alias of openOnX11. -- grok 08/29/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         startOnX11 = ( |
            | 
            openOnX11).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         startWith: obj = ( |
            | 
            (host osName == 'macOSX') ifTrue: [
                startOn: 'quartz' With: obj
            ] False: [
                startOn: (os environmentAt: 'DISPLAY' IfFail: ':0') With: obj
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         straightLines = ( |
            | ranimator straightLines: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Direct motion-blur present cap. ui targetFPS: 60 -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         targetFPS = ( |
            | graphics targetFPS).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Direct only. 0 = uncapped. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         targetFPS: n = ( |
            | 
            graphics targetFPS: n.
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | testOn: preferences xDisplay).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         testDeleting = ( |
            | 
            world bodies first banish.
            world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         testDesprouting = ( |
            | 
            ((world bodies last) slots first) contents button desprout.
            world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         testIfBadDisplay: fblock = ( |
             disp.
            | 
            disp: preferences xDisplay.
            testUI parent: ui1 ui copy.
            testUI window: x11Globals window copy.
            testUI graphics tryToOpenWindowForDisplay: disp
                   IfFail: [ | :err | ^ fblock value: err ].
            testUI window closeAsync.
            test).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         testOn: disp = ( |
            | 
            testUI parent: ui1 ui copy.
            testUI setUpOn: disp Initial: [ testUI createRoot: reflect: lobby].
            testUI testGo.
            testUI finalize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         testSprouting: n = ( |
             clickOnMe.
             i <- 0.
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         testUI = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 ui testUI.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         closeWindow = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 ui testUI cursor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         moveTo: pt = ( |
            | location: pt. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         while: whileBlock Do: doBlock = ( |
            | 
            location:  location + (100@100).
            doBlock value: location.
            doBlock value: location. "for motion blur"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: private'
        
         makeTransporterPutMeAfter = bootstrap stub -> 'globals' -> 'ui1' -> 'ui' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: InitializeToExpression: (traits ui1 ui)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> 'testUI' -> () From: ( | {
         'ModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | traits ui1 ui testUI).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         textEditorDisplayGlitchHack = ( |
            | 
            "This hack fixes a texteditor display glitch"
            world bodies do: [|:e |
             ((reflect: e) lookupKey: 'methodView') isEmpty ifFalse: [
               e onTop ifTrue: [ e methodView draw. e methodView basicDraw ]]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: animationControl\x7fComment: Direct: stretch text with the zooming slab. Menus and sprouted bodies. No-op setter on X11 graphics. -- grok 08/26/26\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         textScalesWithSlab = ( |
            | 
            graphics scaleText: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fComment: update all objects on the world, stopping only for events\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         update = ( |
            | 
            "so prompt can send this before ui1 ui is started"
            ifRunning: [ | args = vector copySize: 0 |
                handler queue: 'requestUpdate' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         update: aMirror = ( |
            | "update this particular object (if visible)"
            ifRunning: [ | args |
                args: (vector copySize: 1) at: 0 Put: aMirror.
                handler queue: 'requestUpdate:' With: args. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: requests client\x7fComment: update all objects on the world, stopping for events, 
               but do not use too much time\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         updateCheaply = ( |
            | 
            [requestUpdateCheaply]. "browsing"
            ifRunning: [ | args = vector copySize: 0 |
                handler queue: 'requestUpdateCheaply' With: args ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: updateParameters\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDutyCycle = 0.1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: caching\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         validateCaches = ( |
            | isCacheValid: true. cacheFlushable).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         window = ( |
            | 
            graphics window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: forwarded\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         window: w = ( |
            | 
            graphics window: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         windowChanged: rect Event: event = ( |
            | 
            resend.windowChanged: rect Event: event.
            [xxxxx].
            world windowChanged.
            world draw.
            resetBodyPosition.
            world display.
            textEditorDisplayGlitchHack.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         windowExposed: rect Last: last Event: event = ( |
            | 
            resend.windowExposed: rect Last: last Event: event.
            last ifTrue: [
              world display.
              textEditorDisplayGlitchHack
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: starting\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot'
        
         windowPrototype = ( |
            | graphics windowPrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'ui' -> () From: ( | {
         'Category: windowEvents\x7fModuleInfo: Module: ui1 InitialContents: FollowSlot\x7fVisibility: public'
        
         windowQuit: win Event: event = ( |
            | 
            resend.windowQuit: win Event: event.
            quit).
        } | ) 



 '-- Side effects'

 globals modules ui1 postFileIn
