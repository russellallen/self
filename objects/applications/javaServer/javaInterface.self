 '$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaCachedObjectID = ( |
            | 
            self _AddSlots: (| javaCachedObjectID <- nil. 
                               clone = ( | new |
                                        new: resend.clone.
                                        new javaCachedObjectID: nil.
                                        new) |).
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaCachedObjectID: newOID = ( |
            | 
            javaCachedObjectID.
            javaCachedObjectID: newOID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaObjectID = ( |
            | 
            javaCachedObjectID = nil ifTrue: [
               javaCachedObjectID: javaDaemon getNewObjectID
            ].
            javaCachedObjectID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDaemon = bootstrap define: bootstrap stub -> 'globals' -> 'javaDaemon' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawOwner' From:
             globals morph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaDaemon.

CopyDowns:
globals morph. copy 
SlotsToOmit: parent prototype rawOwner.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (true)'
        
         continue <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillOidMap: oidMap From: obj = ( |
            | 
            oidMap at: obj javaObjectID Put: obj.
            obj morphs do: [|:m|
               fillOidMap: oidMap From: m.
            ].
            oidMap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillOidMapAll = ( |
             map.
            | 
            map: dictionary copy.
            desktop worlds do: [|:w|
               fillOidMap: map From: w.
            ].
            map).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaUsers <- bootstrap setObjectAnnotationOf: ( list copyRemoveAll) From: ( |
             {} = 'ModuleInfo: Creator: globals javaDaemon javaUsers.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (0)'
        
         lastObjectID <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (lock copy)'
        
         oidLock <- lock copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (dictionary copy)'
        
         oidToObjectMap <- dictionary copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDaemon = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits javaDaemon.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'javaDaemon' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (1420)'
        
         port <- 1420.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            javaDaemon).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         radarViewers <- bootstrap setObjectAnnotationOf: ( list copyRemoveAll) From: ( |
             {} = 'ModuleInfo: Creator: globals javaDaemon radarViewers.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         reallyRawOwner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (os_file deadCopy)\x7fVisibility: private'
        
         serverSocket <- os_file deadCopy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (true)'
        
         showDrags <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDummyCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'javaDummyCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals nullCanvas copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaDummyCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaDummyCanvas.

CopyDowns:
globals nullCanvas. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDummyCanvas' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (\'\')'
        
         messageString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDummyCanvas = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits javaDummyCanvas.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaDummyCanvas' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaHandMorph = bootstrap define: bootstrap stub -> 'globals' -> 'javaHandMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'position' From:
             bootstrap remove: 'prototype' From:
             globals handMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaHandMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaHandMorph.

CopyDowns:
globals handMorph. copy 
SlotsToOmit: parent position prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaHandMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits javaHandMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'javaHandMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = bootstrap stub -> 'globals' -> 'javaHandMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (0 @ 0)'
        
         rawPosition <- 0 @ 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         rawUser.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         winCanvasForHand <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaHandMorph winCanvasForHand.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         boundingBoxInWorld = ( |
            | hand user viewArea).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         hand.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         warpCursorTo: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         xDisplay <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> 'xDisplay' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaHandMorph winCanvasForHand xDisplay.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> 'xDisplay' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaHandMorph' -> 'winCanvasForHand' -> 'xDisplay' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         xStoreBytes: t0 = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaKeyTranslator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaKeyTranslator' -> () From: ( |
             {} = 'Comment: This translates from the communication protocol for
keystrokes, which is basically the Java implementation,
for lack of a better idea, into the keycodes and keystrokes
strings for Self.  Responsibility for either getting the
keycodes right or knowing that nobody cares lies entirely
here.  The reason it is done this way is to avoid the 
duplication of the keycode/keystrokes model in the comm
protocol.

Note that this is a very direct mapping.  There is an
assumption that there will also be a configurable key mapping
on the client side from java keys to java keys.

-- Andy 7/1/96\x7fModuleInfo: Creator: globals javaKeyTranslator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaKeyTranslator' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         keycodeFromKey: key = ( |
            | 
            key = 1000 ifTrue: [^59].    "home"
            key = 1001 ifTrue: [^81].    "end"
            key = 1002 ifTrue: [^103].   "pgup"
            key = 1003 ifTrue: [^130].   "pgdn"

            key = 1004 ifTrue: [^27].    "up"
            key = 1005 ifTrue: [^34].    "down"
            key = 1006 ifTrue: [^31].    "left"
            key = 1007 ifTrue: [^35].    "right"

            "This maps F1-F10 to the function keys on the left"
            key = 1008 ifTrue: [^8].
            key = 1009 ifTrue: [^10].
            key = 1010 ifTrue: [^32].
            key = 1011 ifTrue: [^33].
            "front can't be done"
            key = 1013 ifTrue: [^58].
            "open can't be done"
            key = 1015 ifTrue: [^80].
            key = 1016 ifTrue: [^102].
            key = 1017 ifTrue: [^104].

            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaKeyTranslator' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         keystrokeFromKey: key = ( |
            | 
            (key = 10) ifTrue: [
               ^ 13 asCharacterIfFail: '' 
            ].

            (key >= 0) && [(key < 128)] ifTrue: [ 
               ^ key asCharacterIfFail: '' 
            ].

            '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaKeyTranslator' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaRadarViewer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaRadarViewer' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaRadarViewer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaRadarViewer' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         myJavaDaemon.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaRadarViewer = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'javaRadarViewer' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits javaRadarViewer.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaRadarViewer' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'javaRadarViewer' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaRadarViewer' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (os_file copy)'
        
         socket <- os_file copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaUser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaUser.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         bottomMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedMinHeight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedMinWidth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (false)'
        
         continue <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (lock)'
        
         dlLock <- bootstrap stub -> 'globals' -> 'lock' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (true)'
        
         enabled <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (list copy)'
        
         followerMorphs <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The hResizing slot indicates the horizontal resizing style of
this morph, one of {rigid(0), flexible(1), shrinkWrap(2)}.
\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         hResizing <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         inputSocket.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The layoutOkay flag indicates that this morph\'s current layout
is correct; it is used to avoid unnecessary layout computations.
\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         layoutOkay <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         myJavaDaemon.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: This private flag is used for an important optimization.
If true, then none of this morph\'s submorphs has a
bounds that sticks out beyound this morph\'s baseBounds.
This saves recomputing the bounds for most morphs.
\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         noStickOuts <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaUser = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits javaUser.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'javaUser' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            javaUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: ((0@0) # (0@0))'
        
         rawBox <- (0@0) # (0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'khaki'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         rawMorphs <- bootstrap stub -> 'globals' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         rawOwner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (rectangle copy from: (0@0) To: (0@0))'
        
         rawViewArea <- rectangle copy from: (0@0) To: (0@0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         rightMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (os_file)'
        
         socket <- os_file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         topLevelMorphs <- bootstrap setObjectAnnotationOf: ( list copyRemoveAll) From: ( |
             {} = 'ModuleInfo: Creator: globals javaUser topLevelMorphs.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (nil)'
        
         topMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (javaHandMorph)'
        
         userHand <- bootstrap stub -> 'globals' -> 'javaHandMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (\'nobody\')'
        
         userName <- 'nobody'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The vResizing slot indicates the vertical resizing style of
this morph, one of {rigid(0), flexible(1), shrinkWrap(2)}.
\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         vResizing <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The velcroFlag indicates that all the submorphs of the reciever
are attached to the receiver as if by Velcro(tm). Futhermore, the
receiver is not open to having new morphs added to it via dropping.
This flag defaults to true.
\x7fModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         velcroFlag <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (list copy)'
        
         waitingUpdates <- list copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (lock copy)'
        
         waitingUpdatesLock <- lock copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (semaphore copy)'
        
         waitingUpdatesSema <- semaphore copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaUserVoice = bootstrap define: bootstrap stub -> 'globals' -> 'javaUserVoice' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals uglyTextEditorMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'javaUserVoice' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals javaUserVoice.

CopyDowns:
globals uglyTextEditorMorph. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: Andy\'s Java Interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaUserVoice = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'javaUserVoice' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits javaUserVoice.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'javaUserVoice' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'javaUserVoice' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaInterface = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules javaInterface.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'javaInterface' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'nil' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaCachedObjectID = '<nil>'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         amIATypingFocus = ( |
            | 
            isInWorld ifFalse: [^ false].

            world hands findFirst: [|:h| amIATypingFocusFor: h ]
                        IfPresent: [ ^ true ]
                        IfAbsent:  [].
            "Modified to work with java hands too - Andy 8/22/96"
            javaMyJavaDaemons do: [ |:d|
               d javaUsers do: [|:u| 
                  (amIATypingFocusFor: (u userHand)) ifTrue: [ ^ true].
               ].
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         beTypingFocusFor: sourceHand = ( |
            | 
            sourceHand subscribeKeyboardExclusive: self.
            changed.
            javaChanged: 'focus'. "Andy 8/22/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         stopBeingTypingFocusOf: aHand = ( |
            | 
            aHand unsubscribeCursor:   self.
            "if I am stopping cause of a buttton click in another morph,
             need to unsubscribe. The if test prevents recursion"
            (aHand isAKeyboardSubscriber: self) 
              ifTrue: [  aHand unsubscribeKeyboard: self ].
            changed.
            javaChanged: 'focus'. "Andy 8/22/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'SelfCircleMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
            | 
            center: p. 
            javaChanged: 'position'. "Andy 7/31/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         resizePoint: p = ( |
             dx.
             dy.
            | 
            changed.
            dx: p x - center x.
            dy: p y - center y.
            radius: ((dx square + dy square) squareRoot asInteger max: 3).
            layoutChanged.
            javaChanged: 'baseBounds'. "Andy 8/21/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'circleMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            center: r center.
            radius: (r width min: r height) half.
            javaChanged: 'baseBounds'. "Andy 8/21/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'SelfFrameMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'frameMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDataPairs: changedFields = ( |
             d.
            | 
            d: resend.javaDataPairs: changedFields.
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*frameStyle*'] ifTrue: [
               d at: 'frameStyle' Put: frameStyle.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*borderWidth*'] ifTrue: [
               d at: 'borderWidth' Put: borderWidth.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*filled*'] ifTrue: [
               d at: 'filled' Put: filled asString.
            ].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'SelfHandMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: grabbingAndDropping\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         ungrabEvent: evt = ( |
             mList.
            | 
            "Drop all morphs being carried by the hand."
            0 = morphCount ifTrue: [ ^self ].
            mList: morphs copy.
            "This doesn't seem to be really needed - Andy 7/31/96
            removeAllMorphs.
            "
            "use reverse do so that bottommost morphs drop first"
            mList reverseDo: [| :m | world fallingMorph: m Event: evt ].
            removeAllMorphs.  "Move it to here instead - Andy"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'SelfImageMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDataPairs: changedFields = ( |
             d.
            | 
            d: resend.javaDataPairs: changedFields.

            (changedFields = 'all') ||
             [changedFields matchesPattern: '*image*'] ifTrue: [
               d at: 'imageColormap' Put: image javaGetColormapDataString.
               d at: 'imagePixels' Put: image javaGetImageDataString.
               d at: 'imageWidth' Put: width.
            ].

            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'imageMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         setImage: i = ( |
            | 
            image: i.
            contentsChanged.
            javaChanged: 'image'. "Andy 8/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            new: resend.baseCopy.
            new javaUsers: javaUsers copy.
            new radarViewers: radarViewers copy.
            new serverSocket: serverSocket copy.
            new oidLock: oidLock copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         getNewObjectID = ( |
             retOID.
            | 
            oidLock lock.
               lastObjectID: lastObjectID + 1.
               retOID: '<', lastObjectID asString, '>'.
            oidLock unlock.
            retOID).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         handleConnection: sock = ( |
             foundFlag <- bootstrap stub -> 'globals' -> 'false' -> ().
             userLine.
             userObject.
            | 

            sock initialize: 'client socket'.
            userLine: sock readLine.
            ('handleConnection: ', userLine) printLine.

            (userLine matchesPattern: '<*') ifFalse: [ | user. userInfo |
               "This is a primary downlink, and userLine is the user name"
               userInfo: userLine asTokensSeparatedByCharactersIn: '&'.
               user: javaUser copy.
               user continue: true.
               user color: paint copyRandom copyDarkerBy: 0.2.
               user myJavaDaemon: self.
               user socket: sock.
               safelyDo: [ |logFile. voiceMorph|
                  theWorld addMorph: user.
                  theWorld addMorph: user userHand.
                  user userHand name: userInfo first shrinkwrapped.
                  user userHand color: user color.

                  voiceMorph: user makeUserVoiceWithName: (userInfo first shrinkwrapped).
                  theWorld addMorph: voiceMorph.
                  theWorld moveToFront: voiceMorph.
                  voiceMorph position: (0 @ 0).
                  voiceMorph setWidth: 250 Height: 100.
                  user followerMorphs add: voiceMorph.

                  javaUsers addLast: user.

                  sock writeLine: (user javaObjectID, ' ', user userHand javaObjectID).
                  ('  ', user javaObjectID, ' ', user userHand javaObjectID) printLine.
                  logFile: os_file openForAppending: logFileName.
                  logFile lseekOffset: 0 Whence: os_file seek_end.
                  logFile writeLine: ('login: ', 
                                      userInfo first shrinkwrapped,
                                      ' (',
                                      user javaObjectID,
                                      ')   ',
                                      time current asString).
                  logFile close.
                  user updateObject: theWorld ChangedFields: 'all'.
                  ].
               user processOutput.
            ] True: [
               (userLine matchesPattern: '<radarview>*') ifTrue: [ |viewer|
                  safelyDo: [ |logFile|
                     "This is a radar view downlink"
                     '  radarview opened' printLine.
                     viewer: javaRadarViewer copy.
                     viewer socket: sock.
                     viewer myJavaDaemon: self.

                     logFile: os_file openForAppending: logFileName.
                     logFile lseekOffset: 0 Whence: os_file seek_end.
                     logFile writeLine: ('radar: ', 
                                         ' (',
                                         viewer javaObjectID,
                                         ')   ',
                                         time current asString).
                     logFile close.

                     radarViewers addLast: viewer.
                     theWorld morphs do: [|:m| viewer sendUpdate: m 
                                                   ChangedFields: 'baseBounds,color' ].
                  ].
               ] False: [
                  "This is an attemp to connect an uplink"
                  javaUsers do: [ |:user|
                     safelyDo: [
                        (userLine matchesPattern: (user javaObjectID, '*')) ifTrue: [
                           user inputSocket: sock.
                           user continue: true.
                           userObject: user.
                           foundFlag: true
                        ].
                     ].
                  ].
                  foundFlag 
                     ifTrue: [userObject processInput]
                     False:  ['  closing socket' printLine. sock close].
               ].
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         logFileName = 'serverlog'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         rawOwner = ( |
            | reallyRawOwner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         rawOwner: newOwner = ( |
            | 
            reallyRawOwner = nil ifFalse: [
               isInWorld ifTrue: [
                  safelyDo: [
                     world javaCachedJavaDaemons remove: self.
                  ].
               ].
            ].
            reallyRawOwner: newOwner.
            reallyRawOwner = nil ifFalse: [
               isInWorld ifTrue: [
                  safelyDo: [
                     world javaCachedJavaDaemons add: self.
                  ].
               ].
            ].
            rawOwner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         start = ( |
            | 
            ( userQuery askYesNo: 'Starting the socket server introduces a security loophole into your machine.\n',
                                  'Please confirm.'
            ) ifTrue: [startSilently].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         startSilently = ( |
            | 
            globals javaDaemon = self ifTrue: [
               userQuery reportAndContinue: 'The javaDaemon prototype is not to be started.\n',
                                            'Please create a copy, put it in the world, and start that.'.
               ^ self
            ].

            isInWorld ifFalse: [
               userQuery reportAndContinue: 'Cannot start a javaDaemon that isn\'t in a world.\n',
                                            'Please use the middle button menu, \'Show Morph\'\n',
                                            'to put me in the world, and try again.'.
               ^ self
            ].

            stop.

               continue: true.
               serverSocket closeIfFail: [].
               serverSocket:
                 os_file
                   openTCPListenerOnPort: port      "HARDWIRED!"
                   IfFail: [|:e|
                        (e matchesPattern: '*UNKNOWN 125*')
                     || [e matchesPattern: '*EADDRINUSE*']
                        ifTrue: [error: e, '\n',
                                   'Warning: couldn\'t start the rself server process.\n',
                                   'The port (', port printString, ') is already in use, ',
                                   'probably by another Self server.\n\n',
                                   'If you wish to start it, kill the other one off and\n',
                                   'evaluate "socketServer start"'.
                                 ^self]
                         False: [^error: 'Couldn\'t start self server: ', e]].

            'Server started.' printLine.
            [continue] whileTrue: [| io <- os_file. goForIt |
                goForIt: true.
                io: serverSocket acceptConnectionIfFail: [goForIt: false].
                goForIt ifTrue: [
                   (message copy receiver: self 
                                 Selector: 'handleConnection:' 
                                     With: io) fork resume.
                ].
            ].
            serverSocket close.
            'Server terminated.' printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         stop = ( |
            | 
            safelyDo: [
               [javaUsers isEmpty] whileFalse: [
                  theWorld removeMorph: javaUsers first userHand.
                  theWorld removeMorph: javaUsers first.   
                  javaUsers first socket closeIfFail: [].
                  javaUsers first continue: false.
                  javaUsers first inputSocket closeIfFail: [].
                  javaUsers removeFirst.
               ].

               continue: false.
               serverSocket closeIfFail: [].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDaemon' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         theWorld = ( |
            | world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         arcWithin: r From: startA Spanning: spanA Color: c = ( |
            | 
            arcWithin: r From: startA Spanning: spanA Width: 1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         arcWithin: r From: startA Spanning: spanA Width: w Color: c = ( |
            | 
            primitiveArc: r From: startA Spanning: spanA Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         bSpline: controlPoints Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         bezier: pt1 Control: c1 Control: c2 To: pt2 Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         catmullRomSpline: controlPoints Width: w Color: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         circleCenteredAt: pt Diameter: d Color: c = ( |
            | 
            circleCenteredAt: pt Diameter: d Width: 1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         circleCenteredAt: pt Diameter: d Width: w Color: c = ( |
            | 
            arcWithin: ((pt x - d) @ (pt y - d)) # ((pt x + d) @ (pt y + d))
                 From: 0 Spanning: 360 Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         close = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         copyPixmapAt: p Into: aPixmapCanvas = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         dashedLine: pt1 To: pt2 DashSize: d Offset: o Color: c = ( |
            | 
            dashedLine: pt1 To: pt2 Width: 1 DashSize: d Offset: o Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         dashedLine: pt1 To: pt2 Width: w DashSize: d Offset: o Color: c = ( |
             ptlist.
            | 
            ptlist: list copyRemoveAll.
            ptlist addLast: pt1.
            ptlist addLast: pt2.
            primitiveLines: ptlist Width: w Color: c Dash: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         drawable = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillArcWithin: r From: startA Spanning: spanA Color: c = ( |
            | 
            arcWithin: r From: startA Spanning: spanA Width: -1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillCircleCenteredAt: pt Diameter: d Color: c = ( |
            | 
            circleCenteredAt: pt Diameter: d Width: -1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillColor: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillPolygon: pointList Color: c = ( |
            | 
            polygon: pointList Width: -1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillPolygonXs: xList Ys: yList Color: c = ( |
            | 
            primitivePolygonXs: xList Ys: yList Width: -1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         fillRectangle: r Color: c = ( |
            | 
            rectangle: r Width: -1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         image: i At: pt = ( |
            | 
            primitiveImage: i At: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         isOpen = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         line: pt1 To: pt2 Color: c = ( |
            | 
            line: pt1 To: pt2 Width: 1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         line: pt1 To: pt2 Width: w Color: c = ( |
             ptlist.
            | 
            ptlist: list copyRemoveAll.
            ptlist addLast: pt1.
            ptlist addLast: pt2.
            lines: ptlist Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         lines: pointList Color: c = ( |
            | 
            lines: pointList Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         lines: pointList Width: w Color: c = ( |
            | 
            primitiveLines: pointList Width: w Color: c Dash: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'nullCanvas' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         pastePixmap: aPixmapCanvas At: p = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         pastePixmap: aPixmapCanvas At: dst Src: src Width: w Height: h = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: pixelCopying\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         pastePixmap: aPixmapCanvas At: p Width: w Height: h = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         point: p Color: c = ( |
            | 
            line: p To: p Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         polygon: pointList Color: c = ( |
            | 
            polygon: pointList Width: 1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         polygon: pointList Width: w Color: c = ( |
             xs.
             ys.
            | 
            xs: list copyRemoveAll.
            ys: list copyRemoveAll.
            pointList do: [|:p| xs addLast: p x. ys addLast: p y].
            primitivePolygonXs: xs Ys: ys Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitiveArc: r From: startA Spanning: spanA Width: w Color: c = ( |
             cmdStr.
            | 
            cmdStr: ''.

            cmdStr: cmdStr, '|r.t|', r top asString.
            cmdStr: cmdStr, '|r.b|', r bottom asString.
            cmdStr: cmdStr, '|r.l|', r left asString.
            cmdStr: cmdStr, '|r.r|', r right asString.

            cmdStr: cmdStr, '|st|', startA asString.
            cmdStr: cmdStr, '|sp|', spanA asString.

            cmdStr: cmdStr, primitiveColorRep: c.
            cmdStr: cmdStr, '|w|', w asString.

            cmdStr: cmdStr, '|item|arc'.
            messageString: messageString, cmdStr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitiveColorRep: c = ( |
            | 
            '|c.r|', c red asString, 
            '|c.g|', c green asString,
            '|c.b|', c blue asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitiveImage: i At: pt = ( |
             cmdStr.
            | 
            cmdStr: ''.

            cmdStr: cmdStr, '|x|', pt x asString.
            cmdStr: cmdStr, '|y|', pt y asString.
            cmdStr: cmdStr, '|w|', i width asString.
            cmdStr: cmdStr, '|c|', i javaGetColormapDataString.
            cmdStr: cmdStr, '|p|', i javaGetImageDataString.

            cmdStr: cmdStr, '|item|image'.
            messageString: messageString, cmdStr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitiveLines: pointList Width: w Color: c Dash: d = ( |
             cmdStr.
             xs.
             ys.
            | 
            xs: list copyRemoveAll.
            ys: list copyRemoveAll.
            pointList do: [|:p| xs addLast: p x. ys addLast: p y].

            cmdStr: ''.

            cmdStr: cmdStr, '|xs|', primitiveListRep: xs.
            cmdStr: cmdStr, '|ys|', primitiveListRep: ys.

            cmdStr: cmdStr, primitiveColorRep: c.
            cmdStr: cmdStr, '|w|', w asString.
            d ifTrue: [
               cmdStr: cmdStr, '|d|1'.
            ] False: [
               cmdStr: cmdStr, '|d|0'.
            ].

            cmdStr: cmdStr, '|item|lines'.
            messageString: messageString, cmdStr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitiveListRep: l = ( |
             cmdStr.
            | 
            cmdStr: ''.
            l do: [|:i| cmdStr: cmdStr, ',', i asString].
            cmdStr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitivePolygonXs: xs Ys: ys Width: w Color: c = ( |
             cmdStr.
            | 
            cmdStr: ''.

            cmdStr: cmdStr, '|xs|', primitiveListRep: xs.
            cmdStr: cmdStr, '|ys|', primitiveListRep: ys.

            cmdStr: cmdStr, primitiveColorRep: c.
            cmdStr: cmdStr, '|w|', w asString.

            cmdStr: cmdStr, '|item|polygon'.
            messageString: messageString, cmdStr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitiveRect: r Width: w Color: c = ( |
             cmdStr.
            | 
            cmdStr: ''.

            cmdStr: cmdStr, '|r.t|', r top asString.
            cmdStr: cmdStr, '|r.b|', r bottom asString.
            cmdStr: cmdStr, '|r.l|', r left asString.
            cmdStr: cmdStr, '|r.r|', r right asString.

            cmdStr: cmdStr, primitiveColorRep: c.
            cmdStr: cmdStr, '|w|', w asString.

            cmdStr: cmdStr, '|item|rect'.
            messageString: messageString, cmdStr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: primitives\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         primitiveText: s At: pt Font: fName Size: fSize Color: c = ( |
             cmdStr.
            | 
            cmdStr: ''.

            cmdStr: cmdStr, '|x|', pt x asString.
            cmdStr: cmdStr, '|y|', pt y asString.

            cmdStr: cmdStr, '|s|', s.

            cmdStr: cmdStr, '|fn|', fName.
            cmdStr: cmdStr, '|fs|', fSize asString.

            cmdStr: cmdStr, primitiveColorRep: c.

            cmdStr: cmdStr, '|item|text'.
            messageString: messageString, cmdStr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         rectangle: r Color: c = ( |
            | 
            rectangle: r Width: 1 Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         rectangle: r Width: w Color: c = ( |
            | 
            primitiveRect: r Width: w Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         text: s At: pt Font: fName Size: fSize Color: c = ( |
            | 
            primitiveText: s At: pt Font: fName Size: fSize Color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> () From: ( | {
         'Category: misc\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         xDisplay = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> 'xDisplay' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits javaDummyCanvas xDisplay.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaDummyCanvas' -> 'xDisplay' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         attach: m = ( |
            | 
            safelyDo: [
               resend.attach: m
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         attachAllFromHand: h = ( |
            | 
            safelyDo: [
               resend.attachAllFromHand: h
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            new: resend.baseCopy.
            new winCanvasForHand: (winCanvasForHand copy).
            new winCanvasForHand hand: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         baseDrawOn: aCanvas = ( |
            | 
            aCanvas fillPolygon: vertices Color: color.
            userInfo preferences showNameToOthers ifTrue: [
               drawNameOn: aCanvas
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         dispatchEvent: e From: user = ( |
            | 
            safelyDo: [
               e ignore ifTrue: [ ^self ].
               e sourceHand: self.
               e keyEvent    ifTrue: [ handleAndForward: e To: keyboardInterest. ^self ].
               e windowEvent ifTrue: [ handleAndForward: e To: windowInterest.   ^self ].

               " at this point, assume it is a mouse event "
               handleAndForward: e To: cursorInterest.

               e anyMouseIsDown ifFalse: [
                  (nil = untilAllUpClient) ifFalse: [
                     "'Unsubscribing untilAllUpClient' printLine."
                     unsubscribeCursor: untilAllUpClient.
                     untilAllUpClient: nil.
                  ].
               ].

               lastCursor: e cursorPoint.
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         handleMouseMove: e = ( |
            | 
            changed.
            "resend.handleMouseMove: e"
            safelyDo: [
               moveTo: e cursorPoint.
               owner moveToFront: self.
            ].
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         isJavaHandMorph = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'handMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         position = ( |
            | rawPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         position: p = ( |
            | 
            rawPosition: p.
            javaChanged: 'position'.
            p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         user = ( |
            | rawUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         user: u = ( |
            | 
            rawUser: u.
            rawUser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaHandMorph' -> () From: ( | {
         'Category: accessing\x7fComment: get the winCanvas that
is my home
-- Ungar, 1/24/95
Hacked since java users don\'t have a winCanvas
- Andy 7/1/96\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxOldWinCanvasForHand = ( |
            | 
            isInWorld ifFalse: [ ^ nil ].
            world anyWindowCanvas).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaRadarViewer' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         dropViewer = ( |
            | 
            myJavaDaemon = nil ifFalse: [
               myJavaDaemon radarViewers remove: self IfAbsent: [].
            ].
            socket closeIfFail: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaRadarViewer' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaRadarViewer' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         sendUpdate: obj ChangedFields: changedFields = ( |
            | 
            (obj owner = nil) || [obj owner isWorldMorph] ifFalse: [^self].

            (obj globalBounds top > 50000000) || [
             (obj globalBounds bottom < -50000000) || [
              (obj globalBounds left > 50000000) || [
               (obj globalBounds right < -50000000) ]]] ifTrue: [^self].

            (changedFields = 'all') || [
             (changedFields matchesPattern: '*baseBounds*') || [
              (changedFields matchesPattern: '*color*') || [
               (changedFields matchesPattern: '*owner*') ]]] ifFalse: [^self].

            traits javaUser writeLine: '' To: socket IfFail: [|:e| dropViewer].

            "
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*baseBounds*'] ifTrue: [
            "
               traits javaUser writeLine: ('r.t ', obj globalBounds top asString)
                                      To: socket IfFail: [|:e| dropViewer].
               traits javaUser writeLine: ('r.b ', obj globalBounds bottom asString) 
                                      To: socket IfFail: [|:e| dropViewer].
               traits javaUser writeLine: ('r.l ', obj globalBounds left asString)
                                      To: socket IfFail: [|:e| dropViewer].
               traits javaUser writeLine: ('r.r ', obj globalBounds right asString)
                                      To: socket IfFail: [|:e| dropViewer].
            "
            ].

            (changedFields = 'all') ||
             [changedFields matchesPattern: '*color*'] ifTrue: [
            "
               traits javaUser writeLine: ('c.r ', obj color red asString)
                                      To: socket IfFail: [|:e| dropViewer].
               traits javaUser writeLine: ('c.g ', obj color green asString)
                                      To: socket IfFail: [|:e| dropViewer].
               traits javaUser writeLine: ('c.b ', obj color blue asString)
                                      To: socket IfFail: [|:e| dropViewer].
            "
            ].
            "

            (obj owner = nil) && [
             (changedFields = 'all') ||
              [changedFields matchesPattern: '*owner*'] ] ifTrue: [
               traits javaUser writeLine: 'owner nil' To: socket IfFail: [|:e| dropViewer].
            ].

            traits javaUser writeLine: ('o ', obj javaObjectID)
                                   To: socket IfFail: [|:e| dropViewer].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         actionOnObject: obj Action: action = ( |
            | 
            obj safelyDo: [
               ((obj root) globalBounds top < viewArea bottom) && [
                ((obj root) globalBounds bottom > viewArea top) && [
                 ((obj root) globalBounds right > viewArea left) && [
                  ((obj root) globalBounds left < viewArea right) && [
                   ((obj javaSuppressUpdates) not) && [
                    ((obj javaSuppressedChild) not) ]]]]] 

                  ifTrue: [sendAction: obj javaObjectID 
                               Action: action 
                                 Data: obj javaDataPairs]
                  False:  [].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         backslashQuotes: input = ( |
             output.
            | 
            output: ''.

            input bytesDo: [ |:b. c|
               c: b asCharacter.
               (c = '"') ifTrue: [
                  output: output, '\\"'.
               ] False: [
                  (c = '\\') ifTrue: [
                     output: output, '\\\\'.
                  ] False: [
                     output: output, c.
                  ].
               ].
            ].

            output).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'Category: morph things\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 

            new: resend.baseCopy.
            new topLevelMorphs: topLevelMorphs copy.
            new userHand: userHand copy.
            new userHand user: new.
            new dlLock: dlLock copy.
            new waitingUpdates: waitingUpdates copy.
            new waitingUpdatesLock: waitingUpdatesLock copy.
            new waitingUpdatesSema: waitingUpdatesSema copy.
            new followerMorphs: followerMorphs copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'Category: morph things\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         borderWidth = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         dropUser = ( |
            | 
            safelyDo: [

            ('Dropping user ', javaObjectID) printLine.
            myJavaDaemon = nil ifFalse: [
               myJavaDaemon javaUsers remove: self IfAbsent: [].
            ].
            socket = nil ifFalse: [
               socket closeIfFail: [].
            ].
            continue: false.
            waitingUpdatesSema signal.  "wake up processOutput, let it die"
            inputSocket = nil ifFalse: [
               inputSocket closeIfFail: [].
            ].

            (owner != nil) ifTrue: [
               | theWorld |
               theWorld: owner.
               theWorld removeMorph: userHand.
               theWorld removeMorph: self.
               topMorph = nil ifFalse: [theWorld removeMorph: topMorph].
               bottomMorph = nil ifFalse: [theWorld removeMorph: bottomMorph].
               rightMorph = nil ifFalse: [theWorld removeMorph: rightMorph].
               followerMorphs do: [|:m|
                  theWorld removeMorph: m.
               ].
            ].

            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'Category: morph things\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'Category: morph things\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         leftMouseDown: evt = ( |
            | 
            owner moveToBack: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         makeUserVoiceWithName: name = ( |
             ed.
             f.
             f2.
             l.
             result.
            | 

            ed: javaUserVoice copyString: '' 
                    Style: outlinerPreferences.
            ed receiver: lobby _Mirror.
            nil != userHand ifTrue: [
              ed beTypingFocusFor: userHand.
            ].
            ed frameStyle: frameMorph flatStyle.
            ed borderWidth: 0.
            ed beFlexible.

            f: frameMorph copy.
            f addMorphFirst: ed.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 2.
            f beFlexible.

            f2: frameMorph copy.
            l: labelMorph copyLabel:  name.
            f2 addMorphFirst: l.
            f2 addMorphLast: f.
            f2 frameStyle: f2 bezelStyle.
            f2 borderWidth: 2.
            f2 beRigid.

            result: f2.

            result colorAll: color.

            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         processInput = ( |
            | 
            'traits javaUser processInput - started' printLine.
            process this priority: (process this priority + 5).
            [continue] whileTrue: [ |inputLine. inputList|
               inputLine: readLineFrom: inputSocket IfFail: [|:e| dropUser].
               inputList: inputLine asTokensSeparatedByWhiteSpace.

               (inputList size >= 1) ifTrue: [
                  (inputList first = 'View') && [inputList size = 5] ifTrue: [ |newViewArea|
                     newViewArea: viewArea copy.
                     newViewArea: (newViewArea left:   ((inputList at: 1 IfAbsent: '0') shrinkwrapped) asInteger).
                     newViewArea: (newViewArea bottom: ((inputList at: 2 IfAbsent: '0') shrinkwrapped) asInteger).
                     newViewArea: (newViewArea right:  ((inputList at: 3 IfAbsent: '0') shrinkwrapped) asInteger).
                     newViewArea: (newViewArea top:    ((inputList at: 4 IfAbsent: '0') shrinkwrapped) asInteger).
                     viewArea: newViewArea.
                     owner morphs reverseDo: [ |:m| m javaChanged: 'none' CheckUserBounds: self ]. 
                  ] False: [
                     (inputList first = 'Event') && [inputList size = 6] ifTrue: [ |e. x. y. k|
                        e: ui2Event copy.
                        e type: ((inputList at: 1 IfAbsent: 'ignore') shrinkwrapped).

                        x: ((inputList at: 2 IfAbsent: '0') shrinkwrapped) asInteger.
                        y: ((inputList at: 3 IfAbsent: '0') shrinkwrapped) asInteger.
                        e cursorPoint: (x @ y).
                        e bounds: (x @ y) # ((x + 1) @ (y + 1)).

                        e state:   ((inputList at: 4 IfAbsent: '0') shrinkwrapped) asInteger.

                        k: ((inputList at: 5 IfAbsent: '-1') shrinkwrapped) asInteger.
                        e keycode: javaKeyTranslator keycodeFromKey: k.
                        e keystrokes: javaKeyTranslator keystrokeFromKey: k.

                        userHand dispatchEvent: e From: self.

                        e mouseMotion ifTrue: [
                           dlLock lock.
                           writeLine: 'javaMessageAck mouseMotion' To: socket IfFail: [|:e| dropUser].
                           dlLock unlock.
                        ]
                     ] False: [
                        inputList first shrinkwrapped = 'Disconnect' ifTrue: [
                           dropUser.
                        ] False: [
                           (inputList first = 'Download') && [inputList size = 2] ifTrue: [ | obj |
                              ('looking for object by ID: ', ((inputList at: 1 IfAbsent: '<none>') shrinkwrapped)) printLine.
                              obj: (javaDaemon oidToObjectMap) at: ((inputList at: 1 IfAbsent: '<none>') shrinkwrapped) IfAbsent: nil.
                              (obj = nil) ifFalse: [
                                 '   found it' printLine.
                                 obj javaSuppressUserDownloads ifFalse: [
                                    obj javaUserUpdateAllMorphs: self.
                                 ].
                                 sendEndDownload.
                              ].
                           ] False: [
                              inputList first shrinkwrapped = 'Enable' ifTrue: [
                                 enabled: true.
                                 waitingUpdatesSema signal.
                              ] False: [
                                 inputList first shrinkwrapped = 'Disable' ifTrue: [
                                    enabled: false.
                                 ] False: [
                                    ('Unrecognized input: ', inputLine) printLine.
                                 ].
                              ].
                           ].
                        ].
                     ].
                  ].
               ].
            ].
            inputSocket closeIfFail: [].  "At this point, must already be dropping user"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         processOutput = ( |
            | 
            process this priority: (process this priority + 2).
            [continue] whileTrue: [
               (enabled) && [waitingUpdates size > 0] ifTrue: [ | dataPairs |
                  waitingUpdatesLock lock.
                  dataPairs: waitingUpdates removeFirst.
                  waitingUpdatesLock unlock.
                  ((dataPairs at: 'objectID') = (userHand javaObjectID)) ifFalse: [
                     dlLock lock.

                     writeLine: '' To: socket IfFail: [|:e| dropUser].
                     dataPairs do: [ |:value. :name| (((name matchesPattern: 'globalBounds.*') ||
                                                     [((value asString) matchesPattern: '*inf') ||
                                                      [name matchesPattern: 'objectID']]) not)
                                     ifTrue: [writeLine: (name asString),' "',
                                                         (backslashQuotes: (value asString)),'"' 
                                                     To: socket IfFail: [|:e| dropUser] ]
                                     False: [] ].
                     writeLine: 'objectID "', (dataPairs at: 'objectID'), '"' 
                            To: socket IfFail: [|:e| dropUser].

                     dlLock unlock.
                  ].
               ] False: [
                  waitingUpdatesSema wait.
               ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         readLineFrom: sock IfFail: fb = ( |
             buf.
             line <- ''.
            | 
            "Read up to and including first \n - skip this \n."
            [ buf: sock readCount: 1 IfFail: fb. 
              (buf != '\n') && [(sock atEOF) not] ] whileTrue: [ 
                line: line, (buf asString).  "asString is a hack
                                 against a nasty transient bug that
                                 I cant track -- Andy 9/5/96"
            ].
            line).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         sendAction: objId Action: action Data: dataPairs = ( |
            | 
            dlLock lock.
            writeLine: '' To: socket IfFail: [|:e| dropUser].
            writeLine: 'objectID "', objId, '"' To: socket IfFail: [|:e| dropUser].
            dataPairs do: [ |:value. :name| ((name matchesPattern: 'globalBounds.*') not)
                            ifTrue: [writeLine: (name asString),' "',(backslashQuotes: (value asString)),'"' To: socket IfFail: [|:e| dropUser] ]
                            False: [] ].
            writeLine: 'javaAction "', action, '"' To: socket IfFail: [|:e| dropUser]
            dlLock unlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         sendDownload: objId IsA: javaClass Data: dataPairs = ( |
            | 
            dataPairs at: 'isADownloadObject' Put: 'true'.
            sendUpdate: objId IsA: javaClass Data: dataPairs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         sendEndDownload = ( |
            | 
            dlLock lock.
            writeLine: 'adviseEndOfDownload "true"' To: socket IfFail: [|:e| dropUser].
            dlLock unlock.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         sendUpdate: objId IsA: javaClass Data: dataPairs = ( |
             foundIt.
            | 
            dataPairs at: 'objectID' Put: objId.
            waitingUpdatesLock lock.

            foundIt: false.
            waitingUpdates do: [ |:update|
               ((update at: 'objectID') = objId) ifTrue: [
                  dataPairs do: [ |:value. :name| update at: name Put: value. ].
                  foundIt: true.
               ].
            ].

            foundIt ifFalse: [ waitingUpdates addLast: dataPairs. ].

            waitingUpdatesLock unlock.
            waitingUpdatesSema signal.
            "process this yield."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         setViewArea: va = ( |
            | 
            viewArea: va.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         updateObject: obj = ( |
            | updateObject: obj ChangedFields: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         updateObject: obj ChangedFields: changedFields = ( |
            | 
            "obj safelyDo: ["
               ((obj javaSuppressUpdates) not) && [
                ((obj javaSuppressedChild) not) && [
                 ((obj root) globalBounds top < viewArea bottom) && [
                  ((obj root) globalBounds bottom > viewArea top) && [
                   ((obj root) globalBounds right > viewArea left) && [
                    ((obj root) globalBounds left < viewArea right)  ]]]]] 

               ifTrue: [
                  "('Sending update for oid: ', obj javaObjectID) printLine."
                  sendUpdate: obj javaObjectID 
                         IsA: obj javaClassName 
                        Data: obj javaDataPairs: changedFields
               ] False: [
                  "('Discarding update for oid: ', obj javaObjectID) printLine."
                  ].
            "]."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         viewArea = ( |
            | rawViewArea).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         viewArea: va = ( |
             delta.
             oldViewArea.
            | 
            oldViewArea: viewArea.
            delta: ((va left) - (oldViewArea left)) @ ((va top) - (oldViewArea top)).

            topMorph = nil ifTrue: [
               topMorph: morph copy.
               topMorph color: color.
               owner addMorph: topMorph.
            ].
            bottomMorph = nil ifTrue: [
               bottomMorph: morph copy.
               bottomMorph color: color.
               owner addMorph: bottomMorph.
            ].
            rightMorph = nil ifTrue: [
               rightMorph: morph copy.
               rightMorph color: color.
               owner addMorph: rightMorph.
            ].

            changed.
            topMorph changed.
            bottomMorph changed.
            rightMorph changed.

            rawViewArea: va.
            resizeRect: ((viewArea left - borderWidth) @ (viewArea top - borderWidth)) 
                      # ((viewArea left - 1) @ (viewArea bottom + borderWidth)).

            topMorph resizeRect:    ((viewArea left - borderWidth) @ (viewArea top - borderWidth))
                                  # ((viewArea right + borderWidth) @ (viewArea top - 1)).
            bottomMorph resizeRect: ((viewArea left - borderWidth) @ (viewArea bottom + 1))
                                  # ((viewArea right + borderWidth) @ (viewArea bottom + borderWidth)).
            rightMorph resizeRect:  ((viewArea right + 1) @ (viewArea top - borderWidth))
                                  # ((viewArea right + borderWidth) @ (viewArea bottom + borderWidth)).

            changed.
            topMorph changed.
            bottomMorph changed.
            rightMorph changed.

            "Move anybody who is following my view area"

            followerMorphs do: [ |:m|
               m changed.
               m globalPosition: m globalPosition + delta.
               m changed.
            ].

            rawViewArea).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUser' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         writeLine: line To: sock IfFail: fb = ( |
            | sock write: line, '\n' IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUserVoice' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'javaUserVoice' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         resizeToText = ( |
            | 
            text scrollIntoView.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         fontName: familyName = ( |
            | 
            changed.
            myFontName: familyName.
            flushCachedWidth.
            javaChanged: 'fontName'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSize: points = ( |
            | 
            changed.
            myFontSize: points.
            flushCachedWidth.
            javaChanged: 'fontSize'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'SelfLabelMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDataPairs: changedFields = ( |
             d.
            | 
            d: resend.javaDataPairs: changedFields.
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*fontName*'] ifTrue: [
               d at: 'fontName' Put: fontName.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*fontSize*'] ifTrue: [
               d at: 'fontSize' Put: fontSize.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*label*'] ifTrue: [
               d at: 'label' Put: label.
            ].
            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         label: s = ( |
            | 
            safelyDo: [
              changed.
              myLabel: s.
              flushCachedWidth.
              layoutChanged.
            ].
            javaChanged: 'label'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
            | 
            myPosition: p.
            myBox: nil.
            javaChanged: 'position'. "Andy 8/8/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'lineMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
             delta.
            | 
            delta: p - position.
            p1: p1 + delta.
            p2: p2 + delta.
            javaChanged: 'position'. "Andy 9/3/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: damage management\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         changed = ( |
             bnds.
             p.
            | 
            "Report that the area occupied by this morph should be redrawn."

            isInWorld ifFalse: [ ^self ].
            bnds: bounds.
            p: position.
            safelyDo: [
               damagedLeft: bnds left   - p x
                     Right: bnds right  - p x
                       Top: bnds top    - p y
                    Bottom: bnds bottom - p y
                      From: self.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         color: newC = ( |
            | 
            rawColor: newC.
            changed.
            javaChanged: 'color,canvasCmd'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         isJavaHandMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaAddMyselfToOIDMap: oidMap = ( |
            | 
            oidMap at: javaObjectID Put: self.
            morphs do: [|:m| m javaAddMyselfToOIDMap: oidMap.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaChanged = ( |
            | 
            javaChanged: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaChanged: changedFields = ( |
            | 
            "Only proceed if object is in world or is newly removed from world"
            isInWorld || [(owner = nil) && [changedFields matchesPattern: '*owner*']] ifFalse: [^self].

            "('Changed: ', objectID, '  ', asString) printLine."
            (changedFields = 'none') ifFalse: [
               javaMyJavaDaemons do: [|:d|
                  d javaUsers do: [ |:user| user updateObject: self ChangedFields: changedFields].
               ].
            ].
            "Check to see if we have just moved into a user's space where we aren't known."
            javaMyJavaDaemons do: [ |:d|
               d javaUsers do: [ |:user|
                  javaChanged: changedFields CheckUserBounds: user
               ].
            ].
            "update any radar viewers"
            javaMyJavaDaemons do: [|:d|
               d radarViewers do: [|:rv|
                  rv sendUpdate: self ChangedFields: changedFields.
               ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaChanged: changedFields CheckUserBounds: user = ( |
            | 
            "safelyDo: ["
               (javaTopLevel globalBounds top < user viewArea bottom) && [
                (javaTopLevel globalBounds bottom > user viewArea top) && [
                 (javaTopLevel globalBounds right > user viewArea left) && [
                  (javaTopLevel globalBounds left < user viewArea right) ]]]
               ifTrue: [
                  (javaTopLevel owner != nil) ifTrue: [ |found|
                     found: nil.
                     user topLevelMorphs do: [ |:m| (m == javaTopLevel) ifTrue: [found: m] False: [] ].
                     (found == nil) ifTrue: [
                        user topLevelMorphs add: javaTopLevel.
                        javaTopLevel javaChanged: 'all'.    "just moved in"
                     ].
                  ].
               ] False: [ |found|
                  found: true.
                  user topLevelMorphs remove: javaTopLevel IfAbsent: [found: false].
                  found ifTrue: [
                     "This is outside, so the update above was ignored"
                     " however, we'd like to send one last update so that the 
                       client can drop the object "
                     user sendUpdate: javaTopLevel javaObjectID
                                 IsA: javaTopLevel javaClassName
                                Data: javaTopLevel javaDataPairs: changedFields.
                  ] False: [].
               ].
            "]."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaCheckNewToWorld: oldOwner = ( |
            | 
            isInWorld ifTrue: [
               oldOwner = nil ifTrue: [
                  safelyDo: [
                     javaMyJavaDaemons do: [ |:d|
                        d javaUsers do: [ |:user|
                           javaChanged: 'all' CheckUserBounds: user.
                        ].
                     ].
                  ].
               ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'GenericSelfMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDataPairs = ( |
            | javaDataPairs: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDataPairs: changedFields = ( |
             childNumber.
             currNumber.
             d.
             dummyCanvas.
            | 
            d: dictionary copyRemoveAll.

            "javaDummyCanvas and the generalized morph"
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*canvasCmd*'] ifTrue: [
               (javaClassName = 'GenericSelfMorph') || [
                javaClassName = 'SelfHandMorph'] ifTrue: [
                  owner = nil ifTrue: [
                  ] False: [
                     safelyDo: [
                        dummyCanvas: javaDummyCanvas copy.
                        baseDrawOn: dummyCanvas.
                     ].
                     d at: 'canvasCmd' Put: dummyCanvas messageString.
                  ].
               ].
            ].

            d at: 'globalBounds.top'    Put: globalBounds top.
            d at: 'globalBounds.bottom' Put: globalBounds bottom.
            d at: 'globalBounds.left'   Put: globalBounds left.
            d at: 'globalBounds.right'  Put: globalBounds right.

            (changedFields = 'all') ||
             [changedFields matchesPattern: '*baseBounds*'] ifTrue: [
               d at: 'baseBounds.top'      Put: baseBounds top.
               d at: 'baseBounds.bottom'   Put: baseBounds bottom.
               d at: 'baseBounds.left'     Put: baseBounds left.
               d at: 'baseBounds.right'    Put: baseBounds right.
            ].

            (changedFields matchesPattern: '*position*') ifTrue: [
               d at: 'p.t' Put: baseBounds top.
               d at: 'p.l' Put: baseBounds left.
            ].

            (changedFields = 'all') ||
             [changedFields matchesPattern: '*color*'] ifTrue: [
               d at: 'color.red'   Put: color red.
               d at: 'color.green' Put: color green.
               d at: 'color.blue'  Put: color blue.
            ].

            (changedFields = 'all') ||
             [changedFields matchesPattern: '*owner*'] ifTrue: [
               d at: 'owner' Put: owner javaObjectID.
            ].

            (changedFields = 'all') ||
             [(changedFields matchesPattern: '*owner*') ||
              [changedFields matchesPattern: '*childNumber*']] ifTrue: [
               childNumber: 0.
               currNumber: 0.
               owner != nil ifTrue: [
                  owner morphs do: [ |:m| 
                     m == self ifTrue: [childNumber: currNumber].
                     currNumber: currNumber + 1. ]. ].
               d at: 'childNumber' Put: childNumber.
               childNumber = -1 ifTrue: [
                  ('Sent childNumber = -1 with owner: ', owner javaObjectID, ', based on: ', changedFields) printLine.
               ].
            ].

            (changedFields = 'all') ifTrue: [
               d at: 'isWorldMorph' Put: isWorldMorph asString.
               d at: 'javaClass' Put: javaClassName.
            ].

            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaFindObjectByID: oid = ( |
            | 
            (javaObjectID = oid) ifTrue: [ ^ self ].
            morphs do: [ |:m|
               ((m javaFindObjectByID: oid) != nil) ifTrue: [ ^ m ].
            ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaMyJavaDaemons = ( |
            | 
            isInWorld ifFalse: [ |l|
               l: list copyRemoveAll.
               desktop worlds do: [|:w|
                  l addAll: w javaCachedJavaDaemons.
               ].
               ^ l
            ].
            world javaCachedJavaDaemons).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaOwnerChangedFrom: oldOwner To: newOwner = ( |
            | 
            "Looking for objects just put into the world with this action"
            (isInWorld) && [(oldOwner = nil) || [(oldOwner isInWorld) not]] ifTrue: [
               javaAddMyselfToOIDMap: javaDaemon oidToObjectMap.
            ].
            "Looking for objects just being remove from the world with this action"
            (oldOwner != nil) && [(oldOwner isInWorld) && [(newOwner = nil) || [(newOwner isInWorld) not]]] ifTrue: [
               javaRemoveMyselfFromOIDMap: javaDaemon oidToObjectMap.
            ].
            javaChanged: 'owner'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaRemoveMyselfFromOIDMap: oidMap = ( |
            | 
            oidMap removeKey: javaObjectID IfAbsent: [ ^ self ].
            morphs do: [|:m| m javaRemoveMyselfFromOIDMap: oidMap.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressChildren = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressObject = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressUpdates = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fComment: Most objects are now downloaded only
on user requests.  Some, however, may
think they know better when downloading,
versus simple updates, are needed, and
will want to send these automatically.  This
lets them prevent the user from becoming 
confused and requesting yet another copy, when
one is already on the way.  See traits ui2Menu,
which uses this ability -- Andy 8/29/96\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressUserDownloads = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressedChild = ( |
             retval.
            | 
            (owner == nil) ifTrue: [retval: false] False: [
               (owner javaSuppressChildren) ifTrue: [retval: true] False: [
                  retval: (owner javaSuppressedChild).
               ]
            ].
            retval).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaTopLevel = ( |
            | 
            (owner = nil) || [
             (owner isWorldMorph) || [
              (owner isHandMorph) ]]    ifTrue: [ ^self ].
            owner javaTopLevel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaUserUpdateAllMorphs: user = ( |
            | 
            (javaSuppressObject not) ifTrue: [
               user sendDownload: javaObjectID IsA: javaClassName Data: javaDataPairs: 'all'.
            ] False: [].
            (javaSuppressChildren not) ifTrue: [
               morphs reverseDo: [ |:m| m javaUserUpdateAllMorphs: user ]
            ] False: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Place the given morph behind all submorphs in the receiver.\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToBack: m = ( |
            | 
            (rawMorphs includes: m) ifTrue: [| mList |
                m changed.
                mList: rawMorphs asList.
                mList remove: m.
                mList addLast: m.
                rawMorphs: mList asVector.
                layoutChanged.
            ].
            m javaChanged: 'childNumber'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Place the given morph in front of all submorphs in the receiver.\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         moveToFront: m = ( |
            | 
            (rawMorphs includes: m) ifTrue: [| mList |
                m changed.
                mList: rawMorphs asList.
                mList remove: m.
                mList addFirst: m.
                rawMorphs: mList asVector.
                layoutChanged.
            ].
            m javaChanged: 'childNumber'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fComment: Set the position of this morph to the given point, in the
coordinates of the morph that owns it.\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
            | 
            rawBox: p ## (rawBox size). 
            javaChanged: 'position'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Remove the receiver from the morph that currently owns it, if
any, and make the given morph its new owner. The morph\'s global
position is preserved, although its local position within its new
owner will, in general, be different from its local position in its
old owner.\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         privateSetOwner: m = ( |
             oldOwner.
            | 
            oldOwner: owner.
            m = owner ifFalse: [| globalP |
                globalP: globalPosition.
                rawOwner: m.
                globalPosition: globalP.

               javaOwnerChangedFrom: oldOwner To: m. "Andy 8/23/96"
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fComment: Resize the receiver\'s base to fit into the given rectangle as well
as possible.  If the receiver cannot fill the rectangle, it should
nestle into the upper-left corner.

Note: this method resizes the receiver regardless of its
resizability settings.  The sender is responsible for only
sending this when appropriate.  Even rigid morphs can be
forcibly resized using this method.\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            rawBox: r.
            javaChanged: 'baseBounds,canvasCmd'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressChildren = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'outliner' -> () From: ( | {
         'Category: expandAndCollapse\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
                        expander isNil || [isExpanded]  ifFalse: [
                          expander isExpanded  ifFalse: [ expander expand: evt ].
                          itemsCached ifFalse: [
                            buildBody.
                            constructItems.
                            constructBoxedItems.
                            itemsCached: true.
                          ].
                          safelyDo: [
                            addBodyMorph.
                            colorAll: color. "dave's experiment"
                          ].
                          body morphs do: [ |:m| m javaChanged: 'all' ].
                          "Andy 7/10/96 - The remote clients aren't so lucky as to be caching"
            "               safelyDo: [
                              javaMyJavaDaemons do: [|:d|
                                 d javaUsers do: [|:user|
                                    (javaTopLevel globalBounds top < user viewArea bottom) && [
                                     (javaTopLevel globalBounds bottom > user viewArea top) && [
                                      (javaTopLevel globalBounds right > user viewArea left) && [
                                       (javaTopLevel globalBounds left < user viewArea right) ]]]
                                     ifTrue: [ frame javaUserUpdateAllMorphs: user ].
                                 ].
                              ].
                           ]."
                        ].
                        self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'radarView' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressChildren = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         addAllMorphs: mList = ( |
             ownersToNotify.
            | 
            "Add the given morphs to the receiver in a batch, removing
             them from their old owners, if any. Layout change notification
             is deferred until all the morphs have been added, and each old
             owner is notified only once, regardless of how many of the
             morphs being added were previously owned by it."
            "This method is overridden to save the cost of maintaining the
             global position invariant, since the morphs added will be moved
             during layout."

            mList do: [| :m. oldOwner |
                oldOwner: m owner.
                ((nil = oldOwner) || [oldOwner = self]) ifFalse: [
                    m changed.
                    oldOwner privateRemoveMorph: m IfPresentDo: [
                        nil = ownersToNotify ifTrue: [ ownersToNotify: set copyRemoveAll ].
                        ownersToNotify add: oldOwner.
                    ].
                ].
                m flushLayoutCaches.
                m rawOwner: self.  "don't maintain globalPosition, since m will be laid out"
                m javaOwnerChangedFrom: oldOwner To: self. "Andy 8/23/96"
            ].
            rawMorphs: rawMorphs, mList asVector.
            layoutChanged.
            nil = ownersToNotify ifFalse: [ ownersToNotify do: [| :o | o layoutChanged ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressChildren = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressObject = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'screenEdge' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressUpdates = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         value: newValue = ( |
            | 
            myValue = newValue ifFalse: [
                myValue: newValue.
                notifyTarget.
            ].
            javaChanged: 'canvasCmd'. "Andy 8/9/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'string' -> () From: ( | {
         'Category: padding\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         whiteSpace = ' 	
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'trashCanMorph' -> () From: ( | {
         'ModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            "Problems with trashing the trash
             can when dropping it - Andy 8/23/96"
            (m != self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'Category: panel\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         clearPanel = ( |
            | 
            panel isActive ifTrue: [
              frameStyle: flatStyle.
              javaChanged: 'frameStyle'. "Andy 8/26/96"
              panel isActive: false.
              changed
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'Category: panel\x7fComment: Invoked whenever the text has changed\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         textHasChanged = ( |
            | 
            resend.textHasChanged.
            panel isActive ifFalse: [
              frameStyle: insetBezelStyle.
              panel isActive: true.
              changed
              javaChanged: 'frameStyle'. "Andy 8/22/96"
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         changeDepressedState = ( |
            | 
            frameStyle:
             case if: [ rawState = 'down' ] Then: [ insetBezelStyle ]
                  If: [ rawState = 'up'   ] Then: [      bezelStyle ]
                  Else: flatStyle.
            changed.
            javaChanged: 'frameStyle'. "Andy 7/23/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'SelfUI2Button'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaGetColormapDataString = ( |
             hexDigit.
             output.
            | 
            hexDigit: '0123456789abcdef'.
            output: ''.

            (colors size) do: [ |:i. c|
               c: colors at: i.

               "Alpha value"
               i = transparentPixelValue ifTrue: [
                  output: output, '00'.
               ] False: [
                  output: output, 'ff'.
               ].

               "Red value"
               output: output, 
                       (hexDigit byteAt: ((c red * 255) asInteger >> 4)) asCharacter,
                       (hexDigit byteAt: ((c red * 255) asInteger && 15)) asCharacter,
               "Green value"
                       (hexDigit byteAt: ((c green * 255) asInteger >> 4)) asCharacter,
                       (hexDigit byteAt: ((c green * 255) asInteger && 15)) asCharacter,
               "Blue value"
                       (hexDigit byteAt: ((c blue * 255) asInteger >> 4)) asCharacter,
                       (hexDigit byteAt: ((c blue * 255) asInteger && 15)) asCharacter.
            ].
            output).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Image' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaGetImageDataString = ( |
             lines.
             output.
            | 
            lines: pixelDataHexString asTokensSeparatedByWhiteSpace.
            output: ''.
            lines do: [|:l| output: output, l].
            output).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: popUp/Down\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         addToWorld: w = ( |
            | 
            "Assume the menu's position and activeHand have been set."

            (w morphs includes: self) ifFalse: [ w addMorph: self ].
            w moveToFront: self.
            buttons do: [| :m |
                (m globalBounds includes: activeHand lastCursor) ifTrue: [ markButton: m ].
            ].
            activeHand subscribeUntilAllUp: self.

            "Send a download on this object even without asking, since it is
             necessarily new to the world"
            javaMyJavaDaemons do: [ |:d|
               d javaUsers do: [ |:u|
                  ((u viewArea) intersects: globalBounds) ifTrue: [
                     javaUserUpdateAllMorphs: u.
                  ].
               ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressUserDownloads = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: interaction support\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         markButton: b = ( |
            | 
            markedButton = nil ifFalse: [ unmarkButton: markedButton ].
            b isGrayedOut ifTrue: [
                markedButton: nil.
                ^self. 
            ].
            b = tearOffButton ifTrue: [
                b indentAndSelect: true.
            ] False: [
                b outdentAndSelect: true.
            ].
            markedButton: b.
            b changed.
            b javaChanged: 'frameStyle'. "Andy 7/24/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Menu' -> () From: ( | {
         'Category: interaction support\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         unmarkButton: b = ( |
            | 
            b = tearOffButton ifTrue: [
                b outdentAndSelect: false.
            ] False: [
                b flattenAndSelect: false.
            ]. 
            b rawState: 'up'. 
            b changed. 
            b javaChanged: 'frameStyle'. "Andy 7/24/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         clearSelection = ( |
            | 
            "Remove the current selection"
            hasSelection ifFalse: [^self].
            inSelection: [| :a. :b |
              hasSelection: false.
              drawLinesFrom: a y To: b y.
            ].
            c on.
            javaChanged: 'selection'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: cursor navigation\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         goto: pt = ( |
            | 
            clearSelection.
            insertionPoint: textGrid: pt.
            inView ifFalse: [ editorMorph resizeAfterKeystroke ] True: [ c adjust ].
            selectionHasChanged.
            changed.
            javaChanged: 'cursorx,cursory,off'.  "Andy 8/22/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaClassName = 'SelfUI2TextField'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDataPairs: changedFields = ( |
             d.
            | 
            d: resend.javaDataPairs: changedFields.

            (changedFields = 'all') ||
             [(changedFields matchesPattern: '*text*') ||
              [changedFields matchesPattern: '*numLines*']] ifTrue: [
               d at: 'numLines' Put: ((contents size) asString).
            ].
            (changedFields = 'all') || [changedFields matchesPattern: '*text*'] ifTrue: [
               (contents size) do: [ |:index|
                  d at: ('line', index asString) Put: (contents at: index).
               ].
            ] False: [
               (contents size) do: [ |:index|
                  (changedFields matchesPattern: ('*line', index asString, '*')) ifTrue: [
                     d at: ('line', index asString) Put: (contents at: index).
                  ].
               ].
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*off*'] ifTrue: [
               d at: 'off' Put: off asString.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*cursor*'] ifTrue: [
               d at: 'cursorx' Put: ((insertionPoint x) asString).
               d at: 'cursory' Put: ((insertionPoint y) asString).
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*selection*'] ifTrue: [
               d at: 'hasSelection' Put: hasSelection asString.
               d at: 'selectionx' Put: ((selectionEnd x) asString).
               d at: 'selectiony' Put: ((selectionEnd y) asString).
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*focus*'] ifTrue: [
               d at: 'focus' Put: amIATypingFocus asString.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*fontColor*'] ifTrue: [
               d at: 'fontColor.red'   Put: fontColor red.
               d at: 'fontColor.green' Put: fontColor green.
               d at: 'fontColor.blue'  Put: fontColor blue.
            ].
            (changedFields = 'all') ||
             [(changedFields matchesPattern: '*focus*') || 
              [changedFields matchesPattern: '*backgroundColor*']] ifTrue: [
               d at: 'backgroundColor.red'   Put: backgroundColor red.
               d at: 'backgroundColor.green' Put: backgroundColor green.
               d at: 'backgroundColor.blue'  Put: backgroundColor blue.
            ].
            (changedFields = 'all') ||
             [(changedFields matchesPattern: '*focus*') || 
              [changedFields matchesPattern: '*cursorColor*']] ifTrue: [
               d at: 'cursorColor.red'   Put: modifiedCursorColor red.
               d at: 'cursorColor.green' Put: modifiedCursorColor green.
               d at: 'cursorColor.blue'  Put: modifiedCursorColor blue.
            ].
            (changedFields = 'all') ||
             [(changedFields matchesPattern: '*focus*') || 
              [changedFields matchesPattern: '*selectionColor*']] ifTrue: [
               d at: 'selectionColor.red'   Put: modifiedSelectionColor red.
               d at: 'selectionColor.green' Put: modifiedSelectionColor green.
               d at: 'selectionColor.blue'  Put: modifiedSelectionColor blue.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*fontWidth*'] ifTrue: [
               d at: 'fontWidth' Put: fontWidth.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*fontHeight*'] ifTrue: [
               d at: 'fontHeight' Put: fontHeight.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*lineHeight*'] ifTrue: [
               d at: 'lineHeight' Put: line_height.
            ].
            (changedFields = 'all') ||
             [changedFields matchesPattern: '*cornerOffset*'] ifTrue: [
               d at: 'cornerOffset.x' Put: corner_offset x.
               d at: 'cornerOffset.y' Put: corner_offset y.
            ].

            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaSuppressChildren = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         scroll: value = ( |
             lineToScroll <- 0.
            | 
            "called when using the scrollbar, value in [0.0, 1.0]"
            lineToScroll: contents size - linesInView.
            lineToScroll > 0 ifTrue: [| new_off <- 0 |
              "compute first line to display"
              new_off: ((1.0 - value) * lineToScroll) asInteger.
              off = new_off ifFalse: [ off: new_off. changed.
               javaChanged: 'off' ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: scrolling\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: public'
        
         scrollIntoView: pt = ( |
             offset.
            | 
            case
             if: [ linesInView >= contents size     ] Then: [ off: 0 ]
             If: [ offset: pt y - off.  offset < 0  ] Then: [ off: off + offset max: 0 ]
             If: [ offset >= linesInView            ] Then: [ off: off + (offset - linesInView) succ
                                                                   min: contents size - linesInView ].
            javaChanged: 'off'.
            changeSliderValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: selection\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         selectionHasChanged = ( |
            | 
            isInWorld ifTrue: [ editorMorph selectionHasChanged ].
            javaChanged: 'selection'. "Andy 8/22/96"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         textHasChanged = ( |
            | 
            isInWorld ifTrue: [ editorMorph textHasChanged ].
            javaChanged: 'text,cursor,off'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2_textField' -> () From: ( | {
         'Category: text operations\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         textHasChanged: lineno = ( |
            | 
            isInWorld ifTrue: [ editorMorph textHasChanged ].
            javaChanged: ('line', (lineno asString)).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaCachedJavaDaemons = ( |
            | 
            self _AddSlots: (| javaCachedJavaDaemons <- list copyRemoveAll |).
            javaCachedJavaDaemons).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaCachedJavaDaemons: newList = ( |
            | 
            javaCachedJavaDaemons.  "fire for effect"
            javaCachedJavaDaemons: newList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         javaDataPairs: changedFields = ( |
             d.
            | 
            d: resend.javaDataPairs: changedFields.

            " the -inf notation confuses Java, so just remove the baseBounds to
              totally prevent drawing - may cause problems with globalBounds "

            d removeKey: 'baseBounds.top'    IfAbsent: [].
            d removeKey: 'baseBounds.bottom' IfAbsent: [].
            d removeKey: 'baseBounds.left'   IfAbsent: [].
            d removeKey: 'baseBounds.right'  IfAbsent: [].

            d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: java interface\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot'
        
         morphsAt: pt = ( |
             r.
            | 
            r: resend.morphsAt: pt.
            r copyFilteredBy: [|:m| m root isJavaHandMorph not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: running\x7fCategory: private\x7fCategory: step timeout process\x7fComment: If step takes longer than this,
assume it is hung.
-- Ungar, 5/29/95
Modded from 20000 to 120000 by javaInterface.
-- Andy, 8/16/96\x7fModuleInfo: Module: javaInterface InitialContents: FollowSlot\x7fVisibility: private'
        
         stepTimeoutMs = 120000.
        } | ) 



 '-- Side effects'

 globals modules javaInterface postFileIn
