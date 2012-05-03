 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         menu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals menu.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         body <- bootstrap stub -> 'globals' -> 'slab' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         columnExtent <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         currentItemNumber <- -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         cursorLocation <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'Comment: redundant, but convenient\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         itemExtent <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         itemsPerColumn <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         numberOfColumns <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         menu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits menu.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceBound <- ((0)@(0)) #! ((1)@(1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         truncatedItems <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         world <- bootstrap stub -> 'globals' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot'
        
         menu = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'menu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'menu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules menu.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: accessingGlobals\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         animator = ( |
            | world animator).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         baseThickness = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         bound = ( |
            | body bound).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         boundOfItem: i = ( |
            | 
            "need these fudge factors because rectangles do not draw
             their right and bottom edges"
                (textBox origin  +  (offsetOfItem: i) + (-1 @ -1))
            ##! (itemExtent      +  (3 @ 1))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: accessingGlobals\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         boxSizing = ( |
            | world boxSizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         checkForButtonUp = ( |
            | cursor queuedButtonUp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         computeBody = ( | {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 faceExtent.
                } 
            | 
            faceExtent: ((columnExtent + marginWidth) *
                         (numberOfColumns @ 1)) + marginWidth.

            body: body copyFront: (0 @ baseThickness) ##! faceExtent
                            Back: (baseThickness @ 0) ##! faceExtent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         computeExtent = ( |
            | 
            items do: [ | :it | itemExtent: itemExtent max: itemSize: it ].
            numberOfColumns: (itemExtent y * items size) /+ windowBitmap height.
            itemsPerColumn: items size /+ numberOfColumns.
            columnExtent: itemExtent * (1 @ itemsPerColumn).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         computeGeometry = ( |
            | 
            computeExtent.
            computeBody.
            placeBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         constrainBodyToWindow = ( | {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 bb.
                }  {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 bottomOff.
                }  {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 fbr.
                }  {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 leftOff.
                }  {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 rightOff.
                }  {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 topOff.
                } 
            | 
            "make sure menu stays within boundaries of window"
            fbr: windowBitmap size rect.
            bb: body bound.
            leftOff:   0 max: fbr left   - bb  left.
            rightOff:  0 max: bb  right  - fbr right.
            topOff:    0 max: fbr top    - bb  top.
            bottomOff: 0 max: bb  bottom - fbr bottom.
            body:
              body translateBy: (leftOff @ topOff) - (rightOff @ bottomOff).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         createFromBound: sbnd Items: itms World: w = ( |
            | 
            ((sourceBound: sbnd) items: itms) world: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         currentSelection = ( |
            | items at: currentItemNumber).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: accessingGlobals\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         cursor = ( |
            | world cursor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         draw = ( |
            | 
            body drawOn: windowBitmap UIColors: uiColors.
            items size do: [|:i| drawFeaturesOfItem: i Color: uiColors text].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawFeaturesOfItem: i Color: c = ( |
            | drawTextOfItem: i Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawHighlighting: i = ( |
            | 
            draw.
            highlightItem: i.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawItem: i TextColor: tc BackgroundColor: bc = ( |
            | 
            i < 0 ifTrue: [^self].
            windowBitmap fillRectangle: (boundOfItem: i) Color: bc.
            drawFeaturesOfItem: i Color: tc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         drawTextOfItem: i Color: c = ( | {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 it.
                } 
            | 
            it: items at: i.
            windowBitmap text: (itemName: it)
                           At: (textLocationOfItem: i)
                         Font: (itemFont: it)
                        Color: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         feedbackAt: p = ( | {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 sel <- 0.
                } 
            | 
            sel: selectAt: p IfSelected: [|:i| i] IfNone: noSelection.
            sel = currentItemNumber ifFalse: [
                unhighlightItem: currentItemNumber.
                highlightItem: sel.
                currentItemNumber: sel. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         highlightItem: i = ( |
            | 
                   drawItem: i
                  TextColor: uiColors text
            BackgroundColor: uiColors bodyLight.
            world syncGraphics).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: items\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         itemFont: it = ( |
            | boxSizing menuFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: items\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         itemName: it = ( |
            | it).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         itemSize: it = ( |
            | (itemFont: it) sizeOfString: it).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: items\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         items = ( |
            | truncatedItems).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: items\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         items: aCol = ( |
            | 
            truncatedItems: truncatedItems copySize: aCol size.
            aCol asVector mapBy: [|:s| 
                s findFirst: [|:c| '\n' = c]
                  IfPresent: [|:v. :k| s copySize: k]
                   IfAbsent: [s]
            ] Into: truncatedItems.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         marginWidth = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         noCurrentSelection = ( |
            | currentItemNumber = noSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         noSelection = -1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         offsetOfItem: i = ( |
            | 
            ((i /- itemsPerColumn) @ (i % itemsPerColumn)) *
            (itemExtent addX: marginWidth)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         originSlab = ( |
            | slab copyFromRect: sourceBound).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'ModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         placeBody = ( |
            | 
            placeBodyInDesiredLocation.
            constrainBodyToWindow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         placeBodyInDesiredLocation = ( |
            | 
            body: body translateBy: cursorLocation - body front center).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         select: selBlock IfNone: noneBlock = ( |
            | 
            world eraseArrowLayers.
            checkForButtonUp ifTrue: [
                world prepareToDrawOnAll.
                ^ noneBlock value ].
            setup.
            world syncGraphics.
            checkForButtonUp ifTrue: [
                takedown.
                world prepareToDrawOnAll.
                ^ noneBlock value. ].
            feedbackAt: cursor location.
            world syncGraphics.
            selectAfterSetup: selBlock IfNone: noneBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         selectAfterSetup: selBlock IfNone: noneBlock = ( | {
                 'ModuleInfo: Module: menu InitialContents: FollowSlot'
                
                 r.
                } 
            | 
            cursor while: [ cursor anyButtonDown ] Do: [
                feedbackAt: cursor location.
            ].
            r: cursor location.
            takedown.
            world prepareToDrawOnAll.
            selectAt: r IfSelected: [ | :n | selBlock value: items at: n ]
                            IfNone: noneBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAt: p IfSelected: selBlock IfNone: noneBlock = ( |
            | 
            (textBox includes: p) ifTrue: [ | n |
                n:  (p - textBox topLeft) /- itemExtent dotProduct:
                    itemsPerColumn @ 1.
                n < items size ifTrue: [^selBlock value: n].
            ].
            noneBlock value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         setup = ( |
            | 
            cursorLocation: cursor location.
            computeGeometry.
            world myUI installColormap0.
            zoom.
            world prepareToDrawOnAcetate.
            draw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         takedown = ( |
            | 
            unzoom.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         textBox = ( |
            | body front indent: marginWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: bounding\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         textLocationOfItem: i = ( |
            | textBox origin + offsetOfItem: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: accessingGlobals\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         uiColors = ( |
            | world uiColors).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         unhighlightItem: i = ( |
            | 
                   drawItem: i
                  TextColor: uiColors text
            BackgroundColor: uiColors body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         unzoom = ( |
            | animator zoomSlab: body To: originSlab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: accessingGlobals\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: private'
        
         windowBitmap = ( |
            | world windowBitmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'menu' -> () From: ( | {
         'Category: animating\x7fModuleInfo: Module: menu InitialContents: FollowSlot\x7fVisibility: public'
        
         zoom = ( |
            | animator zoomSlab: originSlab To: body).
        } | ) 



 '-- Side effects'

 globals modules menu postFileIn
