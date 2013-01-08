 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: debugger InitialContents: FollowSlot'
        
         debugger = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals debugger.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         activationNum <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'Comment: holds the current process\x7fModuleInfo: Module: debugger InitialContents: InitializeToExpression: (process)\x7fVisibility: private'
        
         cp <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         enableFilter <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         lexicalTracing <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         numberOfRedundantTopActivations <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: debugger InitialContents: FollowSlot'
        
         debugger = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits debugger.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'debugger' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         showExpressionStack <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         showFile <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'Comment: options for printing out an activation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         showMethod <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         showMethodHolder <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         showStatus <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         trimmedBottomActivation <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         trimmedTopActivation <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot'
        
         debugger = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules debugger.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot'
        
         myComment <- 'This tty based debugger enables the user to attach Self processes for 
             inspection and simple debugging. 

             List of commands:

             Attach/detach:
              attach          -- Attach the first element in zombies.
              attach: procID  -- Attach the process with procID
                                 (object id number or process).
              detach          -- Detach the process.

             Stepping:
              step[:n]        -- Execute (n) non-\'trivial\' bytecodes.
                                 (push of constants and sends to slots in lexical scope
                                  of the current activation are skipped).
              stepi[:n]       -- Execute (n) bytecodes and stop.

              next[:n]        -- Execute (n) non-\'trivial\' steps in this activation.
              nexti[:n]       -- Execute (n) bytecodes in this activation.
              nextb[:n]       -- Execute (n) non-\'trivial\' steps in this activation,
                                 stepping into blocks.  (May occasionally result in
                                 very long waits.)

              finish          -- Finish executing this activation. 
              cont            -- Continue executing.

             Displaying:
              show            -- Displays this activation.
              show: n         -- Displays the n\'th activation.
              status          -- Display the status line for the process. 
              trace           -- Display the trimmed processStack.
              traceLex        -- Display the trimmed processStack, following lexical links
                                 rather than dynamic links for block activations.
              lookup: name    -- Display the result of a lookup from within
                                 this activation.
              locals          -- Display the local slots in this activation and
                                 its lexical scopes.

             Stack walking:
              up[:n]          -- Go up one (n) activation(s).
              down[:n]        -- Go down one (n) activation(s).
              upLex           -- Go up to the activation which is the lexical parent
                                 of this activation. Only valid for block activations.

             Stack manuipulation:
              revert          -- Pop all activations below this activation and
                                 set the bytecode index before the active send.
              return: obj     -- Revert the stack to this activation and return 
                                 obj as the result of the active send.
              return          -- Revert the stack to this activation and return 
                                 from the active send.
              retry           -- Revert the stack to this activation and 
                                 reevaluate the active send.

            Filtering:
             enableFilter: bool -- turn file filtering on and off
             lexicalTracing: bool -- select lexical tracing over dynamic tracing, or not

             Useful debugger shortcuts:
               lookup = (|
                    undefinedSelector: sel 
                                 Type: t
                            Delegatee: d 
                         MethodHolder: m
                            Arguments: a = (| receiver = shell | receiver lookup: sel)
               |).'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            shell _RemoveSlot: 'parent' IfFail: [].
            shell db: shell db copy.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'shell' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (debugger)'
        
         db* <- bootstrap stub -> 'globals' -> 'debugger' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         activationString: activationNum = ( | {
                 'ModuleInfo: Module: debugger InitialContents: FollowSlot'
                
                 activation.
                }  {
                 'ModuleInfo: Module: debugger InitialContents: FollowSlot'
                
                 string <- ''.
                } 
            | 
            activation: cp at: activationNum.
            activation isReflecteeMethodActivation  ifFalse: [
                activation receiver isReflecteeBlock
                    ifTrue: [ string: 'block ' ]].
            string, 'activation:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: attaching\x7fComment: Attach a process. processID should either be a process or
         an object id number on a process\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         attach: processID = ( |
             stack <- ((bootstrap stub -> 'globals') \/-> 'processStack') -> ().
            | 
            detach.
            cp: identifyProcess: processID IfFail: [
                'could not find process.' printLine.
                ^self].

            cp isAlive ifFalse: [
                'a dead process cannot be attached.' printLine.
                ^self].

            stack: cp stack.
            trimTop: stack.
            trimBottom: stack.

            ('Process ', cp objectID,
            ' has been attached to the debugger.') printLine.

            cp hasError ifTrue: [
                 ('"', cp causeOfError errorString, '"') printLine ].

            show).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fComment: Continue execution\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         cont = ( |
            | 
             stepCommandDo: [cp continue. cp waitForSuspension]
            Iterations: 1 SkipSimpleBytecodes: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: attaching\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         detach = ( |
            | 
            cp = process ifFalse: [ cp: process ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         down = ( |
            | 
            inspectCommand: 'down' Do: [ 
                show: filteredActivationIndexDownFrom: activationNum pred]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         down: n = ( |
            | inspectCommand: 'down'  Do: [ show: activationNum - n  ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         expressionStackString: activation = ( |
             string <- 'Expression stack: '.
            | 
            activation expressionStack do: [| :element |
                string: string, '\n\t',
                        ((reflect: element) safeNameSize: 50) ].
            string).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         fileInfoString: activation = ( |
             filename <- ''.
             selfRoot <- ''.
             suffix = '.self'.
            | 
            filename: activation file.

            "Remove the self working dirctory prefix"
            selfRoot: bootstrap selfObjectsWorkingDir, '/'.
            filename: filename copyWithoutPrefix: selfRoot.

            "Remove the .self extension"
            filename: filename copyWithoutSuffix: suffix.

            'File: ', filename, ':', activation line printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         filteredActivationIndexDownFrom: start = ( | {
                 'ModuleInfo: Module: debugger InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: cp stack.
            filteredActivationIndexFrom: start To: 0 By: -1 In: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         filteredActivationIndexFrom: start To: stop By: step In: s = ( |
            | 
            start to: stop By: step Do: [|:i| 
                enableFilter not || [cp isFrameShown: s at: i] ifTrue: [^i]
            ].
            stop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         filteredActivationIndexUpFrom: start = ( | {
                 'ModuleInfo: Module: debugger InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: cp stack.
            filteredActivationIndexFrom: start To: s size pred By: 1 In: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         findActivationIndex: activation From: index IfAbsent: absentBlk = ( |
            | 
            cp stack findFirst: [|:a. :i| (i >= index) && [ a = activation]]
                     IfPresent: [|:a. :i| i]
                      IfAbsent: absentBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fComment: Finish current activation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         finish = ( |
            | 
             stepCommandDo: [cp finish: cp at: activationNum]
            Iterations: 1 SkipSimpleBytecodes: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: attaching\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         identifyProcess: processID IfFail: failBlk = ( | {
                 'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (mirrors mirror)'
                
                 mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> ().
                } 
            | 
            mirror: reflect: processID.
            mirror isReflecteeProcess ifTrue: [^processID].
            mirror isReflecteeInteger ifTrue: [
                mirror: reflect: processID asIfFail: failBlk.
                mirror isReflecteeProcess ifTrue: [^mirror reflectee]].
            failBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         ifProcessValidDo: cmd = ( |
            | 
            cp = process ifTrue: ['no process is attached.' printLine. ^self].
            cp isAlive ifFalse: ['process is dead.' printLine. ^self].
            cmd value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         inspectCommand: name Do: cmd = ( |
            | ifProcessValidDo: cmd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         isMatching: frameA With: frameB = ( |
            | 
            frameA = frameB ifTrue: [^true].
            frameB isReflecteeMethodActivation ifTrue: [^false].
            frameB doLexicalScopes: [|:f| f = frameA ifTrue: [^true] ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         lastByteCodeError = ( |
            | 
            ('Sorry, cannot return from the last bytecode. \n',
             'The current implementation disallows a breakpoint ',
             'after the last byte code.') printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         locals = ( |
            | 
            inspectCommand: 'locals' Do: [| stack |
             stack: cp stack.
             stack titleString printLine.
             (cp at: activationNum) doLexicalScopes: [| :act |
                 act size > 0 ifTrue: [ |index|
                     index: findActivationIndex: act
                                           From: activationNum
                                       IfAbsent: 0.
                     (stack activationString: index) printLine.
                     act do: [| :slot |
                         slot value isReflecteeAssignment ifFalse: [
                             (slot printStringAssignable, '.') printLine ]]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         lookup: name = ( |
            | 
            inspectCommand: 'lookup' Do: [| index <- 0 |
                lookupLexicalScope: (cp at: activationNum)
                              Name: name
                         IfPresent: [| :slot |
                              (slot printString, ' {slot in activation ', 
                               (findActivationIndex: slot holder
                                               From: activationNum
                                           IfAbsent: []) printString,
                               '}') printLine.
                               (' and contents is ', slot contents idName, ' = ',
                                (slot contents safeNameSize: 45)) printLine]
                          IfAbsent: [| :outerReceiver. slotList <- list |
                              'self' = name ifTrue: [
                                  (name, ' in activation: ',
                               activationNum printString, ' and contains: ',
                               outerReceiver idName, ' = ',
                               (outerReceiver safeNameSize: 45), '.') printLine
                              ] False: [
                              slotList: outerReceiver lookupKey: name.
                              slotList isEmpty ifTrue: [
                                  ('cannot lookup: ', name, '.') printLine ]
                                False: [
                              slotList size = 1 ifTrue: [| slot. |
                                  slot: slotList first.
                                  (name, ' is found in object: ',
                                   slot holder idName, ' = ',
                                   (slot holder safeNameSize: 30),
                                   (slot contents isReflecteeMethod ifTrue: [
                                       ' and is a method' ] False: [
                                       ' and contents is: ',
                                       slot contents idName, ' = ',
                                       (slot contents safeNameSize: 45)]),
                                   '.') printLine
                              ] False: [
                                   ('ambiguous lookup for: ', name, '.')
                                        printLine]]]]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         lookupLexicalScope: activation Name: name IfPresent: presentBlk IfAbsent: absentBlk = ( |
            | 
            absentBlk value: activation doLexicalScopes: [| :act |
                (act names includes: name) ifTrue: [
                    ^presentBlk value: act slotAt: name ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         methodHolderString: activation = ( |
            | 
            activation isReflecteeMethodActivation ifFalse: '' True: [
                'Method holder: ',
                (activation methodHolder safeNameSize: 50), '.']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fComment: step to the next non-trivial bytecode in this activation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         next = ( |
            | 
             stepCommandDo: [ nextAction ]
            Iterations: 1  SkipSimpleBytecodes: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         next: n = ( |
            | 
             stepCommandDo: [ nextAction ] 
            Iterations: n  SkipSimpleBytecodes: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         nextAction = ( |
            | 
            activationNum = 0 ifTrue: [| beforeStepActivation <- 0 |
                "next at the bottom most activation consists of
                 one step and afterwards a finish if the step 
                 was a send byte code."
                beforeStepActivation: cp currentActivation.
                cp step.
                cp isAlive ifFalse: [
                    'process has terminated.' printLine] True: [
                        cp currentActivation hasSender
                     && [ cp currentActivation sender = beforeStepActivation]
                       ifTrue: [ cp finish ]]
            ] False: [
                "next in the middle of the stack consists of
                finish the previous activation."
               cp finish: cp at: activationNum pred ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         nextActionIntoBlocks = ( | {
                 'ModuleInfo: Module: debugger InitialContents: InitializeToExpression: (mirrors methodActivation)'
                
                 before <- bootstrap stub -> 'globals' -> 'mirrors' -> 'methodActivation' -> ().
                } 
            | 
            before: cp at: activationNum.
            before isReflecteeMethodActivation ifFalse: [
              before doLexicalScopes: [|:f| before: f ]
            ].
            cp step.
            [ before isLive &&
                [ (isMatching: before With: cp currentActivation) not]]
            whileTrue: [ cp step]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fComment: step to the next non-trivial bytecode in this activation;
	 step into blocks if they are present
	 warning: may occasionally result in very long waits\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         nextb = ( |
            | 
             stepCommandDo: [ nextActionIntoBlocks ]
            Iterations: 1  SkipSimpleBytecodes: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         nextb: n = ( |
            | 
             stepCommandDo: [ nextActionIntoBlocks ] 
            Iterations: n  SkipSimpleBytecodes: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fComment: step to the next bytecode in this activation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         nexti = ( |
            | 
             stepCommandDo: [ nextAction ]
            Iterations: 1  SkipSimpleBytecodes: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         nexti: n = ( |
            | 
             stepCommandDo: [ nextAction ] 
            Iterations: n  SkipSimpleBytecodes: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'ModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         printActivation = ( |
             activation.
             string <- ''.
            | 
            activation: cp at: activationNum.

            showMethod ifTrue: [
                (activationText copyForActivation: activation
                                            Width: tty width)
                                do: [|:c|  string: string, c ]
                  AtSelectionStart: [ string print. string: ''.
                                      tty startEmphasize]
                    AtSelectionEnd: [ string print. string: ''.
                                      tty endEmphasize].
                string print].

            showMethodHolder ifTrue: [| string <- '' |
                string: methodHolderString: activation.
                string isEmpty ifFalse: [ string printLine ] ].
            showExpressionStack ifTrue: [
                (expressionStackString: activation) printLine]. 
            showStatus ifTrue: [ processStatusString printLine].
            showFile   ifTrue: [ (fileInfoString: activation) printLine ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         processStatusString = ( |
             string.
            | 
            string: 'Process ', cp objectID, ', ', cp status asString.
            cp hasError ifTrue: [ string: string, ' with error'].
            cp isAlive ifTrue: [
               string: string, ', ', (activationString: activationNum), ' ',
                       activationNum printString,
                       ' in [0,', stackDepth pred printString, ']'].
            string, '.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         retry = ( |
            | 
            stackCommandDo: [ cp _KillActivationsUpTo: activationNum.
                              cp continue. cp waitForSuspension ]
                      Show: [ show ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         revert = ( |
            | stackCommandDo: [cp _KillActivationsUpTo: activationNum ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         selfFileExtension = '.self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         show = ( |
            | show: activationNum).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         show: number = ( |
            | 
            inspectCommand: 'show' Do: [
                tty inTermcapMode ifTrue: [ tty clear ].
                number < 0 ifTrue: [
                    'already at the bottom activation.' printLine] False: [
                number >= stackDepth ifTrue: [
                    'already at the top activation.' printLine] False: [
                activationNum: number.
                printActivation]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stack manipulation\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stackCommandDo: action Show: blk = ( |
            | 
            ifProcessValidDo: [
               action value.
               cp isAlive ifFalse: [ 'process has terminated.' printLine ]
                   True: [
                   stackDepth < 0 ifTrue: [
                       "Terminate process since we passed the top
                        most interesting activation."
                       cp continue. cp waitForDeath.
                       'process has terminated.' printLine ] False: [trimBottom]].
               cp isAlive ifTrue: blk]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stackDepth = ( |
            | cp stackDepth - numberOfRedundantTopActivations).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         status = ( |
            | 
             processStatusString printLine.
             cp hasError ifTrue: [
                 cp causeOfError errorString printLine ].
            'status').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fComment: step to the next non-trivial bytecode\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
             stepCommandDo: [ stepAction ]
            Iterations: 1  SkipSimpleBytecodes: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         step: n = ( |
            | 
             stepCommandDo: [ stepAction ]
            Iterations: n  SkipSimpleBytecodes: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stepAction = ( |
            | 
            "make a normal step"
            activationNum = 0 ifTrue: [ cp step ] False: [
                "step in the middle of the stack consists of
                finish the previous activation."
                cp finish: cp at: activationNum pred]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         stepCommandDo: action Iterations: n SkipSimpleBytecodes: b = ( |
            | 
            ifProcessValidDo: [
                [|:exit|
                    n do: [ action value.
                        cp isAlive ifFalse: [
                            'process has terminated.' printLine.
                            exit value ].
                        b ifTrue: [ cp stepOverSimpleBytecodes ].
                        stackDepth < 0 ifTrue: [
                            "Terminate process since we passed the top
                             most interesting activation."
                            cp continue.
                            cp waitForDeath.
                            'process has terminated.' printLine.
                            exit value ].
                        trimBottom ]
                ] exit.
                cp isAlive ifTrue: [ show ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fComment: step to the next bytecode\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         stepi = ( |
            | 
             stepCommandDo: [ stepAction ]
            Iterations: 1  SkipSimpleBytecodes: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: stepping\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         stepi: n = ( |
            | 
             stepCommandDo: [ stepAction ]
            Iterations: 1  SkipSimpleBytecodes: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         trace = ( |
            | 
            lexicalTracing ifTrue: [ ^ traceLex ].
            inspectCommand: 'trace' Do: [
                enableFilter ifTrue: [cp filteredStackTrace] 
                              False: [cp         stackTrace]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         traceLex = ( |
            | traceLexShowBlocks: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         traceLexShowBlocks: showBlocks = ( |
            | 
            inspectCommand: 'traceLex' Do: [
                | stack <- processStack. activation. index <- 0|
                stack: cp stack.
                trimBottom: stack.
                stack titleString printLine.

                index: trimmedBottomActivation.
                [ index <= trimmedTopActivation ] whileTrue: [
                    activation: cp at: index.
                    activation isReflecteeMethodActivation || showBlocks 
                      ifTrue: [
                        (stack activationString: index) printLine.
                    ].
                    index:  
                      activation isReflecteeMethodActivation 
                        ifTrue: [index succ]
                         False: [
                                  findActivationIndex: activation lexicalParent
                                                 From: index
                                             IfAbsent: [ index succ ]
                    ].
                ].
             ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         traceTops = ( |
            | traceLexShowBlocks: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: attaching\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         trimBottom = ( |
            | trimBottom: cp stack).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: attaching\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         trimBottom: stack = ( |
            | 
            "compute the trimmed bottom of the stack"
            trimmedBottomActivation:
                cp causeOfError firstInterestingFrameOf: stack.
            activationNum: trimmedBottomActivation = 0
                ifTrue: 0 False: trimmedBottomActivation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: attaching\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: private'
        
         trimTop: stack = ( |
            | 
            "compute the trimmed top of the stack"
            trimmedTopActivation: stack topmostInterestingActivation.
            numberOfRedundantTopActivations:
                 cp stackDepth - trimmedTopActivation succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         up = ( |
            | 
            inspectCommand: 'up' Do: [ 
                show: filteredActivationIndexUpFrom: activationNum succ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         up: n = ( |
            | inspectCommand: 'up'    Do: [ show: activationNum + n  ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'debugger' -> () From: ( | {
         'Category: inspecting\x7fComment: Methods for interactive inspecting\x7fModuleInfo: Module: debugger InitialContents: FollowSlot\x7fVisibility: public'
        
         upLex = ( |
            | inspectCommand: 'upLex' Do: [| activation |
            activation: cp at: activationNum.
            activation isReflecteeMethodActivation  ifFalse: [
            show: findActivationIndex: activation lexicalParent
                                 From: activationNum
                             IfAbsent: [
                      'not able to find lexical scope.' printLine.
                      ^ self]
            ] True: [ 'not a block activation.' printLine ] ]).
        } | ) 



 '-- Side effects'

 globals modules debugger postFileIn
