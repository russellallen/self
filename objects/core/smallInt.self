 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: largest small integer\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         maxSmallInt = 536870911.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fComment: smallest small integer\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         minSmallInt = -536870912.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         smallInt = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'smallInt' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'smallInt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules smallInt.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: smallInt InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- 'smallIntTests
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         smallInt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits smallInt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         != a = ( |
            | asSmallInteger _IntNE: a IfFail: [(= a) not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         % a = ( |
            | 
             asSmallInteger _IntMod: a IfFail: [| :error. :name. |
            "Return receiver a receiver. Obeys identity: a%b = a - (b * a/b)."
               ('badTypeError' == error) ifTrue: [
                   " use double dispatching "
                   a moduloSmallInteger: asSmallInteger ] False: [
               ('overflowError' == error) ifTrue: [
                   " retry after coercing to bigInts "
                   asBigInteger % a asBigInteger ] False: [
               primitiveFailedError: error Name: name ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fComment: bitwise and\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         && a = ( |
            | asSmallInteger _IntAnd: a asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         * a = ( |
            | asSmallInteger _IntMul: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a multiplySmallInteger: asSmallInteger ] False: [
            ('overflowError' == error) ifTrue: [
                " retry after coercing to bigInts "
                asBigInteger * a asBigInteger ] False: [
            primitiveFailedError: error Name: name ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         + a = ( |
            | asSmallInteger _IntAdd: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a addSmallInteger: asSmallInteger ] False: [
            ('overflowError' == error) ifTrue: [
                " retry after coercing to bigInts "
                asBigInteger + a asBigInteger ] False: [
            primitiveFailedError: error Name: name ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         +> a = ( |
            | asSmallInteger _IntArithmeticShiftRight: a asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         - a = ( |
            | asSmallInteger _IntSub: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a subtractSmallInteger: asSmallInteger ] False: [
            ('overflowError' == error) ifTrue: [
                " retry after coercing to bigInts "
                asBigInteger - a asBigInteger ] False: [
            primitiveFailedError: error Name: name ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: Integer division according to:
| a/b |  =  |a| / |b|
and
|a| <=  | a/b | * |b|  <  |a| + |b|\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         / a = ( |
            | asSmallInteger _IntDiv: a IfFail: [| :error. :name. |
            ('badTypeError' == error) ifTrue: [
                " use double dispatching "
                a divideSmallInteger: asSmallInteger ] False: [
            ('overflowError' == error) ifTrue: [
                " retry after coercing to bigInts "
                asBigInteger / a asBigInteger ] False: [
            primitiveFailedError: error Name: name ]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         < a = ( |
            | asSmallInteger _IntLT: a IfFail: [
            a reverseLessThanSmallInteger: asSmallInteger]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         <+ a = ( |
            | asSmallInteger _IntArithmeticShiftLeft:  a asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         << a = ( |
            | asSmallInteger _IntLogicalShiftLeft:     a asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         <= a = ( |
            | asSmallInteger _IntLE: a IfFail: [
            a reverseLessThanOrEqualSmallInteger: asSmallInteger]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         = a = ( |
            | asSmallInteger _IntEQ: a IfFail: [
            a equalsSmallInteger: asSmallInteger]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         > a = ( |
            | asSmallInteger _IntGT: a IfFail: [
            a reverseGreaterThanSmallInteger: asSmallInteger]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         >= a = ( |
            | asSmallInteger _IntGE: a IfFail: [
            a reverseGreaterThanOrEqualSmallInteger: asSmallInteger]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         >> a = ( |
            | asSmallInteger _IntLogicalShiftRight:    a asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fComment: bitwise xor\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         ^^ a = ( |
            | asSmallInteger _IntXor: a asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         addBigInteger: a = ( |
            | a + asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         addFloat: a = ( |
            | a + asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         addSmallInteger: a = ( |
            | a + asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asBigInteger = ( |
            | bigInt fromInt: asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asByte = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloat = ( |
            | asSmallInteger _IntAsFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fComment: A smallInt is also an int32, so
this coercion is easy!\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asInt32 = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfFail: fb = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         bitSize = ( |
            | typeSizes bitSize:  'self_int').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: miscellaneous\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         byteSize = ( |
            | typeSizes byteSize: 'self_int').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         compareBigInteger: a IfLess: lb Equal: eb Greater: gb = ( |
            | 
            asBigInteger compare: a asBigInteger 
                IfLess: lb Equal: eb Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fComment: bitwise complement\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         complement = ( |
            | -1 - self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         divideBigInteger: a = ( |
            | a / asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         divideFloat: a = ( |
            | a / asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         divideSmallInteger: a = ( |
            | a / asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         equalsBigInteger: a = ( |
            | asBigInteger = a asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         equalsFloat: a = ( |
            | a = asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsSmallInteger: a = ( |
            | a = asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bitfield operations\x7fComment: Return the contents of the bitfield at the given offset. The mask argument
is a right-justified mask for the bitfield (i.e., for a bitfield of size N,
the mask is an integer whose N least significant bits are one and whose
remaining bits are zero).
\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         getBitFieldOffset: offset Mask: mask = ( |
            | 
            (>> offset) && mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bitfield operations\x7fComment: Return true if the bit at the given offset in the receiver
is one, false if it is zero.
\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         getFlagOffset: offset = ( |
            | 
            ((>> offset) && 1) = 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         moduloBigInteger: a = ( |
            | a % asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         moduloFloat: a = ( |
            | a % asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         moduloSmallInteger: a = ( |
            | a % asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         multiplyBigInteger: a = ( |
            | a * asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         multiplyFloat: a = ( |
            | a * asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         multiplySmallInteger: a = ( |
            | a * asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         numberOfOnes = ( |
            | 
            = 0 ifTrue: [^ 0].
            < 0 ifTrue: [^ bitSize - complement numberOfOnes].
              (&& 1)  + (+> 1) numberOfOnes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'ModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'integer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         reverseGreaterThanFloat: a = ( |
            | a > asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         reverseGreaterThanOrEqualFloat: a = ( |
            | a >= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseGreaterThanOrEqualSmallInteger: a = ( |
            | a >= asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseGreaterThanSmallInteger: a = ( |
            | a > asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         reverseLessThanFloat: a = ( |
            | a < asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         reverseLessThanOrEqualFloat: a = ( |
            | a <= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseLessThanOrEqualSmallInteger: a = ( |
            | a <= asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         reverseLessThanSmallInteger: a = ( |
            | a < asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bitfield operations\x7fComment: Return the result of setting the specified bitfield of the receiver to
the given value. The low-order bit of the bitfield is offset bits from
the LSB of the receiver. The mask argument is a right-justified mask
for the bitfield as described in getBitField:Mask:.
\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         setBitFieldOffset: offset Mask: mask Value: value = ( |
             maskedValue.
            | 

            maskedValue: mask && value asInteger.
            (value = maskedValue) ifFalse: [
                error: 'attempting to assign a value too large for given bit field'.
            ].
            (&& (mask << offset) complement) || (maskedValue << offset)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bitfield operations\x7fComment: Return the result of setting the bit at the given
offset in the receiver to 1 if the given boolean is
true or 0 if the given boolean is false.
\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         setFlagOffset: offset To: aBoolean = ( |
            | 
            aBoolean
                ifTrue: [ || (1 << offset) ]
                 False: [ && (1 << offset) complement ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         subtractBigInteger: a = ( |
            | a - asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot'
        
         subtractFloat: a = ( |
            | a - asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractSmallInteger: a = ( |
            | a - asSmallInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallInt' -> () From: ( | {
         'Category: bits\x7fComment: bitwise or\x7fModuleInfo: Module: smallInt InitialContents: FollowSlot\x7fVisibility: public'
        
         || a = ( |
            | asSmallInteger _IntOr:  a asSmallInteger).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'smallIntTests' From: 'core'



 '-- Side effects'

 globals modules smallInt postFileIn
