 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: processesAndIO InitialContents: FollowSlot'
        
         processesAndIO = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'processesAndIO' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'processesAndIO' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules processesAndIO.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processesAndIO' -> () From: ( | {
         'ModuleInfo: Module: processesAndIO InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processesAndIO' -> () From: ( | {
         'ModuleInfo: Module: processesAndIO InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processesAndIO' -> () From: ( | {
         'ModuleInfo: Module: processesAndIO InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processesAndIO' -> () From: ( | {
         'ModuleInfo: Module: processesAndIO InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processesAndIO' -> () From: ( | {
         'ModuleInfo: Module: processesAndIO InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'ping
interceptor
serializer
processStack
processStatus
processErrors
process
semaphore
barrier
scheduler
sharedSetAndDictionary
foreign
all_OS
fileStream
stdin
stat
sharedQueue
socketServer
monitor
lock
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'ping' From: 'core'
 bootstrap read: 'interceptor' From: 'core'
 bootstrap read: 'serializer' From: 'core'
 bootstrap read: 'processStack' From: 'core'
 bootstrap read: 'processStatus' From: 'core'
 bootstrap read: 'processErrors' From: 'core'
 bootstrap read: 'process' From: 'core'
 bootstrap read: 'semaphore' From: 'core'
 bootstrap read: 'barrier' From: 'core'
 bootstrap read: 'scheduler' From: 'core'
 bootstrap read: 'sharedSetAndDictionary' From: 'core'
 bootstrap read: 'foreign' From: 'core'
 bootstrap read: 'all_OS' From: 'core'
 bootstrap read: 'fileStream' From: 'core'
 bootstrap read: 'stdin' From: 'core'
 bootstrap read: 'stat' From: 'core'
 bootstrap read: 'sharedQueue' From: 'core'
 bootstrap read: 'socketServer' From: 'core'
 bootstrap read: 'monitor' From: 'core'
 bootstrap read: 'lock' From: 'core'



 '-- Side effects'

 globals modules processesAndIO postFileIn
