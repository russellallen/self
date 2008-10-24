 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: integer InitialContents: FollowSlot'
        
         integer = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'integer' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'integer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules integer.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ' \'\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: integer InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: numbers\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         integer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'integer' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits integer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: arithmetic\x7fComment: divide & round up.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         /+ a = ( |
            | (+ a pred) / a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: arithmetic\x7fComment: divide & round down.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         /- a = ( |
            | 
            (/= a) floor asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: arithmetic\x7fComment: divide exactly.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         /= a = ( |
            | (% a) = 0 ifTrue: [/ a] False: [asFloat /= a asFloat]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: arithmetic\x7fComment: divide & round. This tends to round up.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         /~ a = ( |
            | (+ a half) / a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         absDigitListBase: base Do: blk = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 rem <- 0.
                } 
            | 
            rem: self.    "(*) see comment above"
            [0 != rem] whileTrue: [| q <- 0. |
                q: rem / base.
                blk value: rem - (q * base). "Faster than 'rem % base'."
                rem: q.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         as = ( |
            | asIfFail: [ error: 'not a valid object ID']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         asCharacter = ( |
            | 
            asCharacterIfFail: [ error: 'not a legal character' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         asCharacterIfFail: block = ( |
            | '' characterFor: self IfFail: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         asDigitList = ( |
            | asDigitList: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         asDigitList: base = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 digits.
                } 
            | 
            digits: list copyRemoveAll.
            digitListBase: base Do: [|:d| digits addFirst: d].
            digits).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         asIfFail: block = ( |
            | _AsObjectIfFail: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         asInteger = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         asVector = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: vector copySize: self.
            do: [| :i | r at: i Put: i ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         binaryPrintString = ( |
            | printStringBase:  2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         ceil = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         decimalPrintString = ( |
            | printStringBase: 10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         digitListBase: base Do: blk = ( |
            | 
            "Iterate 'blk' over the digits in the receiver when expressed in
             base 'base'. The least significant digit is produced first."
            (2 > base) || [base != base asInteger] ifTrue: [
                ^ error: 'base must be an integer > 2'.
            ].
            absoluteValue absDigitListBase: base Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | 0    to: pred By:  1 Do: block. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         downTo: end By: step Do: block = ( |
            | to: end By: step negate Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         downTo: end Do: block = ( |
            | to: end By: -1 Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         even = ( |
            | ^ ( % 2) = 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         factorial = ( |
            | <= 1 ifTrue: 1 False: [ * predecessor factorial ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         factors = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 i <- 1.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 n <- 47.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            "Return list of prime factors in receiver."
            >= 1 ifFalse: [ error: 'factors not defined for non-pos int' ].
            n: self.
            r: list copyRemoveAll.
            [ n even ] whileTrue: [   r add: 2. n: n / 2. ].
            i: 3.
            [ n > 1  ] whileTrue: [
                (n % i) = 0 ifTrue: [ r add: i. n: n / i. ]
                             False: [ i: i + 2 ].
            ].
            ^ r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         fibonacci = ( |
            | 
            <= 1 ifTrue: [ self ]
                  False: [ predecessor fibonacci + (- 2) fibonacci ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         floor = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         gcd: a = ( |
            | 
            "Find greatest common divisor using Euclid's algorithm."
            ^ * sign gcdPositive: a * a sign).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         gcdExtended: a = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 aSign <- 1.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 g <- 47.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 selfSign <- 1.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 tmp.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 x <- 47.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 y <- 47.
                } 
            | 
            selfSign: sign.
            aSign:  a sign.
            tmp: absoluteValue gcdExtendedPositive: a absoluteValue.
            g: tmp x.
            x: tmp y x * selfSign.
            y: tmp y y * aSign. 
            ^ g@(x@y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         gcdExtendedPositive: a = ( |
            | 
            "Implementation of gcdExtended for non-negative integers."
            a = 0 ifTrue: [ ^ "self"@(1@0). ]
                   False: [ | g <- 47. x <- 47. y <- 47. tmp. | 
                       tmp: a gcdExtended: % a. 
                       g: tmp x.
                       x: tmp y y.
                       " use / instead of /- below:
                         ( /- rounds towards neg inf,
                           /  just does normal thing within type
                           Problem with /- is that it overflows
                           for integers bigger than max float -- dmu"
                       y: tmp y x - (( / a ) * x).
                       ^ g@(x@y).
                   ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         gcdPositive: a = ( |
            | 
            "Implementation of gcd for positive receiver and arg."
            a = 0 ifTrue: [ ^ self. ]
                   False: [ ^ a gcdPositive: % a ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         hexPrintString = ( |
            | printStringBase: 16).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         inverseMod: n = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 g <- 47.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 tmp.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 x <- 47.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 y <- 47.
                } 
            | 
            "Find multiplicative inverse of receiver modulo n using 
             extended version of Euclid."
            tmp: gcdExtended: n.
            g: tmp x.   
            x: tmp y x.
            y: tmp y y.    "Now gcd = g = x*self + y*n."
            g > 1 ifTrue: [ 
                error:   printString, ' does not have an inverse modulo ',
                       n printString.
            ].
            ^ x % n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrime = ( |
            | 
            "Deterministic test for primality. This test is slow for
             very big integers, but faster than the probabilistic test for
             moderate sized integers."

            ( <= 1)   ifTrue: [ ^ false. ]. "First all the special cases."
            = 2       ifTrue: [ ^ true.  ].
            even      ifTrue: [ ^ false. ].
            = 3       ifTrue: [ ^ true.  ].
            (% 3) = 0 ifTrue: [ ^ false. ].

            "Look for divisors; to save time avoid multiples of 2 and 3."
            5 to: squareRoot By: 6 Do: [ | :i | 
                ( %    i   ) = 0 ifTrue: [ ^ false ].
                ( % (i + 2)) = 0 ifTrue: [ ^ false ].
            ].
            ^ true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91. Probabilistic (fast) test for primality. reps is the number
                 of iterations done. The probability of incorrectly returning 
                 true (when the receiver is not a prime), is smaller than 
                 1/4^reps. This assumes an ideal random number generator.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrime: reps = ( |
            | isPrime: reps Random: random copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         isPrime: reps Random: rand = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 m <- 47.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 q <- 47.
                } 
            | 
            "The same as isPrime: reps, but caller supplies the random
             number generator rand."

            <= 10000 ifTrue: [ ^ isPrime. ]. "Use deterministic method."
            "A higher cross over value should be preferred, but then it
             becomes a pain to test the following code, since the 
             computations will overflow to very slow bigInt's."

            even     ifTrue: [ ^ false. ].

            "Faster to filter out non-primes if we first try finding
             small divisors."
            3 to: (3 * reps min: squareRoot) By: 2 Do: [ | :i | 
                ( % i) = 0 ifTrue: [ ^ false ].
            ].

            q: 0.      "Get rid of all even factors in self - 1."
            m: pred.
            [ m even ] whileTrue: [ m: m / 2.  q: q + 1. ].
            reps do: [ | b <- 47. c <- 47. |
                b: (rand integer: pred) + 1.
                (gcd: b) > 1 ifTrue: [ ^ false. ].
                c: b power: m Mod: self.
                c != 1 ifTrue: [
                    [ | :exit |
                        q do: [
                            c = pred ifTrue: [ exit value: true.]. 
                            c: (c * c) % self.
                        ].
                        exit value: false.
                    ] loopExitValue ifFalse: [ ^ false. ].
                ].
            ].
            ^ true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         nextPrime = ( |
            | 
            "Return next prime number strictly bigger than receiver, 
             using deterministic primality test."
            ^ nextPrimeTestingWith: [ | :i | i isPrime ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         nextPrime: n = ( |
            | 
            "As nextPrime, but using probabilistic primality test with
             n iterations."
            ^ nextPrimeTestingWith: [ | :i | i isPrime: n]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         nextPrime: n Random: rand = ( |
            | 
            "As nextPrime: n; caller supplies random number gen. rand."
            ^ nextPrimeTestingWith: [ | :i | i isPrime: n Random: rand]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         nextPrimeTestingWith: primetest = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 n <- 0.
                } 
            | 
            "Return next prime strictly bigger than receiver, using 
             primetest (a block) for testing primality."
            <= 1 ifTrue: [ ^ 2. ].
            n: succ + odd asInteger.   " n = next odd integer."
            [primetest value: n]  whileFalse: [ n: n + 2. ].
            ^ n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         octalPrintString = ( |
            | printStringBase:  8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         odd = ( |
            | even not. "Not not even but even not!").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'ModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'number' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         power: exp Mod: m = ( |
            | 
            "Raise receiver to power exp calculating modulus m.
             Receiver must be integer, exp must be integer >= 0,
             m must be integer >= 1."

             exp >= 0 ifFalse: [ error: 'Negative exp in power:Mod:' ].
             m   >= 1 ifFalse: [ error: 'Negative modulus in power:mod:' ].
             ^ exp reversePower: self Mod: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | decimalPrintString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringBase: base = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 chars.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            "return the string representation of the integer in a given base"
            (base > 16) ifTrue: [ error: 'base for printing must <= 16' ].
            0 = self ifTrue: [^ '0'].
            chars: list copyRemoveAll.
            digitListBase: base Do: [|:d|
                chars addFirst: ('0123456789abcdef' at: d).
            ].
            0 > self ifTrue: [chars addFirst: '-'].
            r: (mutableString copySize: chars size).
            chars do: [|:ch| r at: i Put: ch. i: i + 1].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringBase: b PadWith: padChar ToSize: len = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: printStringBase: b.
            s size upTo: len Do: [ s: padChar, s ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringPadWith0ToSize: len = ( |
            | 
            printStringPadWith: '0' ToSize: len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringPadWith: padChar ToSize: len = ( |
            | 
            printStringBase: 10 PadWith: padChar ToSize: len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         printStringPrecision: p = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: printString.
            p > 0 ifTrue: [
                s: s, '.', (mutableString copySize: p FillingWith: '0' first).
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         reverseDo: block = ( |
            | pred to: 0    By: -1 Do: block. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         reversePower: base = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 factor.
                } 
            | 
            "Raise to a power; receiver is exponent, argument is base"
            compare: 0
                IfLess:  [ factor: base inverse ]
                Equal:   [ ^ 1 ]
                Greater: [ factor: base ].
                ^ absoluteValue reversePowerNonNegative: factor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: Number theory functions, primes, divisors etc. Ole Agesen, 10/91.\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         reversePower: a Mod: m = ( |
            | 
            = 0 ifTrue: [ ^ 1 ].
            odd ifTrue: [ ^ ((pred reversePower: a Mod: m) * a)   % m ].
                          ^  (half reversePower: a Mod: m) square % m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         reversePowerNonNegative: base = ( |
            | 
            "As reversePower, but assumes receiver is non-negative. Much 
             faster than simple loop we used to have. Ole Agesen, 10/12/91."
            = 0 ifTrue: [ ^ 1 ].
            odd ifTrue: [ ^ (pred reversePowerNonNegative: base) * base ].
                          ^ (half reversePowerNonNegative: base) square).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         round = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: functions\x7fCategory: numberTheory\x7fComment: used by square root routine\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: private'
        
         squareRootPrecision = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         to: end BinarySearchBySignOf: directionBlock IfAbsent: ab = ( |
             b <- 0.
             t <- 10.
            | 
            b: self.
            t: end.
            [b <= t] whileTrue: [| m <- 5. |
                "invariant: if it exists, the answer lies in [b, t], and b <= t"
                m: (b + t) / 2.
                0 compare: (directionBlock value: m)
                   IfLess: [b: m succ]
                    Equal: [^ m]
                  Greater: [t: m pred].
            ].
            ab value: b With: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fComment: iterate from receiver to end by step intervals, passing in
	 the value to the block and executing the block each time\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         to: end By: step Do: block = ( |
            | 
            0 < step ifTrue: [ ^ to: end ByPositive: step Do: block ].
            0 > step ifTrue: [ ^ to: end ByNegative: step Do: block ].
            error: 'step is zero in to:By:Do: loop').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         to: end ByNegative: step Do: block = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: self.
            [ i >= end ] whileTrue: [
                block value: i With: i.
                i: i + step. ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         to: end ByPositive: step Do: block = ( | {
                 'ModuleInfo: Module: integer InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: self.
            [ i <= end ] whileTrue: [
                block value: i With: i.
                i: i + step. ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         to: end Do: block = ( |
            | to: end  By: 1 Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         truncate = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         upTo: end By: step Do: block = ( |
            | 
            to: end predecessor By: step Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integer InitialContents: FollowSlot\x7fVisibility: public'
        
         upTo: end Do: block = ( |
            | to: end predecessor Do: block).
        } | ) 



 '-- Side effects'

 globals modules integer postFileIn
