 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableSlicer InitialContents: FollowSlot'
        
         pluggableSlicer = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableSlicer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () From: ( | {
         'ModuleInfo: Module: pluggableSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () From: ( | {
         'ModuleInfo: Module: pluggableSlicer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () From: ( | {
         'ModuleInfo: Module: pluggableSlicer InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () From: ( | {
         'ModuleInfo: Module: pluggableSlicer InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () From: ( | {
         'ModuleInfo: Module: pluggableSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableSlicer' -> () From: ( | {
         'ModuleInfo: Module: pluggableSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'sliceModel
sliceGroupOutliner
sliceGroupModel
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'sliceModel' From: 'ui2/outliner'
 bootstrap read: 'sliceGroupOutliner' From: 'ui2/outliner'
 bootstrap read: 'sliceGroupModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules pluggableSlicer postFileIn
