 '$Revision: 30.14 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot'
        
         sliceGroupOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sliceGroupOutliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isSliceSlotAlignmentFocus = ( |
            | 
            model isSliceModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sliceGroupOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'model' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals pluggableOutliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliceGroupOutliner.

CopyDowns:
globals pluggableOutliner. copy 
SlotsToOmit: model parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () From: ( | {
         'Category: Slice group state\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         alignmentSpacer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () From: ( | {
         'Category: Slice group state\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: InitializeToExpression: (vector)'
        
         contentsOutliners <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () From: ( | {
         'Category: Slice group state\x7fComment: Self browsing slices precompute suboutliners.
Profile slices do not. -- 11/04 dmu\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isLazy <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: InitializeToExpression: (generalSliceGroupModel)\x7fVisibility: private'
        
         model <- bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliceGroupOutliner parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsToHeader = ( |
            | 
            alignmentSpacer: flexibleSpacer copy.
            header addMorphLast: alignmentSpacer.
            addContentsOutlinersToHeader.
            header addAllMorphs: buildHeaderButtons.
            updateExpander. "rm if need be"

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addContentsOutlinersToHeader = ( |
            | 
            case   if: [contentsOutliners size = 0] 
                 Then: []

                   If: [contentsOutliners size = 1]
                 Then: [header addMorphLast: contentsOutliners first]

                 Else: [|cm|
                         cm: columnMorph copy.
                         cm borderWidth: 0.
                         cm addAllMorphs: contentsOutliners.
                         header addMorphLast: cm.
                 ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addExpander = ( |
            | 
            header removeMorph: header morphs first.
            resend.addExpander).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: adding items from outside\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSuboutliner: o = ( |
            | 
            addSuboutliners: vector copyAddLast: o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: adding items from outside\x7fComment: Adds endoObjectOutliner\'s
for child objects.\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSuboutliners: os = ( |
            | 
            os do: [|:s| s colorAll: color].
            ( addItems: os) updateExpander.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         alignSlots = ( |
            | 
            slotAlignmentFocusIfPresent: [|:f| alignSlotsWithin: f]
              IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fComment: When showing an object hierarchy,
want all slots to line up.
So call me, passing in root morph containing
all endoObjectOutliners.
-- dmu 1/2000\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         alignSlotsWithin: containingMorph = ( |
             s <- 0.
             spaceBeforeSlot = 5.
            | 
            safelyDo: [
              containingMorph allMorphsDo: [|:it|
                 it isSliceGroup ifTrue: [it beFlexibleHorizontally. s: s max: it slotOffset]].
              s: s + spaceBeforeSlot.
              containingMorph allMorphsDo: [|:it|
                 it isSliceGroup ifTrue: [it slotOffset: s]].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeaderButtons = ( |
            | 
            "button must look good when slot is expanded"

            resend.buildHeaderButtons asList 
              copyMappedBy: [|:b| 
                b beFlexibleVertically centerJustifyVertically]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            resend.collapse: evt.
            expander setWidth: expander expandedSize x.
            alignSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         containsSlots = ( |
            | 
            contentsOutliners isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: power operations\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         doOperation: aUserDefinedOperation ToAllForEvent: event = ( |
            | 
            outlinersExpand: true ThenDo: [|:anOutliner|
              anOutliner model doOperation: aUserDefinedOperation ToAllForEvent: event
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            resend.expand: evt.
            alignSlots.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding\x7fComment: Expand me if I or any of my subobjects
(usually children) contain slots to show
in this slice.
Return true if I do.\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expandDownToSlots: evt = ( |
             haveSlot <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            items ifNil: [buildBody].
            items morphsDo: [|:m|
              m isSliceGroup ifTrue: [
                (m expandDownToSlots: evt)
                   ifTrue: [haveSlot: true]
              ]
            ].
            haveSlot || [containsSlots] ifTrue: [expand: evt. ^ true].
            haveSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         fillInHeader = ( |
            | 
            "topJustify header so object name
            stays at top when slot is expanded"
            resend.fillInHeader topJustify).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         hasCounterfactualItem = ( |
            | 
            outlinersExpand: false ThenDo: [|:o| o isCounterfactual ifTrue: [^ true]].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.
            beFlexibleHorizontally.
            isLazy ifFalse: [
              "Hack: I need to prebuild the morphs for
              my (expanded) body so that subobjects can be added to me"
              model expand:   process this birthEvent. 
              model collapse: process this birthEvent.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isSliceGroup = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: Update the slots of this morph to refer to the new versions of
those morphs given by the the mapping dictionary. Morphs that
keep references to other morphs must implemenent this method
for copying to work correctly.  This default implementation
does no remapping.\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            contentsOutliners: contentsOutliners copy.
            contentsOutliners do: [|:o. :i|
              dict if: o IsPresentDo: [|:n| contentsOutliners at: i Put: n].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         modelProtoForProto = ( |
            | 
            generalSliceGroupModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'sliceGroupOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         outerSliceGroupIfPresent: pb IfAbsent: ab = ( |
             r.
            | 
            r: owner.
            [r isNil] whileFalse: [ 
              r isSliceGroup ifTrue: [^ pb value: r].
              r: r owner.
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinersExpand: doExpand ThenDo: blk = ( |
            | 
            doExpand ifTrue: [
              expand: process this birthEvent. "Do we really need the event?"
            ].
            contentsOutliners do: [|:o| blk value: o].
                 suboutliners do: [|:o| blk value: o].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeExpander = ( |
            | 
            resend.removeExpander.
            header addMorphFirst: rigidSpacer copyH: expander expandedSize x Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotAlignmentFocusIfPresent: pb IfAbsent: ab = ( |
             r.
            | 
            r: owner.
            [r isNil] whileFalse: [ 
              r isSliceSlotAlignmentFocus ifTrue: [^ pb value: r].
              r: r owner.
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fComment: Along with slotOffset:, used to align slots.\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotOffset = ( |
            | 
            alignmentSpacer globalPosition x - root globalPosition x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotOffset: so = ( |
            | 
            containsSlots ifFalse: [^self].
            safelyDo: [
              alignmentSpacer 
                beRigidHorizontally
                setWidth: so - slotOffset.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fComment: Along with slotOffset:, used to align slots.\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleOffset = ( |
            | 
            titleEditor globalPosition x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleOffset: to = ( |
             ms.
             prev.
             s.
            | 
            ms: list copyRemoveAll.
            "put new morph set in header in ms"
            header morphsDo: [|:m|
              m = titleEditor ifTrue: [
                (ms isEmpty not) && [ms last morphTypeName = spacerMorph morphTypeName]
                  ifTrue: [s: ms last]
                   False: [s: spacerMorph copy. ms addLast: s].
              ].
              ms addLast: m.
            ].
            s beRigidHorizontally beFlexibleVertically.
            s color: color.
            s setWidth: to - titleOffset.
            safelyDo: [header removeAllMorphs addAllMorphs: ms].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot'
        
         updateDo: blk = ( |
            | 
            updateExpander.
            resend.updateDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot'
        
         updateExpander = ( |
            | 
            "fileIn calls initialize which calls this"
            model ifNil: [^ self].

            isLazy ifFalse: [items ifNil: [buildBody]].
            updateExpander: model isExpanderNeeded).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            sliceGroupOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceGroupOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isSliceSlotAlignmentFocus = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 



 '-- Side effects'

 globals modules sliceGroupOutliner postFileIn
