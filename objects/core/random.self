 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot'
        
         random = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'random' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'random' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules random.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot'
        
         myComment <- 'Random number generators.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: numbers\x7fModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         randomLC = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'randomLC' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals randomLC.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         displacement <- 22001.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         modulus <- 65537.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         multiplier <- 1717.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: numbers\x7fModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         randomLC = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( |
             {} = 'Comment: This is a traits for a concrete random number generator that generates
      random numbers using a linear congruence. It is fast but not very 
       random. It may also have a rather short period.\x7fModuleInfo: Creator: traits randomLC.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'randomLC' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'randomLC' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: InitializeToExpression: (1)\x7fVisibility: private'
        
         vseed <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: numbers\x7fModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         random = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'random' -> () From: ( |
             {} = 'Comment: An abstract supertype for random generators. Ole Agesen, October 1991.\x7fModuleInfo: Creator: traits random.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         bitsPerRound = ( |
            | 
            "Return how many bits the underlying concrete random number generator
             can produce per call. "
            2 log: resolution).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         boolean = ( |
            | 
            "Return false or true."
            (integer: 2) = 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         char = ( |
            | 
            "Return a random char."
            (integer: 256) asCharacter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            "Copy and initialize with seed: 0."
            parent.copy seed: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         copySeed: s = ( |
            | 
            "Copy and initialize with seed: s."
            parent.copy seed: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         descendantResponsibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'random' -> 'descendantResponsibilities' -> () From: ( |
             {} = 'Comment: The following methods must be implemented by a descendant.\x7fModuleInfo: Creator: traits random descendantResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         basicInteger = ( |
            | 
            'Returns an integer in the range {0, 1, ..., resolution-1}.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         resolution = ( |
            | 
            'Returns one more than the biggest integer that can be returned
             from the concrete random number generator.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> 'descendantResponsibilities' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         setSeed: n = ( |
            | 
            'Sets the seed in the concrete random number generator.').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         float = ( |
            | 
            "Return a random float in the interval [0,1]."
            basicInteger /= resolution).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         histogram: n Iters: k = ( | {
                 'ModuleInfo: Module: random InitialContents: FollowSlot'
                
                 h.
                } 
            | 
            "Return a vector N long whose entries are the number of times
             out of N * K that a random integer between 0 and N-1 was that index"
            h: vector copySize: n FillingWith: 0.
            n * k do: [ | i |
                i: random integer: n.
                h at: i Put: (h at: i) successor.
            ].
            h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         integer: n = ( |
             acc <- 0.
             m <- 47.
            | 
            "Return random integer from {0, 1, ..., n-1}"
            n <= 0          ifTrue: [ error: 'n must be positive'. ].
            n <= resolution ifTrue: [ ^ basicInteger % n. ].

            "That was the easy cases. Now produce a big random integer."
            n <= maxSmallInt ifTrue: [ 
                "Optimization: avoids unnecessary overflows to bigInts."
                | shift <- 16. |
                shift: bitsPerRound.
                (((typeSizes bitSize: 'self_int') / shift) + 1) do: [
                    acc: (acc << shift) ^^ basicInteger.
                ].
            ] False: [ 
                "General case, also handles bigInts."
                m: 10 * n.
                [ acc < m ] whileTrue: [ 
                    acc: (acc * resolution) + (basicInteger % resolution).
                ].
            ].
            acc %+ n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         integerBetween: low And: hi = ( |
            | 
            "Return an integer in a particular range"
            (integer: (hi - low) + 1) + low).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'Comment: Return collection of N ints in [0..n) in a random order\x7fModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         permutation: n = ( |
             debug = bootstrap stub -> 'globals' -> 'false' -> ().
             v.
            | 
            v: vector copySize: n.
            n do: [|:i| v at: i Put: i].
            n downTo: 2 Do: [|:i. x. y|
              "v[i..n) is random AND v has each int exactly once"
              x: integer: i.

              y: v at: i pred.  v at: i pred Put: v at: x.  v at: x Put: y.

              debug ifTrue: [|check|
                check: vector copySize: n FillingWith: 0.
                v do: [|:i| check at: i Put: (check at: i) succ].
                check do: [|:a| a = 1 ifFalse: [halt]].
              ].
            ].
            v).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         pointInBoundingBox: aRect = ( |
            | 
            "returns a point in closed interval"
              (integerBetween: aRect left And: aRect right)
            @ (integerBetween: aRect top  And: aRect bottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         printableChar = ( |
            | 
            "Return a random printable character"
            (
                integerBetween: lowestPrintableChar  asByte
                           And: highestPrintableChar asByte 
            ) asCharacter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         printableString: n = ( | {
                 'ModuleInfo: Module: random InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            "Return a random printable string of length n."
            t: (mutableString copySize: n).
            n do: [|:i| t at: i Put: printableChar].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         seed: s = ( |
            | 
            "Set seed from n (integer); if n=0 current time is used instead of n.
             A sequence of random numbers must be reproducible, by reinitializing
             with the same seed."
            s = 0 ifTrue: [ setSeed: times real msec. ]
                   False: [ setSeed: s. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         sign = ( |
            | 
            "Return -1 or 1."
            (2 * (integer: 2)) - 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         sign0 = ( |
            | 
            "Return -1, 0 or 1."
            (integer: 3) - 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         string: n = ( | {
                 'ModuleInfo: Module: random InitialContents: FollowSlot'
                
                 t.
                } 
            | 
            "Return a random string of length n."
            t: (mutableString copySize: n).
            n do: [|:i| t at: i Put: char].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         basicInteger = ( |
            | 
            vseed: ((vseed * multiplier) + displacement) %+ modulus.
            vseed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         copySeed: s Modulus: mod Multiplier: mul Displacement: disp = ( |
            | 
            "Copy and set all the parameters in the random number generator.
             Prime numbers should be preferred for moduli."

            copy initSeed: s Modulus: mod Multiplier: mul Displacement: disp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         initSeed: s Modulus: mod Multiplier: mul Displacement: disp = ( |
            | 
            modulus:      mod.
            multiplier:   mul.
            displacement: disp.
            seed:         s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'random' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         resolution = ( |
            | modulus).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: private'
        
         setSeed: s = ( |
            | 
            vseed: s %+ modulus).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | vseed printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'randomLC' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            'randomLC copy' "punt saving state for now").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: system\x7fCategory: numbers\x7fModuleInfo: Module: random InitialContents: FollowSlot\x7fVisibility: public'
        
         random = bootstrap define: bootstrap stub -> 'globals' -> 'random' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'storeStringNeeds' From:
             globals randomLC copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'random' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals random.

CopyDowns:
globals randomLC. copy 
SlotsToOmit: storeStringNeeds.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'random' -> () From: ( | {
         'ModuleInfo: Module: random InitialContents: FollowSlot'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'random' -> ().
        } | ) 



 '-- Side effects'

 globals modules random postFileIn
