 '$Revision: 30.16 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handMorph = bootstrap define: bootstrap stub -> 'globals' -> 'handMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals polygonMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals handMorph.

CopyDowns:
globals polygonMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (30)'
        
         cachedNameWidth <- 30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (set copyRemoveAll)'
        
         capabilitySet <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         cursorInterest <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         eventBeingHandledAndForwarded.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         keyboardInterest <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         lastCursor <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         lastMouseDownEvent.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (nil)'
        
         metaHand.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         morphToEmbed.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         morphsNotReadyToBeDropped <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (18@12)'
        
         nameOffset <- 18@12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( |
             {} = 'Comment: A handMorph represents the user\'s hand in the world,
     and is controlled by a pointing device such as a mouse. The hand
     is invisible and throws no shadow unless it is carrying something.

     A handMorph distributes events from the the cursor and keyboard
     associated with a particular X display to all objects that have
     expressed interest in (that is, that subscribe to) those events.
     The hand also drops certain events into the world at its current
     position. A dropped event typically falls down through the morph
     hierarchy  until it reaches some morph that handles it. The world
     absorbs any events that fall all the way through. The hand carries
     morphs by making them submorphs of itself.\x7fModuleInfo: Creator: traits handMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'handMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         untilAllUpClient.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         windowInterest <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         handMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules handMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         myComment <- 'The hand morph.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            handMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.16 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'userProfile
capability
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: meta hand\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         absorbHand = ( |
             mphs.
            | 
            isInWorld ifFalse: [ error: 'this hand not in a world' ].
            mphs: (world morphs asList copyFilteredBy: [ | :m |
              (baseBounds intersects: m baseBounds)
               ]).
            mphs findFirst: [ | :m | m isHandMorph]
                 IfPresent: [ | :m |
                    m metaHand: self.
                    world hands at: (world hands keyOf: self) Put: m.
                    world removeMorph: m.
                    m privateSetOwner: world.
                    privateSetOwner: nil.
                   "m imageFromPolygonMorph: m." ]
                 IfAbsent: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: capabilities\x7fComment: clump is some collection\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addAllCapabilities: clump = ( |
            | 
            clump do: [ | :c | 
              addCapability: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: capabilities\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addCapability: c = ( |
            | 
            capabilitySet add: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorph: m = ( |
            | 
            "override to put new morph on top"
            resend.addMorph: m.
            moveToFront: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: attaching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         attach: m = ( |
            | 
            m owner ifNotNil: [ m delete ].
            addMorph: m.
            morphsNotReadyToBeDropped add: m.
            " have to do this after adding cause morphs not laid out
              till in world "

            m globalPosition: globalPosition - (m baseBounds size / 2).
            m changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: attaching\x7fComment: Move all the morphs from hand h to me.\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         attachAllFromHand: h = ( |
            | 
            h morphs do: [| :m. p. |
              p: m position.
              addMorph: m.
              morphsNotReadyToBeDropped add: m.
              m position: p.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         baseBounds = ( |
            | 
            resend.baseBounds union: 
              ((position + nameOffset) ##
                (cachedNameWidth @ userInfo preferences nameFontSpec size))).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         baseBoundsOn: c = ( |
            | 
            (isNameShownOn: c) ifTrue: [baseBounds] False: [resend.baseBounds]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: geometry\x7fComment: True if this morph\'s base contains the given point.  The point
is in the coordinates of the morph that owns this morph.\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
            | 
            (resend.baseContainsPt: p) || 
            [((position + nameOffset) ## (cachedNameWidth @ userInfo preferences nameFontSpec size)) 
               includes: p]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
             wc.
            | 
            wc: winCanvasForHand.
            wc isNotNil && [aCanvas isSameDisplayAs: wc]
                ifFalse: [ resend.baseDrawOn: aCanvas ].
            (isNameShownOn: aCanvas) ifTrue: [drawNameOn: aCanvas].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: carrying morphs\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         carryMorphsEntering: aWindowCanvas = ( |
            | 
            desktop servers
                if: aWindowCanvas display serverName
                IsPresentPut: [|:p|
                    p isNil  ||  [p x = 'enter'] ifTrue: [
                        pair copyX: 'enter' Y: self
                    ]
                    False: [
                        p y != self  ifTrue: [attachAllFromHand: p y].
                        nil
                    ]
                ]
                AndDo: []
                IfAbsentPut: [pair copyX: 'enter' Y: self]
                AndDo: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: carrying morphs\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         carryMorphsLeaving: aWindowCanvas = ( |
            | 
            aWindowCanvas platformWindow ungrabPointer.
            desktop servers
                if: aWindowCanvas display serverName
                IsPresentPut: [|:p|
                    p ifNil: [
                      pair copyX: 'leave' Y: self
                    ]
                    IfNotNil: [
                        p x = 'leave' ifTrue: [ p ]
                        False: [
                            p y != self ifTrue: [p y attachAllFromHand: self].
                            nil
                        ]
                    ]
                ]
                AndDo: []
                IfAbsentPut: [pair copyX: 'leave' Y: self]
                AndDo: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: basics\x7fComment: Overides this method so that a colorChangerMorph for example
will also change the screen edges, but not the held objects.\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            isInWorld ifFalse: [ color: newC. ^ self].
            (world morphs asList copyFilteredBy: 
               [| :m | (m morphTypeName = screenEdge morphTypeName) && 
                       [m winCanvas     = winCanvasForHand]
               ]
            ) do: [ | :se | se colorAll: newC].
            color: newC. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             new.
            | 
            new: resend.copy.
            new cursorInterest:     cursorInterest copy.
            new keyboardInterest: keyboardInterest copy.
            new windowInterest:     windowInterest copy.
            new userInfo: userInfo copy.
            new userInfo hand: new.
            new capabilitySet: capabilitySet copy.
            new morphsNotReadyToBeDropped: morphsNotReadyToBeDropped copyRemoveAll.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: copying\x7fComment: Prototype corruption defensiveness\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAllSubscribers = ( |
            | copy removeAllSubscribers).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithFullCapabilities = ( |
             new.
            | 
            new: copy.
            new addAllCapabilities: fullCapabilitySet.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyWithNoCapabilities = ( |
             new.
            | 
            new: copy.
            new removeAllCapabilities.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: damageManagement\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         damagedLeft: l Right: r Top: t Bottom: b From: m = ( |
             p.
            | 
            "Override this message to add the shadow offset."

            owner ifNotNil: [| px <- 0. py <- 0. |
                p: position.
                px: p x.
                py: p y.
                owner damagedLeft: l + px
                            Right: r + px + shadowOffset x
                              Top: t + py
                           Bottom: b + py + shadowOffset y
                             From: m.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         dispatchFrom: aWindowCanvas = ( |
             e.
             xEvt.
            | 
            xEvt: (getEventFromWindowCanvas: aWindowCanvas ).
            e: (aWindowCanvas ui2Event copyFrom: xEvt LastCursor: lastCursor).

            xEvt delete.

            e ignore ifTrue: [ ^self ].
            e sourceHand: self.
            e adjustForCanvas: aWindowCanvas.

            e keyEvent      ifTrue: [handleAndForward: e To: keyboardInterest. ^ self].
            e windowEvent   ifTrue: [handleAndForward: e To: windowInterest.   ^ self].
            e wheelMovedInX ifTrue: [handleAndForward: e To: vector.   ^ self].
            e wheelMovedInY ifTrue: [handleAndForward: e To: vector.   ^ self].

            e mouseMotion   ifTrue: [^ handleMouseMotionOn: aWindowCanvas From: e].

            e mouseUp       ifTrue: [^ handleMouseUpOn: aWindowCanvas From: e].
            e mouseDown ifTrue: [
                "a mouse button-down transition; see if it makes a double-click"
                ^ handleMouseDownOn: aWindowCanvas From: e
            ].
            "fall through for a null event"
            ('got unknown event: ', e type printString) printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         doubleClickTime <- 300.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         drawNameOn: c = ( |
             h.
             s.
            | 
            h: userInfo preferences nameFontSpec size.
            s: name ifNil: ['!??'].
            c text: s 
                At: position +  (nameOffset +  (0@h))
            FontSpec: userInfo preferences nameFontSpec
             Color: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: aCanvas = ( |
             wc.
            | 
            0 = morphCount ifFalse: [| c |
                c: (aCanvas copyOffset: position + shadowOffset).
                c translucentlyDo: [
                    c withColor: shadowColor Do: [
                        "draw all morphs with stippled shadowColor"
                        morphsDo: [| :m | m drawShadowOn: c ].
                    ].
                ].
                c: (aCanvas copyOffset: position).
                morphsReverseDo: [| :m | m drawOn: c ].
            ].
            baseDrawOn: aCanvas.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: grabbingAndDropping\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         drop: aMorph Event: evt = ( |
            | 
            morphsNotReadyToBeDropped remove: aMorph IfAbsent: [].
            "do not send m delete because that would do way too much, e.g. collapse arrows"
            aMorph owner removeMorph: aMorph.
            world fallingMorph: aMorph Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: e = ( |
            | 
            isInWorld ifTrue: [ 
                "changed to world for mouse wheel scrolling-- dmu"
                dropEvent: e On: world "topRootMorphAt: e cursorPoint"
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: e On: m = ( |
            | 
            m dispatchEvent: e At: e cursorPoint.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: capabilities\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         fullCapabilitySet = ( |
             s.
            | 
            s: set copyRemoveAll.
            s add: capabilities grabObject.
            s add: capabilities editText.
            s add: capabilities pressButton.
            s add: capabilities middleMouse.
            s add: capabilities rightMouse.
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         getEventFromWindowCanvas: wc = ( |
             evt.
            | 
            evt: wc nextEvent.
            evt isMotionEvent ifFalse: [^ evt].

            "Note: to improve mouse tracking, a sequence of motion events
             is reported as a single motion event having the coordinates of
             the last motion event in the sequence. This approach would not
             be appropriate in a pen-based application that needs to record
             the complete path of the pointing device."
            "The Mac never uses this code, since its
             motion events look like null events at this stage.
             But, the VM does it anyway for the Mac."
            [(0 < wc eventsPending) &&
              [|e. isM| e: wc peekEvent.
                   isM: e isMotionEvent.
                   e delete.
                   isM]
            ] whileTrue: [
                evt delete.
                evt: wc nextEvent.   "Read it for good."
            ].
            evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: grabbingAndDropping\x7fComment: Nobody sends this as of 9 - 13 - 95\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         grabAt: p = ( |
             pile.
            | 
            "Grab the root morph of the top morph at the given point. That
             is, make the grabbed morph be a submorph of the hand."

            pile: world morphsAt: p.
            pile remove: world.
            pile isEmpty ifFalse: [| m |
                m: pile first root.
                m changed.
                m globalPosition: globalPosition + (m globalPosition - p).
                addMorph: m.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         handleAndForward: e To: subscribers = ( |
            | 
            eventBeingHandledAndForwarded: e.
            e mouseMotion ifTrue: [
                subscribers do: [| :s | s mouseMove: e ].
                handleMouseMove: e.
                ^self
            ].
            e keyDown ifTrue: [
                (capabilitySet includes: capabilities editText) ifFalse: [ ^ self ].
                subscribers do: [| :s | s keyDown: e ].
                handleKeyDown: e.
                ^self
            ].
            e keyUp ifTrue: [
                subscribers do: [| :s | s keyUp: e ].
                ^self
            ].
            e leftMouseDown ifTrue: [
                subscribers do: [| :s | s leftMouseDown: e ].
                handleLeftMouseDown: e.
                subscribers do: [| :s | s mouseMove:     e ].
                handleMouseMove: e.
                ^self
            ].
            e middleMouseDown ifTrue: [
                (capabilitySet includes: capabilities middleMouse) ifTrue: [
                  subscribers do: [| :s | s middleMouseDown: e ].
                  handleMiddleMouseDown: e.
                ].
                subscribers do: [| :s | s mouseMove:       e ].
                handleMouseMove: e.
                ^self
            ].
            e rightMouseDown ifTrue: [
                (capabilitySet includes: capabilities rightMouse) ifTrue: [
                  subscribers do: [| :s | s rightMouseDown: e ].
                  handleRightMouseDown: e.
                ].
                subscribers do: [| :s | s mouseMove:      e ].
                handleMouseMove: e.
                ^self
            ].
            e leftMouseUp ifTrue: [
                subscribers do: [| :s | s mouseMove:   e ].
                handleMouseMove: e.
                subscribers do: [| :s | s leftMouseUp: e ].
                handleLeftMouseUp: e.
                ^self
            ].
            e middleMouseUp ifTrue: [
                subscribers do: [| :s | s mouseMove:     e ].
                handleMouseMove: e.
                (capabilitySet includes: capabilities middleMouse) ifTrue: [
                  subscribers do: [| :s | s middleMouseUp: e ].
                  handleMiddleMouseUp: e.
                ].
                ^self
            ].
            e rightMouseUp ifTrue: [
                subscribers do: [| :s | s mouseMove:    e ].
                handleMouseMove: e.
                (capabilitySet includes: capabilities rightMouse) ifTrue: [
                  subscribers do: [| :s | s rightMouseUp: e ].
                  handleRightMouseUp: e.
                ].
                ^self
            ].
            e leftDoubleClick ifTrue: [
                subscribers do: [| :s | s mouseMove:   e ].
                handleMouseMove: e.
                subscribers do: [| :s | s leftDoubleClick: e ].
                handleLeftDoubleClick: e.
                ^self
            ].
            e middleDoubleClick ifTrue: [
                subscribers do: [| :s | s mouseMove:   e ].
                handleMouseMove: e.
                subscribers do: [| :s | s middleDoubleClick: e ].
                handleMiddleDoubleClick: e.
                ^self
            ].
            e rightDoubleClick ifTrue: [
                subscribers do: [| :s | s mouseMove:   e ].
                handleMouseMove: e.
                subscribers do: [| :s | s rightDoubleClick: e ].
                handleRightDoubleClick: e.
                ^self
            ].
            e wheelMovedInX ifTrue: [
                subscribers do: [| :s | s mouseMove:   e ].
                handleMouseMove: e.
                subscribers do: [| :s | s wheelMovedInX: e ].
                handleWheelMovedInX: e.
                ^self
            ].
            e wheelMovedInY ifTrue: [
                subscribers do: [| :s | s mouseMove:   e ].
                handleMouseMove: e.
                subscribers do: [| :s | s wheelMovedInY: e ].
                handleWheelMovedInY: e.
                ^self
            ].
            e windowEvent ifTrue: [
                subscribers do: [| :s | s windowEvent: e ].
                ^self
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleKeyDown: e = ( |
            | 
            testMetaEscape: e.  
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleLeftDoubleClick: e = ( |
            | 
            moveTo: e cursorPoint.
            untilAllUpClient ifNil: [ dropEvent: e ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleLeftMouseDown: e = ( |
            | 
            moveTo: e cursorPoint.
            "If carrying something, just drop it:"
            "0 = morphCount ifFalse: [ ^ungrabEvent: e ]."
            "safe to drop morphs that were added while button was down"
            morphsNotReadyToBeDropped removeAll.
            0 = morphCount ifFalse: [ ^ self].
            untilAllUpClient ifNil: [ dropEvent: e ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleLeftMouseUp: e = ( |
            | 
            moveTo: e cursorPoint.
            ungrabEvent: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleMiddleDoubleClick: e = ( |
            | 
            moveTo: e cursorPoint.
            untilAllUpClient ifNil: [ dropEvent: e ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleMiddleMouseDown: e = ( |
            | 
            moveTo: e cursorPoint.
            "If carrying something, just drop it:"
            "0 = morphCount ifFalse: [ ^ungrabEvent: e ]."
            untilAllUpClient ifNil: [ dropEvent: e ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleMiddleMouseUp: e = ( |
            | 
            moveTo: e cursorPoint.
            "ungrabEvent: e."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         handleMouseDownOn: aWindowCanvas From: e = ( |
            | 
            "a mouse button-down transition; see if it makes a double-click"
            "should move double-click logic to events , dmu 8/99"
                   e doesPlatformReportDoubleClicks not &&
                 [ lastMouseDownEvent isNotNil &&
                 [(lastMouseDownEvent type = e type) &&
                 [(doubleClickTime > (e timeStamp - lastMouseDownEvent timeStamp))]]] ifTrue: [| doubleClick |
                    doubleClick: lastMouseDownEvent copy.
                    'leftMouseDown'   = doubleClick type ifTrue: [ doubleClick type:   'leftDoubleClick' ].
                    'middleMouseDown' = doubleClick type ifTrue: [ doubleClick type: 'middleDoubleClick' ].
                    'rightMouseDown'  = doubleClick type ifTrue: [ doubleClick type:  'rightDoubleClick' ].
                     handleAndForward: doubleClick To: cursorInterest.
                    lastMouseDownEvent: nil.
                ] False: [
                    "doesn't make a double-click"
                    handleAndForward: e To: cursorInterest.
                    lastMouseDownEvent: e.
                ].
            recordCursorPositionOn: aWindowCanvas From: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         handleMouseMotionOn: aWindowCanvas From: e = ( |
            | 
            handleAndForward: e To: cursorInterest. 
            recordCursorPositionOn: aWindowCanvas From: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleMouseMove: e = ( |
            | moveTo: e cursorPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         handleMouseUpOn: aWindowCanvas From: e = ( |
            | 
            if: e IsOutsideOf: aWindowCanvas Then: [^ self].

            handleAndForward: e To: cursorInterest. 
            e anyMouseIsDown not  &&  [untilAllUpClient isNotNil] ifTrue: [
                "automatically unsubscribe untilAllUpClient"
                unsubscribeCursor: untilAllUpClient.
                untilAllUpClient: nil.
            ].
            recordCursorPositionOn: aWindowCanvas From: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleRightDoubleClick: e = ( |
            | 
            moveTo: e cursorPoint.
            untilAllUpClient ifNil: [ dropEvent: e ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleRightMouseDown: e = ( |
             target.
            | 
            moveTo: e cursorPoint.
            "If carrying something, just drop it:"
            "0 = morphCount ifFalse: [ ^ungrabEvent: e ]."
            untilAllUpClient ifNil: [
                target: (topRootMorphAt: e cursorPoint).
                target isWorldMorph ifTrue: [
                    dropEvent: e.
                ] False: [
                    target selfMenu popUp: e.
                ].
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleRightMouseUp: e = ( |
            | 
            moveTo: e cursorPoint.
            "ungrabEvent: e."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleWheelMovedInX: e = ( |
            | dropEvent: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         handleWheelMovedInY: e = ( |
            | dropEvent: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         if: evt IsOutsideOf: aWindowCanvas Then: blk = ( |
            | 
            "exclude mouseDowns outside canvas"
            "(mac receives them in the scroll bars"
            (aWindowCanvas boundingBoxInWorld includes: evt cursorPoint )
            ifTrue: [self] False: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: drawing\x7fComment: Take on the look of the polygonMorph
-- Randy, 6/12/95\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         imageFromPolygonMorph: pm = ( |
            | 
            pm imageAsCursorForHand: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: paint named: 'red'.
            position: 10@10.
            beRigid.
            vertexOffsets:
                ((8@16) & (7@8) & (17@18) & (18@18) & (18@16) & (9@7) & (17@8)) asVector.
            removeAllSubscribers.
            capabilitySet: fullCapabilitySet copy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isAKeyboardSubscriber: aMorph = ( |
            | keyboardInterest includes: aMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isHandMorph = ( |
            | 
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         isNameShownOn: aCanvas = ( |
             wc.
            | 
            wc: winCanvasForHand.
            wc isNotNil && [aCanvas isSameDisplayAs: wc]
                ifTrue: [ userInfo preferences showNameToSelf   ]
                 False: [ userInfo preferences showNameToOthers ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: meta hand\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         metaHandEvent: e = ( |
            | 
            e isShiftDownForLeftShiftHack ifTrue: [
              shedHand
            ] False: [  
              absorbHand ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: e = ( |
            | 

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'handMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseUsageComment = ( |
            | 
            'The mouse buttons are currently assigned the following functions:

                left            operate (e.g., move a slider or push a button) or
                                grab the morph if it has no special behavior
                middle          extend the selection in text editors
                right           menu').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: grabbingAndDropping\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         moveTo: p = ( |
            | 
            ((0 = morphCount) &&
             [ isInWorld &&
             [(world winCanvases size = 1)]]) ifTrue: [
                "need not report changed position if:
                    1. hand is not carrying anything and
                    2. world has only one display
                 otherwise, must redraw the hand on non-local displays"
                position: p.
                ^self.
            ].
            position = p ifFalse: [
                changed.
                position: p.
                changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: name and other userInfo issues\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         name = ( |
            | 
            userInfo name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: name and other userInfo issues\x7fComment: use this message to change the preferredName in the userInfo
object. This will update the hand\'s cachedNameSize slot.\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         name: s = ( |
            | 
            changed.
            userInfo preferredName: s.
            setCachedNameWidth.
            changed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: name and other userInfo issues\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         nameFontSpec: fs = ( |
            | 
            changed.
            setCachedNameWidth.
            userInfo preferences nameFontSpec: fs.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'ModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'polygonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         recordCursorPositionOn: aWindowCanvas From: e = ( |
            | 
            lastCursor: e cursorPoint + aWindowCanvas offset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: capabilities\x7fComment: Better not send this to your hand or
your kind of finished for the day.\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllCapabilities = ( |
            | 
            capabilitySet: capabilitySet copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAllKeyboardSubscribers = ( |
            | 
            keyboardInterest copy do: [|:subscriber| unsubscribeKeyboard: subscriber].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllSubscribers = ( |
            | 
            cursorInterest:   cursorInterest   copyRemoveAll.
            removeAllKeyboardSubscribers.
            windowInterest:   windowInterest   copyRemoveAll.
            untilAllUpClient: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: capabilities\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeCapability: c = ( |
            | 
            removeCapability: c IfAbsent: [ error: 'capability not present']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: capabilities\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeCapability: c IfAbsent: blk = ( |
            | 
            capabilitySet remove: c IfAbsent: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: name and other userInfo issues\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         setCachedNameWidth = ( |
             w.
            | 
            isInWorld ifTrue: [| xfnt |
              xfnt: (world anyOpenWindowCanvas structForFontSpec: userInfo preferences nameFontSpec).
              cachedNameWidth:  (xfnt textWidth: name).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: meta hand\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot'
        
         setNewMetaHand = ( |
            | 
            metaHand: copy.
            metaHand userInfo: userInfo. "Shares with current"
            metaHand privateSetOwner: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: name and other userInfo issues\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         setUserInfo = ( |
            | 
            userInfo setNamesByGuess.
            setCachedNameWidth.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: meta hand\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         shedHand = ( |
             w.
            | 
            isInWorld ifFalse: [ error: 'hand notInWorld' ].
            metaHand ifNil: [setNewMetaHand].
            metaHand privateSetOwner: world.
            world hands at: (world hands keyOf: self) Put: metaHand.
            w: world.
            privateSetOwner: nil. "..in theory only, this should not be necessary, but hands are weird."
            w addMorph: self.
            metaHand: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: drawing\x7fComment: Take on the default window system
appearance of the cursor.
  -- Randy, 6/12/95\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         showDefaultImage = ( |
            | 
            (world winCanvasForHand: self) platformWindow undefineCursor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subscribeCursor: subscriber = ( |
            | 
            (cursorInterest includes: subscriber) ifFalse: [
                cursorInterest add: subscriber.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subscribeKeyboard: subscriber = ( |
            | 
            (isAKeyboardSubscriber: subscriber) ifFalse: [
                keyboardInterest add: subscriber.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subscribeKeyboardExclusive: subscriber = ( |
            | 
            "Subscribe the given subscriber, unsubscribing all others."

            keyboardInterest copy do: [|:s| s = subscriber ifFalse: [unsubscribeKeyboard: s]].
            keyboardInterest isEmpty ifTrue: [ keyboardInterest add: subscriber ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subscribeUntilAllUp: subscriber = ( |
            | 
            "First unsubscribe the old client, if any. There is at most one untilAllUp client
             at any given time. This means clients of subscribeUntilAllUp get exclusive
             access until the mouse button goes up or another client prempts them."

            untilAllUpClient ifNotNil: [ unsubscribeCursor: untilAllUpClient ].
            subscribeCursor:  subscriber.
            untilAllUpClient: subscriber.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subscribeWindow: subscriber = ( |
            | 
            (windowInterest includes: subscriber) ifFalse: [
                windowInterest add: subscriber.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: dispatching\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         testMetaEscape: e = ( |
            | 
            "holding down meta key and typing escape"
            "(meta is command on mac)"
            (e metaIsDown) && [e keyDown && [e keystrokes includes: '\x1b']] ifTrue: [metaHandEvent: e]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: event handling\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         topRootMorphAt: p = ( |
            | 
            world rootMorphsAt: p Do: [| :m | ^m ].
            world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: grabbingAndDropping\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         ungrabEvent: evt = ( |
             mList.
            | 
            "Drop all morphs being carried by the hand."
            0 = morphCount ifTrue: [ ^self ].
            mList: morphs asList copyFilteredBy: [|:m| 
              (morphsNotReadyToBeDropped includes: m) not].
            "use reverse do so that bottommost morphs drop first"
            mList reverseDo: [| :m | drop: m Event: evt ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         unsubscribeCursor: subscriber = ( |
            | 
            untilAllUpClient = subscriber ifTrue: [ 
              untilAllUpClient: nil ].
            cursorInterest remove: subscriber IfAbsent: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         unsubscribeKeyboard: subscriber = ( |
            | 
            keyboardInterest remove: subscriber IfAbsent: nil.
            subscriber keyboardSubscriptionLapsedFor: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: subscribing\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         unsubscribeWindow: subscriber = ( |
            | 
            windowInterest remove: subscriber IfAbsent: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: grabbingAndDropping\x7fComment: Simulate dragging the mouse.
-- Ungar, 6/20/95\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         warpTo: p = ( |
             delta.
             evt.
            | 
            "change the relationship of the cursor to the mouse"
            isInWorld ifFalse: [ ^ self ].
            winCanvasForHand warpCursorTo: p.
            "handleAndForward: will be distributing this event, must fix its loc"
            eventBeingHandledAndForwarded ifNotNil: [|:e| e cursorPoint: p].
            moveTo: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'handMorph' -> () From: ( | {
         'Category: accessing\x7fComment: get the winCanvas that
is my home
-- Ungar, 1/24/95\x7fModuleInfo: Module: handMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         winCanvasForHand = ( |
            | 
            isInWorld ifFalse: [ ^ nil ].
            world winCanvasForHand: self IfAbsent: nil).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'userProfile' From: 'ui2'
 bootstrap read: 'capability' From: 'ui2'



 '-- Side effects'

 globals modules handMorph postFileIn
