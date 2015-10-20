 '$Revision:$'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot'
        
         streams = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules streams.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'streams' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: streams\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         positionableStream = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'positionableStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals positionableStream.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         collection <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals positionableStream parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: aCollection = ( |
             c.
            | 
            c: copy.
            c collection: aCollection.
            c readLimit: aCollection size.
            c reset.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> () From: ( | {
         'Category: mixins\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readingMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals positionableStream parent readingMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fCategory: entire stream\x7fComment: Return contents of entire stream\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         contents = ( |
            | 
            contentsAs: bufferPrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fCategory: entire stream\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsAs: proto = ( |
             n <- 0.
             res.
            | 
            n: size.
            res: (proto copySize: n).
            readInto: res Count: n. 
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fCategory: entire stream\x7fComment: Return contents of entire stream as a byte vector.\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsAsByteVector = ( |
            | 
            contentsAs: byteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         read = ( |
            | readMin: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readBigEndianIntegerOfByteCount: bc Signed: isSigned IfFail: fb = ( |
             bytes.
            | 
            bytes: readCount: bc IfFail: [|:e| ^ fb value: e].
            bytes bigEndianIntSize: bc * 8 Signed: isSigned At: 0 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readCount: m = ( |
            | 
            readMin: m Max: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readCount: m IfFail: fb = ( |
            | 
            readMin: m Max: m IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readIfFail: fb = ( |
            | 
            readMin: 1 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf = ( |
            | readInto: buf Min: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Count: count = ( |
            | readInto: buf Min: count Max: count).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Count: count At: i = ( |
            | 
            readInto: buf Min: count Max: count At: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Count: count IfFail: fb = ( |
            | 
            readInto: buf Min: count Max: count IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf IfFail: fb = ( |
            | 
            readInto: buf Min: 1 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min = ( |
            | 
            readInto: buf Min: min Max: buf size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min At: i = ( |
            | 
            readInto: buf Min: min Max: buf size At: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min At: i IfFail: fb = ( |
            | 
            readInto: buf Min: min Max: buf size At: i IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min IfFail: fb = ( |
            | 
            readInto: buf Min: min  Max: buf size IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min Max: max = ( |
            | 
            readInto: buf Min: min Max: max At: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min Max: max At: i = ( |
            | 
            readInto: buf Min: min Max: max At: i
              IfFail: [ | :e | error: e Op: 'read' FileName: name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min Max: max IfFail: fb = ( |
            | 
            readInto: buf Min: min Max: max At: 0 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readLittleEndianIntegerOfByteCount: bc Signed: isSigned IfFail: fb = ( |
             bytes.
            | 
            bytes: readCount: bc IfFail: [|:e| ^ fb value: e].
            bytes littleEndianIntSize: bc * 8 Signed: isSigned At: 0 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readMin: min = ( |
            | readMin: min Max: 8 * 1024).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readMin: min IfFail: fb = ( |
            | readMin: min  Max: 8 * 1024  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readMin: min Max: max = ( |
            | 
            readMin: min  Max: max
              IfFail: [ | :e | error: e Op: 'read' FileName: name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fComment: may return less than min if it reaches the end\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readMin: min Max: max IfFail: fb = ( |
             b.
             howMany <- 0.
            | 
            b: bufferPrototype copySize: max.
            howMany: readInto: b Min: min Max: max IfFail: [ |:e| ^ fb value: e ].
            howMany = max ifTrue: [b] False: [b copySize: howMany]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readNextOne = ( |
            | 
            (readCount: 1) first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readNextOneIfFail: fb = ( |
            | 
            "Note: 'readCount:IfFail:' eventually calls 'readMin:Max:IfFail:'
             which may return FEWER than 'min' characters (in this case fewer
             than one character) when EOF occurs. So we need to be careful when
             attempting to extract the character, i.e., use 'at:IfAbsent:'."
            (readCount: 1 IfFail: fb) at: 0 IfAbsent: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readOneChar = ( |
            | 
            readNextOne).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readOneCharIfFail: fb = ( |
            | 
            readNextOneIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         reset = ( |
            | 
            position: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> () From: ( | {
         'Category: mixins\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writingMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals positionableStream parent writingMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         write: buf = ( |
            | writeFrom: buf Count: buf size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         write: buf IfFail: fb = ( |
            | writeFrom: buf Count: buf size  IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writeBigEndianInteger: i ByteCount: bc Signed: isSigned IfFail: fb = ( |
             bytes.
            | 
            bytes: byteVector copySize: bc.
            bytes bigEndianIntSize: bc * 8 Signed: isSigned At: 0 Put: i IfFail: [|:e| ^ fb value: e].
            write: bytes IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writeFrom: buf Count: count = ( |
            | writeFrom: buf Count: count Start: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writeFrom: buf Count: count IfFail: fb = ( |
            | 
            writeFrom: buf Count: count Start: 0 IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writeFrom: buf Count: count Start: start = ( |
            | 
            writeFrom: buf Count: count Start: start
              IfFail: [ | :e | error: e Op: 'write' FileName: name ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writeLittleEndianInteger: i ByteCount: bc Signed: isSigned IfFail: fb = ( |
             bytes.
            | 
            bytes: byteVector copySize: bc.
            bytes littleEndianIntSize: bc * 8 Signed: isSigned At: 0 Put: i IfFail: [|:e| ^ fb value: e].
            write: bytes IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         position <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'positionableStream' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         readLimit <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: streams\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readStream = bootstrap define: bootstrap stub -> 'globals' -> 'readStream' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals positionableStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'readStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals readStream.

CopyDowns:
globals positionableStream. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals readStream parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         atEnd = ( |
            | 
            position >= readLimit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         bufferPrototype = ( |
            | 
            collection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         peek: n = ( |
             buf.
             numberRead.
            | 
            buf: bufferPrototype copySize: n.
            numberRead: withoutChangingPositionReadInto: buf Min: 0 Max: n At: 0 IfFail: [|:e| ^ fb value: e].
            numberRead = n ifFalse: [buf: buf copySize: numberRead].
            buf).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         peekAtNextByte = ( |
            | 
            (peek: 1) byteAt: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         readInto: buf Min: min Max: max At: start IfFail: fb = ( |
             numberRead.
            | 
            numberRead: withoutChangingPositionReadInto: buf Min: min Max: max At: start IfFail: [|:e| ^ fb value: e].
            position: position + numberRead.
            numberRead).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         readingMixin* = bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'readingMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'readStream' -> 'parent' -> () From: ( | {
         'Category: reading\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         withoutChangingPositionReadInto: buf Min: min Max: max At: start IfFail: fb = ( |
             numberRead.
            | 
            0 >= max ifTrue: ['max is less than 0\n' print. ^ 0]. "else would erroneously set atEOF"
            numberRead: max min: readLimit - position.
            buf copyRangeDstPos: start SrcArray: collection SrcPos: position Len: numberRead IfFail: [|:e| ^ fb value: e].
            numberRead).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: streams\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writeStream = bootstrap define: bootstrap stub -> 'globals' -> 'writeStream' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals positionableStream copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'writeStream' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals writeStream.

CopyDowns:
globals positionableStream. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'writeStream' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'writeStream' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals writeStream parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'writeStream' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         contents = ( |
            | 
            collection copyFrom: 0 UpTo: position).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'writeStream' -> 'parent' -> () From: ( | {
         'Category: growing the underlying collection\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         growCollectionIfTooSmallToHold: desiredSize = ( |
            | 
            desiredSize >= collection size ifTrue: [
              collection: collection copySize: desiredSize double.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'writeStream' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'writeStream' -> 'parent' -> () From: ( | {
         'Category: writing\x7fModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: public'
        
         writeFrom: buf Count: count Start: start IfFail: fb = ( |
            | 
            growCollectionIfTooSmallToHold: position + count.
            collection copyRangeDstPos: position SrcArray: buf SrcPos: start Len: count IfFail: [|:e| ^ fb value: e].
            position: position + count.
            count).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'writeStream' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: streams InitialContents: FollowSlot\x7fVisibility: private'
        
         writingMixin* = bootstrap stub -> 'globals' -> 'positionableStream' -> 'parent' -> 'writingMixin' -> ().
        } | ) 



 '-- Side effects'

 globals modules streams postFileIn
