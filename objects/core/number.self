 'Sun-$Revision: 30.14 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: number InitialContents: FollowSlot'
        
         number = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'number' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'number' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules number.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: number InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: number InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: system\x7fCategory: numbers\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         number = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'number' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits number.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fComment: Like modulus, but always returns
a positive result (for a positive divisor).\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         %+ a = ( |
             r.
            | 
            r: % a.
            r >= 0  ifTrue: r False: [a absoluteValue + r]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteValue = ( |
            | >= zero ifTrue: [ self ] False: [ negate ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fCategory: time arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: private'
        
         addTime: t = ( |
            | t addMsec: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         asBoolean = ( |
            | != zero).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallInteger = ( |
            | 
            asSmallIntegerIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         asSmallIntegerIfPossible = ( |
            | asSmallIntegerIfFail: [self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: shortcuts\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         double = ( |
            | * two).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: shortcuts\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         half = ( |
            | / two).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         interpolate: p From: x = ( |
            | 
            "the following is an optimization that avoids coercions. Old version:
                     ^ interpolate: p From: x = ((* (1.0 - p)) + (x * p))."
            (asFloat * (1.0 - p asFloat)) + (x asFloat * p asFloat)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         inverse = ( |
            | 1.0 /= asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fComment: Find the smallest non-negative integer m s.t. (power: m) <= a.\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         log: a = ( | {
                 'ModuleInfo: Module: number InitialContents: FollowSlot'
                
                 e <- 1.
                }  {
                 'ModuleInfo: Module: number InitialContents: FollowSlot'
                
                 m <- 0.
                } 
            | 
            a <= zero ifTrue: [ error: 'log: negative or zero argument'. ].
            <= one    ifTrue: [ error: 'log: receiver <= 1'. ].
            [ e <= a ] whileTrue: [ e: * e.   m: m +1. ].
            ^ m - 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         logBase: b = ( |
            | 
            naturalLog /= b naturalLog).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         max: x = ( |
            | > x ifTrue: self False: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         mean: x = ( |
            | ( + x) /~ two).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         min: x = ( |
            | < x ifTrue: self False: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         negate = ( |
            | zero - self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: children\x7fComment: for efficiency (avoid conversions)\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         one = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'ModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'orderedOddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fComment: raise receiver to the a\'th power\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         power: a = ( |
            | a reversePower: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         pred = ( |
            | predecessor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         predecessor = ( |
            | - one).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fComment: a simple recursion benchmark\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         recur = ( |
            | > 0 ifTrue: [ pred recur.  pred recur. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         roundDownTo: modulus = ( |
            | 
            (/- modulus) * modulus).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: coercions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         roundUpTo: modulus = ( |
            | 
            (/+ modulus) * modulus).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         sign = ( |
            | compare: zero IfLess: -1 Equal: 0 Greater: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         square = ( |
            | * self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: benchmarks\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         squeakBenchFib = ( |
            | 
             "Handy send-heavy benchmark"
            "(result // seconds to run) = approx calls per second"
            " | r t |
              t _ Time millisecondsToRun: [r _ 26 benchFib].
              (r * 1000) // t"
            "138000 on a Mac 8100/100"
             < 2
                    ifTrue: [1] 
                      False: [( - 1) squeakBenchFib + ( - 2) squeakBenchFib]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: benchmarks\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         squeakSieveBench = ( |
             count.
             size = 8190.
            | 
            "Handy bytecode-heavy benchmark"
            "(500000 // time to run) = approx bytecodes per second"
            "5000000 // (Time millisecondsToRun: [10 benchmark]) * 1000"
            "3059000 on a Mac 8100/100"
            1 to: self Do:
              [|:iter. flags |
               count: 0.
               flags: vector copySize: size succ FillingWith: true.
               1 to: size Do:
                 [|:i. |
                  (flags at: i) ifTrue:
                     [ |prime. k|
                       prime: i+1.
                       k: i + prime.
                       [k <= size] whileTrue:
                           [ flags at: k Put: false.
                             k: k + prime].
                       count: count + 1]]].
            count).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fCategory: time arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: private'
        
         subtractTime: t = ( |
            | t subtractMsec: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         succ = ( |
            | successor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         successor = ( |
            | + one).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         sumFrom: start To: end = ( | {
                 'ModuleInfo: Module: number InitialContents: FollowSlot'
                
                 sum.
                } 
            | 
            sum: self.
            start to: end Do: [ | :i | sum: sum + i ].
            sum).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: functions\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         sumTo: end = ( | {
                 'ModuleInfo: Module: number InitialContents: FollowSlot'
                
                 sum <- 0.
                } 
            | 
            to: end Do: [ | :i | sum: sum + i ].
            sum).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: benchmarks\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         tinySqueakBenchmarks = ( |
             n1 <- 1.
             n2.
             r.
             t1.
             t2.
            | 
                   "Report the results of running the two tiny Squeak benchmarks.
                   ar 9/10/1999: Adjusted to run at least 1 sec to get more stable results"
                   "0 tinySqueakBenchmarks"
            "Squeak:"
                   "On a 600MHz iBook:  59095106 bytecodes/sec; 1841680 sends/sec"
                   "On a 292 MHz G3 Mac: 22727272 bytecodes/sec; 984169 sends/sec"
                   "On a 400 MHz PII/Win98:  18028169 bytecodes/sec; 1081272 sends/sec"

                   [t1:  [n1 squeakSieveBench] realTime.
                    t1 < 1000] whileTrue:[n1: n1 * 2]. "Note: #benchmark's runtime is about O(n)"

                   n2: 28.
                   [t2: [r: n2 squeakBenchFib] realTime.
                   t2 < 1000] whileTrue:[n2: n2 + 1]. 
                   "Note: #benchFib's runtime is about O(k^n),
                           where k is the golden number = (1 + 5 sqrt) / 2 = 1.618...."

                   (((n1 * 500000) / 1000) / t1) printString, ' Mbytecodes/sec; ',
                     ((r / 1000) / t2) printString, ' Msends/sec').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: children\x7fComment: for efficiency (avoid conversions)\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         two = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'number' -> () From: ( | {
         'Category: children\x7fComment: for efficiency (avoid conversions)\x7fModuleInfo: Module: number InitialContents: FollowSlot\x7fVisibility: public'
        
         zero = 0.
        } | ) 



 '-- Side effects'

 globals modules number postFileIn
