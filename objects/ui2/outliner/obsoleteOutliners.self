 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: obsoleteOutliners InitialContents: FollowSlot'
        
         obsoleteOutliners = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules obsoleteOutliners.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () From: ( | {
         'ModuleInfo: Module: obsoleteOutliners InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () From: ( | {
         'ModuleInfo: Module: obsoleteOutliners InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () From: ( | {
         'ModuleInfo: Module: obsoleteOutliners InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () From: ( | {
         'ModuleInfo: Module: obsoleteOutliners InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () From: ( | {
         'ModuleInfo: Module: obsoleteOutliners InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsoleteOutliners' -> () From: ( | {
         'ModuleInfo: Module: obsoleteOutliners InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'structureEditing
obsObjOutliner
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'structureEditing' From: 'ui2/outliner'
 bootstrap read: 'obsObjOutliner' From: 'ui2/outliner'



 '-- Side effects'

 globals modules obsoleteOutliners postFileIn
