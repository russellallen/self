 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. 
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         pep_runtime = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pep_runtime.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/pep'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: InitializeToExpression: (\'$Revision: 30.7 $\')\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pep_runtime' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'booleanArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'booleanArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters booleanArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'byteArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'byteArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters byteArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'charArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'charArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters charArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'doubleArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'doubleArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters doubleArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'floatArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'floatArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters floatArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'intArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'intArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters intArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'longArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'longArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters longArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'objectArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'objectArray' -> 'my_class' -> () From: ( |
             {} = 'Comment: For the arrays of the built-in types (int, short, byte, etc.) it is alright to
have methods in the parent of the array objects. For arrays of \"class instances\"
it is best not to add too much state to this array parent, since it will be cloned
as specialized to lots of classes (e.g., array of point, array of colorPoint, etc.).
Instead, we have added an extra parent-indirection and placed the methods up there.\x7fModuleInfo: Creator: globals pep arrayBuildMixin array_masters objectArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'shortArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         my_class* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'shortArray' -> 'my_class' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pep arrayBuildMixin array_masters shortArray my_class.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_allArrays' -> () From: ( | {
         'Category: array instantiation\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_newArraySize: n = ( |
            | 
            0 pep ifTraceMutator: [
                ^ 0 pep mutatorTracer newarray: (basic_newArraySize: n).
            ].
            basic_newArraySize: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_byteVectorBasedArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         array_parent* = bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_allArrays' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_byteVectorBasedArray' -> () From: ( | {
         'Comment: Needed for IO etc. which calls into Self
code.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         asVMByteVector = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_byteVectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         basic_newArraySize: n = ( |
            | 
            _CloneBytes: n Filler: java_inst_filler IfFail: [|:e|
                0 > n ifTrue: [java_inst_athrow: class_java_lang_NegativeArraySizeException].
                'outOfMemoryError' != e ifFalse: [java_error: e].
                0 memory allocationFailedBytes: n.
                _CloneBytes: n Filler: java_inst_filler.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_byteVectorBasedArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_arraylength = ( |
            | 
            _ByteSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_byteVectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_at: index = ( |
            | 
            _ByteAt: index IfFail: [|:e|
                java_inst_handlePrimError: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_byteVectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_at: index Put: v = ( |
            | 
            _ByteAt: index Put: v IfFail: [|:e|
                java_inst_handlePrimError: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_byteVectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len IfFail: errBlk = ( |
            | 
            _CopyByteRangeDstPos: dstPos Src: srcArray SrcPos: srcPos Length: len IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_vectorBasedArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         array_parent* = bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_allArrays' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_vectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         basic_newArraySize: n = ( |
            | 
            _Clone: n Filler: java_inst_filler IfFail: [|:e|
                0 > n ifTrue: [java_inst_athrow: class_java_lang_NegativeArraySizeException].
                'outOfMemoryError' != e ifFalse: [java_error: e].
                0 memory allocationFailedBytes: n.
                _Clone: n Filler: java_inst_filler.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_vectorBasedArray' -> () From: ( | {
         'ModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_arraylength = ( |
            | _Size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_vectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_at: index = ( |
            | 
            _At: index IfFail: [|:e|
                java_inst_handlePrimError: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_vectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_at: index Put: v = ( |
            | 
            _At: index Put: v IfFail: [|:e|
                java_inst_handlePrimError: e.
            ].
            0 pep ifTraceMutator: [ 
                obj_flags = 'T_CLASS' ifTrue: [  "Array of references."
                    0 pep mutatorTracer putarray: self Idx: index StoredObj: v.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_vectorBasedArray' -> () From: ( | {
         'Category: primitive wrappers\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len IfFail: errBlk = ( |
            | 
            _CopyRangeDstPos: dstPos Src: srcArray SrcPos: srcPos Length: len IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'arrayBuildMixin' -> 'array_masters' -> 'traits_vectorBasedArray' -> () From: ( | {
         'Comment: Better implement this method if you are a vector, or the UI will crash.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         methodPointerIfFail: b = ( |
            | _MethodPointerIfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileDescriptor\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileDescriptor_initSystemFD_Ljava_io_FileDescriptor: fdObj I: fd0 = ( |
            | 
            fdObj java_inst_setFileNumber: fd0.   
            fdObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileDescriptor\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileDescriptor_valid = ( |
            | 
            "Note: getFileNumber already subtracts 1, so 
             compare using '<=' not '<'."
            0 <= java_inst_getFileNumber ifTrue: [java_true]
                                          False: [java_false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileInputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileInputStream_available = ( |
             cur <- 0.
             end <- 0.
             selfFile.
             statObj.
            | 
            java_io_FileInputStream_fd_ java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            selfFile: (java_io_FileInputStream_fd_ java_inst_getSelfFileIfFail: [
                java_inst_IOException.
            ]).
            statObj: (selfFile fstatIfFail: [java_inst_IOException]).
            statObj s_ischr || [statObj s_isfifo] || [statObj s_issock] ifTrue: [
                0 error: 'special devices currently not supported'. "%%%"
            ].
            java_inst_tripleSeek: selfFile Cur: [|:c| cur: c] End: [|:e| end: e].
            end - cur).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileInputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileInputStream_close = ( |
            | 
            java_io_FileInputStream_fd_ java_inst_closeFileDescriptor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileInputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileInputStream_open_Ljava_lang_String: name = ( |
            | 
            java_inst_openFileName: name
                             Flags: 0 os_file flags read
                              Mode: 0
                       FileDescObj: java_io_FileInputStream_fd_).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileInputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileInputStream_read = ( |
             selfFile.
            | 
            java_io_FileInputStream_fd_ java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            selfFile: (java_io_FileInputStream_fd_ java_inst_getSelfFileIfFail: [
                java_inst_IOException: 'read error'.
            ]).
            (selfFile readOneCharIfFail: [
                selfFile atEOF ifTrue: [^ -1].
                java_inst_IOException: 'read error'.
            ]) asByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileInputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileInputStream_readBytes_Array_B: byteArray I: off I: len = ( |
             bytesRead <- 0.
            | 
            bytesRead: (java_inst_readFromFileDescObj: java_io_FileInputStream_fd_
                                                 Into: byteArray
                                               Offset: off
                                               Length: len
                                             MinBytes: 1).
            0 = bytesRead ifTrue: [-1] False: [bytesRead]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileInputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileInputStream_skip_J: n = ( |
             cur <- 0.
             end <- 0.
             selfFile.
            | 
            java_io_FileInputStream_fd_ java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            selfFile: (java_io_FileInputStream_fd_ java_inst_getSelfFileIfFail: [
                java_inst_IOException.
            ]).
            cur: (selfFile lseekOffset: 0 Whence: selfFile seek_cur IfFail: [
                java_inst_IOException.
            ]).
            end: (selfFile lseekOffset: n Whence: selfFile seek_cur IfFail: [
                java_inst_IOException.
            ]).
            end java_inst_lsub: cur).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileOutputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileOutputStream_close = ( |
            | 
            java_io_FileOutputStream_fd_ java_inst_closeFileDescriptor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileOutputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileOutputStream_open_Ljava_lang_String: name = ( |
             flags.
            | 
            flags: 0 os_file flags.
            java_inst_openFileName: name
                             Flags: flags write || flags create || flags truncate
                              Mode: 8r664
                       FileDescObj: java_io_FileOutputStream_fd_).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileOutputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileOutputStream_writeBytes_Array_B: byteArray I: off I: len = ( |
            | 
            java_inst_writeToFileDescObj: java_io_FileOutputStream_fd_ 
                                    From: byteArray
                                  Offset: off
                                  Length: len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: FileOutputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_FileOutputStream_write_I: byte = ( |
             selfFile.
            | 
            java_io_FileOutputStream_fd_ java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            selfFile: (java_io_FileOutputStream_fd_ java_inst_getSelfFileIfFail: [
                java_inst_IOException: 'write error'.
            ]).
            selfFile write: (0 byteVector copySize: 1 FillingWith: byte)
                    IfFail: [java_inst_IOException: 'write error'].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_canRead0 = ( |
            | 
            java_inst_sysAccessMode: 0 os accessModes r_ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_canWrite0 = ( |
            | 
            java_inst_sysAccessMode: 0 os accessModes w_ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_exists0 = ( |
            | 
            java_inst_sysAccessMode: 0 os accessModes f_ok).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_isAbsolute = ( |
             selfStrPath <- ''.
            | 
            java_io_File_path_ java_inst_athrowIfNull.
            selfStrPath: java_io_File_path_ o_javaStrToSelfStr.
            (0 os_file isAbsolutePath: selfStrPath) ifTrue: [java_true]
                                                      False: [java_false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_isDirectory0 = ( |
            | 
            java_inst_statOp: [|:statObj| 
                (statObj s_isdirIfFail: [^ java_false]) ifTrue: [java_true]
                                                         False: [java_false].
            ] IfFail: [java_false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_isFile0 = ( |
            | 
            java_inst_statOp: [|:statObj| 
                (statObj s_isregIfFail: [^ java_false]) ifTrue: [java_true]
                                                         False: [java_false].
            ] IfFail: [java_false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_lastModified0 = ( |
            | 
            java_inst_statOp: [|:statObj. v|
                v: (statObj st_mtimeIfFail: [^ java_zero_long]).
                (0 time msecPerDay java_inst_lmul: (v at: 0)) java_inst_ladd: (v at: 1).
            ] IfFail: [java_zero_long]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_length0 = ( |
            | 
            java_inst_statOp: [|:statObj|
                statObj st_sizeIfFail: [^ java_zero_long].
            ] IfFail: [java_zero_long]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: File\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_File_mkdir0 = ( |
             path.
            | 
            path: java_io_File_path_.
            path java_inst_athrowIfNull.
            0 os mkdir: path o_javaStrToSelfStr
                    Mode: 8r771
                  IfFail: [^ java_false].
            java_true.  "Indicate success.").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: RandomAccessFile\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_RandomAccessFile_close = ( |
            | 
            java_io_FileInputStream_fd_ java_inst_closeFileDescriptor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: RandomAccessFile\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_RandomAccessFile_length = ( |
             end <- 0.
             selfFile.
            | 
            java_io_RandomAccessFile_fd_ java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            selfFile: (java_io_RandomAccessFile_fd_ java_inst_getSelfFileIfFail: [
                java_inst_IOException.
            ]).
            java_inst_tripleSeek: selfFile Cur: [] End: [|:e| end: e].
            end).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: RandomAccessFile\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_RandomAccessFile_open_Ljava_lang_String: name Z: writable = ( |
             f <- 0.
             flags.
             m <- 0.
            | 
            flags: 0 os_file flags.
            (o_javaBoolToSelfBool: writable) ifTrue: [
                m: 8r664.
                f: flags readWrite || flags create.
            ] False: [
                m: 0.
                f: flags read.
            ].
            java_inst_openFileName: name
                             Flags: f
                              Mode: m
                       FileDescObj: java_io_RandomAccessFile_fd_).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: RandomAccessFile\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_RandomAccessFile_readBytes_Array_B: byteArray I: off I: len = ( |
            | 
            java_inst_readFromFileDescObj: java_io_RandomAccessFile_fd_
                                     Into: byteArray
                                   Offset: off
                                   Length: len
                                 MinBytes: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: io\x7fCategory: RandomAccessFile\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_io_RandomAccessFile_seek_J: pos = ( |
             selfFile.
            | 
            java_io_RandomAccessFile_fd_ java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            selfFile: (java_io_RandomAccessFile_fd_ java_inst_getSelfFileIfFail: [
                java_inst_IOException.
            ]).
            selfFile lseekOffset: pos Whence: selfFile seek_set IfFail: [
                java_inst_IOException.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: ClassLoader\x7fComment: Corresponding native method defined in ...share/java/lang/class.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_ClassLoader_defineClass0_Array_B: data I: offset I: length = ( |
             bytes.
             cl.
             dlen <- 0.
            | 
            data java_inst_athrowIfNull.
            dlen: data java_inst_arraylength.
            offset java_inst_iflt   ||
            [length java_inst_iflt] ||
            [(offset java_inst_iadd: length) java_inst_if_icmpgt: dlen] ifTrue: [
                java_inst_athrow: java_classes
                    class_java_lang_ArrayIndexOutOfBoundsException.
            ].
            "Transfer the 'data' to a self bytevector."
            bytes: (0 byteVector copySize: length).
            bytes copyRangeDstPos: 0 SrcArray: data SrcPos: offset Len: length.
            cl: (0 pep loader defineClassFromBytes: bytes IfFail: [|:e|
                java_inst_athrow: java_classes class_java_lang_ClassFormatError
                         Message: e. "Supplying the message is my addition. Ole, July 1996."
            ]).
            cl proto_instance java_lang_Object_getClass).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: ClassLoader\x7fComment: Corresponding native method defined in ...share/java/lang/class.c.
How is this method different from the method
java_lang_Class_forName_Ljava_lang_String:?
They seem to do the same!\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_ClassLoader_findSystemClass0_Ljava_lang_String: className = ( |
             cl.
             name <- ''.
            | 
            name: className o_javaStrToSelfStr.
            cl: (0 pep loader getClassNamed: name IfFail: [
                java_inst_athrow: java_classes class_java_lang_ClassNotFoundException Message: name.
            ]).
            cl proto_instance java_lang_Object_getClass).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: ClassLoader\x7fComment: Corresponding native method defined in ...share/java/lang/class.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_ClassLoader_init = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: ClassLoader\x7fComment: Corresponding native method defined in ...share/java/lang/class.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_ClassLoader_resolveClass0_Ljava_lang_Class: c = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Class\x7fComment: Corresponding native method defined in .../class.c.
How is this method different from the method
java_lang_ClassLoader_findSystemClass_Ljava_lang_String:?
They seem to do the same!\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Class_forName_Ljava_lang_String: className = ( |
             cl.
             name <- ''.
            | 
            name: className o_javaStrToSelfStr.
            cl: (0 pep loader getClassNamed: name IfFail: [
                java_inst_athrow: java_classes class_java_lang_ClassNotFoundException Message: name.
            ]).
            cl proto_instance java_lang_Object_getClass).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Class\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Class_getInterfaces = ( |
             intfs.
             res.
            | 
            intfs: the_class interface_names.
            res: (java_classes class_java_lang_Class array_1 java_inst_newArraySize: intfs size).
            intfs do: [|:className. :idx. cl|
                cl: (0 pep loader getClassNamed: className IfFail: [
                    java_inst_athrow: java_classes class_java_lang_ClassNotFoundException Message: name.
                ]).
                res java_inst_aastore: idx With: cl proto_instance java_lang_Object_getClass.
            ].
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Class\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Class_getName = ( |
            | 
            o_selfStrToJavaStr: the_class class_name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Class\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Class_getSuperclass = ( |
            | 
            (the_class _Eq: java_classes class_java_lang_Object) ifTrue: [^ java_null].
            the_class super_class proto_instance java_lang_Object_getClass).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Class\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Class_isInterface = ( |
            | 
            the_class class_is_interface ifTrue: [java_true]
                                          False: [java_false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Class\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Class_newInstance = ( |
            | 
            the_class class_is_interface || [the_class class_is_abstract] ifTrue: [
                java_inst_athrow: java_classes class_java_lang_InstantiationException.
            ].
            "Also should check for illegal access (how?). %%%"
            0 pep mutatorTracer keepAlive: the_class java_inst_new
                                       Do: [|:inst| inst init_obj]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Double\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Double_doubleToLongBits_D: val = ( |
             bv.
            | 
            bv: (0 byteVector copySize: 8).
            bv javaAt: 0 PutDouble: val.
            bv javaLongAt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Double\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Double_longBitsToDouble_J: bits = ( |
             bv.
            | 
            bv: (0 byteVector copySize: 8).
            bv javaAt: 0 PutLong: bits.
            bv javaDoubleAt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Double\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Double_toString_D: double = ( |
            | 
            o_selfStrToJavaStr: double _FloatPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Double\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Double_valueOf_Ljava_lang_String: str = ( |
            | 
            0 pep mutatorTracer keepAlive: java_classes class_java_lang_Double
                                             java_inst_new
                                       Do: [|:inst|
                inst init_obj_D: (java_inst_javaStringToSelfFloat: str).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Float\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Float_floatToIntBits_F: val = ( |
             bv.
            | 
            bv: (0 byteVector copySize: 4).
            bv javaAt: 0 PutFloat: val.
            bv javaIntAt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Float\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Float_intBitsToFloat_I: bits = ( |
             bv.
            | 
            bv: (0 byteVector copySize: 4).
            bv javaAt: 0 PutInt: bits.
            bv javaFloatAt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Float\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Float_toString_F: float = ( |
            | 
            o_selfStrToJavaStr: float _FloatPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Float\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Float_valueOf_Ljava_lang_String: str = ( |
            | 
            0 pep mutatorTracer keepAlive: java_classes class_java_lang_Float
                                           java_inst_new
                                       Do: [|:inst|
                inst init_obj_F: (java_inst_javaStringToSelfFloat: str).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_acos_D: d = ( |
            | d arcCos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_asin_D: d = ( |
            | d arcSin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_atan_D: d = ( |
            | d arcTan).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_ceil_D: d = ( |
            | d ceil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_cos_D: d = ( |
            | d cos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_floor_D: d = ( |
            | d floor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_log_D: d = ( |
            | d naturalLog).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_sin_D: d = ( |
            | d sin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_sqrt_D: d = ( |
            | d squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Math\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Math_tan_D: d = ( |
            | d tan).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Object\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Object_clone = ( |
            | 
            'T_NORMAL_OBJECT' = obj_flags ifTrue: [
                is_java_lang_Cloneable ifFalse: [
                    java_inst_athrow: java_classes class_java_lang_CloneNotSupportedException
                             Message: class_name.
                ].
            ].
            _Clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Object\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Object_getClass = ( |
            | 
            java_inst_athrowIfNull.
            0 pep mutatorTracer keepAlive: java_classes class_java_lang_Class
                                             java_inst_new
                                       Do: [|:res|
                res init_obj.
                res the_class: my_class.
                res.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Object\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Object_hashCode = ( |
            | 
            _IdentityHash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Object\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Object_notify = ( |
            | 
            check_holds_monitor.
            my_waitQ isEmpty ifFalse: [my_waitQ signal].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Object\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Object_notifyAll = ( |
            | 
            check_holds_monitor.
            [my_waitQ isEmpty] whileFalse: [my_waitQ signal].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Object\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Object_wait_J: millis = ( |
             ms <- 0.
            | 
            check_holds_monitor.
            my_waitQ allocateIn: self.  "Lazy allocation."
            ms: millis asInteger.
            "'waiting on: ' print. my_waitQ objectID printLine."
            0 = ms ifTrue: [   "In Java, a wait of 0 ms is forever."
                my_lock forceUnlockForWaitOn: my_waitQ.
            ] False: [
                my_lock forceUnlockForWaitOn: my_waitQ TimeOut: ms.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Runtime\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Runtime_buildLibName_Ljava_lang_String: path Ljava_lang_String: filename = ( |
             sname <- ''.
             spath <- ''.
             sres <- ''.
            | 
            path     java_inst_athrowIfNull.
            filename java_inst_athrowIfNull.
            spath: path     o_javaStrToSelfStr.
            sname: filename o_javaStrToSelfStr.
            sres: spath, '/lib', sname, '.so'.   "Gwak! Why did they have to do
                                                  that in a native method?"
            o_selfStrToJavaStr: sres).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Runtime\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Runtime_exitInternal_I: int = ( |
             str <- ''.
            | 
            str: 'exitInternal called with arg: ', int printString.
            str printLine.
            "this_process abort: str.").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Runtime\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Runtime_initializeLinkerInternal = ( |
            | 
            sync_do: [
                "Should also initialize linker, but for now just return LD_LIBRARY_PATH
                 (as is required). %%%"
                o_selfStrToJavaStr: (0 os environmentAt: 'LD_LIBRARY_PATH'
                                                   IfFail: [^ java_null]).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Runtime\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Runtime_loadFileInternal_Ljava_lang_String: filename = ( |
            | 
            filename java_inst_athrowIfNull.
            "Should really call dlopen! For now just return 1, 
             pretending we did the job! %%%"
            java_one_int).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Runtime\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Runtime_traceMethodCalls_Z: bool = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: SecurityManager\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_SecurityManager_classLoaderDepth = ( |
            | 
            "This is wrong, of course.
             But I have no desire to do the right thing. %%%"
            -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: SecurityManager\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_SecurityManager_currentClassLoader = ( |
            | 
            java_null.   "Not always right! %%%").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: System\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_System_arraycopy_Ljava_lang_Object: srcArray I: srcPos Ljava_lang_Object: dstArray I: dstPos I: length = ( |
            | 
            "The implementation of the array copy method in the Java virtual machine also 
             checks to see if one of the 'obj_flags' is 'T_NORMAL_OBJECT' (i.e., the
             object is not an array. If that is the case, it fails the array copy native 
             method with the ArrayStoreException. In Pep, we catch this case efficiently
             by having even non-array objects implement the array copy method (they throw
             the appropriate exception).
             All other error checks are deferred to the different implementations of 
             java_inst_arraycopyPos:SrcArray:Pos:Len: (for efficiency)."

            dstArray java_inst_arraycopyPos: dstPos SrcArray: srcArray Pos: srcPos Len: length.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: System\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_System_currentTimeMillis = ( |
             v.
            | 
            v: _TimeReal.
            "Use java runtime instructions to get result of appropriate type."
            ((v _At: 0) java_inst_lmul: (24 * 60 * 60 * 1000)) 
            java_inst_ladd: (v _At: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: System\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_System_initProperties_Ljava_util_Properties: props = ( |
             osName <- ''.
             osVers <- ''.
             pp.
            | 
            '5.0' <= 0 os release ifTrue: [
                osName: 'Solaris'.
                osVers: 0 os release.
                osVers at: 0 PutByte: (osVers byteAt: 0) - 3.
            ] False: [
                osName: 'SunOS'.
                osVers: 0 os release.
            ].
            "Native methods get moved to a different place when pep translates them.
             So tricky to call other methods. Instead use a block to factor code."
            pp: [|:key. :val|
                0 pep mutatorTracer keepAlive: (o_selfStrToJavaStr: key) Do: [|:kStr|
                    0 pep mutatorTracer keepAlive: (o_selfStrToJavaStr: val) Do: [|:vStr|
                        props put_Ljava_lang_Object: kStr Ljava_lang_Object: vStr.
                    ].
                ].
            ].
            pp value: 'java.version'       With: '1.0.1'.
            pp value: 'java.vendor'        With: 'Kanban group'.
            pp value: 'java.vendor.url'    With: 'http://self.sunlabs.com/'.
            pp value: 'java.home'          With: (0 os environmentAt: 'JAVA_HOME'
                                                                IfFail: '/usr/local/java').
            pp value: 'java.class.version' With: '45.3'.
            pp value: 'java.class.path'    With: 0 pep loader classPath.
            pp value: 'os.name'            With: osName.
            pp value: 'os.version'         With: osVers.
            pp value: 'os.arch'            With: 'sparc'.
            pp value: 'file.separator'     With: 0 os_file directorySeparator.
            pp value: 'path.separator'     With: 0 os_file pathSeparator.
            pp value: 'line.separator'     With: '\n'.
            pp value: 'user.name'          With: (0 os environmentAt: 'USER'
                                                                IfFail: '?').
            pp value: 'user.home'          With: (0 os environmentAt: 'HOME'
                                                                IfFail: '?').
            pp value: 'user.dir'           With: (0 os getcwdIfFail: '?').
            pp value: 'java.compiler'      With: (0 os environmentAt: 'JAVA_COMPILER'
                                                                IfFail: '').
            "%%% Skipping locale stuff; see .../solaris/java/runtime/properties_md.c."
            pp value: 'awt.toolkit'        With: 'sun.awt.tiny.TinyToolkit'.
            "Finally do the user-defined properties."
            user_props do: [|:val. :key| pp value: key With: val].
            props).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_currentThread = ( |
             selfProcess.
            | 
            selfProcess: this_process.
            0 nil = selfProcess javaThread ifTrue: [
                java_error: 'currentThread native method failed: ',
                            'not running as a Java thread'.
            ].
            selfProcess javaThread).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_interrupt0 = ( |
            | 
            (thread_getSelfProcessIfNone: [^ self]) java_interrupted: java_true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fComment: Corresponds to the method java_lang_Thread_isAlive(Thread *p)
defined in thread.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_isAlive = ( |
            | 
            thread_hasSelfProcess && 
            [java_lang_Thread_stillborn_ java_inst_ifeq] ifTrue: [java_true]
                                                          False: [java_false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_isInterrupted = ( |
            | 
            (thread_getSelfProcessIfNone: [^ false]) java_interrupted).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_resume0 = ( |
            | 
            (thread_getSelfProcessIfNone: [^ self]) resume.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_setPriority0_I: pri = ( |
            | 
            "If there is no Self process, then we have (probably) just created
             an instance of class java.lang.Thread. It does not (yet) have
             an underlying Self process, so here we just ignore the request
             to set the priority. 
             The Java code has already recorded the desired priority in the
             instance variable 'java_lang_Thread_priority' from where we can
             take it when the process is made runnable."
            (thread_getSelfProcessIfNone: [^ self]) java_inst_setPriority: pri.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_sleep_J: millis = ( |
             ms <- 0.
            | 
            "Also need to handle interrupted sleep. %%%"
            ms: millis asInteger.
            0 > ms ifTrue: [
                java_inst_athrow: java_classes class_java_lang_IllegalArgumentException
                         Message: 'timeout value is negative'.
            ].
            0 = ms ifTrue: [   "Wait forever."
                ms: scheduler timeoutInfinity.
            ].
            this_process sleep: ms.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_start = ( |
            | 
            "Similar to the C function in thread.c."
            sync_do: [| selfProcess. startMsg. cob <- ''. tar. |
                "It is illegal to call 'start' on an active thred."
                thread_hasSelfProcess ifTrue: [
                    java_inst_athrow: java_classes class_java_lang_IllegalThreadStateException.
                ].
                [thread_RT0.  "For senders"].
                startMsg: 0 message copy.
                startMsg receiver:  self.
                startMsg selector:  'thread_RT0'.  "First routine called by new thread.
                                                    Defined in file thread.c."
                startMsg arguments: 0 vector.

                "Try to get a more sensible process name than 'java.lang.Thread'."
                cob: my_class class_name.
                tar: java_lang_Thread_target_.
                ('java.lang.Thread' = cob) && [tar java_inst_ifnonnull] ifTrue: [
                    cob: tar my_class class_name.
                ].
                cob: cob, '::run'.

                selfProcess: (newSelfProcess_startMsg: startMsg
                                            SysThread: java_lang_Thread_daemon_ java_inst_ifne
                                         CauseOfBirth: cob).
                "'Starting Thread: ' print. _ObjectID print.
                 ', self process: ' print. selfProcess objectID printLine."
                link_javaThread: self SelfProcess: selfProcess.
                selfProcess java_inst_setPriority: java_lang_Thread_priority_.
                selfProcess resume.  "Start the new thread."
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Thread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Thread_suspend0 = ( |
            | 
            (thread_getSelfProcessIfNone: [^ self]) suspend.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Throwable\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Throwable_fillInStackTrace = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: lang\x7fCategory: Throwable\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_lang_Throwable_printStackTrace0_Ljava_io_PrintStream: s = ( |
            | 
            s println_Ljava_lang_String: (o_selfStrToJavaStr: '<stack trace omitted>').
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: InetAddress\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_InetAddress_getHostByAddr_I: addr = ( |
             bvAddr.
             name <- ''.
            | 
            bvAddr: (0 byteVector copySize: 4).
            bvAddr javaAt: 0 PutInt: addr.
            name: (0 os hostNameForAddr: bvAddr
                                     Type: 0 os_file socketConstants af_inet
                                   IfFail: [
                java_inst_athrow: java_classes class_java_net_UnknownHostException.
            ]).
            o_selfStrToJavaStr: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: InetAddress\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_InetAddress_getInetFamily = ( |
            | 
            0 os_file socketConstants af_inet asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: InetAddress\x7fComment: Implements the C function java_net_InetAddress_getLocalHostName()
found in .../solaris/net/socket.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_InetAddress_getLocalHostName = ( |
            | 
            o_selfStrToJavaStr: 0 os nodename).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: InetAddress\x7fComment: Implements the C function java_net_InetAddress_lookupAllHostAddr()
found in .../solaris/net/socket.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_InetAddress_lookupAllHostAddr_Ljava_lang_String: host = ( |
             hostname <- ''.
            | 
            host java_inst_athrowIfNull.
            hostname: host o_javaStrToSelfStr.
            [|:throwException. addrs. res. |
                hostname first isDigit ifTrue: throwException.
                addrs: (0 os hostAddressesForName: hostname IfFail: throwException).
                "Got the address(es). So convert them to Java arrays."
                res: (java_classes class_fake__byte array_2 java_inst_newArraySize: addrs size).
                addrs do: [|:addr. :i. jaddr |
                    jaddr: (java_classes class_fake__byte array_1 java_inst_newArraySize: addr size).
                    res java_inst_at: i Put: jaddr.
                    addr do: [|:byte. :j| jaddr java_inst_at: j Put: byte].
                ].
                 res.
            ] value: [
                java_inst_athrow: java_classes class_java_net_UnknownHostException
                         Message: hostname.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: InetAddress\x7fComment: See file .../solaris/net/socket.c for native code versin.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_InetAddress_makeAnyLocalAddress_Ljava_net_InetAddress: inetAddr = ( |
            | 
            inetAddr java_net_InetAddress_address_: (0 os_file inetConstants in_addr_any javaIntAt: 0).
            inetAddr java_net_InetAddress_family_:  0 os_file socketConstants af_inet.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: PlainSocketImpl\x7fComment: See file .../solaris/net/socket.c for native code version.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_PlainSocketImpl_socketAccept_Ljava_net_SocketImpl: sock = ( |
             my_fdObj.
             selfFile.
             selfResSocket.
             sock_addr.
             sock_fdObj.
            | 
            my_fdObj: java_net_SocketImpl_fd_.
            my_fdObj java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            sock     java_inst_athrowIfNull.
            sock_fdObj: sock java_net_SocketImpl_fd_.
            sock_fdObj java_inst_athrowIfNull.
            sock_addr: sock java_net_SocketImpl_address_.
            sock_addr java_inst_athrowIfNull.
            [|:throwException. selfFile. selfResultSocket. |
                selfFile: (my_fdObj java_inst_getSelfFileIfFail: throwException).
                selfResSocket: (selfFile acceptConnectionInfo: [|:port. :family. :addr|
                    "Set info about the connection."
                    sock java_net_SocketImpl_port_: port asInt32.
                    sock_addr java_net_InetAddress_family_: family asInt32.
                    sock_addr java_net_InetAddress_address_: (addr javaIntAt: 0).
                    sock java_net_SocketImpl_localport_: java_net_SocketImpl_localport_.
                ] IfFail: throwException).
                java_file_table registerFile: selfResSocket With: sock_fdObj.
            ] value: [|:errStr|
                java_inst_athrow: java_classes class_java_net_SocketException
                         Message: '(1) ', errStr.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: PlainSocketImpl\x7fComment: See file .../solaris/net/socket.c for native code version.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_PlainSocketImpl_socketBind_Ljava_net_InetAddress: address I: lport = ( |
             fdObj.
             p <- 0.
             selfFile.
            | 
            fdObj: java_net_SocketImpl_fd_.
            fdObj   java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            address java_inst_athrowIfNull.
            selfFile: (fdObj java_inst_getSelfFileIfFail: [ throwException ] ).
            p: (selfFile bindFamily: address java_net_InetAddress_family_
                               Port: lport asInteger
                            Address: address java_net_InetAddress_address_
                             IfFail: [|:err. emsg <- ''. |
                emsg: errStr, ': ', errStr errorMessage.
                ('EADDRINUSE' = err) || ['EADDRNOTAVAIL' = err] ifTrue: [
                    java_inst_athrow: java_classes class_java_net_BindException
                             Message: eMsg.
                ] False: [
                    java_inst_athrow: java_classes class_java_net_SocketException
                             Message: eMsg.
                ].
            ]).
            "Set the port instance variable. Usually p = lport, but if lport = 0,
             the system chose a port number for us."
            0 pep debug ifTrue: [
                'setting port number = ' print. p print. 
                ', lport = ' print. lport print. ')' printLine.
            ].
            java_net_SocketImpl_localport_: p asInt32.  "Store as 32 bit integer."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: PlainSocketImpl\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_PlainSocketImpl_socketClose = ( |
            | 
            java_net_SocketImpl_fd_ java_inst_closeFileDescriptor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: PlainSocketImpl\x7fComment: This code parallels the code in the function 
java_net_PlainSocketImpl_socketCreate() in file .../solaris/net/socket.c.,
and the code in function sysSocketInitializeFD() in 
file .../solaris/java/green_threads/src/io_md.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_PlainSocketImpl_socketCreate_Z: stream = ( |
             fd <- 0.
             fdObj.
             selfFile.
             sockConsts.
             type.
            | 
            fdObj: java_net_SocketImpl_fd_.
            fdObj java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            sockConsts: 0 os_file socketConstants. 
            stream java_inst_ifne ifTrue: [type: sockConsts sock_stream]
                                   False: [type: sockConsts sock_dgram].
            selfFile: (0 os_file socketDomain: sockConsts af_inet 
                                          Type: type
                                      Protocol: 0
                                       IfFail: [|:e|
                java_inst_athrow: java_classes class_java_net_SocketException
                         Message: '(3) ', e.
            ]).
            java_file_table registerFile: selfFile With: fdObj.
            "Self code already established non-blocking io, so only remains to set
             socket option."
            selfFile setsockoptLevel: sockConsts sol_socket
                             OptName: sockConsts so_reuseaddr
                              OptVal: 'yes\x00' 
                              IfFail: [|:e|
                0 stderr write: 'warning: ignoring failed setsockoptcall: ', e, '\n'.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: PlainSocketImpl\x7fComment: Native code defined in .../solaris/net/socket.c and
.../green_threads/src/io_md.c.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_PlainSocketImpl_socketListen_I: count = ( |
             fdObj.
             res <- -1.
            | 
            fdObj: java_net_SocketImpl_fd_.
            fdObj java_inst_athrowIfNullMessage: 'null FileDescriptor'.
            [|:throwException. selfFile. |
                selfFile: (fdObj java_inst_getSelfFileIfFail: [|:e|
                    throwException value: 'bad filedescriptor: ', e.
                ]).
                selfFile listenBacklog: count asInteger IfFail: throwException.
            ] value: [|:errStr|
                java_inst_athrow: java_classes class_java_net_SocketException
                         Message: '(4) ', errStr.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: SocketInputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_SocketInputStream_socketRead_Array_B: byteArray I: off I: len = ( |
            | 
            "Returns how many bytes read."
            java_inst_readFromFileDescObj: java_io_FileInputStream_fd_
                                     Into: byteArray
                                   Offset: off
                                   Length: len
                                 MinBytes: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: net\x7fCategory: SocketOutputStream\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_net_SocketOutputStream_socketWrite_Array_B: byteArray I: off I: len = ( |
            | 
            java_inst_writeToFileDescObj: java_io_FileOutputStream_fd_ 
                                    From: byteArray
                                  Offset: off
                                  Length: len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: util\x7fCategory: Date\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_util_Date_expand = ( |
             t.
             val <- 0.
            | 
            make_self_time_object_current.
            t: self_time_object.
            java_util_Date_tm__millis_: t msec.
            java_util_Date_tm__sec_:    t second.
            java_util_Date_tm__min_:    t minute.
            java_util_Date_tm__hour_:   t hour.
            java_util_Date_tm__mday_:   t date.
            java_util_Date_tm__mon_:    t month.
            java_util_Date_tm__wday_:   t weekday.
            java_util_Date_tm__yday_:   t yearday.
            java_util_Date_tm__year_:   t year - 1900.
            java_util_Date_tm__isdst_:  (t daylightSavingsTimeIfOn: 1 IfOff: 0 IfUnknown: -1).
            java_util_Date_expanded_:   java_true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: util\x7fCategory: Date\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_util_Date_toGMTString = ( |
            | 
            make_self_time_object_current.
            o_selfStrToJavaStr: self_time_object printStringGMT).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: java\x7fCategory: util\x7fCategory: Date\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_util_Date_toString = ( |
            | 
            "java_util_Date_expanded_ java_inst_ifeq ifTrue: [expand].   Not needed!"
            "The Java native method expands the time object, if need be
             before constructing the printstring method. We don't bother, but
             we need to make sure that the underlying Self object is current."
            make_self_time_object_current.
            o_selfStrToJavaStr: self_time_object compactPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyEventThread\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyEventThread_run = ( |
            | 
            0 xlib events xExposeEvent java_inst_initEventState.
            awt_lock.
            [
                awt_display xFlush.

                "Must set flag false right before waiting - else
                 we risk never being notified."
                tiny_awt_hasNotifiedEventThread: 0 false.
                awt_wait.
                process_tiny_awt_events.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyFontMetrics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyFontMetrics_init = ( |
             a <- 0.
             d <- 0.
             hi <- 0.
             l <- 0.
             lo <- 0.
             ma <- 0.
             md <- 0.
             mw <- 0.
             wid.
             xfont.
            | 
            awt_lock.
            xfont: (java_awt_FontMetrics_font_ tiny_awt_getFontIfFail: [
                awt_unlock.
                java_null java_inst_athrow.  "Throw null pointer exception."
            ]).
            a:  xfont ascent.
            d:  xfont descent.
            ma: xfont maxAscent.
            md: xfont maxDescent.
            l: 1.
            mw: xfont maxCharWidth.
            wid: (o_javaArrayOfIntSize: 256).
            sun_awt_tiny_TinyFontMetrics_ascent_:     a.
            sun_awt_tiny_TinyFontMetrics_descent_:    d.
            sun_awt_tiny_TinyFontMetrics_leading_:    l.
            sun_awt_tiny_TinyFontMetrics_height_:     ((a java_inst_iadd: d) java_inst_iadd: l).
            sun_awt_tiny_TinyFontMetrics_maxAscent_:  ma.
            sun_awt_tiny_TinyFontMetrics_maxDescent_: md.
            sun_awt_tiny_TinyFontMetrics_maxHeight_:  ((ma java_inst_iadd: md) java_inst_iadd: l).
            sun_awt_tiny_TinyFontMetrics_maxAdvance_: mw.
            sun_awt_tiny_TinyFontMetrics_widths_:     wid.
            lo: xfont min_char_or_byte2.
            hi: xfont max_char_or_byte2.
            xfont per_char ifTrue: [
                lo to: hi Do: [|:i| 
                    wid java_inst_iastore: i With: (xfont perCharWidth: i - lo).
                ].
            ] False: [
                lo to: hi Do: [|:i|
                    wid java_inst_iastore: i With: mw.
                ].
            ].
            awt_unlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_clearArea_I: x I: y I: w I: h = ( |
             win.
            | 
            awt_lock.
            win: (tiny_getDrawableIfNone: [^ awt_unlock]).
            awt_display xClearAreaIn: win
                                   X: x
                                   Y: y
                               Width: w
                              Height: h
                           Exposures: false.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_copyArea_I: x I: y I: w I: h I: dx I: dy = ( |
             gc.
             win.
            | 
            awt_lock.
            tiny_getWin: [|:w| win: w]
                     GC: [|:g| gc: g]
                 IfFail: [^ awt_unlock].
            awt_display xCopyAreaSrc: win
                                Dest: win
                                  GC: gc
                                SrcX: (true_x: x)
                                SrcY: (true_y: y)
                               Width: w
                              Height: h
                               DestX: (true_x: (x java_inst_iadd: dx))
                               DestY: (true_y: (y java_inst_iadd: dy)).
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_createFromGraphics_Lsun_awt_tiny_TinyGraphics: g = ( |
            | 
            awt_lock.
            sun_awt_tiny_TinyGraphics_pDrawable_: g sun_awt_tiny_TinyGraphics_pDrawable_.
            sun_awt_tiny_TinyGraphics_touched_: java_true.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_createFromWindow_Lsun_awt_tiny_TinyWindow: window = ( |
            | 
            window java_inst_athrowIfNullMessage: 'window'.
            awt_lock.
            sun_awt_tiny_TinyGraphics_pDrawable_: (window tiny_getXWindowIfNone: [^ awt_unlock]).
            sun_awt_tiny_TinyGraphics_touched_: java_true.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_dispose = ( |
            | 
            awt_lock.
            (self _Eq: gc_owner) ifTrue: [gc_owner: java_null].
            sun_awt_tiny_TinyGraphics_pDrawable_: java_null.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_drawArc_I: x I: y I: w I: h I: startAngle I: endAngle = ( |
             e <- 23040.
             gc.
             s <- 0.
             win.
            | 
            w java_inst_iflt || [h java_inst_iflt] ifTrue: [^ self].
            awt_lock.
            tiny_getWin: [|:w| win: w]
                     GC: [|:g| gc: g]
                 IfFail: [^ awt_unlock].

            "For the case when the following condition is false, we have already set the
             values of e and s in the initializers: e = 64 * 360, s = 0."
            (360 java_inst_if_icmpgt: endAngle) && [-360 java_inst_if_icmplt: endAngle] ifTrue: [
                s: (64 java_inst_imul: (startAngle java_inst_irem: 360)).
                e: (64 java_inst_imul: endAngle).
            ].
            awt_display xDrawArc: win
                              GC: gc
                               X: (true_x: x)
                               Y: (true_y: y)
                           Width: w
                          Height: h
                           StartAngle: s
                             EndAngle: e.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_drawBytes_Array_B: data I: off I: len I: x I: y = ( |
            | 
            data java_inst_athrowIfNull.
            tiny_awt_drawString: data Is16Bits: 0 false Offset: off Length: len X: x Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_drawChars_Array_C: data I: off I: len I: x I: y = ( |
            | 
            data java_inst_athrowIfNull.
            tiny_awt_drawString: data Is16Bits: 0 true Offset: off Length: len X: x Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_drawLine_I: x1 I: y1 I: x2 I: y2 = ( |
             gc.
             win.
            | 
            awt_lock.
            tiny_getWin: [|:w| win: w]
                     GC: [|:g| gc: g]
                 IfFail: [^ awt_unlock].
            awt_display xDrawLine: win 
                               GC: gc  
                               X1: (true_x: x1)
                               Y1: (true_y: y1)
                               X2: (true_x: x2)
                               Y2: (true_y: y2).
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_drawString_Ljava_lang_String: str I: x I: y = ( |
            | 
            str java_inst_athrowIfNull.
            tiny_awt_drawString: str java_lang_String_value_ 
                       Is16Bits: 0 true
                         Offset: str java_lang_String_offset_ 
                         Length: str length
                              X: x Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyGraphics\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyGraphics_fillRect_I: x I: y I: w0 I: h0 = ( |
             gc.
             h <- 0.
             w <- 0.
             win.
            | 
            awt_lock.
            tiny_getWin: [|:w| win: w]
                     GC: [|:g| gc: g]
                 IfFail: [^ awt_unlock].
            0 > w0 ifTrue: [w: 0] False: [w: w0].
            0 > h0 ifTrue: [h: 0] False: [h: h0].
            awt_display xFillRectangle: win
                                    GC: gc
                                     X: (true_x: x)
                                     Y: (true_y: y)
                                 Width: w
                                Height: h.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyInputThread\x7fComment: Simpler and more robust version of the TinyInputThread_run() native method
defined in .../tiny_Toolkit.c. 
The present version never waits on the awt-lock. It\'s only function is to
notify the event thread about activity on the X display connection.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyInputThread_run = ( |
             disp.
            | 
            disp: awt_display.
            [   disp file suspendForIO.  "This does a select."
                awt_lock.
                tiny_awt_notifyEventThread.
                awt_unlock.   "Unlock before next suspend."
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyToolkit\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyToolkit_beep = ( |
            | 
            awt_display xBell: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyToolkit\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyToolkit_getScreenHeight = ( |
            | 
            awt_screen height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyToolkit\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyToolkit_getScreenResolution = ( |
            | 
            (254 java_inst_imul: awt_screen width) java_inst_idiv: 
            (10  java_inst_imul: awt_screen widthMMOfScreen)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyToolkit\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyToolkit_getScreenWidth = ( |
            | 
            awt_screen width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyToolkit\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyToolkit_init = ( |
             displayStr <- ''.
             gc.
             one_bit.
             viTmp.
             xgcv.
            | 
            java_assert: [awt_lock_owner java_inst_ifnull].
            java_inst_monitorenter.   "This claims the (soon to be) awt_lock.
                                       Do it this way to avoid race condition."
            awt_lock_owner: self.
            displayStr: (0 os environmentAt: 'DISPLAY' IfFail: ':0.0').
            awt_display: (0 xlib display open: displayStr IfFail: [
                awt_unlock.
                java_inst_athrow: java_classes class_java_lang_InternalError
                         Message: 'Can\'t connect to X server: ', displayStr.
            ]).
            awt_screen: awt_display screen.
            awt_root:   awt_screen  rootWindow.
            awt_display isTrueColor ifTrue: [
                awt_unlock.
                java_error: 'true color display not supported yet; ',
                            'may be OK to force 8 bit'.
            ].
            awt_visual:      awt_screen defaultVisual.
            awt_depth:       awt_screen depth.
            awt_cmap:        awt_screen defaultColormapOfScreen.
            awt_cmap window: awt_root.  "cmap needs window to function properly, Ole."

            "I have simplified the visualInfo stuff. Hope this suffices
             (cf. tiny_Toolkit.c).                       Ole, July 1996."
            awt_visInfo: (awt_display matchVisualInfoToClass: awt_display pseudoColor
                                                       Depth: awt_depth
                                                      IfFail: [|:e| java_error: 'tiny_awt: ', e]).

            awt_blackpixel: awt_screen blackPixel.
            awt_whitepixel: awt_screen whitePixel.
            awt_allocate_colors.

            xgcv: 0 xlib xGCValues new.
            xgcv background: 0.
            xgcv foreground: 1.
            one_bit:  (0 xlib pixmap createForSameScreenAs: awt_root Size: 1@1 Depth: 1).
            gc: 0 xlib graphicsContext.
            awt_maskgc: (gc createForSameScreenAs: one_bit
                                        ValueMask: gc gcForeground || gc gcBackground
                                           Values: xgcv).
            one_bit delete.
            tiny_awt_init_atoms.
            awt_unlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyToolkit\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyToolkit_sync = ( |
            | 
            awt_display xSyncDiscardingIf: 0 false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winBack = ( |
            | 
            awt_lock.
            (tiny_getXWindowIfNone: [^ awt_unlock]) lower.
            tiny_awt_notifyEventThread.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winBackground_Ljava_awt_Color: col = ( |
             attrs.
             win.
            | 
            awt_lock.
            win: (tiny_getXWindowIfNone: [^ awt_unlock]).
            tiny_awt_notifyEventThread.
            attrs: 0 xlib xSetWindowAttributes new.
            attrs backgroundPixel: col awt_getColor.
            awt_display xChangeWindowAttributesIn: win
                                       Attributes: attrs.
            attrs delete.  "Delete the proxy."
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fComment: Equivalent native method defined in tiny_Window.c.
Create a window. The window is initially unmapped.
The window is a toplevel window when parentWindow is null.\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winCreate_Lsun_awt_tiny_TinyWindow: parentWindow I: override_redirect = ( |
             attrs.
             e.
             pwin.
             win.
            | 
            awt_lock.
            tiny_window_hasBeenCreated ifTrue: [
                awt_unlock.
                java_inst_athrow: java_classes class_java_lang_IllegalArgumentException
                         Message: 'win'.   "I didn't invent this message, Ole."
            ].
            tiny_awt_notifyEventThread.
            parentWindow java_inst_ifnull ifTrue: [pwin: awt_root]
                                           False: [pwin: parentWindow tiny_getXWindow].
            e: 0 xlib events.
            attrs: 0 xlib xSetWindowAttributes new.
            attrs eventMask: e keyPressMask      ||
                             e keyReleaseMask    ||
                             e focusChangeMask   ||
                             e buttonPressMask   ||
                             e buttonReleaseMask ||
                             e enterWindowMask   ||
                             e leaveWindowMask   ||
                             e pointerMotionMask ||
                             e buttonMotionMask  ||
                             e exposureMask      ||
                             e structureNotifyMask.
            attrs overrideRedirect: 0 != override_redirect.
            attrs borderPixel: 0.
            attrs colormap: awt_cmap.
            win: (pwin createChildWindowAt: 0@0
                                      Size: 1@1
                                     Depth: awt_depth
                                    Visual: awt_visual
                                Attributes: attrs
                                    IfFail: [
                awt_unlock.
                java_inst_athrow: java_classes class_java_lang_OutOfMemoryError
                         Message: 'win'.   "Could give better error."
            ]).
            attrs delete.   "Attributes are proxies, so need explicit deallocation."
            win simpleInitDisplay: awt_display Depth: awt_depth.
            win autoFlush: 0 false.
            sun_awt_tiny_TinyWindow_xid_:    win.
            sun_awt_tiny_TinyWindow_parent_: parentWindow.
            tiny_register.
            awt_display xSetWMProtocolOfWindow: win
                                      Protocol: tiny_awt_wm_delete_window_atom.
            awt_unlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winDispose = ( |
             win.
            | 
            awt_lock.
            win: (tiny_getXWindowIfNone: [^ awt_unlock]).
            tiny_unregister.
            sun_awt_tiny_TinyWindow_xid_: 0.  "Must use 0, not java_null. It is 
                                               declared as an integer. Sigh."
            win delete.   "Must do after unregister - kills the window proxy."
            tiny_awt_notifyEventThread.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winFocus = ( |
             win.
            | 
            awt_lock.
            win: (tiny_getXWindowIfNone: [^ awt_unlock]).
            tiny_awt_notifyEventThread.
            win setFocus: win revertToPointerRoot.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winFront = ( |
            | 
            awt_lock.
            (tiny_getXWindowIfNone: [^ awt_unlock]) raise.
            tiny_awt_notifyEventThread.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winHide = ( |
            | 
            awt_lock.
            (tiny_getXWindowIfNone: [^ awt_unlock]) unmap.
            tiny_awt_notifyEventThread.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winReshape_I: x I: y I: w0 I: h0 = ( |
             h <- 0.
             sh.
             w <- 0.
             win.
            | 
            awt_lock.
            win: (tiny_getXWindowIfNone: [^ awt_unlock]).
            tiny_awt_notifyEventThread.
            w0 java_inst_ifle ifTrue: [w: 1] False: [w: w0].
            h0 java_inst_ifle ifTrue: [h: 1] False: [h: h0].
            sun_awt_tiny_TinyWindow_x_: x.
            sun_awt_tiny_TinyWindow_y_: y.
            sun_awt_tiny_TinyWindow_width_: w.
            sun_awt_tiny_TinyWindow_height_: h.
            sh: 0 xlib xSizeHints new.
            sh x: x.
            sh y: y.
            sh flags: sh usPosition || sh pPosition.
            awt_display xSetWMNormalHintsOfWindow: win To: sh.
            sh delete.
            awt_display xMoveResizeWindow: win X: x Y: y W: w H: h.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winSetCursorI: c = ( |
             attrs.
             cursor.
             j.
             win.
             xc <- -1.
            | 
            "The native code version does no locking. Why? I will do it to be safe."
            awt_lock.
            win: (tiny_getXWindowIfNone: [^ awt_unlock]).
            j: java_classes class_java_awt_Frame.
            c = j java_awt_Frame_DEFAULT__CURSOR_    ifTrue: [xc: -1].
            c = j java_awt_Frame_CROSSHAIR__CURSOR_  ifTrue: [xc: win xc_crosshair].
            c = j java_awt_Frame_TEXT__CURSOR_       ifTrue: [xc: win xc_xterm].
            c = j java_awt_Frame_SW__WAIT__CURSOR_   ifTrue: [xc: win xc_watch].
            c = j java_awt_Frame_SW__RESIZE__CURSOR_ ifTrue: [xc: win xc_bottom_left_corner].
            c = j java_awt_Frame_NW__RESIZE__CURSOR_ ifTrue: [xc: win xc_top_left_corner].
            c = j java_awt_Frame_SE__RESIZE__CURSOR_ ifTrue: [xc: win xc_bottom_right_corner].
            c = j java_awt_Frame_NE__RESIZE__CURSOR_ ifTrue: [xc: win xc_top_right_corner].
            c = j java_awt_Frame_S__RESIZE__CURSOR_  ifTrue: [xc: win xc_bottom_side].
            c = j java_awt_Frame_N__RESIZE__CURSOR_  ifTrue: [xc: win xc_top_side].
            c = j java_awt_Frame_W__RESIZE__CURSOR_  ifTrue: [xc: win xc_left_side].
            c = j java_awt_Frame_E__RESIZE__CURSOR_  ifTrue: [xc: win xc_right_side].
            c = j java_awt_Frame_HAND__CURSOR_       ifTrue: [xc: win xc_hand2].
            c = j java_awt_Frame_MOVE__CURSOR_       ifTrue: [xc: win xc_fleur].
            -1 != xc ifTrue: [
                cursor: (awt_display xCreateFontCursorType: xc).
            ] False: [
                cursor: 0 xlib cursor nullCursor.
            ].
            attrs: 0 xlib xSetWindowAttributes new.
            attrs cursor: cursor.
            awt_display xChangeWindowAttributesIn: win Attributes: attrs.
            attrs delete.
            cursor delete.
            awt_unlock. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winSetTitle_Ljava_lang_String: s = ( |
             str <- ''.
             win.
            | 
            awt_lock.
            win: (tiny_getXWindowIfNone: [^ awt_unlock]).
            tiny_awt_notifyEventThread.
            s java_inst_ifnull ifFalse: [str: s o_javaStrToSelfStr].
            win name: str.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pep' -> 'nativeMethods' -> () From: ( | {
         'Category: sun\x7fCategory: awt\x7fCategory: tiny\x7fCategory: TinyWindow\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         sun_awt_tiny_TinyWindow_winShow = ( |
            | 
            awt_lock.
            (tiny_getXWindowIfNone: [^ awt_unlock]) map.
            tiny_awt_notifyEventThread.
            awt_unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_d2f = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_d2i = ( |
            | java_inst_f2i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_d2l = ( |
            | java_inst_f2l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: doubles\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_dadd: d = ( |
            | + d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_dcmpg: d = ( |
            | 
            java_inst_fcmpg: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_dcmpl: d = ( |
            | java_inst_fcmpl: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: doubles\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_ddiv: d = ( |
            | 
            java_inst_division: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_division: d = ( |
            | 
            _FloatDiv: d IfFail: [
                0.0 = d ifTrue: [
                    compare: 0.0 IfLess: [^ infinity negate]
                                  Equal: [^ infinity - infinity   "NaN"]
                                Greater: [^ infinity].
                ].
                / d.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: doubles\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_dmul: d = ( |
            | * d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: doubles\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_dneg = ( |
            | negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: doubles\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_drem: d = ( |
            | 
            "self" java_inst_dsub: 
              (("self" java_inst_ddiv: d) truncate java_inst_dmul: d)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: doubles\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_dsub: d = ( |
            | - d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_f2d = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_f2i = ( |
            | 
            int32 fromFloat: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_f2l = ( |
            | 
            int64 fromFloat: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: floats\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_fadd: f = ( |
            | + f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_fcmpg: f = ( |
            | 
            compare: f IfLess: -1 Equal: 0 Greater: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_fcmpl: f = ( |
            | java_inst_fcmpg: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: floats\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_fdiv: f = ( |
            | 
            java_inst_division: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: floats\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_fmul: f = ( |
            | * f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: floats\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_fneg = ( |
            | negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: floats\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_frem: f = ( |
            | 
            "self" java_inst_dsub: 
              (("self" java_inst_ddiv: d) truncate java_inst_dmul: d)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fCategory: floats\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot'
        
         java_inst_fsub: f = ( |
            | - f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_i2b = ( |
            | 
            asInt8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_i2c = ( |
            | 
            and: self And: 16rffff).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_i2d = ( |
            | 
            asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_i2f = ( |
            | 
            asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_i2l = ( |
            | 
            asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_i2s = ( |
            | 
            asInt16).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ifeq = ( |
            | java_inst_if_icmpeq: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ifge = ( |
            | java_inst_if_icmpge: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ifgt = ( |
            | 
            java_inst_if_icmpgt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ifle = ( |
            | java_inst_if_icmple: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_iflt = ( |
            | java_inst_if_icmplt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ifne = ( |
            | java_inst_if_icmpne: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ineg = ( |
            | 
            negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: Java arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_arithmeticExceptionMsg: selfStr = ( |
            | 
            pep javaRoot java_inst_athrow: pep javaRoot java_classes 
                                             class_java_lang_ArithmeticException
                                  Message: selfStr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: Java arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: private'
        
         java_inst_divByZeroException = ( |
            | 
            java_inst_arithmeticExceptionMsg: '/ by zero').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: Java arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_helper_div: r And: i = ( |
            | 
            div: r And: i IfFail: [|:e|
                'divisionByZeroError' = e ifTrue: [java_inst_divByZeroException].
                error: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: Java arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_helper_rem: r And: i = ( |
            | 
            rem: r And: i IfFail: [|:e|
                'divisionByZeroError' = e ifTrue: [java_inst_divByZeroException].
                error: e.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_l2d = ( |
            | 
            asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_l2f = ( |
            | 
            asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: conversions\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_l2i = ( |
            | 
            asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ladd: i = ( |
            | 
            add: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: boolean operations\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_land: i = ( |
            | 
            and: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lcmp: ll = ( |
            | 
            cmp: self And: ll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ldiv: i = ( |
            | 
            java_inst_helper_div: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lmul: i = ( |
            | 
            mul: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lneg = ( |
            | 
            negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: boolean operations\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lor: i = ( |
            | 
            or: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lrem: i = ( |
            | 
            java_inst_helper_rem: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: shifts\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lshl: i = ( |
            | 
            shl: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: shifts\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lshr: i = ( |
            | 
            shr: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lsub: i = ( |
            | 
            sub: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: shifts\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lushr: i = ( |
            | 
            ushr: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: Java runtime\x7fCategory: boolean operations\x7fModuleInfo: Module: pep_runtime InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_lxor: i = ( |
            | 
            xor: self And: i).
        } | ) 



 '-- Side effects'

 globals modules pep_runtime postFileIn
