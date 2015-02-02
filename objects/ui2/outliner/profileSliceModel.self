 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot'
        
         profileSliceModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profileSliceModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'profileSliceRef
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: Profile Slice Outliner & helpers\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSliceModel = bootstrap define: bootstrap stub -> 'globals' -> 'profileSliceModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalSliceModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceModel.

CopyDowns:
globals generalSliceModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> () From: ( | {
         'Category: profile slice model state\x7fModuleInfo: Module: profileSliceModel InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         blockMethodSource <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> () From: ( | {
         'Category: profile slice model state\x7fModuleInfo: Module: profileSliceModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         node.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'Category: creating suboutliners\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         hierarchicalSuboutlinerForHolder: m Items: s ControlPanel: controlPanel = ( |
            | 
            sliceGroupModel newOutlinerFor: (sliceReferrent copyForHolder: m Items: s)
                              ControlPanel: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isObsolete = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinerForProfiler: p = ( |
            | 
            (newOutliner model profiler: p) myOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalSliceModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         profiler: p = ( |
            | 
            node: p callGraph skipTop.
            times: p times.
            ticks: p ticks.
            blockMethodSource: p blockMethodSource).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'Category: showing/hiding controls\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceControlPanel = ( |
            | 
            profileSliceControlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceGroupModel = ( |
            | 
            profileSliceGroupModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceReferrent = ( |
            | profileSliceReferrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleFontSpec = ( |
            | resend.titleFontSpec copyName: 'courier').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: profileSliceModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = 'A profile of: '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> () From: ( | {
         'Category: profile slice model state\x7fModuleInfo: Module: profileSliceModel InitialContents: InitializeToExpression: (nil)'
        
         ticks.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceModel' -> () From: ( | {
         'Category: profile slice model state\x7fModuleInfo: Module: profileSliceModel InitialContents: InitializeToExpression: (nil)'
        
         times.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'profileSliceRef' From: 'ui2/outliner'



 '-- Side effects'

 globals modules profileSliceModel postFileIn
