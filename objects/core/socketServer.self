 '$Revision: 30.7 $'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot'
        
         socketServer = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules socketServer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            [ "Commented out for release: this is a security loophole!"
              snapshotAction addSchedulerInitialMessage: 
               message copy receiver: socketServer  Selector: 'start'.
            ].
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: socketServer InitialContents: FollowSlot'
        
         socketServer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals socketServer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: private'
        
         context = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'socketServer' -> 'context' -> () From: ( |
             {} = 'Comment: To ensure that each process started gets is own stdio object,
the process initializer is evaluated in the context of a clone
of this object, with the stdio slot properly initialized.\x7fModuleInfo: Creator: globals socketServer context.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         continue <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: private'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         handleRequest: io = ( |
             cmd <- ''.
             cntxt.
             newprg.
            | 

            process this stdin: io.
            process this stdout: io.
            process this stderr: io.

            process this history: perProcessGlobals history copy reset.
            process this prompt:  perProcessGlobals prompt copy.

            prompt inputLoop.
            io close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: InitializeToExpression: (os_file deadCopy)\x7fVisibility: private'
        
         serverSocket <- os_file deadCopy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            ( userQuery askYesNo: 'Starting the socket server introduces a security loophole into your machine.\n',
                                  'Please confirm.'
            ) ifTrue: [startSilently].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         startSilently = ( |
             port = 1275.
            | 
            continue: true.
            serverSocket closeIfFail: [].
            serverSocket:
              os_file
                openTCPListenerOnPort: port      "HARDWIRED!"
                IfFail: [|:e|
                     (e matchesPattern: '*UNKNOWN 125*')
                  || [e matchesPattern: '*EADDRINUSE*']
                     ifTrue: [error: e, '\n',
                                'Warning: couldn\'t start the rself server process.\n',
                                'The port (', port printString, ') is already in use, ',
                                'probably by another Self server.\n\n',
                                'If you wish to start it, kill the other one off and\n',
                                'evaluate "socketServer start"'.
                              ^self]
                      False: [^error: 'Couldn\'t start self server: ', e]].
            'Server started.' printLine.
            [continue] whileTrue: [| io <- unixGlobals os_file. |
            serverSocket initialize: 'server socket'.
                io: serverSocket acceptConnection.
                (message copy receiver: self 
                              Selector: 'handleRequest:' 
                                  With: io) fork resume.
            ].
            serverSocket close.
            'Server terminated.' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'socketServer' -> () From: ( | {
         'ModuleInfo: Module: socketServer InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            debug ifTrue: ['forcing a stop' printLine].
            serverSocket closeIfFail: [].
            continue: false.
            self).
        } | ) 



 '-- Side effects'

 globals modules socketServer postFileIn
