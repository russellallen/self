 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot'
        
         selfSliceGroup = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfSliceGroup.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceGroup' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: SliceOutliner & helpers\x7fModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot\x7fVisibility: public'
        
         selfSliceGroupModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalSliceGroupModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> () From: ( |
             {} = 'Comment: I represent a group of slots in a slice
that corresponds to a subset of an object.
May contain subgroups. -- dmu 5/1\x7fModuleInfo: Creator: globals selfSliceGroupModel.

CopyDowns:
globals generalSliceGroupModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceGroupModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot\x7fVisibility: private'
        
         buildContentsOutliners = ( |
            | 
            slots copyMappedBy: [|:s|
                (slotModel newOutlinerFor: s) 
                  model addInSituButtonToHeader myOutliner
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalSliceGroupModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot'
        
         slotModel = ( |
            | 
            selfSlotModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceGroupModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceGroup InitialContents: FollowSlot'
        
         titleString = ( |
            | 
            'in: ', (mirror nameSize: 40)).
        } | ) 



 '-- Side effects'

 globals modules selfSliceGroup postFileIn
