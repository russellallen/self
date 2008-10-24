 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         checkBoxMorph = bootstrap define: bootstrap stub -> 'globals' -> 'checkBoxMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'checkBoxMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals checkBoxMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         radioButtonGroup = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'radioButtonGroup' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals radioButtonGroup.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'checkBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonGroup <- bootstrap stub -> 'globals' -> 'radioButtonGroup' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'checkBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         checkBoxMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits checkBoxMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'checkBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'checkBoxMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'checkBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: private'
        
         rawColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButtonGroup' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttons <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         radioButtonGroup = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits radioButtonGroup.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'radioButtonGroup' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'radioButtonGroup' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Keep submorphs from seeing leftMouseDown events."
            evt leftMouseDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
             box.
            | 
            "Draw a box, possibly with an 'x' in it."

            box: baseBounds.
            c rectangle: box Color: color.
            isDown ifTrue: [
                c line: box    topLeft To: box bottomRight Color: color.
                c line: box bottomLeft To: box    topRight Color: color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonSetSize: n = ( |
             buttons.
             group.
            | 
            group: buttonGroup copy removeAllButtons.
            buttons: (vector copySize: n).
            buttons mapBy: [| b |
                b: resend.copy.
                b buttonGroup: group.
                group addButton: b.
                b.
            ].
            buttons).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            color: newC outlineColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: resend.copy.
            new buttonGroup: buttonGroup copy removeAllButtons.
            new buttonGroup addButton: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            buttonGroup removeButton: self.
            resend.delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isRadioButton = ( |
            | 1 < buttonGroup buttonCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            isRadioButton ifTrue: [
                "one of a group of radio buttons; press and track mouse"
                press.
                evt sourceHand subscribeUntilAllUp: self.
            ] False: [
                "singleton checkbox; toggle state"
                isDown ifTrue: [ unpress ] False: [ press ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'checkBoxMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | 
            buttonGroup pressButtonAt: evt cursorPoint.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: transitions\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         press = ( |
            | 
            isDown: true.
            buttonGroup unpressAllBut: self.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: transitions\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         press: bool = ( |
            | bool ifTrue: [press] False: [unpress]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkBoxMorph' -> () From: ( | {
         'Category: transitions\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         unpress = ( |
            | 
            isDown ifTrue: [
                isDown: false.
                changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: buttonManipulation\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addButton: b = ( |
            | 
            (buttons includes: b) ifFalse: [ buttons add: b ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: buttonManipulation\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonCount = ( |
            | buttons size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone buttons: buttons copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: buttonOperations\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         pressButtonAt: p = ( |
            | 
            buttons do: [| :b |
                (b globalBounds includes: p) &&
                [b isDown not] ifTrue: [
                    b press.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: buttonManipulation\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllButtons = ( |
            | 
            buttons removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: buttonManipulation\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         removeButton: b = ( |
            | 
            buttons remove: b IfAbsent: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            buttons size printString, ' buttons').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radioButtonGroup' -> () From: ( | {
         'Category: buttonOperations\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         unpressAllBut: b = ( |
            | 
            (buttons includes: b) ifTrue: [
                buttons do: [| :thisButton |
                    (b = thisButton) && [ thisButton isDown ] ifFalse: [
                        thisButton unpress.
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         checkCircleMorph = bootstrap define: bootstrap stub -> 'globals' -> 'checkCircleMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals checkBoxMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'checkCircleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals checkCircleMorph.

CopyDowns:
globals checkBoxMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         checkCircleMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'checkCircleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits checkCircleMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'checkCircleMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'checkCircleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         checkMarkMorph = bootstrap define: bootstrap stub -> 'globals' -> 'checkMarkMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals checkBoxMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'checkMarkMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals checkMarkMorph.

CopyDowns:
globals checkBoxMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         checkMarkMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'checkMarkMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits checkMarkMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'checkMarkMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'checkMarkMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         colorChangerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals colorChangerMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         blueSlider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         brightnessSlider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         colorPatch.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         greenSlider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         hueSlider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         colorChangerMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits colorChangerMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'colorChangerMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         redSlider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         saturationSlider.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot'
        
         enumeratedTypeLabelMorph = bootstrap define: bootstrap stub -> 'globals' -> 'enumeratedTypeLabelMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals labelMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumeratedTypeLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumeratedTypeLabelMorph.

CopyDowns:
globals labelMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         itemNames <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: InitializeToExpression: (vector copyRemoveAll)\x7fVisibility: private'
        
         itemValues <- vector copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         selectedIndex <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot'
        
         widgetMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules widgetMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot'
        
         myComment <- 'Checkboxes, radio-buttons, and simple menu widgets.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            checkBoxMorph    setWidth: 13 Height: 13.
            checkCircleMorph setWidth: 13 Height: 13.
            checkMarkMorph   setWidth: 13 Height: 13.
            enumeratedTypeLabelMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'widgetMorphs' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'tristateIndicator
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkCircleMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
             box.
             d.
             p.
            | 
            "Draw a circular checkButton, possibly filled in."

            box: baseBounds.
            p: box center - 1.      "circle center"
            d: (baseBounds width min: baseBounds height) - 2.
            c circleCenteredAt: p Diameter: d Color: color.
            isDown ifTrue: [
                11 = d ifTrue: [
                    "xxx hack: workaround for bug in X that fails to draw
                     small circles on the GX+ graphics board under Solaris 2.3:
                     draw an image instead."
                    c image: sevenPixelCircleImage At: position + 3.
                ] False: [
                    c fillCircleCenteredAt: p Diameter: ((d - 4) max: 3) Color: color.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkCircleMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkCircleMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'checkCircleMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkCircleMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'checkBoxMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkCircleMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         sevenPixelCircleImage = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '0011100' &
    '0111110' &
    '1111111' &
    '1111111' &
    '1111111' &
    '0111110' &
    '0011100' ) asVector
 Colors: (
    (paint named: 'white') &
    (paint named: 'black')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits checkCircleMorph sevenPixelCircleImage.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkMarkMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
             box.
            | 
            "Draw a line, possibly with a check mark."

            box: (baseBounds indent: 1).
            c line: box bottomLeft To: box bottomRight Color: color.
            isDown ifTrue: [| p1. p2. p3 |
                p1: box topLeft +
                    ((box width * 0.1) asInteger @ (box height * 0.6) asInteger).
                p2: box bottomLeft + ((box width * 0.4) asInteger @ 0).
                p3: box topRight.
                c line: p1 To: p2 Color: color.
                c line: p2 To: p3 Color: color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkMarkMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'checkMarkMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'checkBoxMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         blue: b = ( |
            | 
            setPatchC: paint copyRed: patchC red Green: patchC green Blue: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         brightness: b = ( |
            | 
            setPatchC: paint copyHue: patchC hue Saturation: patchC saturation Brightness: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSliderRowColor: c = ( |
             col.
             f.
             lbl.
             row.
             s.
            | 
            s: (sliderMorph copy maxValue: 0.999999) target: self.
            s beFlexibleVertically.
            s beRigidHorizontally setWidth: 10.
            s color: (paint named: 'gray') copyBrightness: 0.84.
            lbl: labelMorph copy.
            lbl fontSpec: globals fontSpec copyName: 'times' Size: 18.
            col: columnMorph copy beFlexible color: c.
            col baseMinHeight: 50.
            col borderWidth: 0.
            f: frameMorph copy color: c.
            f beFlexibleVertically beShrinkWrapHorizontally borderWidth: 2.
            f frameStyle: f insetBezelStyle.
            row: rowMorph copy beFlexible color: c.
            row borderWidth: 0.

            redSlider:   (s copy selector: 'red:').
            row addMorphLast: (col copy addAllMorphs:
                ((lbl copy label: 'R') & (f copy addMorph: redSlider)) asList).
            greenSlider: (s copy selector: 'green:').
            row addMorphLast: (col copy addAllMorphs:
                ((lbl copy label: 'G') & (f copy addMorph: greenSlider)) asList).
            blueSlider:  (s copy selector: 'blue:').
            row addMorphLast: (col copy addAllMorphs:
                ((lbl copy label: 'B') & (f copy addMorph: blueSlider)) asList).

            row addMorphLast: spacerMorph copyH: 15 Color: color.

            hueSlider:        (s copy selector: 'hue:').
            hueSlider maxValue: 360.0.      "hue is in the range 0..360"
            row addMorphLast: (col copy addAllMorphs:
                ((lbl copy label: 'H') & (f copy addMorph: hueSlider)) asList).
            saturationSlider: (s copy selector: 'saturation:').
            row addMorphLast: (col copy addAllMorphs:
                ((lbl copy label: 'S') & (f copy addMorph: saturationSlider)) asList).
            brightnessSlider: (s copy selector: 'brightness:').
            row addMorphLast: (col copy addAllMorphs:
                ((lbl copy label: 'V') & (f copy addMorph: brightnessSlider)) asList).
            row).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
             savedPatchColor.
            | 
            "See comment in traits morph for general idea.
             Here, for readability, must not change color."

            savedPatchColor: colorPatch color.
            resend.colorAll: newC.
            colorPatch color: savedPatchColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t = ( |
            | (copy target: t) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         getTargetColor = ( |
            | 
            target ifNotNil: [ setPatchC: target color ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         green: g = ( |
            | 
            setPatchC: paint copyRed: patchC red Green: g Blue: patchC blue.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         hue: h = ( |
            | 
            setPatchC: paint copyHue: h Saturation: patchC saturation Brightness: patchC brightness.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
             buttonRow.
             col.
             f.
             getButton.
             setButton.
            | 
            color: (paint named: 'gray') copyBrightness: 0.7.
            beRigid setWidth: 160 Height: 220.

            getButton: (ui2Button copy target: self) label: 'Get'.
            getButton color: color.
            getButton  scriptBlock: [target getTargetColor].

            setButton: (ui2Button copy target: self) label: 'Set'.
            setButton  scriptBlock: [target setTargetColor].
            setButton color: color.

            f: frameMorph copy color: color.
            f beShrinkWrap borderWidth: 2.
            f frameStyle: f insetBezelStyle.

            buttonRow: rowMorph copy beShrinkWrap color: color.
            buttonRow borderWidth: 0.
            buttonRow addMorphLast: getButton.
            buttonRow addMorphLast: spacerMorph copyH: 12 Color: color.
            colorPatch: morph copy setWidth: 50 Height: 30.
            buttonRow addMorphLast: (f copy addMorph: colorPatch).
            buttonRow addMorphLast: spacerMorph copyH: 12 Color: color.
            buttonRow addMorphLast: setButton.

            col: columnMorph copy beFlexible color: color.
            col borderWidth: 5.
            col addMorphLast: labelMorph copyLabel: ' Color Changer '
                FontSpec: (globals fontSpec copyName: 'helvetica' Size: 18 Style: 'bold' )
                Color:    (paint named: 'black').

            col addMorphLast: spacerMorph copyV: 10 Color: color.
            col addMorphLast: buttonRow.

            col addMorphLast: spacerMorph copyV: 10 Color: color.
            col addMorphLast: buildSliderRowColor: color.
            addMorph: col.

            getTargetColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: redSlider        IsPresentDo: [| :new | redSlider:        new ].
            dict if: greenSlider      IsPresentDo: [| :new | greenSlider:      new ].
            dict if: blueSlider       IsPresentDo: [| :new | blueSlider:       new ].
            dict if: hueSlider        IsPresentDo: [| :new | hueSlider:        new ].
            dict if: saturationSlider IsPresentDo: [| :new | saturationSlider: new ].
            dict if: brightnessSlider IsPresentDo: [| :new | brightnessSlider: new ].
            dict if: colorPatch       IsPresentDo: [| :new | colorPatch:       new ].
            dict if: target           IsPresentDo: [| :new | target:           new ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'colorChangerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         notifySliders = ( |
             c.
            | 
            c: patchC.
            redSlider        value: c        red.
            greenSlider      value: c      green.
            blueSlider       value: c       blue.
            hueSlider        value: c        hue.
            saturationSlider value: c saturation.
            brightnessSlider value: c brightness.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         patchC = ( |
            | colorPatch color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         red: r = ( |
            | 
            setPatchC: paint copyRed: r Green: patchC green Blue: patchC blue.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         saturation: s = ( |
            | 
            setPatchC: paint copyHue: patchC hue Saturation: s Brightness: patchC brightness.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         setPatchC: c = ( |
            | 
            colorPatch color: c.
            notifySliders.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'colorChangerMorph' -> () From: ( | {
         'Category: sliders\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         setTargetColor = ( |
            | 
            target ifNotNil: [
                target colorAll: patchC.
                target color:    patchC.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyItemNames: names Values: values DefaultButtonHolder: dbh = ( |
             new.
            | 
            new: copy.
            new itemNames: names asVector.
            names size > 0 ifFalse: [
                error: 'Item names list must be non-empty'.
            ].
            values size > 0 ifTrue: [
                values size = names size ifFalse: [
                    error: 'Size of values list must match size of item names list'.
                ].
                new itemValues: values asVector.
            ] False: [
                new itemValues: nil.
            ].
            new setSelectedIndex: 0.
            new defaultButtonHolder: dbh.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         getSelectedValue = ( |
            | 
            itemValues
              ifNil:    [ ^selectedIndex ]
              IfNotNil: [ ^itemValues at: selectedIndex ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            color: (paint named: 'black').
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
             m.
            | 
            m: ui2Menu copy color: (paint named: 'lightGray').
            itemNames do: [| :name. :i |
                m addButtonTarget: self
                           Script: 'target selectionFrom: button'
                       ButtonArgs: (vector copyAddLast: i)
                            Label: name.
            ].
            m defaultButtonHolder: defaultButtonHolder.
            m popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'enumeratedTypeLabelMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'ModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'labelMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         selectionFrom: button = ( |
            | 
            setSelectedIndex: button buttonArgs first.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: widgetMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setSelectedIndex: i = ( |
            | 
            selectedIndex: ((i max: 0) min: itemNames size).
            label: (itemNames at: selectedIndex).
            self).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'tristateIndicator' From: 'ui2'



 '-- Side effects'

 globals modules widgetMorphs postFileIn
