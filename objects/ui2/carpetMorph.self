 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Carpet\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         carpetMorph = bootstrap define: bootstrap stub -> 'globals' -> 'carpetMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'carpetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals carpetMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         dragPoint <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'carpetMorph' -> () From: ( | {
         'Comment: used by the middle button menu
to set the hand to follow around the
world.\x7fModuleInfo: Module: carpetMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         handToFollow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         inResizeMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isPersistent <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Carpet\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         carpetMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( |
             {} = 'Comment: The carpet morph makes it possible to group morphs.\x7fModuleInfo: Creator: traits carpetMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'carpetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot'
        
         carpetMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules carpetMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot'
        
         myComment <- 'The carpet morph.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            carpetMorph initializePrototype.
            worldMorph addBackgroundMenuContributor: carpetMorph.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
             box.
            | 
            box:  baseBounds origin #
                 (baseBounds corner - borderWidth).
            c rectangle: box Width: borderWidth Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: background menu\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            [
              "uncomment to put this in background menu;
               right now left button does it so leave out -- dmu 3/01"
              m addButton:
                ( ( ui2Button copy
                   scriptBlock: [carpetMorph copyHand: event sourceHand] )
                   label: 'New carpet' )
                ToGroup: 'top'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHand: h = ( |
            | copy initializeHand: h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: carpetMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         dismissCommand = ( |
            | 
            morphsReverseDo: [| :m |
              isInWorld ifTrue: [
                world addMorph: m.
                world moveToFront: m
              ].
            ].
            delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         drawAbstractedOn: c Scale: s OffsetBy: pt Clip: r = ( |
             corn.
             org.
            | 
            org:  (globalBaseBounds origin x * s ) asInteger @ (globalBaseBounds origin y * s ) asInteger.
            corn: (globalBaseBounds corner x * s ) asInteger @ (globalBaseBounds corner y * s ) asInteger.
            c withClip: r Do: [c rectangle: (org # corn translateBy: pt)  Color: color.].
            morphsDo: [ | :m | m drawAbstractedOn: c Scale: s OffsetBy: pt Clip: r ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeHand: h = ( |
            | 
            inResizeMode: true.
            isPersistent: false.
            position: h position.
            dragPoint: h position.
            h world addMorph: self.
            beFlexible.  "make flexible for resizing"
            h world moveToBack: self.
            h subscribeCursor: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: (paint named: 'black').
            setWidth: 3 Height: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: morphology\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
            inResizeMode || isPersistent ifFalse: [dismissCommand]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: event handling\x7fComment: avoid getting picked up while resizeing\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: e = ( |
            | 
            inResizeMode ifFalse: [  ^ resend.leftMouseDown: e].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: e = ( |
            | 
            inResizeMode ifTrue: [ ^terminateResizingFrom: e sourceHand ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: e = ( |
            | popUpMenu: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'carpetMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: e = ( |
             dx.
             dy.
            | 
            changed.
            dx: e cursorPoint x - dragPoint x.
            dy: e cursorPoint y - dragPoint y.
            0 <= dx
                ifTrue: [ dx: dx max: borderWidth        ]
                 False: [ dx: dx min: borderWidth negate ].
            0 <= dy
                ifTrue: [ dy: dy max: borderWidth        ]
                 False: [ dy: dy min: borderWidth negate ].
            resizeRect: (rectangle from: dragPoint To: dragPoint + (dx@dy)).
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'ModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu addButtonTarget: self ScriptBlock: [target animatedDelete] Label: 'Dismiss'.
            isPersistent ifTrue: [
              menu addButtonTarget: self ScriptBlock: [target isPersistent: false] Label: 'Unpin Carpet'.
            ] False: [
              menu addButtonTarget: self ScriptBlock: [target isPersistent: true]  Label: 'Pin Carpet'.
            ].
            handToFollow ifNil: [
              menu addButtonTarget: self ScriptBlock: [target startFollowingHand: event sourceHand] Label: 'Start following'.
            ] IfNotNil: [
              menu addButtonTarget: self ScriptBlock: [target stopFollowing] Label: 'Stop following'.
            ].
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         startFollowingHand: h = ( |
            | 
            handToFollow: h.
            startGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot'
        
         step = ( |
             myRect.
             winRect.
            | 
            owner = world ifFalse: [ ^ self ].
            handToFollow ifNil: [ ^ self ].
            handToFollow isInWorld ifFalse: [^ stopFollowing ].

            winRect: (handToFollow winCanvasForHand) boundingBoxInWorld.
            myRect: baseBounds.
            (winRect encloses: myRect) ifFalse: [
              changed.
              globalPosition: globalPosition + 
                ((winRect center - myRect center) * 0.06) asInteger.
              changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         stopFollowing = ( |
            | 
            handToFollow: nil.
            stopGettingStepped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'carpetMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: carpetMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         terminateResizingFrom: h = ( |
             l.
            | 
            h unsubscribeCursor: self.
            inResizeMode: false.
            beRigid.
            l: list copyRemoveAll.
            h world morphsDo: [| :m |
             (baseBounds encloses: m baseBounds) ifTrue: [l add: m]].
            l isEmpty ifTrue: [ delete ] False: [
              addAllMorphs: l.
              world moveToFront: self.
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules carpetMorph postFileIn
