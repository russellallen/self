 'Sun-$Revision: 30.20 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot'
        
         vector = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'vector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'vector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules vector.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.20 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         byteVector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits byteVector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: bit-wise operations\x7fComment: bitwise \"and\" on another byteVector of the same size\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         && x = ( |
            | 
            bitwiseOperationWith: x Do: [|:b1. :b2| b1 && b2]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         , arg = ( |
            | 
            " NB: copy proto, not receiver -- otherwise, would create a
             string if rcvr is a string (but then the result should be old and
             canonicalized, and that's undesirable)"
            _ByteVectorConcatenate: arg
            Prototype: prototypeForCopying
            IfFail: [|:error|
                     'outOfMemoryError' == error ifTrue: [
                         memory allocationFailedBytes: size + arg size.
                         ^_ByteVectorConcatenate: arg
                          Prototype: prototypeForCopying
                     ].
                     resend., arg ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         < s = ( |
            | -1  = (byteVectorCompare: s IfFail: [^ resend.<  s])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         = s = ( |
            | 0   = (byteVectorCompare: s IfFail: [^ resend.=  s])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: bit-wise operations\x7fComment: bitwise \"xor\" on another byteVector of the same size\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         ^^ x = ( |
            | 
            bitwiseOperationWith: x Do: [|:b1. :b2| b1 ^^ b2]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         asByteVector = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         asVMByteVector = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         at: index IfAbsent: block = ( |
            | 
            byteAt: index IfAbsent: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         at: index Put: value IfAbsent: block = ( |
            | 
            at: index PutByte: value IfAbsent: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: primitive wrappers shared by strings\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         at: index PutByte: value = ( |
            | 
            at: index PutByte: value
                     IfAbsent: [error: index printString, ' is absent']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: primitive wrappers shared by strings\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         at: index PutByte: value IfAbsent: block = ( |
            | 
            asVMByteVector _ByteAt: index Put: value IfFail: [ | :error. :name. |
                ('badTypeError' == error) &&
                [(index asSmallInteger !== index) ||
                 [value asSmallInteger !== value]] ifTrue: [
                    ^ asVMByteVector at: index asSmallInteger
                                PutByte: value asSmallInteger
                               IfAbsent: block
                ].
                if: error IsIndex: block Index: index ElseFailPrim: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         bigEndianIntSize: bitSize Signed: bool At: index = ( |
            | 
            [endianDependentServer].
            bigEndianIntSize: bitSize Signed: bool At: index 
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         bigEndianIntSize: bitSize Signed: bool At: index IfFail: errBlk = ( |
            | 
            [endianDependentServer].
            bool ifTrue: [   _BigEndianSignedIntSize: bitSize At: index IfFail: errBlk ]
                  False: [ _BigEndianUnsignedIntSize: bitSize At: index IfFail: errBlk ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         bigEndianIntSize: bitSize Signed: bool At: index Put: anInt = ( |
            | 
            [endianDependentServer].
            bigEndianIntSize: bitSize Signed: bool At: index Put: anInt
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         bigEndianIntSize: bitSize Signed: bool At: index Put: anInt IfFail: errBlk = ( |
            | 
            [endianDependentServer].
            bool ifTrue: [
                 _BigEndianSignedIntSize: bitSize At: index Put: anInt IfFail: errBlk.
            ] False: [
               _BigEndianUnsignedIntSize: bitSize At: index Put: anInt IfFail: errBlk.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         bitwiseOperationWith: x Do: blk = ( |
             r.
            | 
            [size = x size] assert.
            r: copySize: size.
            bytesDo: [|:b1. :i. b2|
              b2: x byteAt: i.
              r at: i Put: blk value: b1 With: b2 With: i.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: primitive wrappers shared by strings\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         byteAt: index = ( |
            | 
            byteAt: index IfAbsent: [error: index printString, ' is absent']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: primitive wrappers shared by strings\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         byteAt: index IfAbsent: block = ( |
            | 
            asVMByteVector _ByteAt: index IfFail: [ | :error. :name. |
                ('badTypeError' == error) &&
                [index asSmallInteger !== index] ifTrue: [
                    ^ asVMByteVector byteAt: index asSmallInteger IfAbsent: block
                ].
                if: error IsIndex: block Index: index ElseFailPrim: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         byteVectorCompare: s IfFail: fb = ( |
            | _ByteVectorCompare: s IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cFloatDouble: bool At: index = ( |
            | 
            cFloatDouble: bool At: index 
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cFloatDouble: bool At: index IfFail: errBlk = ( |
            | 
            _CFloatDouble: bool At: index IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cFloatDouble: bool At: index Put: aFloat = ( |
            | 
            cFloatDouble: bool At: index Put: aFloat 
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cFloatDouble: bool At: index Put: aFloat IfFail: errBlk = ( |
            | 
            _CFloatDouble: bool At: index Put: aFloat IfFail: errBlk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cIntSize: bitSize Signed: bool At: index = ( |
            | 
            cIntSize: bitSize Signed: bool At: index 
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cIntSize: bitSize Signed: bool At: index IfFail: errBlk = ( |
            | 
            bool ifTrue: [   _CSignedIntSize: bitSize At: index IfFail: errBlk ]
                  False: [ _CUnsignedIntSize: bitSize At: index IfFail: errBlk ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cIntSize: bitSize Signed: bool At: index Put: anInt = ( |
            | 
            cIntSize: bitSize Signed: bool At: index Put: anInt
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         cIntSize: bitSize Signed: bool At: index Put: anInt IfFail: errBlk = ( |
            | 
            bool ifTrue: [
                 _CSignedIntSize: bitSize At: index Put: anInt IfFail: errBlk.
            ] False: [
               _CUnsignedIntSize: bitSize At: index Put: anInt IfFail: errBlk.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Comment: Override clone so that cloning a large byte-vector does the right thing
if space overflows. -- dmu 5/04\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         clone = ( |
            | cloneBytesPrim: _ByteSize Filler: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         cloneBytesPrim: n Filler: filler = ( |
            | 
            _CloneBytes: n asSmallInteger Filler: filler IfFail: [|:error|
              ('outOfMemoryError' isPrefixOf: error) ifFalse: [
                error: error
              ] True: [
                memory allocationFailedBytes: n.
                ^_CloneBytes: n Filler: filler IfFail: raiseError.
              ] 
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         cloneSize: n FillingWith: filler = ( |
            | 
            asVMByteVector cloneBytesPrim: n Filler: filler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'byteVector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: s IfLess: lb Equal: eb Greater: gb = ( | {
                 'ModuleInfo: Module: vector InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            (
                byteVectorCompare: s IfFail: [
                    ^ resend.compare: s IfLess: lb Equal: eb Greater: gb
                ]
            ) compare: 0 IfLess: lb Equal: eb Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: range copy primitives\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len = ( |
            | copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: range copy primitives\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len IfFail: errBlk = ( |
            | 
             _CopyByteRangeDstPos: dstPos Src: srcArray SrcPos: srcPos Length: len IfFail: [ | :error. :name |
                ('badTypeError' == error) &&
                  [(dstPos asSmallInteger !== dstPos) ||
                  [(srcPos asSmallInteger !== srcPos) || 
                  [ len    asSmallInteger !== len    ]]]  ifTrue: [
                   ^ _CopyByteRangeDstPos: dstPos   asSmallInteger
                                      Src: srcArray 
                                   SrcPos: srcPos   asSmallInteger
                                   Length: len      asSmallInteger
                                   IfFail: errBlk ] False: [
                   ^ errBlk value: error With: name
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | copySize: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: n FillingWith: x = ( |
            | cloneSize: n FillingWith: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: copy-down support \x7fComment: Needed for int32.\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize_4 = ( |
            | copySize: 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: copy-down support \x7fComment: Needed for int64.\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize_8 = ( |
            | copySize: 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: primitive wrappers shared by strings\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         errorMessage = ( |
            | _ErrorMessage).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         fillFrom: c = ( |
            | with: c Do: [|:v1. :v2. :k1. :k2| at: k1 Put: v2 asByte]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         filler = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         hexPrintString = ( |
             r <- ''.
             s.
            | 
            bytesDo: [|:b|
              s: b hexPrintString.
              s: ('00' copySize: 2 - s size), s.
              r: r, s.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fCategory: Non-overflow\x7fComment: Won\'t overflow, may return bigInt\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         littleEndian32bitUnsignedAt: index IfFail: errBlk = ( |
            | 
             (littleEndianIntSize: 16 Signed: false At: 0 IfFail: errBlk)
            +
            (
             (littleEndianIntSize: 16 Signed: false At: 2 IfFail: errBlk)
             *
             (2 power: 16)
            )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         littleEndianIntSize: bitSize Signed: bool At: index = ( |
            | 
            littleEndianIntSize: bitSize Signed: bool At: index 
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Retrieving\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         littleEndianIntSize: bitSize Signed: bool At: index IfFail: errBlk = ( |
            | 
            bool ifTrue: [   _LittleEndianSignedIntSize: bitSize At: index IfFail: errBlk ]
                  False: [ _LittleEndianUnsignedIntSize: bitSize At: index IfFail: errBlk ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         littleEndianIntSize: bitSize Signed: bool At: index Put: anInt = ( |
            | 
            littleEndianIntSize: bitSize Signed: bool At: index Put: anInt
             IfFail: [| :err. :name | primitiveFailedError: err Name: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: C types\x7fCategory: Storing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         littleEndianIntSize: bitSize Signed: bool At: index Put: anInt IfFail: errBlk = ( |
            | 
            bool ifTrue: [
                 _LittleEndianSignedIntSize: bitSize At: index Put: anInt IfFail: errBlk.
            ] False: [
               _LittleEndianUnsignedIntSize: bitSize At: index Put: anInt IfFail: errBlk.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mutableIndexable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | byteVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeForCopying = ( |
            | 
            "allows immutable children (strings) to substitute
             mutableString"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: primitive wrappers shared by strings\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | asVMByteVector _ByteSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: vector InitialContents: FollowSlot'
        
         storeStringIfFail: fb = ( |
             s.
            | 
            s: '\''.
            bytesDo: [|:b| s: s, '\\x', ('00' copySize: 2 - b hexPrintString size), b hexPrintString].
            s, '\' asByteVector').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: unit tests\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         unitTests = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits byteVector unitTests.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits byteVector unitTests parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: b = ( |
            | 
            b value ifFalse: [error: 'assertion failure in byteVector unitTests']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: x Equals: y = ( |
            | 
            "This method is useful only because it lets you get at the arguments
             very easily in the debugger. -- ads, 2/04"
            assert: x = y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
            | 
            testBitwiseOperations.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> 'unitTests' -> 'parent' -> () From: ( | {
         'Category: bitwise operations\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         testBitwiseOperations = ( |
            | 
            assert: byteVector ^^ byteVector
            Equals: byteVector.

            assert: (1 & 3 & 5 & 7 & 9) asByteVector ^^ (3 & 5 & 7 & 9 & 11) asByteVector
            Equals: (2 & 6 & 2 & 14 & 2) asByteVector.

            assert: (1 & 3 & 5 & 7 & 9) asByteVector || (3 & 5 & 7 & 9 & 11) asByteVector
            Equals: (3 & 7 & 7 & 15 & 11) asByteVector.

            assert: (1 & 3 & 5 & 7 & 9) asByteVector && (3 & 5 & 7 & 9 & 11) asByteVector
            Equals: (1 & 1 & 5 & 1 & 9) asByteVector.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: bit-wise operations\x7fComment: bitwise \"or\" on another byteVector of the same size\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         || x = ( |
            | 
            bitwiseOperationWith: x Do: [|:b1. :b2| b1 || b2]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: collections\x7fCategory: vectors\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         vector = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'vector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits vector.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         asVector = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         at: index IfAbsent: block = ( |
            | 
            asVector _At: index IfFail: [ | :error. :name. |
                ('badTypeError' == error) &&
                [index asSmallInteger !== index] ifTrue: [
                    ^ asVector at: index asSmallInteger IfAbsent: block
                ].
                if: error IsIndex: block Index: index ElseFailPrim: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         at: index Put: value IfAbsent: block = ( |
            | 
            asVector _At: index Put: value IfFail: [ | :error. :name. |
                ('badTypeError' == error) &&
                [index asSmallInteger !== index] ifTrue: [
                    ^ asVector at: index asSmallInteger Put: value IfAbsent: block
                ].
                if: error IsIndex: block Index: index ElseFailPrim: name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'Comment: Override clone to give memory the right numbers when space overflows.
-- dmu 5/04\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         clone = ( |
            | clonePrim: _Size Filler: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         clonePrim: n Filler: filler = ( |
            | 
            _Clone: n Filler: filler IfFail: [|:error|
              'outOfMemoryError' == error ifTrue: [
                memory allocationFailed: n.
                ^_Clone: n Filler: filler
              ] False: [
                error: error
              ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         cloneSize: n = ( |
            | asVector clonePrim: n Filler: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         cloneSize: n FillingWith: filler = ( |
            | asVector clonePrim: n Filler: filler).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         collectionName = 'vector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAddLast: x = ( |
            | (copySize: size succ) at: size Put: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'Category: range copy primitives\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len = ( |
            | copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'Category: range copy primitives\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         copyRangeDstPos: dstPos SrcArray: srcArray SrcPos: srcPos Len: len IfFail: errBlk = ( |
            | 
             _CopyRangeDstPos: dstPos Src: srcArray SrcPos: srcPos Length: len IfFail: [ | :error. :name |
                ('badTypeError' == error) &&
                  [(dstPos asSmallInteger !== dstPos) ||
                  [(srcPos asSmallInteger !== srcPos) || 
                  [ len    asSmallInteger !== len    ]]]  ifTrue: [
                   ^ _CopyRangeDstPos: dstPos   asSmallInteger
                                  Src: srcArray 
                               SrcPos: srcPos   asSmallInteger
                               Length: len      asSmallInteger
                               IfFail: errBlk ] False: [
                   ^ errBlk value: error With: name
                ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | copySize: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         copySize: n FillingWith: x = ( |
            | cloneSize: n FillingWith: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'Comment: For literal vectors, this returns a mirror on the method that the
literal vector is a part of; for other vectors this fails.\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         methodPointer = ( |
            | methodPointerIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'Comment: For literal vectors, this returns a mirror on the method that the
literal vector is a part of; for other vectors this fails.\x7fModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         methodPointerIfFail: b = ( |
            | _MethodPointerIfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mutableIndexable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: private'
        
         prototype = ( |
            | vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         randomlyDo: blk = ( |
            | 
            (random permutation: size) do: [|:i| blk value: (at: i) With: i]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'vector' -> () From: ( | {
         'ModuleInfo: Module: vector InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | asVector _Size).
        } | ) 



 '-- Side effects'

 globals modules vector postFileIn
