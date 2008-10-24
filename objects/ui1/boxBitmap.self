 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         boxBitmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals boxBitmap.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         backBound <- ((0)@(0)) # ((1)@(1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         background <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         desiredSize <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         drawOffset <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         frontBound <- ((0)@(0)) # ((1)@(1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'Comment: _ hack for resize feedback\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         mask <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         boxBitmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits boxBitmap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         saveUnder <- bootstrap stub -> 'globals' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         uiColors <- bootstrap stub -> 'globals' -> 'uiColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         boxBitmap = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'boxBitmap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'boxBitmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules boxBitmap.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         asSlab = ( |
            | 
            slab copyFront: (frontBound translateBy: location)
                      Back: backBound translateBy: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         bounds: size Depth: depth Skew: skew = ( | {
                 'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
                
                 corner.
                }  {
                 'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
                
                 depthPt.
                } 
            | 
            corner: size maxPoint.
            depthPt: depth maxPoint.
            frontBound:  (0 @ depthPt y)
                         #! ((corner x - depthPt x) @ corner y).
            backBound:   ((depthPt x + skew) @ 0)
                         #! (corner x @ (corner y - depthPt y - skew)).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         createDepth: depth Skew: skew UIColors: uic = ( |
            | 
            createSize: size Depth: depth Skew: skew Offset: 0@0 UIColors: uic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         createDepth: depth UIColors: uic = ( |
            | 
            createDepth: depth Skew: 0 UIColors: uic).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         createSize: size Depth: depth Skew: skew Offset: offset UIColors: uic = ( |
            | 
            drawOffset: offset.
            desiredSize: size.
            uiColors: uic.
            bounds: desiredSize Depth: depth Skew: skew.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         draw = ( |
            | 
            drawFront.
            drawTop.
            drawSide.
            drawHighlights.
            drawCornersAndMask.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         drawCornersAndMask = ( | {
                 'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
                
                 corner.
                } 
            | 
            mask fillRectangle: desiredSize rect Color: uiColors zeros.
            corner: vector copySize: 3.
            corner at: 0 Put: frontBound topLeft + drawOffset.
            corner at: 1 Put: backBound  topLeft + drawOffset.
            corner at: 2 Put: drawOffset.
            fillPolygon: corner Color: uiColors transparent.
            mask fillPolygon: corner Color: uiColors ones.
            corner at: 0 Put: frontBound bottomRight + drawOffset.
            corner at: 1 Put: backBound  bottomRight + drawOffset.
            corner at: 2 Put: desiredSize maxPoint + drawOffset.
            fillPolygon: corner Color: uiColors transparent.
            mask fillPolygon: corner Color: uiColors ones.
            "to make up for fillPolygon doing polygon tiling"
            polygon: corner Color: uiColors transparent.
            mask polygon: corner Color: uiColors ones.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         drawFront = ( |
            | 
            fillRectangle: (frontBound translateBy: drawOffset)
                    Color: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         drawHighlights = ( |
            | 
             "highlight left edge"
             line: frontBound bottomLeft + drawOffset
               To: frontBound topLeft + drawOffset
            Color: uiColors bodyLight.
             line: frontBound topLeft + drawOffset
               To: backBound  topLeft + drawOffset
            Color: uiColors bodyLight.
             "darken bottom edge"
             line: (frontBound bottomLeft  + (1@ -1)) + drawOffset
               To: (frontBound bottomRight + (0@ -1)) + drawOffset
            Color: uiColors bodyDark.
             line: frontBound bottomLeft + drawOffset
               To: frontBound bottomRight + drawOffset
            Color: uiColors bodyDark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         drawSide = ( | {
                 'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
                
                 side.
                } 
            | 
            side: vector copySize: 4.
            side at: 0 Put: frontBound topRight + drawOffset.
            side at: 1 Put: backBound  topRight + drawOffset.
            side at: 2 Put: backBound  bottomRight + drawOffset.
            side at: 3 Put: frontBound bottomRight + drawOffset.
            fillFullPolygon: side Color: uiColors bodyDark).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         drawTop = ( | {
                 'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot'
                
                 top.
                } 
            | 
            top: vector copySize: 4.
            top at: 0 Put: frontBound topLeft + drawOffset.
            top at: 1 Put: backBound  topLeft + drawOffset.
            top at: 2 Put: backBound  topRight + drawOffset.
            top at: 3 Put: frontBound topRight + drawOffset.
            fillPolygon: top Color: uiColors bodyLight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'Category: creating\x7fComment: space optimization: don\'t allocate another bitmap for saveunder\x7fModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: public'
        
         noSaveUnder = ( |
            | 
            saveUnder: ( | copyFor: w Size: d = (self). release = (self). | )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'boxBitmap' -> () From: ( | {
         'ModuleInfo: Module: boxBitmap InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'movingShape' -> ().
        } | ) 



 '-- Side effects'

 globals modules boxBitmap postFileIn
