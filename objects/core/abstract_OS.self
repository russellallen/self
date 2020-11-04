 '$Revision: 30.16 $'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: os\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         abstract_OS = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstract_OS.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: file operations\x7fCategory: opening and closing\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         closeFile: file IfFail: errBlk = ( |
            | 
            basicCloseFile: file IfFail: errBlk.  file kill. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: line breaks\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         fixLineBreaksForPrinting: aString = ( |
             r.
            | 
            r: list copyRemoveAll.
            aString do: [|:c. :i|
              case if: [c != '\r'] Then: [r add: c]
                   If: [(aString at: i succ IfAbsent: 'x') = '\n'] Then: []
                   Else: [r add: '\n'] 
            ].
            r asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: network and hosts\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         hostAddressesForName: name = ( |
            | 
            hostAddressesForName: name IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: network and hosts\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         hostNameForAddr: addrByteVector = ( |
            | hostNameForAddr: addrByteVector IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: network and hosts\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         hostNameForAddr: addrByteVector Type: type = ( |
            | hostNameForAddr: addrByteVector Type: type IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: network and hosts\x7fComment: addrByteVector is a host address (such as returned by \'hostAddressesForName:\').
type is an integer address type (e.g. af_inet).
Returns host name as a string.\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         hostNameForAddr: addrByteVector Type: type IfFail: errBlk = ( |
            | 
            basicGetHostByAddr: addrByteVector Type: type IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeForCurrentPlatform = ( |
            | os initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: file operations\x7fCategory: directories\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         mkdir: path Mode: mode = ( |
            | mkdir: path Mode: mode IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: os commands\x7fComment: Deprecated - use outputOfCommand:Timeout:IfFail: instead 
-- Russell, Nov 20

Attempts to run the os command commandSource
in a separate OS-level process. Redirects the
text output of the command into a temporary
file, and returns the contents of that file
after the specified delay.
-- Adam & Alex, March 04\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         outputOfCommand: commandSource Delay: ms IfFail: fb = ( |
            | 
            withTempFileDo: [|:tmpName|
              command: commandSource, ' > ', tmpName, ' &' IfFail: [ ^ fb value ].
              times delay: ms.
              tmpName asFileContents.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: os commands\x7fComment: Attempts to run the os command commandSource
in a separate OS-level process. Redirects the
text output of the command into a temporary
file, and returns the contents of that file
after process has finished.\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         outputOfCommand: commandSource IfFail: fb = ( |
            | 
            outputOfCommand: commandSource Timeout: infinity IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: os commands\x7fComment: Attempts to run the os command commandSource
in a separate OS-level process. Redirects the
text output of the command into a temporary
file, and returns the contents of that file
after process has finished.\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         outputOfCommand: commandSource Timeout: ms IfFail: fb = ( |
             endTime.
             flag.
             output.
            | 
              output: os_file temporaryFileName.
              flag: output, '.flag'.
              " We don't timeout, if timeout is infinite in length "
              ms = infinity ifFalse: [endTime: time current addMsec: ms].
            [
              command: '( ', commandSource, ' > ', output, ' ; echo finished > ', flag, ' ) & ' IfFail: [ ^ fb value ].
              [ ((ms != infinity) && [time current > endTime]) || (os_file exists: flag) ] whileFalse.
              " Return output of command "
              (os_file exists: flag) ifTrue: [output asFileContents]
                                      False: [fb value: 'Timed out'].

            ] onReturn: [
              unlink: output IfFail: [].
              unlink: flag IfFail: []
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: file operations\x7fCategory: file naming\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         rename: path1 To: path2 = ( |
            | 
            rename: path1
                To: path2
            IfFail: [|:err| 
              error: 'renaming ', path1, ' to ', path2, ' failed (', err, ')']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: file operations\x7fCategory: directories\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         rmdir: path = ( |
            | 
            rmdir: path IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: file operations\x7fCategory: file naming\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         unlink: fileName = ( |
            | 
            unlink: fileName IfFail: [|:err |
              error: 'Could not remove ', fileName, ' (', err, ')']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstract_OS' -> () From: ( | {
         'Category: file operations\x7fCategory: temporary files\x7fComment: Creates a temporary file name, passes it into the specified block,
and then removes the file with that name (if it exists) when the
block is done executing. -- Adam & Alex, March 04\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         withTempFileDo: aBlock = ( |
             r.
             tmpName.
            | 
            tmpName: os_file temporaryFileName.
            [r: aBlock value: tmpName] onReturn: [unlink: tmpName IfFail: []].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fModuleInfo: Module: abstract_OS InitialContents: InitializeToExpression: (vector copySize: 256)\x7fVisibility: public'
        
         fileTable = vector copySize: 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot'
        
         abstract_OS = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules abstract_OS.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.16 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'abstract_OS' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: platform\x7fCategory: host and filesystem\x7fComment: OS-independant files\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractFile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening flags\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         abstractFlags = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractFile' -> 'abstractFlags' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractFile abstractFlags.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: accepting\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptConnection = ( |
            | acceptConnectionIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: accepting\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptConnectionIfFail: fb = ( |
            | 
            acceptConnectionInfo: [] IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: accepting\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptConnectionInfo: infoBlk = ( |
            | acceptConnectionInfo: infoBlk IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         addPath: str = ( |
            | dirPath: dirPath, pathSeparator, str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         atEnd = ( |
            | 
            atEOF).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: binding\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         bindFamily: family Port: port Address: address = ( |
            | 
            bindFamily: family Port: port Address: address IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         bufferPrototype = ( |
            | 
            mutableString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: closing\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | 
            closeIfFail: [ | :e | ^error: e Op: 'close' FileName: name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: closing\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         closeIfFail: fb = ( |
            | 
            os closeFile: self IfFail: [ | :e | ^fb value: e].
            kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: connecting\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         connectFamily: family Port: port Address: address = ( |
            | 
            connectFamily: family Port: port Address: address IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: copying\x7fComment: cloning kills\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            clone resetLock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: copying\x7fComment: Copy, set blocking mode, but signal SIGIO when operations complete.\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         copyBlockingFd: fd Name: n = ( |
            | 
            ((copyName: n) setFd: fd) setNotifyEvents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFd: fd Name: n = ( |
            | ((copyName: n) setFd: fd) setAsync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         copyName: n = ( |
            | copy name: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         createForAppend: fileName = ( |
            | 
            open: fileName Flags: flags writeAppendCreateTruncate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         createForAppend: fileName IfFail: errBlk = ( |
            | 
            open: fileName Flags: flags writeAppendCreateTruncate
                          IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         currentPosition = ( |
            | 
            "Return current position in file. Works only for seekable devices."
             lseekOffset: 0 Whence: seek_cur).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         error: error Op: operation FileName: fileName = ( |
            | 
            error: error, ' while trying to ', operation,
                   ' file "', fileName, '"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         exists: fileName = ( |
            | 
            exists: fileName Mode: os accessModes f_ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         exists: fileName Mode: accessMode = ( |
            | 
            '' = (os access: ( expand: fileName ) Mode: accessMode)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         existsAndIsExecutableOrSearchable: fileName = ( |
            | 
            exists: fileName Mode: os accessModes x_ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         existsAndIsReadable: fileName = ( |
            | 
            exists: fileName Mode: os accessModes r_ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         existsAndIsWritable: fileName = ( |
            | 
            exists: fileName Mode: os accessModes w_ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         fcntl: req With: arg = ( |
            | 
            fcntl: req With: arg
              IfFail: [ |:e| error: e Op: 'fcntl' FileName: name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         fcntl: req With: arg IfFail: fb = ( |
            | 
            os fcntlFile: self Request: req With: arg IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         fileTableEntry = ( |
            | fileTable at: fileDescriptor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         fileTableEntry: s = ( |
            | fileTable at: fileDescriptor Put: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         fstat = ( |
            | 

            fstatIfFail: [|:e| ^error: 'fstat failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize: fileName = ( |
            | initialize: fileName IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize: fileName IfFail: failBlock = ( |
            | 
            name: fileName.
            process this isScheduled ifTrue: [ 
               setAsyncIfFail: [|:e| name: ''.  ^ failBlock value: e].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctl: req = ( |
            | 
            ioctl: req With: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctl: req IfFail: failBlock = ( |
            | ioctl: req With: 0 IfFail: failBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctl: req With: arg = ( |
            | 
            ioctl: req  With: arg
              IfFail: [ |:e| error: e Op: 'ioctl' FileName: name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         ioctl: req With: arg IfFail: fb = ( |
            | 
            os ioctlFile: self Request: req With: arg IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         isOpen = ( |
            | isLive).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: listening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         listenBacklog: backlog = ( |
            | 
            listenBacklog: backlog IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: listening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         listenBacklog: backlog IfFail: errBlk = ( |
            | 
            os listenSocket: self Backlog: backlog IfFail: [|:err| errBlk value: err]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         locate: name = ( |
            | locate: name InPath: dirPath IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         locate: name IfFail: blk = ( |
            | locate: name InPath: dirPath IfFail: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file naming\x7fComment: In path named by environmentVariableName,
find file named name. If it is not there,
prompt the user for a directory until the file is found.
Then add the directory to the path.
Return the expanded file name.\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         locate: name InOrByExtendingPathNamed: environmentVariableName = ( |
             p.
            | 
            p: os environmentAt: environmentVariableName IfFail: ''.
            locate: name InPath: p IfFail: [ | :e. msg | 
              msg: e copyMappedBy: [|:c| c = pathSeparator ifTrue: '\n' False: c].
              [ | dir. locatedFile |
                dir: userQuery askString: msg,
                          '\nPlease enter the directory where this file\n',
                          'resides and also add it to your $', environmentVariableName.
                dir: expand: dir shrinkwrapped.
                locatedFile:  
                      dir isEmpty ifTrue: name
                                   False: [ dir, directorySeparator, name ].
                ( exists: locatedFile ) ifTrue: [
                  p: p isEmpty ifTrue: dir False: [ p, pathSeparator, dir ].
                  os environmentAt: environmentVariableName Put: p.
                  ^ locatedFile
                ].
                msg: locatedFile, ' does not exist.'.
              ] loop.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         locate: name InPath: str IfFail: blk = ( |
            | 
            "Looks for a file with name 'name' in each of the directories given
             by the path 'str'. Returns concatenation of path and name if found,
             else evaluates 'blk' with an error message.  Does ~ expansion if
             needed and treats absolute file names properly."
            name isEmpty ifTrue: [ ^ blk value: 'not a legal file name' ].
            name first = '~' ifTrue: [
                ^ locate: (expand: name) InPath: str IfFail: blk.
            ].
            (isAbsolutePath: name) ifTrue: [
                ( exists: name) ifTrue: [ ^ name ].
            ] False: [
                path: str Do: [| :p. fileName <- ''. |
                    fileName: p, directorySeparator, name.
                    ( exists: fileName) ifTrue: [ ^ fileName ].
                ].
            ].
            blk value: 'file \'', name, '\' not found in path \'', str, '\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: seeking\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         lseekOffset: offset Whence: whence = ( |
            | 
            lseekOffset: offset  Whence: whence 
              IfFail: [ | :e | error: e Op: 'lseek' FileName: name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: seeking\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         lseekOffset: offset Whence: whence IfFail: fb = ( |
            | 
            os lseekFile: self Offset: offset Whence: whence  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         open: fileName Flags: flags = ( |
            | 
            open: fileName Flags: flags Mode: mode allRW).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         open: fileName Flags: flags IfFail: errBlk = ( |
            | 
            open: fileName Flags: flags Mode: mode allRW IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         open: fileName Flags: flags Mode: permissions = ( |
            | 
            open: fileName Flags: flags Mode: permissions 
              IfFail: [ | :e | error: e Op: 'open' FileName: fileName ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         open: fileName Flags: flags Mode: permissions IfFail: errBlk = ( |
            | 
            "flags describe whether to open for reading, writing etc, and"
            "whether to create the file if it does not already exist."
            "If the file is created, permission flags are set accordingly."
            "Filename is tilde-expanded according to standard Unix convention."
             (   os openFileName: (expand: fileName)
                           Flags: flags 
                            Mode: permissions
                          IfFail: [|:e| ^ errBlk value: e]
              ) initialize: fileName IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openForAppending: fileName = ( |
            | 
            open: fileName Flags: flags writeAppendCreate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openForAppending: fileName IfFail: errBlk = ( |
            | 
            open: fileName Flags: flags writeAppendCreate
                          IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openForReading: fileName = ( |
            | 
            open: fileName Flags: flags read).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openForReading: fileName IfFail: errBlk = ( |
            | 
            open: fileName Flags: flags read IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWriting: fileName = ( |
            | 
            open: fileName  Flags: flags writeCreateTruncate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWriting: fileName IfFail: errBlk = ( |
            | 
            open: fileName  Flags: flags writeCreateTruncate  
                           IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openTCPHost: host Port: port = ( |
            | 
            openTCPHost: host Port: port IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: opening\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         openTCPListenerOnPort: port = ( |
            | 
            openTCPListenerOnPort: port IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'ModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file naming\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         path: str Do: blk = ( |
             pos <- 0.
             pth <- ''.
            | 
            str do: [|:char. :index| char = pathSeparator ifTrue: [
                pth: str copyFrom: pos UpTo: index.
                blk value: (pth = '' ifTrue: '.' False: pth).
                pos: index succ]].
            pth: str copyFrom: pos UpTo: str size.
            blk value: (pth = '' ifTrue: '.' False: pth)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min Max: max At: start IfFail: fb = ( |
             bytesRead <- 0.
             err.
            | 
            0 >= max ifTrue: ['max is less than 0\n' print. ^ 0]. "else would erroneously set atEOF"
            readSema protectNoNLR: [
                bytesRead: (noLockReadInto: buf Min: min Max: max 
                                  At: start IfFail: [|:e| err: e]).
            ].
            err ifNotNil: [fb value: err]
                   IfNil: bytesRead).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         readLine = ( | {
                 'ModuleInfo: Module: unix InitialContents: FollowSlot'
                
                 buf.
                }  {
                 'ModuleInfo: Module: unix InitialContents: FollowSlot'
                
                 line <- ''.
                } 
            | 
            "Read up to and including first \n - skip this \n."
            [ buf: readCount: 1. (buf != '\n') && [atEOF not] ] whileTrue: [ 
                line: line, buf.
            ].
            line).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         readLineIfFail: fb = ( |
             buf.
             line <- ''.
            | 
            "Read up to and including first \n - skip this \n."
            [ buf: readCount: 1 IfFail: [|:e| ^ fb value: e With: line]. buf != '\n' ] whileTrue: [ 
                line: line, buf.
            ].
            line).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         reset = ( |
            | 
            resetLock.
            resetEOF.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         resetEOF = ( |
            | atEOF: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         resetLock = ( |
            | readSema: semaphore copyBinary.
            writeSema: semaphore copyBinary.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: seeking\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         rewind = ( |
            | lseekOffset: 0 Whence: seek_set).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: preemption\x7fComment: only usable within interrupt, when it is guaranteed that there will
be no other access; e.g., in stdin preemptReadLine\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         saveState: block = ( |
             aeof.
             ftSema.
             readLockSema.
             writeLockSema.
            | 
            ftSema: fileTableEntry.
            fileTableEntry: semaphore copyBinary wait.
            readLockSema: readSema.
            writeLockSema: writeSema.
            readSema: semaphore copyBinary.
            writeSema: semaphore copyBinary.
            aeof: atEOF.

            block value.

            atEOF: aeof.
            readSema: readLockSema.
            writeSema: writeLockSema.
            fileTableEntry: ftSema.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: seeking\x7fCategory: howToSeek\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         seek_cur = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: seeking\x7fCategory: howToSeek\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         seek_end = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: seeking\x7fCategory: howToSeek\x7fComment: WARNING: potential machine dependency\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         seek_set = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         setAsync = ( |
            | 
            setAsyncIfFail: [|:e| error: 'setAsync failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         setNotifyEvents = ( |
            | 
            setNotifyEventsIfFail: [|:e| error: 'could not set notification: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         setSync = ( |
            | 
            setSyncIfFail: [|:e| error: 'setSync failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: file status\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
             n <- 0.
             s.
            | 
            "Return total number of chars in file."
            s: fstat.
            n: s st_size.
            s kill.
            n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: creating\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         socketDomain: domain Type: type Protocol: protocol = ( |
            | 
            socketDomain: domain Type: type Protocol: protocol IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: socket operations\x7fCategory: creating\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         socketDomain: domain Type: type Protocol: protocol IfFail: errBlk = ( |
            | 
            (
              os socketDomain: domain 
                         Type: type 
                     Protocol: protocol
                       IfFail: [|:e| ^ errBlk value: e].
            ) initialize: 'socket' IfFail: [|:e| errBlk value: 'initialize failed: ', e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         startAsync = ( |
            | 
            stdin  setAsync.
            stdout setAsync.
            stderr setAsync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         stopAsync = ( |
            | 
            stdin  setSync.
            stdout setSync.
            stderr setSync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         streamReadingMixin* = bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: private'
        
         streamWritingMixin* = bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: asyncIO\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         suspendForIO = ( |
            | fileTableEntry wait.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         writeFrom: buf Count: count Start: start IfFail: fb = ( |
             err.
            | 
            writeSema protectNoNLR: [
                noLockWriteFrom: buf Count: count Start: start IfFail: [|:e| err: e].
            ].
            err ifNotNil: fb
                   IfNil: count.  "Wrote it all or got error; no other possibility.").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractFile' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         writeLine: line = ( |
            | write: line, '\n').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: files\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         asFileContents = ( |
             f.
             r.
            | 
            f: asInputFile.
            r: f contents.
            f close.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: files\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         asInputFile = ( |
            | 
            os_file openForReading: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: files\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         asInputFileIfError: b = ( |
            | 
            os_file openForReading: self IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: files\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         asOutputFile = ( |
            | 
            os_file openForWriting: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: files\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         asOutputFileIfError: b = ( |
            | 
            os_file openForWriting: self IfError: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: fileIO\x7fComment: print the string to a unix file, creating the file if necessary\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         printOnFile: fileName = ( |
             f.
            | 
            f: os_file createForAppend: fileName.
            f writeFrom: asString Count: size.
            f writeFrom: '\n' Count: 1.
            f close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: transforming\x7fCategory: files\x7fModuleInfo: Module: abstract_OS InitialContents: FollowSlot\x7fVisibility: public'
        
         setFileContentsTo: newContents = ( |
             f.
            | 
            f: asOutputFile.
            f write: newContents.
            f close.
            self).
        } | ) 



 '-- Side effects'

 globals modules abstract_OS postFileIn
