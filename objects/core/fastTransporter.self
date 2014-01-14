 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         fastTransporter = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'fastTransporter' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'fastTransporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules fastTransporter.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastTransporter' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastTransporter' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastTransporter' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         myComment <- 'simple scheme to read & write objects \"
            \" David Ungar 11/28/92 \"
            \"This is a fast, binary transporter'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastTransporter' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'fastTransporter' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         fast = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter fast.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         fileNameForApplication: s = ( |
            | s, '.objs').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         purgeApplication: app = ( |
            | 
             writeApplication: app.  
            removeApplication: app).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         purgeApplication: app FileName: name = ( |
            | 
             writeApplication: app FileName: name.  
            removeApplication: app).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         readApplication: app = ( |
            | 
            readApplication: app FileName: fileNameForApplication: app).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         readApplication: app FileName: name = ( |
             f.
             r.
            | 
            f: os_file openForReading: name.
            r: readRootMirrorsFrom: f.
            f close.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         readObjectFrom: file = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 c.
                } 
            | 
            c: readRootsFrom: file.
            c size > 1 ifTrue: [error: 'more than one object in file'].
            c first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         readRootMirrorsFrom: f = ( |
            | (reader copy file: f) readMirrorsAndReport).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         readRootsFrom: file = ( |
            | 
            (readRootMirrorsFrom: file) copyMappedBy: [|:m| m reflectee]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         reader = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter fast reader.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         alreadyObjs <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         alreadyObjsSize <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'Comment: statStructure st_blksize\x7fModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (byteVector copySize: 4096 FillingWith: 0)'
        
         buffer <- byteVector copySize: 4096 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         free <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         mustPreserveIdentity <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         next <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         reader = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter fast reader.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         readingOrWriting = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'readingOrWriting' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter fast readingOrWriting.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'readingOrWriting' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         alreadyObjs <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'readingOrWriting' -> () From: ( | {
         'Comment: statStructure st_blksize\x7fModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (byteVector copySize: 4096 FillingWith: 0)'
        
         buffer <- byteVector copySize: 4096 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'readingOrWriting' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'readingOrWriting' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         free <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'readingOrWriting' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         next <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter fast reader parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'readingOrWriting' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         removeApplication: app = ( |
            | 
            suspects do: [|:m. | 
                ( m lookupKey: app ) do: [|:s| s remove].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'Comment: statStructure st_blksize\x7fModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: ( ((vector copySize: 2) at: 0 Put: reflect: traits) at: 1 Put: reflect: lobby)\x7fVisibility: private'
        
         suspects =  ((vector copySize: 2) at: 0 Put: reflect: traits) at: 1 Put: reflect: lobby.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         test = ( |
             name.
            | 
            name: '/tmp/' ,
                  fileNameForApplication: 'primitiveMaker',
                  os getpid printString.
            testWrite: name.
            testRead: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         testRead: name = ( |
            | 
            readApplication: 'primitiveMaker' FileName: name.  
            primitiveMaker reader test).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         testWrite: name = ( |
            | 
            bootstrap read: 'primitiveMaker'   From: 'glue'.
            purgeApplication: 'primitiveMaker' FileName: name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         writeApplication: app = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 f.
                } 
            | 
            writeApplication: app FileName: fileNameForApplication: app).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         writeApplication: app FileName: name = ( |
             f.
            | 
            f: os_file openForWriting: name.
            writeApplication: app To: f.
            f close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         writeApplication: app To: file = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (set copyRemoveAll)'
                
                 roots <- set copyRemoveAll.
                } 
            | 
            roots: roots copy.
            suspects do: [|:m. slots | 
                ( m lookupKey: app ) do: [|:s| roots add: s contents]. 
            ].
            writeRootMirrors: roots To: file).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         writeObject: obj To: file = ( |
            | 
            writeRoots: (vector copyAddFirst: obj) To: file).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         writeRootMirrors: mirs To: file = ( |
            | 
            ((writer copy file: file) rootMirrors: mirs) write.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         writeRoots: objs To: file = ( |
            | 
            writeRootMirrors: (objs copyMappedBy: [|:x| reflect: x]) To: file).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         writer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter fast writer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (dictionary copyRemoveAll)'
        
         alreadyObjs <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'Comment: statStructure st_blksize\x7fModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (byteVector copySize: 4096 FillingWith: 0)'
        
         buffer <- byteVector copySize: 4096 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         free <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         next <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         writer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter fast writer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: public'
        
         rootMirrors <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         fast = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits transporter fast.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         alloc: n = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 cnt.
                } 
            | 
            n <= (free - next) ifTrue: [ | r. |
                r: next.
                next: next + n.
              ^ r
            ].
            n > buffer size ifTrue: [buffer: buffer copySize: n].
            next > 0 ifTrue: [
                free - next do: [|:i| buffer at: i Put: buffer at: i + next].
                free: free - next.
                next: 0.
            ].
            cnt: buffer size - free.
            c: file readInto: buffer  Count: cnt  At: free.
            free: free + c.
            n <= (free - next) ifFalse: [
                error: 'end of file'.
            ].
            next: next + n.
            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         atID: id Put: m = ( |
            | 
            (mustPreserveIdentity at: id) ifTrue: [ | oldM |
                oldM: alreadyObjs at: id.
                oldM define: m.
                oldM "cause define clones arg!"
            ] False: [
                alreadyObjs at: id Put: m.
                m
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         clearAndReadSlotsInto: m = ( |
            | 
            readCode = codes protoSlots ifTrue: [
                remember: m.  
                setAnnotationOfObject: m To: readAnnotation.
              ^ m
            ].
            m removeAllSlots.
            readBasicSlotsObjectInto: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         currentPosition = ( |
            | file currentPosition - (free - next)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         log <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         outOfSync = ( |
            | 
            error: 'out of sync with file at position ', 
                   currentPosition printString,
                   ' =  octal 0',
                  (currentPosition printStringBase: 8)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         bitsPerInt = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         bitsPerShort = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         bytesPerFloat = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         bytesPerInt = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         bytesPerShort = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         codeForMirror: m = ( |
            | 
            "ordered by frequency and specificity "

            " these 2 must preceed method"
            m isReflecteeActivation       ifTrue: [^ codes activation ].
            m isReflecteeBlockMethod      ifTrue: [^ codes blockMethod ].
            m isReflecteeMethod           ifTrue: [^ codes method ].
            m isReflecteeAssignment       ifTrue: [^ codes assignment ].

            " string must preceed bytevector "
            m isReflecteeString           ifTrue: [ ^ codes string ].
            m isReflecteeByteVector       ifTrue: [ ^ codes byteVector ].

            m isReflecteeSlots            ifTrue: [ ^ codes slots ].
            m isReflecteeInteger          ifTrue: [ ^ codes integer ].
            m isReflecteeFloat            ifTrue: [ ^ codes float ].
            m isReflecteeMirror           ifTrue: [ ^ codes mirror ].
            m isReflecteeVector           ifTrue: [ ^ codes vector ].

            m isReflecteeBlock            ifTrue: [^ codes block ].
            m isReflecteeProcess          ifTrue: [^ codes process ].
            error: 'what').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         codes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( |
             {} = 'Comment: an actual histogram:

        2903 :
         516 t
         133 h
         120 a
          95 s
          84 l
          84 d
          21 i
          11 w
           2 r
           1 u
           1 p\x7fModuleInfo: Creator: traits transporter fast reader parent codes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         activation = 99.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         already = 58.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         assignment = 97.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         block = 108.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         blockMethod = 100.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         byteVector = 98.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         check = 122.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         float = 102.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         integer = 105.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         method = 104.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         mirror = 109.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         mutableString = 117.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         process = 112.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'Comment: just for slots part of bvs and vectors\x7fModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         protoSlots = 80.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         reattach = 114.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         slots = 115.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'Comment: just for slots part of bvs and vectors\x7fModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         specialSlots = 83.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         string = 116.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         vector = 118.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> 'codes' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         wellKnown = 119.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            (resend.copy  alreadyObjs: alreadyObjs copy)
                          buffer:      buffer      copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         debug = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         ifWorthRemembering: m = ( |
            | 
            (
                 m isReflecteeAssignment
            || [ m isReflecteeFloat
            || [ m isReflecteeInteger
            || [ m isReflecteeMirror "cannot do this one" ]]]
            ) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         logCode: c = ( |
            | 
            false ifTrue: [
                (
                    log, ' ', c asCharacter, '0', 
                    (currentPosition pred printStringBase: 8)
                ) print.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         maxByte = 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         vmCannotAnnotate: blk = ( |
            | 
            " comment out this block because the VM cannot 
              annotate this kind of object"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readActivation = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            "cannot do live ones, do not even try"
            m: mirrors deadActivation.
            remember: m.
            vmCannotAnnotate: [setAnnotationOfObject: m  To: readAnnotation].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readAlreadyObject = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            i: readBasicInt.
            r: alreadyObjs at: i.
            mustPreserveIdentity at: i Put: true.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readAnnotation = ( |
            | readBasicString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readAnonMirror: c = ( |
            | 
            " sorted by frequency"

            c = codes string         ifTrue: [ ^ readString      ].
            c = codes method         ifTrue: [ ^ readMethod ].
            c = codes assignment     ifTrue: [ ^ mirrors assignment ].
            c = codes slots          ifTrue: [ ^ readSlotsObject ].
            c = codes block          ifTrue: [ ^ readBlock       ].
            c = codes blockMethod    ifTrue: [ ^ readBlockMethod ].
            c = codes byteVector     ifTrue: [ ^ readByteVector  ].
            c = codes integer        ifTrue: [ ^ readInt ].
            c = codes mutableString  ifTrue: [ ^ readMutableString      ].
            c = codes float          ifTrue: [ ^ readFloat  ].
            c = codes mirror         ifTrue: [ ^ reflect: readMirror ].
            c = codes vector         ifTrue: [ ^ readVector      ].
            c = codes process        ifTrue: [ ^ readProcess     ].
            c = codes activation     ifTrue: [ ^ readActivation  ].

            outOfSync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBasicByteVector = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: readBasicInt.
            readN: i Proto: byteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBasicInt = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 b.
                } 
            | 
            b: readByte.
            b < maxByte pred  ifTrue: [^b].
            b = maxByte pred  ifTrue: [^readShortInt].
            readFullInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBasicMethodIsBlock: isBlock = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 codes <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 file <- ''.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 id <- 0.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 line <- 0.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 literals <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (mirrors method)'
                
                 methodMir <- bootstrap stub -> 'globals' -> 'mirrors' -> 'method' -> ().
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 source <- ''.
                } 
            | 
            " Right now, there are no primitives to alter the bytecodes
              of a method. So, just create a dummy for now and replace it later"
            " Assume literals cannot reference own method"
            id: remember: reflect: () _Clone.

            source: readBasicString.
            file:   readMirror reflectee.
            line:   readBasicInt.
            codes:  readBasicByteVector.

            literals: literals copySize: readBasicInt.
            literals size do: [|:i|  literals at: i Put: readMirror reflectee].

            methodMir: isBlock ifTrue: [
                mirrors blockMethod createBlockMethod_Bytecodes: codes
                                                       Literals: literals
                                                           File: file
                                                           Line: line
                                                         Source: source
            ] False: [
                mirrors method createOuterMethod_Bytecodes: codes
                                                  Literals: literals
                                                      File: file
                                                      Line: line
                                                    Source: source
            ].
            readBasicInt do: [ | n |
                n: readMirror reflectee.
                methodMir: methodMir copyAt: n PutContents: mirrors slots.
                methodMir: ((methodMir at: n) copyHolderForIsArgument: true) holder.
            ].
            [(mustPreserveIdentity at: id) not] assert.
            alreadyObjs at: id Put: methodMir.
            readBasicSlotsObjectAt: id).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBasicSlotsObjectAt: i = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: alreadyObjs at: i.
            setAnnotationOfObject: r  To: readAnnotation.
            readBasicInt do: [
                readSlot: [|:isParent. :vis. :name. :anno. :contents|
                    r: r  copyAt: name  PutContents: contents.
                    r: ((((r at: name) 
                                    copyHolderForVisibility: vis)
                                    copyHolderForIsParent: isParent)
                                    copyHolderForAnnotation: anno)
                        holder.
                ].
            ].
            atID: i Put: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBasicSlotsObjectInto: m = ( |
            | readBasicSlotsObjectAt: remember: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBasicString = ( |
            | readNonConString canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBlock = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 a.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 id.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            id: remember: () _Clone.
            vmCannotAnnotate: [a: readAnnotation].
            m: mirrors block copyForMethod: readMirror.
            vmCannotAnnotate: [setAnnotationOfObject: m  To: a].
            atID: id Put: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readBlockMethod = ( |
            | readBasicMethodIsBlock: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readByte = ( |
            | buffer at: alloc: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readByteVector = ( |
            | 
            clearAndReadSlotsInto: reflect:  readBasicByteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readCode = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            c: readByte.
            logCode: c.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readFloat = ( |
            | 
            reflect: 
              (readN: bytesPerFloat Proto: byteVector)  cFloatDouble: false At: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readFullInt = ( |
            | 
            (readN: bytesPerInt Proto: byteVector) bigEndianIntSize: bitsPerInt 
                                                             Signed: true At: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readInt = ( |
            | reflect: readBasicInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readMethod = ( |
            | readBasicMethodIsBlock: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readMirror = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            c: readCode.

            c = codes already        ifTrue: [ ^ readAlreadyObject].
            r: readNewMirror: c.
            debug ifTrue: [ | i |
                readCode = codes check ifFalse: [outOfSync].
                i: readBasicInt.
                i = -1 ifFalse: [
                    r = (alreadyObjs at: i) ifFalse: [error: 'ids wrong'].
                ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'Comment: can copy, set file, then call this several times \x7fModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readMirrors = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            n: readFullInt.         
            alreadyObjs:          vector copySize: n.
            mustPreserveIdentity: vector copySize: n FillingWith: false.
            alreadyObjsSize: 0.

            debug = ( readByte = 1) ifFalse: [error: 'debug flag is inconsistent'].
            debug ifTrue: ['debugging checks enabled' printLine].

            i: readBasicInt.
            r: vector copySize: i.
            i do: [|:j| r at: j Put: readMirror].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         readMirrorsAndReport = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 chars.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 r.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 t.
                } 
            | 
                 'reading . . .' printLine.
                 chars: file currentPosition.
                 t: [r: readMirrors] time.
                 chars: file currentPosition - chars.
                ('read ',  chars printString, ' bytes in ', 
                               t printString, ' ms., ',
            ((chars * 1000) / (0.001 max: t)) printString, ' b/s') printLine.
                 r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readMutableString = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 a.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 m.
                } 
            | 
            a: readAnnotation.
            m: reflect: readNonConString. 
            setAnnotationOfObject: m  To: a.
            remember: m. 
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readN: n Proto: p = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            i: alloc: n.
            r: p copySize: n.
            n do: [|:j| r at: j Put: buffer at: i + j].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readNewMirror: c = ( |
            | 
            c = codes wellKnown    ifTrue: [^ readWellKnown ].
            c = codes reattach     ifTrue: [^ reattach: readAnonMirror: readByte].
            readAnonMirror: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readNonConString = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: readBasicInt.
            readN: i Proto: mutableString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readPath = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            v: vector copySize: readBasicInt.
            v size do: [|:i| v at: i Put: readMirror reflectee].
            path copyWithAll: v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readProcess = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 m.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: process copy.
            m: reflect: p.
            remember: m.
            vmCannotAnnotate: [setAnnotationOfObject: p  To: readAnnotation].
            p causeOfBirth: readBasicString.
            p causeOfDeath: readBasicString.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readShortInt = ( |
            | 
            (readN: bytesPerShort Proto: byteVector) bigEndianIntSize: bitsPerShort
                                                               Signed: true At: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readSlot: priVisNameContentsBlock = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 anno.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 contents.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 isParent.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 name.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 vis.
                } 
            | 
            readSlotName: [|:p. :v. :n. :a |
                isParent:  p.
                vis:  v.
                name: n.
                anno: a.
            ].
            contents: readMirror.
            priVisNameContentsBlock value: isParent
                                     With: vis
                                     With: name
                                     With: anno
                                     With: contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readSlotName: priVisNameBlock = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 anno.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 isParent.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 name.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 v.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 vis.
                } 
            | 
            isParent: readByte asCharacter = '*'.
            v: readByte.
            vis:  
                v = '_' asByte ifTrue: [    privateSlot] False: [
                v = '^' asByte ifTrue: [     publicSlot] False: [
                                         undeclaredSlot]].
            name: readMirror reflectee.
            anno: readMirror reflectee.
            priVisNameBlock value: isParent  With: vis  With: name With: anno).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readSlotsObject = ( |
            | readBasicSlotsObjectInto: reflect: () _Clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readString = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 m.
                } 
            | m: reflect: readBasicString.  remember: m. m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readVector = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 vm.
                } 
            | 
            vm: clearAndReadSlotsInto: reflect: vector copySize: readBasicInt.
            vm reflectee size do: [|:i| 
                vm reflectee at: i Put: readMirror reflectee].
            vm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         readWellKnown = ( |
             id.
             m.
             p.
            | 
            " do it with mirrors to circumvent privacy "
            id: remember: () _Clone.
            p: readPath.
            m: p targetMirror.
            ( ifWorthRemembering: m) ifTrue: [atID: id  Put: m].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         reattach: m = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 anno.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 host.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 isParent.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 name.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 path <- bootstrap stub -> 'globals' -> 'nullPath' -> ().
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 vis.
                } 
            | 
            path: readPath.
            readSlotName: [|:p. :v. :n. :a | isParent: p.  vis: v.  name: n.  anno: a].
            host: path targetMirrorIfAbsent: [
                    warning: 'could not find ', path fullName.
                  ^ m
            ].
            ('Installing ', name, ' into ', path fullName) printLine.
            host at: name PutContents: m.
            (((host at: name) visibility: vis) isParent: isParent) annotation: anno.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         remember: x = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: alreadyObjsSize.
            alreadyObjs at: i Put: x.
            alreadyObjsSize: alreadyObjsSize succ.
            i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         setAnnotationOfObject: m To: a = ( |
            | 
            m annotation: a.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
        
         readingOrWriting = bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         alloc: n = ( |
            | 
            "return an index into buffer big enough to hold n bytes"
            (next + n) < buffer size   ifTrue: [| r |
                r: next.
                next: next + n.
                r
            ]  False: [
                flush.
                n > buffer size ifTrue: [buffer: buffer copySize: n].
                next: n.
                0
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         areSameSlotsIn: m1 And: m2 = ( |
            | 
            m1 names = m2 names ifFalse: [^ false].
            m1 do: [|:s1. s2|  
              s2: m2 at: s1 name.
                (s1       contents = s2       contents)
            && [(s1     isArgument = s2     isArgument)
            && [(s1       isParent = s2       isParent)
            && [(s1     visibility = s2     visibility)]]]
              ifFalse: [^ false].
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy rootMirrors: rootMirrors copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         currentPosition = ( |
            | file currentPosition + next).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         flush = ( |
            | file writeFrom: buffer Count: next.  next: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         log <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'reader' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: public'
        
         write = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            'writing . . .' printLine.
            t: [writeRootMirrors] time.
                ('wrote ', file size printString, ' bytes in ', 
                                   t printString, ' ms., ',
            ((file size * 1000) / (0.001 max: t)) printString, ' b/s') printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         write1: s = ( |
            | writeByte: s asByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeActivation: actMir = ( |
            | 
            actMir isLive ifTrue: [
                warning: 'Transporter cannot save live activation: ',  
                         actMir printString.
            ].
            writeCode: codes activation.
            vmCannotAnnotate: [writeAnnotation: actMir]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeAnnotation: m = ( |
            | writeBasicString: m annotation asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeAnonMirror: m = ( |
            | 
            " must preceeed method "
            m isReflecteeActivation      ifTrue: [^ writeActivation: m ].
            m isReflecteeBlockMethod     ifTrue: [^ writeBlockMethod:  m ].
            m isReflecteeMethod          ifTrue: [^ writeMethod:  m ].
            m isReflecteeAssignment      ifTrue: [^ writeAssignment].

            " string must preceed bytevector "
            m isReflecteeString     ifTrue: [ ^ writeString:      m ].
            m isReflecteeByteVector ifTrue: [ ^ writeByteVector:  m ].

            m isReflecteeSlots      ifTrue: [ ^ writeSlotsObject: m ].
            m isReflecteeInteger    ifTrue: [ ^ writeInt:         m ].
            m isReflecteeFloat      ifTrue: [ ^ writeFloat:       m ].
            m isReflecteeMirror     ifTrue: [ ^ writeMir:         m ].
            m isReflecteeVector     ifTrue: [ ^ writeVector:      m ].

            m isReflecteeBlock      ifTrue: [^ writeBlock: m ].
            m isReflecteeProcess    ifTrue: [^ writeProcess:    m ].

            error: 'what?').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeAssignment = ( |
            | writeCode: codes assignment. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBasicByteVector: bv = ( |
            | 
            writeBasicInt:         bv size.
            writeN:                bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBasicInt: i = ( |
            | 
            (0 <= i) && [i < maxByte pred] ifTrue: [writeByte: i] False: [|b|
                b: byteVector copySize: bytesPerShort.
                b bigEndianIntSize: bitsPerShort Signed: true At: 0 Put: i IfFail: [
                    writeByte: maxByte.
                  ^ writeFullInt: i
                ].
                writeByte: maxByte pred.
                writeN: b.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBasicMethod: m = ( |
             args <- bootstrap stub -> 'globals' -> 'list' -> ().
             lits.
             locals <- bootstrap stub -> 'globals' -> 'list' -> ().
             unoptM.
            | 
            unoptM: m copyRemoveAll.

            writeBasicString:     m source.
            writeMirror: reflect: m file.
            writeBasicInt:        m line.

            "This next bit is a test of the VM.
             Take this out if you every use this transporter
             for real--dmu"
            unoptM codes bytesDo: [|:c|
             ( 'Local' isSuffixOf: (bytecodeFormat opcodeNameOf: c))
              ifTrue: [halt].].
            writeBasicByteVector: unoptM codes.

            lits:  unoptM literals.
            writeBasicInt:  lits size.
            lits do: [|:lit|  writeMirror: reflect: lit].

            args:   args   copyRemoveAll.
            locals: locals copyRemoveAll.
            m do: [|:s| 
                (s isArgument  ifTrue: [args] False: [locals]) addLast: s.
            ].
            writeBasicInt: args size.
            args do: [|:a| writeMirror: reflect: a key].

            writeAnnotation:      m.
            writeBasicInt: locals size.
            locals do: [|:s | writeSlot: s].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBasicSlotsObject: aMir = ( |
            | 
            writeAnnotation: aMir.
            writeBasicInt: aMir size.
            aMir do: [|:s| writeSlot: s]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBasicSlotsObject: m1 Proto: p = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 m2.
                } 
            | 
            "compare slots in m to proto p, if same write same code, else write
             slots"
            m2: reflect: p.
            (areSameSlotsIn: m1 And: m2) ifTrue: [
                writeCode: codes protoSlots.
                writeAnnotation: m1.
            ] False: [
                writeCode: codes specialSlots.
                writeBasicSlotsObject: m1.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBasicString: st = ( |
            | 
            writeBasicInt: st size.
            writeN:        st.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBlock: m = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 vs.
                } 
            | 
            writeCode:   codes block.
            vmCannotAnnotate: [writeAnnotation: m].
            m lexicalParent isLive ifTrue: [
                warning: 'Transporter cannot save live block: ',  
                         m printString.
            ].
            vs: m valueSlot.
            writeMirror: vs contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeBlockMethod: m = ( |
            | 
            writeCode: codes blockMethod.
            writeBasicMethod: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeByte: b = ( |
            | buffer at: (alloc: 1) Put: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeByteVector: bv = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: InitializeToExpression: (reflect: mutableString)'
                
                 ms = reflect: mutableString.
                } 
            | 
            (areSameSlotsIn: bv And: ms) ifTrue: [
                ^ writeMutableString: bv
            ].
            writeCode:             codes byteVector.
            writeBasicByteVector:  bv reflectee.
            writeBasicSlotsObject: bv Proto: byteVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeCode: c = ( |
            | 
            writeByte:  c.
            logCode: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeFloat: flm = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 b.
                } 
            | 
            writeCode: codes float.
            b: byteVector copySize: bytesPerFloat.
            b cFloatDouble: false At: 0 Put: flm reflectee.
            writeN: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeFullInt: i = ( |
             b.
            | 
            b: byteVector copySize: bytesPerInt.
            b bigEndianIntSize: bitsPerInt Signed: true At: 0  Put: i.
            writeN: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeInt: im = ( |
            | 
            writeCode:     codes integer.
            writeBasicInt: im reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeMethod: m = ( |
            | 
            writeCode: codes method.
            writeBasicMethod: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeMir: aMirMir = ( |
            | 
            writeCode:   codes mirror.
            writeMirror: aMirMir reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeMirror: m = ( |
            | "m must be a mirror"

            (ifWorthRemembering: m) ifTrue: [
                [|:xit. i |
                    i: alreadyObjs at: m IfAbsent: xit.
                    writeCode:     codes already.
                    writeBasicInt: i.
                  ^ self
                ] exit.
                alreadyObjs at: m Put: alreadyObjs size.
            ].
            writeNewMirror: m.
            debug ifTrue: [
                writeCode: codes check.
                writeBasicInt: alreadyObjs at: m IfAbsent: [-1].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeMutableString: bv = ( |
            | 
            writeCode:             codes mutableString.
            writeAnnotation:       bv.
            writeBasicString:      bv reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeN: s = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: s size.
            i: alloc: n.
            n do: [|:j| buffer at: j + i Put: (s at: j) asByte].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeNewMirror: m = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            m creatorPathIfPresent: [|:c| p: c] 
                      IfAbsent: [ ^ writeAnonMirror: m. ].
            (rootMirrors includes: m) ifTrue: [
                writeCode: codes reattach.
                writeAnonMirror: m.
              ^ writeReattachment: p
            ].
            p slotsDo: [|:slot. :i. h |
                h: slot holder.
                "if m is reachable via rootMirrors,
                 it will get reattached automatically."
                (rootMirrors includes: h) ifTrue: [ 
                    ^ writeAnonMirror: m.
                ].
            ] IfAbsent: [error: 'path cache must be current'].
            "path does not cross a rootMirror, must be well known"
            writeWellKnown: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writePath: p = ( |
            | 
            writeBasicInt: p size.
            p do: [|:n| writeMirror: reflect: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeProcess: m = ( | {
                 'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            p: m reflectee.
            writeCode: codes process.
            vmCannotAnnotate: [writeAnnotation: m].
            p isActive ifTrue: [
                warning: 'Transporter cannot save active process: ',  
                         p printString.
            ].
            writeBasicString: p causeOfBirth.
            writeBasicString: p causeOfDeath).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeReattachment: p = ( |
            | 
            writePath:     p copyWithoutLast.
            writeSlotName: p targetSlotIfAbsent: 
                [error: 'path cache must be current'].
            ('writing ', p fullName) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeRootMirrors = ( |
            | 
            writeFullInt: 0. "reserve place for dict size; MUST BE FIRST"
            writeByte: debug ifTrue: 1 False: 0.
            writeBasicInt: rootMirrors size.
            rootMirrors do: [|:m| writeMirror: m].  
            flush.

            file lseekOffset: 0 Whence: file seek_set.
            writeFullInt: alreadyObjs size. "write real dict size"
            flush.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeSlot: s = ( |
            | writeSlotName: s.  writeMirror: s value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeSlotName: s = ( |
            | 
            writeByte:   (s isParent ifTrue: '*' False: ' ') asByte.
            write1:      s visibility asPrefix first.
            writeMirror: reflect: s key.
            writeMirror: reflect: s annotation asString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeSlotsObject: aMir = ( |
            | 
            writeCode:             codes slots.
            writeBasicSlotsObject: aMir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeString: st = ( |
            | 
            writeCode:        codes string.
            writeBasicString: st reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeVector: vm = ( |
            | 
            writeCode:             codes vector.
            writeBasicInt:         vm reflectee size.
            writeBasicSlotsObject: vm  Proto: vector.
            vm reflectee do: [|:e| writeMirror: reflect: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'transporter' -> 'fast' -> 'writer' -> () From: ( | {
         'ModuleInfo: Module: fastTransporter InitialContents: FollowSlot\x7fVisibility: private'
        
         writeWellKnown: p = ( |
            | 
            writeCode: codes wellKnown.
            writePath: p).
        } | ) 



 '-- Side effects'

 globals modules fastTransporter postFileIn
