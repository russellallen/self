 '$Revision: 30.12 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSliceModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         generalSliceModel = bootstrap define: bootstrap stub -> 'globals' -> 'generalSliceModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSliceModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalSliceModel.

CopyDowns:
globals generalModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> () From: ( | {
         'Category: slice model state\x7fModuleInfo: Module: sliceModel InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         done <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalSliceModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         alignSlots = ( |
            | 
            sliceGroupOutliner alignSlotsWithin: myOutliner.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         beForOutliner: o = ( |
            | 
            resend.beForOutliner: o.
            controlPanel: newControlPanel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals generalSliceModel parent buttonDescriptions.

CopyDowns:
globals generalModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: duplicating\x7fCategory: Duplicate\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot'
        
         duplicate = ( |
            | target duplicate: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalSliceModel parent buttonDescriptions parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            resend.buttonsToPutInMenu copyAddFirst: 'duplicate').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            myOutliner expander color: paint named: 'black'.
            resend.collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         constructItems = ( |
            | 
            results do: [|:anOutliner|
              myOutliner addItem: anOutliner colorAll: myOutliner color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         controlPanel = ( |
            | 
            referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         controlPanel: cp = ( |
            | referrent: cp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: what to look for\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         desiredText: desiredText = ( |
            | 
            controlPanel desiredText: desiredText.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: power operations\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         doOperation: aUserDefinedOperation ToAllForEvent: event = ( |
            | 
            outlinersExpand: true ThenDo: [|:aSliceGroupOutliner|
              aSliceGroupOutliner doOperation: aUserDefinedOperation ToAllForEvent: event
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: enumerating\x7fComment: Do enumeration and return the outliners
to put in me.\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationOutliners = ( |
            | 
            controlPanel enumerationOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
            | 
            process this birthEvent sourceHand attach: 
              sliceModel newOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            expand: evt All: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         expand: evt All: bool = ( |
            | 
            results ifNil: [
              (message copy receiver: self 
                            Selector: 'finishExpanding:All:' 
                                With: evt
                                With: bool
              ) forkForBirthEvent: evt.
            ] IfNotNil: [finishExpanding: evt All: bool].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAll: evt = ( |
            | 
            expand: evt All: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         findImplementors = ( |
            | 
            controlPanel findImplementors.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         findMethodsContaining = ( |
            | 
            controlPanel findMethodsContaining.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         findReferences = ( |
            | 
            controlPanel findReferences.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         findSenders = ( |
            | 
            controlPanel findSenders.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         finishExpanding: evt All: expAll = ( |
            | 
            results ifNil: [
              done: false.
              myOutliner addActivity: periodicMorphStepActivity copyTarget: myOutliner Period: 250.
              results: enumerationOutliners.
            ].
            safelyDo: [resend.expand: evt].
            expAll ifTrue: [
              myOutliner items morphsDo: [|:m| m isSliceGroup ifTrue: [m expandDownToSlots: evt]]
            ].
            alignSlots.
            done: true.
            myOutliner expander colorAll: myOutliner color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: creating suboutliners\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         flatSuboutlinerForItem: s = ( |
            | 
            (sliceGroupModel newOutlinerFor: 
              sliceReferrent copyForOne: s)
            model beForFlat myOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         flushModel: evt = ( |
            | 
            resend.flushModel: evt.
            results: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            (
              ('Redo' @ 'target model redo: event')
            & ('Controls' @ 'target model toggleControls: event')
            &  dismissButtonContents
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         hideControls = ( |
            | 
            myOutliner removeAnnotationInfo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         hideControls: event = ( |
            | 
            hideControls).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: creating suboutliners\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         hierarchicalSuboutlinerForHolder: m Items: s = ( |
            | 
            sliceGroupModel newOutlinerFor:
              sliceReferrent copyForHolder: m Items: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         inAll = ( |
            | 
            controlPanel inAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         inAncestors = ( |
            | 
            controlPanel inAncestors.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         inDescendants = ( |
            | 
            controlPanel inDescendants.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         inFamily = ( |
            | 
            controlPanel inFamily.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: visibility\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         includeAnonymous = ( |
            | 
            controlPanel includeAnonymous.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: visibility\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         includeWellKnownOnly = ( |
            | 
            controlPanel includeWellKnownOnly.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isExoSlotAlignmentFocus = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isObsolete = ( |
            | 
               results isNotNil
            && [lastProgrammingTimestamp != 0 asMirror programmingTimestamp]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSliceModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newAnnotationMorph = ( |
            | 
            controlPanel colorAll: myOutliner color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newControlPanel = ( |
            | 
            sliceControlPanel 
              copySliceOutliner: myOutliner
                          Style: annotationInfoStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinersExpand: doExpand ThenDo: blk = ( |
            | 
            results do: [|:aSliceGroupOutliner|
              blk value: aSliceGroupOutliner
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredColor = ( |
            | 
            preferences outliner colorScheme generalSliceModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         redo: evt = ( |
            | 
            myOutliner flush: evt. expandAll: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         showControls: event = ( |
            | 
            collapse: event.
            myOutliner addAnnotationInfo: event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         showFlat = ( |
            | 
            controlPanel showFlat.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         showFullHierarchical = ( |
            | 
            controlPanel showFullHierarchical.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         showHierarchical = ( |
            | 
            controlPanel showHierarchical.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: what to look for\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         startingAt: mirror = ( |
            | 
            controlPanel startingAt: mirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             c1.
             c2.
            | 
            done ifTrue: [^ self].
            "show me thinking"
             c1: paint named: 'red'.
             c2: paint named: 'yellow'.
             myOutliner expander color: 
               myOutliner expander color = c1 ifTrue: [c2] False: [c1].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = 'A slice: '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            controlPanel isCounterfactual  ifTrue: [
              ^ myOutliner titleEditor contentsString
            ].
            titlePrefix, 
            (
              (isObsolete ifTrue: 'obsolete ' False: ''),
              controlPanel statePrintString
            ) capitalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleControls: event = ( |
            | 
            controlPanel owner
              ifNil:    [ showControls: event ]
              IfNotNil: [ hideControls: event ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         updateItemsDo: blk = ( |
            | 
            myOutliner items ifNotNil: [
              myOutliner items morphs do: [|:m| blk value: m].
            ].
            resend.updateItemsDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceModel' -> () From: ( | {
         'Category: slice model state\x7fModuleInfo: Module: sliceModel InitialContents: InitializeToExpression: (nil)'
        
         results.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot'
        
         sliceModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sliceModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceModel' -> () From: ( | {
         'ModuleInfo: Module: sliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'sliceControlPanel
sliceReferrent
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'sliceControlPanel' From: 'ui2/outliner'
 bootstrap read: 'sliceReferrent' From: 'ui2/outliner'



 '-- Side effects'

 globals modules sliceModel postFileIn
