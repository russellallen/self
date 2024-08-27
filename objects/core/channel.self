 '30.21.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


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
         'Category: internal state\x7fModuleInfo: Module: channel InitialContents: InitializeToExpression: (lock copy)'
        
         chLock <- lock copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> () From: ( | {
         'Category: user state\x7fModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         endpoint.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy chLock: lock copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         copyOn: obj = ( |
            | copy endpoint: obj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox creation\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         inbox = ( |
            | inboxPrototype _Clone channel_: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox prototypes\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         inboxPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'inboxPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent inboxPrototype.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'inboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         channel_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'inboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
             l = bootstrap stub -> 'lobby' -> ().
             m.
            | 
            m: (l message copy receiver: l nil Selector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args).
            channel_ sendMessage: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox creation\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         inboxTimeOut: ms = ( |
            | 
            (inboxTimeoutPrototype _Clone channel_: self) timeOut_: ms).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox prototypes\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         inboxTimeOutPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'inboxTimeOutPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent inboxTimeOutPrototype.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'inboxTimeOutPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         channel_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'inboxTimeOutPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         timeOut_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'inboxTimeOutPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
             l = bootstrap stub -> 'lobby' -> ().
             m.
            | 
            m: (l message copy receiver: l nil Selector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args).
            channel_ sendMessage: m TimeOut: timeOut_).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: queue management\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         noOfWaiters = ( |
            | chLock sema noOfWaiters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendMessage: msg = ( |
            | 
            ( message copy receiver: self Selector: 'sendWaitResultMessage:' With: msg) fork resume.
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendMessage: msg TimeOut: ms = ( |
            | 
            ( message copy receiver: self Selector: 'sendWaitResultMessage:TimeOut:IfTimedOut:' 
                           With: msg With: ms With: (| value = (self) |)) fork resume.
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendWaitResultMessage: msg = ( |
            | 
            chLock protect: [unsafeSendMessage: msg]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: sending\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         sendWaitResultMessage: msg TimeOut: ms IfTimedOut: tblk = ( |
            | 
            chLock protect: [unsafeSendMessage: msg] TimeOut: ms IfTimedOut: tblk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: queue management\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         size = ( |
            | 
            noOfWaiters + chLock lockCount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         unsafeSendMessage: msg = ( |
            | 
            msg receiver: endpoint. msg send).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox creation\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         waitingInbox = ( |
            | waitingInboxPrototype _Clone channel_: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox prototypes\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
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
             l = bootstrap stub -> 'lobby' -> ().
             m.
            | 
            m: (l message copy receiver: l nil Selector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args).
            channel_ sendWaitResultMessage: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox creation\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         waitingInboxTimeOut: ms IfTimedOut: tblk = ( |
            | 
            ((waitingTimeOutInboxPrototype _Clone channel_: self) timeOut_: ms) timeOutBlock_: tblk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> () From: ( | {
         'Category: inbox prototypes\x7fModuleInfo: Module: channel InitialContents: FollowSlot'
        
         waitingTimeOutInboxPrototype = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingTimeOutInboxPrototype' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals channel parent waitingTimeOutInboxPrototype.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingTimeOutInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         channel_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingTimeOutInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         timeOutBlock_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingTimeOutInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: InitializeToExpression: (nil)'
        
         timeOut_.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'channel' -> 'parent' -> 'waitingTimeOutInboxPrototype' -> () From: ( | {
         'ModuleInfo: Module: channel InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( |
             l = bootstrap stub -> 'lobby' -> ().
             m.
            | 
            m: (l message copy receiver: l nil Selector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args).
            channel_ sendWaitResultMessage: m TimeOut: timeOut_ IfTimedOut: timeOutBlock_).
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
