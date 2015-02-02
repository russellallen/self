 'Sun-$Revision: 30.16 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         bigInt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'bigInt' -> () From: ( |
             {} = 'Comment: A bigInt is represented using a smallInt for the sign (-1, 0, 1  if 
       the bigInt is respectively negative, zero, positive), and a \'list\' of
       \'digits\'. Each digit is an integer. The range of these integers is
       0..base-1, where base is defined in traits bigInt.
       The bigInt zero has an empty list of digits. 
       Changed representation to use a byte vector instead of a list for
       the digits. Ole, 5/21/93.\x7fModuleInfo: Creator: globals bigInt.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         digits <- bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: core\x7fCategory: numbers\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         bigInt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits bigInt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'bigInt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bigInt' -> () From: ( | {
         'Comment: Note: this slot overrides the sign method in
                               \'traits number\'. This is just an optimization.\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         sign <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         bigInt = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'bigInt' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'bigInt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules bigInt.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         myComment <- 'Changed from base 10 to general base to speed up arithmetic. 
             Ole Agesen, Oct. 1991.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.16 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         % a = ( |
            | a moduloBigInteger:   asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         * a = ( |
            | a multiplyBigInteger: asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         + a = ( |
            | a addBigInteger:      asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         - a = ( |
            | a subtractBigInteger: asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         / a = ( |
            | a divideBigInteger:   asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         < x = ( |
            | compare: x IfLess: true Equal: false Greater: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         = x = ( |
            | x equalsBigInteger: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         absDigitListBase: lBase Do: blk = ( |
             pow <- 4.
             remainingDigits <- 0.
            | 
            base = lBase ifTrue: [ "The fastest case of them all."
                ^ digitsDo: blk.
            ] .
            pow: (lBase log: base).
            base != (lBase power: pow) ifTrue: [
                "do it the slow way"
                ^ resend.absDigitListBase: lBase Do: blk.
            ].
            remainingDigits: digits size / cByteSize.
            digitsDo: [|:d. n <- 0. |
                remainingDigits: remainingDigits - 1.
                d absDigitListBase: lBase Do: [|:dg| blk value: dg. n: 1 + n].
                0 != remainingDigits ifTrue: [
                    n upTo: pow Do: [blk value: 0]. "Leading 0's."
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteValue = ( |
            | -1 = sign ifTrue: [negate] False: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         addBigInteger: a = ( |
             res.
            | 
            sign   = 0 ifTrue: [^ a].
            a sign = 0 ifTrue: [^ self].
            res: lowLevelClone.
            sign = a sign ifTrue: [
                res setDigits: (addDigits: digits And: a digits).
                res sign: sign.
            ]
            False: [
              compareDigits: digits And: a digits
                IfLess: [res setDigits: (subDigits: a digits And: digits).
                         res sign: a sign]
                 Equal: [res: bigInt.   "bigInt prototype has value 0."]
               Greater: [res setDigits: (subDigits: digits And: a digits).
                         res sign: sign].
            ].
            res asSmallIntegerIfPossible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         addDigits: digits1 And: digits2 = ( |
            | 
            "Like 'addDigitsSE:And:' but does not side effect 'digits1'.
             Note: result may contain leading zeros."
            digits1 size < digits2 size ifTrue: [
                addDigitsSE: (digits2 copySize: digits2 size + cByteSize
                                   FillingWith: 0)
                        And: digits1.
            ] False: [
                addDigitsSE: (digits1 copySize: digits1 size + cByteSize
                                   FillingWith: 0)
                        And: digits2.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         addDigitsSE: digits1 And: digits2 = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 carry <- 0.
                } 
            | 
            assert: [digits1 size > digits2 size].
            0 upTo: digits1 size By: cByteSize Do: [|:idx. x <- 0. |
                x: (in: digits1 At: idx) +
                   (in: digits2 At: idx IfFail: 0) + carry.
                base <= x ifTrue: [x: x - base. carry: 1] False: [carry: 0].
                in: digits1 At: idx Put: x.
            ].
            assert: [carry = 0].
            digits1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         addFloat: a = ( |
            | a + asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         addSmallInteger: a = ( |
            | a asBigInteger + asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asBigInteger = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asByte = ( |
            | asSmallInteger asByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloat = ( |
             res <- 0.0.
            | 
            digitsReverseDo: [|:d| res: (res * fbase) + d asFloat].
            0 > sign ifTrue: [res: res negate].
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallInteger = ( |
            | 
            asSmallIntegerIfFail: [ error: 'doesn\'t fit into small integer' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfFail: errBlk = ( |
             res <- 0.
            | 
            digitsReverseDo: [|:d| 
                res: res _IntMul: base IfFail: [|:e| ^ errBlk value: e].
                res: res _IntAdd: d    IfFail: [|:e| ^ errBlk value: e]
            ].
            0 > sign ifTrue: [res: res negate].
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfPossible = ( |
            | asSmallIntegerIfFail: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         assert: blk = ( |
            | checkAsserts ifTrue: [blk assert]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Comment: 
       Biggest power of 10 that is smaller than maxSmallInt squareRoot. We
       prefer a power of 10 to allow for faster (decimal) printing.
       Start from maxSmallInt - 2 to avoid overflowing into bigInt\'s 
       when calculating the square root.

As of 10/01 I am changing this back to using bytes to make shifts work
for Klein. Used to be 10,000. -- dmu\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         base = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Comment: Used to be 16. -- dmu 10/01\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         cBitSize = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Comment: Used to be 2. -- dmu 10/01\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         cByteSize = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         cType = ( |
            | 
            ('char' & 'short' & 'int' & 'long') asVector do: [|:ct|
                base <= (2 power: (typeSizes bitSize: ct)) ifTrue: [^ ct].
            ].
            error: 'no suitable representation type found').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         checkAsserts = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            x compareBigInteger: asBigInteger
                IfLess: gb
                Equal: eb
                Greater: lb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         compareBigInteger: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            "check sign"
            sign compare: x sign
                  IfLess: [^ lb value] 
                   Equal: nil 
                 Greater: [^ gb value].

            "same sign; check digits"
            1 = sign ifTrue: [
                compareDigits: digits And: x digits
                       IfLess: lb Equal: eb Greater: gb.
            ] False: [
            -1 = sign ifTrue: [
                compareDigits: digits And: x digits
                       IfLess: gb Equal: eb Greater: lb.
            ] False: [
            "both bigints have sign 0, i.e. both equal to 0."
                eb value.
            ]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         compareDigits: digits1 And: digits2 IfLess: lb Equal: eb Greater: gb = ( |
            | 
            "check rough size of numbers"
            assert: [0 != (mostSignificantDigit: digits1)].
            assert: [0 != (mostSignificantDigit: digits2)].
            digits1 size compare: digits2 size
                 IfLess: [^ lb value] Equal: nil Greater: [^ gb value].

            digits1 size - cByteSize downTo: 0 By: cByteSize Do: [|:idx|
                (in: digits1 At: idx) compare: (in: digits2 At: idx)
                IfLess: [^ lb value] Equal: nil Greater: [^ gb value].
            ].
            eb value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         computeSmiSize = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 n <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 r <- 0.
                } 
            | 
            r: minSmallInt.
            [0 != r] whileTrue: [r: r / base. n: n + 1].
            n * cByteSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         digitsDo: blk = ( |
            | 
            0 upTo: digits size By: cByteSize Do: [|:idx|
                blk value: (in: digits At: idx).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         digitsRep = bootstrap stub -> 'globals' -> 'byteVector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         digitsReverseDo: blk = ( |
            | 
            (digits size - cByteSize) downTo: 0 By: cByteSize Do: [|:idx|
                blk value: (in: digits At: idx).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         divDigits: divisor And: dividend = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 divisorSize <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 partial.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 quotient.
                } 
            | 
            assert: [
                compareDigits: divisor And: dividend 
                       IfLess: true Equal: true Greater: false.
            ].
            divisorSize: divisor size.
            quotient: (digitsRep copySize: cByteSize + 
                                           (dividend size - divisorSize)
                              FillingWith: 0).
            partial: dividend copy.
            quotient size - cByteSize downTo: 0 By: cByteSize 
            Do: [|:idx1. d <- 0. borrow <- 0. i <- 0. |
                "'partial' may have gotten very short."
                partial size < idx1 ifTrue: [ 
                    d: 0.
                ] False: [
                    d: (oneDigitDiv: divisor And: (partial copyFrom: idx1)).
                ].
                in: quotient At: idx1 Put: d.
                "Now that we have stored the digit 'd', subtract 'd*divisor'
                 from 'partial'."
                0 != d ifTrue: [  
                    "If 'd = 0' 'partial' may be short so this is not just
                     an optimization."
                    0 upTo: divisorSize By: cByteSize Do: [|:idx2. x <- 0. |
                        x:  (in: partial At: idx1 + idx2) - 
                           ((in: divisor At: idx2) * d) - borrow.
                        0 > x ifTrue: [
                            borrow: (0 - x) /+ base.
                            x: x + (base * borrow).
                        ] False: [
                            borrow: 0.
                        ].
                        in: partial At: idx1 + idx2 Put: x.
                    ].
                    "Now handle the borrow."
                    i: divisorSize + idx1.
                    [0 != borrow] whileTrue: [| x <- 0. |
                        x: (in: partial At: i) - borrow.
                        0 > x ifTrue: [borrow: 1. x: x + base] 
                               False: [borrow: 0].
                        in: partial At: i Put: x.
                        i: cByteSize + i.
                    ].
                    partial: (removeLeadingZeros: partial).
                ].
            ].
            quotient).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         divideBigInteger: a = ( |
             res.
            | 
            0 = sign                    ifTrue: [^ error: 'division by zero'].
            0 = a sign                  ifTrue: [^ 0].
            compareDigits: digits And: a digits 
                   IfLess: nil Equal: [^ sign * a sign] Greater: [^ 0].
            res: lowLevelClone.
            res sign: sign * a sign.
            res setDigits: (divDigits: digits And: a digits).
            res asSmallIntegerIfPossible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         divideFloat: a = ( |
            | a / asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         divideSmallInteger: a = ( |
            | a asBigInteger / asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsBigInteger: x = ( |
            | (sign = x sign) && [digits = x digits]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         equalsFloat: a = ( |
            | a = asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         equalsSmallInteger: a = ( |
            | a asBigInteger = asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Comment: Used to be 10,000.0. -- dmu 10/01\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         fbase = 256.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         fromInt: x = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 d.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 res.
                } 
            | 
            minSmallInt = x ifTrue: [^ (fromInt: x succ) pred].
            d: (digitsRep copySize: smiSize FillingWith: 0).
            res: lowLevelClone.
            res sign: x sign.
            x digitListBase: base Do: [|:digit|
                in: d At: i Put: digit IfFail: [
                    error: 'unexpectedly many digits in smallInt'.
                ].
                i: i + cByteSize.
            ].
            res setDigits: d.
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | digits hash ^^ sign).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         in: d At: idx = ( |
            | in: d At: idx IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         in: d At: idx IfFail: errBlk = ( |
            | 
            assert: [
                (d cIntSize: cBitSize Signed: false At: idx IfFail: 0) < base.
            ].
            d cIntSize: cBitSize Signed: false At: idx IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         in: d At: idx Put: d0 = ( |
            | 
            in: d At: idx Put: d0 IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         in: d At: idx Put: d0 IfFail: errBlk = ( |
            | 
            assert: [d0 < base. "cIntSize:... checks for negative."].
            d cIntSize: cBitSize Signed: false At: idx Put: d0 IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         lowLevelClone = ( |
            | clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         moduloBigInteger: a = ( |
             r <- 1.
            | 
            "Return a modulo receiver. Obeys identity: a%b = a - (b * a/b)."
            (a - ((a / self) * self)) asSmallIntegerIfPossible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         moduloFloat: a = ( |
            | a % asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         moduloSmallInteger: a = ( |
            | a asBigInteger % asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         mostSignificantDigit: d = ( |
            | in: d At: d size - cByteSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         mulDigits: digits1 And: digits2 = ( |
             carryIdx <- 0.
             carryM <- 0.
             dsize1 <- 0.
             dsize2 <- 0.
             res.
            | 
            dsize1: digits1 size.
            dsize2: digits2 size.
            carryIdx: dsize2 - cByteSize.
            res: (digitsRep copySize: dsize1 + dsize2 FillingWith: 0).
            0 upTo: dsize1 By: cByteSize Do: [
                |:idx1. carryA <- 0. | 
                carryM: (mulOne: (in: digits1 At: idx1)
                        Digits: digits2
                  ResultStream: [|:x. :idx2. idx <- 0. y <- 0. c <- 0. | 
                    idx: idx1 + idx2.
                    idx2 = carryIdx ifTrue: [
                        "Last digit in 'digits2' so use left over carry
                         from last round."
                        c: carryM.
                    ].
                    y: c + x + (in: res At: idx) + carryA.
                    base <= y ifTrue: [carryA: 1. y: y - base] 
                               False: [carryA: 0].
                    in: res At: idx Put: y.
                ]).
                carryM: carryM + carryA.
            ].
            "Finish off with carry."
            assert: [0 = (mostSignificantDigit: res)].
            in: res At: res size - cByteSize Put: carryM.
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         mulOne: m Digits: digits1 = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 carry <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 res.
                } 
            | 
            res: digits1 copy.
            carry: (mulOne: m Digits: digits1 
                        ResultStream: [|:x. :idx| in: res At: idx Put: x]).
            0 != carry ifTrue: [
                res: (res copySize: res size + cByteSize).
                in: res At: digits1 size Put: carry.
            ].
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         mulOne: m Digits: digits1 ResultStream: blk = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 carry <- 0.
                } 
            | 
            0 upTo: digits1 size By: cByteSize Do: [|:idx. d <- 0. x <- 0. |
                d: (in: digits1 At: idx).
                x: (m * d) + carry.
                carry: x / base.
                x: x - (base * carry).   "Faster than x: x % base."
                blk value: x With: idx.
            ].
            carry).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         multiplyBigInteger: a = ( |
             res.
            | 
            0 = sign   ifTrue: [^ self].
            0 = a sign ifTrue: [^ a].
            res: lowLevelClone.
            res sign: sign * a sign.
            res setDigits: (mulDigits: digits And: a digits).
            res asSmallIntegerIfPossible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         multiplyFloat: a = ( |
            | a * asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         multiplySmallInteger: a = ( |
            | a asBigInteger * asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         negate = ( |
            | lowLevelClone sign: sign negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         oneDigitDiv: divisor And: partial = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 dsize <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 ld <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 lp <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 psize <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 q <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 qHi <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 qLo <- 0.
                } 
            | 
            "First let's see if we have enough digits for a non-zero quotient."
            psize: partial size.
            dsize: divisor size.
            psize < dsize ifTrue: [^ 0].
            lp: (mostSignificantDigit: partial).
            ld: (mostSignificantDigit: divisor).
            (psize = dsize) ifTrue: [
                lp < ld ifTrue: [^ 0].    "leading digits reveal result."
            ] False: [
                assert: [psize = (cByteSize + dsize)].
                lp: (lp * base) + 
                    (in: partial At: psize - cByteSize - cByteSize).
            ].
            qLo: lp / (1 + ld).
            qHi: (lp + 1) / ld.
            "qLo and qHi are bounds on the result. The bigger ld is, 
             the smaller is the difference between the bounds."

            "To find q, we now do a binary search."
            [qHi > (1 + qLo)] whileTrue: [| carry <- 0. |
                q: (qHi + qLo) / 2.
                "Now determine the sign of 'partial - divisor*q'."
                compareDigits: partial And: (mulOne: q Digits: divisor)
                       IfLess: [qHi: q - 1] 
                        Equal: [qLo: q. qHi: q]
                      Greater: [qLo: q "Not q+1"].
            ].
            "The loop above terminates when qHi <= qLo + 1. This can be
             true in two ways: 
                     1:   qHi < qLo + 1    <=>   qHi <= qLo.
                     2:   qHi = qLo + 1   and
             In case 1, we always pick q = qLo, but in case 2 we have
             to do an additional test to see if q = qLo + 1 = qHi is
             the right value."


            qHi <= qLo ifTrue: [ "Case 1:"
                q: qLo.     
            ] False: [           "Case 2:"
                compareDigits: (mulOne: qHi Digits: divisor) And: partial
                       IfLess: [q: qHi] Equal: [q: qHi] Greater: [q: qLo].
            ].
            "(q * divisor)     >  partial ifTrue: [ error: 'too big' ]."
            "(q + 1) * divisor <= partial ifTrue: [ error: 'too small']."
            q).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'ModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'integer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         removeLeadingZeros: d = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 j <- 0.
                } 
            | 
            i: d size - cByteSize.
            j: i.
            [(0 <= i) && [0 = (in: d At: i)]] whileTrue: [i: i - cByteSize].
            i = j ifTrue: [d]  "Just optim."
                   False: [d copySize: i + cByteSize]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseGreaterThanFloat: a = ( |
            | a > asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseGreaterThanOrEqualFloat: a = ( |
            | a >= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseGreaterThanOrEqualSmallInteger: a = ( |
            | 
            a asBigInteger >= asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseGreaterThanSmallInteger: a = ( |
            | 
            a asBigInteger > asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseLessThanFloat: a = ( |
            | a < asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseLessThanOrEqualFloat: a = ( |
            | a <= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseLessThanOrEqualSmallInteger: a = ( |
            | 
            a asBigInteger <= asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: comparing\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         reverseLessThanSmallInteger: a = ( |
            | a asBigInteger < asBigInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         setDigits: d = ( |
            | digits: (removeLeadingZeros: d)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Comment: Used to be 6. -- dmu 10/01\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         smiSize = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         squareRootIfFail: fb = ( |
             r <- 1.
             r1.
             r2.
            | 
            < 0 ifTrue: [^ fb value: 'negative'].
              [ |q|
                q: / r.
                r2: r1.
                r1: r.
                r: (q + r) half.
                r = r2 ifTrue: [^ r]
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: Klein\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         storeAsBigEndianByteVectorInto: aByteVector At: index IfFail: fb = ( |
            | 
            [endianDependentServer].
            < 0 ifTrue: [
              ^ negate + 1 storeAsBigEndianByteVectorInto: aByteVector
                                                       At: index
                                                   IfFail: fb
            ].
            aByteVector at: index     Put:   / 16r01000000.
            aByteVector at: index + 1 Put: ( / 16r00010000) asSmallInteger && 255.
            aByteVector at: index + 2 Put: ( / 16r00000100) asSmallInteger && 255.
            aByteVector at: index + 3 Put: % 256.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: Klein\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         storeAsLittleEndianByteVectorInto: aByteVector At: index IfFail: fb = ( |
            | 
            < 0 ifTrue: [
              ^ negate + 1 storeAsLittleEndianByteVectorInto: aByteVector
                                                       At: index
                                                   IfFail: fb
            ].
            aByteVector at: index + 3 Put:   / 16r01000000.
            aByteVector at: index + 2 Put: ( / 16r00010000) asSmallInteger && 255.
            aByteVector at: index + 1 Put: ( / 16r00000100) asSmallInteger && 255.
            aByteVector at: index + 0 Put: % 256.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            printString canonicalize storeString , ' asInteger').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: storing\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | bigInt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         subDigits: digits1 And: digits2 = ( |
            | 
            "Like 'subDigitsSE:And:' but does not side effect 'digits1'."
            subDigitsSE: digits1 copy And: digits2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         subDigitsSE: digits1 And: digits2 = ( | {
                 'ModuleInfo: Module: bigInt InitialContents: FollowSlot'
                
                 borrow <- 0.
                } 
            | 
            assert: [digits1 size >= digits2 size].
            0 upTo: digits1 size By: cByteSize Do: [|:idx. x <- 0. |
                x: (in: digits1 At: idx) - 
                   (in: digits2 At: idx IfFail: 0) - borrow.
                0 > x ifTrue: [borrow: 1. x: x + base] False: [borrow: 0].
                in: digits1 At: idx Put: x.
            ].
            assert: [0 = borrow].
            digits1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractBigInteger: a = ( |
            | negate addBigInteger: a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         subtractFloat: a = ( |
            | a - asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'bigInt' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: bigInt InitialContents: FollowSlot'
        
         subtractSmallInteger: a = ( |
            | a asBigInteger - asBigInteger).
        } | ) 



 '-- Side effects'

 globals modules bigInt postFileIn
