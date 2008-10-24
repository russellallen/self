 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot'
        
         point = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'point' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'point' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules point.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot'
        
         myComment <- 'Points are cartesian x-y pairs.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         point = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'point' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals point.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         point = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'point' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits point.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'point' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         x <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         y <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         # pt = ( |
            | rectangle from: self To: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'Category: ui1BackwardsCompatibility\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         #! pt = ( |
            | oldStyleRectangle from: self To: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         ## sz = ( |
            | rectangle from: self To: + sz).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'Category: ui1BackwardsCompatibility\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         ##! sz = ( |
            | oldStyleRectangle from: self To: + sz maxPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         alignToGrid: s = ( |
            | 
            ((x / s x) * s x) @ 
            ((y / s y) * s y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         asRectangle = ( |
            | (0@0) # self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         copyX: x Y: y = ( |
            | (clone x: x) y: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         isImmutableForFilingOut = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'Category: ui1BackwardsCompatibility\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         maxPoint = ( |
            | x predecessor @ y predecessor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         normalize = ( |
            | asFloat / r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pair' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         r = ( |
            | (x square + y square) squareRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'Category: ui1BackwardsCompatibility\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         rect = ( |
            | (0@0) #! maxPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         restrictTo: rect = ( | {
                 'ModuleInfo: Module: point InitialContents: FollowSlot'
                
                 xr.
                }  {
                 'ModuleInfo: Module: point InitialContents: FollowSlot'
                
                 yr.
                } 
            | 
            xr: x.
            yr: y.
            x  <  rect left   ifTrue: [ xr:  rect left   ].
            x  >  rect right  ifTrue: [ xr:  rect right  ].
            y  <  rect top    ifTrue: [ yr:  rect top    ].
            y  >  rect bottom ifTrue: [ yr:  rect bottom ].
            xr @ yr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         rho: r Theta: t = ( |
            | 
            (r * t cos) @ (r * t sin)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         rotateBy: radians = ( |
             r.
             t.
            | 
            r: square squareRoot.
            t: theta + radians.
            (r * t cos) @ (r * t sin)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         separator = '@'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = ( |
            | point).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: private'
        
         storeStringWorks = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'Comment: Angle in radians, in [-pi .. pi)\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         theta = ( |
            | 
            y arcTan: x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'Comment: Angle in degrees, in [0..360)\x7fModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         thetaDegrees = ( |
            | 
            (theta * (180.0 /= pi)) %+ 360.0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         translateBy: pt = ( |
            | + pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         xAxisReflect = ( |
            | copy y: y negate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'point' -> () From: ( | {
         'ModuleInfo: Module: point InitialContents: FollowSlot\x7fVisibility: public'
        
         yAxisReflect = ( |
            | copy x: x negate).
        } | ) 



 '-- Side effects'

 globals modules point postFileIn
