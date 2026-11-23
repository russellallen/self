 '$Revision:$'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         ui1OnX11 = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1OnX11.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnX11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> () From: ( | {
         'Category: prototypes\x7fComment: the X11 graphics backend. Inherits the generic (quartz parent) backend -- makeOffscreenFor:/makeWindowBitmapFor:/plane masks/erase are platform-polymorphic via bitmap copyFor:Size: and windowBitmap planeMask:, exactly as the pre-seam ui1 uiWorld code. Only present: and installShadowOn: are overridden: X has no shadow buffer and blits the windowBitmap straight to the window. -- claude & dmu 6/2026\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         x11 = bootstrap define: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             traits ui1 graphics abstract copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11.

CopyDowns:
traits ui1 graphics abstract. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         animatorColormaps <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11 animatorColormaps.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'Category: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         acetateFadeOutMaps <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'Category: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         acetateFadeOutMapsFast <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'Category: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedAcetateFadeOutMaps <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'Category: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedAcetateFadeOutMapsFast <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         convertFadeOutMaps = ( |
            | 
            acetateFadeOutMaps do: [ | :cm. :i. |
                cm colorsFromCache: cachedAcetateFadeOutMaps at: i ].
            acetateFadeOutMapsFast do: [ | :cm. :i. |
                cm colorsFromCache: cachedAcetateFadeOutMapsFast at: i ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteCachedColormaps = ( |
            | 
            cachedAcetateFadeOutMaps do: [ | :cm | cm delete ].
            cachedAcetateFadeOutMapsFast do: [ | :cm | cm delete ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteColormaps = ( |
            | 
            acetateFadeOutMaps do: [ | :cm | cm delete ].
            acetateFadeOutMapsFast do: [ | :cm | cm delete ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         fadeInAcetate = ( |
            | 
            acetateFadeOutMaps reverseDo: [ | :m |
                m installImmediately.
                times delay: ui1 realAnimator delay.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         fadeOutAcetate = ( |
            | 
            acetateFadeOutMaps do: [|:m|
                m installImmediately.
                times delay: peakingInBetweener delay.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         invalidateFadeOutMaps = ( |
            | 
            cachedAcetateFadeOutMaps do: [ | :cm | cm invalidate ].
            acetateFadeOutMaps do: [ | :cm | cm invalidate ].
            cachedAcetateFadeOutMapsFast do: [ | :cm | cm invalidate ].
            acetateFadeOutMapsFast do: [ | :cm | cm invalidate ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         makeAcetateVisible = ( |
            | 
            acetateFadeOutMaps first installImmediately. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         makeAndConvertColormapsFor: win PlatformColormap: platformColormap = ( |
            | 
            acetateFadeOutMaps: cachedAcetateFadeOutMaps copy.
            cachedAcetateFadeOutMaps do: [ | :cm. :i. |
                acetateFadeOutMaps at: i Put: ui1 uiColormap copyWithRep:
                                              cm convertForWindow: win PlatformColormap: platformColormap].
            acetateFadeOutMapsFast: cachedAcetateFadeOutMapsFast copy.
            cachedAcetateFadeOutMapsFast do: [ | :cm. :i. |
                acetateFadeOutMapsFast at: i Put: ui1 uiColormap copyWithRep:
                                              cm convertForWindow: win PlatformColormap: platformColormap ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> 'animatorColormaps' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: cached colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         cachedColormap0 <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: cached colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         cachedColormap1 <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: cached colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         cachedColormapBothArrowPlanes <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: cached colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         cachedColormapNoAcetate <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         colormap0 <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         colormap1 <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         colormapBothArrowPlanes <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'Category: colormaps\x7fCategory: state\x7fCategory: colormaps\x7fModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (ui1 uiColormap)\x7fVisibility: private'
        
         colormapNoAcetate <- bootstrap stub -> 'globals' -> 'ui1' -> 'uiColormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: masks\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         arrow0Mask = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: masks\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         arrow1Mask = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: masks\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         arrowPlanesMask = 192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         boxSizePlatformMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'boxSizePlatformMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11Traits boxSizePlatformMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         changeBackendColors: uiColors = ( |
            | 
            makeColormap0ForUIColors: uiColors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         changeColorsFor: uiColors OffScreen: offScreen Cursor: cursor Animator: ranimator UpdateNow: updateNow = ( |
             hsbCol.
             index.
             oldLoc.
             rgbCol.
             sat.
             windowBitmapSize.
            | 
            index: (offScreen pixelValueAt: cursor location) && 8r007.
            windowBitmapSize: window bitmap size.
            uiColors do: [ | :cme |
                index = (cme index && 8r007) ifTrue: [ rgbCol: cme color ] ].
            hsbCol: rgbCol asHSB.
            oldLoc: cursor location.
            sat: false.
            cursor moveTo:
                hsbCol asPoint: windowBitmapSize InSaturationSpace: sat.
            cursor while: [cursor anyButtonDown] Do: [
                sat != cursor leftButtonDown ifTrue: [
                    sat: cursor leftButtonDown.      
                    cursor moveTo:
                      hsbCol asPoint: windowBitmapSize InSaturationSpace: sat.
                ].
                hsbCol fromPoint: cursor location
                       SpaceSize: windowBitmapSize
               InSaturationSpace: sat.
                 (index = (uiColors body      index && 8r007)) ||
                [(index = (uiColors bodyLight index && 8r007)) ||
                [ index = (uiColors bodyDark  index && 8r007)]] ifTrue: [
                    uiColors body      hue: hsbCol hue.
                    uiColors bodyLight hue: hsbCol hue.
                    uiColors bodyDark  hue: hsbCol hue.
                    uiColors body      saturation: hsbCol saturation.
                    uiColors bodyLight saturation: hsbCol saturation.
                    uiColors bodyDark  saturation: hsbCol saturation.
                ].
                rgbCol from: hsbCol.
                changeBackendColors: uiColors.
                colormap0 installAndFixMultiprocessorColormapBugIfPreferencesSaySo.

                updateNow value.
            ].
            cursor moveTo: oldLoc.
            createColormapsColors: uiColors Animator: ranimator.
            uiColors save.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         checkColor8IfFail: fblock = ( |
             dispName.
            | 
            "get the interpreted display name before display is closed"

            dispName: window interpretedDisplayName.
            window isColor8 ifFalse: [
                window closeAsync.              
                ('\nThe opened X display, \'', dispName,
                 '\', is not an 8-bit monitor.') printLine.
                'Set XQuartz Output colors to 256; see "Running the UI under X11" in readme.md.' printLine.
                 ^fblock value.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         checkDepthOf: bitmap = ( |
            | [(bitmap depth = 8) || [bitmap depth = 1]] assert. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapCacheFinalize = ( |
            | 
            deleteCachedColormaps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapFinalize = ( |
            | 
            deleteColormaps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapInitializeWindow: window Animator: ranimator = ( |
            | 
            makeAndConvertColormapsWindow: window Animator: ranimator.
            installColormap0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         convertColormaps = ( |
            | 
            colormap0 colorsFromCache: cachedColormap0.
            colormap1 colorsFromCache: cachedColormap1.
            colormapBothArrowPlanes
                      colorsFromCache: cachedColormapBothArrowPlanes.
            colormapNoAcetate colorsFromCache: cachedColormapNoAcetate.
            animatorColormaps convertFadeOutMaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         copy = ( |
             r.
            | 
            r: resend.copy.
            r window:                        windowPrototype copy.
            r cachedColormap0:               cachedColormap0 copy.
            r cachedColormap1:               cachedColormap1 copy.
            r cachedColormapBothArrowPlanes: cachedColormapBothArrowPlanes copy.
            r cachedColormapNoAcetate:       cachedColormapNoAcetate       copy.
            r animatorColormaps:             animatorColormaps             copy.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedColormapsColors: uiColors Animator: ranimator = ( |
            | 
            deleteCachedColormaps.

            cachedColormap0: ui1 uiColormap copyWithRep: cachedColormap copyGraphicsGlobals.
            cachedColormap1: ui1 uiColormap copyWithRep: cachedColormap copyGraphicsGlobals.

            cachedColormapBothArrowPlanes:
                             ui1 uiColormap copyWithRep: cachedColormap copyGraphicsGlobals.
            cachedColormapNoAcetate:
                             ui1 uiColormap copyWithRep: cachedColormap copyGraphicsGlobals.
            fillCachedColormapsColors: uiColors Animator: ranimator.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedColormapsDissolveSteps: dissolveSteps FastDissolveSteps: fastDissolveSteps = ( |
             ncm.
             ocm.
            | 
            ocm: cachedColormap0.
            ncm: cachedColormapNoAcetate.
            animatorColormaps cachedAcetateFadeOutMaps: createMapSeriesFrom: ocm
                                                       To: ncm
                                                    Steps: dissolveSteps.
            animatorColormaps cachedAcetateFadeOutMapsFast: createMapSeriesFrom: ocm
                                                           To: ncm
                                                       Steps: fastDissolveSteps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         createColormapsColors: uiColors Animator: ranimator = ( |
            | 
            createCachedColormapsColors: uiColors Animator: ranimator.
            convertColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         createMapSeriesFrom: f To: t Steps: s = ( |
             fastF.
             fastT.
             ib.
             r.
             scale = 1000000.
            | 
            'creating colormap series . . . ' print.
            r: vector copySize: s succ. "one extra for endpoint"
            ib: peakingInBetweener copyFrom: 0 To: scale Steps: s.
            fastF: vector copySize: 256.
            fastT: vector copySize: 256.
            256 do: [|:i| fastF at: i Put: (f at: i) "asHSB" asRGB].
            256 do: [|:i| fastT at: i Put: (t at: i) "asHSB" asRGB].

            r size do: [| :i. v. cm. |
                v: fastF interpolate: ib value /= scale From: fastT.
                cm: f copyWithRep: cachedColormap copyGraphicsGlobals.
                256 do: [|:i| cm at: i Put: (v at: i) asRGB].
                r at: i Put: cm.
                ib step.
                '. ' print.
            ].
            'done.' printLine.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteCachedColormaps = ( |
            | 
            cachedColormap0 delete.
            cachedColormap1 delete.
            cachedColormapBothArrowPlanes delete.
            cachedColormapNoAcetate delete.
            animatorColormaps deleteCachedColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         deleteColormaps = ( |
            | 
            colormap0 delete.
            colormap1 delete.
            colormapBothArrowPlanes delete.
            colormapNoAcetate delete.
            animatorColormaps deleteColormaps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolve = ( |
            | 
            acetateFadeOutMapsFast do: [|:m|
                m installImmediately.
                times delay: delay.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         dissolve: bod InWorld: world = ( |
            | 
            world prepareToDrawOnAcetate.
            bod displayThru.
            world prepareToDrawOnBackground.
            world display.
            animatorColormaps acetateFadeOutMaps do: [|:m|
                m installImmediately.
                times delay: delay.
            ].
            world eraseAcetate.
            animatorColormaps acetateFadeOutMaps first installImmediately.
            world prepareToDrawOnAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: window\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureFrontmost = ( |
            | 
            window xwin ensureFrontmost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseAcetate: rect Colors: uiColors = ( |
            | 
            window bitmap planeMask: movingPlaneMask. window bitmap fillRectangle: rect Color: uiColors transparent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow0: rect Transparent: transparent = ( |
            | 
            window bitmap planeMask: arrow0Mask. 
            window bitmap fillRectangle: rect Color: transparent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: erasing layers\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         eraseArrow1: rect Transparent: transparent = ( |
            | 
             window bitmap planeMask: arrow1Mask. 
            window bitmap fillRectangle: rect Color: transparent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         fadeInAcetate = ( |
            | 
            animatorColormaps fadeInAcetate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         fadeOutAcetate = ( |
            | 
            animatorColormaps fadeOutAcetate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         fillCachedColormapsColors: uiColors Animator: ranimator = ( |
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
            createCachedColormapsDissolveSteps: ranimator dissolveSteps FastDissolveSteps: ranimator fastDissolveSteps.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         finalize = ( |
            | colormapFinalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         flushCaches = ( |
            | colormapCacheFinalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         graphicsGlobals = bootstrap stub -> 'globals' -> 'x11Globals' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         initializeColorCachesColors: uiColors Animator: ranimator = ( |
            | createCachedColormapsColors: uiColors Animator: ranimator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         initializeColorsWindow: window Animator: ranimator = ( |
            | colormapInitializeWindow: window Animator: ranimator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         installColormap0 = ( |
            | colormap0 installAndFixMultiprocessorColormapBugIfPreferencesSaySo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
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

            animatorColormaps invalidateFadeOutMaps.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: fading\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         makeAcetateVisible = ( |
            | 
            animatorColormaps makeAcetateVisible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         makeAndConvertColormapsWindow: window Animator: ranimator = ( |
            | 
            colormap0: ui1 uiColormap copyWithRep:
                                     cachedColormap0 convertForWindow: window PlatformColormap: platformColormap.
            colormap1: ui1 uiColormap copyWithRep:
                                     cachedColormap1 convertForWindow: window PlatformColormap: platformColormap.
            colormapBothArrowPlanes: ui1 uiColormap copyWithRep:
                       cachedColormapBothArrowPlanes convertForWindow: window PlatformColormap: platformColormap.
            colormapNoAcetate:
              ui1 uiColormap copyWithRep:
                            cachedColormapNoAcetate convertForWindow: window PlatformColormap: platformColormap.
            animatorColormaps makeAndConvertColormapsFor: window  PlatformColormap: platformColormap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         makeCachedColormap0: uiColors = ( |
            | 
            cachedColormap0 delete.
            cachedColormap0: ui1 uiColormap copyWithRep: cachedColormap copyGraphicsGlobals.
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         makeColormap0ForUIColors: uiColors = ( |
            | 
            makeCachedColormap0: uiColors.
            colormap0 colorsFromCache: cachedColormap0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         makeOffscreenFor: win Size: sz = ( |
            | bitmap copyFor: win Size: sz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         moveArrowHeadUsing: moveBlock = ( |
            | 
            prepareToMoveArrow0.
            moveBlock value.
            prepareForAnimationWithArrows.
            prepareToMoveArrow1.
            window bitmap clear: window bitmap size rect.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         moveArrows: doBlock Flip: flip = ( |
             windowBitmap.
            | 
            windowBitmap: window bitmap.
            windowBitmap planeMask: flip ifTrue: arrow1Mask False: arrow0Mask.
            windowBitmap clear: windowBitmap size rect.
            doBlock value.
            postFlip: flip.
            times delay: 1. "hack to make motion blur visible on Mountain Lion, with async X fd -- dmu 1/20/13"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: masks\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         movingPlaneMask = 56.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'x'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         openWindowError = ( |
            | 
            'The ui runs only on an 8-bit color X display.' printLine.
            ''                                              printLine.
            'To change the ui display type:               ' printLine.
            '  preferences xDisplay: \'YOUR-DISPLAY\' '     printLine.
            ''                                              printLine.
            'To start the ui type:'                         printLine.
            '  ui demo'                                     printLine.
            ''                                              printLine.
            'For the required XQuartz settings (incl. 256-color/8-bit), see' printLine.
            '"Running the UI under X11 (XQuartz) on macOS" in readme.md.'    printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         openWindowOrCanvas: depth IfFail: fb = ( |
            | 
            [xxxxx].
            window display: xlib display 
                open: window displayName
                IfFail: [
                    ^ fb value: 'Could not open X display \'', window interpretedDisplayName, '\'.' 
                ].
            window xwin: xlib window createOnDisplay: window display
                                         At: window position Size: window size Depth: depth.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: window\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         optimalNameForDisplay: disp = ( |
             hackedDisp.
             myhost.
            | 
            myhost: os nodename , ':'.
            [xxxxx hack].
            hackedDisp: disp = 'x11OnCanvas' ifTrue: [preferences xDisplay] False: disp.
            (myhost isPrefixOf: hackedDisp) ifFalse: [hackedDisp] True: [ 
               "use :0 rather than name:0 -- much faster"
               hackedDisp copyFrom: myhost size - 1
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'ModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'abstractTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         patterns = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11Traits patterns.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         platformColormap = ( |
            | xlib colormap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         platformPixmap = ( |
            | xlib pixmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         postFlip: flipped = ( |
            | 
            (flipped ifTrue: colormap1 False: colormap0)
              installAndFixMultiprocessorColormapBugIfPreferencesSaySo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareForAnimationWithArrows = ( |
            | 
            colormap0 installAndFixMultiprocessorColormapBugIfPreferencesSaySo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToCopyAllLayers = ( |
            | 
            window bitmap useAllBitplanes.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawArrows = ( |
            | 
            window bitmap planeMask: arrowPlanesMask.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAcetate = ( |
            | 
             window bitmap planeMask: movingPlaneMask.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAcetate: w = ( |
            | 
             window bitmap planeMask: movingPlaneMask.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAll: w = ( |
            | w windowBitmap useAllBitplanes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnAllButArrow0: w = ( |
            | w windowBitmap planeMask: 8r777 ^^ w arrow0Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0: w = ( |
            | 
            w windowBitmap planeMask: w arrow0Mask. w myUI graphics colormap0 installAndFixMultiprocessorColormapBugIfPreferencesSaySo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow0InstallingBoth: w = ( |
            | 
            w windowBitmap planeMask: w arrow0Mask. w myUI graphics colormapBothArrowPlanes installAndFixMultiprocessorColormapBugIfPreferencesSaySo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnArrow1: w = ( |
            | 
            w windowBitmap planeMask: w arrow1Mask. w myUI graphics colormap1 installAndFixMultiprocessorColormapBugIfPreferencesSaySo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnBackground = ( |
            | 
            window bitmap planeMask: stationaryPlaneMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: behavior\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToDrawOnInvisibleAcetate = ( |
            | 
            animatorColormaps  acetateFadeOutMaps last installImmediately.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         prepareToMoveArrow0 = ( |
            | 
            window bitmap planeMask: arrow0Mask. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         prepareToMoveArrow1 = ( |
            | window bitmap planeMask: arrow1Mask. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToMoveBlock = ( |
            | 
            window bitmap planeMask: movingPlaneMask.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fCategory: preparing to draw\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         prepareToZoom = ( |
            | 
            installColormap0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fComment: Direct scales layer text with the slab. X11 keeps colormap acetate: zoom the empty slab, then draw text. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomLayer: layer From: s To: e FromScreen: fromScreen Animator: anim = ( |
            | 
            anim zoomSlab: s To: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: layers\x7fComment: Direct scales layer text with the slab. X11 keeps colormap acetate: zoom the empty slab, then draw text. -- grok 08/26/26\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomMenu: menu From: s To: e FromScreen: fromScreen Animator: anim = ( |
            | 
            zoomLayer: menu From: s To: e FromScreen: fromScreen Animator: anim).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         returnFromSnapshot = ( |
            | invalidateAllColormaps).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: colormaps\x7fCategory: masks\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: private'
        
         stationaryPlaneMask = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fComment: Refuse to call XOpenDisplay if the X11 dylib is missing (weak-linked on macOS). Start XQuartz if ui2 is loaded. -- grok 08/29/26\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         tryToOpenWindowForDisplay: disp IfFail: fb = ( |
            | 
            xlib display libraryPresent ifFalse: [
                ^ fb value: 'X11 library not installed (install XQuartz to use ui openOnX11).'
            ].
            ((reflect: globals) includesKey: 'worldMorph') ifTrue: [
                ((host osName == 'macOSX') && [(worldMorph canOpenXDisplay: disp) not]) ifTrue: [
                    (worldMorph startXQuartzAndCanOpen: disp) ifFalse: [
                        ^ fb value: ('Could not open X11 display \'', disp, '.')
                    ].
                ].
            ].
            quartz lucidaSansFamily: 'Verdana'.
            quartz lucidaSansRomanSuffix: ''.
            quartz lucidaSansBoldSuffix: 'Bold'.
            resend.tryToOpenWindowForDisplay: disp IfFail: [|:e| ^ fb value: e].
            window finishOpening.
            checkColor8IfFail: [ 
              openWindowError.
              couldNotStart
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         uiColorPalette = ( |
            | ui1 x11ColormappedColorPalette).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: starting and stopping\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         windowDepth = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot'
        
         windowPrototype = ( |
            | x11Globals window).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> () From: ( | {
         'Category: prototypes\x7fModuleInfo: Module: ui1OnX11 InitialContents: FollowSlot\x7fVisibility: public'
        
         worldPrototype = ( |
            | 
            ui1 uiWorld).
        } | ) 



 '-- Side effects'

 globals modules ui1OnX11 postFileIn
