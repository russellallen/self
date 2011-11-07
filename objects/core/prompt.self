 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         prompt = ( |
            | process this prompt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot'
        
         prompt = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules prompt.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot'
        
         myComment <- 'Self-level prompt'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            snapshotAction addSchedulerInitialMessage: (
              message copy receiver: prompt Selector: 'mainInputLoop').
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         continuing <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: suspending\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         dummyInputLoopProcess = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'prompt' -> 'dummyInputLoopProcess' -> () From: ( |
             {} = 'Comment: I am a dummy that understands
suspend and resume so that there
is a sane default for perProcessGlobals prompt inputLoopProcess\x7fModuleInfo: Creator: traits prompt dummyInputLoopProcess.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: InitializeToExpression: (traits prompt dummyInputLoopProcess)'
        
         inputLoopProcess <- bootstrap stub -> 'traits' -> 'prompt' -> 'dummyInputLoopProcess' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: user interface\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         prompt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits prompt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'prompt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         stopping <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         updateUI <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         waitingForInput <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: prompt InitialContents: InitializeToExpression: (perProcessGlobals prompt)\x7fVisibility: public'
        
         prompt <- bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: special input\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         applyModifier: mod To: cmd IfFail: errBlk = ( |
             n <- 0.
             res <- ''.
             s1 <- ''.
             s2 <- ''.
            | 
            '^' != mod first ifTrue: [^ errBlk value].
            s1: (mod copyFrom: 1).  "Skip the '^'."
            n: (s1 keyOf: '^' IfAbsent: -1).
            -1 != n ifTrue: [
                s2: (s1 copyFrom: 1 + n).
                s1: (s1 copySize: n).
            ].
            insert: s1 InsteadOf: s2 In: cmd IfNoMatch: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         continuationPrompt: n = ( |
            | 
            (continuationPromptPrefix: n), continuationPromptSuffix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         continuationPromptPrefix: n = ( | {
                 'ModuleInfo: Module: prompt InitialContents: FollowSlot'
                
                 ws.
                } 
            | 
            ws: ((regularPrompt: n) size - continuationPromptSuffix size)
                max: 0.
            '' padOnLeft: ws).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         continuationPromptSuffix = '>> '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> 'dummyInputLoopProcess' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot'
        
         resume.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> 'dummyInputLoopProcess' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot'
        
         suspend.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: special input\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         echoCommand: cmd = ( |
            | 
            '"' print. cmd print. '"' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         evalInput: s CanContinue: canContinue NeedToContinue: need = ( |
             historyEntry.
             res.
            | 
            historyEntry: history addCmd: s.
            res: s evalInContext: receiver 
                        FileName: '<the prompt>'
              IfFail: [ | :err |
                  err prematureEOF ifTrue: [
                     "canContinue && ['prematureEndOfInput' isPrefixOf: e]"
                     "Avoid having multiline commands take up >1 history entries."
                      history removeEntry: historyEntry. 
                      need needToContinue: true. 
                      ^ self.
                  ] False: [| spaces |
                      (('' padOnRight:
                        (regularPrompt: history nextID pred) size +
                          err start x )
                       , '^ ', err printString) printLine.
                      process this abort.
                  ] 
              ].
            historyEntry result: res.
            showResult: res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: special input\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         getPreviousCommand = ( |
            | 
            (history get: (history nextID - 1)) command).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: special input\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         handleSpecialInput: inp AsyncBlk: asyncBlk = ( |
             echo <- bootstrap stub -> 'globals' -> 'false' -> ().
             input <- ''.
             input2 <- ''.
            | 
            input: inp.
            preferences useAmpersandToBackground && ['&' = input last] ifTrue: [
                asyncBlk value.
                input: input copyWithoutLast.
            ].
            input2: input shrinkwrapped.
            ('!!' isPrefixOf: input2) ifTrue: [
                echo: true.
                input: getPreviousCommand.
                2 < input2 size ifTrue: [input: input, (input2 copyFrom: 2)].
            ] False: [
            '^' = input2 first ifTrue: [
                echo: true.
                input: (applyModifier: input2 To: getPreviousCommand IfFail: [
                    'Modifier failed' printLine.
                    echo: false.
                    '0'.   "Safe string to evaluate."
                 ]).
            ] False: [
            '!' = input2 first ifTrue: [| str1 <- ''. n <- 0. |
                str1: (input2 copyFrom: 1).
                n: (str1 asIntegerIfFail: nil).
                n ifNil: [   "Not !number, so must be !prefix."
                    input: 'history executePrefix: \'', str1, '\''.
                ] IfNotNil: [
                    input: 'history execute: ', n printString.
                ].
            ]]].
            echo ifTrue: [echoCommand: input].
            input).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         inputLoop = ( |
             input <- ''.
            | 
            inputLoopProcess: process this.
            stopping:        false.
            waitingForInput: false.
            continuing:      false.
            stdin reset.
            stdout reset.
            [stopping] whileFalse: [ | newInput <- ''. |
                waitingForInput: true.
                printPrompt.
                newInput: stdin readLine.
                waitingForInput: false.
                input: input, newInput.
                stdin atEOF ifTrue: [
                    stdin resetEOF.
                    input isEmpty ifTrue: ['\n' print. ^ self].
                    '\n' print. 
                    input: ''.
                    continuing: false.
                ] False: [
                    input: (processInput: input).
                ].
            ].
            'stopping' printLine.
            scheduler stop.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: special input\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         insert: s1 InsteadOf: s2 In: str IfNoMatch: noMatchBlk = ( |
            | 
            1 + (str size - s1 size) do: [|:i|
                (s1 isPrefixOf: (str copyFrom: i)) ifTrue: [
                    ^ (str copySize: i), s2, (str copyFrom: i + s1 size).
                ].
            ].
            noMatchBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         mainInputLoop = ( |
            | 
            inputLoop.
            scheduler stop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         notify = ( |
            | waitingForInput ifTrue: [ printPrompt ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         printContinuationPrompt: n = ( |
            | (continuationPrompt: n) print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         printPrompt = ( |
            | 
            continuing ifTrue: [ printContinuationPrompt: history nextID ]
                        False: [ printRegularPrompt: history nextID ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         printRegularPrompt: n = ( |
            | (regularPrompt: n) print. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         processInput: inp = ( |
             async <- bootstrap stub -> 'globals' -> 'false' -> ().
             input <- ''.
             msg.
             needToContinue.
             p.
            | 
            input: inp.
            input isAllWhiteSpace ifTrue: [^ ''].
            input: (handleSpecialInput: input AsyncBlk: [async: true]).
            needToContinue: (| parent* = traits clonable.
                               needToContinue <- false |) copy.
            msg: (message copy receiver: self
                               Selector: 'evalInput:CanContinue:NeedToContinue:'
                                   With: input
                                   With: async not
                                   With: needToContinue).
            p: (process copySend: msg).
            p causeOfBirth: input.
            p resume.
            async ifTrue: [
                p objectID printLine.
                continuing: false.
                ^ ''.  " can't continue input past & "
            ].
            p waitForSuspension.
            continuing: needToContinue needToContinue.
            continuing ifTrue: [
                 input: input, '\n'.
            ] False: [
                 input: ''.
                 updateUI ifTrue: [ui update].
            ].
            input).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         promptHistory: n = ( |
            | ' ', n printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         promptPrefix = '\"Self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         promptSuffix = '\" '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         quit = ( |
            | stopping: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | reflect: shell).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: promptPrinting\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         regularPrompt: n = ( |
            | 
            promptPrefix, (promptHistory: n), promptSuffix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: private'
        
         showResult: res = ( |
            | (reflect: res) name printLine. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'ModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | scheduler start).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'prompt' -> () From: ( | {
         'Category: suspending\x7fComment: The prompt interferes with other REPL like users of
stdin/stdout. To avoid this, wrap your REPL in a block
and use this method to temporarily suspend the prompt
loop.\x7fModuleInfo: Module: prompt InitialContents: FollowSlot\x7fVisibility: public'
        
         suspendWhile: b = ( |
             t.
            | 
            inputLoopProcess suspend. stdin reset. t: b value. stdin reset. inputLoopProcess resume. printPrompt. t).
        } | ) 



 '-- Side effects'

 globals modules prompt postFileIn
