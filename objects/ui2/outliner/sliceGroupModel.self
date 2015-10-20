 '$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: Slice Outliner & helpers\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         generalSliceGroupModel = bootstrap define: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> () From: ( |
             {} = 'Comment: I represent a group of slots in a slice.
May contain subgroups. -- dmu 5/1\x7fModuleInfo: Creator: globals generalSliceGroupModel.

CopyDowns:
globals generalModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> () From: ( | {
         'Category: slice group model state\x7fModuleInfo: Module: sliceGroupModel InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isForFlat <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalSliceGroupModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: flat or hierarchical\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         beForFlat = ( |
            | isForFlat: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         beForOutliner: o = ( |
            | 
            resend.beForOutliner: o contentsOutliners: buildContentsOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildContentsOutliners = ( |
            | 
            [childShouldImplement].
            vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         comment = ( |
            | 
            referrent ifNil: '' IfNotNil: [mirror comment]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         comment: c = ( |
            | mirror comment: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         constructItems = ( |
             co.
            | 
            co: myOutliner contentsOutliners.
            co size > 1 ifTrue: [ myOutliner addItems: co ].
            myOutliner updateExpander.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: power operations\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         doOperation: aUserDefinedOperation ToAllForEvent: event = ( |
            | 
            myOutliner doOperation: aUserDefinedOperation ToAllForEvent: event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            vector 
              copyAddLast: '=' @ 'target model sprout: event').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         isExpanderNeeded = ( |
            | 
            myOutliner isLazy 
             ifTrue: [isForFlat not]
              False: [myOutliner items morphs size > 0]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         mirror = ( |
            | referrent mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerPrototype = ( |
            | 
            sliceGroupOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinersExpand: doExpand ThenDo: blk = ( |
            | 
            blk value: myOutliner.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         receiver = ( |
            | mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         slots = ( |
            | referrent slots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: evt = ( |
            | 
            summonMyObjectOutliner: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         summonMyObjectOutliner: evt = ( |
             o.
             pos.
            | 
            o: myOutliner world outlinerForMirror: mirror.
            pos: myOutliner globalPosition + ((myOutliner baseBounds size x + 7) @ 0).
            o isInWorld ifFalse: [
              world addMorph: o
            ].
            world moveToFront: o.
            o moveToPosition: pos.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceGroupModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sliceGroupModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sliceGroupModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSliceGroup = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 



 '-- Side effects'

 globals modules sliceGroupModel postFileIn
