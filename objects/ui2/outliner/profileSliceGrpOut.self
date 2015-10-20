 '$Revision: 30.5 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot'
        
         profileSliceGrpOut = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profileSliceGrpOut.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.5 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceGrpOut' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: Profile Slice Outliner & helpers\x7fModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSliceGroupOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals sliceGroupOutliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceGroupOutliner.

CopyDowns:
globals sliceGroupOutliner. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceGroupOutliner parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: filtering\x7fModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: public'
        
         filterOutThisModule: event = ( |
            | 
            model controlPanel filterOutModuleNamed: model referrent node moduleIfNone: [|m|
              m:  syntaxErrorMorph copyTitle: 'Module filtering'
                                     Message: 'This node has no module'.
              event sourceHand attach: m.
              ^ self
            ].
            model controlPanel mySliceOutliner model redo: event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'profileSliceGroupOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: filtering\x7fModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot'
        
         outermostEnclosingOutliner = ( |
            | 
            enclosingOutlinerIfPresent: [|:o| o outermostEnclosingOutliner] IfAbsent: [halt]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceGroupOutliner' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> 'parent' -> () From: ( | {
         'Category: filtering\x7fModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: public'
        
         redo: event = ( |
            | 
            enclosingOutlinerIfPresent: [|:o| o redo: event]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot'
        
         xxxxxx = ( |
            | xxxxx is this object needed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceGroupOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: profileSliceGrpOut InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            profileSliceGroupOutliner).
        } | ) 



 '-- Side effects'

 globals modules profileSliceGrpOut postFileIn
