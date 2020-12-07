 '30.21.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         viewScrollMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules viewScrollMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            viewScrollMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: InitializeToExpression: (\'30.21.0\')\x7fVisibility: public'
        
         revision <- '30.21.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'desktop' -> () From: ( | {
         'Comment: When left clicking on desktop,
do we get a viewScrollMorph or a 
carpetMorph?\x7fModuleInfo: Module: viewScrollMorph InitialContents: InitializeToExpression: (true)'
        
         useViewScrollMorph <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Moving around\x7fComment: A tool for moving short distances on the desktop,
and choosing mouse buttons when on a tablet.\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         viewScrollMorph = bootstrap define: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( |
             {} = 'Comment: A morph which pops up when the desktop is clicked.

It is shaped like a circle, with two arcs coloured like the menus. 
If you drag from the circle and release, you will scroll the desktop 
(or more accurately move your view within the desktop).

If you drag but then release inside the circle, nothing happens.

If you drag onto one of the coloured patches, the next click 
will be counted as that mouse button. 

So to get a background menu, drag and release over the orange 
patch. Then click on the desktop and the background menu will come up.

To get a morph menu, drag and release over the blue patch. Then 
click on the morph you are interested in.

This isn\x19t perfect but at least it makes working on a tablet or phone 
possible, and the scrolling part is also useful on a laptop 
for moving shot distances around Kansas.

There is of course a preference to turn this off:   

    preferences desktop useViewScrollMorph: false

For moving longer distances, see the stationMorph network.\x7fModuleInfo: Creator: globals viewScrollMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: InitializeToExpression: (0@0)'
        
         cursorPoint <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         dragPoint <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'Comment: used by the middle button menu
to set the hand to follow around the
world.\x7fModuleInfo: Module: viewScrollMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         handToFollow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: InitializeToExpression: (false)'
        
         inMiddleButtonMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         inResizeMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: InitializeToExpression: (false)'
        
         inRightButtonMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isPersistent <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Moving around\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         viewScrollMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits viewScrollMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'viewScrollMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            drawStartCircleOn: c.
            inMiddleButtonMode || inRightButtonMode ifFalse: [
              drawConnectingLineOn: c.
              drawEndCircleOn: c].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         cleanupFor: h = ( |
            | 
            " Cleanup "
            h unsubscribeCursor: self.
            h world removeMorph: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyHand: h = ( |
            | copy initializeHand: h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         drawConnectingLineOn: c = ( |
            | 
            c line: dragPoint 
                To: cursorPoint - borderWidth
             Width: borderWidth
             Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         drawEndCircleOn: c = ( |
             col.
            | 
            col: color.
            (dragPoint distanceTo: cursorPoint) < minimumMove ifTrue: [col: paint named: 'lightGray'].
            c circleCenteredAt: cursorPoint Diameter: minimumMove * 2 Color: col.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: displaying\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         drawStartCircleOn: c = ( |
             leftColor.
             leftMenuOrange = paint copyRed: 0.932551 Green: 0.875855  Blue: 0.826979.
             modeColor.
             rightColor.
             rightMenuBlue = paint copyRed: 0.759531 Green: 0.839687  Blue: 0.889541.
            | 

            modeColor: color.
            leftColor: leftMenuOrange.
            rightColor: rightMenuBlue.
            inMiddleButtonMode ifTrue: [modeColor: leftMenuOrange. rightColor: leftMenuOrange].
             inRightButtonMode ifTrue: [modeColor: rightMenuBlue. leftColor: rightMenuBlue.].

            c fillCircleCenteredAt: dragPoint Diameter: minimumMove * 2 Color: (paint named: 'white').
            c circleCenteredAt: dragPoint Diameter: minimumMove * 2 Color: modeColor.

            c arcWithin: (rectangle copy center: dragPoint Size: minimumMove * 1.5) 
                   From: 150 
               Spanning: 60
                  Width: (minimumMove / 2)
                  Color: leftColor.

            c arcWithin: (rectangle copy center: dragPoint Size: minimumMove * 1.5) 
                   From: 330 
               Spanning: 60
                  Width: (minimumMove / 2)
                  Color: rightColor.


            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         forwardMiddleMouseDown: e = ( |
            | 
            e type: 'middleMouseDown'.
            e sourceHand handleMiddleMouseDown: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         forwardRightMouseDown: e = ( |
            | 
            e type: 'rightMouseDown'.
            e sourceHand handleRightMouseDown: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeHand: h = ( |
            | 
            inResizeMode: true.
            isPersistent: false.
            position: h position.
            dragPoint: h position.
            rawBox: (0@0) ## (minimumMove @ minimumMove).
            h world addMorph: self.
            beFlexible.  "make flexible for resizing"
            h world moveToFront: self.
            h subscribeCursor: self.
            handToFollow: h.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | color: (paint named: 'gray')).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: morphology\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fComment: avoid getting picked up while resizeing\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: e = ( |
            | 
            inMiddleButtonMode ifTrue: [ ^ forwardMiddleMouseDown: e ].
            inRightButtonMode  ifTrue: [ ^ forwardRightMouseDown: e  ].
            inResizeMode      ifFalse: [  ^ resend.leftMouseDown: e  ].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: e = ( |
            | 
            inResizeMode ifTrue: [ ^terminateResizingFrom: e sourceHand For: e ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fComment: avoid getting picked up while forwarding\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: e = ( |
            | 
            inMiddleButtonMode ifTrue: [ ^ resend.middleMouseDown: e].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot'
        
         minimumMove = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'viewScrollMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: e = ( |
             bottomRight.
             endRect.
             startRect.
             topLeft.
            | 
            changed.
            cursorPoint: e cursorPoint.
            startRect: rectangle copy center: dragPoint Size: minimumMove * 2.
            endRect: rectangle copy center: cursorPoint Size: minimumMove * 2.
            resizeRect: startRect union: endRect.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'ModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'viewScrollMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: viewScrollMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         terminateResizingFrom: h For: evt = ( |
             d.
            | 
            d: dragPoint distanceTo: cursorPoint.

            " Go into middle button mode? "
            " Not quite perfect but near enough:
                - not out of start circle
                - not in middle of start circle
                - not in circle from bottom point of start circle
                - not in circle from top point of start circle"
            (d < minimumMove) && 
            (d > (minimumMove / 2)) && 
            (cursorPoint x < dragPoint x) &&
            (((dragPoint copy y: (dragPoint y + minimumMove)) distanceTo: cursorPoint) > minimumMove) &&
            (((dragPoint copy y: (dragPoint y - minimumMove)) distanceTo: cursorPoint) > minimumMove)
              ifTrue: [inMiddleButtonMode: true. ^ self].

            " Go into right button mode? "
            (d < minimumMove) && 
            (d > (minimumMove / 2)) && 
            (cursorPoint x > dragPoint x) &&
            (((dragPoint copy y: (dragPoint y + minimumMove)) distanceTo: cursorPoint) > minimumMove) &&
            (((dragPoint copy y: (dragPoint y - minimumMove)) distanceTo: cursorPoint) > minimumMove)
              ifTrue: [inRightButtonMode: true. ^ self].

            " Move if we are outside minimum move area "
            (d > minimumMove) &&
            inMiddleButtonMode not &&
            inRightButtonMode not
               ifTrue: [| delta |
                  delta: dragPoint - cursorPoint.
                  world moveHand: handToFollow InWorldBy: delta].

            cleanupFor: h.
            self).
        } | ) 



 '-- Side effects'

 globals modules viewScrollMorph postFileIn
