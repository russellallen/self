 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
        
         numberTests = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'numberTests' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'numberTests' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules numberTests.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'numberTests' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'tests'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'numberTests' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'numberTests' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
        
         myComment <- 'Tests various number functions (and some other stuff).'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'numberTests' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'numberTests' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         bigIntegerTest = ( |
            | 
            'Testing simple big integer arithmetic and failures...' printLine.
            check: [ 25 factorial ] Against: '15511210043330985984000000' asInteger
                Named: '25 factorial'.
            check: [ 3 power: 25 ] Against: '847288609443' asInteger
                Named: '3 power: 25'.

            "This bigInt division triggered an assertion. Ole, Oct. 1991."
            check: [ 26 factorial / 1 ] Against: [ 26 factorial ] 
                                          Named: 'bigInt division'.
            check: [ 25 factorial printString ] 
                Against: [ '15511210043330985984000000' ] 
                  Named: 'bigInt printString'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         divAndModTest = ( |
             f <- 5.
             t <- 12.
            | 
            check: [(t        / f       ) absoluteValue] Against: 2 Named: '+N / +N'.
            check: [(t negate / f       ) absoluteValue] Against: 2 Named: '-N / +N'.
            check: [(t        / f negate) absoluteValue] Against: 2 Named: '+N / -N'.
            check: [(t negate / f negate) absoluteValue] Against: 2 Named: '-N / -N'.

            check: [(t        % f       ) absoluteValue] Against: 2 Named: '+N % +N'.
            check: [(t negate % f       ) absoluteValue] Against: 2 Named: '-N % +N'.
            check: [(t        % f negate) absoluteValue] Against: 2 Named: '+N % -N'.
            check: [(t negate % f negate) absoluteValue] Against: 2 Named: '-N % -N'.
            divisionTests.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: VM tests\x7fCategory: integer arithmetic tests\x7fComment: Trying to test that tags behave properly 
when dividing negative numbers. In particular,
the border case where the result of the division
already has a 0-ed out tag.\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         divisionTests = ( |
            | 
            "division by 1"
            check: [(1 / 1)] Against: 1 Named: 'division by 1'.
            check: [(0 / 1)] Against: 0 Named: 'division by 1'.

            "borderlines"
            check: [( maxSmallInt /  1)    ] Against: maxSmallInt Named: 'division borderlines'.
            check: [( maxSmallInt / -1) - 1] Against: minSmallInt Named: 'division borderlines'.
            check: [( minSmallInt /  1)    ] Against: minSmallInt Named: 'division borderlines'.
            check: [( minSmallInt / -1) - 1] Against: maxSmallInt Named: 'division borderlines'.

            check: [( minSmallInt / maxSmallInt) ] Against: -1 Named: 'division borderlines'.
            check: [( maxSmallInt / minSmallInt) ] Against:  0 Named: 'division borderlines'.

            check: [(   4 / 1)] Against:   4 Named: 'division'.
            check: [(   4 / 2)] Against:   2 Named: 'division'.
            check: [(   4 / 3)] Against:   1 Named: 'division'.
            check: [(   4 / 4)] Against:   1 Named: 'division'.

            check: [(   4 / -1)] Against: -4 Named: 'division'.
            check: [(   4 / -2)] Against: -2 Named: 'division'.
            check: [(   4 / -3)] Against: -1 Named: 'division'.
            check: [(   4 / -4)] Against: -1 Named: 'division'.

            check: [(  -4 /  1)] Against: -4 Named: 'division'.
            check: [(  -4 /  2)] Against: -2 Named: 'division'.
            check: [(  -4 /  3)] Against: -1 Named: 'division'.
            check: [(  -4 /  4)] Against: -1 Named: 'division'.

            check: [(  -4 / -1)] Against:  4 Named: 'division'.
            check: [(  -4 / -2)] Against:  2 Named: 'division'.
            check: [(  -4 / -3)] Against:  1 Named: 'division'.
            check: [(  -4 / -4)] Against:  1 Named: 'division'.

            "testing with mutiples of tag size - assumes tag size of 4
             inspired by a SIC bug caught in 7/05 - Ausch"
            check: [( -12 /  1)] Against:  -12 Named: 'division with tags'.
            check: [( -12 /  2)] Against:   -6 Named: 'division with tags'.
            check: [( -12 /  3)] Against:   -4 Named: 'division with tags'.
            check: [( -12 /  4)] Against:   -3 Named: 'division with tags').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         floatTest = ( |
            | 
            "The power method in integer only worked when both receiver and arg
             were positive. Ole Agesen, Oct. 1991."
            check: [  2 power: -3     ] Against:  0.125 Named: ' 2 power: -3'.
            check: [ -2 power: -3     ] Against: -0.125 Named: '-2 power: -3'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         integerFloatConversionTest = ( |
            | 
            check: [ 3.4 + 5 ] Against: 8.4 Named: '3.4 + 5'.
            check: [ 0 asFloat ] Against: 0 Named: '0 asFloat = 0'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         integerTest = ( |
            | 
            smallIntegerTest.
            bigIntegerTest.
            integerFloatConversionTest.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot'
        
         number = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tests number.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'Comment: Set true to generate more (non-constant) output.\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         noisy <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'tests' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: InitializeToExpression: (randomLC copy)\x7fVisibility: private'
        
         rand = randomLC copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         run = ( |
             s <- 1.
            | 
            'Testing number functions ....' printLine.
            "The if below is for better reproducibility when tracking VM bugs."
            "-Urs 4/93"
            _WizardMode ifTrue: [
                s: 82576509.
            ] False: [
                s: times real msec.  "Don't just use 0 - then we can't print seed."
            ].
            rand seed: s.
            ('(setting seed to ', s printString, ').') printLine.
            check: [ testRandom: s  ] Against: 'ok' Named: 'random generator'.
            check: [ testEvenOdd    ] Against: 'ok' Named: 'even/odd'.
            check: [ test_isPrime   ] Against: 'ok' Named: 'determ. isPrime'.
            check: [ test_nextPrime ] Against: 'ok' Named: 'nextPrime'.
            check: [ test_factors   ] Against: 'ok' Named: 'factors'.
            check: [ test_gcd       ] Against: 'ok' Named: 'gcd'.
            check: [ test_gcdExt    ] Against: 'ok' Named: 'gcdExtended'.
            check: [ test_powerMod  ] Against: 'ok' Named: 'powerMod'.
            check: [ test_probPrime ] Against: 'ok' 
                                        Named: 'prob isPrime/nextPrime'.
            check: [ test_log       ] Against: 'ok' Named: 'log'.
            check: [ test_rsa       ] Against: 'ok' Named: 'rsa').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testEvenOdd = ( |
            | 
            -6                even ifFalse: [ ^ '-6                even failed' ].
             0                even ifFalse: [ ^ ' 0                even failed' ].
            48                even ifFalse: [ ^ '48                even failed' ].
            26 factorial      even ifFalse: [ ^ '26 factorial      even failed' ].

            -6                odd  ifTrue:  [ ^ '-6                odd  failed' ].
             0                odd  ifTrue:  [ ^ ' 0                odd  failed' ].
            48                odd  ifTrue:  [ ^ '48                odd  failed' ].
            26 factorial      odd  ifTrue:  [ ^ '26 factorial      odd  failed' ].

            -6           succ even ifTrue:  [ ^ '-6           succ even failed' ].
             0           succ even ifTrue:  [ ^ ' 0           succ even failed' ].
            48           succ even ifTrue:  [ ^ '48           succ even failed' ].
            26 factorial succ even ifTrue:  [ ^ '26 factorial succ even failed' ].

            -6           succ odd  ifFalse: [ ^ '-6           succ odd  failed' ].
             0           succ odd  ifFalse: [ ^ ' 0           succ odd  failed' ].
            48           succ odd  ifFalse: [ ^ '48           succ odd  failed' ].
            26 factorial succ odd  ifFalse: [ ^ '26 factorial succ odd  failed' ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testRandom: s = ( |
            | 
            testRandomGenerator: (random   copySeed: s) Named: 'Copy of random'.
            testRandomGenerator: (randomLC copySeed: s) Named: 'Copy of randomLC'.
            "Add here, if new type of random number generator is added to system."
            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         testRandomGenerator: r Named: name = ( | {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 rnd.
                } 
            | 
            name printLine.
            rnd: r copySeed: 67.
            rnd seed: 8732.
            10 do: [ | x. |
                x: rnd boolean.
                noisy ifTrue: [
                    b ifTrue: [ 'true ' print.  ] 
                       False: [ 'false ' print. ]
                ].
            ].

            noisy ifTrue: [ '' printLine. ].
            10 do: [ | x. |
                x: rnd integer: 10.
                noisy ifTrue: [ x print. ' ' print. ].
                (x < 0) || [ x > 10 ] ifTrue: [ error: 'wrong integer value.' ].
            ].

            noisy ifTrue: [ '' printLine. ].
            10 do: [ | x. |
                x: rnd sign.
                noisy ifTrue: [ x print. ' ' print. ].
                (x != -1) && [ x != 1 ] ifTrue: [ error: 'wrong sign value.' ].
            ].

            noisy ifTrue: [ '' printLine. ].
            10 do: [ | x. |
                x: rnd sign0.
                noisy ifTrue: [ x print. ' ' print. ].
                (x < -1) || [ x > 1 ] ifTrue: [ error: 'wrong sign0 value.' ].
            ].

            noisy ifTrue: [ '' printLine. ].
            10 do: [ | x. |
                x: rnd float.
                noisy ifTrue: [ x print. ' ' print. ].
                (x < 0.0) || [ x > 1.0 ] ifTrue: [ error: 'wrong float value.' ].
            ].

            noisy ifTrue: [ '' printLine. ].
            10 do: [ | x. |
                x: rnd char.
                "Don't attempt to print x - it is often unprintable."
                (x asByte < 0) || [ x asByte > 255 ] ifTrue: [ 
                    error: 'wrong char value.' 
                ].
            ].

            noisy ifTrue: [ '' printLine. ].
            10 do: [ | x. |
                x: rnd string: 7. 
                "Don't attempt to print these strings, they are full of control
                 characters."
                x size != 7 ifTrue: [ error: 'wrong string size.' ].
            ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_factors = ( |
            | 
            100 do: [  | a. b. x. y. |
              a: (rand integer: 10000) + 1.
              b: 1.
              a factors do: [ | :i | 
                  i isPrime ifFalse: [ ^ 'non-prime factor in ', a printString ].
                  b: b * i.
              ].
              a != b ifTrue: [ ^ 'factors have wrong product.' ].
            ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_gcd = ( |
            | 
            (     7 gcd:      0) =  7 ifFalse: [ ^ '     7 gcd:      0 failed' ].
            (     0 gcd:      7) =  7 ifFalse: [ ^ '     0 gcd:      7 failed' ].
            (-27246 gcd: -65246) = 38 ifFalse: [ ^ '-27246 gcd: -65246 failed' ].
            (-27246 gcd:  65246) = 38 ifFalse: [ ^ '-27246 gcd:  65246 failed' ].
            ( 27246 gcd: -65246) = 38 ifFalse: [ ^ ' 27246 gcd: -65246 failed' ].
            ( 27246 gcd:  65246) = 38 ifFalse: [ ^ ' 27246 gcd:  65246 failed' ].

            100 do: [  | a. b. c. |
              a: (rand integer: 10000) * rand sign.
              b: (rand integer: 10000) * rand sign.
              c: a gcd: b.
              c < 0        ifTrue: [^ 'gcd should not be negative: ', 
                                      a printString, ' ', b printString 
              ].
              ((a % c) != 0) || [(b % c) != 0] ifTrue: [
                                    ^ 'gcd should divide both args: ', 
                                      a printString, ' ', b printString 
              ].
            ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_gcdExt = ( |
            | 
            100 do: [  | a. b. c. r. x. y. |
              a: (rand integer: 10000) * rand sign.
              b: (rand integer: 10000) * rand sign.
              r: a gcdExtended: b.
              c: r x.
              x: r y x.
              y: r y y.
              c != (a gcd: b) ifTrue: [^ 'gcdExtended returned wrong gcd: ', 
                                         a printString, ' ', b printString 
              ].
              ((x * a) + (y * b)) != c ifTrue: [
                                       ^ 'gcdExtended returned wrong x or y: ', 
                                         a printString, ' ', b printString 
              ].

            ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_isPrime = ( |
            | 
                0 isPrime ifTrue:  [ ^ '  0 is not a prime' ].
                1 isPrime ifTrue:  [ ^ '  1 is not a prime' ].
               -3 isPrime ifTrue:  [ ^ ' -3 is not a prime' ].
              -23 isPrime ifTrue:  [ ^ '-23 is not a prime' ].

                2 isPrime ifFalse: [ ^ '    2 is a prime' ].
                3 isPrime ifFalse: [ ^ '    3 is a prime' ].
               23 isPrime ifFalse: [ ^ '   23 is a prime' ].
            65537 isPrime ifFalse: [ ^ '65537 is a prime' ].

            500 do: [ | n <- 47. m <- 47. | 
                n: (rand integer: 10000) + 2.
                m: (rand integer: 10000) + 2.
                (m * n) isPrime ifTrue: [ ^ (m * n) printString, ' is not a prime' ].
            ].

              ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_log = ( |
            | 
            10 do: [  | a. b. c. |
                a: rand integer: maxSmallInt.
                b: (rand integer: 40) + 2.
                c: b log: a.
                (b power: c) > a ifTrue: [ 
                    ^ 'log too big for ' a printString, ' and ', b printString.
                ].
                (b power: c + 1) <= a ifTrue: [ 
                    ^ 'log too small for ' a printString, ' and ', b printString.
                ].
            ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_nextPrime = ( | {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 str.
                } 
            | 
            '' printLine.
            check: [ -111 nextPrime] Against:     2 Named: ' -111 nextPrime'.
            check: [    1 nextPrime] Against:     2 Named: '    1 nextPrime'.
            check: [    4 nextPrime] Against:     5 Named: '    4 nextPrime'.
            check: [65521 nextPrime] Against: 65537 Named: '65521 nextPrime'.
            n: 1.
            str: ''.
            15 do: [ n: n nextPrime. str: str, ' ', n printString. ].
            check: [ str ] Against: ' 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47'
                           Named: 'first 15 primes'.
            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_powerMod = ( |
            | 
            10 do: [  | a. b. c. |
              a: rand integer: 10000.
              b: rand integer: 10.
              c: (rand integer: 10000) successor.
              ((a power: b) %+ c) != (a power: b Mod: c) ifTrue: [
                 ^ 'power: and power:Mod: disagrees for ', 
                   a printString, ' ', b printString, ' ', c printString, ' '.
              ].
            ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_probPrime = ( |
            | 
            10 do: [  | a. b. c. reps = 15. |
              a: (rand integer: 10000) + 10000.
              "a must be large, else the probabilistic test just reduces to the
               deterministic test. 10000 is the cross over point."
              a isPrime != (a isPrime: reps) ifTrue: [ 
                  ^ 'isPrime/isPrime: disagreement for ', a printString.
              ].
              b: a nextPrime.
              rand boolean ifTrue: [ c: a nextPrime: reps. ]
                            False: [ c: a nextPrime: reps Random: rand. ].
              b != c ifTrue: [ 
                  ^ 'nextPrime/nextPrime: disagreement for ', 
                    a printString, ' ', b printString, ' ', c printString.
              ].
              (b isPrime: reps Random: rand) ifFalse: [
                  'isPrime: failed for ', a printString.
              ].
            ].

            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         test_rsa = ( | {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 a <- ''.
                }  {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 b <- ''.
                }  {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 c <- ''.
                }  {
                 'ModuleInfo: Module: numberTests InitialContents: InitializeToExpression: (rsa copy)'
                
                 cryp <- rsa copy.
                }  {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 k <- 47.
                }  {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 modulusSize = 20.
                }  {
                 'ModuleInfo: Module: numberTests InitialContents: FollowSlot'
                
                 testStringLen = 10.
                } 
            | 
            "Set seed so that all is determined by the one seed originally chosen."
            cryp randomGenerator seed: (rand integer: maxSmallInt).
            'RSA: choosing  modulus etc...' printLine.
            cryp chooseModulus: 10 Bits: modulusSize.
            cryp modulus < cryp phi ifTrue: [ ^ 'Wrong!' ].
            noisy ifTrue: [
                '   Primes:       ' print. cryp primes     printLine.
                '   Modulus:      ' print. cryp modulus    printLine.
                '   Phi(Modulus): ' print. cryp phi        printLine.
                '   Private key:  ' print. cryp privateKey printLine.
                '   Public  key:  ' print. cryp publicKey  printLine.
            ].
            ' Encrypting/decrypting: ' print.

            '1' print.
            a: rand string: testStringLen.      "Encrypt/decrypt random string"
            b: cryp encrypt: a.        "and see if original string comes back."
            c: cryp decrypt: b.
            a != c ifTrue: [^ 'rsa encryption failed.'].

            [k: (rand integer: cryp phi - 1) + 1. (k gcd: cryp phi) > 1] whileTrue.

            '2' print.
            cryp publicKey: k.                "Try this number as public key."
            a: rand string: testStringLen.    "Encrypt/decrypt random string"
            b: cryp encrypt: a.      "and see if original string comes back."
            c: cryp decrypt: b.
            a != c ifTrue: [^ 'rsa encryption failed.'].

            '3' print.
            cryp privateKey: k.               "And now as private."
            a: rand string: testStringLen.    "Encrypt/decrypt random string"
            b: cryp encrypt: a.      "and see if original string comes back."
            c: cryp decrypt: b.
            a != c ifTrue: [^ 'rsa encryption failed.'].

            "Make sure we try all methods."
            a: cryp randomGenerator.      
            cryp randomGenerator: a copy.
            cryp chooseKeys.

            '' printLine.
            ^ 'ok').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: public'
        
         smallIntegerTest = ( |
            | 
            'Testing simple small integer arithmetic and failures...' printLine.
            check: [ 10 factorial ] Against: 3628800 Named: '10 factorial'.
            check: [ 3 power: 5 ] Against: 243 Named: '3 power: 5'.

            "The power method in integer only worked when both receiver and arg
             were positive. Ole Agesen, Oct. 1991."
            check: [ -2 power:  3     ] Against: -8     Named: '-2 power:  3'.
            check: [  0 power:  3     ] Against:  0     Named: ' 0 power:  3'.
            check: [  5 power:  0     ] Against:  1     Named: ' 5 power:  0'.
            check: [ -5 power:  0     ] Against:  1     Named: '-5 power:  0'.

            check: [ testSubOverflow ] Against: 17 
            Named: '0 _IntSub: minSmallInt IfFail: 17'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> () From: ( | {
         'Category: numbers and other magnitudes\x7fModuleInfo: Module: numberTests InitialContents: FollowSlot\x7fVisibility: private'
        
         testSubOverflow = ( |
            | 
            0 _IntSub: minSmallInt IfFail: 17).
        } | ) 



 '-- Side effects'

 globals modules numberTests postFileIn
