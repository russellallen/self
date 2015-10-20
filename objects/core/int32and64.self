 '$Revision: 30.40 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: 32 bit integer. Operations are
modulo 2^32.\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int32 = bootstrap define: bootstrap stub -> 'globals' -> 'int32' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals byteVector copySize_4 ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'int32' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals int32.

CopyDowns:
globals byteVector. copySize_4 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'int32' -> () _ByteAt: 0 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int32' -> () _ByteAt: 1 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int32' -> () _ByteAt: 2 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int32' -> () _ByteAt: 3 Put: (
     0)

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int32 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'int32' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits int32.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'int32' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'int32' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'int32' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | int32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: 64 bit integer. Operations are
modulo 2^64.\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int64 = bootstrap define: bootstrap stub -> 'globals' -> 'int64' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals byteVector copySize_8 ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'int64' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals int64.

CopyDowns:
globals byteVector. copySize_8 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 0 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 1 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 2 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 3 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 4 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 5 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 6 Put: (
     0)

 bootstrap stub -> 'globals' -> 'int64' -> () _ByteAt: 7 Put: (
     0)

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int64 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'int64' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits int64.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'int64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'int64' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'int64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | 
            int64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot'
        
         int32and64 = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules int32and64.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.40 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'int32and64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asBigEndianInt32Vector = ( |
             result.
            | 
            [endianDependentServer].
            result: vector copyRemoveAll.
            (size % 4) = 0 ifFalse: [ ^ error: 'cannot represent vector of size:', size asString,' as an integer'].
            (size / 4) do: [ |:i. a. b. c. d|
              a: int32 shl: ( at: (i * 4) + 0 ) asByte  With: 24.
              b: int32 shl: ( at: (i * 4) + 1 ) asByte  With: 16.
              c: int32 shl: ( at: (i * 4) + 2 ) asByte  With:  8.
              d:            ( at: (i * 4) + 3 ) asByte.
              result: result copyAddLast: int32 or: a With: int32 or: b With: int32 or: c With: d
            ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'byteVector' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromBigEndianInt32: intVector IfFail: fb = ( |
             result.
            | 
            [endianDependentServer].
            result: copyRemoveAll copySize: intVector size * 4.
            intVector size do: [ |:i|
              (intVector at: i) storeAsBigEndianByteVectorInto: result At: (i * 4) IfFail: fb
            ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt32 = ( |
            | int32 fromFloat: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'float' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt64 = ( |
            | int64 fromFloat: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32  Add: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32  Add: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         and: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 And: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         and: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 And: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asBigEndianByteVectorFrom: intOrInt32 = ( |
             r.
            | 
            [endianDependentServer].
            r: byteVector copySize: 4.
            intOrInt32 storeAsBigEndianByteVectorInto: r At: 0 IfFail: raiseError.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloat = ( |
            | 
            _FloatFromInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt16 = ( |
            | 
            _Int16FromInt32: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt32 = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt64 = ( |
            | 
            int64 fromInt32: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt8 = ( |
            | 
            _Int8FromInt32: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asLittleEndianByteVectorFrom: intOrInt32 = ( |
             r.
            | 
            r: byteVector copySize: 4.
            intOrInt32 storeAsLittleEndianByteVectorInto: r At: 0 IfFail: raiseError.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         bigEndianBytesFrom: i Do: blk = ( |
            | 
            [endianDependentServer].
            blk value: (                ushr: i With: 24 ) With: 0.
            blk value: ( and: 255 With: ushr: i With: 16 ) With: 1.
            blk value: ( and: 255 With: ushr: i With:  8 ) With: 2.
            blk value: ( and: 255 With:       i          ) With: 3.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         cmp: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 Cmp: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         cmp: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 Cmp: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         div: i1 And: i2 IfFail: eb = ( |
            | 
            _Int32: i1 asInt32 Div: i2 asInt32 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         div: i1 With: i2 IfFail: eb = ( |
            | 
            _Int32: i1 asInt32 Div: i2 asInt32 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         fromFloat: f = ( |
            | 
            _Int32FromFloat: f asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: store string\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         fromHigh16Bits: high16Bits Low16Bits: low16Bits = ( |
            | 
            or:  (shl: high16Bits With: 16)
            With: low16Bits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         fromInt64: i = ( |
            | _Int32FromInt64: i asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_iadd: i = ( |
            | 
            add: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: boolean operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_iand: i = ( |
            | 
            and: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_idiv: i = ( |
            | 
            java_inst_helper_div: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_if_icmpeq: i = ( |
            | 
            0 = (cmp: self With: i)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_if_icmpge: i = ( |
            | 
            1 = (cmp: self With: i)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_if_icmpgt: i = ( |
            | 
            -1 != (cmp: self With: i)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_if_icmple: i = ( |
            | 
            1 != (cmp: self With: i)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_if_icmplt: i = ( |
            | 
            -1 = (cmp: self With: i)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: comparisons\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_if_icmpne: i = ( |
            | 
            0 != (cmp: self With: i)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_imul: i = ( |
            | 
            mul: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: boolean operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ior: i = ( |
            | 
            or: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_irem: i = ( |
            | 
            java_inst_helper_rem: self And: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: shifts\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ishl: i = ( |
            | 
            shl: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: shifts\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ishr: i = ( |
            | 
            shr: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_isub: i = ( |
            | 
            sub: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: shifts\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_iushr: i = ( |
            | 
            ushr: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: Java runtime\x7fCategory: boolean operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         java_inst_ixor: i = ( |
            | 
            xor: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         littleEndianBytesFrom: i Do: blk = ( |
            | 
            [endianDependentServer].
            blk value: ( and: 255 With:       i          ) With: 0.
            blk value: ( and: 255 With: ushr: i With:  8 ) With: 1.
            blk value: ( and: 255 With: ushr: i With: 16 ) With: 2.
            blk value: (                ushr: i With: 24 ) With: 3.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         mul: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 Mul: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         mul: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 Mul: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         or: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 Or: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         or: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 Or: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: Common parent for int32 and int64\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int32or64 = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( |
             {} = 'Comment: This code was originially written
by Ole Agesen, and follows a different model.
Rather than implement the standard protocol, but having
asInt32 (64) force into this representation,
it goes for speed by using smallInts whenever the value fits,
at the price of using a non-standard protocol such as add:And:
instead of +.
-- dmu 6/1\x7fModuleInfo: Creator: traits int32or64.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'int32or64' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rem: i1 And: i2 IfFail: eb = ( |
            | 
            _Int32: i1 asInt32 Rem: i2 asInt32 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rem: i1 With: i2 IfFail: eb = ( |
            | 
            _Int32: i1 asInt32 Rem: i2 asInt32 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shl: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 Shl: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shl: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 Shl: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shr: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 Shr: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shr: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 Shr: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         sizeInBytes = ( |
            | os bytesPerInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeAsBigEndianByteVectorInto: aByteVector At: index IfFail: fb = ( |
            | 
            [endianDependentServer].
            aByteVector at: index + 0 Put: (ushr: self With: 24)                IfAbsent: [|:e| ^ fb value: e].
            aByteVector at: index + 1 Put: (and: 255 With: ushr: self With: 16) IfAbsent: [|:e| ^ fb value: e].
            aByteVector at: index + 2 Put: (and: 255 With: ushr: self With: 8)  IfAbsent: [|:e| ^ fb value: e].
            aByteVector at: index + 3 Put: (and: 255 With: self)                IfAbsent: [|:e| ^ fb value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeAsLittleEndianByteVectorInto: aByteVector At: index IfFail: fb = ( |
            | 
            [endianDependentServer].
            aByteVector at: index + 3 Put: (ushr: self With: 24)                IfAbsent: [|:e| ^ fb value: e].
            aByteVector at: index + 2 Put: (and: 255 With: ushr: self With: 16) IfAbsent: [|:e| ^ fb value: e].
            aByteVector at: index + 1 Put: (and: 255 With: ushr: self With:  8) IfAbsent: [|:e| ^ fb value: e].
            aByteVector at: index + 0 Put: (and: 255 With: self)                IfAbsent: [|:e| ^ fb value: e].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: store string\x7fComment: faster than parent\'s\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringFor: a IfFail: fb = ( |
             high16Bits.
             low16Bits.
            | 
            high16Bits: '16r', (ushr: a With: 16) hexPrintString.
            low16Bits:  '16r', (and:  a With: 16rffff) hexPrintString.
            'int32 fromHigh16Bits: ', high16Bits, ' Low16Bits: ', low16Bits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         sub: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 Sub: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         sub: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 Sub: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         ushr: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32 Ushr: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         ushr: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32 Ushr: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         xor: i1 And: i2 = ( |
            | 
            _Int32: i1 asInt32  Xor: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'Category: 32 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         xor: i1 With: i2 = ( |
            | 
            _Int32: i1 asInt32  Xor: i2 asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         zero = ( |
            | int32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         != x = ( |
            | ne: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         && x = ( |
            | and: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         + x = ( |
            | add: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         +> a = ( |
            | 
            shr: self With: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         - x = ( |
            | sub: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         < x = ( |
            | lt: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         <+ a = ( |
            | << a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         << a = ( |
            | shl: self With: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         <= x = ( |
            | le: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | eq: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         > x = ( |
            | gt: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         >= x = ( |
            | ge: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         >> x = ( |
            | 
            ushr: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         ^^ x = ( |
            | xor: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         addBigInteger: i = ( |
            | 
            i + asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         addSmallInteger: i = ( |
            | self add: self With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: coercions\x7fComment: Convert to Self smallInt or bigInt. Respects sign.\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInteger = ( |
            | 
            (ushr: self With: bitSize pred) asBoolean ifTrue: [
              ^ negate asUnsignedInteger negate
            ].
            asUnsignedInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallInteger = ( |
            | asInteger asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfFail: fb = ( |
            | 
            asInteger asSmallIntegerIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfPossible = ( |
            | 
            add: 0 With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asUnsignedInteger = ( |
             r <- 0.
            | 
            size pred to: 0 By: -1 Do: [|:i|
              r: (256 * r) +  and: (ushr: self With: i * 8) With: 255.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         bitAt: n In: x = ( |
            | 
            and: (maskForBitAt: n) With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         bitSize = ( |
            | size * 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         booleanVectorFor: x = ( |
            | 
            (vector copySize: bitSize) mapBy: [|:unused. :n|
              (bitAt: n In: x) != 0
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         compareBigInteger: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            asInteger compareBigInteger: x IfLess: lb Equal: eb Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fComment: bitwise complement\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         complement = ( |
            | 
            xor: self With: -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in big-endian (MSB first) order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeBigEndianBytesFrom: bytes = ( |
            | 
            [endianDependentServer].
            copyTakeBigEndianBytesFrom: bytes Index: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in big-endian (MSB first) order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeBigEndianBytesFrom: bytes Index: i = ( |
            | 
            [endianDependentServer].
            copyTakeBigEndianBytesFrom: bytes Index: i IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in big-endian (MSB first) order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeBigEndianBytesFrom: bytes Index: i IfFail: errBlk = ( |
            | 
            [endianDependentServer].
            isThisPlatformBigEndian ifTrue: [
              copyTakeBytesFrom: bytes Index: i IfFail: errBlk
            ]
            False: [
              copyTakeReversedBytesFrom: bytes Index: i IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in native C order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeBytesFrom: bytes = ( |
            | 
            copyTakeBytesFrom: bytes Index: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in native C order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeBytesFrom: bv Index: idx = ( |
            | 
            copyTakeBytesFrom: bv Index: idx IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in native C order\x7fComment: Copy and initialize the bytes from
bv starting at index idx.\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeBytesFrom: bv Index: idx IfFail: errBlk = ( |
            | 
            copy copyRangeDstPos: 0
                        SrcArray: bv
                          SrcPos: idx
                             Len: size
                          IfFail: [|:e| ^ errBlk value: e printString, ' is absent']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in littne-endian (LSB first) order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeLittleEndianBytesFrom: bytes = ( |
            | 
            copyTakeLittleEndianBytesFrom: bytes Index: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in littne-endian (LSB first) order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeLittleEndianBytesFrom: bytes Index: i = ( |
            | 
            copyTakeLittleEndianBytesFrom: bytes Index: i IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in littne-endian (LSB first) order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeLittleEndianBytesFrom: bytes Index: i IfFail: errBlk = ( |
            | 
            isThisPlatformLittleEndian ifTrue: [
              copyTakeBytesFrom: bytes Index: i IfFail: errBlk
            ]
            False: [
              copyTakeReversedBytesFrom: bytes Index: i IfFail: errBlk
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in reverse order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeReversedBytesFrom: bytes = ( |
            | 
            copyTakeReversedBytesFrom: bytes Index: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in reverse order\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeReversedBytesFrom: bytes Index: i = ( |
            | 
            copyTakeReversedBytesFrom: bytes Index: i IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: creating from bytes\x7fCategory: in reverse order\x7fComment: Copy and initialize the bytes from
bv starting at index idx.\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTakeReversedBytesFrom: bv Index: idx IfFail: errBlk = ( |
             r.
            | 
            r: copy.
            size do: [|:i|  r at: i Put:
                               (bv at: idx + (size pred - i)) asByte
                               IfAbsent: [^ errBlk value: e printString, ' is absent']].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         eq: a With: b = ( |
            | 
            0 = (cmp: a With: b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsBigInteger: x = ( |
            | asInteger = x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsSmallInteger: i = ( |
            | 
            eq: i With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         floatFromInt32: i = ( |
            | _FloatFromInt32: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         floatFromInt64: i = ( |
            | _FloatFromInt64: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         ge: a With: b = ( |
            | 
            -1 != (cmp: a With: b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         gt: a With: b = ( |
            | 
            1 = (cmp: a With: b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         hexPrintString = ( |
             r <- ''.
             s.
            | 
            [aaa]. "Why is this method not just calling bytesDo:? -- Adam, Mar. 2009"
            size pred downTo: 0 Do: [|:i|
              s: (and: 255 With: (ushr: self With: i * typeSizes bitsPerByte)) hexPrintString.
              s: ('00' copySize: 2 - s size), s.
              r: r, s.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         high16Bits = ( |
            | 
            (shr: self With: 16) low16Bits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int16FromInt32: i = ( |
            | _Int16FromInt32: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int16FromInt64: i = ( |
            | _Int16FromInt64: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int8FromInt32: i = ( |
            | _Int8FromInt32: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         int8FromInt64: i = ( |
            | _Int8FromInt64: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         isThisPlatformBigEndian = ( |
             bv.
            | 
            "Optimization: Used to say (0 & 0 & 0 & 1) asByteVector, but that
             was 4-5 times slower. -- Adam, 8/06"
            bv: byteVector copySize: 4 FillingWith: 0.
            bv at: 3 Put: 1.
            (bv cIntSize: 32 Signed: true At: 0) = 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         isThisPlatformLittleEndian = ( |
            | 
            [endianDependentServer].
             isThisPlatformBigEndian not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         le: a With: b = ( |
            | 
            1 != (cmp: a With: b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         low16Bits = ( |
            | and: self With: 16rffff).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         lt: a With: b = ( |
            | 
            -1 = (cmp: a With: b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         maskForBitAt: n = ( |
            | 
            shl: 1 With: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         max: n = ( |
            | 
            < n ifTrue: n False: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         min: n = ( |
            | > n ifTrue: n False: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         ne: a With: b = ( |
            | 
            0 != (cmp: a With: b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         negate = ( |
            | 
            sub: 0 With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfOnesIn: x = ( |
            | 
            x = 0 ifTrue: [^ 0].
            x < 0 ifTrue: [bitSize - (numberOfOnesIn: x complement)].
            (and: x With: 16rffff) numberOfOnes  + (numberOfOnesIn: ushr: x With: 16)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         pred = ( |
            | sub: self With: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | 
            printStringBase: 16).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringBase: b = ( |
            | 
            b = 16 ifTrue: [^ hexPrintString]. "optimization"
            asInteger printStringBase: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseGreaterThanOrEqualSmallInteger: i = ( |
            | 
            ge: i With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseGreaterThanSmallInteger: i = ( |
            | 
            gt: i With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseLessThanOrEqualSmallInteger: i = ( |
            | 
            le: i With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseLessThanSmallInteger: i = ( |
            | 
            lt: i With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rotate: i LeftBy: numberOfBits = ( |
             leftBits.
             mask.
             n.
             rightBits.
            | 
            n: numberOfBits % bitSize.
            n < 0 ifTrue: [n: n + bitSize].
            mask: (1 << (bitSize - n)) pred.
            rightBits:  and: i With: mask.
             leftBits: ushr: i With: bitSize - n.
            or: leftBits With: shl: rightBits With: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rotate: i RightBy: numberOfBits = ( |
            | 
            rotate: i LeftBy: numberOfBits negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rotateLeftBy: numberOfBits = ( |
            | 
            rotate: self LeftBy: numberOfBits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rotateRightBy: numberOfBits = ( |
            | 
            rotate: self RightBy: numberOfBits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shortIfPossibleHexPrintString = ( |
            | 
            "if short were possible, I would be a smallInt"
            shortIfPossibleHexPrintStringPrefix: '16r').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shortIfPossibleHexPrintStringPrefix: pre = ( |
            | 
            pre, hexPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | printStringBase: 16).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringFor: a = ( |
            | storeStringFor: a IfFail: [|:e| error: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringFor: a IfFail: fb = ( |
            | 
            "Leverage of the bigInt storeStrings."
            (a asInteger storeStringIfFail: [|:e| ^ fb value: e]), ' asInt', 
            (typeSizes bitsPerByte * size) printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            storeStringFor: self IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractBigInteger: i = ( |
            | 
            i - asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractSmallInteger: i = ( |
            | 
            self add: negate With: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         succ = ( |
            | add: self With: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int32or64' -> () From: ( | {
         'Category: bit-wise operations\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         || x = ( |
            | 
            or: self With: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: i1 And: i2 = ( |
            | _Int64: i1 asInt64  Add: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         add: i1 With: i2 = ( |
            | _Int64: i1 asInt64  Add: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         and: i1 And: i2 = ( |
            | 
            _Int64: i1 asInt64 And: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         and: i1 With: i2 = ( |
            | 
            _Int64: i1 asInt64 And: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asBigEndianByteVectorFrom: intOrInt64 = ( |
             i.
             r.
            | 
            [endianDependentServer].
            i: intOrInt64.
            r: byteVector copySize: 8.
            r at: 0 Put: ushr:  i With: 56.
            r at: 1 Put: and: 255 With: ushr: i With: 48.
            r at: 2 Put: and: 255 With: ushr: i With: 40.
            r at: 3 Put: and: 255 With: ushr: i With: 32.
            r at: 4 Put: and: 255 With: ushr: i With: 24.
            r at: 5 Put: and: 255 With: ushr: i With: 16.
            r at: 6 Put: and: 255 With: ushr: i With: 8.
            r at: 7 Put: and: 255 With: i.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloat = ( |
            | 
            _FloatFromInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt16 = ( |
            | _Int16FromInt64: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt32 = ( |
            | int32 fromInt64: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt64 = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt8 = ( |
            | 
            _Int8FromInt64: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asLittleEndianByteVectorFrom: intOrInt64 = ( |
             i.
             r.
            | 
            [endianDependentServer].
            i: intOrInt64.
            r: byteVector copySize: 8.
            r at: 7 Put: ushr: i With: 56.
            r at: 6 Put: and: 255 With: ushr: i With: 48.
            r at: 5 Put: and: 255 With: ushr: i With: 40.
            r at: 4 Put: and: 255 With: ushr: i With: 32.
            r at: 3 Put: and: 255 With: ushr: i With: 24.
            r at: 2 Put: and: 255 With: ushr: i With: 16.
            r at: 1 Put: and: 255 With: ushr: i With: 8.
            r at: 0 Put: and: 255 With: i.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         bigEndianBytesFrom: i Do: blk = ( |
            | 
            [endianDependentServer].
            blk value: (                ushr: i With: 56 ) With: 0.
            blk value: ( and: 255 With: ushr: i With: 48 ) With: 1.
            blk value: ( and: 255 With: ushr: i With: 40 ) With: 2.
            blk value: ( and: 255 With: ushr: i With: 32 ) With: 3.
            blk value: ( and: 255 With: ushr: i With: 24 ) With: 4.
            blk value: ( and: 255 With: ushr: i With: 16 ) With: 5.
            blk value: ( and: 255 With: ushr: i With:  8 ) With: 6.
            blk value: ( and: 255 With:       i          ) With: 7.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         cmp: i1 And: i2 = ( |
            | _Int64: i1 asInt64 Cmp: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         cmp: i1 With: i2 = ( |
            | _Int64: i1 asInt64 Cmp: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         div: i1 And: i2 IfFail: eb = ( |
            | _Int64: i1 asInt64 Div: i2 asInt64 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         div: i1 With: i2 IfFail: eb = ( |
            | _Int64: i1 asInt64 Div: i2 asInt64 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: store string\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         from: p1 And: p2 And: p3 And: p4 = ( |
            | 
            or: (shl: p1 With: 48) With:
            or: (shl: p2 With: 32) With:
            or: (shl: p3 With: 16) With: p4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         fromFloat: f = ( |
            | _Int64FromFloat: f asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         fromInt32: i = ( |
            | _Int64FromInt32: i asInt32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         littleEndianBytesFrom: i Do: blk = ( |
            | 
            [endianDependentServer].
            blk value: ( and: 255 With:       i          ) With: 0.
            blk value: ( and: 255 With: ushr: i With:  8 ) With: 1.
            blk value: ( and: 255 With: ushr: i With: 16 ) With: 2.
            blk value: ( and: 255 With: ushr: i With: 24 ) With: 3.
            blk value: ( and: 255 With: ushr: i With: 32 ) With: 4.
            blk value: ( and: 255 With: ushr: i With: 40 ) With: 5.
            blk value: ( and: 255 With: ushr: i With: 48 ) With: 6.
            blk value: (                ushr: i With: 56 ) With: 7.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         mul: i1 And: i2 = ( |
            | _Int64: i1 asInt64 Mul: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         mul: i1 With: i2 = ( |
            | _Int64: i1 asInt64 Mul: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         or: i1 And: i2 = ( |
            | _Int64: i1 asInt64 Or: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         or: i1 With: i2 = ( |
            | _Int64: i1 asInt64 Or: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'int32or64' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rem: i1 And: i2 IfFail: eb = ( |
            | _Int64: i1 asInt64 Rem: i2 asInt64 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         rem: i1 With: i2 IfFail: eb = ( |
            | _Int64: i1 asInt64 Rem: i2 asInt64 IfFail: eb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shl: i1 And: i2 = ( |
            | _Int64: i1 asInt64 Shl: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shl: i1 With: i2 = ( |
            | _Int64: i1 asInt64 Shl: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shr: i1 And: i2 = ( |
            | _Int64: i1 asInt64 Shr: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         shr: i1 With: i2 = ( |
            | _Int64: i1 asInt64 Shr: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: store string\x7fComment: faster than parent\'s\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringFor: a IfFail: fb = ( |
             p1.
             p2.
             p3.
             p4.
            | 
            p1: '16r', (ushr: a With: 48) hexPrintString.
            p2: '16r', (and: 16rffff With: ushr: a With: 32) hexPrintString.
            p3: '16r', (and: 16rffff With: ushr: a With: 16) hexPrintString.
            p4: '16r', (and:  a With: 16rffff) hexPrintString.
            'int64 from: ', p1, ' With: ', p2, ' With: ', p3, ' With: ', p4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         sub: i1 And: i2 = ( |
            | _Int64: i1 asInt64 Sub: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         sub: i1 With: i2 = ( |
            | _Int64: i1 asInt64 Sub: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         ushr: i1 And: i2 = ( |
            | _Int64: i1 asInt64 Ushr: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         ushr: i1 With: i2 = ( |
            | _Int64: i1 asInt64 Ushr: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fCategory: deprecated\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         xor: i1 And: i2 = ( |
            | _Int64: i1 asInt64  Xor: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'Category: 64 bit primitives\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         xor: i1 With: i2 = ( |
            | _Int64: i1 asInt64  Xor: i2 asInt64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'int64' -> () From: ( | {
         'ModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         zero = ( |
            | int64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt16 = ( |
            | asInt32 asInt16).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt32 = ( |
            | 
            asIntNN: int32).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt64 = ( |
            | 
            asIntNN: int64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt8 = ( |
            | asInt32 asInt8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: private'
        
         asIntNN: intNN = ( |
             res.
             v <- 0.
            | 
            res: intNN copy.
            v: absoluteValue.
            res size do: [|:i. q <- 0. |
                q: v / 256.
                res: intNN or: res  With: intNN shl: (v - (256 * q)) With: 8 * i.
                v: q.
            ].
            < 0 ifTrue: [res negate]
                 False: [res]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asUnsignedInteger = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt16 = ( |
            | int32 int16FromInt32: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fComment: A smallInt is also an int64, so
this coercion is easy.\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt64 = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt8 = ( |
            | int32 int8FromInt32: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: Klein\x7fCategory: int32and64\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeAsBigEndianByteVectorInto: aByteVector At: index IfFail: fb = ( |
            | 
            [endianDependentServer].
            aByteVector bigEndianIntSize: 32 Signed: true At: index Put: self IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: Klein\x7fCategory: int32and64\x7fModuleInfo: Module: int32and64 InitialContents: FollowSlot\x7fVisibility: public'
        
         storeAsLittleEndianByteVectorInto: aByteVector At: index IfFail: fb = ( |
            | 
            aByteVector littleEndianIntSize: 32 Signed: true At: index Put: self IfFail: fb).
        } | ) 



 '-- Side effects'

 globals modules int32and64 postFileIn
