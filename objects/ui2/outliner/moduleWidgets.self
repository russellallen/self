 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractAnnotationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractAnnotationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractAnnotationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractAnnotationMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractAnnotationMorph' -> () From: ( | {
         'Category: Abstract Annotation Morph state\x7fCategory: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         contentsColumn.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractAnnotationMorph' -> () From: ( | {
         'Category: Abstract Annotation Morph state\x7fCategory: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         panel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractAnnotationMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractAnnotationMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractAnnotationMorph' -> () From: ( | {
         'Category: Abstract Annotation Morph state\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         style.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleField = bootstrap define: bootstrap stub -> 'globals' -> 'moduleField' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleField' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleField.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         originalContents.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleField = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits moduleField.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'moduleField' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         moduleWidgets = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules moduleWidgets.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         myComment <- 'widget morphs used by the outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleWidgets' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptModuleInfo = ( |
            | 
            "forked from traits abstractAnnotationMorph panelAccept"

            protect: [
              acceptModuleInfoIfFail: [
                | :errMorph | 
                safelyDo: [ process this birthEvent sourceHand attach:  errMorph ].
              ^ false.
              ].
            ].
            panel safelyDo: [ panel isActive: false ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         addContentsColumn = ( |
            | 
            addMorphLast: contentsColumn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildButtonRow: stuff = ( |
             lst.
             r.
            | 
            "arg contains row label, 
              button1 label, button1 action, button1 slotname,
              button2 lbl, button2 action, button2 slotname..."
            lst: stuff copy asList.
            r: rowMorph copy.
            r beShrinkWrap.
            r borderWidth: 0.

            r addMorphLast: buildLabel: lst removeFirst Style: style.
            r addMorphLast: spacerMorph copyH: 13 Color: color.

            [lst isEmpty] whileFalse: [|b|
              lst first isEmpty ifTrue: [ lst removeFirst ]
              False: [
                r addMorphLast: buildLabel: lst removeFirst Style: style.
                r addMorphLast: spacerMorph copyH: 2 Color: color.
              ].
              b: radioButton copyTarget: self Action: lst removeFirst Style: style.
              r addMorphLast: b.
              lst removeFirst, ':' sendTo: self With: b.
              lst isEmpty ifFalse: [
                r addMorphLast: spacerMorph copyH: 10 Color: color.
              ].
            ].

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLabel: str Style: style = ( |
            | 
            (labelMorph copyLabel: str)
                         fontSpec: style fontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            color: style color.
            beShrinkWrap.
            borderWidth: 0.

            panel: acceptCancelPanel copyTarget: self
                                         Source: self
                                         Accept: panelAccept
                                         Cancel: panelCancel
                                         Active: false
                                          Style: style.
            panel acceptButton isAsynchronous: true.
            addMorphLast: panel.

            contentsColumn: columnMorph copy beShrinkWrap color: color.
            contentsColumn borderWidth: 1.
            contentsColumn leftJustify.
            addContentsColumn.
            colorAll: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
            panel isNotNil && [panel isActive]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'abstractAnnotationMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         panelAccept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> 'panelAccept' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractAnnotationMorph panelAccept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> 'panelAccept' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target acceptModuleInfo ifTrue: [
              target safelyDo: [target removeAnnotationInfo: evt].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         panelCancel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> 'panelCancel' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractAnnotationMorph panelCancel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> 'panelCancel' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target removeAnnotationInfo: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         removeAnnotationInfo: evt = ( |
            | 
            myOutliner removeAnnotationInfoEvenIfCounterfactual.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         synchronization* = bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         update = ( |
            | 
            isCounterfactual ifTrue: [^ self].
            updateNoKidding).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         userEditedMe = ( |
            | 
            panel isActive: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         objectAnnotationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractAnnotationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objectAnnotationMorph.

CopyDowns:
globals abstractAnnotationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         creatorField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         isCompleteNoButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         isCompleteYesButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: InitializeToExpression: (mirrors mirror)\x7fVisibility: private'
        
         myObjectOutliner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         objectAnnotationMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectAnnotationMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parentField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsToOmitField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         slotModuleMorph = bootstrap define: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractAnnotationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotModuleMorph.

CopyDowns:
globals abstractAnnotationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         followField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initialContentsSelection.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( | {
         'Category: subparts\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         modField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         mySlotOutliner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         slotModuleMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotModuleMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotModuleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         action = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'moduleField' -> 'action' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits moduleField action.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> 'action' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         clearChanges = ( |
            | originalContents: contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contents = ( |
            | editor contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString: s = ( |
            | editor contentsString: s. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyLabel: lab String: str Style: style Target: tgt = ( |
            | 
            ((copy originalContents: str) target: tgt)
              initializeLabel: lab Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         hasChanged = ( |
            | contents != originalContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeLabel: lab Style: style = ( |
             f.
            | 
            beShrinkWrap color: style color.
            borderWidth: 1.
            addMorphLast: 
              (labelMorph copyLabel: lab)
                           fontSpec: style fontSpec.
            addMorphLast: spacerMorph copyH: 5 Color: style color.
            f: frameMorph copy beShrinkWrap color: style color.
            f borderWidth: 2.
            f frameStyle: f insetBezelStyle.
            editor: notifyingCommentMorph 
                     copyString: originalContents
                         Target: self
                         Accept: action
                         Style: style.
            f addMorphLast: editor.
            addMorphLast: f.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'moduleField'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         receiver = ( |
            | 
            target receiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         updateTo: newOriginalContents = ( |
            | 
            originalContents = newOriginalContents
             ifTrue: [^ false].
            editor contentsString: newOriginalContents.
            clearChanges.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'moduleField' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         userEditedMe = ( |
            | 
            target userEditedMe.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptCopyDownInfoIfFail: fb = ( |
            | 
                    selectorField hasChanged 
            || [      parentField hasChanged  
            || [ slotsToOmitField hasChanged ]] 
              ifFalse: [^ self].

            parentField contents isEmpty ifTrue: [
              clearCopyDownInfo.
            ] False: [
              setCopyDownInfoIfFail: fb.
            ].
            selectorField    clearChanges.
            parentField      clearChanges.
            slotsToOmitField clearChanges.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptCreatorSlotIfFail: fb = ( |
            | 
            creatorField hasChanged ifTrue: [| creator |
              creator: path parseFromShortName: creatorField contents IfFail: [|:err|
                ^ fb value: syntaxErrorMorph copyTitle: 'Creator Path Error:' Message: err.
              ].
              creatorField clearChanges. 
              mirror creatorPath: creator.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptIsCompleteIfFail: fb = ( |
             b.
             d.
            | 
            mirror isComplete  =  isCompleteYesButton isDown  ifTrue: [^ self].
            b: isCompleteYesButton isDown.
            b  ifFalse: [ mirror isComplete: false.  ^ self].

            d: mirror completeObjectSelectors do: [|:sel| 
                mirror
                 pathToKey: sel
                 MultipleSlots: [|:paths. |
                       ^ fb value: syntaxErrorMorph 
                         copyTitle: 'Cannot make object complete;\n"', sel, '" is ambiguous:\n'
                           Message:  paths reduceWith: [|:p1. :p2| p1 fullName, '\n', p2 fullName].
                ] None: [ 
                       ^ fb value: syntaxErrorMorph 
                         copyTitle: 'Cannot make object complete;'
                           Message: '"', sel, '" is not understood.'.
                ].
            ].
            mirror isComplete: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptModuleInfoIfFail: failBlock = ( |
            | 
            acceptCreatorSlotIfFail: failBlock.
            acceptIsCompleteIfFail: failBlock.
            acceptCopyDownInfoIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCompleteButtons = ( |
             r.
            | 
            r: buildButtonRow: (
                'Complete?'
              & 'Yes' & isCompleteYesAction & 'isCompleteYesButton'
              & 'No'  & isCompleteNoAction  & 'isCompleteNoButton'
              ) asVector.

            selectIsComplete: mirror isComplete.
            contentsColumn addMorphLast: r.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCopyDownInfo = ( |
            | 
            copyDownStringsDo: [|:parentPath. :selector. :slotsToOmit|
              parentField:
                moduleField copyLabel: 'Copydown parent'
                               String: parentPath
                                Style: style
                               Target: self.
              contentsColumn addMorphLast: parentField.

              selectorField:
                 moduleField copyLabel: 'Copydown selector'
                                String: selector
                                 Style: style
                                Target: self.
              contentsColumn addMorphLast: selectorField.

              slotsToOmitField:
                 moduleField copyLabel: 'Slots to omit'
                                String: slotsToOmit
                                 Style: style
                                Target: self.
              contentsColumn addMorphLast: slotsToOmitField.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         clearCopyDownInfo = ( |
             cd.
            | 
            cd: mirror copyDowns at: 0 IfAbsent: [^ self].

            mirror removeCopiedDownSlotsFromMeAndDescendants: cd copiedParentMirror
                                                        From: cd parentMirror.
            mirror copyDowns: vector copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownStringsDo: blk = ( |
             p.
            | 

            p: mirror copyDowns.

            case
             if: [p size > 1] Then: [
              error: 'More than one copy down parent in object'
            ] If: [p size = 1] Then: [| cd |
              cd: p first.
              blk value: cd parentMirror creatorPath shortName
                   With: cd selector
                   With: listAsString: cd slotsToOmit
            ] Else: [blk value: '' With: '' With: '']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyObjectOutliner: oo Style: sty = ( |
            | 
            ((copy myObjectOutliner: oo) style: sty) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         getCopyDownInfoIfFail: fb = ( |
             cd.
             parentMirror.
             slotsToOmit.
            | 

            cd: transporter moduleInfo copyDown.

            cd: cd copyForParentMirror: 
              (
                path parseFromShortName: parentField contents
                                 IfFail: [|:err| ^ fb value: syntaxErrorMorph copyTitle: 'Parent Path Error' Message: err]
              ) targetMirror.

            cd: cd copyForSelector: [|:s|
              s isEmpty ifTrue: 'copy' False: s
            ] value: selectorField contents shrinkwrapped.

            parentMirror: cd copiedParentMirrorIfFail: [|:err| 
              ^ fb value: syntaxErrorMorph copyTitle: 'Copying Copy Down Parent Failed' Message: err].

            "Compute slots to omit"

            slotsToOmit: stringAsList: slotsToOmitField contents.
            slotsToOmit do: [|:n|
              (parentMirror includesName: n) ifFalse: [
                ^ fb value: syntaxErrorMorph copyTitle: 'Cannot omit non-existent slot' Message: n.
              ].
            ].
            cd copyForSlotsToOmit: slotsToOmit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.

            creatorField:            
              moduleField copyLabel: 'Creator slot'
                             String: mirror creatorPath shortName
                              Style: style
                              Target: self.

            contentsColumn addMorphLast: creatorField.

            buildCompleteButtons.

            contentsColumn addMorphLast: spacerMorph copyV: 5 Color: color.
            buildCopyDownInfo.
            colorAll: myObjectOutliner color.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: isComplete\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         isComplete = ( |
            | isCompleteYesButton isDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: isComplete\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         isCompleteNoAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> 'isCompleteNoAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectAnnotationMorph isCompleteNoAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> 'isCompleteNoAction' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target userEditedMe.
            target selectIsComplete: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> 'isCompleteNoAction' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: isComplete\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         isCompleteYesAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> 'isCompleteYesAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectAnnotationMorph isCompleteYesAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> 'isCompleteYesAction' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target userEditedMe.
            target selectIsComplete: 0 true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> 'isCompleteYesAction' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         listAsString: l = ( |
             c <- ''.
            | 
            l isEmpty ifTrue: [^ ''].
            l do: [|:s| c: c & s & ' '].
            c flatString copyWithoutLast).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror = ( |
            | 
            myObjectOutliner mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'objectAnnotationMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         myOutliner = ( |
            | myObjectOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | myObjectOutliner receiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: isComplete\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         selectIsComplete: aBool = ( |
            | 
            isCompleteYesButton isDown: aBool.
            isCompleteNoButton  isDown: aBool not.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         setCopyDownInfoIfFail: fb = ( |
             cd.
            | 
            clearCopyDownInfo.
            cd: getCopyDownInfoIfFail: fb.
            mirror copyDowns: vector copyAddFirst: cd.
            mirror 
              addCopiedDownSlotsToMeAndDescendants:  (
                cd copiedParentMirrorIfFail:  [|:err| ^ fb value: 
                  syntaxErrorMorph copyTitle: 'Copying Copy Down Parent Failed:' Message: err]
            ) From: cd parentMirror.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         stringAsList: s = ( |
             end.
             r.
             start.
            | 
            r: list copyRemoveAll.
            start: 0.
            [
              [
                start >= s size ifTrue: [^ r].
                (s at: start) = ' ' 
              ]  whileTrue: [start: start succ].
              end: start succ.
              [  (end >= s size)  ||  [(s at: end) = ' '] ]
                whileFalse: [end: end succ].
              r addLast: s copyFrom: start UpTo: end.
              start: end succ.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: suggestions\x7fComment: Type in path as if user typed it.
-- Ungar, 2/8/95\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         suggestCreator: aPath = ( |
            | 
            safelyDo: [
              creatorField contentsString: aPath shortName.
              userEditedMe
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         updateCopyDownInfo = ( |
            | 
            copyDownStringsDo: [|:p. :s. :sto|
              parentField       updateTo: p.
              selectorField     updateTo: s.
              slotsToOmitField  updateTo: sto.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         updateCreator = ( |
            | 
            creatorField updateTo: mirror creatorPath shortName.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         updateIsComplete = ( |
            | 
            isComplete = mirror isComplete
             ifFalse: [selectIsComplete: mirror isComplete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectAnnotationMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         updateNoKidding = ( |
            | 
            updateCreator.
            updateCopyDownInfo.
            updateIsComplete.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptInitialContentsIfFail: failBlock = ( |
             mi.
            | 
            mi: slot moduleInfo.
            mi: mi copyForInitialContents:
             case if:   [ initialContentsSelection = followField    ] 
                  Then: [ transporter moduleInfo followSlot  ]
                  If:   [ initialContentsSelection = initializeField   ] 
                  Then: [ transporter moduleInfo initializeToExpression 
                            copyForExpression: initializeEditor contents]
                  Else: [ 
                          warning: 'one radio button should be selected'.  
                          slot initialContents ].
            slot moduleInfo: mi.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptModuleInfoIfFail: failBlock = ( |
            | 
            acceptModuleNameIfFail: failBlock.
            acceptInitialContentsIfFail: failBlock.
            propagateToCopies).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptModuleNameIfFail: failBlock = ( |
             moduleName.
            | 

            moduleName: modField contents.
            "empty means no module"
            moduleName isEmpty  ||  [ 
            ( transporter moduleDictionary isModuleNameUntransportable: moduleName )  ||  [
            transporter moduleDictionary includesKey: moduleName ] ]
             ifFalse: [
               moduleName: transporter moduleDictionary
                getAModuleNameQuestion: 'Please enter the module for this slot'
                               Default: moduleName
                              IfCancel: [ ^ failBlock value: 
                                           syntaxErrorMorph copyTitle: 'Accept cancelled' 
                                                              Message: 'at your request.' ].
            ].
            slot module: moduleName.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildInitializeRow = ( |
             array.
             r.
             str.
            | 

            array: (rowMorph copy color: color) borderWidth: 0.

            "followSlot"
            r: (rowMorph copy beShrinkWrap color: color) borderWidth: 0.
            followField: radioButton copyTarget: self Action: followSlotAction Style: style.
            slot initialContents prefix = 'FollowSlot' ifTrue: [
              initialContentsSelection: followField.
              followField isDown: true.
            ].
            r addMorphLast: followField.

            r addMorphLast: spacerMorph copyH: 5 Color: color.
            r addMorphLast: buildLabel: 'Follow' Style: style.
            array addMorphLast: r.

            array addMorphLast: spacerMorph copyH: 5 Color: color.

            "InitializeToExpression"
            r: (rowMorph copy beShrinkWrap color: color) borderWidth: 0.
            initializeField: radioButton copyTarget: self
                                             Action: initializeToExpressionAction
                                              Style: style.
            slot initialContents prefix = 
              transporter moduleInfo initializeToExpression prefix ifTrue: [
              initialContentsSelection: initializeField.
              initializeField isDown: true.
              str: slot initialContents expressionSource.
            ] False: [ str: '' ].
            r addMorphLast: initializeField.

            r addMorphLast: spacerMorph copyH: 5 Color: color.
            initializeEditor: moduleField copyLabel: 'Initialize to'
                                             String: str
                                              Style: style
                                             Target: self.
            r addMorphLast: initializeEditor.
            array addMorphLast: r.

            contentsColumn addMorphLast: array.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlotOutliner: s Style: sty = ( |
            | 
            ((copy mySlotOutliner: s) style: sty) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: intialContents\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         followSlotAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> 'followSlotAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotModuleMorph followSlotAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> 'followSlotAction' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target initializeEditor editor clear.
            target userEditedMe).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.

            "Module"
            modField: moduleField copyLabel: 'Module'
                                     String: slot module
                                      Style: style
                                     Target: self.
            contentsColumn addMorphLast: modField.

            buildInitializeRow.
            colorAll: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: intialContents\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeToExpressionAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> 'initializeToExpressionAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotModuleMorph initializeToExpressionAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> 'initializeToExpressionAction' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            " target initializeEditor contentsString: 'Type initialization expression here'. "
            target selectOption: target initializeField.
            target initializeEditor editor selectAll beTypingFocusFor: evt sourceHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: moduleWidgets InitialContents: InitializeToExpression: (\'slotModuleMorph\')\x7fVisibility: public'
        
         morphTypeName = 'slotModuleMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         myOutliner = ( |
            | mySlotOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractAnnotationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: accepting module info\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         propagateToCopies = ( |
             mi.
            | 
            mi: slot moduleInfo.

            (transporter moduleDictionary copiesOfSlot: slot)
             do: [|:s| s moduleInfo: mi].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | 
            mySlotOutliner receiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: intialContents\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         selectOption: field = ( |
            | 
            initialContentsSelection isDown: false.
            field isDown: true.
            initialContentsSelection: field).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         slot = ( |
            | 
            mySlotOutliner slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: suggestions\x7fComment: Allow system to suggest initial contents.
-- Ungar, 2/8/95\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         suggestInitialContents: str = ( |
             w.
            | 
            safelyDo: [
              w: world.
              initializeEditor contentsString: str.
              userEditedMe.
              acceptModuleInfo.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         updateInitialContents = ( |
            | 
            (initialContentsSelection = followField) = slot initialContents isOKToFollow
             ifFalse: [
              selectOption: slot initialContents isOKToFollow ifTrue: [followField] False: [initializeField].
            ].

            slot initialContents isOKToFollow  ifFalse: [
              initializeEditor updateTo: slot initialContents expressionSource.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         updateModuleName = ( |
            | modField updateTo: slot module. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         updateNoKidding = ( |
            | 
            slot exists && [slot isCopiedDown] ifTrue: [
              ^ delete.
            ].
            updateModuleName.
            updateInitialContents.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: moduleWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         userEditedMe = ( |
            | 
            selectOption:
              initializeEditor contents isEmpty 
                ifTrue: [followField] 
                 False: [initializeField].
            resend.userEditedMe).
        } | ) 



 '-- Side effects'

 globals modules moduleWidgets postFileIn
