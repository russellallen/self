 '$Revision: 30.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot'
        
         profileSelfSlotMdl = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profileSelfSlotMdl.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSelfSlotMdl' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: Profile Slice Outliner & helpers\x7fModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSelfSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfSlotModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSelfSlotModel.

CopyDowns:
globals selfSlotModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> () From: ( | {
         'Category: profile slot model state\x7fComment: BCI of call in profiled method.
This is highlighted for a non-flat profile. -- dmu 11/04\x7fModuleInfo: Module: profileSelfSlotMdl InitialContents: InitializeToExpression: (-1)\x7fVisibility: public'
        
         bciToSelect <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> () From: ( | {
         'Category: profile slot model state\x7fModuleInfo: Module: profileSelfSlotMdl InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         innerMethod.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSelfSlotModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot'
        
         expand: evt = ( |
            | resend.expand: evt.
            setMethodSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot'
        
         expandAll: evt = ( |
            | 
            resend.expandAll: evt.
            setMethodSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> 'parent' -> () From: ( | {
         'Comment: override for positionInMethodEditor\x7fModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot\x7fVisibility: private'
        
         methodText = ( |
            | 
            selfMethodTextWithPositionConversion).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfSlotModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSelfSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSelfSlotMdl InitialContents: FollowSlot'
        
         setMethodSelection = ( |
            | 
            setSelectionInnerMethod: innerMethod BCI: bciToSelect).
        } | ) 



 '-- Side effects'

 globals modules profileSelfSlotMdl postFileIn
