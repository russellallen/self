 '$Revision: 30.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: integerIteration InitialContents: FollowSlot'
        
         integerIteration = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules integerIteration.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () From: ( | {
         'ModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () From: ( | {
         'ModuleInfo: Module: integerIteration InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () From: ( | {
         'ModuleInfo: Module: integerIteration InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () From: ( | {
         'ModuleInfo: Module: integerIteration InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () From: ( | {
         'ModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'integerIteration' -> () From: ( | {
         'ModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | 0    to: pred By:  1 Do: block. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         downTo: end By: step Do: block = ( |
            | to: end By: step negate Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         downTo: end Do: block = ( |
            | to: end By: -1 Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fComment: Evaluate eb for [0, self).
If true is returned, evaluate fb with the element and index,
and return the result.  Otherwise, evaluate `fail\' and return
the result.\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         findFirst: eb IfPresent: fb IfAbsent: fail = ( |
            | 
            do: [|:v. :k|
                (eb value: v With: k) ifTrue: [^fb value: v With: k].
            ].
            fail value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         reverseDo: block = ( |
            | pred to: 0    By: -1 Do: block. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
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
	 the value to the block and executing the block each time\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         to: end By: step Do: block = ( |
            | 
            0 < step ifTrue: [ ^ to: end ByPositive: step Do: block ].
            0 > step ifTrue: [ ^ to: end ByNegative: step Do: block ].
            error: 'step is zero in to:By:Do: loop').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
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
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
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
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         to: end Do: block = ( |
            | to: end  By: 1 Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         upTo: end By: step Do: block = ( |
            | 
            to: end predecessor By: step Do: block).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'integer' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: integerIteration InitialContents: FollowSlot\x7fVisibility: public'
        
         upTo: end Do: block = ( |
            | to: end predecessor Do: block).
        } | ) 



 '-- Side effects'

 globals modules integerIteration postFileIn
