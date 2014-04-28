 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         interceptor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'interceptor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals interceptor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'interceptor' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         interceptorTarget.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'interceptor' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         undefinedSelector: sel Type: msgType Delegatee: del MethodHolder: mh Arguments: args = ( | {
                 'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            m: sel message copy.  "copy the prototypical message--sent to sel
                                   because this interceptor object has no parent"
            m receiver: self Selector: sel Type: msgType Delegatee: del
              MethodHolder: mh Arguments: args.
            interceptorTarget send: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         sender = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sender' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sender.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         sender = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sender' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sender.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sender' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForTarget: target = ( |
            | 
            interceptor _Clone interceptorTarget: (copy receiver: target)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( | {
                 'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            x: copyForTarget: 23.
            ('x - 1 -> ', (x - 1)  printString) printLine.
            ('x  = 23 -> ', (x  = 23)  printString) printLine.
            ('x  == 23 -> ', (x == 23) printString) printLine.
            ('23 == x -> ', (23 == x)  printString) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = 'a sender'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         send: aMessage = ( |
            | (aMessage receiver: receiver) send).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         loggingSender = bootstrap define: bootstrap stub -> 'globals' -> 'loggingSender' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals sender copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'loggingSender' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals loggingSender.

CopyDowns:
globals sender. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals loggingSender parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         log: when Message: aMessage = ( |
            | 
            logEntry:  when, ': ', aMessage selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         logAbort: aMessage = ( |
            | 
            log: 'aborted' Message: aMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         logEntry: aString = ( |
            | aString printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         logFinish: aMessage = ( |
            | 
            log: 'finished' Message: aMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         logStart: aMessage = ( |
            | log: 'starting' Message: aMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sender' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         send: aMessage = ( |
             r.
            | 
            logStart: aMessage.
            r: [resend.send: aMessage] onNonLocalReturn: [|:ar|
              logAbort: aMessage.
              ar
            ].
            logFinish: aMessage.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         longMessageLoggingSender = bootstrap define: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals loggingSender copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals longMessageLoggingSender.

CopyDowns:
globals loggingSender. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals longMessageLoggingSender parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         logFinish: aMessage = ( |
            | 
            shouldLog ifTrue: [
              (time current - startTime) print.
              ' ' print.
              resend.logFinish: aMessage.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         logStart: aMessage = ( |
            | 
            startTime: time current).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         shouldLog = ( |
            | 
            (time current - startTime) > 100).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'longMessageLoggingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: InitializeToExpression: (time origin)'
        
         startTime <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         interceptor = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'interceptor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'interceptor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules interceptor.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'interceptor' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'interceptor' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'interceptor' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         myComment <- 'Transparent forwarding.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'interceptor' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'interceptor' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         prefixingSender = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'prefixingSender' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals prefixingSender.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         prefixingSender = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'prefixingSender' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits prefixingSender.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'prefixingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'prefixingSender' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'prefixingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         prefix <- 'alt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'prefixingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         processLoggingSender = bootstrap define: bootstrap stub -> 'globals' -> 'processLoggingSender' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals loggingSender copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processLoggingSender' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processLoggingSender.

CopyDowns:
globals loggingSender. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         indents <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals processLoggingSender parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: indenting\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         abortIndent = ( |
            | 
            finishIndent "right?").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy indents: indents copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: indenting\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         finishIndent = ( |
            | 
            indents if: process this
                    IsPresentPut: [|:i| i pred]
                    AndDo: [|:i| i succ]
                    IfAbsentDo: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: loggging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         indentBy: i = ( |
            | 
            ((' ' copySize: i * 2), process this causeOfBirth, ' ') print.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: loggging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         logAbort: aMessage = ( |
            | 
            indentBy: abortIndent.
            resend.logAbort: aMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: loggging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         logFinish: aMessage = ( |
            | 
            indentBy: finishIndent.
            resend.logFinish: aMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: loggging\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         logStart: aMessage = ( |
            | 
            indentBy: startIndent.
            resend.logStart: aMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'loggingSender' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'processLoggingSender' -> 'parent' -> () From: ( | {
         'Category: indenting\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         startIndent = ( |
            | 
            indents if: process this
                    IsPresentPut: [|:i| i succ]
                    AndDo: [|:i| i]
                    IfAbsentPut: 0
                    AndDo: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: messages and activations\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         transmitter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transmitter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transmitter.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         transmitter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transmitter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transmitter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transmitter' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transmitter' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transmitter' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         receivers.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prefixingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sender' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prefixingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = 'a prefixingSender'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prefixingSender' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         send: aMessage = ( |
            | 
            aMessage selector: prefix, aMessage selector capitalize.
            resend.send: aMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transmitter' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForTargets: targets = ( |
            | 
            interceptor _Clone interceptorTarget: (copy receivers: targets)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transmitter' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( | {
                 'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
                
                 x.
                } 
            | 
            x: copyForTargets: (3 & 'abc') asList.
            x print.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transmitter' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transmitter' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = 'a transmitter'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transmitter' -> () From: ( | {
         'ModuleInfo: Module: interceptor InitialContents: FollowSlot'
        
         send: aMessage = ( |
            | 
            receivers do: [ | :r | (aMessage receiver: r) send ].
            self).
        } | ) 



 '-- Side effects'

 globals modules interceptor postFileIn
