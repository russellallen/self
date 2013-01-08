 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stderr = ( |
            | process this stderr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stdin = ( |
            | process this stdin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         stdout = ( |
            | process this stdout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot'
        
         stdin = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules stdin.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         postFileIn = ( |
            | 
            process initializeStdioFiles.
            snapshotAction addPostReadMessage: (
              message copy receiver: process Selector: 'initializeStdioFiles').
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'stdin' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: concurrency\x7fComment: Holds the real prototype for objects
like stdout which are lookuped up in corrent
process by methods in defaultBehavior.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         perProcessGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals perProcessGlobals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         prompt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'prompt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals perProcessGlobals prompt.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: per-process globals\x7fComment: Either the ui2 event that caused this process to be born or nil. \x7fModuleInfo: Module: stdin InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         birthEvent.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: stdin InitialContents: InitializeToExpression: (os_file stderr)\x7fVisibility: public'
        
         stderr <- bootstrap stub -> 'traits' -> 'unixFile' -> 'stderr' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: stdin InitialContents: InitializeToExpression: (os_file stdin)\x7fVisibility: public'
        
         stdin <- bootstrap stub -> 'traits' -> 'unixFile' -> 'stdin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: stdin InitialContents: InitializeToExpression: (os_file stdout)\x7fVisibility: public'
        
         stdout <- bootstrap stub -> 'traits' -> 'unixFile' -> 'stdout' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         userQuery = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals userQuery.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Ask the user the given question and return the list that
the user replies. The list is a sequence of string separated
by CR\'s and, for the TTY version, ending with an empty line.
For the dialog box version, the given list of strings is
presented as the default.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         askList: queryText DefaultItems: defaultItems = ( |
             items.
            | 
            items: list copyRemoveAll.
            askViaTTY ifTrue: [| line |
                queryText printLine.
                defaultItems isEmpty ifFalse: [
                  'Suggestions:' printLine.
                  defaultItems do: [| :suggestion | '    ' print. suggestion printLine].
                ].
                '[Type one item per line, ending with an empty line]' printLine.
                line: stdin preemptReadLine.
                [line isEmpty] whileFalse: [
                    items addLast: line.
                    line: stdin preemptReadLine.
                ].
            ] False: [| d <- ''. q. r |
                defaultItems do: [| :item | d: d, item, '\n' ].
                q: queryText, '\n[Enter one item per line]'.
                r: userQueryMorph askString: q
                              DefaultAnswer: d
                                      Event: process this birthEvent.
                items: (r asTextLines lines asList) copyFilteredBy: [| :s | s size > 0 ].
            ].
            items asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Ask the user the given multiple choice question and return the
result corresponding to the user\'s choice. The possible choices
are strings (potentially multiline) and results is a list of
values to be returned with the given choice is selected. In the
TTY, the choices appear as a menu of numbered choices. In the
UI, they appear as button labels.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         askMultipleChoice: queryText Choices: choices Results: results = ( |
             r.
            | 
            askViaTTY ifTrue: [| index. ok <- false |
                [ok] whileFalse: [
                    ok: true.
                    queryText printLine.
                    choices asVector do: [| :c. :i |
                        '    ' print. i succ print. '. ' print. c printLine.
                    ].
                    '[Type the number of your selection]' printLine.
                    index: stdin preemptReadLine asIntegerIfFail: [
                        ok: false.
                        'That\'s not a number; please try again.' printLine.
                        1.
                    ].
                    index: index pred.
                    r: results asVector at: index IfAbsent: [
                        ok: false.
                        'That number is out of range; please try again.' printLine.
                        nil.
                    ].
                ].
            ] False: [
                r: userQueryMorph askMultipleChoice: queryText
                                            Choices: choices
                                            Results: results
                                              Event: process this birthEvent.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Ask the user the given question and return the user\'s reply.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         askString: queryText = ( |
            | 
            askViaTTY ifTrue: [
                queryText printLine.
                stdin preemptReadLine.
            ] False: [
                userQueryMorph askString: queryText
                           DefaultAnswer: ''
                                   Event: process this birthEvent.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Ask the user the given question and return the user\'s reply.
Provide the given string as the default answer.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         askString: queryText DefaultAnswer: default = ( |
            | 
            askViaTTY ifTrue: [| reply |
                queryText print.
                default isEmpty ifFalse: [
                    ('[RET => ', default, '] ') print.
                ].
                reply: stdin preemptReadLine.
                reply isEmpty ifTrue: default False: reply.
            ] False: [
                userQueryMorph askString: queryText
                           DefaultAnswer: default
                                   Event: process this birthEvent.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Return true if the user is queried via the TTY, false if via
dialog boxes in the graphic user interface.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         askViaTTY = ( |
             h.
            | 
            "If running in scheduler, cannot put up morph because
             that uses semaphores to lock data structures. -- dmu 1/02"

            scheduler inScheduler ifTrue: [^ true].

            h: process this hand.
            ( (h isNotNil ) &&
             [(h isInWorld) &&
             [(h world hands includes: h)  &&
             [(h world stepProcess isNotNil)]]]) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: \"Return true if the user replies yes, false if he replies no.\"\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         askYesNo: queryText = ( |
            | 
            askViaTTY ifTrue: [| reply |
                queryText print.
                reply: stdin preemptReadLine.
                (reply isEmpty not) && [reply first uncapitalize = 'y'].
            ] False: [
                userQueryMorph askYesNo: queryText
                                  Event: process this birthEvent.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'ModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Present the given report text to the user.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         report: reportText = ( |
            | 
            "Performed from reportAndContinue:"
            askViaTTY ifTrue: [
                reportText printLine.
            ] False: [
                userQueryMorph
                  report: reportText
                   Event: process this birthEvent.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Report the text but return right away.\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         reportAndContinue: reportText = ( |
            | 
            scheduler isRunning ifFalse: [ reportText printLine. ^ self ].
            (message copy receiver: self Selector: 'report:' With: reportText) fork.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Show the showText for n seconds -- Mario 1/27/95\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         show: showText ForSecs: n = ( |
            | 
            askViaTTY ifTrue: [
              showText printLine.
            ] False: [
              userQueryMorph show: showText
                            While: [times delay: n * 1000]
                            Event: process this birthEvent.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Show the showText while doing the whileBlock -- Ungar, 1/22/95\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         show: showText While: whileBlock = ( |
            | 
            askViaTTY ifTrue: [
              ('Starting: ', showText, '...') printLine.
              whileBlock onReturn: [ ('Finished: ', showText) printLine ].
            ] False: [
              userQueryMorph show: showText While: whileBlock Event: process this birthEvent.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Show the showText to all users for n seconds -- Mario 1/27/95\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         showEverybody: showText ForSecs: n = ( |
            | 
            desktop isOpen ifFalse: [
              showText printLine.
            ] True: [
              userQueryMorph showEverybody: showText
                                     While: [times delay: n * 1000].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'userQuery' -> () From: ( | {
         'Category: user queries\x7fComment: Show the showText to all users while doing the whileBlock -- Ungar, 1/22/95\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         showEverybody: showText While: whileBlock = ( |
            | 
            desktop isOpen ifFalse: [
              ('Starting: ', showText, '...') printLine.
              whileBlock onReturn: [ ('Finished: ', showText) printLine ].
            ] True: [
              userQueryMorph showEverybody: showText While: whileBlock.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: preemption\x7fComment: not safe for general use: only usable within interrupt,
     when it is guaranteed that there will be no other access\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         preemptReadLine = ( | {
                 'ModuleInfo: Module: stdin InitialContents: FollowSlot'
                
                 input.
                } 
            | 
            saveState: [ input: readLine ].
            input).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         hand = ( |
            | 
            birthEvent ifNotNil: [ birthEvent sourceHand ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'process' -> () From: ( | {
         'Category: creating\x7fComment: Used by stdin module to initialize slots for this OS.
--0 dmu 6/99\x7fModuleInfo: Module: stdin InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeStdioFiles = ( |
            | 
            stdin:   os_file stdin.
            stdout:  os_file stdout.
            stderr:  os_file stderr).
        } | ) 



 '-- Side effects'

 globals modules stdin postFileIn
