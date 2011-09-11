 'Sun-$Revision: 30.16 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot'
        
         process = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'process' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'process' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules process.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot'
        
         myComment <- 'Behavior for processes.\"
            \"Waiting for death added by dmu 4/91\"
            \"Process prototype is created by init (& VM)
              so we must list all slots in process here'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.16 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         birthMessage <- bootstrap stub -> 'globals' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         causeOfBirth <- 'scheduler'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: error handling\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         causeOfDeath <- 'Hey, wait! I\'m not dead yet!'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: error handling\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         causeOfError <- bootstrap stub -> 'globals' -> 'processErrors' -> 'ok' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: waiters\x7fComment: who waits for my death?\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         deathWaiters.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         elapsedTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: error handling\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         errorContinueValue <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'process' -> 'errorContinueValue' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals process errorContinueValue.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: process InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: public'
        
         filesToShow <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: used by scheduler\x7fComment: The scheduler queue that this process
is currently on or noQueue.\x7fModuleInfo: Module: process InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         onQueue.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: used by scheduler\x7fComment: Which semaphore (if any) that this process
is currently *waiting* on. Holds nullSemaphore
when process is not waiting on any semaphore.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         onSemaphore <- bootstrap stub -> 'globals' -> 'nullSemaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: used by scheduler\x7fComment: An integer value.\x7fModuleInfo: Module: process InitialContents: InitializeToExpression: (5)\x7fVisibility: private'
        
         priority0 <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: used by scheduler\x7fComment: Status of this process (running, suspended, ...); 
see \'processStatus\' for the possible values.\x7fModuleInfo: Module: process InitialContents: InitializeToExpression: (processStatus newborn)\x7fVisibility: private'
        
         processStatus0 <- bootstrap stub -> 'globals' -> 'processStatus' -> 'newborn' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: used by scheduler\x7fComment: is the process in single step mode?\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         singleStep <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: sleeping and time-outs\x7fComment: How long a sleep (integer, ms) has been requested.
