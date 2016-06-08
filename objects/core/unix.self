 'Sun-$Revision: 30.17 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         unix = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'unix' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'unix' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules unix.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: InitializeToExpression: (\'Sun-$Revision: 30.17 $\')\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.17 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'unix' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'unixPrims_wrappers
unix_stdin
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> () From: ( | {
         'Category: OS and filesystem interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         os = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( |
             {} = 'Comment: This object provides low level access to selected Unix calls.
Many Unix calls are provided through the indirect system call, but
files, sockets are opened/closed using specific direct primitives so
that the virtual machine can keep track of open files (necessary for
the select call).
A little philosophy: at the unix (os) level, every operation
takes a failure block to give the user the ability to handle
failures. The block gets one argument, a string with the error code--dmu\x7fModuleInfo: Creator: globals unixGlobals os.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptSocket: socketFile Info: info IfFail: errBlk = ( |
            | 
            while_EINTR_do: [|:errBlk|
                basicAcceptSocket: socketFile 
                             Info: info
                           IfFail: errBlk.
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fComment: See access(2).  Returns the empty string
if access is allowed, a non-empty string
otherwise.
The mode should be one of the constants in accessModes.
\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         access: fileName Mode: mode = ( |
            | 
            syscall: sys_access
               With: fileName copyNullTerminated
                And: 0
               With: mode
                And: 0
             IfFail: [|:e| ^e].
            '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fComment: Modes for for access:Mode:.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         accessModes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'accessModes' -> () From: ( |
             {} = 'Comment: See /usr/include/unistd.h\x7fModuleInfo: Creator: globals unixGlobals os accessModes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Does the file exist?\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_ok = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Is the file readable?\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         r_ok = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Is the file writable?\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         w_ok = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'accessModes' -> () From: ( | {
         'Comment: Is the file executable (searchable for directories)?\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         x_ok = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fComment: Upon success, the bind call returns the port number
(if it is specified as 0, the system will chose one
for us). Agesen, june 1996.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         bindSocket: socket Family: family Port: port Address: address IfFail: errBlk = ( |
            | 
            while_EINTR_do: [|:errBlk|
              basicBindSocket: socket Family: family Port: port Address: address IfFail: errBlk.
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: commands with path checking\x7fComment: Execute cmd as a shell command.
If it fails, see if aFileName exists somewhere
in $PATH.  If not, prompt the user and try again.
-- dmu\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         command: cmd Executing: aFileName IfFail: failBlock = ( |
            | 
            command: cmd ExecutingAll: (vector copyAddFirst: aFileName) IfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: commands with path checking\x7fComment: Execute cmd as a shell command.
If it fails, see if all the fileNames exist somewhere
in $PATH.  If not, prompt the user and try again.
-- dmu\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         command: cmd ExecutingAll: fileNames IfFail: failBlock = ( |
             r.
            | 
            r: command: cmd IfFail: [|:e| ^ failBlock value: e].
            r = 0 ifTrue: [^ r].

            " failed: "

            fileNames do: [ | :fn. fullName | 
              fullName: os_file locate: fn InOrByExtendingPathNamed: 'PATH'.
            ].
            command: cmd IfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         connectSocket: socket Family: family Port: port Address: address IfFail: errBlk = ( |
            | 
            while_EINTR_do: [|:errBlk|
              basicConnectSocket: socket Family: family Port: port Address: address IfFail: errBlk.
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: syscall\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         convertSysCallResultToInt: byteVector = ( |
            | 
            convertSysCallResultToInt: byteVector 
                IfFail: [ |:e| error: e, ' syscall result overflow']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: syscall\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         convertSysCallResultToInt: byteVector IfFail: errBlk = ( |
            | 
            byteVector cIntSize: (typeSizes bitSize: 'int') 
                         Signed: true At: 0 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: OS variants\x7fComment: hooked up to an os variant in postFileIn\x7fModuleInfo: Module: unix InitialContents: InitializeToExpression: (())\x7fVisibility: public'
        
         currentOsVariant* = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         currentOsVariant: variant = ( |
             cmir.
             vmir.
            | 
            cmir: (reflect: currentOsVariant).
            vmir: (reflect: variant).
            cmir = vmir ifTrue: [^ self]. "Only need to set if different."
            cmir isEmpty ifTrue: [
                "Currently the contents is the empty object.
                 We are in the process of filing in the world.
                 At this stage, the transporter module cache is
                 not working, so we cannot use the 'at:PutContents:' 
                 method to set the os variant. Instead use frozenDefine."
                cmir frozenDefine: vmir.
            ] False: [|uMir|
                uMir: (reflect: os).
                "Use frozenDefine to keep module cache clean."
                uMir frozenDefine: (uMir copyAt: 'currentOsVariant' 
                                    PutContents: vmir).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         fcntlFile: file Request: request With: arg IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ |:errBlk|
                basicFcntlFile: file  Request: request  Arg: arg  IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: network and hosts\x7fComment: Convert host name to IP addresses.
Result is a vector of byte vectors (each byte vector is an IP address).
-- Ungar, 2/19/95, Agesen, 24/6/96.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         hostAddressesForName: name IfFail: errBlk = ( |
             res.
            | 
            [  res: (basicGetHostByName: name IfFail: [|:e|
                  ('NOERR' = e)  ||  ['EINTR' = e] ifFalse: [^ errBlk value: e].
                  nil
               ]).
               res isNil
            ] whileTrue.
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: network and hosts\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         hostNameForAddr: addrByteVector IfFail: errBlk = ( |
            | 
            hostNameForAddr: addrByteVector
                       Type: os_file socketConstants af_inet
                     IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | 
            initializeOsVariant).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeOsVariant = ( |
            | 
                 ( host osName = 'sunOS'  )
            || [ ( host osName = 'macOSX' )
            || [   host osName = 'linux' ]]
              ifTrue: [ currentOsVariant: host osVariantName sendTo: osVariants ].
            os_file initializeOsVariant.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctlFile: file Request: request With: arg IfFail: errBlk = ( |
            | 
            convertSysCallResultToInt: 
                syscall: sys_ioctl
                   With: file              And: 0
                   With: request low16Bits And: request high16Bits
                   With: arg               And: 0
                 IfFail: [|:e| ^ errBlk value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: sockets\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         listenSocket: socket Backlog: backlog IfFail: errBlk = ( |
            | 
            while_EINTR_do: [|:errBlk|
              basicListenSocket: socket Backlog: backlog IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: status\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         lseekFile: file Offset: offset Whence: whence IfFail: errBlk = ( |
            | 
            "Move file pointer. Return abs. index of pos. seeked to, zero-based."
            while_EINTR_do: [ |:errBlk|
                basicLseekFile: file  
                        Offset: offset  
                        Whence: whence  
                        IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: directories\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         mkdir: path Mode: mode IfFail: errBlk = ( |
            | 
            syscall: sys_mkdir
               With: path copyNullTerminated And: 0
               With: mode                    And: 0
             IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: opening and closing\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         openFileName: name Flags: flags Mode: mode IfFail: errBlk = ( |
            | 
            "flags describe whether to open for reading, writing etc, and"
            "whether to create the file if it does not already exist."
            "If the file is created, permissions are set according to mode."
            "Filename is _not_ tilde-expanded here."
            while_EINTR_do: [ |:errBlk|
                basicOpenFileName: name  Flags: flags  Mode: mode  IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         osVariants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os osVariants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         bsd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os osVariants bsd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         bytesPerInt32 = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Comment: Interface to the gethostid(2) system call.
          Returns a unique identifier of the current host.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         gethostid = ( |
            | syscall: sys_gethostid IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         machine = ( |
            | (utsname copyFrom: 92 UpTo: 101) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         nodeext = ( |
            | (utsname copyFrom: 18 UpTo:  74) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         nodename = ( |
            | (utsname copyFrom:  9 UpTo:  18) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: controlling\x7fComment: trace some running process\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_attach = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: controlling\x7fComment: continue the child\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_continue = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: controlling\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_deny_attach = 31.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: controlling\x7fComment: stop tracing a process\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_detach = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fComment: for machine-specific requests\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_firstmach = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: controlling\x7fComment: kill the child process\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_kill = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: reading\x7fComment: read word in child\'s D space\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_read_d = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: reading\x7fComment: read word in child\'s I space\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_read_i = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: reading\x7fComment: read word in child\'s user structure\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_read_u = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: controlling\x7fComment: single step the child\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_step = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: controlling\x7fComment: child declares it\'s being traced\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_trace_me = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: writing\x7fComment: write word in child\'s D space\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_write_d = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: writing\x7fComment: write word in child\'s I space\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_write_i = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: ptrace interface (OS X)\x7fCategory: writing\x7fComment: write word in child\'s user structure\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pt_write_u = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | (utsname copyFrom: 74 UpTo:  83) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_access = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fcntl = 92.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_gethostid = 142.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getpid = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ioctl = 54.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lseek = 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mkdir = 136.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ptrace = 26.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_read = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rename = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rmdir = 137.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_uname = 189.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_unlink = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_write = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sysname = ( |
            | (utsname copyFrom:  0 UpTo:   9) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fComment: Interface to the uname system call; do a \'man 2 uname\' for details.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         utsname = ( |
            | 
            utsnameIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fComment: Interface to the uname system call; do a \'man 2 uname\' for details.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         utsnameIfFail: fb = ( |
             buf <- ''.
             bufsize = 101.
            | 
            buf: buf copySize: bufsize.
            "uname(2) returns 0 for success and -1 for failure."
            "but sysCall checks for -1"
            syscall: sys_uname 
               With: buf And: 0 
             IfFail: [|:e| ^ fb value: e].
            buf mapBy: [ |:ch| ch = '\0' ifTrue: ' ' False: ch. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         version = ( |
            | (utsname copyFrom: 83 UpTo:  92) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         linux = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os osVariants linux.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys__llseek = 140.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys__newselect = 142.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys__sysctl = 149.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_access = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_acct = 51.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_add_key = 286.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_adjtimex = 124.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_afs_syscall = 137.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_alarm = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_bdflush = 134.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_break = 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_brk = 45.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_capget = 184.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_capset = 185.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_chdir = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_chmod = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_chown = 182.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_chown32 = 212.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_chroot = 61.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_clock_getres = 266.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_clock_gettime = 265.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_clock_nanosleep = 267.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_clock_settime = 264.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_clone = 120.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_close = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_creat = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_create_module = 127.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_delete_module = 129.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_dup = 41.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_dup2 = 63.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_epoll_create = 254.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_epoll_ctl = 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_epoll_pwait = 319.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_epoll_wait = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_execve = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_exit = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_exit_group = 252.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_faccessat = 307.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fadvise64 = 250.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fadvise64_64 = 272.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fchdir = 133.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fchmod = 94.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fchmodat = 306.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fchown = 95.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fchown32 = 207.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fchownat = 298.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fcntl = 55.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fcntl64 = 221.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fdatasync = 148.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fgetxattr = 231.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_flistxattr = 234.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_flock = 143.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fork = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fremovexattr = 237.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fsetxattr = 228.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fstat = 108.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fstat64 = 197.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fstatat64 = 300.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fstatfs = 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fstatfs64 = 269.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fsync = 118.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ftime = 35.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ftruncate = 93.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ftruncate64 = 194.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_futex = 240.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_futimesat = 299.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_get_kernel_syms = 130.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_get_mempolicy = 275.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_get_robust_list = 312.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_get_thread_area = 244.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getcpu = 318.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getcwd = 183.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getdents = 141.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getdents64 = 220.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getegid = 50.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getegid32 = 202.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_geteuid = 49.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_geteuid32 = 201.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getgid = 47.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getgid32 = 200.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getgroups = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getgroups32 = 205.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getitimer = 105.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getpgid = 132.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getpgrp = 65.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getpid = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getpmsg = 188.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getppid = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getpriority = 96.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getresgid = 171.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getresgid32 = 211.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getresuid = 165.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getresuid32 = 209.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getrlimit = 76.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getrusage = 77.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getsid = 147.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_gettid = 224.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_gettimeofday = 78.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getuid = 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getuid32 = 199.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getxattr = 229.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_gtty = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_idle = 112.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_init_module = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_inotify_add_watch = 292.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_inotify_init = 291.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_inotify_rm_watch = 293.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_io_cancel = 249.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_io_destroy = 246.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_io_getevents = 247.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_io_setup = 245.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_io_submit = 248.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ioctl = 54.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ioperm = 101.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_iopl = 110.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ioprio_get = 290.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ioprio_set = 289.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ipc = 117.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_kexec_load = 283.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_keyctl = 288.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_kill = 37.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lchown = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lchown32 = 198.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lgetxattr = 230.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_link = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_linkat = 303.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_listxattr = 232.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_llistxattr = 233.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lock = 53.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lookup_dcookie = 253.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lremovexattr = 236.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lseek = 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lsetxattr = 227.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lstat = 107.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lstat64 = 196.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_madvise = 219.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_madvise1 = 219.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mbind = 274.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_migrate_pages = 294.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mincore = 218.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mkdir = 39.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mkdirat = 296.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mknod = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mknodat = 297.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mlock = 150.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mlockall = 152.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mmap = 90.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mmap2 = 192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_modify_ldt = 123.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mount = 21.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_move_pages = 317.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mprotect = 125.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mpx = 56.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mq_getsetattr = 282.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mq_notify = 281.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mq_open = 277.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mq_timedreceive = 280.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mq_timedsend = 279.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mq_unlink = 278.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mremap = 163.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_msync = 144.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_munlock = 151.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_munlockall = 153.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_munmap = 91.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_nanosleep = 162.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_nfsservctl = 169.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_nice = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_oldfstat = 28.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_oldlstat = 84.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_oldolduname = 59.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_oldstat = 18.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_olduname = 109.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_open = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_openat = 295.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_pause = 29.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_personality = 136.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_pipe = 42.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_pivot_root = 217.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_poll = 168.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ppoll = 309.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_prctl = 172.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_pread64 = 180.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_prof = 44.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_profil = 98.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_pselect6 = 308.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ptrace = 26.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_putpmsg = 189.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_pwrite64 = 181.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_query_module = 167.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_quotactl = 131.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_read = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_readahead = 225.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_readdir = 89.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_readlink = 85.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_readlinkat = 305.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_readv = 145.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_reboot = 88.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_remap_file_pages = 257.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_removexattr = 235.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rename = 38.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_renameat = 302.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_request_key = 287.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_restart_syscall = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rmdir = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rt_sigaction = 174.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rt_sigpending = 176.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rt_sigprocmask = 175.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rt_sigqueueinfo = 178.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rt_sigreturn = 173.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rt_sigsuspend = 179.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rt_sigtimedwait = 177.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_get_priority_max = 159.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_get_priority_min = 160.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_getaffinity = 242.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_getparam = 155.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_getscheduler = 157.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_rr_get_interval = 161.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_setaffinity = 241.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_setparam = 154.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_setscheduler = 156.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sched_yield = 158.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_select = 82.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sendfile = 187.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sendfile64 = 239.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_set_mempolicy = 276.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_set_robust_list = 311.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_set_thread_area = 243.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_set_tid_address = 258.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setdomainname = 121.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setfsgid = 139.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setfsgid32 = 216.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setfsuid = 138.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setfsuid32 = 215.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setgid = 46.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setgid32 = 214.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setgroups = 81.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setgroups32 = 206.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sethostname = 74.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setitimer = 104.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setpgid = 57.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setpriority = 97.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setregid = 71.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setregid32 = 204.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setresgid = 170.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setresgid32 = 210.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setresuid = 164.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setresuid32 = 208.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setreuid = 70.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setreuid32 = 203.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setrlimit = 75.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setsid = 66.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_settimeofday = 79.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setuid = 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setuid32 = 213.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_setxattr = 226.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sgetmask = 68.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sigaction = 67.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sigaltstack = 186.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_signal = 48.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sigpending = 73.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sigprocmask = 126.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sigreturn = 119.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sigsuspend = 72.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_socketcall = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_splice = 313.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ssetmask = 69.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_stat = 106.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_stat64 = 195.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_statfs = 99.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_statfs64 = 268.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_stime = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_stty = 31.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_swapoff = 115.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_swapon = 87.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_symlink = 83.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_symlinkat = 304.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sync = 36.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sync_file_range = 314.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sysfs = 135.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_sysinfo = 116.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_syslog = 103.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_tee = 315.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_tgkill = 270.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_time = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_timer_create = 259.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_timer_delete = 263.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_timer_getoverrun = 262.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_timer_gettime = 261.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_timer_settime = 260.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_times = 43.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_tkill = 238.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_truncate = 92.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_truncate64 = 193.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ugetrlimit = 191.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ulimit = 58.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_umask = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_umount = 22.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_umount2 = 52.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_uname = 122.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_unlink = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_unlinkat = 301.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_unshare = 310.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_uselib = 86.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ustat = 62.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_utime = 30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_utimes = 271.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_vfork = 190.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_vhangup = 111.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_vm86 = 166.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_vm86old = 113.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_vmsplice = 316.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_vserver = 273.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_wait4 = 114.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_waitid = 284.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_waitpid = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_write = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_writev = 146.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         unameInterface* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os osVariants macOS_X unameInterface.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         unameInterface* = bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_X = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os osVariants macOS_X.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         machine = ( |
            | 
            _Machine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         nodeext = ( |
            | 
            error: 'no nodeext on MacOSX').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         nodename = ( |
            | 
            _NodeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'bsd' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | 
            _Release).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sysname = ( |
            | 
            _SysName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         machine = ( |
            | 
            _Machine).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         nodeext = ( |
            | 
            error: 'no nodeext on MacOSX').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         nodename = ( |
            | 
            _NodeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | 
            _Release).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sysname = ( |
            | 
            _SysName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         utsNameIfFail: fb = ( |
            | 
            error: 'no utsName on MacOSX').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> 'unameInterface' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         version = ( |
            | 
            _Version).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         utsNameIfFail: fb = ( |
            | 
            error: 'no utsName on MacOSX').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         version = ( |
            | 
            _Version).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         solaris = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os osVariants solaris.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         getSubString: index = ( |
            | 
            (utsname copyFrom: index * sys_nmln UpTo: index succ * sys_nmln)
              shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         gethostid = ( | {
                 'ModuleInfo: Module: unix InitialContents: FollowSlot'
                
                 buf <- ''.
                }  {
                 'ModuleInfo: Module: unix InitialContents: FollowSlot'
                
                 buf_size = 256.
                }  {
                 'ModuleInfo: Module: unix InitialContents: FollowSlot'
                
                 bv.
                }  {
                 'ModuleInfo: Module: unix InitialContents: FollowSlot'
                
                 hostid.
                }  {
                 'ModuleInfo: Module: unix InitialContents: FollowSlot'
                
                 length.
                } 
            | 
            buf: buf copySize: buf_size.
            "sysinfo(2) returns if positiv the required number of bytes
             in the buffer or -1 for failure."
            length:  convertSysCallResultToInt:
                       syscall: sys_systeminfo 
                          With: system_info si_hw_serial And: 0
                          With: buf                      And: 0
                          With: buf_size                 And: 0
                          IfFail: raiseError.
             buf: buf copyAtMost: length pred.

             "Convert the result to a byteVector of size 4"
             hostid: buf asInteger hexPrintString.
             bv: byteVector copySize: 4.
             3 downTo: 0 Do: [| :index |
               hostid size > 2 ifTrue: [
                  bv at: index Put:
                    (hostid copyFrom: hostid size - 2)
                        hexAsInteger asByte.
                  hostid: hostid copyAtMost: hostid size - 2
                ] False: [
                  bv at: index Put: hostid hexAsInteger.
                  hostid: ''
                 ]
             ].
             bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         machine = ( |
            | getSubString: 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         nodename = ( |
            | getSubString: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | getSubString: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_access = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_fcntl = 62.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_getpid = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_ioctl = 54.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_lseek = 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_mkdir = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fComment: Size of each string field\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         sys_nmln = 257.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_read = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_rename = 134.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_systeminfo = 139.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_uname = 135.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_unlink = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: syscall constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sys_write = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         sysname = ( |
            | getSubString: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Comment: system_info constants from /usr/include/sys/systeminfo.h\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         system_info = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os osVariants solaris system_info.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_architecture = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_hostname = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_hw_provider = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_hw_serial = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_machine = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_release = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_srpc_domain = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_sys_name = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> 'system_info' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         si_version = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fComment: Interface to the uname system call; do a \'man 2 uname\' for details.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         utsname = ( |
            | 
            utsnameIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fComment: Interface to the uname system call; do a \'man 2 uname\' for details.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         utsnameIfFail: fb = ( |
             buf <- ''.
            | 
            buf: buf copySize: (sys_nmln * 5).
            "uname(2) returns 0 for success and -1 for failure."
            "sys call checks for -1"
            syscall: sys_uname With: buf And: 0 
             IfFail: [|:e| fb value: e]. 
            buf mapBy: [ |:ch| ch = '\0' ifTrue: ' ' False: ch. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Category: uname interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         version = ( |
            | getSubString: 3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'abstract_OS' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         ptraceRequest: request PID: pid Address: address Data: dataBytes = ( |
            | 
            ptraceRequest: request
                      PID: pid
                  Address: address
                     Data: dataBytes
                   IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         ptraceRequest: request PID: pid Address: address Data: dataBytes IfFail: errBlk = ( |
            | 
            "untested"
            "request is e.g. pt_attach"
            convertSysCallResultToInt: 
                syscall: sys_ptrace
                   With: request low16Bits    And: request high16Bits
                   With: pid     low16Bits    And: pid     high16Bits
                   With: address low16Bits    And: address high16Bits
                   With: dataBytes            And: 0  "in/out"
                 IfFail: [|:e| ^ errBlk value: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: file naming\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         rename: path1 To: path2 IfFail: failBlk = ( |
            | 
            "rename(2V) returns 0 for success and -1 for failure."
                syscall: sys_rename 
                   With: path1 copyNullTerminated And: 0 
                   With: path2 copyNullTerminated And: 0
                 IfFail: failBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: directories\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         rmdir: path IfFail: errBlk = ( |
            | 
            syscall: sys_rmdir
               With: path copyNullTerminated And: 0
             IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: select\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         selectInto: selectVector MaxFiles: maxFiles IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ |:errBlk|
                basicSelectInto: selectVector asVector
                           Size: maxFiles
                         IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: select\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         selectReadInto: selectVector MaxFiles: maxFiles IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ |:errBlk|
                basicSelectReadInto: selectVector asVector
                           Size: maxFiles
                         IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: opening and closing\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         socketDomain: domain Type: type Protocol: protocol IfFail: errBlk = ( |
            | 
            while_EINTR_do: [|:errBlk|
              basicSocketDomain: domain Type: type Protocol: protocol IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: syscall\x7fComment: The indirect system call is provided through the following methods.
There are 5 different versions of the indirect system call taking
respectively 0, 1, 2, 3 or 4 arguments in addition to the syscall
number (cf. /usr/include/syscall.h).  Each argument can be a smallInt,
a float or a byte vector (including the string hierarchy).  If an 
argument is a smallInt, it is converted to the C type int, if an
argument is a self float, it is converted to the C type float, and if
an argument is a byte vector, it is converted to a pointer to the 
bytes part of this byte vector, i.e. the C type void *.  All arguments
to the syscall methods come in pairs:  (arg, off).  If the arg is a 
smallInt or a float, off is ignored.  If arg is a byte vector, off
must be a smallInt which is used as an index into the byte vector.
That is, the resulting void * pointer points to the byte given by
off.  The result of a syscall is a byte vector containing the result
of the unix syscall(2), which can be converted to an int using
convertSysCallresultToInt:.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         syscall: callNo IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ | :errBlk |
                callNo asSmallInteger _SyscallIfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: syscall\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         syscall: callNo With: arg0 And: off0 IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ | :errBlk |
                callNo asSmallInteger _SyscallWith: arg0 And: off0 
                                            IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: syscall\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         syscall: callNo With: arg0 And: off0 With: arg1 And: off1 IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ | :errBlk |
                callNo asSmallInteger _SyscallWith: arg0 And: off0
                                              With: arg1 And: off1 
                                            IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: syscall\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         syscall: callNo With: arg0 And: off0 With: arg1 And: off1 With: arg2 And: off2 IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ | :errBlk |
                callNo asSmallInteger _SyscallWith: arg0 And: off0
                                              With: arg1 And: off1
                                              With: arg2 And: off2
                                            IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: syscall\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         syscall: callNo With: arg0 And: off0 With: arg1 And: off1 With: arg2 And: off2 With: arg3 And: off3 IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ | :errBlk |
                callNo asSmallInteger _SyscallWith: arg0 And: off0
                                              With: arg1 And: off1
                                              With: arg2 And: off2
                                              With: arg3 And: off3
                                            IfFail: errBlk
            ] IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         testPtrace = ( |
            | 
            ptraceRequest: pt_attach
                      PID: 1234
                  Address: 1234
                     Data: int32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: file operations\x7fCategory: file naming\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         unlink: fileName IfFail: errBlk = ( |
            | 
            while_EINTR_do: [ |:errBlk| basicUnlink: fileName IfFail: errBlk]
                    IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> () From: ( | {
         'Category: interrupt handling\x7fComment: Since many system calls can pseudo-fail with EINTR
     I check for that and retry.
     calls include: wait, msg*, sig* auditsvc, close,
     connect, creat, fcntl, getdents, getdirentries,
     getmsg, open, poll, putmsg, read, recv*, readv, select,
     semop, send*, write*, alowait*, lockf.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         while_EINTR_do: callBlock IfFail: errBlk = ( |
            | 
            [
                [ | :exit_inner_and_retry |
                    ^ callBlock value: [ | :error |
                         error = 'EINTR' ifTrue: exit_inner_and_retry.
                         errBlk value: error.
                    ].
                ] exit.
                scheduler isRunning ifTrue: [ process this yield ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> () From: ( | {
         'Category: OS and filesystem interface\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         os_file = bootstrap define: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os_file' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os_file' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals unixGlobals os_file.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         atEOF <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         name <- 'I have never been opened.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         unixFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'unixFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: InitializeToExpression: (semaphore copyCount: 0 Capacity: 1)\x7fVisibility: private'
        
         readSema <- semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os_file' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: InitializeToExpression: (semaphore copyCount: 0 Capacity: 1)\x7fVisibility: private'
        
         writeSema <- semaphore copyCount: 0 Capacity: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         writeAppendCreate = ( |
            | write || create || append).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         writeAppendCreateTruncate = ( |
            | 
            write || create || truncate || append).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         writeCreate = ( |
            | write || create).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         writeCreateTruncate = ( |
            | write || create || truncate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: accepting\x7fComment: Returns a socket.
Accept returns NOERR if there is no connetion yet.
Before successful return, \'infoBlk\' is invoked with data about
the accepted connection: the port number (an integer), 
the family (an integer), and the address (a byteVector).\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptConnectionInfo: infoBlk IfFail: errBlk = ( |
             err.
             info.
             newSocket.
            | 
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
            newSocket).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: binding\x7fComment: Upon success, the bind call returns the port number
(if it is specified as 0, the system will chose one
for us). Agesen, june 1996.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         bindFamily: family Port: port Address: address IfFail: errBlk = ( |
            | 
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
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         bsdAndSolarisSharedSocketConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( |
             {} = 'Comment: Constants that *happen* to have the same value
on solaris and bsd are defined here rather than
in the OS specific objects.\x7fModuleInfo: Creator: traits unixFile bsdAndSolarisSharedSocketConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: address families\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         af_appletalk = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: address families\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         af_inet = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: address families\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         af_unix = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: address families\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         af_unspec = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: protocol familes (same as address for now)\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         pf_appletalk = ( |
            | af_appletalk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: protocol familes (same as address for now)\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         pf_inet = ( |
            | af_inet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: protocol familes (same as address for now)\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         pf_unix = ( |
            | af_unix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: protocol familes (same as address for now)\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         pf_unspec = ( |
            | af_unspec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_acceptconn = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_broadcast = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_debug = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_dontroute = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_keepalive = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_linger = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_oobinline = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_reuseaddr = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         so_useloopback = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> () From: ( | {
         'Category: get/set sockopt\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sol_socket = 65535.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: connecting\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         connectFamily: family Port: port Address: address IfFail: errBlk = ( |
             err.
             res.
            | 
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
                IfNotNil: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: OS variants\x7fComment: hooked up to an os variant in postFileIn\x7fModuleInfo: Module: unix InitialContents: InitializeToExpression: (())\x7fVisibility: public'
        
         currentOsVariant* = ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         currentOsVariant: variant = ( |
             cmir.
             vmir.
            | 
            cmir: (reflect: traits unixFile currentOsVariant).
            vmir: (reflect: variant).
            cmir = vmir ifTrue: [^ self]. "Only need to set if different."
            cmir isEmpty ifTrue: [
                "Currently the contents is the empty object.
                 We are in the process of filing in the world.
                 At this stage, the transporter module cache is
                 not working, so we cannot use the 'at:PutContents:' 
                 method to set the os variant. Instead use frozenDefine."
                cmir frozenDefine: vmir.
            ] False: [|tufMir|
                tufMir: (reflect: traits unixFile).
                "Use frozenDefine to keep module cache clean."
                tufMir frozenDefine: (tufMir copyAt: 'currentOsVariant' 
                                        PutContents: vmir).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         dataReady = ( |
            | 
            (os selectReadInto: selectVec MaxFiles: maxFiles 
              IfFail: [ error: 'dataReady: select failed'. ])
                do: [|:i| fileDescriptor = (selectVec at: i) ifTrue: [^true]].
            ^false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         dirPath = ( |
            | _DirPath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         dirPath: str = ( |
            | _DirPath: str asVMByteVector. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         directorySeparator = '/'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         inetConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'inetConstants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile inetConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'inetConstants' -> () From: ( | {
         'Comment: From header file netinet/in.h\x7fModuleInfo: Module: unix InitialContents: InitializeToExpression: (byteVector copySize: 4 FillingWith: 0)\x7fVisibility: public'
        
         in_addr_any = byteVector copySize: 4 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeOsVariant = ( |
            | 
                 ( host osName = 'sunOS'  )
            || [ ( host osName = 'macOSX' )
            || [   host osName = 'linux' ]]
              ifTrue: [ currentOsVariant: host osVariantName sendTo: osVariants ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         isAbsolutePath: path = ( |
            | directorySeparator = path first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: constants\x7fComment: max. number of open files\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         maxFiles = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: constants\x7fComment: Permissions to give file being opened.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         mode = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'mode' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile mode.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'mode' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         allRW = 438.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'mode' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         allRWX = 511.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         noLockReadInto: buf Min: min Max: max At: start IfFail: fb = ( |
             transferred <- 0.
            | 
            [| res <- 0. |
                res: (os basicReadFile: self Into: buf
                      Offset: start + transferred
                      Count: max - transferred IfFail: [|:e|
                          ('NOERR'  != e) && ['EINTR'       != e] &&
                          ['EAGAIN' != e] && ['EWOULDBLOCK' != e] ifTrue: [
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         openTCPHost: host Port: port IfFail: errBlk = ( |
             a.
             addrs.
             s.
            | 
            addrs: (os hostAddressesForName: host IfFail: [|:err| 
                ^ errBlk value: 'hostAddressForName failed: ', err.
            ]).
            a: addrs first.    "Should perhaps be more careful here?"

            s: socketDomain: socketConstants pf_inet Type: socketConstants sock_stream Protocol: 0
               IfFail: [|:e| ^ errBlk value: 'socket failed: ', e].

            s connectFamily: socketConstants af_inet Port: port Address: a
               IfFail: [|:e|  s closeIfFail: [].   ^ errBlk value: 'connect failed: ', e].

            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         openTCPListenerOnPort: port IfFail: errBlk = ( |
             s.
            | 
            s: socketDomain: socketConstants pf_inet Type: socketConstants sock_stream Protocol: 0
               IfFail: [|:e| ^ errBlk value: 'socket failed: ', e].

            s bindFamily: socketConstants af_inet Port: port Address: inetConstants in_addr_any
                  IfFail: [|:err|   s closeIfFail: [].  ^ errBlk value: 'bind failed: ', err].

            s listenBacklog: 5  
                     IfFail: [|:e|   s closeIfFail: [].  ^ errBlk value: 'listen failed: ', e].

            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         os = bootstrap stub -> 'globals' -> 'unixGlobals' -> 'os' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: OS variants\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         osVariants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         bsd = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         fcntls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'fcntls' -> () From: ( |
             {} = 'Comment: These are all found in /usr/include/fcntl.h\x7fModuleInfo: Creator: traits unixFile osVariants bsd fcntls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'fcntls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         f_setfl = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'fcntls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         f_setown = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'fcntls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         fasync = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'fcntls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         fndelay = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Comment: What to do with the file being opened.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         flags = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd flags.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         append = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         combinations* = bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         create = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         nonblock = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         read = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         readWrite = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         truncate = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         write = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( |
             {} = 'Comment: Disabled: 
                ^ audio_get_info   = ( | high16Bits = 16r40XX.  low16Bits = 16r4101. | ).
                ^ audio_set_info   = ( | high16Bits = 16rc0XX.  low16Bits = 16r4102. | ).\x7fModuleInfo: Creator: traits unixFile osVariants bsd ioctls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_drain = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_drain' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_drain.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_drain' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_drain' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 16643.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_get_qsize = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_get_qsize' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_get_qsize.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_get_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 16388.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_get_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12553.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_pause = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_pause' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_pause.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_pause' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_pause' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12549.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_read_start = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_read_start' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_read_start.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_read_start' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_read_start' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12547.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_readq = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_readq' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_readq.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_readq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 16388.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_readq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12551.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_resume = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_resume' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_resume.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_resume' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_resume' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12550.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_set_qsize = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_set_qsize' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_set_qsize.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_set_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 32772.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_set_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12554.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_stop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_stop' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_stop.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_stop' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_stop' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12548.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_writeq = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_writeq' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls audio_writeq.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_writeq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 16388.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'audio_writeq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12552.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
            | 
            byteVector copySize: (typeSizes byteSize: 'int')
              cIntSize: (typeSizes bitSize: 'int')
                Signed: true 
                    At: 0 
                   Put: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'Comment: set and clear can used when as the arg argument to ioctl\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         set = ( |
            | 
            byteVector copySize: (typeSizes byteSize: 'int')
              cIntSize: (typeSizes bitSize: 'int')
                Signed: true 
                    At: 0 
                   Put: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         siocspgrp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'siocspgrp' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls siocspgrp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'siocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 32772.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'siocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 29448.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         tiocspgrp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'tiocspgrp' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd ioctls tiocspgrp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'tiocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 32772.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'ioctls' -> 'tiocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 29814.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'Comment: Set asynchronous I/O and notification via SIGIO\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setAsyncIfFail: failBlock = ( |
            | 
             fcntl: fcntls f_setfl  
              With: fcntls fasync || fcntls fndelay  
            IfFail: [|:e| ^ failBlock value: e].
             setOwnerIfFail: nil.
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setNotifyEventsIfFail: failBlock = ( |
            | 
             fcntl: fcntls f_setfl  
              With: fcntls fasync
            IfFail: [|:e| ^ failBlock value: e].

            setOwnerIfFail: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setOwnerIfFail: fb = ( |
            | 
            fcntl: fcntls f_setown With: os getpid IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         socketConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants bsd socketConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         bsdAndSolarisShared* = bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_dgram = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_raw = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_rdm = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_seqpacket = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_stream = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendIfAsync = ( |
            | 
            setOwnerIfFail: [process this yield. ^ self].
            suspendForIO).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         linux = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants linux.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         fcntls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants linux fcntls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_dupfd = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_exlck = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_getfd = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_getfl = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_getlk = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_getown = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_getsig = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_inprogress = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_linux_specific_base = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_rdlck = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_setfd = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_setfl = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_setlk = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_setlkw = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_setown = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_setsig = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_shlck = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_unlck = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         f_wrlck = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fasync = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fd_cloexec = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_ex = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_mand = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_nb = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_read = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_rw = 192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_sh = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_un = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         lock_write = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_accmode = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_append = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_creat = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_direct = 16384.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_directory = 65536.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_excl = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_largefile = 32768.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_ndelay = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_noatime = 262144.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_noctty = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_nofollow = 131072.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_nonblock = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_rdonly = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_rdwr = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_sync = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_trunc = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'fcntls' -> () From: ( | {
         'Category: ioctls\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         o_wronly = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         flags = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants linux flags.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         append = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         combinations* = bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         create = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         nonblock = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         read = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         readWrite = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         truncate = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         write = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants linux ioctls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fioasync = 21586.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fioclex = 21585.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fionbio = 21537.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fionclex = 21584.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fionread = 21531.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         fioqsize = 21600.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcflsh = 21515.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcgeta = 21509.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcgets = 21505.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcsbrk = 21513.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcsbrkp = 21541.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcseta = 21510.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcsetaf = 21512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcsetaw = 21511.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcsets = 21506.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcsetsf = 21508.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcsetsw = 21507.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tcxonc = 21514.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tioccbrk = 21544.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tioccons = 21533.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocexcl = 21516.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocgetd = 21540.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocghayesesp = 21598.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocgicount = 21597.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocglcktrmios = 21590.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocgpgrp = 21519.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocgserial = 21534.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocgsid = 21545.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocgsoftcar = 21529.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocgwinsz = 21523.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tioclinux = 21532.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocmbic = 21527.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocmbis = 21526.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocmget = 21525.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocmiwait = 21596.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocmset = 21528.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocnotty = 21538.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocnxcl = 21517.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocoutq = 21521.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt = 21536.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt_data = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt_dostop = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt_flushread = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt_flushwrite = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt_nostop = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt_start = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocpkt_stop = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsbrk = 21543.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsctty = 21518.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocser_temt = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocserconfig = 21587.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsergetlsr = 21593.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsergetmulti = 21594.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsergstruct = 21592.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsergwild = 21588.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsersetmulti = 21595.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocserswild = 21589.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsetd = 21539.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocshayesesp = 21599.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocslcktrmios = 21591.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocspgrp = 21520.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsserial = 21535.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocssoftcar = 21530.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocsti = 21522.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         tiocswinsz = 21524.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'Comment: Set asynchronous I/O and notification via SIGIO\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setAsyncIfFail: failBlock = ( |
            | 
             fcntl: fcntls f_setfl  
              With: fcntls o_nonblock
            IfFail: [|:e| ^ failBlock value: e].

            setNotifyEventsIfFail: failBlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setNotifyEventsIfFail: failBlock = ( |
            | 
             fcntl: fcntls f_setfl  
              With: fcntls fasync || fcntls o_nonblock
            IfFail: [|:e| ^ failBlock value: e].

            setOwnerIfFail: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setOwnerIfFail: fb = ( |
            | 
            fcntl: fcntls f_setown With: os getpid IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         socketConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'socketConstants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants linux socketConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> 'socketConstants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         bsdShared* = bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> 'socketConstants' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'linux' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendIfAsync = ( |
            | 
            setOwnerIfFail: [process this yield. ^ self].
            suspendForIO).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS_X = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'macOS_X' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants macOS_X.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'bsd' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'macOS_X' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendIfAsync = ( |
            | 
            " On OSX, calling setOwnerIfFail: on the 
              standard streams (stdin etc) will fail
              with ENOTTY. However the streams still 
              cause SIGIO to be sent so work as async
              from Self's point of view. This isn't 
              documented anywhere I can see. So we 
              don't continually poll and peg a core, 
              we ignore this failure.

              Note that suspendIfAsync on OS X DOES
              NOT WORK for named pipes. This appears
              to be a OS X restriction not a Self one.
              - rca 2016-05-08"

            setOwnerIfFail: [|:e|
              'ENOTTY' = e 
                ifFalse: [process this yield. ^ self]].
            suspendForIO).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         solaris = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         fcntls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'fcntls' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris fcntls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'fcntls' -> () From: ( | {
         'Comment: /usr/include/sys/fcntl.h\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         f_setfl = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'fcntls' -> () From: ( | {
         'Comment: /usr/include/sys/fcntl.h\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         o_nonblock = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Comment: What to do with the file being opened.\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         flags = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris flags.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         append = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         combinations* = bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         create = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         read = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         readWrite = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         truncate = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'flags' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         write = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctls = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_drain = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_drain' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_drain.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_drain' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_drain' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 16643.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_get_qsize = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_get_qsize' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_get_qsize.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_get_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 16388.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_get_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12553.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_pause = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_pause' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_pause.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_pause' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_pause' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12549.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_read_start = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_read_start' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_read_start.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_read_start' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_read_start' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12547.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_readq = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_readq' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_readq.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_readq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 16388.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_readq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12551.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_resume = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_resume' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_resume.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_resume' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_resume' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12550.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_set_qsize = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_set_qsize' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_set_qsize.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_set_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 32772.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_set_qsize' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12554.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_stop = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_stop' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_stop.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_stop' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_stop' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12548.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         audio_writeq = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_writeq' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls audio_writeq.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_writeq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 16388.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'audio_writeq' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 12552.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
            | 
            byteVector copySize: (typeSizes byteSize: 'int')
              cIntSize: (typeSizes bitSize: 'int')
                Signed: true 
                    At: 0 
                   Put: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'Comment: set and clear can used when as the arg argument to ioctl\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         set = ( |
            | 
            byteVector copySize: (typeSizes byteSize: 'int')
              cIntSize: (typeSizes bitSize: 'int')
                Signed: true 
                    At: 0 
                   Put: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         setsig = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'setsig' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls setsig.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'setsig' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'setsig' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 21257.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         siocspgrp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'siocspgrp' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls siocspgrp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'siocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 32772.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'siocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 29448.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         tiocspgrp = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'tiocspgrp' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris ioctls tiocspgrp.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'tiocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         high16Bits = 32772.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'ioctls' -> 'tiocspgrp' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot'
        
         low16Bits = 29814.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'Comment: Set asynchronous I/O and notification via SIGIO\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setAsyncIfFail: failBlock = ( |
            | 
             fcntl: fcntls f_setfl  
              With: fcntls o_nonblock
            IfFail: [|:e| ^ failBlock value: e].

            setNotifyEventsIfFail: failBlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setNotifyEventsIfFail: failBlock = ( |
            | 
            "Signal with SIGPOLL (aka SIGIO) for important events.
             See streamio(7) and /usr/include/sys/stropt.h"
             ioctl: ioctls setsig 
              With: 1 || 2 || 4 || 8 || 16r40 "S_INPUT | S_HIPRI | S_OUTPUT | S_MSG | S_RDNORM"
            IfFail: [].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         socketConstants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'socketConstants' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits unixFile osVariants solaris socketConstants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'socketConstants' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         bsdAndSolarisShared* = bootstrap stub -> 'traits' -> 'unixFile' -> 'bsdAndSolarisSharedSocketConstants' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_dgram = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_raw = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_rdm = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_seqpacket = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> 'socketConstants' -> () From: ( | {
         'Category: socket types\x7fModuleInfo: Module: unix InitialContents: FollowSlot'
        
         sock_stream = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> 'osVariants' -> 'solaris' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         suspendIfAsync = ( |
            | 
            scheduler isRunning ifTrue: [suspendForIO]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'ModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         pathSeparator = ':'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: unix InitialContents: InitializeToExpression: (vector copySize: 64)\x7fVisibility: private'
        
         selectVec = vector copySize: 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: private'
        
         setSyncIfFail: failBlock = ( |
            | 
            fcntl: fcntls f_setfl 
             With: 0
            IfFail: [|:e| ^ failBlock value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'unixFile' -> () From: ( | {
         'Category: file naming\x7fComment: Come up with a unique temporary file name.
-- Ungar, 2/20/95\x7fModuleInfo: Module: unix InitialContents: FollowSlot\x7fVisibility: public'
        
         temporaryFileName = ( |
            | 
            "come up with a fairly unique file name"
            '/tmp/Self_temporary_file_', (time current msec printString)).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'unixPrims_wrappers' From: 'glue'
 bootstrap read: 'unix_stdin' From: 'core'



 '-- Side effects'

 globals modules unix postFileIn
