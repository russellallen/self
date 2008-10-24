 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot'
        
         slab = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'slab' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'slab' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules slab.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         slab = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slab' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slab.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         back <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         front <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         slab = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slab' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slab.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slab' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         storeStringNeeds = bootstrap stub -> 'globals' -> 'slab' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot'
        
         absoluteFrontFace = ( |
            | front).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         absoluteLocationForArrowhead: arr = ( |
            | edgePointClosestTo: arr tail).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot'
        
         bound = ( |
            | (front left @ back top) #! (back right @ front bottom)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromPoint: pt = ( | {
                 'ModuleInfo: Module: slab InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: pt #! pt.
            copyFront: r Back: r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromRect: rect = ( |
            | copyFront: rect Back: rect).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFront: f Back: b = ( |
            | (copy front: f) back: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         copyX: x Y: y = ( |
            | copyFront: x   Back: y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: bm UIColors: uiColors = ( |
            | 
            bm fillRectangle: front Color: uiColors body.

            bm fillPolygon: rightSide Color: uiColors bodyDark.
            bm fillPolygon: top       Color: uiColors bodyLight.

            "highlight left edge"
            bm line: front bottomLeft To: front topLeft Color: uiColors bodyLight.
            bm line: front topLeft    To: back  topLeft Color: uiColors bodyLight.

            "darken bottom edge"
            bm line: front bottomLeft
                 To: front bottomRight
              Width: 2
              Color: uiColors bodyDark.

            bm point: front bottomLeft Color: uiColors bodyDark.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: private'
        
         edgePointClosestTo: p = ( |
            | absoluteFrontFace pointClosestToPoint: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         encloses: aSlab = ( |
            | 
            (front encloses: aSlab front)  &&  [back encloses: aSlab back]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pair' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot'
        
         rightSide = ( | {
                 'ModuleInfo: Module: slab InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: vector copySize: 4.
            r at: 0 Put: front topRight.
            r at: 1 Put: front bottomRight.
            r at: 2 Put: back  bottomRight.
            r at: 3 Put: back  topRight.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: private'
        
         separator = ' [] '.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            front printString, ', ', back printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot'
        
         top = ( | {
                 'ModuleInfo: Module: slab InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            r: vector copySize: 4.
            r at: 0 Put: front topLeft.
            r at: 1 Put: front topRight.
            r at: 2 Put: back  topRight.
            r at: 3 Put: back  topLeft.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         translateBy: pr = ( |
            | copyFront: (front translateBy: pr) 
            Back:  back  translateBy: pr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         x = ( |
            | front).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slab' -> () From: ( | {
         'ModuleInfo: Module: slab InitialContents: FollowSlot\x7fVisibility: public'
        
         y = ( |
            | back).
        } | ) 



 '-- Side effects'

 globals modules slab postFileIn
