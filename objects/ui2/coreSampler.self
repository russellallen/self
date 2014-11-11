 '$Revision: 30.10 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Core sampler\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         coreSamplerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'coreSamplerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'coreSamplerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals coreSamplerMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'coreSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         highlightBox.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Core sampler\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         coreSamplerMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits coreSamplerMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'coreSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         coreSampler = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules coreSampler.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            coreSamplerMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'coreSampler' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Core sampler\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         proxyMorph = bootstrap define: bootstrap stub -> 'globals' -> 'proxyMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals proxyMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         eyes.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         hLayout.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         hResizeButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fCategory: Core sampler\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         proxyMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'proxyMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         patch.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         realMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         submorphMenuButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         vLayout.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         vResizeButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: highlighting\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         addHighlightBox = ( |
            | 
            "Create and add the highlight box."

            highlightBox ifNotNil: [ highlightBox delete ].
            highlightBox: frameMorph copy color: paint named: 'red'.
            highlightBox filled: false.
            highlightBox borderWidth: 5.
            highlightBox frameStyle: frameMorph flatStyle.
            world addMorph: highlightBox.
            world moveToFront: highlightBox.
            world moveToFront: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIntoHand: h = ( |
             new.
            | 
            new: coreSamplerMorph copyOnWand.
            h attach: new.
            new firstMorph firstMorph getSteppedEveryMSecs: 250.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIntoWorld: w At: pt = ( |
             new.
            | 
            new: coreSamplerMorph copyOnWand.
            w addMorph: new.
            w moveToFront: new.
            new globalPosition: pt - hotSpotOffset.
            new changed.
            new firstMorph firstMorph getSteppedEveryMSecs: 250.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOnWand = ( |
             bullseye.
             l.
             sampler.
            | 
            bullseye: (imageMorph copyImage: (
                ui2Image copyPixelLines: (
                        '     00000     ' &
                        '   000000000   ' &
                        '  000  0  000  ' &
                        ' 000   0   000 ' &
                        ' 00    0    00 ' &
                        '00     0     00' &
                        '00     0     00' &
                        '000000000000000' &
                        '00     0     00' &
                        '00     0     00' &
                        ' 00    0    00 ' &
                        ' 000   0   000 ' &
                        '  000  0  000  ' &
                        '   000000000   ' &
                        '     00000     ' &
                        '               ' ) asVector
                    Colors: (
                        (paint named: 'black') &
                        (paint named: 'yellow') ) asVector)).
             l: lineMorph copy width: 3.
             bullseye addMorph: l.
             l p1: 12@12.
             l p2: 41@41.
             sampler: copy.
             l addMorph: sampler.
             sampler position: 12@12.
             bullseye).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         hotSpot = ( |
             r.
            | 
            r: owner owner.
            (r isNotNil && [r morphTypeName = imageMorph morphTypeName])
                ifTrue: [ r globalPosition + hotSpotOffset ]
                 False: [ globalPosition ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         hotSpotOffset = (7)@(7).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            removeAllMorphs.
            color: paint named: 'lightGray'.
            borderWidth: 3.
            baseMinWidth:  30.
            baseMinHeight: 15.
            frameStyle: bezelStyle.
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: m Event: evt = ( |
            | 
            isInWorld ifTrue: [ startGettingStepped ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: highlighting\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMouseUp: evt = ( |
            | 
            "Remove the highlight box and stop tracking the cursor."

            evt sourceHand unsubscribeCursor: self.
            removeHighlightBox.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'coreSamplerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: highlighting\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         mouseMove: evt = ( |
             p.
            | 
            "Update the highlight box."

            p: evt cursorPoint.
            highlightBox ifNotNil: [ highlightBox changed ].
            morphsDo: [| :proxie |
                 ((proxie morphTypeName = proxyMorph morphTypeName) &&
                  [ proxie patch isNotNil &&
                  [(proxie patch globalBounds includes: p)]]) ifTrue: [| bnds |
                    highlightBox ifNil: [ addHighlightBox ].
                    bnds: proxie realMorph globalBaseBounds extend: highlightBox borderWidth.
                    highlightBox setWidth: bnds width Height: bnds height.
                    highlightBox globalPosition: bnds origin.
                    highlightBox changed.
                    ^self.
                ].
            ].
            removeHighlightBox.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: highlighting\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         removeHighlightBox = ( |
            | 
            "Delete the highlight box."

            highlightBox ifNotNil: [
                highlightBox delete.
                highlightBox: nil.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: highlighting\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         startHighlighting: evt = ( |
            | 
            "Start tracking the cursor to show highlight boxes."

            evt sourceHand subscribeUntilAllUp: self.
            mouseMove: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             mList.
             t.
            | 
            "Update my submorphs to reflect the set of submorphs under
             my target point. Ignore the world."

            isInWorld ifFalse: [ ^self ].
            t: targetRoot.
            t isWorldMorph
                ifTrue: [ mList: vector ]
                 False: [ mList: (targetRoot morphsAt: hotSpot) asVector ].
            (submorphsMatch: mList) ifFalse: [ updateForSubmorphs: mList ].
            updateProxyResizeButtons.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         submorphsMatch: mList = ( |
            | 
            "Return true if my submorphs represent the given set of morphs."

            morphCount = mList size ifFalse: [ ^false ].
            mList with: morphs Do: [| :m. :proxy |
                (m = proxy realMorph) ifFalse: [ ^false ].
            ].
            ^true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         targetRoot = ( |
             seenSelf.
            | 
            "If receiver is in hand, set seenSelf to true."
            seenSelf: root isHandMorph.
            world rootMorphsAt: hotSpot Do: [| :m |
                m = highlightBox ifFalse: [
                    seenSelf ifTrue: [ ^m ].  "return first morph after me"
                    m = root ifTrue: [ seenSelf: true ].
                ].
            ].
            world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         updateForSubmorphs: mList = ( |
            | 
            removeAllMorphs.
            addAllMorphs: (mList copyMappedBy: [| :m | proxyMorph copyOn: m ]).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'coreSamplerMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         updateProxyResizeButtons = ( |
            | 
            morphsDo: [| :proxie |
                (proxie morphTypeName = proxyMorph morphTypeName) ifTrue: [
                    proxie updateResizeButtons.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         addColorPatch = ( |
             f.
            | 
            patch: (morph copy setWidth: 10 Height: 10) color: realMorph color.
            f: frameMorph copy color: color.
            f beShrinkWrap.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 2.
            f addMorph: patch.
            addMorphLast: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            "Center m over the target point, then add to the real morph."

            m globalPosition: owner hotSpot - (m bounds center - m position).
            realMorph addMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         addEyesButton = ( |
             b.
            | 
            b: ui2Button copy color: color.
            b beFlexibleVertically beShrinkWrapHorizontally.
            b borderWidth: 1.
            b addMorph: (imageMorph copyImage: eyesImage).
            eyes: b.
            addMorphLast: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorphNameFramed: framed = ( |
             f.
             l.
            | 
            l: labelMorph copyLabel:
                (' ', realMorph morphTypeName, ' ').
            l fontSpec: outlinerPreferences mediumFontSpec.
            f: frameMorph copy color: color.
            f beFlexible leftJustify.
            f frameStyle: f bezelStyle.
            f borderWidth: 1.
            f addMorph: l.
            framed
                ifTrue: [ addMorphLast: f ]
                 False: [ addMorphLast: l ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         addResizeButton = ( |
             b.
             r.
            | 
            hLayout: realMorph hResizing.
            vLayout: realMorph vResizing.
            r: (rowMorph copy color: color) borderWidth: 0.
            r addMorphLast: imageMorph copyImage: (
                case if: [ hLayout = 0 ] Then:      rigidHImage
                     If: [ hLayout = 1 ] Then:   flexibleHImage
                     If: [ hLayout = 2 ] Then: shrinkWrapHImage).
            r addMorphLast: (spacerMorph copyH: 5 Color: color).
            r addMorphLast: imageMorph copyImage: (
                case if: [ vLayout = 0 ] Then:      rigidVImage
                     If: [ vLayout = 1 ] Then:   flexibleVImage
                     If: [ vLayout = 2 ] Then: shrinkWrapVImage).
            r addMorphLast: (spacerMorph copyH: 5 Color: color).
            b: ui2Button copyColor: color Target: realMorph.
            b borderWidth: 1.
            b scriptBlock: [target popUpResizeMenu: event].
            b addMorph: r.
            resizeButton: b.
            addMorphLast: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         addSeparateResizeButtons = ( |
             b.
             r.
            | 
            hLayout: realMorph hResizing.
            vLayout: realMorph vResizing.

            b: ui2Button copyColor: color Target: realMorph.
            b borderWidth: 1.
            b addMorphLast: (spacerMorph copyV: 4 Color: color).
            b addMorphLast: imageMorph copyImage: (
                case if: [ hLayout = 0 ] Then:      rigidHImage
                     If: [ hLayout = 1 ] Then:   flexibleHImage
                     If: [ hLayout = 2 ] Then: shrinkWrapHImage).
            b addMorphLast: (spacerMorph copyV: 4 Color: color).
            hResizeButton: b.
            addMorphLast:  b.

            b: ui2Button copyColor: color Target: realMorph.
            b borderWidth: 1.
            r: (rowMorph copy color: color) borderWidth: 0.
            r addMorphLast: (spacerMorph copyH: 5 Color: color).
            r addMorphLast: imageMorph copyImage: (
                case if: [ vLayout = 0 ] Then:      rigidVImage
                     If: [ vLayout = 1 ] Then:   flexibleVImage
                     If: [ vLayout = 2 ] Then: shrinkWrapVImage).
            r addMorphLast: (spacerMorph copyH: 5 Color: color).
            b addMorph: r.
            vResizeButton: b.
            addMorphLast:  b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         addSubmorphMenuButton = ( |
             b.
            | 
            b: ui2Button copy color: color.
            b beFlexibleVertically beRigidHorizontally.
            b setWidth: 15.
            b borderWidth: 1.
            b addMorph: (imageMorph copyImage: submorphMenuImage).
            submorphMenuButton: b.
            addMorphLast: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            (evt leftMouseDown || [evt middleMouseDown]) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: m = ( |
             new.
            | 
            new: copy.
            new realMorph: m.
            new borderWidth: 0.
            new color: paint named: 'lightGray'.

            new addColorPatch.
            new addMorphLast: spacerMorph copyH: 4 Color: new color.

            "xxxxx
            new addSubmorphMenuButton.
            new addEyesButton.
            new addMorphLast: spacerMorph copyH: 8 Color: new color.
            xxxxx"

            new addMorphNameFramed: false.
            new addMorphLast: spacerMorph copy beFlexible color: new color.

            new addSeparateResizeButtons.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: coreSampler InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         eyesImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '                     ' &
    '                     ' &
    '                     ' &
    '     0000   0000     ' &
    '    000000 000000    ' &
    '   00    000    00   ' &
    '   0      0      0   ' &
    '   0    0 0    0 0   ' &
    '   0   0000   0000   ' &
    '   0   0000   0000   ' &
    '   000000000000000   ' &
    '    0000000000000    ' &
    '                     ' &
    '                     ' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph eyesImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         flexibleHImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '               ' &
    '               ' &
    ' 0     0     0 ' &
    '0 0   0 0   0 0' &
    ' 0     0     0 ' &
    '               ' &
    '               ' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph flexibleHImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         flexibleVImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '       ' &
    '   0   ' &
    '  0 0  ' &
    '   0   ' &
    '       ' &
    '       ' &
    '   0   ' &
    '  0 0  ' &
    '   0   ' &
    '       ' &
    '       ' &
    '   0   ' &
    '  0 0  ' &
    '   0   ' &
    '       ' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph flexibleVImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: coreSampler InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         hDefaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMouseDown: evt = ( |
            | 

            ( eyes isNotNil &&
             [eyes globalBounds includes: evt cursorPoint]) ifTrue: [
                owner startHighlighting: evt.
                ^self.
            ].

            ( resizeButton isNotNil &&
             [resizeButton globalBounds includes: evt cursorPoint]) ifTrue: [
                popUpResizeMenu: evt.
                ^self.
            ].

            ( hResizeButton isNotNil &&
             [hResizeButton globalBounds includes: evt cursorPoint]) ifTrue: [
                popUpHResizeMenu: evt.
                ^self.
            ].

            ( vResizeButton isNotNil &&
             [vResizeButton globalBounds includes: evt cursorPoint]) ifTrue: [
                popUpVResizeMenu: evt.
                ^self.
            ].

            ( submorphMenuButton isNotNil &&
             [submorphMenuButton globalBounds includes: evt cursorPoint]) ifTrue: [
                 realMorph menuWhenSubmorph popUp: evt.
                ^self.
            ].

            ( patch isNotNil &&
             [patch globalBounds includes: evt cursorPoint]) ifTrue: [
                evt isShiftDownForLeftShiftHack ifTrue: [
                    "shift shortcut: yank out the realMorph"
                    realMorph changed.
                    realMorph globalPosition:
                        evt sourceHand globalPosition - (realMorph bounds center - realMorph position).
                    evt sourceHand addMorph: realMorph.
                ] False: [
                    owner startHighlighting: evt.
                ].
                ^self.
            ].

            resend.leftMouseDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         middleMouseDown: evt = ( |
            | 
            "Middle button yields the selfMenu of the realMorph (i.e., the
             menu which would be the realMorph's right button menu if it
             was not embedded in some other morph)."

            realMorph menuWhenSubmorph popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'proxyMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'ModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         popUpHResizeMenu: evt = ( |
             images.
             labels.
             m.
             scripts.
            | 
            m: ui2Menu copy.
            m leftJustify.

            labels: (
              'rigid' & 'shrink-wrap' & 'space-filling' ) asList.

            scripts: (
              [target beRigidHorizontally]      &
              [target beShrinkWrapHorizontally] &
              [target beFlexibleHorizontally]   ) asList.

            images: (
              (imageMorph copyImage:      rigidHImage) &
              (imageMorph copyImage: shrinkWrapHImage) &
              (imageMorph copyImage:   flexibleHImage) ) asList.


            3 do: [| :i. b. r |
              b: ui2Button copy target: realMorph. 
              b scriptBlock: (scripts at: i).
              r: rowMorph copy.
              r borderWidth: 0.
              r addMorphLast: (labelMorph copy label: (labels at: i)) fontSpec: m defaultFontSpec.
              r addMorphLast: spacerMorph copy beFlexible baseMinWidth: 10.
              r addMorphLast: (images at: i) copy.
              b addMorph: r.
              m addButton: b.
            ].
            m colorAll: (paint copyRed: 0.78 Green: 0.87 Blue: 0.87).
            hDefaultButtonHolder: m initializeDefaultButtonHolder: hDefaultButtonHolder.
            m popUp: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         popUpResizeMenu: evt = ( |
             b.
             color.
             images.
             labels.
             m.
             r.
             scripts.
            | 
            m: ui2Menu copy.
            m leftJustify.
            color: paint named: 'red'. "xxx remove xxx"

            labels: (
              'rigid' & 'shrink-wrap' & 'space-filling' &
              'rigid' & 'shrink-wrap' & 'space-filling' ) asList.

            scripts: (
              [target beRigidHorizontally]      &
              [target beShrinkWrapHorizontally] &
              [target beFlexibleHorizontally]   &
              [target beRigidVertically]        &
              [target beShrinkWrapVertically]   &
              [target beFlexibleVertically]     ) asList.

            images: (
              (imageMorph copyImage:      rigidHImage) &
              (imageMorph copyImage: shrinkWrapHImage) &
              (imageMorph copyImage:   flexibleHImage) &
              (imageMorph copyImage:      rigidVImage) &
              (imageMorph copyImage: shrinkWrapVImage) &
              (imageMorph copyImage:   flexibleVImage) ) asList.

            m addMorphLast: (labelMorph copy label: ' Horizontal Resizing: ').
            m addMorphLast: spacerMorph copyV: 2 Color: color.
            6 do: [| :i |
              (i = 3) ifTrue: [
                "Add divider and title for vertical resizing items"
                m addMorphLast: spacerMorph copyV: 3 Color: color.
                m addDivider.
                m addMorphLast: spacerMorph copyV: 5 Color: color.
                m addMorphLast: (labelMorph copy label: ' Vertical Resizing: ').
                m addMorphLast: spacerMorph copyV: 2 Color: color.
              ].
              b: ui2Button copy target: realMorph. 
              b scriptBlock: (scripts at: i).
              r: rowMorph copy.
              r borderWidth: 0.
              r addMorphLast: (spacerMorph copyH: 15 Color: color).
              r addMorphLast: (labelMorph copy label:  labels at: i)  fontSpec: m defaultFontSpec.
              r addMorphLast: (morph copy setHeight: 1) beFlexibleHorizontally .
              r addMorphLast: (images at: i) copy.
              b addMorph: r.
              m addButton: b.
            ].
            m addMorphLast: spacerMorph copyV: 3 Color: color.
            m colorAll: (paint copyRed: 0.78 Green: 0.87 Blue: 0.87).
            defaultButtonHolder: m initializeDefaultButtonHolder: defaultButtonHolder.
            m popUp: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot'
        
         popUpVResizeMenu: evt = ( |
             images.
             labels.
             m.
             scripts.
            | 
            m: ui2Menu copy.
            m leftJustify.

            labels: (
              'rigid' & 'shrink-wrap' & 'space-filling' ) asList.

            scripts: (
              [target beRigidVertically]      &
              [target beShrinkWrapVertically] &
              [target beFlexibleVertically]   ) asList.

            images: (
              (imageMorph copyImage:      rigidVImage) &
              (imageMorph copyImage: shrinkWrapVImage) &
              (imageMorph copyImage:   flexibleVImage) ) asList.

            3 do: [| :i. b. r |
              b: ui2Button copy target: realMorph. 
              b scriptBlock: (scripts at: i).
              r: rowMorph copy.
              r borderWidth: 0.
              r addMorphLast: (labelMorph copy label:  labels at: i)  fontSpec:  m defaultFontSpec.
              r addMorphLast: spacerMorph copy beFlexible baseMinWidth: 10.
              r addMorphLast: (images at: i) copy.
              b addMorph: r.
              m addButton: b.
            ].
            m colorAll: (paint copyRed: 0.78 Green: 0.87 Blue: 0.87).
            vDefaultButtonHolder: m initializeDefaultButtonHolder: vDefaultButtonHolder.
            m popUp: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         rigidHImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '               ' &
    '               ' &
    '000         000' &
    '0 00000000000 0' &
    '000         000' &
    '               ' &
    '               ' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph rigidHImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         rigidVImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '  000  ' &
    '  0 0  ' &
    '  000  ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '  000  ' &
    '  0 0  ' &
    '  000  ' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph rigidVImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         shrinkWrapHImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '0             0' &
    '0   0     0   0' &
    '0    0   0    0' &
    '0000000 0000000' &
    '0    0   0    0' &
    '0   0     0   0' &
    '0             0' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph shrinkWrapHImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         shrinkWrapVImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '0000000' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    ' 0 0 0 ' &
    '  000  ' &
    '   0   ' &
    '       ' &
    '   0   ' &
    '  000  ' &
    ' 0 0 0 ' &
    '   0   ' &
    '   0   ' &
    '   0   ' &
    '0000000' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph shrinkWrapVImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: images\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         submorphMenuImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '       ' &
    '       ' &
    '       ' &
    '       ' &
    '1111111' &
    '1000002' &
    ' 10002 ' &
    ' 10002 ' &
    '  102  ' &
    '  102  ' &
    '   2   ' &
    '       ' ) asVector
 Colors: (
    (paint copyRed: 0.717498 Green: 0.717498  Blue: 0.717498) &
    (paint copyRed: 0.399805 Green: 0.399805  Blue: 0.399805) &
    (paint copyRed: 0.956989 Green: 0.956989  Blue: 0.956989) &
    (paint named: 'yellow')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits proxyMorph submorphMenuImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: public'
        
         updateResizeButtons = ( |
            | 
            ((hLayout = realMorph hResizing) &&
             [vLayout = realMorph vResizing]) ifTrue: [ ^self ].

            resizeButton ifNotNil: [
                resizeButton delete.
                addResizeButton.
            ] IfNil: [
                hResizeButton ifNotNil: [ hResizeButton delete ].
                vResizeButton ifNotNil: [ vResizeButton delete ].
                addSeparateResizeButtons.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: coreSampler InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         vDefaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'proxyMorph' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: coreSampler InitialContents: FollowSlot\x7fVisibility: private'
        
         wantsMorph: m Event: evt = ( |
            | 
            "shift shortcut: add morph dropped on the patch"
            evt isShiftDownForLeftShiftHack &&
            [patch globalBounds includes: evt cursorPoint]).
        } | ) 



 '-- Side effects'

 globals modules coreSampler postFileIn
