 ''
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
[ 
"prefileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         channel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> () From: ( |
             {} = 'Comment: TODO

Nice improcements to this would be

- maxQueueSize, with error block if full
  ie sendingInboxIfFull: blk

- timeouts (basedon time in queue not time to 
  return)

- throttling (ie messages/second)\x7fModuleInfo: Creator: globals channel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> () From: ( | {
         'Category: user state\x7fModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         endpoint.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: handling\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         deadProcess = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'deadProcess' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent deadProcess.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: channel InitialContents: InitializeToExpression: (channel parent deadProcess)'
        
         handlerProcess <- bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'deadProcess' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: channel InitialContents: InitializeToExpression: (lock)'
        
         lock <- bootstrap stub -> 'globals' -> 'lock' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: handling\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         abort = ( |
            | handlerProcess abortIfLive. running: deadProcess. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: copying\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         copy = ( |
            | 
            (resend.copy
              queue: queue copy)
              lock: lock copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         copyOn: obj = ( |
            | copy endpoint: obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: queueing\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         createTodoAndQueueSelector: s Arguments: a = ( |
             t.
            | 
            t: todo copyReceiver: endpoint Selector: s Arguments: a.
            queue add: t.
            start.
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'deadProcess' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         abortIfLive = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'deadProcess' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         isAlive = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: handling\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         handleLoop = ( |
            | 
            [queue isEmpty] whileFalse: [
              queue removeFirst send]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         isRunning = ( |
            | handlerProcess isAlive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: copying\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: handling\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         restart = ( |
            | abort start).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendWaitResultSelector: s Arguments: a = ( |
            | (createTodoAndQueueSelector: s Arguments: a) waitThenReturnResult).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendWithoutWaitingSelector: s Arguments: a = ( |
            | createTodoAndQueueSelector: s Arguments: a. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendingInbox = ( |
            | sendingInboxPrototype _Clone channel_: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: inbox prototypes\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendingInboxPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'sendingInboxPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent sendingInboxPrototype.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'sendingInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         channel_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'sendingInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            channel_ sendWithoutWaitingSelector: sel Arguments: args).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inspecting\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         size = ( |
            | queue size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: handling\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         start = ( |
            | 
            lock protect: [
            "Guard against two handlerProcesses running together"
            handlerProcess isAlive ifTrue: [^ self].
            handlerProcess: (
              process copySend: (message copy receiver: self Selector: 'handleLoop')
                  CauseOfBirth: 'a channel') resume]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: queueing\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         todo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent todo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy sem: semaphore copyCount: 0 Capacity: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         copyReceiver: r Selector: s Arguments: a = ( |
            | 
            copy message: (message copy receiver: r Selector: s Arguments: a)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (message)'
        
         message <- bootstrap stub -> 'globals' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         result.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (semaphore)'
        
         sem <- bootstrap stub -> 'globals' -> 'semaphore' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         send = ( |
            | result: message send. sem signal. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         wait = ( |
            | sem wait).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'todo' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         waitThenReturnResult = ( |
            | wait. result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         waitingInbox = ( |
            | waitingInboxPrototype _Clone channel_: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fCategory: inbox prototypes\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         waitingInboxPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingInboxPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent waitingInboxPrototype.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         channel_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
            | 
            channel_ sendWaitResultSelector: sel Arguments: args).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: channel InitialContents: InitializeToExpression: (sharedQueue)'
        
         queue <- bootstrap stub -> 'globals' -> 'sharedQueue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         channel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules channel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (\'core\')\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (\'30.21.0\')\x7fVisibility: public'
        
         revision <- '30.21.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules channel postFileIn
