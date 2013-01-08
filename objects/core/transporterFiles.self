 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         transporterFiles = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'transporterFiles' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'transporterFiles' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules transporterFiles.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporterFiles' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporterFiles' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporterFiles' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporterFiles' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'transporterFiles' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'bootstrapFile
                          bufferedBootstrapFile'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         binaryFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter binaryFile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'Category: machine info\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         bitsPerInt = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'Category: machine info\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         bitsPerShort = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'Category: machine info\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         bytesPerFloat = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'Category: machine info\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         bytesPerInt = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'Category: machine info\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         bytesPerShort = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            resend.copy buffer: buffer copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'Category: copied-down\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'Category: machine info\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         maxByte = 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         file = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter file.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         binaryInputFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter binaryInputFile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         allocRead: n = ( | {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
                 c.
                }  {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         atEOF = ( |
            | (free = next) && [file atEOF]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'Category: copy-down\x7fComment: statStructure st_blksize\x7fModuleInfo: Module: transporterFiles InitialContents: InitializeToExpression: (byteVector copySize: 4096 FillingWith: 0)'
        
         buffer <- byteVector copySize: 4096 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         currentPosition = ( |
            | file currentPosition - (free - next)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'Category: copied-down\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'Category: copy-down\x7fComment: index of first byte in buffer past data waiting to be read\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         free <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | resend.initialize.  next: 0.  free: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'Category: copy-down\x7fComment: index of first byte in buffer not yet written or read by client\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         next <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         readBoolean = ( |
            | 0 != readByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         readByte = ( |
            | buffer at: allocRead: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         readByteVector = ( |
            | readBytes: readInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         readBytes: n = ( | {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
                 bv.
                }  {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: allocRead: n.
            bv: byteVector copySize: n.
            n do: [|:j| bv at: j Put: buffer at: i + j].
            bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         readFloat = ( |
            | 
            (readBytes: bytesPerFloat)  cFloatDouble: false At: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         readFullInteger = ( |
            | 
            (readBytes: bytesPerInt ) 
                bigEndianIntSize: bitsPerInt Signed: true At: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         readInteger = ( | {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
                 b.
                } 
            | 
            b: readByte.
            b < maxByte pred  ifTrue: [^b].
            b = maxByte pred  ifTrue: [^readShortInteger].
            readFullInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         readShortInteger = ( |
            | 
            (readBytes: bytesPerShort) 
                bigEndianIntSize: bitsPerShort Signed: true At: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryInputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         readString = ( |
            | readByteVector asString canonicalize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         binaryOutputFile = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals transporter binaryOutputFile.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         allocWrite: n = ( |
            | 
            catchMe = -1 ifFalse: [
                (currentPosition <= catchMe) && [(currentPosition + n) > catchMe]
                    ifTrue: [halt: 'caught one'].
            ].
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'Category: copy-down\x7fComment: statStructure st_blksize\x7fModuleInfo: Module: transporterFiles InitialContents: InitializeToExpression: (byteVector copySize: 4096 FillingWith: 0)'
        
         buffer <- byteVector copySize: 4096 FillingWith: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         catchMe = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | flush. resend.close).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         currentPosition = ( |
            | file currentPosition + next).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'Category: copied-down\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         flush = ( |
            | file writeFrom: buffer Count: next.  next: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         initialize = ( |
            | resend.initialize.  next: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'Category: copy-down\x7fComment: index of first byte in buffer not yet written or read by client\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         next <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'transporter' -> 'binaryFile' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         seekTo: pos = ( |
            | 
            flush.  
            file lseekOffset: pos Whence: file seek_set. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         writeBoolean: b = ( |
            | writeByte: (b ifTrue: 1 False: 0) asByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         writeByte: b = ( |
            | buffer at: (allocWrite: 1) Put: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         writeByteVector: bv = ( |
            | writeInteger: bv size.  writeN: bv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         writeFloat: flm = ( | {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
                 b.
                } 
            | 
            b: byteVector copySize: bytesPerFloat.
            b cFloatDouble: false At: 0 Put: flm reflectee.
            writeN: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         writeFullInteger: i = ( |
             b.
            | 
            b: byteVector copySize: bytesPerInt.
            b bigEndianIntSize: bitsPerInt Signed: true At: 0  Put: i.
            writeN: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         writeInteger: i = ( |
            | 
            (0 <= i) && [i < maxByte pred] ifTrue: [writeByte: i] False: [|b|
                b: byteVector copySize: bytesPerShort.
                b bigEndianIntSize: bitsPerShort Signed: true At: 0 Put: i IfFail: [
                    writeByte: maxByte.
                  ^ writeFullInteger: i
                ].
                writeByte: maxByte pred.
                writeN: b.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: private'
        
         writeN: s = ( | {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
                 i.
                }  {
                 'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            n: s size.
            i: allocWrite: n.
            n do: [|:j| buffer at: j + i Put: (s at: j) asByte].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'binaryOutputFile' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         writeString: s = ( |
            | writeByteVector: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | file close.  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( | {
         'Category: copy-down\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         initialize = ( |
            | file closeIfFail: [].  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( | {
         'Comment: _\x7fModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         nameForApplication: app = ( |
            | app, '.objs').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         openForReadingApplication: app = ( |
            | 
            copy initialize 
                file: os_file openForReading: nameForApplication: app).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot\x7fVisibility: public'
        
         openForWritingApplication: app = ( |
            | 
            copy initialize 
                file: os_file openForWriting: nameForApplication: app).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'transporter' -> 'file' -> () From: ( | {
         'ModuleInfo: Module: transporterFiles InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'bootstrapFile' From: 'core'
 bootstrap read: 'bufferedBootstrapFile' From: 'core'



 '-- Side effects'

 globals modules transporterFiles postFileIn