The scheduler sets this to zero if a process actually wakes up because time is up.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         sleepTime <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         stackShot <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         startTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: used by scheduler\x7fComment: if a valid activation, process stops when\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stopActivation.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: waiters\x7fComment: who waits for my suspension\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         suspensionWaiters.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         swapInTime <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         timing <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: sleeping and time-outs\x7fComment: for sleeping; when to wake up process.
This slot contains a \'times\' object.\x7fModuleInfo: Module: process InitialContents: InitializeToExpression: (times real)\x7fVisibility: public'
        
         wakeTime <- times real.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: process InitialContents: FollowSlot'
        
         schedulerCalls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'mixins' -> 'schedulerCalls' -> () From: ( |
             {} = 'Comment: for synchronization
        All low-level critical sections are performed in the context of
        the scheduler so that they cannot be interrupted.  To achieve
        this, a user process transfers to the scheduler with _Yield and
        passes a function code (selector).  The scheduler usually calls
        back to perform the actual work.
        Note: this is only for low-level synchronization; use semaphores
        for other applications.			       -Urs 1/92\x7fModuleInfo: Creator: mixins schedulerCalls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'schedulerCalls' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         criticalDoFast: fastBlk InScheduler: schedBlk ToScheduler: action = ( |
            | 
            "A speed optimization for common paths; if fastBlk returns
            true, no process switches will be performed.  fastBlk
            is executed with signals turned off; it is intended for
            short, trivial critical sections only.
            Note: 'action' can be a block, but it will be evaluated here
                  (if needed) to produce an object. The scheduler will
                  later send this object the message 'doAction'.
                  Typically, the 'doAction' method does the same as
                  'schedBlk'."
            scheduler inScheduler ifTrue: schedBlk False: [
                (scheduler blockSignals: fastBlk) ifFalse: [_Yield: action value].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'mixins' -> 'schedulerCalls' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         performInScheduler: action IfInside: blk = ( |
            | scheduler inScheduler ifTrue: blk False: [_Yield: action]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         process = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: aborting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         abort = ( |
            | 
            abort: 'aborted').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: aborting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         abort: reason = ( |
            | 
            causeOfDeath: reason.
            performInScheduler: abortAction IfInside: [scheduler abort: self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         abortAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'abortAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process abortAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'abortAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler abort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'abortAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: aborting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         abortIfLive = ( |
            | abortIfLive: 'aborted').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: aborting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         abortIfLive: reason = ( |
            | 
            causeOfDeath: reason.
            performInScheduler: abortIfLiveAction IfInside: [
                scheduler abortIfLive: self ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         abortIfLiveAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'abortIfLiveAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process abortIfLiveAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'abortIfLiveAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler abortIfLive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'abortIfLiveAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         activationStack = ( |
            | 
            activationStackIfFail: [|:e|
                'outOfMemoryError' == e ifTrue: [
                    memory allocationFailed.
                    ^ activationStackIfFail: raiseError
                ].
                error: e
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         activationStackIfFail: failBlk = ( |
            | 
            "Receiver must be a process and can fail with: 
             'outOfMemoryError' or 'noProcessError'"
            _ActivationStackIfFail: failBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         activationStackLimit: maxActivations = ( |
            | 
            activationStackLimit: maxActivations IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         activationStackLimit: maxActivations IfFail: failBlk = ( |
             s.
            | 
            s: activationStackIfFail: [|:e| ^ failBlk value: e].
            s size <= maxActivations ifTrue: [s] False: [s copySize: maxActivations]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         at: i = ( |
            | at: i IfAbsent: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         at: i IfAbsent: failBlock = ( |
            | 
            "The activation mirror returned by _ActivationAt: is
             a clone of mirrors methodActivation with a DI parent.
             init will assign mirrors traits methodActivation to the parent."
            (_ActivationAt: i IfFail: [|:e| ^ failBlock value: e]) initNumber: i Process: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: aborting\x7fComment: basicAbort completely removes the process from all scheduler queues.
It should not be called from user processes.\x7fModuleInfo: Module: process InitialContents: FollowSlot'
        
         basicAbort = ( |
            | 
            performInScheduler: basicAbortAction
                      IfInside: [ scheduler basicAbort: self ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         basicAbortAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'basicAbortAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process basicAbortAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'basicAbortAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler basicAbort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'basicAbortAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fComment: The scheduler needs to reshuffle the readyQ when priorities
change, so the actual setting of priorities is controlled by
a call-back from the scheduler to this method.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         basicSetPriority: pri = ( |
            | 
            priority0: pri).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         birthLabel = ( |
            | 
            '' = causeOfBirth ifTrue: [birthMessage]
                               False: [causeOfBirth]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         changePriorityAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'changePriorityAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process changePriorityAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'changePriorityAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | 
            scheduler changePriority: newPriority).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'changePriorityAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         newPriority <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'changePriorityAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: resuming\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         continue = ( |
            | singleStep: false. resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         copySend: msg = ( |
            | copySend: msg CauseOfBirth: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         copySend: msg CauseOfBirth: cob = ( |
            | 
            (_NewProcessSize: ( _Interpret ifTrue: defaultInterpretedProcessSize 
                                            False: defaultProcessSize )
                    Receiver: msg receiver 
                    Selector: msg selector
                   Arguments: msg arguments)
              initialize: msg CauseOfBirth: cob).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         cpuUse = ( |
             currentTime <- 0.
             processTime <- 0.
             totalTime <- 0.
            | 
            timing ifFalse: [error: 'timing not active for this process'].
            currentTime: times cpu.
            totalTime: currentTime - startTime.
            0 = totalTime ifTrue: [^ 0].
            processTime: elapsedTime.
            = process this ifTrue: [processTime: processTime + (currentTime - swapInTime)]
            processTime asFloat / totalTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         currentActivation = ( |
            | 
            stackDepth > 0 ifTrue: [ at: 0 ]
                            False: [ mirrors deadActivation ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         currentHash: val = ( |
            | 
            "Set the (VM-level) counter used when this process forces allocation
             of identity hash values to objects. Useful when debugging since it
             allows reproducible hash values."
            _CurrentHash: val).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fComment: Priority that is assigned to newly created 
processes.\x7fModuleInfo: Module: process InitialContents: InitializeToExpression: (5)\x7fVisibility: public'
        
         defaultInitialPriority <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultInterpretedProcessSize = ( |
            | defaultProcessSize * 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fComment: doubled to file out benchmarks -- dmu 3/93
doubled again for profiling Klein -- ads 6/04\x7fModuleInfo: Module: process InitialContents: InitializeToExpression: (524288)\x7fVisibility: public'
        
         defaultProcessSize <- 524288.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         displayStack = ( |
            | displayStack: maxSmallInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         displayStack: n = ( | {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 act.
                }  {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 new.
                }  {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 threshold.
                } 
            | 
            act: currentActivation.
            stackShot removeAll.
            [ | :exit |
                stackShot addFirst: act.
                act hasSender ifFalse: [ exit value ].
                act: act sender.
            ] loopExit.
            threshold: stackShot size - n.
            stackShot do: [ | :a |
                i: i succ.
                i > threshold ifTrue: [
                    a hasSender && [i > threshold succ]
                        ifTrue: [ ui addMirror: a Sprout: '<sender>' ]
                         False: [ ui add: a ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         displayStackDelta = ( | {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 act.
                }  {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 new.
                }  {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 tos.
                } 
            | 
            "remove all dead activations from the top"
            [ | :exit |
                stackShot isEmpty || [stackShot first isLive]
                  ifTrue: [ exit value ].
                ui remove: stackShot removeFirst.
            ] loopExit.

            act: currentActivation.
            tos: stackShot isEmpty ifTrue: [ mirrors deadActivation ]
                                    False: [ stackShot first ].
            new: list copyRemoveAll.

            "make a list of the new activations"
            [ | :exit |
                act = tos ifTrue: [ exit value ]
                           False: [ new addFirst: act ].
                act hasSender ifFalse: [ exit value ].
                act: act sender.
            ] loopExit.

            "add the new activations to the stack and the ui"
            new do: [ | :a |
                stackShot addFirst: a.
                a hasSender && [ui exists: a sender]
                    ifTrue: [ ui addMirror: a Sprout: '<sender>' ]
                     False: [ ui addMirror: a ].
            ].

            "update current activation"
            ui update: currentActivation.
            ui update. "interruptably update them all"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         displayTopOfStack = ( |
            | ui add: currentActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         filteredStackTrace = ( |
            | stackTraceFilteredBy: [|:f| isFrameShown: f]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: stepping\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         finish = ( |
            | finish: currentActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: stepping\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         finish: thisActivation = ( |
            | 
            thisActivation isReflecteeActivation ifFalse: [
                ^error: 'argument to finish must be an activation' ].
            ifNotScheduler: [
                singleStep: false.
                stopActivation: thisActivation.
                resume.
                waitForSuspension.
                stopActivation: nil]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         finishCurrent = ( |
            | finish. displayStackDelta).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         finishSelected = ( | {
                 'ModuleInfo: Module: process InitialContents: FollowSlot'
                
                 act.
                } 
            | 
            "may want to put this in uiWorld"
            ui findFirst: [ | :b | b objMirror isReflecteeActivation ]
               IfPresent: [ | :b | act: b objMirror ]
                IfAbsent: [ act: currentActivation ].
            finish: act.
            displayStackDelta).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fComment: Like \'removeFromSemaphore\' but also cleas the
\'onSemaphore\' slot.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         fullyRemoveFromSemaphore = ( |
            | 
            removeFromSemaphore.
            onSemaphore: nullSemaphore.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: messages\x7fComment: refer to scheduler so fileOut ensure a dummy exists
     for the storeStrings of the messages to refer to.
     The problem is that storeString does not call back into fileOut
     to refer to other objects. But that would crud up storeString--dmu\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         hackForFileOut = bootstrap stub -> 'globals' -> 'scheduler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         hasError = ( |
            | 
            causeOfError != processErrors ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         ifNotScheduler: blk = ( |
            | 
            = scheduler schedulerProcess
               ifFalse: blk True: [error: 'cannot single-step scheduler process']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = ( |
            | status isActive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         isAlive = ( |
            | 
            stackDepthIfFail: [^ false].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: querying\x7fComment: Are any debuggers debugging me? -- Mario, 4/4/95\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         isDebugged = ( |
            | 
            birthEvent ifNil: [
              "test if shell debugger is attached"
              = shell cp
            ] IfNotNil: [
              "is there a debugger in the world?"
              birthEvent sourceHand world reifiedObjects includesKey: (reflect: self)
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         isFrameShown: f = ( |
            | 
                filesToShow isEmpty 
            || [filesToShow includes: f file]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: querying\x7fComment: Return truee iff this process is currently
*waiting* on a semaphore.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         isOnSemaphore = ( |
            | onSemaphore != nullSemaphore).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fComment: the scheduler process is the prototypical (and initial) process
so if the current process isn\'t the initial process, we must be
running the scheduler\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         isScheduled = ( |
            | process != process this).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         killActivationsUpTo: actNum = ( |
            | 
            killActivationsUpTo: actNum 
                         IfFail: [|:e|  e = 'noProcessError' ifFalse: [ error: e ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         killActivationsUpTo: actNum IfFail: failBlock = ( |
            | 
            _KillActivationsUpTo: actNum IfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         lowLevelStackTrace = ( |
            | 
            _PrintProcessStackIfFail: ['\n<dead process>\n' print].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fCategory: queue operations\x7fComment: Move this process from its present queue (if any)
to the queue q and set the status to stat.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToQueue: q NewStatus: stat = ( |
            | 
            removeFromQueue.
            setProcessStatus: stat.
            onQueue: q.
            q add: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         newestActivationNamed: sel = ( |
            | 
            stack findFirst: [|:a| a selector = sel]
              IfPresent: [|:a| a]
               IfAbsent: [error: 'none']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fCategory: queue operations\x7fComment: Indicates that a process object is currently not
on any queue (e.g., this is the case for newborn
processes).\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         noQueue = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'noQueue' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process noQueue.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'noQueue' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         add: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'noQueue' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'noQueue' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         remove: p IfAbsent: absBlk = ( |
             pstat.
            | 
            pstat: p status.
            (pstat != processStatus newborn) && [p status != processStatus dead] ifTrue: [
                'Trying to remove from noQueue: ' print.
                p objectID print.
                ', status: ' print. p status asString printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         permitSuspensionWaiters = ( |
            | suspensionWaiters detain. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fComment: Only scheduler should call this method.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveAbortProcess = ( |
            | primitiveAbortProcessIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fComment: Only scheduler should call this method.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveAbortProcessIfFail: errBlk = ( |
            | 
            _AbortProcessIfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fComment: Only scheduler should call this method.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         primitiveAbortProcessIfNoProcessError: noPrErrBlk = ( |
            | 
            primitiveAbortProcessIfFail: [|:error. :name|
                ('noProcessError' isPrefixOf: error) ifTrue: [^ noPrErrBlk value].
                primitiveFailedError: error Name: name.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         printError = ( |
            | 
            causeOfError errorString isEmpty
               ifTrue: [ 'This process has no cause of error!' printLine] 
               False:  [ causeOfError reportError: self ForceStackTrace: true ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            status asString, ' ',
            'process: ', birthLabel,
            (causeOfError errorString isEmpty ifTrue: '' False: [
               ' >>> ', causeOfError errorString])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: priorities\x7fComment: Return this process\' priority.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         priority = ( |
            | priority0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: priorities\x7fComment: Set priority of this process.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         priority: pri = ( |
            | 
            (reflect: pri) isReflecteeInteger ifFalse: [
                error: 'priority must be integer, else scheduler may crash'.
            ].
            pri != priority ifTrue: [|act|
                act: changePriorityAction copy.
                act newPriority: pri.
                "The following garble will do a call-back from the scheduler
                 to 'basicSetPriority:'."
                performInScheduler: act IfInside: [
                    scheduler changePriority: pri OfProcess: self.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fComment: Called by scheduler when a suspended process
is being resumed. Puts the process back on the
wait queue of any semaphore it was on at suspension
time, or grants the semaphore to the process if it
is now available.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         redoSemaphoreWait = ( |
            | 
            isOnSemaphore ifTrue: [|sema|
                sema: onSemaphore.
                onSemaphore: nullSemaphore.
                sema semaphoreWait.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fCategory: queue operations\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         removeFromQueue = ( |
            | 
            "If waiting with timeout, we get here when signalling the semaphore.
             Must be sure process is not on timerWaiters so it does not get
             timed-out later. -- dmu 8/04"
            scheduler timerWaiters remove: self IfAbsent: [].

            onQueue remove: self IfAbsent: [  "Be robust!"
                status != processStatus dead ifTrue: [
                    "Never know with dead processes (killing them
                     will remove them from queues), so don't be 
                     to noisy in this case."
                    'warning: should have found process ' print.
                    objectID printLine.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fComment: Called when a process is suspended. Will
remove it from the semaphore it was trying
to acquire, but leave the semaphore in the
\'onSemaphore\' slot so that the operation can
be retried when the process is resumed.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFromSemaphore = ( |
            | 
            onSemaphore remove: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         resetCauseOfError = ( |
            | causeOfError: processErrors ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         resetTiming = ( |
            | 
            elapsedTime: 0.
            startTime: times cpu.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: resuming\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         resume = ( |
            | 
            performInScheduler: resumeAction
                      IfInside: [scheduler resume:  self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         resumeAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'resumeAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process resumeAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'resumeAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler resume).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'resumeAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         returnValue = ( |
            | 
            causeOfDeath = 'terminated' ifTrue: [ 
                ^_ProcessReturnValueIfFail: raiseError]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         schedulerCooperation* = bootstrap stub -> 'mixins' -> 'schedulerCalls' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fComment: Copy over the \'per process\' globals from
the creating process.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         setPerProcessGlobalsFrom: oldProcess = ( |
            | 
            stdin:       oldProcess stdin.
            stdout:      oldProcess stdout.
            stderr:      oldProcess stderr.
            birthEvent:  oldProcess birthEvent.
            prompt:      oldProcess prompt.
            history:     oldProcess history).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fComment: This method should only be called during initialization
or by the scheduler.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         setProcessStatus: stat = ( |
            | processStatus0: stat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         signalDeathWaiters = ( |
            | 
            signalSuspensionWaiters.
            deathWaiters release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: called by scheduler\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         signalSuspensionWaiters = ( |
            | 
            suspensionWaiters release. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: suspending\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         sleep: ms = ( |
            | 
            isScheduled ifTrue: [
                sleepTime: ms.
                performInScheduler: sleepAction
                          IfInside: [scheduler sleep: self For: ms].
            ] False: [   "busy wait"
                ms = scheduler timeoutInfinity ifTrue: [
                    [] loop.
                ] False: [|when|
                    when: times real + ms.
                    [when > times real] whileTrue.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         sleepAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'sleepAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process sleepAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'sleepAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler sleep).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'sleepAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stack = ( |
            | 
            stackWithLimit: maxSmallInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stackDepth = ( |
            | stackDepthIfFail: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stackDepthIfFail: failBlock = ( |
            | 
            _StackDepthIfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stackTrace = ( |
            | stackTraceFilteredBy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stackTraceFilteredBy: filterBlock = ( |
            | 
            ('## Stack trace for process ', objectID) printLine.
            (trimmedStackFilteredBy: filterBlock) printTrace.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stackWithLimit: max = ( |
            | processStack copyForProcess: self Limit: max).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         startTiming = ( |
            | 
            = process this ifTrue: [swapInTime: times cpu].
            timing: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         status = ( |
            | processStatus0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: stepping\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            ifNotScheduler: [singleStep: true. resume. waitForSuspension].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: stepping\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stepAndSkipSimpleBytecodes = ( |
            | 
            step stepOverSimpleBytecodes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: stepping\x7fComment: Step into any activation that shares the same
home context -- Mario, 5/18/95\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stepInto = ( |
             myHome.
             thisAct.
            | 
            thisAct: currentActivation.
            myHome: thisAct outermostLexicalScope.
            [| act |
             step.
             act: currentActivation.
             act ifDead: [^self].
             (act != thisAct) && [myHome = act outermostLexicalScope]  ifTrue: [^self].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: stepping\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stepIntoAndSkipSimpleBytecodes = ( |
            | 
            stepInto stepOverSimpleBytecodes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: stepping\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stepOverSimpleBytecodes = ( |
             act.
            | 
            act: at: 0 IfAbsent: [^ self "dead process"].
            [ act isSimpleBytecodeAt: act position ] whileTrue: [ |oldp|
              "hack cause sometimes step doesn't -- dmu 5/02"
              oldp: act position.
              step.
              act position = oldp  ifTrue: [^ self].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         step_ui = ( |
            | step. displayStackDelta).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: suspending\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            isScheduled ifTrue: [suspend] False: [abort]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         stopTiming = ( |
            | 
            = process this ifTrue: [
                elapsedTime: elapsedTime + (times cpu - swapInTime)
            ].
            timing: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'process').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: suspending\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         suspend = ( |
            | 
            performInScheduler: suspendAction
                      IfInside: [scheduler suspend: self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'suspendAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process suspendAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'suspendAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler suspend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'suspendAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: suspending\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         suspendAndTrace: error = ( |
            | 
            causeOfError: error.
            performInScheduler: suspendAndTraceAction
                      IfInside: [scheduler suspendAndTrace: self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendAndTraceAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'suspendAndTraceAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process suspendAndTraceAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'suspendAndTraceAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler suspendAndTrace).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'suspendAndTraceAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: suspending\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         suspendWithError: error = ( |
            | 
            causeOfError: error.
            performInScheduler: suspendAction
                      IfInside: [scheduler suspend: self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fComment: Called by scheduler each time a process starts running.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         swapInNotify = ( |
            | 
            timing ifTrue: [swapInTime: times cpu].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fComment: Called by scheduler each time a process stops running.\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         swapOutNotify = ( |
            | 
            timing ifTrue: [
                elapsedTime: elapsedTime + (times cpu - swapInTime).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         this = ( |
            | _ThisProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: statistics and timing\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         totalTime = ( |
            | times cpu - startTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         trimmedStack = ( |
            | trimmedStackFilteredBy: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         trimmedStackFilteredBy: filterBlock = ( |
             cnt <- 0.
             n.
             r.
             s.
            | 
            status = processStatus newborn ifTrue: [^ stack].
            s: stack.
            s: s copySize: s topmostInterestingActivation succ.
            n: causeOfError firstInterestingFrameOf: s.
            n: 0 max: n. 
            r: s copySize: s size - n.
            r size do: [|:i. a|
                a: s at: i + n.
                "always show first interesting frame"
                (0 = i) || [filterBlock value: a]  ifTrue: [
                    r at: cnt Put: a.
                    cnt: cnt succ.
                ].
            ].
            r copySize: cnt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: waiting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         waitForDeath = ( |
            | 
            deathWaiters wait.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: waiting\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         waitForSuspension = ( |
            | 
            suspensionWaiters wait.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduling\x7fCategory: suspending\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         yield = ( |
            | 
            performInScheduler: yieldAction
                      IfInside: [error: 'cannot yield in scheduler']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: scheduler cooperation\x7fModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         yieldAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'process' -> 'yieldAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits process yieldAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'yieldAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: public'
        
         doAction = ( |
            | scheduler yielding).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> 'yieldAction' -> () From: ( | {
         'ModuleInfo: Module: process InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 



 '-- Side effects'

 globals modules process postFileIn
