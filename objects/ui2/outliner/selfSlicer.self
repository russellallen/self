 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfSlicer InitialContents: FollowSlot'
        
         selfSlicer = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfSlicer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () From: ( | {
         'ModuleInfo: Module: selfSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () From: ( | {
         'ModuleInfo: Module: selfSlicer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () From: ( | {
         'ModuleInfo: Module: selfSlicer InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () From: ( | {
         'ModuleInfo: Module: selfSlicer InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () From: ( | {
         'ModuleInfo: Module: selfSlicer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSlicer' -> () From: ( | {
         'ModuleInfo: Module: selfSlicer InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'selfSliceModel
selfSliceCP
selfSliceGroup
selfSliceRef
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfSliceModel' From: 'ui2/outliner'
 bootstrap read: 'selfSliceCP' From: 'ui2/outliner'
 bootstrap read: 'selfSliceGroup' From: 'ui2/outliner'
 bootstrap read: 'selfSliceRef' From: 'ui2/outliner'



 '-- Side effects'

 globals modules selfSlicer postFileIn
