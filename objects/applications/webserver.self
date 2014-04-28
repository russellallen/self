 '$Revision:$'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         webserver = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules webserver.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         webserver = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         deadProcess = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> 'deadProcess' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver deadProcess.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'deadProcess' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         abort = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'deadProcess' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         isAlive = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'deadProcess' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         isNil = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         debug = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         deregisterServletAt: u = ( |
            | 
            servlets removeKey: u.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         exampleServlets = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver exampleServlets.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         fileServlet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'fileServlet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver exampleServlets fileServlet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'fileServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: InitializeToExpression: (\'~/Sites/\')'
        
         baseDirectory <- '~/Sites/'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'fileServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         handleUrl: u = ( |
             f.
             fn.
            | 
            (u = '') ifTrue: [fn: 'index.html'] IfFalse: [fn: u]. 
            (fn last = '/') ifTrue: [fn: fn, 'index.html'].
            fn: baseDirectory, fn.
            f: os_file deadCopy openForReading: fn IfFail: [^ 'Not Found:', fn].
            r: webserver response copy.
            r contents: f contents.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'fileServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         lobbyBrowserServlet = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'lobbyBrowserServlet' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver exampleServlets lobbyBrowserServlet.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'lobbyBrowserServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         appropriateSigilFor: slot = ( |
            | 
            ( slot mirror at: (slot name, ':') IfAbsent: [^ ' = '] ) 
              value = mirrors assignment ifTrue: [^ ' &larr; '].
            ' = ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'lobbyBrowserServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         getMirrorAtPath: p = ( |
             o.
            | 
            o: reflect: lobby.
            p do: [|:n| o:(o at: n) contents].
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'lobbyBrowserServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         handleUrl: u = ( |
             o.
             r.
             t.
            | 
            u = '' 
              ifTrue: [o: reflect: lobby]
              False: [
                o: getMirrorAtPath: 
                  u asTokensSeparatedByCharactersSatisfying: [|:c | c = '/']].
            r: webserver response copy.
            r contents: htmlFor: o.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'lobbyBrowserServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         htmlFor: o = ( |
             r.
            | 

            r: '<html><body><h1>', (o evalName), '</h1><p>'.
            r: r, '<i>', (o comment), '</i><p>'.
            r: r, 'CopyDowns: ', (o copyDowns printString), '<p>'.
            r: r, 'CreatorPath: ', (o creatorPath printString), '<p>'.
            r: r, 'ModuleNames: ', (o moduleNames printString), '<p>'.

            r: r, 'Parents:<ul>'.
            o parentsDo: [|:i| r: r, htmlForSlot: i].
            r: r, '</ul>Slots:<ul>'.
            o withoutAssignmentSlotsDo: [|:i| 
                i isParent ifFalse: [r: r, htmlForSlot: i]].

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'lobbyBrowserServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         htmlForSlot: s = ( |
            | 
            '<li><a href="', 
             s key, '/">', 
             s key, '</a>', (appropriateSigilFor: s),
             s value safeName, '</li>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'lobbyBrowserServlet' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         staticSiteServer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver exampleServlets staticSiteServer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: webserver InitialContents: InitializeToExpression: (\'\')'
        
         baseDir <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> () From: ( | {
         'Category: private\x7fModuleInfo: Module: webserver InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         cache <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         p* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> 'p' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver exampleServlets staticSiteServer p.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         filesInDir: d = ( |
            | (os outputOfCommand: ('find ', d, ' -type f') Delay: 100 IfFail: '') asTokensSeparatedByWhiteSpace).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         handleUrl: u = ( |
             f.
             fn.
             r.
            | 
            (u = '') ifTrue: [fn: 'index.html'] False: [fn: u]. 
            (fn last = '/') ifTrue: [fn: fn, 'index.html'].
            r: webserver response copy.
            r contents: cache at: fn IfAbsent: ['<html><body>Not Found</body></html>'].
            r guessContentTypeFromName: fn.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         loadTreeFrom: dir = ( |
            | baseDir: dir. reloadTree. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'exampleServlets' -> 'staticSiteServer' -> 'p' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         reloadTree = ( |
            | 
            cache: dictionary copyRemoveAll.
            (filesInDir: baseDir) do: [|:fn. f. s|
              f: os_file openForReading: fn.
              s: f contents.
              f close.
              cache at: (fn copyFrom: baseDir size + 1 UpTo: fn size)
                   Put: s].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         handleRequest: io = ( |
             r.
             url.
            | 
            [|i|
              i: io readLine. 
              i print.
              (i matchesPattern: 'GET *') ifTrue: [
                url: i copyFrom: 5 UpTo: i size - 10].
              i first asByte = 13] whileFalse: [].
            r: handleUrl: url.
            io writeLine: 'HTTP/1.1 ', r statusCode.
            io writeLine: 'Content-Type: ', r contentType.
            io writeLine: 'Content-Length: ', r contentsLength.
            io writeLine: 'Connection: close'.
            io writeLine: ''.
            io write: r contents.
            io close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         handleUrl: url = ( |
             s.
            | 
            servlets keys do: [|:k| 
              (k isPrefixOf: url) || (k = '') ifTrue: [
                ^ (servlets at: k) handleUrl: (url copyFrom: k size UpTo: url size)]].
            'Servlet Not Found').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         initialiseSocketOn: port = ( |
            | 
            serverSocket closeIfFail: [].
            serverSocket:
              os_file
                openTCPListenerOnPort: port
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
            log: 'serverSocket initialised'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         isRunning = ( |
            | 
            serverProcess isAlive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: logging\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         log: s = ( |
            | 
            debug ifTrue: [s value printLine]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: webserver InitialContents: InitializeToExpression: (8080)'
        
         port <- 8080.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         registerServlet: s At: urlStub = ( |
            | 
            servlets isNil ifTrue: [servlets: dictionary copy].
            servlets at: urlStub Put: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: request and response\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         response = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'webserver' -> 'response' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals webserver response.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'response' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: InitializeToExpression: (\'text/html; charset=UTF-8\')'
        
         contentType <- 'text/html; charset=UTF-8'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'response' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: InitializeToExpression: (\'\')'
        
         contents <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'response' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         contentsLength = ( |
            | 
            contents size asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'response' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         guessContentTypeFromName: n = ( |
             x.
            | 
            x: (n asTokensSeparatedByCharactersIn: '.') last.
            x = 'html' ifTrue: [contentType: 'text/html; charset=UTF-8'].
            x = 'js'   ifTrue: [contentType: 'application/ecmascript'  ].
            x = 'css'  ifTrue: [contentType: 'text/css'                ].
            x = 'gif'  ifTrue: [contentType: 'image/gif'               ].
            x = 'jpg'  ifTrue: [contentType: 'image/jpeg'              ].
            x = 'png'  ifTrue: [contentType: 'image/png'               ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'response' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         p* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> 'response' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: InitializeToExpression: (\'200 OK\')'
        
         statusCode <- '200 OK'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         runServerLoop = ( |
            | 
            [| io <- unixGlobals os_file. |
            serverSocket initialize: 'server socket'.
                io: serverSocket acceptConnection.
                (message copy receiver: self 
                              Selector: 'handleRequest:' 
                                  With: io) fork resume.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: webserver InitialContents: InitializeToExpression: (webserver deadProcess)'
        
         serverProcess <- bootstrap stub -> 'globals' -> 'webserver' -> 'deadProcess' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: webserver InitialContents: InitializeToExpression: (os_file deadCopy)'
        
         serverSocket <- os_file deadCopy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: internal state\x7fModuleInfo: Module: webserver InitialContents: InitializeToExpression: (nil)'
        
         servlets <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            serverProcess isAlive ifTrue: [error: 'Already running'].
            (message copy receiver: self Selector: 'startServerOn:' With: port) fork.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         startOn: aPort = ( |
            | port: aPort. start).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'Category: support\x7fModuleInfo: Module: webserver InitialContents: FollowSlot'
        
         startServerOn: port = ( |
            | 
            initialiseSocketOn: port.
            runServerLoop.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'webserver' -> () From: ( | {
         'ModuleInfo: Module: webserver InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            serverSocket closeIfFail: [
              log: 'Could not close serverSocket'].
            serverProcess abort.
            serverProcess: deadProcess.
            self).
        } | ) 



 '-- Side effects'

 globals modules webserver postFileIn
