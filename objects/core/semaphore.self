 'Sun-$Revision: 30.14 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         semaphore = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'semaphore' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'semaphore' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules semaphore.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         nullSemaphore = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'nullSemaphore' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals nullSemaphore.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullSemaphore' -> () From: ( | {
         'Comment: For debugging.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         assertNull = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullSemaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'null semaphore'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullSemaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullSemaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nullSemaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'nullSemaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         semaphore = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals semaphore.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'Comment: Max number of signals allowed;
extra ones are thrown away.\x7fModuleInfo: Module: semaphore InitialContents: InitializeToExpression: (1)\x7fVisibility: private'
        
         capacity <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'Comment: Count of pending signals.\x7fModuleInfo: Module: semaphore InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         count <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'Category: scheduler communication\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         getAction <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'semaphore' -> 'getAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals semaphore getAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'getAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         doAction = ( |
            | receiver semaphoreGet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'getAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'getAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         receiver <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'Comment: Used to be only in recursiveSemaphore,
but I wanted it here for debugging deadlocks. -- dmu 8/04\x7fModuleInfo: Module: semaphore InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         holderProcess.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         semaphore = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits semaphore.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeName = 'semaphore'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         queue <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'Category: scheduler communication\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         signalAction <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'semaphore' -> 'signalAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals semaphore signalAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'signalAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         doAction = ( |
            | receiver semaphoreSignal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'signalAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'signalAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         receiver <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> () From: ( | {
         'Category: scheduler communication\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         waitAction <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'semaphore' -> 'waitAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals semaphore waitAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'waitAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         doAction = ( |
            | receiver semaphoreWait).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'waitAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'semaphore' -> 'waitAction' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot'
        
         receiver <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         addLast: p = ( |
            | 
            queue addLast: p.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: copying\x7fComment: Used for lazy allocation of semaphores.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         allocateIn: obj = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         assertNull = ( |
            | error: 'not a null semaphore').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             s.
            | 
            s: resend.copy.
            s holderProcess: nil.
            s queue: queue copyRemoveAll.
            s waitAction:   (waitAction   copy receiver: s).
            s signalAction: (signalAction copy receiver: s).
            s getAction:    (getAction    copy receiver: s).
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBinary = ( |
            | copy count: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCount: cnt Capacity: n = ( |
            | (copy count: cnt) capacity: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         copySignalCapacity: n = ( |
            | copy capacity: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         copyUnbounded = ( |
            | copySignalCapacity: maxSmallInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         decCountIfZeroDo: blk = ( |
            | 
            0 = count ifTrue: [^ blk value].
            0 > count ifTrue: [error: 'bad semaphore count'].
            holderProcess: scheduler currentProcess.
            count: count pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fComment: Only call when it is known that \'count > 0\'.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         fastGet = ( |
            | 
            count: count pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fComment: Only call when it is known that queue is empty.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         fastSignal = ( |
            | 
            "The scheduler does not really grab semaphores."
            scheduler inScheduler ifFalse: [holderProcess: nil].

            count < capacity ifTrue: [count: count succ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fComment: Only call when it is known that \'count > 0\'.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         fastWait = ( |
            | 
            "The scheduler does not really grab semaphores."
            scheduler inScheduler ifFalse: [holderProcess: process this].

            count: count pred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fComment: get does a \'wait\' if the semaphore is available, otherwise an error\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         get = ( |
            | 
            criticalDoFast: [0 < count ifTrue: [fastGet. true]
                                        False: false]
               InScheduler: [semaphoreGet]
               ToScheduler: getAction.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         isAvailable = ( |
            | 
            0 < count).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: testing\x7fComment: warning: unsafe to call outside a critical section\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmpty = ( |
            | queue isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: testing\x7fComment: Return true iff the executing process holds this
semaphore.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         isHeldByThisProcess = ( |
            | 
            "Modified by adding scheduler check.
             If the scheduler tries to grab me while I am grabbed,
             should it be an error? Try just proceding for now, as do 
             regular semaphores. -- dmu 1/02"

            scheduler inScheduler ifTrue: [
              "cannot issue warning, no preferences at bootstrap time, sigh -- dmu 1/02"
              [warning: 'Scheduler attempting to lock recursiveSemaphore (see isHeldByThisProcess)'.].
            ^ true
            ].
            process this = holderProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: queue access\x7fComment: Warning: unsafe to call outside critical region.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         noOfWaiters = ( |
            | queue size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fComment: Used to indicate that process is doing a wait operation
with no time-out. It is OK to access this object to pass
it as an argument to a \'waitTimeOut:\' method, but clients
should not rely on its value.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         noTimeOut = ( |
            | scheduler timeoutInfinity).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         printDebug: msg = ( |
            | 
            debug ifTrue: [
                msg print.
                objectID print.
                ' count = ' print.
                count printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: aBlock = ( |
            | 
            protect: aBlock TimeOut: noTimeOut IfTimedOut: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: aBlock TimeOut: ms IfTimedOut: tblk = ( |
            | 
            (waitTimeOut: ms) ifTrue: [^ tblk value].
            aBlock onReturn: [unchecked_signal]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fComment: Like \'protect:\' but \'aBlock\' is not allowed
to cause a non-local return through this 
activation.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         protectNoNLR: aBlock = ( |
            | 
            protectNoNLR: aBlock TimeOut: noTimeOut IfTimedOut: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fComment: Like \'protect:TimeOut:IfTimedOut:\' but \'aBlock\' is not allowed
to cause a non-local return through this 
activation.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         protectNoNLR: aBlock TimeOut: ms IfTimedOut: tblk = ( |
             res.
            | 
            (waitTimeOut: ms) ifTrue: [^ tblk value].
            res: aBlock value.
            unchecked_signal.
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: queue access\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: p = ( |
            | 
            "The IfAbsent: is sometimes needed to allow the scheduler to
             be restarted even when a process object thinks it is on
             a semaphore but the semaphore does not actually have the
             process on its queue (i.e., either the process or the
             semaphore was corrupted).
             Warning: don't fiddle with the 'onSemaphore' slot in the
             process. The scheduler *needs* to maintain it during 
             suspension (which may be one occassion when this method
             is invoked)."

            queue remove: p IfAbsent: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: queue access\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAll = ( |
            | queue removeAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         removeFirst = ( |
            | queue removeFirst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         schedulerCooperation* = bootstrap stub -> 'mixins' -> 'schedulerCalls' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         schedulerTriedToWait: oldCode = ( |
            | 
            "oldCode is what was there before"
            fastWait. "decr count for later signal"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         semaphoreGet = ( |
            | 
            printDebug: '*** semaphore get on '.
            decCountIfZeroDo: [error: 'semaphore not available'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         semaphoreSignal = ( |
            | 
            printDebug: '*** semaphore signal on '.
            isEmpty ifTrue: [fastSignal]
                     False: [transferSemaphore].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fComment: Called by the scheduler to do
a wait for another process.
Will do the wrong thing if the
scheduler tries to wait.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         semaphoreWait = ( |
            | 
            printDebug: '*** semaphore wait on '.
            decCountIfZeroDo: [suspendOnSemaphore].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         signal = ( |
            | 
            unchecked_signal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         signalAndThenWaitOn: waitSema = ( |
            | signalAndThenWaitOn: waitSema TimeOut: noTimeOut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fComment: Atomically signal the receiver semaphore and
then wait on \'waitSema\'. \x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         signalAndThenWaitOn: waitSema TimeOut: ms = ( |
             proc.
            | 
            ms = 0  ifTrue: [signal. ^ true]. "do not wait at all"

            proc: process this.
            proc sleepTime: ms.
            criticalDoFast: [
                queue isEmpty && [0 < waitSema count] ifTrue: [
                    fastSignal.
                    waitSema fastWait.
                    true. "Indicate to scheduler that we are done."
                ] False: false.
            ] InScheduler: [
                semaphoreSignal.
                waitSema schedulerTriedToWait: [waitSema semaphoreWait].
            ] ToScheduler: [|action|
                "Cannot preallocate this action object, since depends on two
                 semaphores, one of which only becomes known whenthis method
                 is called."
                action: (| parent* = traits clonable.
                           first.
                           second.
                           doAction = ( first doAction. second doAction. self. ).
                        |) copy.
                action first: signalAction.
                action second: waitSema waitAction.
                action.
            ].
            proc sleepTime = 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: transporting\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            "need to test if receiver == semaphore because this is called
             by message's storeString to set the messages in the proto semaphore"
            prototypeName, 
                (== semaphore ifTrue: '' False: [
                ' copyCount: ', count storeString,
                    ' Capacity: ',   capacity storeString])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: transporting\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | prototypeName sendTo: lobby).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fComment: Slow part of the wait operation
called from the scheduler.
Since it uses currentProcess, it
does not work for the scheduler process itself.
Anyway, what would be the point of suspending the scheduler?
  -- dmu 5/1\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendOnSemaphore = ( |
             proc.
            | 
            proc: scheduler currentProcess.
            addLast: proc.
            proc onSemaphore: self.
            scheduler moveToWaitingQ: proc TimeOut: proc sleepTime.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: calledByScheduler\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         transferSemaphore = ( |
             p.
            | 
            p: removeFirst.
            p onSemaphore: nullSemaphore.
            holderProcess: p.
            scheduler moveToReadyQ: p.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         unchecked_signal = ( |
            | 
            criticalDoFast: [queue isEmpty ifTrue: [fastSignal. true]
                                            False: false]
               InScheduler: [semaphoreSignal]
               ToScheduler: signalAction.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         wait = ( |
            | 
            waitTimeOut: noTimeOut.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fComment: Like wait, but with a time-out. If the wait operation does
not complete within \'ms\' milliseconds it will be aborted.
The result is a boolean: true if the time-out occurred, false
otherwise.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         waitTimeOut: ms = ( |
             proc.
            | 
            ms = 0  ifTrue: [^ true].
            proc: process this.
            proc sleepTime: ms.
            criticalDoFast: [0 < count ifTrue: [fastWait. true]
                                        False: false]
               InScheduler: [schedulerTriedToWait: [semaphoreWait]]
               ToScheduler: waitAction.
            proc sleepTime = 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'semaphore' -> () From: ( | {
         'Category: queue access\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         waiters = ( |
            | queue copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         recursiveSemaphore = bootstrap define: bootstrap stub -> 'globals' -> 'recursiveSemaphore' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototypeName' From:
             globals semaphore copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'recursiveSemaphore' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals recursiveSemaphore.

CopyDowns:
globals semaphore. copy 
SlotsToOmit: parent prototypeName.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         recursiveSemaphore = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( |
             {} = 'Comment: bypass locking if same thread already has it locked\x7fModuleInfo: Creator: traits recursiveSemaphore.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'recursiveSemaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'recursiveSemaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeName = 'recursiveSemaphore'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         isAvailable = ( |
            | 
            isHeldByThisProcess || [resend.isAvailable]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( | {
         'ModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: aBlock TimeOut: ms IfTimedOut: tblk = ( |
            | 
            isHeldByThisProcess
              ifTrue: aBlock
               False: [resend.protect: aBlock TimeOut: ms IfTimedOut: tblk]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fComment: Like \'protect:TimeOut:IfTimedOut:\' but \'aBlock\' is not allowed
to cause a non-local return through this 
activation.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         protectNoNLR: aBlock TimeOut: ms IfTimedOut: tblk = ( |
            | 
            isHeldByThisProcess
              ifTrue: aBlock
               False: [resend.protectNoNLR: aBlock TimeOut: ms IfTimedOut: tblk]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( | {
         'Category: semaphore operations\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         signal = ( |
            | 
            isHeldByThisProcess ifTrue: [
              error: 'Signal should only be sent to me inside a protect* method.\n',
              'Otherwise I would need a counter for the nested waits and signals -- dmu 8/04'
            ].
            resend.signal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fComment: Atomically signal the receiver semaphore and
then wait on \'waitSema\'. \x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         signalAndThenWaitOn: waitSema TimeOut: ms = ( |
            | 
            isHeldByThisProcess ifTrue: [error: 'unimplemented'].
            resend.signalAndThenWaitOn: waitSema TimeOut: ms).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'recursiveSemaphore' -> () From: ( | {
         'Category: semaphore operations\x7fCategory: operations with time-out\x7fComment: Like wait, but with a time-out. If the wait operation does
not complete within \'ms\' milliseconds it will be aborted.
The result is a boolean: true if the time-out occurred, false
otherwise.\x7fModuleInfo: Module: semaphore InitialContents: FollowSlot\x7fVisibility: public'
        
         waitTimeOut: ms = ( |
            | 
            isHeldByThisProcess ifTrue: [^ false].
            resend.waitTimeOut: ms).
        } | ) 



 '-- Side effects'

 globals modules semaphore postFileIn
