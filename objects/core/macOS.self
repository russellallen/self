 '$Revision: 30.13 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> () From: ( | {
         'Category: OS and filesystem interface\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         os = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( |
             {} = 'Comment: This object provides low level access to selected Mac calls.
Many Mac calls are provided through the indirect system call, but
files, sockets are opened/closed using specific direct primitives so
that the virtual machine can keep track of open files (necessary for
the select call).
A little philosophy: at the unix (os) level, every operation
takes a failure block to give the user the ability to handle
failures. The block gets one argument, a string with the error code--dmu\x7fModuleInfo: Creator: globals macOSGlobals os.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptSocket: socketFile Info: info IfFail: errBlk = ( |
            | 
            unimpMac: [
            while_EINTR_do: [|:errBlk|
                basicAcceptSocket: socketFile 
                             Info: info
                           IfFail: errBlk.
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fComment: See access(2).  Returns the empty string
if access is allowed, a non-empty string
otherwise.
The mode should be one of the constants in accessModes.
\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         access: fileName Mode: mode = ( |
             f.
            | 
            "hack: no easy access routine for mac"
            f:  openFileName: fileName Flags: mode Mode: os_file mode allRW IfFail: [|:e| ^ e].
            f close.
            '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fComment: Modes for for access:Mode:.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         accessModes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> 'accessModes' -> () From: ( |
             {} = 'Comment: Have to open the file on the Mac.\x7fModuleInfo: Creator: globals macOSGlobals os accessModes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Does the file exist?\x7fModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         f_ok = ( |
            | 
            0 os_file flags read).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Is the file readable?\x7fModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         r_ok = ( |
            | 0 os_file flags read).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Is the file writable?\x7fModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         w_ok = ( |
            | 0 os_file flags write).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Is the file executable (searchable for directories)?\x7fModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         x_ok = ( |
            | 0 os_file flags binary).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fComment: Upon success, the bind call returns the port number
(if it is specified as 0, the system will chose one
for us). Agesen, june 1996.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         bindSocket: socket Family: family Port: port Address: address IfFail: errBlk = ( |
            | 
            unimpMac: [
            while_EINTR_do: [|:errBlk|
              basicBindSocket: socket Family: family Port: port Address: address IfFail: errBlk.
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: stubs\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         command: c IfFail: fb = ( |
            | 
            fb value: 'unimplemented for mac').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         connectSocket: socket Family: family Port: port Address: address IfFail: errBlk = ( |
            | 
            unimpMac: [
            while_EINTR_do: [|:errBlk|
              basicConnectSocket: socket Family: family Port: port Address: address IfFail: errBlk.
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: stubs\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         environmentAt: t0 IfFail: fb = ( |
            | 
            fb value: unimplemented_on_Mac).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         fcntlFile: file Request: request With: arg IfFail: errBlk = ( |
            | 
            unimpMac: [
            while_EINTR_do: [ |:errBlk|
                basicFcntlFile: file  Request: request  Arg: arg  IfFail: errBlk
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: should be generated by primitive maker\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         getpid = ( |
            | 

            getpidIfFail: [|:e| ^error: 'getpid failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: should be generated by primitive maker\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         getpidIfFail: fb = ( |
            | 
            warning: 'stubbing getpidIfFail:'.
            17
            " _GetProcessSerialNumberIfFail: fb ").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: network and hosts\x7fComment: Convert host name to IP addresses.
Result is a vector of byte vectors (each byte vector is an IP address).
-- Ungar, 2/19/95, Agesen, 24/6/96.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         hostAddressesForName: name IfFail: errBlk = ( |
            | 
            unimpMac: [
            | res |
            [  res: (basicGetHostByName: name IfFail: [|:e|
                  'NOERR' != e ifTrue: [^ errBlk value: e].
                  nil
               ]).
               res isNil.
            ] whileTrue.
            res
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: network and hosts\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         hostNameForAddr: addrByteVector IfFail: errBlk = ( |
            | 
            unimpMac: [
            hostNameForAddr: addrByteVector
                       Type: os_file socketConstants af_inet
                     IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctlFile: file Request: request With: arg IfFail: errBlk = ( |
            | 
            unimpMac: [
            convertSysCallResultToInt: 
                syscall: sys_ioctl
                   With: file              And: 0
                   With: request low16Bits And: request high16Bits
                   With: arg               And: 0
                 IfFail: [|:e| ^ errBlk value: e]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         listenSocket: socket Backlog: backlog IfFail: errBlk = ( |
            | 
            unimpMac: [
            while_EINTR_do: [|:errBlk|
              basicListenSocket: socket Backlog: backlog IfFail: errBlk
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         lseekFile: file Offset: offset Whence: whence IfFail: errBlk = ( |
            | 
            "Move file pointer. Return abs. index of pos. seeked to, zero-based."
            unimpMac: [
            while_EINTR_do: [ |:errBlk|
                basicLseekFile: file  
                        Offset: offset  
                        Whence: whence  
                        IfFail: errBlk
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: directories\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         mkdir: path Mode: mode IfFail: errBlk = ( |
            | 
            unimpMac: [
            syscall: sys_mkdir
               With: path copyNullTerminated And: 0
               With: mode                    And: 0
             IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: stubs\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         nodename = 'aWonderfulMacintosh'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: opening and closing\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         openFileName: name Flags: flags Mode: mode IfFail: errBlk = ( |
            | 
            "This indirection is a relic of the unix side, but may be neded someday"
            basicOpenFileName: name  Flags: flags  Mode: mode  IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstract_OS' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         rename: old To: new IfFail: fb = ( |
            | 
            "must expand unix names to Mac names"
            basicRename: (os_file expand: old) To: (os_file expand: new) IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: directories\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         rmdir: path IfFail: errBlk = ( |
            | 
            unimpMac: [
            syscall: sys_rmdir
               With: path copyNullTerminated And: 0
             IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: select\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         selectInto: selectVector MaxFiles: maxFiles IfFail: errBlk = ( |
            | 
            "Could only stdin for now -- dmu 6/99"
            selectVector at: 0 Put: 0.
            1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: select\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         selectReadInto: selectVector MaxFiles: maxFiles IfFail: errBlk = ( |
            | 
            unimpMac: [
            while_EINTR_do: [ |:errBlk|
                basicSelectReadInto: selectVector asVector
                           Size: maxFiles
                         IfFail: errBlk
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: opening and closing\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         socketDomain: domain Type: type Protocol: protocol IfFail: errBlk = ( |
            | 
            unimpMac: [
            while_EINTR_do: [|:errBlk|
              basicSocketDomain: domain Type: type Protocol: protocol IfFail: errBlk
            ] IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         stat: fname IfFail: fb = ( |
             s.
            | 
            s: statStructure new.
            basicStatFileName: fname Into: s
              IfFail: [|:e| 
                s kill. 
                ^ fb value: e.
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: stubs\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         unimpMac: b = ( |
             m.
             name.
             src.
            | 
            m: reflect: b.
            src: m valueSlot contents source.
            name: m lexicalParent selector.
            error: unimplemented_on_Mac, 
                   '\nreceiver: ', m lexicalParent receiver name, 
                   '\nselector: ', name, 
                   '\nsource: ', src).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: stubs\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         unimplemented_on_Mac = 'unimplemented on MacOS'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: file naming\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         unlink: fileName IfFail: errBlk = ( |
            | 
            basicUnlink: (os_file expand: fileName) IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> () From: ( | {
         'Category: OS and filesystem interface\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         os_file = bootstrap define: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os_file' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os_file' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macOSGlobals os_file.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         atEOF <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- 'I have never been opened.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: OS and filesystem interface\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_File = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macOS_File.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macOS_File' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: InitializeToExpression: (semaphore copyCount: 0 Capacity: 1)\x7fVisibility: private'
        
         readSema <- semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: InitializeToExpression: (semaphore copyCount: 0 Capacity: 1)\x7fVisibility: private'
        
         writeSema <- semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         macOS = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules macOS.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.13 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'macPrims_wrappers
macOS_stdin
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: socket operations\x7fCategory: accepting\x7fComment: Returns a socket.
Accept returns NOERR if there is no connetion yet.
Before successful return, \'infoBlk\' is invoked with data about
the accepted connection: the port number (an integer), 
the family (an integer), and the address (a byteVector).\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptConnectionInfo: infoBlk IfFail: errBlk = ( |
            | 
            unimpMac: [
            | err. info. newSocket |
            info: (vector copySize: 3).
            readSema protectNoNLR: [   "Don't call 'errBlk' while holding lock!"
                [|:abort. :again|
                  newSocket: (os acceptSocket: self Info: info IfFail: [|:e|
                       ('NOERR'       = e) || 
                       ['EWOULDBLOCK' = e] ||
                       ['EAGAIN'      = e] ifTrue: [suspendIfAsync. again value]
                                            False: [err: e.         abort value].
                  ]).
                  newSocket initialize: 'accepted connection'.
                  abort value.   "Exit the loop successfully."
                ] loopExitContinue.
            ].
            err ifNotNil: [^ errBlk value: err].
            infoBlk value: (info at: 0)     "Port; an integer."
                     With: (info at: 1)     "Family; an integer."
                     With: (info at: 2).    "Address; a byte vector."
            newSocket
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: socket operations\x7fCategory: binding\x7fComment: Upon success, the bind call returns the port number
(if it is specified as 0, the system will chose one
for us). Agesen, june 1996.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         bindFamily: family Port: port Address: address IfFail: errBlk = ( |
            | 
            unimpMac: [
            [
              [ |:repeat|
                ^ os bindSocket: self
                         Family: socketConstants af_inet 
                           Port: port 
                        Address: inetConstants in_addr_any
                         IfFail: [|:err|
                                  case if: [err = 'EADDRNOTAVAIL'] Then: repeat
                                       If: [err = 'UNKNOWN 126'      ] Then: repeat
                                       If: [err = 'NOERR'      ] Then: repeat
                                     Else: [ errBlk value: err ].
                         ].
              ] exit.
            ] loop
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: socket operations\x7fCategory: connecting\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         connectFamily: family Port: port Address: address IfFail: errBlk = ( |
            | 
            unimpMac: [
            | err. res |
            readSema protectNoNLR: [
                | again |
                [
                    "Loop until we have a real error or a result."
                     again: false.
                     res: (os connectSocket: self Family: family 
                               Port: port Address: address IfFail: [|:e|
                          ('UNKNOWN 149' = e) || [('UNKNOWN 150' = e) ||
                         [('EINPROGRESS' = e) || [('EALREADY'    = e) ||
                         [('EAGAIN'      = e) || [('EWOULDBLOCK' = e) ||
                         [('NOERR'       = e)]]]]]] ifTrue: [
                             "Not a real error: retry after suspending." 
                             suspendIfAsync.
                             again: true.
                         ] False: [
                             ('EISCONN' = e) || ['UNKNOWN 133' = e] ifTrue: [0 "really OK"]
                                                                     False: [err: e].
                         ].
                     ]).
                ] untilFalse: [again].
            ].
            err ifNil:    [res]
                IfNotNil: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         dataReady = ( |
            | 
            unimpMac: [
            (os selectReadInto: selectVec MaxFiles: maxFiles 
              IfFail: [ error: 'dataReady: select failed'. ])
                do: [|:i| fileDescriptor = (selectVec at: i) ifTrue: [^true]].
            ^false
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         dirPath = ( |
            | 
            _DirPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         dirPath: str = ( |
            | 
            _DirPath: str asVMByteVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: file naming\x7fComment: Stick with Unix syntax,
file open methods translate to Mac.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         directorySeparator = '/'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: constants\x7fComment: from fcntl.mac.h\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         flags = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macOS_File flags.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'Comment: Open alias file (if the file is an alias)\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         alias = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         append = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'Comment: Open the file in binary mode (default is text)\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         binary = 32768.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         combinations* = bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         create = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'Comment: If file already exists don\'t create it again.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         exclusive = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'Comment: Don\'t resolve any aliases\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         noResolve = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         read = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         readWrite = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'Comment: Open the resource fork\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         resource = 16384.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         truncate = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         write = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: status\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         fstatIfFail: fb = ( |
             s.
            | 
            s: statStructure new.
            os basicStatOpenFile: self Into: s
              IfFail: [|:e| 
                s kill. 
                ^ fb value: e.
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         inetConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_File' -> 'inetConstants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macOS_File inetConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: file naming\x7fComment: Use Unix syntax here,
paths are expanded later,
inside file open methods.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         isAbsolutePath: path = ( |
            | 
            directorySeparator = path first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: constants\x7fComment: max. number of open files\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         maxFiles = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: constants\x7fComment: Permissions to give file being opened.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         mode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_File' -> 'mode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macOS_File mode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'mode' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         allRW = 438.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> 'mode' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         allRWX = 511.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: reading\x7fComment: copied from Unix side
-- 6/99 dmu\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         noLockReadInto: buf Min: min Max: max At: start IfFail: fb = ( |
             transferred <- 0.
            | 
            [| res <- 0. |
                res: (os basicReadFile: self Into: buf
                      Offset: start + transferred
                      Count: max - transferred IfFail: [|:e|
                          ('EWOULDBLOCK' != e) ifTrue: [
                              ^ fb value: e.  "Real error!"
                          ].
                          suspendIfAsync. "Not real error. Just retry."
                          -1.   "Note can't use 0 to indicate this case,
                                 since 0 already indicates EOF."
                ]).
                -1 != res ifTrue: [
                    0 = res ifTrue: [
                      (transferred < min) ifTrue: [ 
                          ^ fb value: 'EOF reached before min transfer limit'
                      ].
                      atEOF: true. 
                      ^ transferred
                    ].
                    transferred: transferred + res.
                ].
                transferred < min.
            ] whileTrue.
            transferred).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         noLockWriteFrom: buf Count: count Start: start IfFail: fb = ( |
             transferred <- 0.
            | 
            [| res <- 0. |
                res: (os basicWriteFile: self Into: buf
                      Offset: start + transferred
                       Count: count - transferred IfFail: [|:e|
                          ('EAGAIN' != e) && ['EWOULDBLOCK' != e] ifTrue: [
                              ^ fb value: e.   "Real error."
                          ].
                          suspendIfAsync.   "Not real error. Just retry."
                          0.               "Pretend nothing was written."
                ]).
                transferred: transferred + res.
                transferred < count.
            ] whileTrue.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         openTCPHost: host Port: port IfFail: errBlk = ( |
            | 
            unimpMac: [
            | a. addrs. s |
            addrs: (os hostAddressesForName: host IfFail: [|:err| 
                ^ errBlk value: 'hostAddressForName failed: ', err.
            ]).
            a: addrs first.    "Should perhaps be more careful here?"

            s: socketDomain: socketConstants pf_inet Type: socketConstants sock_stream Protocol: 0
               IfFail: [|:e| ^ errBlk value: 'socket failed: ', e].

            s connectFamily: socketConstants af_inet Port: port Address: a
               IfFail: [|:e|  s closeIfFail: [].   ^ errBlk value: 'connect failed: ', e].

            s
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         openTCPListenerOnPort: port IfFail: errBlk = ( |
            | 
            unimpMac: [
            | s |
            s: socketDomain: socketConstants pf_inet Type: socketConstants sock_stream Protocol: 0
               IfFail: [|:e| ^ errBlk value: 'socket failed: ', e].

            s bindFamily: socketConstants af_inet Port: port Address: inetConstants in_addr_any
                  IfFail: [|:err|   s closeIfFail: [].  ^ errBlk value: 'bind failed: ', err].

            s listenBacklog: 5  
                     IfFail: [|:e|   s closeIfFail: [].  ^ errBlk value: 'listen failed: ', e].

            s
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         os = bootstrap stub -> 'globals' -> 'macOSGlobals' -> 'os' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: file naming\x7fComment: Stick with Unix syntax,
file open methods translate to Mac.\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         pathSeparator = ':'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         readLine = ( |
             b.
            | 
            "Read up to and including first \n - skip this \n"
            "Special version for mac: SIOUX will not return any input until the user has hit return anyway."
            b: readMin: 1 Max: 80.
            b isEmpty ifTrue: b False: [b copyWithoutLast]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: macOS InitialContents: InitializeToExpression: (vector copySize: 64)\x7fVisibility: private'
        
         selectVec = vector copySize: 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         selfPreferencesFolderName = ( |
            | 
            warning: 'selfPreferencesFolderName unimplemented; returning `:\''.
            ':').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         setAsyncIfFail: failBlock = ( |
            | 
            = stdin ifFalse: [^ self]. "unsupported on mac"
            os set_SIOUX_nonblocking: true
                                 IfFail: [|:e| ^ failBlock value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         setSyncIfFail: failBlock = ( |
            | 
            = stdin ifFalse: [^ self]. "unsupported on mac"
            os set_SIOUX_nonblocking: false
                              IfFail: [|:e| ^ failBlock value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendIfAsync = ( |
            | 
            suspendForIO).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'Category: file naming\x7fComment: Come up with a unique temporary file name.
-- Ungar, 2/20/95\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         temporaryFileName = ( |
            | 
            "come up with a fairly unique file name"
            selfPreferencesFolderName, directorySeparator, 'Self_temporary_file_', (time current msec printString)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macOS_File' -> () From: ( | {
         'ModuleInfo: Module: macOS InitialContents: FollowSlot'
        
         unimpMac: b = ( |
            | 
            os unimpMac: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: OS and filesystem interface\x7fModuleInfo: Module: macOS InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_statStructure = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macOS_statStructure' -> () From: ( |
             {} = 'Comment: see stat.mac.h in MetroWerks\x7fModuleInfo: Creator: traits macOS_statStructure.
'.
            | ) .
        } | ) 



 '-- Sub parts'

 bootstrap read: 'macPrims_wrappers' From: 'glue'
 bootstrap read: 'macOS_stdin' From: 'core'



 '-- Side effects'

 globals modules macOS postFileIn
