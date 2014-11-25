 '0.1.0'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot\x7fVisibility: public'
        
         log = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         debug: s = ( |
            | debug: s For: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         debug: s For: p = ( |
            | 
            log: s Severity: levels debug For: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: handlers\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         dispatcher = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log dispatcher.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         abortHandlingProcess = ( |
            | running abortIfLive. running: deadProcess. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         add: handler = ( |
            | 
            handlers add: handler. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         deadProcess = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> 'deadProcess' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log dispatcher deadProcess.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> 'deadProcess' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         abortIfLive = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> 'deadProcess' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         isAlive = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         dispatch: entry = ( |
            | 
            ensureRunning. q add: entry. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         ensureRunning = ( |
            | 
            running isAlive ifFalse: [startRunning]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         handleLoop = ( |
            | 
            [|e|
            e: q removeFirst.
            handlers do: [|:h | h handle: e].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (sharedSet copy)'
        
         handlers = sharedSet copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         hup = ( |
            | abortHandlingProcess ensureRunning).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (sharedQueue copy)'
        
         q = sharedQueue copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         remove: handler = ( |
            | 
            handlers findFirst: [|:h| h name = handler name]
                     IfPresent: [|:h| handlers remove: h].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         removeAll = ( |
            | handlers removeAll. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (log dispatcher deadProcess)'
        
         running <- bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> 'deadProcess' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'dispatcher' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         startRunning = ( |
            | 
            running: (
              process copySend: (message copy receiver: self Selector: 'handleLoop')
                  CauseOfBirth: 'log dispatcher') resume. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: entries\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         entry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log entry.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (\'\')'
        
         logger <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (\'\')'
        
         message <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log entry parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         ansiString = ( |
            | 
            '[', timestamp compactPrintString, '] ', 
            severity asColorAnsiString, ' -- ', 
            (logger asString != '' ifTrue: [logger asString, ': '] 
                                    False: ''), 
            message asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         printString = ( |
            | 
            '[', timestamp compactPrintString, '] ', 
            severity asString, ' -- ', 
            (logger asString != '' ifTrue: [logger asString, ': '] 
                                    False: ''), 
            message asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> () From: ( | {
         'Comment: a warning\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         warn = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'warn' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log levels warn.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (log levels warn)'
        
         severity <- bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'warn' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'entry' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (time copyFromString: \'Thursday, 1 January 1970, 10:00:00\')'
        
         timestamp <- time copyFromString: 'Thursday, 1 January 1970, 10:00:00'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         error: s = ( |
            | error: s For: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         error: s For: p = ( |
            | 
            log: s Severity: levels error For: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         fatal: s = ( |
            | fatal: s For: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         fatal: s For: p = ( |
            | 
            log: s Severity: levels fatal For: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         info: s = ( |
            | 
            info: s For: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         info: s For: p = ( |
            | 
            log: s Severity: levels info For: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: levels\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         levels = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log levels.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         baseLevel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log levels baseLevel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         < l = ( |
            | intValue < l intValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         = l = ( |
            | intValue = l intValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asColorAnsiString = ( |
            | asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         hash = ( |
            | intValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         o* = bootstrap stub -> 'mixins' -> 'ordered' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> () From: ( | {
         'Comment: low-level information for developers\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         debug = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'debug' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log levels debug.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'debug' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asString = ( |
            | 'debug').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'debug' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         intValue = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'debug' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> () From: ( | {
         'Comment: a handleable error condition\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         error = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'error' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log levels error.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'error' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asColorAnsiString = ( |
            | 
            '\x1b[31m', asString, '\x1b[0m').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'error' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asString = ( |
            | 'error').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'error' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         intValue = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'error' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> () From: ( | {
         'Comment: an unhandleable error that results in a crash\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         fatal = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'fatal' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log levels fatal.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'fatal' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asColorAnsiString = ( |
            | 
            '\x1b[37;41m', asString, '\x1b[0m').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'fatal' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asString = ( |
            | 'fatal').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'fatal' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         intValue = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'fatal' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> () From: ( | {
         'Comment: generic (useful) information about system operation\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         info = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'info' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log levels info.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'info' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asString = ( |
            | 'info').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'info' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         intValue = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'info' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'warn' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asColorAnsiString = ( |
            | '\x1b[33m', asString, '\x1b[0m').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'warn' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         asString = ( |
            | 'warn').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'warn' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         intValue = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'warn' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'levels' -> 'baseLevel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         log: entry = ( |
            | 
            "If schedule is not running, fall
            back on simple printing to stdout"
            scheduler isRunning
             ifTrue: [dispatcher dispatch: entry]
              False: [('*unlogged* ', entry printString) printLine].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         log: e Severity: s For: p = ( |
            | 
            log: (((entry copy message: e )
                 severity: s )
                 logger: p)
                 timestamp: time current.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: handlers\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         prototypeHandlers = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> () From: ( |
             {} = 'Comment: Useful filters\x7fModuleInfo: Creator: globals log prototypeHandlers.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         allToSTDOUT = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'allToSTDOUT' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log prototypeHandlers allToSTDOUT.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'allToSTDOUT' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         handle: entry = ( |
            | 
            entry printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'allToSTDOUT' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         name = 'allToSTDOUT'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         baseHandler <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log prototypeHandlers baseHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'allToSTDOUT' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         handle: e = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         name = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         errorsToSTDERR = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'errorsToSTDERR' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log prototypeHandlers errorsToSTDERR.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'errorsToSTDERR' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         handle: e = ( |
            | 
            (e severity >= log levels error) ifTrue: [ 
               stderr isOpen ifTrue: [stderr write: e asString, '\n']].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'errorsToSTDERR' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         name = 'errorsToSTDERR'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'errorsToSTDERR' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         simplePrinting = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'simplePrinting' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log prototypeHandlers simplePrinting.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'simplePrinting' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         handle: e = ( |
            | 
            stderr isOpen
              ifTrue: [stderr write: e message, 
                        (e message last = '\n' ifTrue: '' False: '\n')].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'simplePrinting' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         name = 'simplePrinting'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'simplePrinting' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         systemInfoToSTDERR = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'systemInfoToSTDERR' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals log prototypeHandlers systemInfoToSTDERR.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'systemInfoToSTDERR' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         handle: e = ( |
            | 
            (e severity >= log levels info) &&
            [e logger = ''] && 
            [stderr isOpen]
              ifTrue: [stderr write: (e copy ansiString replace: '\n' With: ' '), '\n'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'systemInfoToSTDERR' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         name = 'systemInfoToSTDERR'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'systemInfoToSTDERR' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'globals' -> 'log' -> 'prototypeHandlers' -> 'baseHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: helpful methods\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         resetToDefault = ( |
            | 
            dispatcher removeAll. dispatcher add: prototypeHandlers systemInfoToSTDERR. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: helpful methods\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         resetToSilence = ( |
            | dispatcher removeAll. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: helpful methods\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         resetToSimplePrinting = ( |
            | dispatcher removeAll. dispatcher add: prototypeHandlers simplePrinting. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         warn: s = ( |
            | 
            warn: s For: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'log' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         warn: s For: p = ( |
            | 
            log: s Severity: levels warn For: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         systemLog = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules systemLog.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            log resetToDefault.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: InitializeToExpression: (\'0.1.0\')\x7fVisibility: public'
        
         revision <- '0.1.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'systemLog' -> () From: ( | {
         'ModuleInfo: Module: systemLog InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules systemLog postFileIn
