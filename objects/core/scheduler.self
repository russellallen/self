 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot'
        
         scheduler = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'scheduler' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'scheduler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules scheduler.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scheduler' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scheduler' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scheduler' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scheduler' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'scheduler' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         scheduler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( |
             {} = 'Comment: A simple scheduler managing concurrent Self processes and asynchronous
I/O.  Currently, the scheduling policy is round-robin. 

Each process can be in one of 6 states (see the object \'processStatus\'):
  newborn:   The process is going through initialization; it has not yet
             been seen by the scheduler and is not on any queue.
  running:   This applies to the current process.  In the current
             implementation there is precisely one running process.
             The running process is a member of the readyQ.
  ready:     The process is ready to run, waiting to be scheduled;
             It is a member of readyQ.
  waiting:   The process is waiting on a semaphore or for a real timer tick.
             The process is a member of the waitingQ.
  suspended: The process has been suspended. It is found on the
             suspendedQ, and must be resumed before it can run again.
  dead:      The process has terminated or was aborted.

Transitions between states:

                    +-------------------------3------------------+
   +-1,3-->         |                                            |
   |                v                                            v
running <-- 4 --> ready   <---1--->   suspended   <---2--->  waiting

   dead <--5--- all other states

  (1)  -->  suspend
       <--  resume (if process was ready when it was suspended)
            timer signal (for sleep)

  (2)  -->  resume (if process was waiting when it was suspended)
       <--  suspend

  (3)  -->  e.g. semaphore wait (includes I/O blocking), and sleep:
       <--  semaphore signal (e.g. through SIGIO signal) or timer tick

  (4)  <-- scheduled to run
       --> preempted

  (5)  <-- abort

A running process can undergo the same transitions as a ready process
(1 and 4).

The scheduler maintains an additional queue for managing timer waits:
timerWaiters. When a timer tick arrives for a process on the timerWaiters
queue, the process will be moved to the readyQ if its current status was
\'waiting\' (if the process is dead or has been suspended, the timer tick
will be ignored; not even a timer can awake a dead process!).
When a process is made ready to run by a timer tick, an instance variable
in the process object indicates that the reason for the status change was
a timer tick.

