 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonMorph = bootstrap define: bootstrap stub -> 'globals' -> 'buttonMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( |
             {} = 'Comment: Obsolete; use ui2Button instead.
--dmu\x7fModuleInfo: Creator: globals buttonMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fComment: pressable buttons (e.g., all buttons in a menu)\x7fModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         activeButtons <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         asyncEvaluation <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         expression <- 'printLine'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         labelRow <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         labelRowLabel <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits buttonMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'buttonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rawIsDown <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         reifyResult <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonMorph' -> () From: ( | {
         'Category: Button Morph State\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         targetFrozen <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Keep submorphs from seeing leftMouseDown events."
            evt leftMouseDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLabelRow = ( |
            | 
            removeAllMorphs.
            "xxx Hack! replace the labelRow with an editorMorph later"
            labelRow: rowMorph copy color: color.
            labelRow beFlexible borderWidth: 1.
            labelRowLabel: labelMorph copy.
            labelRow addMorph: labelRowLabel.
            addMorph: labelRow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: buttonAction\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonAction: evt = ( |
            | 
            "You can override this method by adding a buttonAction slot
             directly to your button. Buttons are typically customized
             by changing the expression to be evaluated."
            setTarget.
            target ifNil:    [ 7 asCharacter print. "beep"]
                   IfNotNil: [ evalMessageOnTarget: evt   ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         collectActiveButtons = ( |
             l.
            | 
            "Collect all button morphs in my owner. These are the buttons
             that could be activated if the mouse goes up over them."        

            owner ifNil: [ ^vector ].
            l: list copyRemoveAll.
            owner morphsDo: [| :m |
                m isButtonLike ifTrue: [ l add: m ].
            ].
            l asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         color = ( |
            | 
            isDown ifFalse: [^ rawColor].
            rawColor copyBrighterBy:
              rawColor brightness > paint virtualGrayBrightness
                ifTrue: 0.2  False: -0.2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         color: c = ( |
            | 
            resend.color: c.
            labelRow color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: buttonAction\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         evalMessageOnTarget: evt = ( |
             evalProc.
            | 
                 evalProc: messageForAction forkForBirthEvent: evt.
                 evalProc causeOfBirth: 'button action'.
                 asyncEvaluation ifTrue: [
                     "Do not wait for the evaluation process to terminate,
                      but arrange for an stepped activity to check its status
                      periodically and reify the result when the evaluation
                      process terminates."

                     reifyResult ifTrue: [
                         addActivity: (reifyResultActivity
                             copyForButton: self Process: evalProc).
                     ].
                 ] False: [
                     "Wait until the evaluation process terminates."

                     evalProc waitForSuspension.
                     (evalProc causeOfDeath = 'terminated') ifTrue: [
                         "process teriminated normally, without error"
                         handleResult: evalProc returnValue.
                     ].
                 ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         freezeTarget = ( |
            | 
            "Freeze the current target: the frozen target will be used as
             the target even if the receiver is placed on some other object.
             If the target is already frozen, it is first unfrozen, then
             re-frozen based on the current owner of this morph."

            targetFrozen: false.
            setTarget.
            targetFrozen: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         freezeTarget: t = ( |
            | 
            "Make the given object the current target and freeze it."

            target: t.
            targetFrozen: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: buttonAction\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         handleResult: result = ( |
            | 
            "If reifyResult is true, then add the given result object to the world."

            reifyResult ifTrue: [
                target = result ifFalse: [| m. p |
                    m:  result isShowableAsMorph
                         ifTrue: [result asMorph]
                          False: [repMorph copyFor: result].
                    p: globalBaseBounds topRight + (20@0).
                    m globalPosition: p "- (0 @ (m baseBounds height / 2))".
                    world addMorph: m.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            beShrinkWrap.
            borderWidth: 3.
            buildLabelRow.
            labelAndExpression: 'printLine'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isButtonLike = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown = ( |
            | rawIsDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown: newState = ( |
            | 
            newState = rawIsDown ifFalse: [
              rawIsDown: newState.
              changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         label = ( |
            | labelRow contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         label: s = ( |
            | 
            "xxx Hack! temporarily, just smash new contents into labelRow's labelMorph"
            "xxx This should be fixed when we replace the labelRow with an editorMorph"
            labelRowLabel label: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         labelAndExpression: s = ( |
            | 
            label: s.
            expression: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            activeButtons: collectActiveButtons.
            isDown: true.
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
             pressed.
            | 
            evt sourceHand unsubscribeCursor: self.
            activeButtons do: [| :b |
                b isDown ifTrue: [
                    b isDown: false.
                    pressed: b.
                ].
            ].
            activeButtons: vector.
            pressed ifNotNil: [ pressed buttonAction: evt ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: labelRow      IsPresentDo: [| :new | labelRow:      new ].
            dict if: labelRowLabel IsPresentDo: [| :new | labelRowLabel: new ].
            dict if: target        IsPresentDo: [| :new | target:        new ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: buttonAction\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         messageForAction = ( |
            | 
            "Return the message object used to perform this button's action."

            message copy
                receiver: expression
                Selector: 'evalInContext:FileName:'
                    With: mirrorOnTarget
                    With: '<a button expression>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: buttonAction\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mirrorOnTarget = ( |
            | 
            target isMorph
                ifTrue: [reflect: target buttonEvalContext]
                 False: [reflect: target]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'buttonMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
             new.
             old.
             p.
            | 
            old: nil.
            new: nil.
            p: evt cursorPoint.
            activeButtons do: [| :b |
                b isDown ifTrue: [ old: b ].
                (b globalBounds includes: p) ifTrue: [ new: b ].
            ].
            old = new ifFalse: [
                old ifNotNil: [ old isDown: false ].
                new ifNotNil: [ new isDown: true  ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         setTarget = ( |
             o.
            | 
            "Set the target for this button, unless the target has been frozen.
             The target is the base of morph stack starting with the receiver's]
             owner and excluding the world. (The decision to exclude the world
             is a policy decision that could be changed.) The target is set to
             nil if no suitable target is found."
            "Object outliners stand for their objects -- dmu "

            targetFrozen ifTrue: [ ^self ].
            o: owner.
            [o isNotNil && [o isWorldMorph not]] whileTrue: [ o: o owner ].
            target: ((o isNil || [o isWorldMorph]) ifTrue: nil False: o).
            target isPluggableOutliner && 
            [target model isSelfObjectModel]  ifTrue: [
              [|:exit|
                target: target model mirror reflecteeIfFail: exit.
              ] exit.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonMorph' -> () From: ( | {
         'Category: targetManipulation\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         unfreezeTarget = ( |
            | 
            "Unfreeze the receiver's target; the receiver will use its current
             owner to determine its target."

            targetFrozen: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         messageButtonMorph = bootstrap define: bootstrap stub -> 'globals' -> 'messageButtonMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'expression' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals buttonMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'messageButtonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals messageButtonMorph.

CopyDowns:
globals buttonMorph. copyRemoveAllMorphs 
SlotsToOmit: expression parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         messageButtonMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits messageButtonMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'messageButtonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rawSelector <- 'printString'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot'
        
         buttonMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules buttonMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot'
        
         myComment <- 'Menus, buttons, and repMorphs.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            buttonMorph initializePrototype.
            messageButtonMorph initializePrototype.
            repMorph initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'buttonMorphs' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         reifyResultActivity = bootstrap define: bootstrap stub -> 'globals' -> 'reifyResultActivity' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals morphStepActivity copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'reifyResultActivity' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals reifyResultActivity.

CopyDowns:
globals morphStepActivity. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reifyResultActivity' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         evalProcess.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         reifyResultActivity = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'reifyResultActivity' -> () From: ( |
             {} = 'Comment: This activity is used by asynchronous buttons to notice when
     the process evaluating the button\'s expression has terminated and, if
     it completed without an error, add the resulting object to the world.\x7fModuleInfo: Creator: traits reifyResultActivity.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'reifyResultActivity' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'reifyResultActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         repMorph = bootstrap define: bootstrap stub -> 'globals' -> 'repMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'repMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals repMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'repMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         labelRow <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'repMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         labelRowLabel <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'repMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         lastPeekTime <- bootstrap stub -> 'globals' -> 'time' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         repMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( |
             {} = 'Comment: A repMorph is a morph that represents an arbitrary Self object.
     Typically, the label of a repMorph is the printString for the object that
     it represents; it can optionally poll the object at periodic intervals to
     ensure that this label remains consistent with the current state of the
     object. Buttons placed on a repMorph evaluate their expressions in the
     context of the represented object.\x7fModuleInfo: Creator: traits repMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'repMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'repMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'repMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         peekInterval <- 1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'repMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         representee <- 'a repMorph on a string'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'Category: selectorAndArguments\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         expression = ( |
             exprList.
             sel.
            | 
            "For a messageButtonMorph, the expression is determined by the
             selector and the argument expressions typed in the interspersed
             text fields."

            sel:  selector copyStr: rawSelector.
            exprList: extractArgumentExpressions.
            exprList size = sel numberOfArguments ifTrue: [
                (sel intersperse: exprList) asString.
            ] False: '\'wrong number of arguments\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'Category: selectorAndArguments\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         expression: e = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'Category: selectorAndArguments\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         extractArgumentExpressions = ( |
             exprList.
            | 
            "Collect the argument expression strings from the text fields."

            exprList: list copyRemoveAll.
            labelRow morphsDo: [| :m |
                "scan for argument fields embedded in the label"
                m morphTypeName = editorMorph morphTypeName ifTrue: [
                    exprList add: m contentsString.
                ].
            ].
            exprList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            beShrinkWrap borderWidth: 3.
            selector: 'printString'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'Category: selectorAndArguments\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         label: sel = ( |
            | selector: sel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'messageButtonMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'buttonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageButtonMorph' -> () From: ( | {
         'Category: selectorAndArguments\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selector: sel = ( |
             morphList.
            | 
            "Specify the message selector for this button.
             Details: Add the text of the selector interspersed with
             text fields in which to type argument expressions."

            rawSelector: sel.
            resend.label: sel.
            morphList: list copyRemoveAll.
            sel do: [| :c |
                morphList add: (labelMorph copyLabel: c).
                ':' = c ifTrue: [ morphList add: editorMorph copy ].
            ].
            labelRow removeAllMorphs.
            labelRow addAllMorphs: morphList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'reifyResultActivity' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForButton: b Process: p = ( |
            | 
            (copyTarget: b) evalProcess: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'reifyResultActivity' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         done = ( |
            | 
            (evalProcess status = processStatus dead) || [ resend.done ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'reifyResultActivity' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
            | 
            (processStatus dead = evalProcess status) &&
            ['terminated' = evalProcess causeOfDeath] ifTrue: [
                "process terminated normally"
                target handleResult: evalProcess returnValue.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'reifyResultActivity' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morphStepActivity' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLabel = ( |
             f.
            | 
            "A repMorph is a bezel frame containing an insetBezel
             frame containing a textRow that holds the printString
             of its representee."

            "xxx Hack! replace the labelRow with an editorMorph later"
            labelRow: rowMorph copy color: color.
            labelRow beFlexible borderWidth: 2.
            labelRowLabel: labelMorph copy.
            labelRowLabel fontSpec: labelRowLabel fontSpec copyName: 'times' Style: 'italic'.
            labelRow addMorph: labelRowLabel.

            "make the inset bezel:"
            f: frameMorph copy color: color.
            f beFlexible borderWidth: borderWidth.
            f frameStyle: f insetBezelStyle.
            f addMorph: labelRow.

            removeAllMorphs.
            beShrinkWrap.
            addMorph: f.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: evaluating\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonEvalContext = ( |
            | 
            "Answer an object to be used as the evaluation context for
             button and menu actions. For normal morphs, this is the morph
             itself. For morphs that represent arbitrary Self objects, this
             is the representee."

            representee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFor: anObject = ( |
             new.
            | 
            new: copy.
            new representee: anObject.
            new setLabel.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: (paint copyRed: 0.668622 Green: 0.754643 Blue: 0.733138).
            beShrinkWrap borderWidth: 3.
            buildLabel.
            setLabel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         label = ( |
            | labelRow contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         label: s = ( |
            | 

            "xxx Hack! temporarily, just smash new contents into labelRow's labelMorph"
            "xxx This should be fixed when we replace the labelRow with an editorMorph"
            labelRowLabel label: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            "Note: the representee is not considered a part, so is deliberately not mapped."
            dict if: labelRow      IsPresentDo: [| :new | labelRow:      new ].
            dict if: labelRowLabel IsPresentDo: [| :new | labelRowLabel: new ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'repMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'ModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: polling\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         pollAtIntervalsOf: mSecs = ( |
            | 
            "The repMorph should already be in the world before
             this method is called so that it can register itself
             in the world's activity list."

            peekInterval: mSecs.
            lastPeekTime: time current - mSecs succ.
            startGettingStepped.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: label\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setLabel = ( |
            | 
            "Set my label to the printString of my representee."

            label: representee printString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'repMorph' -> () From: ( | {
         'Category: polling\x7fModuleInfo: Module: buttonMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            "Every peekInterval milliseconds, test to see if the
             printString has changed. If so, update my label."

            (time current - lastPeekTime) >= peekInterval ifTrue: [
                | currentPS |
                currentPS: representee printString.  "current printString"
                currentPS != label ifTrue: [
                    label: currentPS.
                    changed.
                ].
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules buttonMorphs postFileIn
