 '$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot'
        
         radarView = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules radarView.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            radarView initializePrototype.
            worldScrollerMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         radarDisplayMorph = bootstrap define: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals radarDisplayMorph.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         frameCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (20)\x7fVisibility: public'
        
         framesBetweenUpdate <- 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isRunning <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         radarDisplayMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits radarDisplayMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (paint copyRed: 0.5 Green: 0.5 Blue: 0.5)\x7fVisibility: private'
        
         rawColor <- paint copyRed: 0.5 Green: 0.5 Blue: 0.5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (paint copyRed: 0.93 Green: 0.96 Blue: 0.91)\x7fVisibility: public'
        
         savedColor <- paint copyRed: 0.93 Green: 0.96 Blue: 0.91.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarDisplayMorph' -> () From: ( | {
         'Category: Radar Display Morph state\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (0.05)\x7fVisibility: public'
        
         scale <- 0.05.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         radarView = bootstrap define: bootstrap stub -> 'globals' -> 'radarView' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'radarView' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals radarView.

CopyDowns:
globals frameMorph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarView' -> () From: ( | {
         'Category: Radar View state\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (nil.)\x7fVisibility: public'
        
         panel <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         radarView = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits radarView.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'radarView' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         worldScrollerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'worldScrollerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'worldScrollerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals worldScrollerMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldScrollerMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'worldScrollerMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals worldScrollerMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldScrollerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
             c.
             r.
            | 
            removeAllMorphs.
            c: columnMorph copy.
            c beShrinkWrap borderWidth: 0.
            c addMorphFirst: downButton.
            c addMorphFirst: homeButton.
            c addMorphFirst: upButton.

            r: rowMorph copy.
            r borderWidth: 2.
            r addMorphFirst: rightButton.
            r addMorphFirst: c.
            r addMorphFirst: leftButton.
            r centerJustify.
            r beShrinkWrapVertically.
            r beFlexibleHorizontally.

            addMorphLast: r.
            beShrinkWrap.
            colorAll: (paint copyRed: 0.84 Green: 0.88 Blue: 0.87).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldScrollerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'worldScrollerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits radarView parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'worldScrollerMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "See comment in traits morph for general idea.
             Here, probably best to not change color."

            morphsDo: [| :m | m colorAll: newC ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: c = ( |
             off.
            | 
            resend.drawOn: c.
            isRunning ifFalse: [ ^ self ].

            off: ((baseBounds size / 2) - (globalBaseBounds center * scale)) asInteger.

            world morphs reverseDo: [ | :m |
              m drawAbstractedOn: c 
                           Scale: scale
                        OffsetBy: off
                            Clip: baseBounds.
            ].
            world hands reverseDo: [ | :h |
              h morphs do: [ | :m |
                m drawAbstractedOn: c
                             Scale: scale
                          OffsetBy: off
                              Clip: baseBounds.
              ].
              h drawAbstractedOn: c 
                           Scale: scale
                        OffsetBy: off
                            Clip: baseBounds.
            ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'radarDisplayMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            isRunning ifTrue: [ ^ self ].
            swapColors. 
            startGettingStepped. 
            isRunning: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            frameCount: frameCount succ.
            framesBetweenUpdate < frameCount ifTrue: [
              frameCount: 0.
              changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            isRunning ifFalse: [^ self ].
            swapColors. 
            stopGettingStepped.
            isRunning: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarDisplayMorph' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         swapColors = ( |
             c.
            | 
            c: savedColor.
            savedColor: color.
            color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
             c.
             f.
             ff.
             r.
            | 
             removeAllMorphs.
             f: frameMorph copy.
             f borderWidth: 2.
             f frameStyle: f flatStyle.
             f beShrinkWrapVertically.
             f beFlexibleHorizontally.

             ff: frameMorph copy. 
             ff frameStyle: ff insetBezelStyle. 
             ff beShrinkWrapVertically.
             ff beFlexibleHorizontally.

             panel: radarDisplayMorph copy.
             panel beRigidVertically.
             panel beFlexibleHorizontally.
             panel setWidth: 100 Height: 100.

             c: columnMorph copy.
             c beShrinkWrap borderWidth: 0.
             c addMorphFirst: downButton.
             c addMorphFirst: upButton.

             r: rowMorph copy.
             r borderWidth: 2.
             r addMorphFirst: rightButton.
             r addMorphFirst: c.
             r addMorphFirst: leftButton.
             r addMorphFirst: homeButton.
             r addMorphFirst: zoomInButton.
             r addMorphFirst: zoomOutButton.
             r addMorphFirst: onOffButton.
             r centerJustify.
             r beShrinkWrapVertically.
             r beFlexibleHorizontally.

            ff addMorph: panel.
            f addMorph: ff.
            addMorph: f.
            addMorphLast: r.
            beShrinkWrap.
            colorAll: (paint copyRed: 0.84 Green: 0.88 Blue: 0.87).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: panel        IsPresentDo: [| :new | panel:        new ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            panel isRunning ifTrue: [
                evt sourceHand subscribeCursor: self.
                world moveToFront: self. ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseUp: evt = ( |
            | 
            evt sourceHand unsubscribeCursor: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'radarView'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'Comment: A middle mouse down will enroll this object in cursor intrest, so that this message will be
subsuquently sent. This object responds by moving itself and the source hands asssociated canvas.
The effect is intended to be as though the user is dragging the little image of the radar
view within its own view, so that the world effectively moves.  
   --Randy, 6/16/95\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
             delta.
            | 
            delta: (((1 - panel scale) * (evt cursorPoint - panel globalBaseBounds center)) / panel scale) asInteger.
            root globalPosition: root globalPosition + (evt cursorPoint - panel globalBaseBounds center).
            moveViewBy: delta ForHand: evt sourceHand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         onOffButton = ( |
            | 
            ((ui2Button copy label: ' on ') 
              scriptBlock: [
               target panel isRunning ifTrue: [
                  target panel stop.
                  button label: ' on '.
                ] False: [
                  target panel start.
                  button label: ' off '.
                ].
              ])
              target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         animator = bootstrap define: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals interpolatingAnimator copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits radarView parent animator.

CopyDowns:
globals interpolatingAnimator. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         canvas.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: InitializeToExpression: (nil)'
        
         hand.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: InitializeToExpression: ((0)@(0))\x7fVisibility: private'
        
         motionSoFar <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits radarView parent animator parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Hand: h Canvas: c MoveBy: pt Frames: f = ( |
             new.
            | 
            new: copyTarget: t Frames: f.
            new canvas: c.
            new hand: h.
            new totalMotion: pt.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'interpolatingAnimator' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> 'parent' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         setRelativeTargetValue: p = ( |
             pp.
            | 
            pp:  (0 interpolate: p From: totalMotion x) asInteger
               @ (0 interpolate: p From: totalMotion y) asInteger.
            target moveViewBy: pp - motionSoFar ForHand: hand.
            motionSoFar: pp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> 'animator' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         totalMotion <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: components\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         downButton = ( |
            | 
            ((ui2Button copy label: ' \\/ ') 
              scriptBlock: [ target moveViewForEvent: event By: (0 @ ((target winCanvasForEvent: event) size y / 2))])
              target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: components\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         homeButton = ( |
            | 
            ((ui2Button copy label: ' home ') 
              scriptBlock: [ target moveViewForEvent: event To: 0@0])
              target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: components\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         leftButton = ( |
            | 
            ((ui2Button copy label: ' < ') 
              scriptBlock: [ target moveViewForEvent: event
                                                  By: ((target winCanvasForEvent: event) size x / 2 ) negate @ 0])
              target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         moveViewBy: pt ForHand: h = ( |
            | 
            root globalPosition: root globalPosition + pt.
            world moveHand: h InWorldBy: pt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: moving\x7fComment: relative move, positive pt x moves to right
-- Ungar, 12/24/94\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         moveViewForEvent: event By: pt = ( |
             c.
             dist.
             maxStep.
             steps = 32.
            | 
            world moveToFront: self.
            dist: pt r.
            c: winCanvasForEvent: event.
            maxStep: c size r / steps.
            (useAnimation not) || [dist <= maxStep] ifTrue: [
              moveViewBy: pt ForHand: event sourceHand.
            ] False: [| a |
              a: animator copyTarget: self Hand: event sourceHand Canvas: c MoveBy: pt Frames: dist / maxStep.
              world addActivity: a.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         moveViewForEvent: event To: pt = ( |
            | 
            moveViewForEvent: event By: pt + (winCanvasForEvent: event) offset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         reportDamageForCanvas: c = ( |
            | 
            "report damage for screen edges associated with this canvas."
            world morphsDo: [| :m |
                ((m morphTypeName = 'screenEdge') && [m winCanvas = c]) ifTrue: [
                    m changed.
                ].
            ].
            root changed. "report damage for this radarView"
            c redrawWindow: true. "redraw the window associated with the given canvas"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: components\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButton = ( |
            | 
            ((ui2Button copy label: ' > ') 
              scriptBlock: [ target moveViewForEvent: event
                                                  By: ((target winCanvasForEvent: event) size x /2) @ 0])
              target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: components\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         upButton = ( |
            | 
            ((ui2Button copy label: ' /\\ ') 
              scriptBlock: [ target moveViewForEvent: event
                                                  By: (0 @ ((target winCanvasForEvent: event) size y negate / 2))])
              target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: moving\x7fComment: Use animation when scrolling the world?\x7fModuleInfo: Module: radarView InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         useAnimation <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> 'parent' -> () From: ( | {
         'Category: moving\x7fModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         winCanvasForEvent: evt = ( |
            | 
            evt sourceHand winCanvasForHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomIn = ( |
            | 
            panel scale: panel scale * 1.2.
            panel changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         zoomInButton = ( |
            | 
            ((ui2Button copy label: ' + ') 
              scriptBlock: [target zoomIn])
              target: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: public'
        
         zoomOut = ( |
            | 
            panel scale: panel scale / 1.2 .
            panel changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'ModuleInfo: Module: radarView InitialContents: FollowSlot\x7fVisibility: private'
        
         zoomOutButton = ( |
            | 
            ((ui2Button copy label: ' - ') 
              scriptBlock: [target zoomOut])
              target: self).
        } | ) 



 '-- Side effects'

 globals modules radarView postFileIn
