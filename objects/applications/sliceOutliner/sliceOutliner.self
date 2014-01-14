 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. 
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         endoObjectOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'endoObjectOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractObjectOutliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'endoObjectOutliner' -> () From: ( |
             {} = 'Comment: In contrast to objectOutliner, which is a whole
outliner that shows every slot in an object,
grouped by category,
I am used within a sliceOutliner, to show one or
more slots in an object.
And I can have suboutliners, which are endoObjectOutliners
for child objects.
Instead of ordinary slotOutliner\'s, I contain
exoSlotOutliners.
-- dmu 1/2000\x7fModuleInfo: Creator: globals endoObjectOutliner.

CopyDowns:
globals abstractObjectOutliner. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: Endo-object Outliner state\x7fModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         alignmentSpacer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: Endo-object Outliner state\x7fModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         contentsOutliners <- bootstrap stub -> 'globals' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: SliceOutliner & helpers\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         endoObjectOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits endoObjectOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'endoObjectOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            endoObjectOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         useSliceOutliners = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerationMorphFactory useSliceOutliners.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlot: slotNamePattern StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt  OrForPatterns: slotNamePattern
              Then: [resend.findSlot: slotNamePattern StartingFrom: mirror Event: evt]
              Else: [((sliceOutliner copy 
                         slotName: slotNamePattern)
                         startingAt: mirror)
                         inAncestors
                         showHierarchical
                         findImplementors
                         expandAll: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         ifBypassForEvent: evt OrForPatterns: pat Then: thenBlock Else: elseBlock = ( |
            | 
            evt shiftIsDown
            || [(pat includes: '*')
            || [ pat includes: '?' ]]
               ifTrue: thenBlock False: elseBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         ifBypassForEvent: evt Then: thenBlock Else: elseBlock = ( |
            | 
            evt shiftIsDown ifTrue: thenBlock False: elseBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: slotName InFamilyOf: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.implementorsOf: slotName InFamilyOf: mirror Event: evt]
              Else: [((sliceOutliner copy 
                         slotName: slotName)
                         startingAt: mirror)
                         inFamily
                         showHierarchical
                         findImplementors
                         expandAll: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: slotName StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.implementorsOf: slotName StartingFrom: mirror Event: evt]
              Else: [((sliceOutliner copy 
                         slotName: slotName)
                         startingAt: mirror)
                         findImplementors
                         expandAll: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOf: referentMirror StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.referencesOf: referentMirror StartingFrom: mirror Event: evt]
              Else: [((sliceOutliner copy 
                         slotName: '')
                         startingAt: mirror)
                         findReferences
                         expandAll: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: slotName InFamilyOf: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.sendersOf: slotName InFamilyOf: mirror Event: evt]
              Else: [((sliceOutliner copy 
                         slotName: slotName)
                         startingAt: mirror)
                         inFamily
                         showHierarchical
                         findSenders
                         expandAll: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useSliceOutliners' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: slotName StartingFrom: mirror Event: evt = ( |
            | 
            ifBypassForEvent: evt
              Then: [resend.sendersOf: slotName StartingFrom: mirror Event: evt]
              Else: [((sliceOutliner copy 
                         slotName: slotName)
                         startingAt: mirror)
                         findSenders
                         expandAll: evt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         exoSlotOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'exoSlotOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals slotOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'exoSlotOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals exoSlotOutliner.

CopyDowns:
globals slotOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: SliceOutliner & helpers\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         exoSlotOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits exoSlotOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'exoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            exoSlotOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot'
        
         sliceOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sliceOutliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/sliceOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.
            enumerationMorphFactory parent: enumerationMorphFactory useSliceOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sliceOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals nonpluggableOutliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliceOutliner.

CopyDowns:
globals nonpluggableOutliner. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( | {
         'Category: SliceOutliner state\x7fModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         controlPanel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( | {
         'Category: SliceOutliner state\x7fModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         done <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( | {
         'Category: SliceOutliner state\x7fModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (-1)\x7fVisibility: private'
        
         lastProgrammingTimestamp <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: SliceOutliner & helpers\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sliceOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sliceOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sliceOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            sliceOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( | {
         'Category: expand state\x7fModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (nil)'
        
         results.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliceOutliner' -> () From: ( | {
         'Category: SliceOutliner state\x7fModuleInfo: Module: sliceOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         titleEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsToHeader = ( |
            | 
            alignmentSpacer: flexibleSpacer copy.
            header addMorphLast: alignmentSpacer.
            addContentsOutlinersToHeader.
            header addAllMorphs: buildHeaderButtons.
            header colorAll: color.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addExpander = ( |
            | 
            header removeMorph: header morphs first.
            resend.addExpander).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: adding items from outside\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSuboutliner: o = ( |
            | 
            addSuboutliners: vector copyAddLast: o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: adding items from outside\x7fComment: Adds endoObjectOutliner\'s
for child objects.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSuboutliners: os = ( |
            | 
            addItems: os.
            updateExpander).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         alignSlots = ( |
            | 
            slotAlignmentFocusIfPresent: [|:f| alignSlotsWithin: f]
              IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fComment: When showing an object hierarchy,
want all slots to line up.
So call me, passing in root morph containing
all endoObjectOutliners.
-- dmu 1/2000\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         alignSlotsWithin: containingMorph = ( |
             s <- 0.
             spaceBeforeSlot = 5.
            | 
            containingMorph allMorphsDo: [|:it| it isEndoObjectOutliner ifTrue: [s: s max: it slotOffset]].
            s: s + spaceBeforeSlot.
            containingMorph allMorphsDo: [|:it| it isEndoObjectOutliner ifTrue: [it slotOffset: s]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fComment: When endoObjectOutliners are contained
in another outliner, want to line up titles.
This method lines up titles with my co-outliners.
-- dmu 1/2000\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         alignTitleWithSiblings = ( |
             eos.
             indentation = 12.
             off <- 0.
            | 
            true ifTrue: [^ self].
            eos: owner morphs asList copyFilteredBy: [|:m| m isEndoObjectOutliner].
            outerEndoObjectOutlinerIfPresent: [|:o|
              off: o titleOffset + indentation.
            ]
            IfAbsent: [].
            eos do: [|:m| off: off max: m titleOffset].
            eos do: [|:m| m titleOffset: off].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            "topJustify header so object name
            stays at top when slot is expanded"
            resend.buildHeader topJustify).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeaderButtons = ( |
            | 
            "button must look good when slot is expanded"

            resend.buildHeaderButtons asList 
              copyMappedBy: [|:b| 
                b beFlexibleVertically centerJustifyVertically]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            resend.collapse: evt.
            expander setWidth: expander expandedSize x.
            alignSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         containsSlots = ( |
            | 
            contentsOutliners isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot'
        
         copyMirror: mirr Containing: outliners = ( |
            | 
            ((copy mirror: mirr)
            contentsOutliners: outliners) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: copying\x7fComment: Pass in mirror in case slots is empty.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: m Slots: ss = ( |
            | 
            ss isEmpty ifTrue: [copyMirror: m]
                        False: [copySlots: ss]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlot: s = ( |
            | copySlots: vector copyAddFirst: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: copying\x7fComment: Copy me to show slots ss.
ss must be nonempty.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlots: ss = ( |
             oo.
             slotOutliners.
            | 
            slotOutliners: ss copyMappedBy: [|:s| 
              exoSlotOutliner copySlot: s
            ].
            oo: copyMirror: ss first holder
                Containing: slotOutliners.
            slotOutliners do: [|:so| so outer: oo].
            oo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            resend.expand: evt.
            alignSlots.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: expanding\x7fComment: Expand me if I or any of my subobjects
(usually children) contain slots to show
in this slice.
Return true if I do.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expandDownToSlots: evt = ( |
             haveSlot <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            items morphsDo: [|:m|
              m isEndoObjectOutliner ifTrue: [
                (m expandDownToSlots: evt)
                   ifTrue: [haveSlot: true]
              ]
            ].
            haveSlot ifTrue: [expand: evt].
            haveSlot || [containsSlots]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            vector 
              copyAddLast: '=' @ 'target sprout: event').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
             es.
            | 
            resend.initialize.
            beFlexibleHorizontally.

            "Hack: I need to prebuild the morphs for
             my (expanded) body so that subobjects can be added to me"
            expand:   process this birthEvent. 
            collapse: process this birthEvent.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isEndoObjectOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot'
        
         model = ( |
            | self "compat hack").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'endoObjectOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         outerEndoObjectOutlinerIfPresent: pb IfAbsent: ab = ( |
             r.
            | 
            r: owner.
            [nil = r] whileFalse: [ 
              r isEndoObjectOutliner ifTrue: [^ pb value: r].
              r: r owner.
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeExpander = ( |
            | 
            resend.removeExpander.
            header addMorphFirst: rigidSpacer copyH: expander expandedSize x Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: unfold (compatability)\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showSlot: slot Event: evt IfFail: failBlock = ( |
            | 
            updateSlotsDo: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotAlignmentFocusIfPresent: pb IfAbsent: ab = ( |
             r.
            | 
            r: owner.
            [nil = r] whileFalse: [ 
              r isExoSlotAlignmentFocus ifTrue: [^ pb value: r].
              r: r owner.
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fComment: Along with slotOffset:, used to align slots.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotOffset = ( |
            | 
            alignmentSpacer globalPosition x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: evt = ( |
            | 
            summonMyObjectOutliner: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         summonMyObjectOutliner: evt = ( |
             o.
             pos.
            | 
            o: world outlinerForMirror: mirror.
            pos: globalPosition + ((baseBounds size x + 7) @ 0).
            o isInWorld ifFalse: [
              world addMorph: o
            ].
            world moveToFront: o.
            o moveToPosition: pos.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: accessing\x7fComment: Placeholder for compatability with
structureEditing code.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         theSheet = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fComment: Along with slotOffset:, used to align slots.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleOffset = ( |
            | titleEditor globalPosition x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: aligning\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateCategoriesDo: blk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateNoMatterWhatDo: blk = ( |
            | 
            resend.updateNoMatterWhatDo: blk.
            updateExpander).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updatePseudoCategoriesDo: blk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'endoObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSlotsDo: blk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCommentButton = ( |
             cb.
             isO.
            | 

            cb: resend.buildCommentButton.
            isO: cb isOpen.
            cb open layoutInPlace beRigidHorizontally.
            isO ifFalse: [ cb close ].
            cb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            resend.buildHeader.
            header addMorphLast: buildSproutInSituButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSproutInSituButton = ( |
             b.
            | 
            buildButtonLabeled: 'IN SITU' Script: 'target sproutInSitu: event' IsAsync: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlot: s = ( |
            | 
            "must set outer later"
            (copy slot: s) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: counterfactualism\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
            self "cannot embed an exo outliner to add the slot").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'exoSlotOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         myObjectOutliner = ( |
            | 
            outer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         pseudoSlotOutliner = ( |
            | exoSlotOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | slot holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'exoSlotOutliner' -> () From: ( | {
         'Category: finding the slot in situ\x7fComment: I am in a slice outliner; retrieve the
slot\'s holder and unfold to the slot.
I am sent from a button built by buildSproutInSituButton.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutInSitu: evt = ( |
             inner.
             innerOffset.
             o.
             pos.
            | 
            " I would like to precalculate the innerOffset,
              but I cannot get it to work before the object is in the world
              -- dmu
            "
            o: world outlinerForMirror: slot holder.
            inner: [|:exitWith|
              o unfold: (slot holder at: slot name IfAbsent: [exitWith value: o])
                 Event: evt
                IfFail: [o].
            ] exitValue.

            pos: globalPosition + ((baseBounds size x + 7) @ 0).

            o isInWorld ifFalse: [
              world addMorph: o.
            ].
            innerOffset: inner globalPosition - o globalPosition.
            pos: pos - ( 0 @  innerOffset y). "line up inner"
            world moveToFront: o.
            o moveToPosition: pos.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isExoSlotAlignmentFocus = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         alignSlots = ( |
            | 
            endoObjectOutliner alignSlotsWithin: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: building\x7fComment: use an editor so we can
update the object\'s title\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            titleEditor: smallEditorMorph copyString: titleString
                                               Style: preferences.
            titleEditor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            expander color: paint named: 'black'.
            resend.collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         constructBoxedItems = ( |
            | 
            results do: [|:anOutliner|
              addBoxedItem: anOutliner colorAll: color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            resend.copy initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: enumerating\x7fComment: Do enumeration and return the outliners
to put in me.\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationOutliners = ( |
            | 
            lastProgrammingTimestamp: 0 asMirror programmingTimestamp.
            controlPanel enumerationOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: examples\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
            | 
            process this birthEvent sourceHand attach: 
              sliceOutliner copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            expand: evt All: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         expand: evt All: bool = ( |
            | 
            nil = results ifTrue: [
              (message copy receiver: self 
                            Selector: 'finishExpanding:All:' 
                                With: evt
                                With: bool
              ) forkForBirthEvent: evt.
            ] False: [finishExpanding: evt All: bool].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAll: evt = ( |
            | 
            expand: evt All: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         findImplementors = ( |
            | 
            controlPanel findImplementors.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         findReferences = ( |
            | 
            controlPanel findReferences.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         findSenders = ( |
            | 
            controlPanel findSenders.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         finishExpanding: evt All: expAll = ( |
            | 
            nil = results ifTrue: [
              done: false.
              addActivity: periodicMorphStepActivity copyTarget: self Period: 250.
              results: enumerationOutliners.
            ].
            safelyDo: [resend.expand: evt].
            expAll ifTrue: [
              boxedItems morphsDo: [|:m| m isEndoObjectOutliner ifTrue: [m expandDownToSlots: evt]]
            ].
            alignSlots.
            done: true.
            expander colorAll: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: creating suboutliners\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         flatSuboutlinerForSlot: s = ( |
            | 
            endoObjectOutliner copySlot: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         flush: evt = ( |
            | 
            resend.flush: evt.
            results: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            (
              ('Redo' @ 'target redo: event')
            & ('Controls' @ 'target toggleControls: event')
            &  dismissButtonContents
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         hideControls = ( |
            | 
            nil =  controlPanel owner ifTrue: [^self].
            controlPanel delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         hideControls: event = ( |
            | 
            hideControls).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: creating suboutliners\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         hierarchicalSuboutlinerForMirror: m Slots: s = ( |
            | 
            endoObjectOutliner copyMirror: m Slots: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         inAll = ( |
            | 
            controlPanel inAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         inAncestors = ( |
            | 
            controlPanel inAncestors.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         inDescendants = ( |
            | 
            controlPanel inDescendants.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         inFamily = ( |
            | 
            controlPanel inFamily.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: visibility\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         includeAnonymous = ( |
            | 
            controlPanel includeAnonymous.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: visibility\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         includeWellKnownOnly = ( |
            | 
            controlPanel includeWellKnownOnly.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: initailizing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            controlPanel: newControlPanel.
            resend.initialize.
            itemsCached: false.
            borderWidth: 3.
            beShrinkWrap.
            colorAll: preferredColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isExoSlotAlignmentFocus = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isObsolete = ( |
            | 
               (nil != results)
            && [lastProgrammingTimestamp != 0 asMirror programmingTimestamp]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: controlPanel IsPresentDo: [|:n| controlPanel:  n].
            dict if: titleEditor  IsPresentDo: [|:n| titleEditor:   n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Comment: hack for compatibility\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot'
        
         model = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'sliceOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newControlPanel = ( |
            | 
            selfSliceControlPanel 
              copySliceOutliner: self
                          Style: annotationInfoStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: preferences\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         preferences = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sliceOutliner' -> 'preferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sliceOutliner preferences.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         color = paint copyRed: 0.806452 Green: 0.839687  Blue: 0.863148.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> 'preferences' -> () From: ( | {
         'ModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         redo: evt = ( |
            | 
            flush: evt. expandAll: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAnnotationInfoEvenIfCounterfactual = ( |
            | 
            controlPanel delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showControls = ( |
            | 
            nil = controlPanel owner ifFalse: [^ self].
            safelyDo: [columnUnderHeader addMorphLast: controlPanel colorAll: color].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showControls: event = ( |
            | 
            collapse: event.
            showControls).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showFlat = ( |
            | 
            controlPanel showFlat.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showFullHierarchical = ( |
            | 
            controlPanel showFullHierarchical.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showHierarchical = ( |
            | 
            controlPanel showHierarchical.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: what to look for\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slotName: slotName = ( |
            | 
            controlPanel slotName: slotName.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: controlling me\x7fCategory: what to look for\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         startingAt: mirror = ( |
            | 
            controlPanel startingAt: mirror.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: expanding\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             c1.
             c2.
            | 
            done ifTrue: [^ self].
            "show me thinking"
             c1: paint named: 'red'.
             c2: paint named: 'yellow'.
             expander color: 
               expander color = c1 ifTrue: [c2] False: [c1].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            'A slice: ', 
            (
              (isObsolete ifTrue: 'obsolete ' False: ''),
              controlPanel statePrintString
            ) capitalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleControls: event = ( |
            | 
            nil = controlPanel owner
              ifTrue: [ showControls: event ]
               False: [ hideControls: event ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            isInWorld && [ isExpanded] ifTrue: [
              updateNoMatterWhatDo: blk.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateNoMatterWhatDo: blk = ( |
            | 
            safelyDo: [updateTitle].
            resend.updateDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliceOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateTitle = ( |
             str <- ''.
            | 
            controlPanel isCounterfactual ifTrue: [^ self].
            str: titleString.
            titleEditor contentsString = str ifFalse: [
              titleEditor string: str.
              titleEditor addLabels.
              titleEditor colorAll: color. "to get text right"
            ].
            self).
        } | ) 



 '-- Side effects'

 globals modules sliceOutliner postFileIn
