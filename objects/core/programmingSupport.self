 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: programmingSupport InitialContents: FollowSlot'
        
         programmingSupport = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'programmingSupport' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'programmingSupport' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules programmingSupport.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingSupport' -> () From: ( | {
         'ModuleInfo: Module: programmingSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingSupport' -> () From: ( | {
         'ModuleInfo: Module: programmingSupport InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingSupport' -> () From: ( | {
         'ModuleInfo: Module: programmingSupport InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingSupport' -> () From: ( | {
         'ModuleInfo: Module: programmingSupport InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'programmingSupport' -> () From: ( | {
         'ModuleInfo: Module: programmingSupport InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'inspect
enumerating
browsing
history
transporter
programmingLog
diff
primitives
shortcuts
transcendental_wrappers
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'inspect' From: 'core'
 bootstrap read: 'enumerating' From: 'core'
 bootstrap read: 'browsing' From: 'core'
 bootstrap read: 'history' From: 'core'
 bootstrap read: 'transporter' From: 'core'
 bootstrap read: 'programmingLog' From: 'core'
 bootstrap read: 'diff' From: 'core'
 bootstrap read: 'primitives' From: 'core'
 bootstrap read: 'shortcuts' From: 'core'
 bootstrap read: 'transcendental_wrappers' From: 'glue'



 '-- Side effects'

 globals modules programmingSupport postFileIn
