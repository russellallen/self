 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot'
        
         sharedQueue = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'sharedQueue' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'sharedQueue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules sharedQueue.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: collections\x7fCategory: ordered\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedQueue = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sharedQueue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sharedQueue.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedQueue' -> () From: ( | {
         'Comment: waiters queue here\x7fModuleInfo: Module: sharedQueue InitialContents: InitializeToExpression: (semaphore copyCount: 0 Capacity: 1)\x7fVisibility: private'
        
         blockSema <- semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedQueue' -> () From: ( | {
         'Comment: number of waiters\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedQueue' -> () From: ( | {
         'Comment: protects rep and count.
Make recursive so printing can lock it,
then call size which also locks it.
-- dmu\x7fModuleInfo: Module: sharedQueue InitialContents: InitializeToExpression: (recursiveSemaphore copyCount: 1 Capacity: 1)\x7fVisibility: private'
        
         lockSema <- recursiveSemaphore copyCount: 1 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: collections\x7fCategory: ordered\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         sharedQueue = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sharedQueue.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sharedQueue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | sharedQueue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         rep <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         add: elem = ( |
            | 
            addOperation: [rep add: elem]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         addFirst: elem = ( |
            | 
            addOperation: [rep addFirst: elem]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         addLast: elem = ( |
            | 
            addOperation: [rep addLast: elem]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: adding\x7fComment: \'addBlk\' must not cause a non-local return.\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         addOperation: addBlk = ( |
            | 
            lockSema protectNoNLR: [
                addBlk value.  "Add the element."
                0 < count ifTrue: [blockSema signal].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'sharedQueue'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             c.
            | 
            c: clone.
            c rep: list copyRemoveAll.
            c resetLock.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Comment: block cannot contain non-local returns\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | 
            lockSema protect: [rep do: block]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         filterOut: criteria = ( | {
                 'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot'
                
                 in.
                }  {
                 'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot'
                
                 out.
                } 
            | 
            in:  list copyRemoveAll.
            out: list copyRemoveAll.
            lockSema protect: [
                rep do: [ | :e | (criteria value: e) ifTrue: [ out add: e ]
                                                      False: [ in  add: e ] ].
                rep: in.
            ].
            out).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirst: criteria IfPresent: p IfAbsent: a = ( |
            | 
            lockSema protect: [ 
                rep  findFirst: criteria  
                     IfPresent: [| :v. :k | 
                       ^ p value: v With: k.
                   ] IfAbsent: [
                       ^ a value
                   ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         grabLock = ( |
            | lockSema wait).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | 
            lockSema protectNoNLR: [rep isEmpty]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         isOrdered = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'collection' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringSize: s Depth: d = ( |
            | 
            lockSema protectNoNLR: [resend.printStringSize: s Depth: d]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         releaseLock = ( |
            | lockSema signal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: elem = ( |
            | 
            lockSema protectNoNLR: [rep remove: elem].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | 
            lockSema protectNoNLR: [rep removeAll].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFirst = ( |
            | 
            removeFirstOrLast: [rep removeFirst]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: private'
        
         removeFirstOrLast: remBlock = ( |
             done <- bootstrap stub -> 'globals' -> 'false' -> ().
             res.
            | 
            [   lockSema protectNoNLR: [
                    rep nonEmpty ifTrue: [res: remBlock value. done: true]
                                  False: [count: 1 + count].
                ]. 
                "done predicate on next line added by dmu 2/97"
                done ifFalse: [
                  blockSema wait.
                  lockSema protectNoNLR: [count: count - 1].
                ].
                done.
            ] whileFalse.
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: removing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLast = ( |
            | 
            removeFirstOrLast: [rep removeLast]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Comment: Reset lock so I am unlocked.
-- dmu\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         resetLock = ( |
            | 
            lockSema:  recursiveSemaphore copyBinary.
            blockSema: semaphore copyBinary get.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'ModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | 
            lockSema protectNoNLR: [rep size]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sharedQueue' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: sharedQueue InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            lockSema protectNoNLR: [resend.statePrintString]).
        } | ) 



 '-- Side effects'

 globals modules sharedQueue postFileIn
