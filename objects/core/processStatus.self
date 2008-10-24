 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot'
        
         processStatus = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'processStatus' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'processStatus' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules processStatus.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot'
        
         myComment <- 'by Ungar 4/91'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         processStatus = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processStatus' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStatus.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         dead = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processStatus' -> 'dead' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStatus dead.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'dead' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = 'dead'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         processStatus = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'processStatus' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits processStatus.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'dead' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'processStatus' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'dead' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'processStatus' -> 'dead' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         newborn = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processStatus' -> 'newborn' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStatus newborn.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'newborn' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = 'newborn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'newborn' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'processStatus' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'newborn' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'processStatus' -> 'newborn' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         ready = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processStatus' -> 'ready' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStatus ready.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'ready' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = 'ready'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'ready' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'ready' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'processStatus' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'ready' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'processStatus' -> 'ready' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         running = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processStatus' -> 'running' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStatus running.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'running' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = 'running'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'running' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'running' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'processStatus' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'running' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'processStatus' -> 'running' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         suspended = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processStatus' -> 'suspended' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStatus suspended.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'suspended' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = 'suspended'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'suspended' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'processStatus' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'suspended' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'processStatus' -> 'suspended' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         waiting = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processStatus' -> 'waiting' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processStatus waiting.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'waiting' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         asString = 'waiting'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'waiting' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'waiting' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         p* = bootstrap stub -> 'traits' -> 'processStatus' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processStatus' -> 'waiting' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'processStatus' -> 'waiting' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'processStatus' -> () From: ( | {
         'ModuleInfo: Module: processStatus InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'processStatus ' , asString).
        } | ) 



 '-- Side effects'

 globals modules processStatus postFileIn