One day it will be nice to make timer objects (instead of having an
invisible timerWaiters queue in the scheduler). Then processes should
be able to wait on several conditions at once (timers, semaphores, whatever).\x7fModuleInfo: Creator: globals scheduler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: aborting\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         abort = ( |
            | abort: yieldRcvr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: aborting\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         abort: p = ( |
            | 
            "BUG: p might still hold some semaphores, and we should signal
            these or else the correpsonding resource will be blocked for-
            ever.  On the other hand, implementing this would make sema- 
            phore operations more expensive, and it still wouldn't handle
            the general problem (free external resources held by p)."

            kill: p For: p causeOfDeath.
            p primitiveAbortProcessIfNoProcessError: [
                warning: 'Trying to abort already dead process ', p objectID.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: aborting\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         abortIfLive = ( |
            | abortIfLive: yieldRcvr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: aborting\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         abortIfLive: p = ( |
            | 
            "See comment above"
            kill: p For: p causeOfDeath.
            p primitiveAbortProcessIfNoProcessError: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         aborted = ( |
            | kill: currentProcess For: 'aborted').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         activateCPUTimer = ( |
            | 
            "ticks every 100 ms"
            setCPUTimer: 
              case if: debug       Then: 10000
                   If: _Interpret  Then: 2000
                   Else: 100).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: sleeping and time-out\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         addToTimerWaiters: p For: ms = ( |
             sleepMs <- 0.
            | 
            p = schedulerProcess ifTrue: [error: 'should not delay scheduler'].
            sleepMs: (5 max: ms).
            p wakeTime: times real + sleepMs.
            timerWaiters add: p.
            "careful--setting real timer to zero turns it off"
            p = timerWaiters first ifTrue: [setRealTimer: sleepMs].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         assert: blk = ( |
            | 
            debug ifTrue: [blk assert].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: aborting\x7fComment: basicAbort completely removes the process from all queues.
Shouldn\'t be called by the user.\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         basicAbort = ( |
            | basicAbort: yieldRcvr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: aborting\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         basicAbort: p = ( |
            | 
            removeFromQueues: p.
            p primitiveAbortProcessIfFail: [].  "may already be dead"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         blockSignals = ( |
            | true  _BlockSignals. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fComment: Use blockSignals with caution and just for TRIVIAL blocks\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         blockSignals: block = ( | {
                 'ModuleInfo: Module: scheduler InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            blockSignals. v: block value. unblockSignals. v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: changing priorities\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         changePriority: newPriority = ( |
            | changePriority: newPriority OfProcess: yieldRcvr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: changing priorities\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         changePriority: newPriority OfProcess: p = ( |
            | 
            p onQueue !== readyQ ifTrue: [
                "The easy case, just set it."
                p basicSetPriority: newPriority.
            ] False: [
                "The tricky case: take him out of ready queue and put
                 him back on."
                readyQ remove: p IfAbsent: [  "Be robust."
                    'changePriority: warning: should have found ' print.
                    p objectID printLine.
                    ^ self.
                ].
                p basicSetPriority: newPriority.
                readyQ add: p.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         cleanupQ: q = ( |
            | 
            "The 'basicAbort' action may cause a process to remove itself from
             the queue 'q'. So copy 'q' to avoid confusing the iterator method."
            q copy do: [|:p| p basicAbort].
            q removeAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handling user interrupts\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         collectProcessIDs = ( |
             pids.
            | 
            pids: set copyRemoveAll.
            readyQ     do: [|:p| pids add: p objectIDNumber].
            suspendedQ do: [|:p| pids add: p objectIDNumber].
            waitingQ   do: [|:p| pids add: p objectIDNumber].
            pids).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         couldntAllocateStack = ( |
            | 
            warning: 'Couldn\'t allocate stack for ', currentProcess objectID.
            kill: currentProcess For: 'couldn\'t allocate stack').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fComment: may be scheduler process when no other\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (process)\x7fVisibility: publicReadPrivateWrite'
        
         currentProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         deactivateCPUTimer = ( |
            | setCPUTimer: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         debug: p = ( |
            | 
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         debugSigio: i = ( |
            | 
            "Called from 'sigio' method."
            (selectVec at: i) = traits os_file debugFd   ifTrue: [
              ' Sig_' _StringPrint.
              (fileTable at: (selectVec at: i)) queue isEmpty printString canonicalize _StringPrint.
              (fileTable at: (selectVec at: i)) count         printString canonicalize _StringPrint.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         dispatchOnTwainsReturnValue: rv = ( |
            | 
            "Should order these by frequency, but I don't know best ordering. Ole, 9/94."
            "Why not perform here? It is slower and harder to understand."
            debug ifTrue: [ rv printLine].
            'signal'               = rv ifTrue: [^ signal].
            'yielded'              = rv ifTrue: [^ yielded].
            'aborted'              = rv ifTrue: [^ aborted].
            'couldntAllocateStack' = rv ifTrue: [^ couldntAllocateStack].
            'finishedActivation'   = rv ifTrue: [^ finishedActivation].
            'lowOnSpace'           = rv ifTrue: [^ lowOnSpace].
            'noActivationError'    = rv ifTrue: [^ noActivationError].
            'noProcessError'       = rv ifTrue: [^ noProcessError].
            'nonLifoBlock'         = rv ifTrue: [^ nonLifoBlock].
            'singleStepped'        = rv ifTrue: [^ singleStepped].
            'stackOverflow'        = rv ifTrue: [^ stackOverflow].
            'terminated'           = rv ifTrue: [^ terminated].
            'twainsFailed'         = rv ifTrue: [^ twainsFailed].
            'schedulder: ignoring unexpected TWAINS return value: ' print. rv printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         dispatchSignal: sig = ( |
            | 
            "Should order these by frequency, but don't know best order. Ole /9/94"
            "Why not use a peform? Because it is slower and not so clear."
            debug ifTrue: [ sig printLine ].
            'sigcputimer'  = sig ifTrue: [^ sigcputimer].
            'sigrealtimer' = sig ifTrue: [^ sigrealtimer].
            'sigchild'     = sig ifTrue: [^ sigchild].
            'sighup'       = sig ifTrue: [^ sighup].
            'sigint'       = sig ifTrue: [^ sigint].
            'sigio'        = sig ifTrue: [^ sigio].
            'sigpipe'      = sig ifTrue: [^ sigpipe].
            'sigquit'      = sig ifTrue: [^ sigquit].
            'sigterm'      = sig ifTrue: [^ sigterm].
            'sigurg'       = sig ifTrue: [^ sigurg].
            'siguser1'     = sig ifTrue: [^ siguser1].
            'siguser2'     = sig ifTrue: [^ siguser2].
            'sigwinch'     = sig ifTrue: [^ sigwinch].
            'scheduler: ignoring unknown signal: ' print. sig printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handling user interrupts\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         doInterruptActionForProcess: n = ( |
             action.
             input.
             proc.
             suspended <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            proc: n _AsObject.
            suspended: proc status = processStatus suspended.
            '  Select <return> for no action'       printLine.
            '         p        to print the stack'  printLine.
            '         k        to kill the process' printLine.
            suspended ifTrue: [
                '         r        to resume execution of the process' printLine.
            ] False: [
                '         b        to resume execution of the process in the background' printLine.         
                '         s        to suspend execution of the process' printLine.
            ].
            '  for process ' print.
            n print. ': ' print.
            input: stdin preemptReadLine shrinkwrapped.

            action: input uncapitalize canonicalize.
            action = 'k' ifTrue: [
                interruptMsg: ('Process ', n printString, ' killed.').
                proc abort: 'user abort'.
            ] False: [
            (action = 'b') && suspended not  ifTrue: [
                interruptMsg: ('Process ', n printString, ' backgrounded.').
                proc suspend. proc resume.
            ] False: [
            (action = 's') && suspended not  ifTrue: [
                interruptMsg: ('Process ', n printString, ' suspended.').
                proc suspend.
            ] False: [
            (action = 'r') && suspended  ifTrue: [
                interruptMsg: ('Process ', n printString, ' resumed.').
                proc resume.
            ] False: [
            action = 'p' ifTrue: [
                interruptMsg: ('Process ', n printString, ' stack dump.').
                proc filteredStackTrace.
                printIndent. interruptDivider printLine.
                doInterruptActionForProcess: n.   "More to be done?"
            ] False: [
            action = '' ifTrue: [
                interruptMsg: 'No action taken.'.
            ] False: [
                interruptMsg: 'Not a valid selection; no action taken.'.
            ]]]]]].
            prompt notify.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         errorLevel <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         finishedActivation = ( |
            | 
            currentProcess stopActivation: nil.
            currentProcess suspend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         ignoredSignal: sig = ( |
            | (sig, ' ignored') printLine. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         inScheduler = ( |
            | process this isScheduled not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handling user interrupts\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         interruptBanner = '----------------Interrupt-----------------'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handling user interrupts\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         interruptDivider = '------------------------------------------'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handling user interrupts\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         interruptMenu = ( |
             input.
             n.
             schedKill = -1.
            | 
            '\n' print.
            printIndent. interruptBanner printLine.
            printQueues.
            printIndent. interruptDivider printLine.
            '  Select a process (or q to quit scheduler): ' print.
            input: stdin preemptReadLine shrinkwrapped.

            (input = 'q') || [input = 'Q'] ifTrue: [
                interruptMsg: 'Scheduler shut down.'.
                scheduler stop.
                ^ true.
            ].
            n: (input asIntegerIfFail: [
                interruptMsg: 'Not a valid process; no process selected.'.
                prompt notify.
                ^ false.
            ]).
            (collectProcessIDs includes: n) ifFalse: [
                interruptMsg: 'Not a valid process; no process selected.'.
                prompt notify.
                ^ false.
            ].
            doInterruptActionForProcess: n.
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handling user interrupts\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         interruptMsg: msg = ( |
            | 
            printIndent. msg printLine.
            printIndent. interruptDivider printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         isAnotherProcessReady = ( |
            | 
            1 < readyQ size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services\x7fComment: Return true iff scheduler is currently running.\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         isRunning = ( |
            | stopping not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         kill: p For: reason = ( |
            | 
            (debug: p) ifTrue: [('** ', reason, ' ') print. p objectID print].
            p causeOfDeath: reason.
            p = schedulerProcess ifTrue: [
                process this primitiveAbortProcess.
                error: 'should not get here'.
            ].
            p setProcessStatus: processStatus dead.
            removeFromQueues: p.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         loop = ( |
            | 
            [stopping] whileFalse: [|res. p|
                p: schedule.       "find next process to run"
                currentProcess: p. 

                p setProcessStatus: processStatus running.
                p swapInNotify.
                res: (transfer: p).
                p swapOutNotify.
                p status = processStatus running ifTrue: [
                    "If no other event caused the process to change state away from
                     running (such as blocking on a semaphore), now demote its state
                     from running to ready."
                    p setProcessStatus: processStatus ready.
                ].

                dispatchOnTwainsReturnValue: res.   "handle event which caused TWAINS to return."
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         lowOnSpace = ( |
            | 
            memory lowSpaceHandler: 0 UserRequested: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: queue operations\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToReadyQ: p = ( |
            | 
            (debug: p) ifTrue: [('moveToReadyQ: ', p objectID) printLine].
            p = schedulerProcess ifTrue: [error: 'should not unblock scheduler'].
            p moveToQueue: readyQ NewStatus: processStatus ready.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: queue operations\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         moveToSuspendedQ: p = ( |
            | 
            p = schedulerProcess ifTrue: [error: 'should not suspend scheduler'].
            p moveToQueue: suspendedQ NewStatus: processStatus suspended.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: queue operations\x7fComment: Note: must specify a timeout when moving a process to waiting queue.
Timeout can be infinity, though (see \'timeoutInfinity\').\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToWaitingQ: p TimeOut: ms = ( |
            | 
            p = schedulerProcess ifTrue: [error: 'should not block scheduler'].
            (0 >= ms) && [timeoutInfinity != ms] ifTrue: [
                p sleepTime: 0.   "Immediate timeout."
                ^ self.
            ].
            p moveToQueue: waitingQ NewStatus: processStatus waiting.
            ms = timeoutInfinity ifFalse: [  "Also register for timeout wakeup."
                addToTimerWaiters: p For: ms.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         nameOfQueue: q = ( |
            | 
            q == readyQ     ifTrue: [^ 'readyQ'].
            q == suspendedQ ifTrue: [^ 'suspendedQ'].
            q == waitingQ   ifTrue: [^ 'waitingQ'].
            nil = q         ifTrue: [^ 'nil!!!'].
            'unknownQ' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         noActivationError = ( |
            | 
            warning: 'Dead activation ',
                     currentProcess stopActivation objectID,
                     ' passed to TWAINS for process ',
                     currentProcess objectID.
            currentProcess suspend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fComment: noProcessError and noActivationError aren\'t returned by the
TWAINS primitive but by the TWAINS primitive failure block\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         noProcessError = ( |
            | 
            warning: 'Dead process ', currentProcess objectID,
                     ' passed to TWAINS'.
            kill: currentProcess For: 'found dead').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         nonLifoBlock = ( |
            | 
            currentProcess suspendAndTrace: processErrors nonLifoBlock copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         printIndent = ( | {
                 'ModuleInfo: Module: scheduler InitialContents: FollowSlot'
                
                 indent = '  '.
                } 
            | indent print).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         printProcessQueues = ( |
            | 
            inScheduler ifTrue: [
                printQueues
            ] False: [
                _Yield: (| p* = traits oddball.
                           doAction = ( scheduler printQueues. ).
                |).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         printQueue: q Name: n = ( |
            | 
            q isEmpty ifTrue: [^ self].
            printIndent.
            (n, ':') printLine.
            q do: [|:p|
                printIndent. printIndent.
                p objectID print. ' ' print.
                (p printString copySize: 68) printLine.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         printQueues = ( |
            | 
            printQueue: readyQ     Name: 'Ready'.
            printQueue: suspendedQ Name: 'Suspended'.
            printQueue: waitingQ   Name: 'Waiting'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fCategory: sorters\x7fComment: Sorter object used for priority queues that sort processes
by their priority.\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         prioritySorter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'scheduler' -> 'prioritySorter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals scheduler prioritySorter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> 'prioritySorter' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         element: p1 Precedes: p2 = ( |
            | 
            "Use strict comparison to achieve round-robin withing
             each priority level."
            p1 priority > p2 priority).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (priorityQueue copy)\x7fVisibility: private'
        
         readyQ = priorityQueue copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: cleaning up memory\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         releaseObjects = ( |
            | 
            "free up memory used by old errors"
            cleanupQ: suspendedQ.
            readyQ releaseObjects.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         removeFromQueues: p = ( |
            | 
            p status = processStatus newborn ifTrue: [^ self].
            timerWaiters remove: p IfAbsent: [].
            p fullyRemoveFromSemaphore.
            p signalSuspensionWaiters.
            p signalDeathWaiters.
            p moveToQueue: p noQueue NewStatus: p status.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (vector copySize: _TWAINSResultSize)\x7fVisibility: private'
        
         result = vector copySize: _TWAINSResultSize.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: resuming\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         resume = ( |
            | resume: yieldRcvr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: resuming\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         resume: p = ( |
            | 
            p status = processStatus suspended ifTrue: [
                (debug: p) ifTrue: ['** resuming ' print. p objectID print].
                p = schedulerProcess ifTrue: [error: 'should not resume scheduler'].
                moveToReadyQ: p.
                p permitSuspensionWaiters.
                p isOnSemaphore ifTrue: [|curP|
                    "The suspended process was waiting on a semaphore.
                     Redo the semaphore wait operation."
                    curP: currentProcess.
                    currentProcess: p.     "The semaphore wait action accesses
                                            'currentProcess' so need to set it..."
                    p redoSemaphoreWait.
                    currentProcess: curP.  "...and reset it. This *is* ugly."
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         schedule = ( |
             p.
            | 
            "simple round-robin scheduling withing each priority level."
            readyQ isEmpty ifTrue: [
                debug ifTrue: ['*** readyQ is empty\n' print].
                ^ schedulerProcess.
            ].
            p: readyQ removeFirst.
            readyQ add: p.   "Put him back on readyQ while we run him."
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fComment: the scheduler process is the prototypical/initial process\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         schedulerProcess = bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (vector copySize: 64)\x7fVisibility: private'
        
         selectVec = vector copySize: 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         setCPUTimer: ms = ( |
            | 
            ms _SetCPUTimer.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         setRealTimer: ms = ( |
            | ms _SetRealTimer.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigchild = ( |
            | ignoredSignal: 'sigchild').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fComment: don\'t need to do anything, just switch processes\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigcputimer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'scheduler' -> 'sigcputimer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals scheduler sigcputimer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sighup = ( |
            | 
            traceSignal: 'SIGHUP'.
            sighupSemaphore signal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fCategory: semaphores\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (semaphore copyCount: 1 Capacity: 1)\x7fVisibility: public'
        
         sighupSemaphore <- semaphore copyCount: 1 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigint = ( |
            | 
            traceSignal: 'SIGINT'.
            userInterrupt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigio = ( |
             n <- 0.
            | 
            traceSignal: 'SIGIO'.
            n: (os selectInto: selectVec MaxFiles: os_file maxFiles IfFail: [
                error: 'scheduler: select failed'.
            ]).
            n do: [|:i| 
               "debugSigio: i."
                signalToFile: (selectVec at: i).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         signal = ( |
             n <- 0.
            | 
            "result[0] contains number of different signals.  Every signal
             is represented as a pair of array elements (name and count).
             Currently, the counts are just ignored."
            n: (result at: 0).
            1 to: 2*n By: 2 Do: [|:i| dispatchSignal: (result at: i)].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         signalToFile: fileNo = ( |
            | 
            (fileTable at: fileNo IfAbsent: [
               'warning: scheduler ignoring signal to bogus file number ' print.
               fileNo printLine.
                ^ self.
            ]) signal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigpipe = ( |
            | ignoredSignal: 'sigpipe').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigquit = ( |
            | 
            traceSignal: 'SIGQUIT'.
            userInterrupt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fComment: Wake up the processes from timerWaiters whose time has come.\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigrealtimer = ( |
            | 
            traceSignal: 'SIGALRM'.
            [|currentTime. procFirst. |
              timerWaiters isEmpty ifTrue: [^ stopRealTimer].
              currentTime: times real.
              procFirst: timerWaiters first.
              currentTime < procFirst wakeTime ifTrue: [
                  ^ setRealTimer: procFirst wakeTime - currentTime.
              ].
              timerWaiters removeFirst.
              procFirst fullyRemoveFromSemaphore.  "Remove from semaphore he is
                                                    on (can be nullSemaphore)."
              procFirst status = processStatus waiting ifTrue: [
                  "Only waiting processes can be woken up by timer alarms.
                   For suspended and dead processes, timer alarms are ignored."
                  procFirst sleepTime: 0.   "Indicate that timer woke him up."
                  moveToReadyQ: procFirst.
              ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigterm = ( |
            | "somebody wants to kill this process" _Quit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigurg = ( |
            | ignoredSignal: 'sigurg').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         siguser1 = ( |
            | ignoredSignal: 'siguser1').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         siguser2 = ( |
            | ignoredSignal: 'siguser2').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         sigwinch = ( |
            | 
            traceSignal: 'SIGWINCH'.
            sigwinchSemaphore signal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fCategory: semaphores\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (semaphore copyCount: 1 Capacity: 1)\x7fVisibility: public'
        
         sigwinchSemaphore <- semaphore copyCount: 1 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         singleStepped = ( |
            | 
            (debug: currentProcess) ifTrue: [ 'singleStepped' printLine ].
            currentProcess suspend).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: sleeping and time-out\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         sleep = ( |
            | sleep: yieldRcvr For: yieldRcvr sleepTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: sleeping and time-out\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         sleep: p For: ms = ( |
            | 
            moveToWaitingQ: p TimeOut: ms).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         stackOverflow = ( |
            | 
            currentProcess suspendAndTrace: processErrors stackOverflow copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            "fixes sched wont restart bug--dmu"
            schedulerProcess onSemaphore: nullSemaphore. 

            readyQ       sorter: prioritySorter.
            timerWaiters sorter: wakeupSorter.
            errorLevel: 0.
            schedulerProcess causeOfBirth: 'scheduler'.
            schedulerProcess resetCauseOfError.
            timerWaiters removeAll.
            cleanupQ: readyQ.
            cleanupQ: suspendedQ.
            cleanupQ: waitingQ.

            fileTable mapBy: [semaphore copyBinary wait].
            os_file startAsync.
            activateCPUTimer.
            stopRealTimer.
            stopping: false.
            snapshotAction schedulerInitial.
            loop.
            os_file stopAsync.
            schedulerProcess causeOfBirth: 'initial process'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | stopping: true "shut down the scheduler").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         stopRealTimer = ( |
            | setRealTimer: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         stopping <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'scheduler').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'scheduler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: suspending\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         suspend = ( |
            | suspend: yieldRcvr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: suspending\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         suspend: p = ( |
            | 
            p status != processStatus suspended ifTrue: [
            (debug: p) ifTrue: ['** suspending ' print. p objectID print].
                moveToSuspendedQ: p.

                "If p is being suspended by the user, it might be currently
                 waiting on a semaphore.  Therefore, we temporarily remove
                 it from the semaphore's queue (*without* signalling the
                 semaphore).  On a resume, p will retry the 'wait' operation."
                p removeFromSemaphore.  "Note: leaves 'onSemaphore slot in process intact.
                                         The 'resume:' method relies on this fact."
                p signalSuspensionWaiters.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: suspending\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         suspendAndTrace = ( |
            | suspendAndTrace: yieldRcvr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: suspending\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         suspendAndTrace: p = ( |
             maxRecursiveErrors = 1.
            | 
            errorLevel: errorLevel succ.
            p = schedulerProcess ifTrue: [
               "This is not a scheduled process--either it's
                  the scheduler itself or the scheduler isn't running.
                  p = schedulerProcess = _ThisProcess"
                p _PrintProcessStack.
                errorLevel: 0.
                p causeOfError reportError: p ForceStackTrace: false.
                p primitiveAbortProcess.
                ^ self.  "won't actually reach here"
            ].
            errorLevel > maxRecursiveErrors ifTrue: [
               "Too many errors occurred in trying to handle the
                original error. Just safely print the stack."
                p _PrintProcessStack.
                errorLevel: 0.
                ^ self.
            ].
            suspend: p.

            (debug: p) ifTrue: [
              ('** suspendAndTrace: ', p objectID) printLine.
            ].

            p causeOfError reportError: p ForceStackTrace: false.
            p birthEvent ifNotNil: [
                selfProcessModel debugProcess: p.
            ] IfNil: [| id <- ''. |
                id: p objectIDNumber printString.
                p stderr write: 'To debug in ui2, type:      selfProcessModel debugProcess: ', id, ' as\n',
                                'to debug in console, type:  attach: ', id, '\n',
                                'to dump stack, type:        ', id, ' as printError.\n'.
            ].
            errorLevel: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         suspendedQ = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         terminated = ( |
            | kill: currentProcess For: 'terminated').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fCategory: sleeping and time-out\x7fComment: Used to indicate that sleep or wait request should have no timout.
It is OK to access this object to pass it as an argument, say to
the \'waitTimeOut:\' method, but clients should not rely on its value.\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         timeoutInfinity = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: state\x7fComment: Priority queue; all processes waiting for a timer signal.
Ordered by wakeupTime.\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (priorityQueue copyRemoveAll)\x7fVisibility: private'
        
         timerWaiters = priorityQueue copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: signals\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         traceSignal: signal = ( |
            | debug ifTrue: [(' ', signal) print ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         transfer: p = ( |
            | 
            transfer: currentProcess Result: result IfFail: [|:err. :name|
                ('noProcessError'    isPrefixOf: err) ifTrue: [^ 'noProcessError'].
                ('noActivationError' isPrefixOf: err) ifTrue: [^ 'noActivationError'].
                'couldn\'t transfer to process ' print.
                currentProcess objectID print.
                (' (suspended): ', err) printLine.
                currentProcess suspend.
                currentProcess singleStep:     false.
                currentProcess stopActivation: nil.
                'twainsFailed'
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fComment: do a coroutine transfer to process p\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         transfer: p Result: result IfFail: failblock = ( |
            | 
            debug ifTrue: ['transferring to: ' print. p printLine].
            twains: p Result: result
                  SingleStep: p singleStep
                      StopAt: p stopActivation
                      IfFail: failblock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         twains: p Result: result SingleStep: bool StopAt: activation IfFail: failblock = ( |
            | 
            p _TWAINSResultVector: result
                       SingleStep: bool
                           StopAt: activation
                           IfFail: failblock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         twainsFailed = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         twainsResultSize = ( |
            | _TWAINSResultSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         unblockSignals = ( |
            | false _BlockSignals. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handling user interrupts\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         userInterrupt = ( |
            | 
            "executes in the scheduler process --> protected from signals"
            os_file stopAsync. 
            scheduler stopping: true.
            scheduler stopping: interruptMenu.
            os_file startAsync.
            os_file stdin resetEOF. "because read in sync mode sets EOF"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: scheduler InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         waitingQ = list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: scheduling\x7fCategory: sorters\x7fComment: Sorter object used for priority queues that sort processes
by their wakeup time.\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         wakeupSorter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'scheduler' -> 'wakeupSorter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals scheduler wakeupSorter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> 'wakeupSorter' -> () From: ( | {
         'ModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         element: p1 Precedes: p2 = ( |
            | 
            p1 wakeTime < p2 wakeTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: private'
        
         yieldRcvr = ( |
            | result at: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: handle TWAINS return value\x7fComment: By convention, the argument to _Yield: is an object that
understands \'doAction\'. Typically, this method performs a
single send, but more general actions are possible.
Currently, possible arguments to _Yield are action objects
which perform these sends: (List may be incomplete, Ole 9/94)

receiver     argument msg                
-----------------------------------------
(ignored)    sema semaphoreWait          
(ignored)    sema semaphoreSignal        
(ignored)    sema semaphoreGet           
process      scheduler yielded           
process      scheduler suspend           
process      scheduler resume            
process      scheduler sleep             
process      scheduler abort\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         yielded = ( |
            | 
            (result at: 1) doAction).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'scheduler' -> () From: ( | {
         'Category: services to other processes\x7fModuleInfo: Module: scheduler InitialContents: FollowSlot\x7fVisibility: public'
        
         yielding = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'scheduler' -> 'yielding' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals scheduler yielding.
'.
            | ) .
        } | ) 



 '-- Side effects'

 globals modules scheduler postFileIn
