 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         optionalMorph = bootstrap define: bootstrap stub -> 'globals' -> 'optionalMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'optionalMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals optionalMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         inner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         optionalMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits optionalMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'optionalMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
            | 
            "Optimization: suppress drawing if this morph's color matches
             that of its owner."

            (owner submorphVisible: self) ifTrue: [ resend.baseDrawOn: aCanvas ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            changed.
            removeAllMorphs.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyInner: i = ( |
            | copy inner: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            beShrinkWrap.
            close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | morphs isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: inner IsPresentDo: [|:n| inner: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'optionalMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( |
            | 
            isOpen || [inner isNil] ifFalse: [
                inner globalPosition: globalPosition.
                safelyDo: [ addMorph: inner ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'optionalMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         commentButtonMorph = bootstrap define: bootstrap stub -> 'globals' -> 'commentButtonMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals optionalMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'commentButtonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals commentButtonMorph.

CopyDowns:
globals optionalMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         action.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         commentButtonMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits commentButtonMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'commentButtonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentButtonMorph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (paint named: \'transparent\')\x7fVisibility: private'
        
         rawColor <- paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         style.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         pushButton = bootstrap define: bootstrap stub -> 'globals' -> 'pushButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( |
             {} = 'Comment: Do not use me!!
Use ui2Button instead.\x7fModuleInfo: Creator: globals pushButton.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         action.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         isAsynchronous <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         pushButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pushButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'pushButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         rawIsDown <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         rawIsUp <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         source.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (paint copyRed: 0.799609 Green: 0.799609  Blue: 0.799609)\x7fVisibility: private'
        
         tannedColor <- paint copyRed: 0.799609 Green: 0.799609  Blue: 0.799609.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Keep submorphs from seeing leftMouseDown events."
            evt leftMouseDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         beDown = ( |
            | 
            rawIsDown: true.
            rawIsUp: false.
            recolor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         beFlat = ( |
            | 
            rawIsDown: false.
            rawIsUp: false.
            recolor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         beUp = ( |
            | 
            rawIsDown: false.
            rawIsUp: true.
            recolor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         collapse: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         color: c = ( |
            | 
            c = color ifTrue: [^self].
            resend.color: c.
            tannedColor: color copyDarkerBy: 0.07).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyColor: col Target: tar = ( |
            | 
            ((copy color: col) target: tar) action: act).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyColor: col Target: tar Inner: inner = ( |
             new.
            | 
            new: (copyRemoveAllMorphs color: col) target: tar.
            new addMorphLast: inner.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyInner: inner Target: tar Action: act Style: sty = ( |
             new.
            | 
            new: copyColor: sty color Target: tar Inner: inner.
            new  action: act.
            new  recolor.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: tar Action: act Style: sty = ( |
            | 
            copyTarget: tar Source: self Action: act Style: sty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: tar Source: src Action: act Style: sty = ( |
             new.
            | 
            new: copy.
            new  color: sty color.
            new  target: tar.
            new  source: src.
            new  action: act.
            new  recolor.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         evalAsynchronousAction: evt = ( |
            | 
            nil = action ifFalse: [
              action actionFrom: source Target: target Event: evt ].
            safelyDo: [ beUp ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         expand: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         initializePrototype = ( |
             r.
            | 
            removeAllMorphs.
            color: paint named: 'lightGray'.
            r: (morph copyRemoveAllMorphs color: color).
            r beRigid.
            r setWidth: 7 Height: 7.
            addMorphLast: r.
            rawIsDown: false.
            borderWidth: 2.
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown = ( |
            | rawIsDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown: newState = ( |
            | 
            newState = isDown ifFalse: [
              rawIsDown: newState.
              recolor.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isExpanded = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isUp = ( |
            | rawIsUp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            (evt sourceHand capabilitySet includes: capabilities pressButton) ifFalse: [ ^ self].
            evt isShiftDownForLeftShiftHack ifTrue: [^dropThroughMarker].
            isDown: true.
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            evt sourceHand unsubscribeCursor: self.         
            isDown ifTrue: [
              beFlat.
              isAsynchronous ifTrue: [
                (message copy receiver: self
                              Selector: 'evalAsynchronousAction:'
                                  With: evt) forkForBirthEvent: evt.
              ] False: [
                nil = action ifFalse: [ | r |
                  r: action actionFrom: source Target: target Event: evt.
                  beUp.
                  ^ r
                ].
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: target IsPresentDo: [|:n| target: n].
            dict if: source IsPresentDo: [|:n| source: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'pushButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | 
            isDown: (globalBounds includes: evt cursorPoint).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         recolor = ( |
            | 
            case
             if: [isDown] Then: [
              frameStyle: insetBezelStyle.
              firstMorph colorAll: tannedColor
            ] If: [isUp] Then: [
              frameStyle: bezelStyle.
              firstMorph colorAll: color.
            ] Else: [
              frameStyle: flatStyle.
              firstMorph colorAll: color interpolate: 0.5 From: tannedColor.
            ].
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pushButton' -> () From: ( | {
         'Comment: Used when a keystroke, etc
is supposed to simulate actually pressing the button.
-- Ungar, 2/4/95\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         simulateButtonPress: evt = ( |
            | 
            leftMouseDown: evt.
            leftMouseUp:   evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expanderPushButton = bootstrap define: bootstrap stub -> 'globals' -> 'expanderPushButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals pushButton copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'expanderPushButton' -> () From: ( |
             {} = 'Comment: Do not use me!!
Use ui2Button instead.\x7fModuleInfo: Creator: globals expanderPushButton.

CopyDowns:
globals pushButton. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderPushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isExpanded <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderPushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         oldColor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expanderPushButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'expanderPushButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits expanderPushButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderPushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'expanderPushButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         motifWidgets = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules motifWidgets.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         myComment <- 'widget morphs used by the outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            radioButton         initializePrototype.
            pushButton          initializePrototype.
            optionalMorph       initializePrototype.
            commentButtonMorph  initializePrototype.
            expanderPushButton  initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'motifWidgets' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         radioButton = bootstrap define: bootstrap stub -> 'globals' -> 'radioButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( |
             {} = 'Comment: RadioButton a\'la Motif\x7fModuleInfo: Creator: globals radioButton.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (nil \"no store string\")\x7fVisibility: private'
        
         action.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (paint named: \'white\')\x7fVisibility: private'
        
         brightColor <- paint named: 'white'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (paint copyRed: 0.669599 Green: 0.669599  Blue: 0.669599)\x7fVisibility: private'
        
         darkColor <- paint copyRed: 0.669599 Green: 0.669599  Blue: 0.669599.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         otherButtonsInGroup <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         radioButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits radioButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'radioButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         rawIsDown <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         script <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (nil \"no store string\")\x7fVisibility: private'
        
         stateAtMouseDown.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: InitializeToExpression: (paint copyRed: 0.770283 Green: 0.770283  Blue: 0.770283)\x7fVisibility: private'
        
         tannedColor <- paint copyRed: 0.770283 Green: 0.770283  Blue: 0.770283.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildInner = ( |
            | 
            inner: pushButton copyInner: (labelMorph copyLabel: style commentButtonText
                                                      FontSpec: style fontSpec
                                                         Color: style fontColor) 
                              Target: target
                              Action: action
                               Style: style.
            inner position: 0@0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         colorButtonBackground: bg Foreground: fg = ( |
            | 
            "Inner is pushButtonMorph"
            inner color: bg.
            "First submorph is a labelMorph"
            inner morphs first color: fg.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         copyTarget: tar Action: act Style: sty = ( |
            | 
            "rca 2014/11/11 Ignore style color.
            Color handled by recolor"
            ((copy
               beShrinkWrap
               target: tar)
               action: act)
               style: sty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            beFlexibleVertically.
            beShrinkWrapHorizontally.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'commentButtonMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         open = ( |
            | 
            inner ifNil: [ buildInner ].
            resend.open).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'optionalMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderPushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            isExpanded: false.
            firstMorph color: oldColor.
            firstMorph changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderPushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            isExpanded: true.
            oldColor: firstMorph color.
            firstMorph color: paint named: 'green'.
            firstMorph changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderPushButton' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'expanderPushButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderPushButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'pushButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Comment: this is a set of buttons in this buttons
group. Amongst all these buttons, only one button
is down at a time, possibly zero.\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         allButtonsInGroup = ( |
             s.
            | 
            s: otherButtonsInGroup copy.
            s add: self.
            otherButtonsInGroup do: [ | :b | 
              b otherButtonsInGroup do: [ | :bb | 
                s add: bb.
              ].
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Event Handling\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Keep submorphs from seeing leftMouseDown events."
            evt leftMouseDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         baseCopy = ( |
             b.
            | 
            b: resend.baseCopy . 
            b otherButtonsInGroup: otherButtonsInGroup copy.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Displaying\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         baseDrawOn: c = ( |
             h.
             newC.
             r.
             v.
             w.
            | 
            r: baseBounds.
            h: r height.
            w: r width.
            v: vector copySize: 4.

            newC: c copyOffset: position.

            "Bottom left"
            v at: 0 Put: 0@h half.
            v at: 1 Put: borderWidth@h half.
            v at: 2 Put: w half@(h - borderWidth).
            v at: 3 Put: w half@h.
            newC fillPolygon: v Color: rightBottomColor.

            "Top left"
            v at: 0 Put: 0@h half.
            v at: 1 Put: w half@0.
            v at: 2 Put: w half@borderWidth.
            v at: 3 Put: borderWidth@h half.
            newC fillPolygon: v Color: leftTopColor.

            "Top right"
            v at: 0 Put: w half@0.
            v at: 1 Put: w half@borderWidth.
            v at: 2 Put: (w - borderWidth)@h half.
            v at: 3 Put: w@h half.
            newC fillPolygon: v Color: leftTopColor.

            "Bottom right"
            v at: 0 Put: (w - borderWidth)@h half.
            v at: 1 Put: w@h half.
            v at: 2 Put: w half@h.
            v at: 3 Put: w half@(h - borderWidth).
            newC fillPolygon: v Color: rightBottomColor.

            "Center"
            v at: 0 Put: borderWidth@h half.
            v at: 1 Put: w half@borderWidth.
            v at: 2 Put: (w - borderWidth)@h half.
            v at: 3 Put: w half@(h - borderWidth).
            newC fillPolygon: v Color: buttonColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         borderWidth = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Colors\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         buttonColor = ( |
            | isDown ifTrue: tannedColor False: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Colors\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         color: c = ( |
            | 
            resend.color: c.
            brightColor: color copyBrighterBy: 0.2.
            darkColor:   color copyDarkerBy: 0.2.
            tannedColor: paint named: 'yellow' "copyDarkerBy: 0.1").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyColor: col Target: tar = ( |
            | (copy color: col) target: tar).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: tar Action: act = ( |
            | (copy target: tar) action: act).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: tar Action: act Style: sty = ( |
            | 
            (copyTarget: tar Action: act) color: sty color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Copying\x7fComment: Creates a collection of radioButtons, all in the same group.
(In a group, pressing one button makes all the others be up.)
The first button of this collection will be in the down state.\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         createGroupOfSize: n = ( |
             v.
            | 
            v: vector copySize:  n.
            v size  do: [ | :i. b| 
              b: copy.
              v at: i Put: b.
              i = 0 ifFalse: [b joinButtonGroupOf: (v at: 0)].
            ].
            (v at: 0) isDown: true.
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Initialize\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         initializePrototype = ( |
            | 
            color: paint named: 'lightGray'.
            setWidth: 12 Height: 12.
            rawIsDown: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown = ( |
            | rawIsDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown: newState = ( |
            | 
            newState = isDown ifFalse: [
              changed.
              rawIsDown: newState.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Displaying\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Comment: Enroll this button in the group in which b is a member.
Client is responsible for making sure that only one member of this group is
in the up state.\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         joinButtonGroupOf: b = ( |
             bigGroup.
            | 
            bigGroup: b otherButtonsInGroup, otherButtonsInGroup.
            bigGroup add: self.
            bigGroup add: b.  
            bigGroup do: [ | :ob1 | bigGroup do: [ | :ob2 |  
               ob1 = ob2 ifFalse: [ob1 otherButtonsInGroup add: ob2].
            ].].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Event Handling\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            (evt sourceHand capabilitySet includes: capabilities pressButton)
              ifFalse: [ ^ self].
            stateAtMouseDown: isDown. 
            isDown: isDown not.
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Event Handling\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            evt sourceHand unsubscribeCursor: self.         
            otherButtonsInGroup do: [ | :b | b isDown: false].
            isDown != stateAtMouseDown ifTrue: [
              nil = target ifFalse: [action actionFrom: self Target: target Event: evt]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Colors\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         leftTopColor = ( |
            | isDown ifTrue: darkColor   False: brightColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Copying\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [|:n| target: n].
            otherButtonsInGroup copy do: [| :b |
              dict if: b IsPresentDo: [|:n | 
                 otherButtonsInGroup remove: b.
                 otherButtonsInGroup add: n.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Type\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'radioButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Event Handling\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | (globalBounds includes: evt cursorPoint) ifTrue: [
               isDown: stateAtMouseDown not
            ] False: [
               isDown: stateAtMouseDown
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'ModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: button issues - not yet complete\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         resultReporter = ( |
            | ui2Button resultReporter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButton' -> () From: ( | {
         'Category: Colors\x7fModuleInfo: Module: motifWidgets InitialContents: FollowSlot'
        
         rightBottomColor = ( |
            | isDown ifTrue: brightColor False: darkColor).
        } | ) 



 '-- Side effects'

 globals modules motifWidgets postFileIn
