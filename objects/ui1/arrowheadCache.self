 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowheadCache = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'arrowheadCache' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals arrowheadCache.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowheadCache = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits arrowheadCache.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'arrowheadCache' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeName = 'arrowheadCache'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         repNegNeg <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         repNegPos <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         repPosNeg <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         repPosPos <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
        
         arrowheadCache = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'arrowheadCache' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'arrowheadCache' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules arrowheadCache.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
        
         myComment <- 'Part of the prototype user interface.\"
            \"Changed by Ungar according to Chang to shrink cache for performance 3/91'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         cacheSize: length = ( |
            | 10 * length).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAll = ( |
            | "hack for filing out"
            clone repCopy: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         fillInHoles = ( |
            | 
            fillInHoles: repPosPos.
            fillInHoles: repPosNeg.
            fillInHoles: repNegPos.
            fillInHoles: repNegNeg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fComment: assumes that first and last elements of rep are filled\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         fillInHoles: rep = ( |
             runFirst <- 0.
             runLast <- 0.
             runMiddle <- 0.
            | 
            [ | :exit. ahf. ahl. |
                runFirst: nextHole: rep StartingAt: runLast.
                runFirst ifNil: [ exit value ].
                runLast: (nextFilled: rep StartingAt: runFirst) predecessor.
                runMiddle: ((runLast successor - runFirst) / 2) + runFirst.

                ahf: rep at: runFirst pred.
                ahl: rep at: runLast succ.
                runFirst upTo: runMiddle Do: [ | :i | rep at: i Put: ahf ].
                runMiddle  to: runLast   Do: [ | :i | rep at: i Put: ahl ].
            ] loopExit.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         fillLength: l Width: w = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 max = 50.
                } 
            | 
            max do: [ | :i |
                insertAt: (indexForDx: i Dy: max)
                    TriangleVector: vectorForDx: i Dy: max
                            Length: l Width: w / 2.
                insertAt: (indexForDx: max Dy: i)
                    TriangleVector: vectorForDx: max Dy: i
                            Length: l Width: w / 2. ].
            fillInHoles.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: accessing\x7fComment: dx and dy should be positive\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         indexForDx: dx Dy: dy = ( |
            | 
            0 = dx ifTrue:[ ^ repPosPos lastKey ].
            ((dy /= dx) * 10) asInteger min: repPosPos lastKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         insertAt: index TriangleVector: vec = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 p0.
                }  {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 p1.
                }  {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 p2.
                } 
            | 
            p0: vec at: 0.
            p1: vec at: 1.
            p2: vec at: 2.
            insertIn: repPosPos At: index
                P0: p0 P1: p1 P2: p2.
            insertIn: repPosNeg At: index
                P0: p0 P1: p1 xAxisReflect P2: p2 xAxisReflect.
            insertIn: repNegPos At: index
                P0: p0 P1: p1 yAxisReflect P2: p2 yAxisReflect.
            insertIn: repNegNeg At: index P0: p0
                P1: p1 xAxisReflect yAxisReflect
                P2: p2 xAxisReflect yAxisReflect.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         insertIn: rep At: index P0: p0 P1: p1 P2: p2 = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 triangle.
                } 
            | 
            triangle: vector copySize: 3.
            triangle at: 0 Put: p0.
            triangle at: 1 Put: p1.
            triangle at: 2 Put: p2.
            rep at: index Put: triangle.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         makeLength: length Width: width = ( |
            | 
            repCopy: length.
            fillLength: length Width: width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         nextCondition: block Of: rep StartingAt: index = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            i: index.
            [ block value: rep at: i ] whileFalse: [
                i: i successor.
                i > rep lastKey ifTrue: [ ^ nil ] ].
            i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         nextFilled: rep StartingAt: index = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 i.
                } 
            | 
            nextCondition: [ | :e | nil != e ] Of: rep StartingAt: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         nextHole: rep StartingAt: index = ( |
            | 
            nextCondition: [ | :e | e isNil ] Of: rep StartingAt: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         repCopy: length = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 repSize.
                } 
            | 
            repSize: cacheSize: length.
            repPosPos: vector copySize: repSize.
            repPosNeg: vector copySize: repSize.
            repNegPos: vector copySize: repSize.
            repNegNeg: vector copySize: repSize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         retrieveDx: dx Dy: dy = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 li.
                } 
            | 
            li: repPosPos lastKey.
            dx < 0 ifTrue: [
                dy < 0 ifTrue: [
                    repNegNeg at: indexForDx: dx negate Dy: dy negate.
                ] False: [
                    repNegPos at: indexForDx: dx negate Dy: dy ].
            ] False: [
                dy < 0 ifTrue: [
                    repPosNeg at: indexForDx: dx Dy: dy negate.
                ] False: [
                    repPosPos at: indexForDx: dx Dy: dy ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | repPosPos size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringIfFail: fb = ( |
            | "another file out hack"
            size = 0 
                ifFalse: [ fb value: 'not empty']
                   True: [ prototypeName, ' copyRemoveAll']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringNeeds = ( |
            | prototypeName sendTo: lobby).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowheadCache' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: arrowheadCache InitialContents: FollowSlot\x7fVisibility: private'
        
         vectorForDx: dx Dy: dy Length: length Width: width = ( | {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 p1.
                }  {
                 'ModuleInfo: Module: arrowheadCache InitialContents: FollowSlot'
                
                 p2.
                } 
            | 
            (dx = 0)  ||  [dy = 0] ifTrue: [
                dx = 0 ifTrue: [
                    p1:    width @ (dy sign  *  length) negate.
                    p2:    width negate @ (dy sign  *  length) negate.
                ] False: [
                    p1:   (dx sign  *  length) negate @  width.
                    p2:   (dx sign  *  length) negate @  width negate. ]
            ] False: [ | m. denom. rev. |
                m:      (dy /= dx) absoluteValue.
                denom:  m square succ squareRoot.
                rev:    (dx sign  *  dy sign) negate.
                p1: (((dx sign negate * length) + (m * width)) / denom)
                    asInteger
                  @ (((dy sign negate * m * length) + (rev * width)) / denom)
                    asInteger.
                p2: (((dx sign negate * length) - (m * width)) / denom)
                    asInteger
                  @ (((dy sign negate * m * length) - (rev * width)) / denom) 
                    asInteger. ].
            (((vector copySize: 3) at: 0 Put: 0@0)
                                   at: 1 Put: p1)
                                   at: 2 Put: p2).
        } | ) 



 '-- Side effects'

 globals modules arrowheadCache postFileIn
