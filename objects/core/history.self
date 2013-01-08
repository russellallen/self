 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         history = ( |
            | process this history).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         historyListEntry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'historyListEntry' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals historyListEntry.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         command <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         id <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: user interface\x7fModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         historyListEntry = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'historyListEntry' -> () From: ( |
             {} = 'Comment: A historyListEntry is a triple: <id><command string><result object>.\x7fModuleInfo: Creator: traits historyListEntry.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'historyListEntry' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         result <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'historyListEntry' -> 'result' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals historyListEntry result.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'historyListEntry' -> 'result' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'historyListEntry' -> 'result' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'historyListEntry' -> 'result' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         storeStringNeeds = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         history = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules history.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         myComment <- 'Support for a command history mechanism allowing commands and their results
             to be inspected and re-executed.\"

            \"You may find it convenient to add the following to your shortcuts object:

                ! n      = ( history execute: n ).
                ? n      = ( history getResult: n ).
                hist     = ( history printRecords ).
                hist: n  = ( history printRecords: n ).

                redo     = ( |
                    undefinedSelector: sel Type: t Delegatee: d MethodHolder: m
                      Arguments: a = ( | globalAccess = shell |
                          globalAccess history executePrefix: sel ).
                | ).

                ``Note: the redo shortcut allows you to say \'redo fi\' to invoke
                    history executePrefix: \'fi\'
                  but this trick only works for prefixes that are also valid unary
                  selectors; ie, numbers and symbols will not work.  For those,
                  history executePrefix: must explicitly be sent.\'\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            history pendingEntry: historyListEntry).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         history = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals perProcessGlobals history.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         histList <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> () From: ( | {
         'Comment: number of records to keep\x7fModuleInfo: Module: history InitialContents: InitializeToExpression: (100)\x7fVisibility: private'
        
         limit <- 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: InitializeToExpression: (80)\x7fVisibility: public'
        
         lineWidth <- 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> () From: ( | {
         'Comment: prompt accesses nextID\x7fModuleInfo: Module: history InitialContents: InitializeToExpression: (0)\x7fVisibility: publicReadPrivateWrite'
        
         nextID <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: user interface\x7fModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         historyList = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( |
             {} = 'Comment: The history list records commands typed by the user, allowing a command
       to be re-executed or its result to be inspected. The number of commands
       retained can be adjusted.\x7fModuleInfo: Creator: traits historyList.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'historyList' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: InitializeToExpression: (nil \"historyListEntry\")\x7fVisibility: private'
        
         pendingEntry <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'process' -> () From: ( | {
         'Category: per-process globals\x7fModuleInfo: Module: history InitialContents: InitializeToExpression: (perProcessGlobals history)\x7fVisibility: public'
        
         history <- bootstrap stub -> 'globals' -> 'perProcessGlobals' -> 'history' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         addCmd: cmd = ( | {
                 'ModuleInfo: Module: history InitialContents: FollowSlot'
                
                 entry.
                } 
            | 
            "Used by the prompt to record a command in the history list,
             before the result has been determined."
            entry: (historyListEntry copy id: nextID) command: cmd.
            histList addLast: entry.
            nextID: nextID succ.
            purge.
            pendingEntry: entry.
            entry).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         addCmd: cmd Result: v = ( |
            | 
            "Record a command in the history list."
            (addCmd: cmd) result: v.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'Category: fileOut\x7fModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy histList: histList copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         execute: n = ( |
            | 
            "Execute the nth record in the command history."
            executeEntry: get: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         executeEntry: entry = ( |
            | 
            "If there is a pending entry, replace that entry's command
             with the command found in the history list.  Execute the command."
            pendingEntry command: entry command.
            pendingEntry: historyListEntry copy.
            entry execute).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         executePrefix: pre = ( |
            | 
            "Executes the most recent command beginning with 'pre'."
            executeEntry: getPrefix: pre).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         freeResults = ( |
            | 
            "Free pointers to result objects"
            histList do: [ | :entry | entry freeResult ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         get: n = ( |
            | 
            "Return the entry for the nth command in the command history."
            histList do: [| :entry |
                entry id = n ifTrue: [ ^ entry ].
            ].
            error:
                n printString, ' is not currently in the command history.\n',
                '  Note: Only ', limit printString,
                '  records are currently stored in the command history. Use\n',
                '      history keep: <length>\n',
                '  to adjust the history length').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         getPrefix: pre = ( |
            | 
            "Return the entry for the most recent command beginning with 'pre'."
            histList reverseDo: [ | :entry |
                (pre isPrefixOf: entry command) ifTrue: [ ^ entry ].
            ].
            error: 'A command beginning with \'', pre,
                   '\' is not currently in the command history').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         getResult: n = ( |
            | 
            "Return the result of nth command in the command history."
            (get: n) result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         keep: n = ( |
            | 
            "Set the number of records to retain in the history list."
            n < 0 ifTrue: [
                error:
                  'You cannot keep a negative number of commands in the history'
            ].
            limit: n.
            purge).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         last: n Do: b = ( | {
                 'ModuleInfo: Module: history InitialContents: FollowSlot'
                
                 h.
                } 
            | 
            "Evaluate the given block on the last n records in the command history."
             h: histList asVector.
             (h size - n max: 0) upTo: h size Do: [| :i | b value: h at: i ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         printRecords = ( |
            | 
            "Print all the records in the command history."
            histList do: [ | :entry | entry statePrintString printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         printRecords: n = ( |
            | 
            "Print the last n records of in command history."
            last: n Do: [| :entry | entry statePrintString printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         purge = ( |
            | 
            [ histList size > limit ] whileTrue: [ histList removeFirst ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         removeEntry: entry = ( |
            | 
            "Used by the prompt to avoid having multiline commands take up
             several entries in the history list."
            histList remove: entry IfAbsent: [ ^ self ].
            histList isEmpty ifTrue: [ nextID: entry id. ]
                              False: [ nextID: histList last id succ. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | 
            "Remove all the records in the command history."
            histList removeAll.
            pendingEntry: historyListEntry.
            nextID: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyList' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 'max length ', limit printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         context = ( |
            | reflect: shell).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         execute = ( | {
                 'ModuleInfo: Module: history InitialContents: FollowSlot'
                
                 result.
                } 
            | 
            ('"', command, '"')  printLine.
            result: command evalInContext: context FileName: '<history>'.
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         freeResult = ( |
            | result: historyListEntry result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'historyListEntry' -> () From: ( | {
         'ModuleInfo: Module: history InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            '[', id printString, ']\t', 
            ((command copyAtMostWithEllipsis: (history lineWidth - 8  max: 0))
            asString copyMutable mapBy: [|:ch| ch = '\n' ifTrue: ' ' False: ch]).
            "Sending 'asString' above is necessary! Else the 'mapBy:' will 
             mutate the 'command' object.").
        } | ) 



 '-- Side effects'

 globals modules history postFileIn
