 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         barrier = bootstrap define: bootstrap stub -> 'globals' -> 'barrier' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototypeName' From:
             globals semaphore copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'barrier' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals barrier.

CopyDowns:
globals semaphore. copy 
SlotsToOmit: parent prototypeName.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         blocking <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         barrier = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits barrier.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'barrier' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeName = 'barrier'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot'
        
         barrier = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'barrier' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'barrier' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules barrier.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot'
        
         myComment <- 'A barrier is either up or down; if it\'s down, every process can \"
            \"immediately pass; if the barrier is up, everybody has to wait.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy count: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBinary = ( |
            | error: 'not appropriate for barriers').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         copySignalCapacity: n = ( |
            | error: 'not appropriate for barriers').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         detain = ( |
            | blocking: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | blocking: false. signalAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'Category: calledByScheduler\x7fComment: _\x7fModuleInfo: Module: barrier InitialContents: FollowSlot'
        
         semaphoreGet = ( |
            | 
            printDebug: '*** barrier get on '.
            blocking ifFalse: [ ^ self ].
            resend.semaphoreGet.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: barrier InitialContents: FollowSlot'
        
         semaphoreWait = ( |
            | 
            printDebug: '*** barrier wait on '.
            blocking ifFalse: [ ^ self ].
            resend.semaphoreWait.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         signalAll = ( |
            | [ isEmpty ] whileFalse: [ signal ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'barrier copy "Warning: state not saved"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'barrier' -> () From: ( | {
         'ModuleInfo: Module: barrier InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | barrier).
        } | ) 



 '-- Side effects'

 globals modules barrier postFileIn
