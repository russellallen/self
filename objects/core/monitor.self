 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot'
        
         monitor = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules monitor.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         monitor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'monitor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals monitor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         conditionSemaphore.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'monitor' -> () From: ( | {
         'Comment: How many times the process holding the monitor
has entered it (recursively).\x7fModuleInfo: Module: monitor InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         holdCount <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'monitor' -> () From: ( | {
         'Comment: Process holding the monitor. Nil when
monitor is not held.\x7fModuleInfo: Module: monitor InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         holdingProcess.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         monitorSemaphore.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         monitor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits monitor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'monitor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: blk = ( |
            | 
            debug ifTrue: [blk assert]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: debugging\x7fComment: Assert that the executing process holds the monitor.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         assertHoldsMonitor = ( |
            | 
            assert: [holdingProcess = process this].
            assert: [0 < holdCount].
            assert: [0 = (monitorSemaphore count + conditionSemaphore count)].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         checkInvariant = ( |
            | 
            false && debug ifTrue: [| c <- 0. |
                c: monitorSemaphore count + conditionSemaphore count.
                assert: [1 >= c].
                assert: [isHeld = (0 = c)].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            resend.copy init).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Comment: This is a low-level operation. It is preferable to use \'inMonitorDo:\'.
If this low-level operation is used, the caller must ensure that
enter/exit pair up correctly.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         enter = ( |
             thisProcess.
            | 
            thisProcess: process this.
            "Note: doing the following comparison before entering the monitor
             is safe since no other process than this one could assign to 
             'holdingProcess' in a way that makes the condition true."
            holdingProcess != thisProcess ifTrue: [
                monitorSemaphore wait.
                assert: [0 = holdCount].
                holdingProcess: thisProcess.
            ].
            holdCount: 1 + holdCount.
            printDebug: 'entered'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Comment: This is a low-level operation. It is preferable to use \'inMonitorDo:\'.
If this low-level operation is used, the caller must ensure that
enter/exit pair up correctly.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         exit = ( |
            | 
            assertHoldsMonitor.
            holdCount: holdCount - 1.
            0 = holdCount ifTrue: [
                holdingProcess: nil.  "Clear before signalling semaphore."
                semaphoreToSignal signal.
            ].
            printDebug: 'exited'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Comment: Return true iff the current process holds this monitor.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         heldByMe = ( |
            | holdingProcess = process this).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Comment: Execute the blk while holding the monitor.
Return result of blk.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         inMonitorDo: blk = ( |
            | 
            enter.
            blk onReturn: [exit]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         init = ( |
            | 
            monitorSemaphore:   semaphore copyBinary.
            conditionSemaphore: semaphore copyBinary wait.
            holdCount:          0.
            holdingProcess:     nil.
            checkInvariant.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         isHeld = ( |
            | 
            holdingProcess isNotNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         monitorTest = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( |
             {} = 'Comment: This object tests monitors. To run the test
evaluate \'copy run\' or \'copy runIfFail:\'.\x7fModuleInfo: Creator: traits monitor monitorTest.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         buf.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         consumer = ( |
            | 
            'Consumer running... ' print.
            mon inMonitorDo: [
                repeats do: [|:i. e|
                    mon waitFor: [isEmpty not].
                    e: buf removeFirst.
                    0 = ( i % 53) ifTrue: [times delay: 10].
                    mon printDebug: ['Fetched: ', e printString].
                    e != i ifTrue: [
                        'unexpected value, fetched: ' print.
                        e print.
                        ', expected: ' print.
                        i printLine.
                        consumerFailed: true.
                    ].
                ].
            ].
            'done.' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         consumerFailed <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         isEmpty = ( |
            | 
            buf isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         isFull = ( |
            | 
            10 <= buf size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         mon.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         producer = ( |
            | 
            'Producer running... ' print.
            mon inMonitorDo: [
                repeats do: [|:i|
                    0 = ( i % 43) ifTrue: [times delay: 10].
                    mon waitFor: [isFull not].
                    mon printDebug: ['Entered: ', i printString].
                    buf add: i.
                ].
            ].
            'done.' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         producerFailed <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         repeats = 1000.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            buf: list copy.
            mon: monitor copy.
            consumerFailed: false.
            producerFailed: false.
            startProcess: 'consumer'.
            producer.
            producerFailed ifTrue: [error: 'monitorTest: producer failed'].
            consumerFailed ifTrue: [error: 'monitorTest: consumer failed'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> 'monitorTest' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         startProcess: sel = ( |
             msg.
            | 
            msg: message copy.
            msg selector:  sel.
            msg receiver:  self.
            msg arguments: vector.
            (process copySend: msg) resume.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         printDebug: strBlk = ( |
            | 
            debug ifTrue: [
                "Use '_StringPrint' to avoid frequent context switches with
                 regular IO (makes the output very confusing)."
                checkInvariant.
                (process this objectID, ': ', strBlk value, '\n') _StringPrint.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            isHeld ifTrue: 'monitor(held)'
                    False: 'monitor(free)').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'ModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: private'
        
         semaphoreToSignal = ( |
            | 
            "Return the semaphore to signal. Give preference to processes waiting
             on conditionSemaphore to avoid starvation.
             Question: is it safe to first test which semaphore is empty and then
             later signal it without wrapping the test-signal sequence in a critical
             region? In other words, could we find 'conditionSemaphore' empty when 
             testing and then proceed to signal 'monitorSemaphore', while in the 
             meantime another process arrives at 'conditionSemaphore'?
             No, this cannot happen. For the other process to arrive at 
             'conditionSemaphore' it would have to transition through the monitor
             (which we currently hold)."
            conditionSemaphore isEmpty ifTrue: [monitorSemaphore]
                                        False: [conditionSemaphore]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Category: debugging\x7fComment: Run a test of monitors.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
            | monitorTest copy run).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Comment: Call only when holding monitor. Will cause the process to wait
outside the monitor for a signal on the \'conditionSemaphore\'.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         waitCondition = ( |
             hc <- 0.
             hp.
            | 
            printDebug: 'initiating waitCondition'.
            assertHoldsMonitor.
            hc: holdCount.
            hp: holdingProcess.
            holdCount: 0.        "Release monitor."
            holdingProcess: nil.
            semaphoreToSignal signalAndThenWaitOn: conditionSemaphore.
            holdCount: hc.       "Reestablish owership."
            holdingProcess: hp.
            printDebug: 'finishing waitCondition'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'monitor' -> () From: ( | {
         'Comment: Must already hold monitor when calling this method.
Will release monitor temporarirly and wait for external
event that makes \'conditionBlk\' evalute to true. More specifically,
will wait for a \'signalCondition\' to be executed by other process;
when signal arrives, will evaluate \'conditionBlk\' and continue if 
it has become true; else will wait for another signal.
So a process that has changed some state that may have made a 
condition become true, should indicate this fact my invoking 
\'signalCondition\'.
It is guaranteed that whenever \'conditionBlk\' is evaluated, the 
process doing so holds the monitor.\x7fModuleInfo: Module: monitor InitialContents: FollowSlot\x7fVisibility: public'
        
         waitFor: conditionBlk = ( |
            | 
            conditionBlk whileFalse: [waitCondition].
            self).
        } | ) 



 '-- Side effects'

 globals modules monitor postFileIn
