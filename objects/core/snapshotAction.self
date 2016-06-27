 '30.12.2'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'memory' -> () From: ( | {
         'Category: releasing resources\x7fComment: Add a message to be performed when a thorough cleanup takes place.\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         addThoroughCleanupMessage: msg = ( |
            | 
            thoroughCleanupMessages add: msg.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot'
        
         snapshotAction = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules snapshotAction.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot'
        
         myComment <- '<globals system systemInvokedActions> snapshotAction\"
            \"Around snapshot actions, the system sends to the lobby the messages:
               After  a READ:  \'snapshotAction postRead\'
               Before a WRITE: \'snapshotAction preWrite\'
               After  a WRITE: \'snapshotAction postWrite\'
             As defined below, these methods send \'send\' to each element of a list
             of messages.  Example of use: to perform a garbage collection before every
             snapshot write, add a message to snapshotAction preWriteActions that
             sends \'garbageCollect\' to memory.  [bwc 10/91]'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: private'
        
         postFileIn = ( |
            | 
            snapshotAction addPostReadMessage:
                          (message copy
                             receiver: snapshotAction
                             Selector: 'printBanner'
                             Arguments: vector).
            snapshotAction addPostReadMessage:
                          (message copy
                             receiver: snapshotAction
                             Selector: 'processCommandLine'
                             Arguments: vector).

            ('-' & '--') asVector do: [|:a|
              snapshotAction
                forCommandLineArg: a
                         DoAction: (|
                  parent* = lobby.
                  value: i With: a = (
                    snapshotAction processRestWithoutOptions: i succ.
                    snapshotAction commandLine lastKey succ)
                |)
            ].

            snapshotAction
              forCommandLineArg: '-s'
                       DoAction: (| parent* = lobby.
                                    value: i With: arg = (
                                     memory snapshotOptions fileName:
                                      (snapshotAction commandLine at: i succ).
                                     i + 2)
                                 |).

            'Fhprtw' do: [|:opt|
              snapshotAction
                forCommandLineArg: '-', opt
                         DoAction: (| value: i With: arg = (i succ) |).
            ].

            'fl' do: [|:opt|
              snapshotAction
                forCommandLineArg: '-', opt
                         DoAction: (| value: i With: arg = (i + 2) |).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: InitializeToExpression: (\'30.12.2\')\x7fVisibility: public'
        
         revision <- '30.12.2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         addPostReadMessage: msg = ( |
            | 
            postReadMessages add: msg.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         addSchedulerInitialMessage: msg = ( |
            | 
            schedulerInitialMessages add: msg.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: command line processing\x7fModuleInfo: Module: snapshotAction InitialContents: InitializeToExpression: (dictionary copy)\x7fVisibility: private'
        
         argDict <- dictionary copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: command line processing\x7fModuleInfo: Module: snapshotAction InitialContents: InitializeToExpression: (vector)\x7fVisibility: public'
        
         commandLine <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | (((
            resend.copy
            preWriteMessages:         preWriteMessages copy)
            postWriteMessages:        postWriteMessages copy)
            postReadMessages:         postReadMessages copy)
            schedulerInitialMessages: schedulerInitialMessages copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: command line processing\x7fComment: Use this message to add option-specific command line processing.
`option\' should be a string that starts a command line option (e.g., -Q).
`action\' is a block-like object which will be sent `value:With:\' when the option 
is encountered; it will be passed the index in commandLine of the option string,
and the arg at that index, and it should return the index of the next
command-line argument to be processed.  E.g., if -Q is index 2 in command line,
and it is followed by a filename, then the filename is `commandLine at: 3\'. and
the result of value: should be 4.\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         forCommandLineArg: option DoAction: action = ( |
            | 
            argDict at: option Put: action).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: private'
        
         isVMADebugBuild = ( |
            | 
            _CheckAssertions).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: command line processing\x7fComment: This is the action which is invoked (by being sent value:)
when a command-line arg is not handled by an entry specified
with forCommandLineArg:DoAction:.
\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         otherCommandLineArgAction <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'snapshotAction' -> 'otherCommandLineArgAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals snapshotAction otherCommandLineArgAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> 'otherCommandLineArgAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'lobby' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> 'otherCommandLineArgAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         value: i With: arg = ( |
            | 
            warning: 
              'Command line argument `', arg, '\' ignored'.
            i succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Comment: This method is run by the Virtual Machine
immediately after startup unless the -p
option is used.\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         postRead = ( |
            | 
            sendMessages: postReadMessages.
            scheduler start.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: InitializeToExpression: ( orderedSet copyRemoveAll )\x7fVisibility: private'
        
         postReadMessages <-  orderedSet copyRemoveAll .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: private'
        
         printBanner = ( |
             v.
            | 
            v: about core.
            ('\n\tWelcome to the Self system!  (', about core asString, ')\n') printLine.
            modules init copyright printLine.
            'Type _Credits for full credits.\n' printLine.
            isVMADebugBuild ifTrue: [
              printDebugVMWarning
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: private'
        
         printDebugVMWarning = ( |
            | 
            '
               ######                                          #     # #     #
               #     #  ######  #####   #    #   ####          #     # ##   ##
               #     #  #       #    #  #    #  #    #         #     # # # # #
               #     #  #####   #####   #    #  #              #     # #  #  #
               #     #  #       #    #  #    #  #  ###          #   #  #     #
               #     #  #       #    #  #    #  #    #           # #   #     #
               ######   ######  #####    ####    ####             #    #     #

               This is a debug version of the Self VM.  It will run much slower
               than the deployment version.' printLine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: command line processing\x7fComment: Parse the command line args and process options.\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         processCommandLine = ( |
             i.
            | 
            commandLine: _CommandLine.
            "skip the VM name"
            i: commandLine firstKey succ.
            [i <= commandLine lastKey] whileTrue: [| arg. action. |
              arg: commandLine at: i.
              action:  argDict at: arg IfAbsent: [otherCommandLineArgAction].
              i:  action value: i With: arg.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'Category: command line processing\x7fComment: Treat the rest of the command line as unrecognised by the
standard mechanism.\x7fModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         processRestWithoutOptions: j = ( |
             i.
            | 
            i: j.
            [i <= commandLine lastKey] whileTrue: [| arg. |
              arg: commandLine at: i.
              i:  otherCommandLineArgAction value: i With: arg.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: public'
        
         schedulerInitial = ( |
            | 
            log info: 'Scheduler started (according to snapshotAction schedulerInitial)'.
            schedulerInitialMessages do: [|:msg| msg fork resume].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: InitializeToExpression: ( orderedSet copyRemoveAll )\x7fVisibility: private'
        
         schedulerInitialMessages <-  orderedSet copyRemoveAll .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'snapshotAction' -> () From: ( | {
         'ModuleInfo: Module: snapshotAction InitialContents: FollowSlot\x7fVisibility: private'
        
         sendMessages: msgs = ( |
            | msgs do: [|:msg| msg send ]).
        } | ) 



 '-- Side effects'

 globals modules snapshotAction postFileIn
