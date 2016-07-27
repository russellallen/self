 '30.8.1'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot'
        
         crypto = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'crypto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'crypto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules crypto.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'crypto' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'misc'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'crypto' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'crypto' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot'
        
         myComment <- 'RSA public key encryption and decryption'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'crypto' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: InitializeToExpression: (\'30.8.1\')\x7fVisibility: public'
        
         revision <- '30.8.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'crypto' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: cryptography\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         rsa = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( |
             {} = 'Comment: This is the substance in an RSA object.\x7fModuleInfo: Creator: globals rsa.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( | {
         'Comment: Private key, d for decrypt.  e*d = 1 (mod phi)\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         d <- 1521095.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( | {
         'Comment: Public key,  e for encrypt.\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         e <- 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( | {
         'Comment: Big, strong prime.\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         p <- 1327.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         rsa = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( |
             {} = 'Comment: This is a concrete subtype of traits cryptomachine. It implements the
     RSA public key encryption scheme. Note the following restriction: the
     encrypt and decrypt messages do not commute, due to technicalities related
     to blocking/unblocking. In other words, you can not decrypt and then
     encrypt a plain text, and expect to get the original text back again. 

     If you want to build a signature system, here is what to do:
     use encrypt to sign and decrypt to authenticate the signature.
     Keep the public key private (so that only you can sign), and publish the
     private key (so that everyone can authenticate).\x7fModuleInfo: Creator: traits rsa.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rsa' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( | {
         'Comment: How many chars we can encode in an integer, before it gets 
bigger than modulus.\x7fModuleInfo: Module: crypto InitialContents: InitializeToExpression: (2)\x7fVisibility: private'
        
         plainBlockSize <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( | {
         'Comment: Big, strong prime.\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         q <- 1553.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: InitializeToExpression: (randomLC copy)\x7fVisibility: private'
        
         rand <- randomLC copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tests' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: applications\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         cryptomachine = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( |
             {} = 'Comment: An abstract encryption/decryption machine.
     A distinction is made between plain text blocks (unencrypted) and
     cipher text blocks (encrypted). Both kinds of text blocks are
     represented as strings of fixed length, but the two kinds of
     text blocks need not have identical lengths.\x7fModuleInfo: Creator: traits cryptomachine.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         cshift = ( |
            | 2 power: typeSizes bitsPerByte).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         decrypt: cipher = ( |
             len <- 47.
             plain <- ''.
             space <- 0.
            | 
            "Return decryption of cipher."

            (cipher size %+ cipherBlockSize) != 0 ifTrue: [ 
                error: 'This text was encrypted using another block size.'.
            ].
            0 to: cipher size - cipherBlockSize By: cipherBlockSize Do: [|:i|
                plain: plain &
                    (blockDecrypt: (cipher copyFrom: i UpTo: i + cipherBlockSize)).
            ].
            plain: plain & ''.   "Make sure that 'flatString' works."
            plain: plain flatString.
            [' ' != (plain at: space 
                     IfAbsent: [error: 'rsa decrypt failed'])] whileTrue: [
                space: 1 + space.
            ].
            "Now we have plain text again, so let's get rid of all the filling/
             length info we added before encrypting."
            len: (plain copyFrom: 0 UpTo: space) asInteger.
            plain copyFrom: space + 1 UpTo: space + 1 + len).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'cryptomachine' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: traits cryptomachine descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         blockDecrypt: cipherTextBlock = ( |
            | 
            'Return decrypted version of textBlock.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         blockEncrypt: plainTextBlock = ( |
            | 
            'Return encrypted version of textBlock.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         cipherBlockSize = ( |
            | 
            'Return the size in bytes of a cipher text block.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         plainBlockSize = ( |
            | 
            'Return the size in bytes of a plain text block.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         rand = ( |
            | 'Return a random number generator.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         encrypt: text = ( |
             cipher <- ''.
             plain <- ''.
            | 
            "Return encryption of text."

            plain: text size printString, ' ', text.   "Include size."

            "Now fill up to integral multiple of block size."
            0 != (plain size %+ plainBlockSize) ifTrue: [|pad|
                pad: plainBlockSize - (plain size %+ plainBlockSize).
                plain: plain, (rand string: pad).
            ].
            0 to: plain size - plainBlockSize By: plainBlockSize Do: [|:i|
                cipher: cipher &
                      (blockEncrypt: (plain copyFrom: i UpTo: i + plainBlockSize)).
            ].
            cipher flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         int2text: m Len: l = ( |
             cs <- 47.
             t <- ''.
             x <- 47.
            | 
            "Here we need to feed the length in, since the integer could have
             'leading zeros'."
            t: ('' copySize: l).
            x: m.
            cs: cshift.
            l - 1 downTo: 0 Do: [|:i| 
                t at: i PutByte: (x %+ cs) asSmallInteger.  
                x: x / cs. 
            ].
            0 != x ifTrue: [error: 'not all of integer used in int2text'].
            ^ t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         randomGenerator = ( |
            | 
            "Return random number generator (for setting seed etc.)."
            ^ rand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         randomGenerator: r = ( |
            | 
            "Use r as random number generator in the future."
            rand: r.
            ^ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cryptomachine' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         text2int: textBlock = ( |
             cs <- 47.
             m <- 0.
            | 
            cs: cshift.
            textBlock  do: [ | :c | m: (m * cs) + c asByte. ].
            ^ m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         blockDecrypt: cipherTextBlock = ( |
            | 
            ^ int2text: ((text2int: cipherTextBlock) power: d Mod: modulus) 
                   Len: plainBlockSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         blockEncrypt: plainTextBlock = ( | {
                 'ModuleInfo: Module: crypto InitialContents: FollowSlot'
                
                 m <- 47.
                } 
            | 
            m: text2int: plainTextBlock.
            m >= modulus ifTrue: [ 
                error: 'overflow in text2int or too long text block.' 
            ].
            ^ int2text: (m power: e Mod: modulus) Len: cipherBlockSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         chooseKeys = ( |
            | 
            "Find and store a suitable pair of keys, e and d, for RSA encryption. 
             e is the public key and d is the private (or vice versa)."

             [ e: (rand integer: phi - p - q - 1) + p + q ] untilTrue: [ 
                 (phi gcd: e) = 1.
             ].
             publicKey: e.  "Also sets the private key."
             ^ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         chooseModulus: reps Bits: bits = ( |
             p0 <- 47.
             q0 <- 47.
            | 
            "Find and store a suitable modulus for RSA encryption. b is the 
             (minimal) number of bits in the modulus. reps is the repetition 
             count used for probabilistic primality testing. A bigger modulus 
             is safer, but also slower to find/use."

            p0: strongPrime: reps Bits: bits / 2.
            [   q0: strongPrime: reps Bits: bits / 2.  
                trace ifTrue: [ 
                    'chooseModulus: trying p0 = ' print. p0 print. 
                    ', q0 = ' print. q0 printLine.
                ].
                p0 = q0 
            ] whileTrue.
            primesP: p0 Q: q0.
            ^ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         cipherBlockSize = ( |
            | 
            "How many chars do need we to represent an integer less than modulus."
            ^ plainBlockSize + 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy randomGenerator: rand copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'Comment: Return the modulus.\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         modulus = ( |
            | ^ p * q).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'cryptomachine' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'Comment: Return phi(modulus).\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         phi = ( |
            | ^ (p - 1) * (q - 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'Comment: Return the two primes.\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         primes = ( |
            | ^ p@q).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         primesP: p0 Q: q0 = ( |
             bits <- 47.
            | 
            "Set the two primes. This also implies recalculating the modulus, phi
             and choosing suitable keys. Note: it is not verified that p and q
             are primes."

            "The minimal number of bits should be MUCH higher - like 500, but 
             bigInt's are too slow to insist on this."
            bits: 2 log: p0 * q0.
            bits <  10 ifTrue: [ error: 'Too few bits in RSA modulus.' ]. 
            bits < 500 ifTrue: [ 
                'Warning: too few bits in RSA modulus. Not safe!' printLine.
            ].
            "Insist on distinct primes, else the formula for phi will be
             different. This test is completely unnecessary for realistically
             sized random primes, but ..."
            p0 = q0 ifTrue: [ error: 'Primes must be distinct.'. ].
            p: p0.
            q: q0.
            plainBlockSize: (2 log: modulus) / typeSizes bitsPerByte.
            chooseKeys.
            ^ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         privateKey = ( |
            | 
            "Return the private key! Don't tell anybody."
            ^ d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         privateKey: d0 = ( |
            | 
            "Set the private key to d0. Computes and stores the corresponding 
             public key."
            e: d0 inverseMod: phi.
            d: d0. 
            ^ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         publicKey = ( |
            | 
            "Return the public key! Put it in the phone book."
            ^ e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         publicKey: e0 = ( |
            | 
            "Set the public key to e0. Computes and stores the corresponding 
             private key."
            d: e0 inverseMod: phi.
            e: e0. 
            ^ self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 'rsa copy' "ignore state for now").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | rsa).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'ModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: public'
        
         strongPrime: reps Bits: bits = ( |
             big <- 1.
             k <- 1.
             r <- 1.
             s <- 1.
             t <- 1.
             u <- 1.
            | 
            big: 2 power: (1 max: bits / 2).
            s: (big + (rand integer: big) nextPrime: reps Random: rand).
            trace ifTrue: [ 'strongPrime, s = ' print. s printLine].
            "We want r != s (else potential inifite loop when trying to find
             u below), so start search for t at s."
            t: (s + (rand integer: big) nextPrime: reps Random: rand).
            trace ifTrue: [ 'strongPrime, t = ' print. t printLine].
            r: (2 * t) + 1.
            [ r isPrime: reps Random: rand ] whileFalse: [ r: r + (2 * t) ].
            trace ifTrue: [ 'strongPrime, r = ' print. r printLine].
            u: ((s power: r - 1 Mod: r * s) - (r power: s - 1 Mod: r * s))
               %+ (r * s).
            u odd ifTrue: [ p: u. ] False: [ p: u + (r * s). ].
            trace ifTrue: [ 'strongPrime, p = ' print. p printLine].
            [ p isPrime: reps Random: rand ] whileFalse: [ p: p + (2 * (r * s)) ].
            ^ p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rsa' -> () From: ( | {
         'Comment: Set true to generate test output.\x7fModuleInfo: Module: crypto InitialContents: FollowSlot\x7fVisibility: private'
        
         trace = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 



 '-- Side effects'

 globals modules crypto postFileIn
