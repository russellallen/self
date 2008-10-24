 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot'
        
         pair = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pair' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pair' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pair.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot'
        
         myComment <- 'A pair is an immutable x-y pair.  Examples are points and rectangles.\"
            \"Added double-dispatching for more ops, also the aspect ratio messsage
             4/91. dmu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         pair = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pair' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pair.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         pair = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pair' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pair.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pair' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         x <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         y <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         * p = ( |
            | p pairTimes:  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         + p = ( |
            | p pairPlus:   self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         - p = ( |
            | p pairMinus:  self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         / p = ( |
            | p pairDivide: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         /+ p = ( |
            | p pairDivideCeiling: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         /- p = ( |
            | p pairDivideFloor:   self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         /= p = ( |
            | p pairDivideExact: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         /~ p = ( |
            | p pairDivideRound: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | x equalsPair: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: comparing\x7fComment: pairs are immutable\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         == x = ( |
            | = x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         addX: n = ( |
            | copyX: x + n Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         addY: n = ( |
            | copyX: x Y: y + n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: compatabilityWithNumbers\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         asFloat = ( |
            | copyX: x asFloat   Y: y asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: compatabilityWithNumbers\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         asInteger = ( |
            | copyX: x asInteger Y: y asInteger).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         aspectRatio = ( |
            | y /= x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: compatabilityWithNumbers\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         ceil = ( |
            | copyX: x ceil      Y: y ceil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         copyX: x Y: y = ( |
            | (copy x: x) y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         crossProduct: p = ( |
            | 
            (x * p y) - (y * p x)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fComment: Return the Pythagoriean distance to pair p.\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         distanceTo: p = ( |
            | ( - p ) square squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: iteration\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | 
            x do: [ | :l |
              y do: [ | :r |
                block value: l With: r ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         dotProduct: p = ( |
            | (x * p x) + (y * p y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsPair: pr = ( |
            | (x = pr x)  &&  [y = pr y]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: compatabilityWithNumbers\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         floor = ( |
            | copyX: x floor     Y: y floor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         half = ( |
            | copyX: x half Y: y half).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: comparing\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | x hash ^^ y hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         inverse = ( |
            | 
            (1.0 / x) @ (1.0 / y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         manhattanDistanceTo: p = ( |
            | 
            (x - p x) absoluteValue + (y - p y absoluteValue)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         max: p = ( |
            | p pairMax: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         mean: p = ( |
            | p pairMean: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         min: p = ( |
            | p pairMin: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: pair InitialContents: FollowSlot'
        
         multiplyBigInteger: a = ( |
            | copyX: x * a  Y: y * a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fComment: _\x7fModuleInfo: Module: pair InitialContents: FollowSlot'
        
         multiplyFloat: a = ( |
            | copyX: x * a  Y: y * a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fComment: double dispatching for multiplying by a number: _\x7fModuleInfo: Module: pair InitialContents: FollowSlot'
        
         multiplySmallInteger: a = ( |
            | copyX: x * a  Y: y * a).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: compatabilityWithNumbers\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         negate = ( |
            | copyX: x negate    Y: y negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairDivide: p = ( |
            | p copyX: p x / x  Y: p y / y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairDivideCeiling: p = ( |
            | p copyX: p x /+ x  Y: p y /+ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairDivideExact: p = ( |
            | p copyX: p x /= x  Y: p y /= y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairDivideFloor: p = ( |
            | p copyX: p x /- x  Y: p y /- y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairDivideRound: p = ( |
            | p copyX: p x /~ x  Y: p y /~ y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairMax: p = ( |
            | p copyX: (p x max: x)  Y: p y max: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairMean: p = ( |
            | p copyX: (p x mean: x) Y: p y mean: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairMin: p = ( |
            | p copyX: (p x min: x)  Y: p y min: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairMinus: p = ( |
            | p copyX: p x - x  Y: p y - y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairPlus: p = ( |
            | p copyX: p x + x  Y: p y + y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         pairTimes: p = ( |
            | p copyX: p x * x  Y: p y * y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         printString = ( |
            | x printString, separator, y printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: compatabilityWithNumbers\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         round = ( |
            | copyX: x round     Y: y round).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         square = ( |
            | dotProduct: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | 
            storeStringWorks ifTrue: [
                '(',
                (x storeStringIfFail: [|:e| ^fb value: e]),
                ')',
                separator,
                '(',
                (y storeStringIfFail: [|:e| ^fb value: e]),
                ')'
            ] False: [fb value: 'storeString does not work for this child of pair']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'ModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringWorks = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         subtractX: n = ( |
            | copyX: x - n Y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: arithmetic\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         subtractY: n = ( |
            | copyX: x Y: y - n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         swap = ( |
            | copyX: y Y: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pair' -> () From: ( | {
         'Category: compatabilityWithNumbers\x7fModuleInfo: Module: pair InitialContents: FollowSlot\x7fVisibility: public'
        
         truncate = ( |
            | copyX: x truncate  Y: y truncate).
        } | ) 



 '-- Side effects'

 globals modules pair postFileIn
