" Sun-$Revision: 21.1 $ "

"Copyright 1992-2012 AUTHORS.
 See the LICENSE file for license information."

"This file illustrates the use of foreign functions and dynamically linked in
 libraries. It uses three foreignFct's (socket_bind_listen_glue,
 simple_accept_glue and shutdown_glue) to provide a server process that 
 regular Unix processes can connect to to have arbitrary Self expressions 
 evaluated. To try it out, do this:
   1. Make sure the path below for the socks.so file is correct.
   2. Read this file into Self, then type (at the Self prompt):
   	[server start] fork
   3. At the Unix prompt type: toself < server.self capitalize: stdio.
   4.                          toself stdio writeLine: 55 factorial printString.
   5.                          toself _Quit.
 The server process alone can be stopped with   toself server stop.
 (Restarting the server shortly after stopping it may cause an EADDRINUSE).

   							Ole Agesen, Feb. 1992."

traits     _AddSlotsIfAbsent: ( | serverDemo* = () | )
globals    _AddSlotsIfAbsent: ( | serverDemo* = () | )

" This is how to get static initializer routines (no args, no return value)
  called whenever a file is loaded. Note: initializer names are dependant 
  on what compiler generates the code, e.g. the g++ compiler puts the prefix 
  __GLOBAL_$I$ on initializers. We need a better way to do this."
" foreignCodeDB at: '~/server/socks.so' PutInitializer: '__GLOBAL_$I$sild' "

globals serverDemo _AddSlotsIfAbsent: ( | socksFct = () | ) 


globals serverDemo _AddSlots: ( |  
    capitalize: io = ( | ch <- ' '. |
        "Sample application, a capitalizing filter."
        [ ch: io readCount: 1. io atEOF ] whileFalse: [ 
            io write: ch capitalize. 
        ].
      ).
| )


traits serverDemo _AddSlotsIfAbsent: ( | socket = () |)

traits socket _Define: ( |
    parent* = traits proxy.

    copyPort: portNumber = ( "Create socket, do bind, then listen."
        | sbl = foreignFct copyName: 'socket_bind_listen_glue' ArgCoercions: 'i '
ResultType: 'unknown'
                   Path: 'applications/serverDemo/socks.so'
. |
        sbl call: portNumber With: deadCopy IfFail: raiseError.
      ).

    acceptIfFail: errBlk = ( "Return new unixFile object."
        | acc = foreignFct copyName: 'simple_accept_glue' ArgCoercions: '  '
ResultType: 'unknown'
                   Path: 'applications/serverDemo/socks.so'
. |
        acc call: self 
             With: (os_file copyName: 'a socket') deadCopy
           IfFail: errBlk.
      ).

    close = ( closeIfFail: raiseError ).

    closeIfFail: errBlk = ( unix closeFile: self IfFail: errBlk ).
| )


globals serverDemo _AddSlotsIfAbsent: ( | socket = () | )

socket _Define: proxy deadCopy _AddSlots: ( |
    parent* = traits socket.
| )



globals serverDemo _AddSlotsIfAbsent: ( | server = () | )

server _Define: ( | 
    parent*       = traits oddball.
    debug         = false.
    serverSocket <- proxy deadCopy.
    continue     <- true.
  
    context = ( |
        "To ensure that each process started gets its own stdio object,
         the process initializer is evaluated in the context of a clone 
         of this object, with the stdio slot properly initialized."
        mother* = traits clonable.
        father*  = lobby.
        stdio   <- os_file copy.
      | ).
        
  
    handleRequest: io = ( 
        "Now a connection has been established. Contract is that first line
         is an expression to to evaluate in the context of the lobby."
         | cmd <- ''. newprg. cntxt. |
         cntxt: context copy stdio: io.
         cmd: io readLine.
         debug ifTrue: [('Got this command line: ' , cmd) printLine].
         newprg: cmd evalInContext: (reflect: cntxt) 
                          FileName: '<server>' 
                            IfFail: [|:e|
             ('Self server: failed to evaluate \'', cmd, '\': ', e) printLine.
         ].
         io close.
         self.
      ). 
  
    start = (
        continue: true.
        serverSocket: (socket copyPort: 1275).      "HARDWIRED!"
        'Server started.' printLine.
        [continue] whileTrue: [| io <- os_file. |
            io: serverSocket acceptIfFail: [|:e| 
                ('EINTR' isPrefixOf: e) || ('NOERR' isPrefixOf: e)
		  ifFalse: [^ error: e].
                nil.
            ].
            nil != io ifTrue: [
                (message copy receiver: self 
                              Selector: 'handleRequest:' 
                                  With: io) fork resume.
            ].
            process this yield.
        ].
        serverSocket close.
        'Server terminated.' printLine.
        self.
      ).
  
    stop = (
        debug ifTrue: ['forcing a stop' printLine].
        continue: false.
        self.
      ).
  
  
| )
  
  
traits unixFile _AddSlotsIfAbsent: ( |
  { 'Category: creating'
    shutdown: how = ( 
        "Shut down one direction of bidirectional socket connection. 
         how: 0 = shut down receives, 1 = sends, 2 = both."
        | shut = foreignFct copyName: 'shutdown_glue' ArgCoercions: ' i'
ResultType: 'unknown'
                   Path: 'applications/serverDemo/socks.so'
. | 
        shut call: self With: how IfFail: raiseError.
      ).
  }
| )


