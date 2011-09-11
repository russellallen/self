 '$Revision:$'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: FollowSlot'
        
         perspectives = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules perspectives.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'perspectives' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'perspectivesTests
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: perspectives\x7fModuleInfo: Module: perspectives InitialContents: InitializeToExpression: (\'default\')'
        
         perspective <- 'default'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: perspectives\x7fModuleInfo: Module: perspectives InitialContents: FollowSlot'
        
         subjective = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'subjective' -> () From: ( |
             {} = 'ModuleInfo: Creator: mixins subjective.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'subjective' -> () From: ( | {
         'ModuleInfo: Module: perspectives InitialContents: FollowSlot'
        
         ambiguousSelector: sel Type: t Delegatee: d MethodHolder: m Arguments: a = ( |
             l = bootstrap stub -> 'lobby' -> ().
            | 

            sel    sendTo: self
             DelegatingTo: ((l process this perspective forObject: self
                                                         Selector: sel) sendTo: self)
            WithArguments: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'block' -> () From: ( | {
         'Category: perspectives\x7fModuleInfo: Module: perspectives InitialContents: FollowSlot'
        
         @ p = ( |
             h.
             r.
            | 
            h: process this perspective.
            process this perspective: p.
            r: onNonLocalReturn: [|:v| process this perspective: h. v ]
                         IfFail: [|:e| process this perspective: h. raiseError ].
            process this perspective: h. r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: perspectives InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize: msg CauseOfBirth: cob = ( |
            | 
            setProcessStatus:         processStatus newborn.
            onQueue:                  noQueue.
            basicSetPriority:         defaultInitialPriority.
            wakeTime:                 times real.
            birthMessage:             msg statePrintString.
            causeOfBirth:             cob.
            deathWaiters:             barrier copy.
            suspensionWaiters:        barrier copy.
            (suspensionWaiters = nil) ifTrue: [halt. "Should never happen. If it does, find out why. This is an attempt to catch a strange GC bug. Ausch - 10/04"].
            stackShot:                list copyRemoveAll.
            filesToShow:              preferences filesToShow copy.
            setPerProcessGlobalsFrom: process this.
            perspective:              process this perspective.
            resetTiming.
            suspend.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: perspectives\x7fModuleInfo: Module: perspectives InitialContents: FollowSlot'
        
         forObject: o Selector: s = ( |
            | self).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'perspectivesTests' From: 'core'



 '-- Side effects'

 globals modules perspectives postFileIn
