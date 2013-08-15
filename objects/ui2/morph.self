 'Sun-$Revision: 30.17 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'defaultBehavior' -> () From: ( | {
         'Category: testing\x7fComment: Override me and implement asMorph to allow UI2 to
show a morph describing me instead of an outliner.
-- dmu 1/1/05\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isShowableAsMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot'
        
         morph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules morph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot'
        
         myComment <- 'The basic morph object.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            morph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.17 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'morph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals morph.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: morph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedMinHeight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: morph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedMinWidth.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The hResizing slot indicates the horizontal resizing style of
this morph, one of {rigid(0), flexible(1), shrinkWrap(2)}.
\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         hResizing <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The layoutOkay flag indicates that this morph\'s current layout
is correct; it is used to avoid unnecessary layout computations.
\x7fModuleInfo: Module: morph InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         layoutOkay <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: This private flag is used for an important optimization.
If true, then none of this morph\'s submorphs has a
bounds that sticks out beyound this morph\'s baseBounds.
This saves recomputing the bounds for most morphs.
\x7fModuleInfo: Module: morph InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         noStickOuts <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Basic\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'morph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits morph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: This slot provides a default geometry for a morph:
a simple rectangular area. Descendants such as
circleMorphs may replace this slot with their own
representation slots such as \"center\" and \"radius\".
\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         rawBox <- ((0)@(0)) # ((100)@(80)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         rawColor <- paint named: 'khaki'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: morph InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         rawMorphs <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fModuleInfo: Module: morph InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         rawOwner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The vResizing slot indicates the vertical resizing style of
this morph, one of {rigid(0), flexible(1), shrinkWrap(2)}.
\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         vResizing <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morph' -> () From: ( | {
         'Category: Basic Morph State\x7fComment: The velcroFlag indicates that all the submorphs of the reciever
are attached to the receiver as if by Velcro(tm). Futhermore, the
receiver is not open to having new morphs added to it via dropping.
This flag defaults to true.
\x7fModuleInfo: Module: morph InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         velcroFlag <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
            | 
            "NOTE! This method is the original one from traits morph.
             It overwrites the one defined in traits polygonMorph,
             which only returns true for points actually indside the
             polygon. Since an expander polygon is very small (as used
             in outliners), it is hard to hit. Therefore this more liberal
             method is used.

             True if this morph's base contains the given point. The point
             is in the coordinates of the morph that owns this morph."

            baseBounds includes: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'gasTank' -> () From: ( | {
         'Comment: Recursively add to the given collection all morphs of the
receiver (possibly including the receiver itself) whose
bases contain the given point.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         morphsAt: p Into: c = ( |
             localP.
            | 
            localP: p - position.
            noStickOuts && [(baseBounds asInteger includes: p) not] ifTrue: [ ^self ].
            morphsDo: [| :m | m morphsAt: localP Into: c].
            (baseContainsPt: p) ifTrue: [ c addLast: self ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Add the given morphs to the receiver in a batch, removing
them from their old owners, if any. Layout change notification
is deferred until all the morphs have been added, and each old
owner is notified only once, regardless of how many of the
morphs being added were previously owned by it.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         addAllMorphs: mList = ( |
             ownersToNotify.
            | 
            mList do: [| :m. :ignore. oldOwner |
                oldOwner: m owner.
                (oldOwner isNil || [oldOwner = self]) ifFalse: [
                    m changed.
                    oldOwner privateRemoveMorph: m IfPresentDo: [
                        nil = ownersToNotify ifTrue: [ ownersToNotify: set copyRemoveAll ].
                        ownersToNotify add: oldOwner.
                    ].
                ].
                m privateSetOwner: self.
                m flushLayoutCaches.
            ].
            rawMorphs: rawMorphs, mList asVector.
            layoutChanged.
            ownersToNotify ifNotNil: [ ownersToNotify do: [| :o. :ignore | o layoutChanged ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: dropping\x7fComment: This message is sent when morph m is dropped onto the receiver,
which chose to accept m by returning true to wantsMorph:Event:.
By default, this method simply adds the given morph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            addMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Add the given morph, m, to the receiver, making m\'s new owner
be the receiver and removing m from its previous owner, if any.
The new morph is added behind other submorphs of the receiver;
this ordering can be changed using moveToBack: and moveToFront:\"\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorph: m = ( |
             fixOldOwner <- bootstrap stub -> 'globals' -> 'false' -> ().
             oldOwner.
            | 

            oldOwner: m owner.
            oldOwner = self ifTrue: [ ^self ].
            (oldOwner isNil || [oldOwner = self]) ifFalse: [
                m changed.
                oldOwner privateRemoveMorph: m IfPresentDo: [ fixOldOwner: true ].
            ].
            m privateSetOwner: self.
            m flushLayoutCaches.
            rawMorphs: rawMorphs copyAddLast: m.
            layoutChanged.
            fixOldOwner ifTrue: [ oldOwner layoutChanged ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         addNonLaidOutMorph: m = ( |
            | 
            addMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fComment: Return collection of transitive closure of receiver and its submorphs.
-- Ungar, 4/11/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         allMorphs = ( |
             r.
            | 
            r: list copyRemoveAll.
            allMorphsDo: [|:m| r addLast: m].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fComment: Visit the receiver and all its submorphs, invoking
the given block on each morph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         allMorphsDo: blk = ( |
             todo.
            | 
            todo: list copyRemoveAll add: self.
            [todo isEmpty] whileFalse: [| thisMorph |
                thisMorph: todo removeFirst.
                blk value: thisMorph.
                thisMorph morphsDo: [| :m | todo add: m ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fComment: Recursively visit the receiver and all its submorphs, invoking
preBlock on each morph before visiting its submorphs and
postBlock afterwards.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         allMorphsDoPre: preBlock Post: postBlock = ( |
            | 
            preBlock value: self.
            morphsDo: [| :m | m allMorphsDoPre: preBlock Post: postBlock ].
            postBlock value: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: event dispatching\x7fComment: Return true (the default) if submorphs should have a
chance to handle the given event. Descendents may override
this method to keep submorphs from seeing certain kinds of
events. For example, a morph that is sensitive to leftMouseDown
could prevent its submorphs from seeing these events since
otherwise a submorph\'s handling of leftMouseDown events
(e.g., to grab the morph) would prevent the button itself
from seeing the event.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         animatedDelete = ( |
            | 

            isInWorld && [owner = world] ifTrue: [  
             (moveToPosition: globalPosition + (800 @ -300) Time: 1.0 ) 
                andThenSend: 'delete' To: self .
                self.
            ] False: [
                delete.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: showing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         asMorph = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
            | rawBox).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fComment: True if this morph\'s base contains the given point.  The point
is in the coordinates of the morph that owns this morph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
            | 
            baseBounds includes: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: copying\x7fComment: Copy the receiver and any objects that are part of its state,
but not its submorphs.  This method does only the local part
of the copying; see the comment in copy for an explanation of
how the entire tree of submorphs for a morph is copied.  This
method is typically overridden to copy additional (non-shared)
objects owned by this morph (e.g., a button\'s action object).\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
            | 
            clone).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: drawing\x7fComment: Draw the base of this morph on the given canvas.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
            | 
            aCanvas fillRectangle: baseBounds Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beFlexible = ( |
            | 
            hResizing: 1.
            vResizing: 1.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beFlexibleHorizontally = ( |
            | 
            hResizing: 1.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beFlexibleVertically = ( |
            | 
            vResizing: 1.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beRigid = ( |
            | 
            hResizing: 0.
            vResizing: 0.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beRigidHorizontally = ( |
            | 
            hResizing: 0.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beRigidVertically = ( |
            | 
            vResizing: 0.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beShrinkWrap = ( |
            | 
            hResizing: 2.
            vResizing: 2.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beShrinkWrapHorizontally = ( |
            | 
            hResizing: 2.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         beShrinkWrapVertically = ( |
            | 
            vResizing: 2.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fComment: Return a rectangle enclosing the visible portions of all
morphs owned by this morph.  The rectangle is in the
coordinates of the morph that owns this morph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         bounds = ( |
             bbnds.
             bottom <- -536870912.
             left <- 536870911.
             pX.
             pY.
             right <- -536870912.
             top <- 536870911.
            | 
            "Details: The noStickOuts flag supports an important
             optimization. If this flag is true, then none of this
             morph's descendants extends beyond this morphs bounds;
             thus, we need not visit them in order to compute this
             morph's bounds."

            noStickOuts ifTrue: [
                baseBounds.
            ] False: [
                0 = morphCount ifTrue: [
                    noStickOuts: true.
                    baseBounds.
                ] False: [
                    computeBounds.
                ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fComment: Answer an object to be used as the evaluation context for
button and menu actions.  For normal morphs, this is the morph
itself.  For morphs that represent arbitrary Self objects, this
is the representee.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonEvalContext = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: damage management\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         changed = ( |
             bnds.
             p.
            | 
            "Report that the area occupied by this morph should be redrawn."

            isInWorld ifFalse: [ ^self ].
            bnds: bounds.
            p: position.
            ["floors and ceils added for" quartz "dmu 4/07"].
            damagedLeft: bnds left   floor - p x
                  Right: bnds right  ceil  - p x
                    Top: bnds top    floor - p y
                 Bottom: bnds bottom ceil  - p y
                   From: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         color = ( |
            | rawColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         color: newC = ( |
            | 
            rawColor: newC.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fComment: Color all my parts that within reason should change to a new
color when the user so asks (with a colorChangerMorph for example).\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "color outer morph first so submorphs like "
            " pluggable slot outliners can refer to it"
            " -- dmu 5/1"
            color: newC.
            morphsDo: [| :m | m colorAll: newC ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         colorChanger: evt = ( |
            | 
            evt sourceHand attach: (colorChangerMorph copyTarget: self).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fComment: Compute the union of bounds of the receiver\'s submorphs.
Typically called only once after a structural change to
re-establish that no submorphs stick out; always called
if submorphs really do stick out.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         computeBounds = ( |
             bbnds.
             bottom <- -536870912.
             left <- 536870911.
             pX.
             pY.
             right <- -536870912.
             top <- 536870911.
            | 
            morphsDo: [| :m. mBnds |
                mBnds: m bounds.
                left:     left min: mBnds left.
                right:   right max: mBnds right.
                top:       top min: mBnds top.
                bottom: bottom max: mBnds bottom.
            ].

            bbnds: baseBounds.
            pX: position x.
            pY: position y.
            ( (bbnds   left <= (  left + pX)) && 
             [(bbnds  right >= ( right + pX)) &&
             [(bbnds    top <= (   top + pY)) &&
             [(bbnds bottom >= (bottom + pY)) ]]]) ifTrue: [
                noStickOuts: true.
                ^bbnds.
            ] False: [
                ^rectangle copyX: (bbnds  left min:  left + pX)@(bbnds    top min: top    + pY)
                               Y: (bbnds right max: right + pX)@(bbnds bottom max: bottom + pY)
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: copying\x7fComment: A morph is copied using a two-pass algorithm.  In the first pass,
the morph and its entire tree of submorphs is copied to produce a
new morph tree.  During this first pass, the associations between
morphs in the original tree and the corresponding morphs in the
copy are recording in a mapping dictionary.  The second pass is made
over the new morph tree to give each morph in that tree a chance to
update any references it may have to other morphs within the tree.
Without this second pass, these references would be left pointing
to morphs in the original morph tree.
Note: Children wishing to implement their own copying policy
should override baseCopy rather than this message.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            copyUsingMap: (0 = morphCount ifTrue: nil False: [dictionary copyRemoveAll])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: stepping\x7fComment: When copying a morph, this method duplicates the
receiver\'s activities, if any, for the new morph.
-- dmu & jm 1/4/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         copyActivitiesFor: myCopy = ( |
            | 
            isInWorld ifTrue: [| myActivities |
                myActivities: (world activities copyFilteredBy: [| :a | a target = self]).
                myActivities do: [| :a |
                    addActivity: a copyTarget: myCopy.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: copying\x7fComment: This method implements pass one of the two-pass morph copying
algorithm. In this pass, the entire tree of morphs and submorphs
is copied, collecting corresponding (old, new) pairs into the
the given mapping dictionary.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         copyRecordingMapIn: dict = ( |
             new.
            | 
            new: baseCopy.
            new rawMorphs: rawMorphs copy mapBy: [| :m. :ignore. newM |
                newM: m copyRecordingMapIn: dict.
                newM rawOwner: new.
                newM.
            ].
            dict at: self Put: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyRemoveAllMorphs = ( |
             new.
            | 
            new: baseCopy.
            new rawMorphs: vector.
            new privateSetOwner: nil.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: copying\x7fComment: This implements the basic copying algorithm, but takes the mapping
between the original morphs and copies as a parameter.
The reason for this is so that this can be invoked if necessary
from mapReferencesUsing to copy a non-visible morph contained
in a slot (see, e.g., traits acceptCancelPanel).
Note that map can be anything if there are no submorphs.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         copyUsingMap: map = ( |
             new.
            | 
            0 = morphCount ifTrue: [
                new: baseCopy.
                copyActivitiesFor: new.
            ] False: [
                new: copyRecordingMapIn: map.
                new allMorphsDo: [| :m | m mapReferencesUsing: map ].
                isInWorld ifTrue: [
                    map do: [| :new. :old |
                        old copyActivitiesFor: new.
                    ].
                ].
            ].
            new privateSetOwner: nil.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fComment: Pop up a menu of the morphs at the given point, and extract
the morph selected by the user, if any.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         coreSamplerButton: b Event: event = ( |
            | 
            coreSamplerMorph copyIntoWorld: world At: b  owner invocationPoint.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: damage management\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         damagedLeft: l Right: r Top: t Bottom: b From: m = ( |
             p.
            | 
            "Report that the given area of the given morph is damaged,
             and should be redrawn. Ultimately, this message reaches
             the worldMorph, which records the damage, or it a morph
             whose owner is nil, which just returns."

            owner ifNotNil: [
                p: position.
                owner damagedLeft: l + p x
                            Right: r + p x
                              Top: t + p y
                           Bottom: b + p y
                             From: m.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
             owner ifNotNil: [
                isInWorld ifTrue: [
                    joinedOnMorphs do: [ | :m |
                        m morphTypeName = pointerHeadMorph morphTypeName ifTrue: [
                             m tailMorph collapse 
                        ].
                     ].  
                     "owner = world ifTrue: [  
                        (moveToPosition: globalPosition + (300 @ -800) Time: 3.0 ) 
                           andThenSend: 'removeMorph:' To: owner Args: (list copyRemoveAll add: self).
                     ^ self
                     ]."
                 ].
               owner removeMorph: self .
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: event dispatching\x7fComment: Attempt to handle the given event. If the event is not
handled, return the special dropThroughMarker object.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         dispatchEvent: evt At: globalPt = ( |
            | 
            "Details: First, give submorphs a chance to handle the event.
             If no submorph handles the event, let the receiver try to
             handle it. If even this fails, return the dropThroughMarker."

            dropEvent: evt OnSubmorphsAt: globalPt IfHandled: [ ^self ].
            dropEvent: evt OnBaseAt: globalPt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: stepping\x7fComment: Return true when this morph is no longer active.  By default,
this always returns false, making the morph active until it is
explicitely deactivated (e.g., via a \'stopGettingStepped\' message).\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         done = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         drawAbstractedOn: c Scale: s OffsetBy: pt Clip: r = ( |
             org.
             rect.
            | 
            org: (pt + ((globalBaseBounds origin x * s) asInteger @ (globalBaseBounds origin y * s) asInteger )) .
            rect: r intersect: 
              (((rectangle copy)
                        origin: org )
                        corner: ( org + (1@1) max: (pt + ((globalBaseBounds corner x * s) asInteger @ (globalBaseBounds corner y * s) asInteger )))).
            c fillRectangle: rect Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: drawing\x7fComment: Draw this morph and all its submorphs on the given canvas.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: aCanvas = ( |
            | 
            baseDrawOn: aCanvas.
            0 = morphCount ifFalse: [| c |
                c: (aCanvas copyOffset: position).
                morphsReverseDo: [| :m | m drawOn: c ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: drawing\x7fComment: Recursivley draw the shadows of the receiver and its submorphs on the
given canvas. Assume that the canvas is already set up to draw shadows:
it is set to draw with a stipple pattern and has its color locked to
the shadow color.)\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         drawShadowOn: shadowC = ( |
            | 
            "Details: If the receiver is rectangular and has no morphs sticking
             out, then simply draw a rectangular shadow; this subsumes submorph
             shadows."

            isRectangular && noStickOuts ifTrue: [
                shadowC fillRectangle: baseBounds Color: shadowColor.
            ] False: [
                baseDrawOn: shadowC.
                0 = morphCount ifFalse: [| c |
                    c: (shadowC copyOffset: position).
                    morphsReverseDo: [| :m | m drawShadowOn: c ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: event dispatching\x7fComment: Handle this event if possible. Return dropThroughMarker
if event is not handled. Descendants can override this
method to selectively ignore events.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: evt OnBaseAt: globalPt = ( |
             localP.
            | 
            owner
                ifNil:    [ localP: globalPt ]
                IfNotNil: [ localP: globalPt - owner globalPosition ].
            (baseContainsPt: localP) ifFalse: [ ^dropThroughMarker ].

            evt mouseMotion       ifTrue: [ ^mouseMove:         evt ].
            evt keyDown           ifTrue: [ ^keyDown:           evt ].
            evt keyUp             ifTrue: [ ^keyUp:             evt ].
            evt leftMouseDown     ifTrue: [ ^leftMouseDown:     evt ].
            evt middleMouseDown   ifTrue: [ ^middleMouseDown:   evt ].
            evt rightMouseDown    ifTrue: [ ^rightMouseDown:    evt ].
            evt leftMouseUp       ifTrue: [ ^leftMouseUp:       evt ].
            evt middleMouseUp     ifTrue: [ ^middleMouseUp:     evt ].
            evt rightMouseUp      ifTrue: [ ^rightMouseUp:      evt ].
            evt leftDoubleClick   ifTrue: [ ^leftDoubleClick:   evt ].
            evt middleDoubleClick ifTrue: [ ^middleDoubleClick: evt ].
            evt rightDoubleClick  ifTrue: [ ^rightDoubleClick:  evt ].
            evt wheelMovedInX     ifTrue: [ ^wheelMovedInX:     evt ].
            evt wheelMovedInY     ifTrue: [ ^wheelMovedInY:     evt ].
            dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: event dispatching\x7fComment: Allow some submorph to handle the event falling at the given point.
Evaluate the given block if the event is handled.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: evt OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            (allowSubmorphsToGetEvent: evt) ifTrue: [
                morphsDo: [| :m. r |
                    ((m noStickOuts not) ||
                     [m baseBounds includes: (globalPt - globalPosition)]) ifTrue: [
                        "Event may fall on morph m; let m try to handle it"
                        r: (m dispatchEvent: evt At: globalPt).
                        dropThroughMarker = r ifFalse: [^ handledBlock value].  "handled"
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: event dispatching\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         dropThroughMarker = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'morph' -> 'dropThroughMarker' -> () From: ( |
             {} = 'Comment: This object is returned to indicate that an event has fallen
through (i.e., is not handled by) the receiver.
\x7fModuleInfo: Creator: traits morph dropThroughMarker.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> 'dropThroughMarker' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot'
        
         = x = ( |
            | == x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> 'dropThroughMarker' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         duplicate: evt = ( |
             newM.
            | 
            evt sourceHand attach: hackCopy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         embedInMorphBelowFromButton: b Event: event = ( |
             allM.
             menuOfTargets.
             morphToEmbed.
             p.
             possibleTargets.
            | 
            p: b owner invocationPoint.
            morphToEmbed: self.
            allM: (world morphsAt: p).
            allM remove: world.
            possibleTargets: list copyRemoveAll.
            allM do: [| :m. a. ok <- true | 
                "possible targets are the morphs below p that are not
                 related to the morph we want to embed,
                 and are not part of the invoking menu"
                 a: m.
                [a isNil] whileFalse: [
                    a = morphToEmbed ifTrue: [ ok: false ].
                    a = b owner ifTrue: [ ok: false ].
                    a: a owner.
                ].
                ok ifTrue: [ possibleTargets add: m ].
            ].
            0 = possibleTargets size ifTrue: [ ^self ].
            1 = possibleTargets size ifTrue: [| target |
                target: possibleTargets first.
                target addDroppingMorph: b target Event: event.
                b target justDroppedInto: target Event: event.
                ^self
            ].

            "pop up a menu that lists the possible embedding targets;
             its selectors are the actual morphs, not just strings"
            menuOfTargets: ui2Menu copy.
             possibleTargets with: 
                (possibleTargets copy mapBy: [| :m | m morphTypeName ]) Do: [
             | :pt. :tpl |
              menuOfTargets addButtonTarget: pt 
                                     Script: 'target addMorph: buttonArgs first'
                                 ButtonArgs: (list copyRemoveAll add: self)
                                      Label: tpl.
             ]. 
            menuOfTargets popUp: event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: stepping\x7fComment: When a morph responds positively to the message \'done\', it is
sent this message, allowing it to do any final actions before
it becomes inactive.  By default, this just does a normal step.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         finalStep = ( |
            | 
            step).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         firstMorph = ( |
            | rawMorphs first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: private\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         flushLayoutCaches = ( |
            | 
            "Flush cached layout information."

            layoutOkay: false.
            noStickOuts: false.
            cachedMinWidth: nil.
            cachedMinHeight: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: private\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         flushLayoutCachesToRootFrom: m = ( |
             o.
            | 
            "Flush the layout caches of all morphs from the given
             morph up to the root of the submorph tree containing it."

            o: m.
            [o isNil] whileFalse: [
                o flushLayoutCaches.
                o: o owner.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: stepping\x7fComment: Make the receiver be sent the step message approximately
every msecs milliseconds, allowing it to perform animation
or other periodic activities.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         getSteppedEveryMSecs: mSecs = ( |
            | 
            isInWorld ifFalse: [ error: 'a morph must be in the world to become active' ].
            stopGettingStepped.
            addActivity: (periodicMorphStepActivity copyTarget: self Period: mSecs).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         globalBaseBounds = ( |
             bbnds.
             deltaP.
             globalP.
            | 
            globalP: globalPosition.
            position = globalP ifTrue: [ ^baseBounds ].

            bbnds: baseBounds.
            deltaP: (globalP - position).
            rectangle copyX: (bbnds origin + deltaP)
                          Y: (bbnds corner + deltaP)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: transforming\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         globalBounds = ( |
             bnds.
             deltaP.
             globalP.
            | 
            globalP: globalPosition.
            position = globalP ifTrue: [ ^bounds ].

            bnds: bounds.
            deltaP: (globalP - position).
            rectangle copyX: (bnds origin + deltaP)
                          Y: (bnds corner + deltaP)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: transforming\x7fComment: Return the position of this morph in global coordinates.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         globalPosition = ( |
             o.
             pX.
             pY.
            | 
            o: owner ifNil: [ ^position ].
            pX: position x.
            pY: position y.
            [o isWorldMorph] whileFalse: [| ownerP |
                ownerP: o position.
                pX: pX + ownerP x.
                pY: pY + ownerP y.
                o: o owner ifNil: [ ^pX@pY ].
            ].
            pX@pY).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: transforming\x7fComment: Set the position of this morph to the given point, in global
coordinates.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         globalPosition: p = ( |
            | 
            owner ifNil: [
                position: p.
            ] IfNotNil: [
               "Do not use my position as it used to because
                it may be wrong if I am called from privateSetOwner:
                -- dmu"
                position: p - owner globalPosition.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         grabBy: h = ( |
             dx.
             dy.
            | 
            h globalPosition x > globalBounds corner x ifTrue: [
               dx: h globalPosition x - globalBounds corner x.
            ] False: [
               h globalPosition x < globalBounds origin x ifTrue: [
               dx: h globalPosition x - globalBounds origin x.
            ] False: [
               dx: 0
            ]].
            h globalPosition y > globalBounds corner y ifTrue: [
               dy: h globalPosition y - globalBounds corner y.
            ] False: [
               h globalPosition y < globalBounds origin y ifTrue: [
               dy: h globalPosition y - globalBounds origin y.
            ] False: [
               dy: 0
            ]].
            changed.
            globalPosition: globalPosition + (dx @ dy).
            h attach: self. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: morph InitialContents: FollowSlot'
        
         hackCopy = ( |
            | copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: portability\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeForPlatform = ( |
            | 
            traits canvas initializeForPlatform.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fComment: Initialize this morph.  This message is sent
to each morph prototype after filing it in.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            delete.
            removeAllMorphs.
            rawOwner: nil.
            color: paint named: 'khaki'.
            beRigid.
            velcroFlag: true.
            position: 0@0.
            setWidth: 100 Height: 80.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fComment: ArrowBodyMorphs return true.  False by default.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isArrowBodyMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isButton = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fComment: ButtonMorphs return true.  False by default.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isButtonLike = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isEndoObjectOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isFactoryMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isFlexibleHorizontally = ( |
            | 1 = hResizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isFlexibleVertically = ( |
            | 1 = vResizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fComment: Hand morphs return true.  False by default.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isHandMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Return true if this morph is contained in a world morph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isInWorld = ( |
            | topmostOwner isWorldMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: joining to other morphs\x7fComment: Return true or false depeding on if this receiver
is joined to some morph. See joinTo: for description of the 
idea of joining-- Randy, 6/1/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isJoined = ( |
            | 
            joineeOrNil isNotNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fComment: LayoutMorphs (e.g. rowMorph) return true.  False by default.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isLayoutMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fComment: All morphs return true.
\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isMorph = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isObjectOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fComment: Outliner morphs return true.  False by default.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Return true if I am aMorph or
if I am transitively owned by aMorph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isOwnedBy: aMorph = ( |
             m.
            | 
            m: self.
            [
              m = aMorph  ifTrue: [^ true].
              m: m owner.
              m isNil
            ] whileFalse
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fComment: Return true if this morph fills a rectangular area (its bounds)
and has no holes.  This is used to optimize drawing of shadows.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRigidHorizontally = ( |
            | 0 = hResizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRigidVertically = ( |
            | 0 = vResizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRoot = ( |
            | 
            owner isNil || [owner isWorldMorph]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: showing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isShowableAsMorph = ( |
            | isWorldMorph not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isShrinkWrapHorizontally = ( |
            | 2 = hResizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isShrinkWrapVertically = ( |
            | 2 = vResizing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         isWorldMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: joining to other morphs\x7fComment: Establish a loose positional constraint to the morph m.
The received will follow m around, but will not
be deleted or copied when m is deleted or copied (which
would happen if receiver were a submorph of m.)
   -- Randy, 6/1/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         joinTo: m = ( |
            | 
            isInWorld ifFalse: [^ error: 'Must be in a world to join to another morph.'].
            world join: self To: m. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: joining to other morphs\x7fComment: joined morphs are not the same as submorphs.
See comment in joinTo: slot. -- Randy, 6/2/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         joinedOnMorphs = ( |
            | world morphsJoinedTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: joining to other morphs\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         joineeOrNil = ( |
            | 
            isInWorld ifFalse: [^ nil].
            world joineeForMorphOrNil: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: dropping\x7fComment: This message is sent to a morph immediately after it has been
dropped into a new owner.  By default, this method does nothing.
Descendants may override this method if they wish to perform
some operation when they are dropped into a new context.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: newOwner Event: evt = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown: evt = ( |
            | 
            dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         keyUp: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fComment: Sent when a morph which had subscribed to keywboard
events is unsubscribed for some reason.
--- Ungar, 1/5/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         keyboardSubscriptionLapsedFor: aHand = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         lastMorph = ( |
            | rawMorphs last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fComment: Some event has occurred which may cause the layout of the
receiver to change.  Fix the layout of the receiver and
all the submorphs in its family tree that are affected
by the change.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         layoutChanged = ( |
             oldBounds.
             oldMinHeight.
             oldMinWidth.
             site.
            | 
            "Optimization: don't bother to update the layout of a
             morph that is not in the world since it cannot be seen
             anyway. The layout of such a morph will be computed if
             and when it is first added to the world or to some morph
             that is already in the world."
            flushLayoutCaches.

            "base case: not in the world; just flush layout caches"
            isInWorld ifFalse: [ morph flushLayoutCachesToRootFrom: owner. ^self ].

            "base case: owner is the world"
            owner isWorldMorph ifTrue: [
                changed.
                layoutInPlace.
                changed.
                ^self
            ].

            "find a suitable ancestor at which to fix the layout,
             flushing the layout caches of all intervening morphs"
            site: owner.
            [site suitableLayoutSite] whileFalse: [
                site flushLayoutCaches.
                site: site owner.
            ].

            "record the old bounds and min sizes of the layout site"
            oldBounds:    site baseBounds.
            oldMinHeight: site minHeight.
            oldMinWidth:  site minWidth.
            site changed.
            site flushLayoutCaches. "do this only after recording old stuff"
            site layoutInPlace.

            "optimization: if the bounds of the layout site did not
             change and if its minimum size did not shrink or grow
             to be larger than its current size, then we can simply
             propagate the minimum size information and quit;
             otherwise, recursively do fix the layout of the site's
             owner"
            ((site     bounds  = oldBounds)       &&
            [(site   minWidth >= oldMinWidth)     &&
            [(site   minWidth <= oldBounds width) &&
            [(site  minHeight >= oldMinHeight)    &&
            [(site  minHeight <= oldBounds height)]]]]) ifTrue: [
                "propagate change of minimum size info up to root"
                morph flushLayoutCachesToRootFrom: site owner.
            ] False: [
                "site must have an owner since it is in world
                 but is not itself the world"

                site changed.
                site owner layoutChanged.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fComment: Return a string describing the layout parameters for this morph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         layoutDescription = ( |
             r.
            | 
            r: 'h: '.
            isRigidHorizontally      ifTrue: [ r: r,      'rigid' ].
            isFlexibleHorizontally   ifTrue: [ r: r,   'flexible' ].
            isShrinkWrapHorizontally ifTrue: [ r: r, 'shrinkWrap' ].

            r: r, ', v: '.
            isRigidVertically        ifTrue: [ r: r,      'rigid' ].
            isFlexibleVertically     ifTrue: [ r: r,   'flexible' ].
            isShrinkWrapVertically   ifTrue: [ r: r, 'shrinkWrap' ].

            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fComment: Layout the receiver, record that layout has been done, and
clear the noStickOuts flag (since layout could leave a submorph
sticking out).
Note: This method should be called only from within
the layout algorithm. Clients should use the message
layoutChanged to indicate that a morph\'s layout may
have changed.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         layoutInPlace = ( |
            | 
            shrinkToFit.
            shiftSubmorphsIfNecessary.
            morphsDo: [| :m |
                m layoutOkay ifFalse: [ m layoutInPlace ].
            ].
            layoutOkay: true.
            noStickOuts: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fComment: Default behavior: pick up receiver\'s root morph,
unless the receiver is the world.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            (evt sourceHand capabilitySet includes: capabilities grabObject) ifFalse: [ ^ self].
            isWorldMorph ifFalse: [ evt sourceHand addMorph: rootForGrab ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: copying\x7fComment: Update the slots of this morph to refer to the new versions of
those morphs given by the the mapping dictionary. Morphs that
keep references to other morphs must implemenent this method
for copying to work correctly.  This default implementation
does no remapping.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         menuWhenSubmorph = ( |
             m.
            | 
            m: basicMenuWhenSubmorph copy.
            m retargetButtonsTo: self.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleDoubleClick: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseUp: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         minHeight = ( |
            | 
            cachedMinHeight ifNil: [ updateMinSizeCaches ].
            cachedMinHeight).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         minWidth = ( |
            | 
            cachedMinWidth ifNil: [ updateMinSizeCaches ].
            cachedMinWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphCount = ( |
            | rawMorphs size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'morph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphs = ( |
            | rawMorphs copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fComment: Replace all my submorphs with the given list of morphs.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphs: mList = ( |
            | 
            removeAllMorphs.
            addAllMorphs: mList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: dropping\x7fComment: Answer the collection of submorphs of the receiver at all
levels whose bases contain the given point.  The list is
ordered: morphs earlier in the list appear in front of
those later in the list.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphsAt: p = ( |
             r.
            | 
            r: list copyRemoveAll.
            morphsAt: p Into: r.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: dropping\x7fComment: Recursively add to the given collection all morphs of the
receiver (possibly including the receiver itself) whose
bases contain the given point.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         morphsAt: p Into: c = ( |
             localP.
            | 
            localP: p - position.
            noStickOuts && [(baseBounds  includes: p) not] ifTrue: [ ^self ].
            morphsDo: [| :m | m morphsAt: localP Into: c].
            (baseContainsPt: p) ifTrue: [ c addLast: self ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fComment: Invoke the given block on each submorph of this morph in
front-to-back order.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphsDo: aBlock = ( |
            | 
            rawMorphs do: [| :m. :ignore | aBlock value: m].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: submorph enumerating\x7fComment: Like morphsDo: but the morphs are enumerated in
front-to-back order.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphsReverseDo: aBlock = ( |
            | 
            rawMorphs reverseDo:  [| :m. :ignore | aBlock value: m].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Place the given morph behind all submorphs in the receiver.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
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
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Place the given morph in front of all submorphs in the receiver.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
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
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         outliner: evt = ( |
             outliner.
            | 
            outliner: world outlinerForMirror:  reflect: self.
            outliner isInWorld ifTrue: [
                world moveToFront: outliner.
                outliner moveToPosition: globalBounds topRight + (10@0).
            ] False: [
                evt sourceHand attach: outliner.
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         owner = ( |
            | rawOwner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         owner: m = ( |
            | 
            error: 'You cannot change the owner of a morph directly; use add/removeMorph: instead.'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'ModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fComment: Pop up a new window or windows containing this morph.  The window is
created on either the same X displays as used by this morph\'s 
current world or, if this morph is not in an
open world, the X display given by the unix environment variable 
$DISPLAY.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpInWindow = ( |
             dispNames.
            | 
            isInWorld ifTrue: [
                "assume at least one window is open for the world"
                 dispNames: world winCanvases copyMappedBy: [ | :wc.  | 
                   wc display originalName. 
                ].   
            ] False: [
                dispNames: (list copy add: ''). 
            ].
            popUpInWindowOn: dispNames.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fComment: Pop up a new windows containing this morph on the given X displays.
The morph is moved from its current world into a new world.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         popUpInWindowOn: dispNames = ( |
             newW.
             sz.
            | 
            sz: bounds size.

            dispNames doFirst: [ | :dn |  
              newW: worldMorph copyOpenOnDisplay: dn Bounds: (50@50) ## sz.
              newW addMorph: self.
              globalPosition: 0@0.
              newW go.
            ] MiddleLast: [ | :dn |
              newW alsoOpenOnDisplay: dn.
              newW go.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fComment: Returns the position of this morph, in the coordinates of
the morph that owns it.  Glyphs choose their own definition
of position.  For example, a circle might use its center as
its position whereas a rectangle might use its origin.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | 
            rawBox origin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fComment: Set the position of this morph to the given point, in the
coordinates of the morph that owns it.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
            | 
            rawBox: p ## (rawBox size). self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fComment: Print the layout parameters for this morph. Handy during debugging.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         printLayout = ( |
            | 
            layoutDescription printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         printStructure = ( |
            | 
            structureDescription printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: If m is a submorph of the receiver, remove m from the receiver\'s
morphs list and evaluate presentBlock. Otherwise, do nothing.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         privateRemoveMorph: m IfPresentDo: b = ( |
             mList.
            | 
            mList: rawMorphs asList.
            mList remove: m IfAbsent: [ ^self ].
            rawMorphs: mList asVector.
            m privateSetOwner: nil.
            b value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Remove the receiver from the morph that currently owns it, if
any, and make the given morph its new owner. The morph\'s global
position is preserved, although its local position within its new
owner will, in general, be different from its local position in its
old owner.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         privateSetOwner: m = ( |
            | 
            m = owner ifFalse: [| globalP |
                globalP: globalPosition.
                rawOwner: m.
                globalPosition: globalP.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         propertySheets = ( |
            | 
            vector copyAddLast: (resizingPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fComment: Like colorAll: but allows morphs to choose their own suitable colors\x7fModuleInfo: Module: morph InitialContents: FollowSlot'
        
         recolor = ( |
            | morphsDo: [|:m| m recolor]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Remove all morphs from this morph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllMorphs = ( |
            | 
            0 = morphCount ifTrue: [ ^self ].
            changed.
            morphsDo: [| :m | m privateSetOwner: nil ].
            rawMorphs: vector.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Removes m from the receiver and makes its owner nil.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         removeMorph: m = ( |
            | 
            m changed.
            privateRemoveMorph: m IfPresentDo: [ layoutChanged ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         replaceMorph: old With: new = ( |
             ms.
            | 
            ms: morphs copyMappedBy: [|:m| m = old  ifTrue: [new] False: [m]].
            removeAllMorphs.
            addAllMorphs: ms).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeEvent: event = ( |
             r.
             resizeHandle.
            | 
            "xxx Experimental!!! This code is just to demonstrate the concept;
             the resizeHandle morph should be put in widgetMorphs. xxx"

            beRigid.
            resizeHandle: morph copyRemoveAllMorphs.
            mirrors mirror freezeProgrammingTimestampDo: [
                resizeHandle _AddSlots: (|
                    target.
                    oldHResizing.
                    oldVResizing.
                    mouseMove: e = (moveTo: e cursorPoint).
                    moveTo: p = (| sz |
                        changed.
                        globalPosition: p - (4@4).
                        changed.
                        target resizePoint: p.
                        self).
                    leftMouseDown:   e = (terminateResizingFrom: e sourceHand).
                    middleMouseDown: e = (terminateResizingFrom: e sourceHand).
                    rightMouseDown:  e = (terminateResizingFrom: e sourceHand).
                    terminateResizingFrom: h = (
                        h unsubscribeCursor: self.
                        delete.
                        target changed.
                        target hResizing: oldHResizing.
                        target vResizing: oldVResizing.
                        target layoutChanged.
                        self).
                |).
            ].
            r: resizeHandle copy color: (paint named: 'red').
            r setWidth: 8 Height: 8.
            r target: self.
            r oldHResizing: hResizing.
            r oldVResizing: vResizing.
            beRigid.  "make rigid during the resizing"
            world addMorph: r.
            world moveToFront: r.
            event sourceHand subscribeCursor: r.
            r moveTo: event sourceHand position.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         resizePoint: p = ( |
             oldHResizing.
             oldVResizing.
             sz.
            | 
            changed.

            "Make flexible before computing min width and height"
            oldHResizing: hResizing.
            oldVResizing: vResizing.
            hResizing: 1. "flexible"
            vResizing: 1. "flexible"
            flushLayoutCaches.
            sz: (p - globalBounds origin) max: (minWidth@minHeight).
            hResizing: oldHResizing.
            vResizing: oldVResizing.
            setWidth: sz x Height: sz y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fComment: Resize the receiver\'s base to fit into the given rectangle as well
as possible.  If the receiver cannot fill the rectangle, it should
nestle into the upper-left corner.

Note: this method resizes the receiver regardless of its
resizability settings.  The sender is responsible for only
sending this when appropriate.  Even rigid morphs can be
forcibly resized using this method.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            rawBox: r.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         rightDoubleClick: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseDown: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseUp: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         root = ( |
             m.
            | 
            m: self.
            [m owner isNil || [m owner isWorldMorph]] whileFalse: [
                m: m owner.
            ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         rootForGrab = ( |
             m.
            | 
            m: self.
            [ m owner isNil        ||
             [m owner isWorldMorph ||
             [m owner velcroFlag not]]] whileFalse: [
                m: m owner.
            ].
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: process synchronization\x7fComment: Execute the given block at a safe moment, such
as in between two frames.  This allows other processes
to change the state of objects in the UI without
introducing inconsistencies or graphical glitches.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         safelyDo: b = ( |
            | 
            topmostOwner safelyDoIfWorld: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: process synchronization\x7fComment: Execute the given block at a safe moment, such
as in between two frames. This allows other processes
to change the state of objects in the UI without
introducing inconsistencies or graphical glitches.
Since I am not in the world, just do it.
Don\'t call me directly; send safelyDo: instead.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         safelyDoIfWorld: b = ( |
            | 
            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         selfMenu = ( |
             m.
            | 
            m: basicSelfMenu copy.
            m retargetButtonsTo: self.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         setHeight: h = ( |
             bbnds.
            | 
            changed.
            bbnds: baseBounds.
            resizeRect: rectangle copyX: bbnds origin
                                      Y: bbnds right@(bbnds top + h).
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fComment: Makes the receiver like
the morph that has been
stored in the named file: each of the
objects referenced by the stored slots
gets installed in the slot of the same
name in the receiver. Also sets the backpointer
(rawOwner) slot of the new submorphs, and
preserves the receiver\'s global position
and rawOwner.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         setSlotsFromFile: fName = ( |
             mMe.
             mNew.
             oldGp.
             oldOwner.
            | 
            oldGp: globalPosition.
            changed.
            oldOwner: rawOwner.
            mNew: reflect: fName runScript.
            mMe: reflect: self.
            mNew do: [ | :sl |
              (mMe includesName: sl name) ifFalse: [error: 'Format error.'.].
              (mMe at: sl name) contents: (mNew at: sl name) contents.
            ].
            morphs do: [ | :m | m rawOwner: self ].
            rawOwner: oldOwner.
            globalPosition: oldGp.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         setWidth: w = ( |
             bbnds.
            | 
            changed.
            bbnds: baseBounds.
            resizeRect: rectangle copyX: bbnds origin
                                      Y: (bbnds left + w)@bbnds bottom.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         setWidth: w Height: h = ( |
             bbnds.
            | 
            changed.
            bbnds: baseBounds.
            resizeRect: rectangle copyX: bbnds origin
                                      Y: (bbnds left + w)@(bbnds top + h).
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         shadowColor <- paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         shadowOffset <- (12)@(8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: private\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         shiftSubmorphsIfNecessary = ( |
             l.
             t.
            | 
            "Move the imaginary box enclosing the submorphs of the receiver
             to the origin in the shrinkWrapped dimensions if any."

            "do nothing if no submorphs or not shrinkWrap in at least one dimension"
            0 = morphCount ifTrue: [ ^self ].
            isShrinkWrapHorizontally || isShrinkWrapVertically ifFalse: [ ^self ].

            "find the top, left edge of an imaginary box enclosing my submorphs"
            l: maxSmallInt.
            t: maxSmallInt.
            morphsDo: [| :m. mBnds |
                mBnds: m bounds.
                l: (l min: mBnds left).
                t: (t min: mBnds top).
            ].

            "ignore the non-shrinkWrapped dimension, if any"
            isShrinkWrapHorizontally ifFalse: [ l: 0 ].
            isShrinkWrapVertically   ifFalse: [ t: 0 ].

            ((0 = l) && [0 = t]) ifTrue: [ ^self ].  "no shift needed"

            "slide the imaginary box enclosing my submorphs to my origin"
            morphsDo: [| :m. mPos |
                mPos: m position.
                m position: (mPos x - l) @ (mPos y - t).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: private\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         shrinkToFit = ( |
             bbnds.
             checkY.
             isOutermostWithSubmorphs.
             newH.
             newW.
             shrinkH.
             shrinkV.
            | 
            "Resize this morph to fit around its submorphs exactly,
             either horizontally or vertically or both, depending
             which dimensions are shrinkWrapped."

            isOutermostWithSubmorphs:
                (  owner isNotNil &&
                 [(owner isWorldMorph || [owner isHandMorph]) &&
                 [morphCount > 0]]).
            shrinkH: isShrinkWrapHorizontally || [ isOutermostWithSubmorphs && [ isFlexibleHorizontally ]].
            shrinkV: isShrinkWrapVertically   || [ isOutermostWithSubmorphs && [ isFlexibleVertically   ]].

            "do nothing if not shrinkWrap in at least one dimension"
            shrinkH || shrinkV ifFalse: [ ^self ].

            "shrink in the appropriate dimensions if necessary"
            bbnds: baseBounds.
            newW: shrinkH ifTrue: [ minWidth  ] False: [ bbnds  width ].
            newH: shrinkV ifTrue: [ minHeight ] False: [ bbnds height ].

            ((newW = bbnds width) && [newH = bbnds height]) ifTrue: [ ^self ].

            checkY: bbnds origin y.
            ((checkY + newH) - checkY) asInteger = newH asInteger ifFalse: [
              |cy. nh|
              cy: checkY printString. nh: newH printString.
              warning: 'arithmetic error in shrinkToFit: ', cy, ' + ', nh, ' - ', cy,
                        ' is: ', ((checkY + newH) - checkY) asInteger printString, ' instead of: ', nh asInteger printString,
                        '\n\t layout will be inaccurate'
            ].

            resizeRect: (rectangle copyX: bbnds origin Y: bbnds origin + (newW @ newH)).

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: stepping\x7fComment: Register the receiver in the world\'s list of activities.
As a result, it will be sent the step message every cycle, allowing
it to perform animation or other actions.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         startGettingStepped = ( |
            | 
            isInWorld ifFalse: [
                error: 'a morph must be in the world to become active'.
            ].
            stopGettingStepped.
            addActivity: (morphStepActivity copyTarget: self).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            'type: ', morphTypeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: stepping\x7fComment: Active morphs are sent this message every cycle.  The default
behavior is to do nothing.  Warning: if a morph takes too much
time to perform a single step, it may decrease the overall
frame rate of the user interface.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: stepping\x7fComment: Unregister the receiver in the world\'s list of activities.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         stopGettingStepped = ( |
            | 
            isInWorld ifFalse: [
                error: 'a morph must be in the world to become inactive'.
            ].
            world removeActivitiesWithTarget: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities\x7fComment: Return a string describing the full submorph structure of the
receiver, using indentation to show nesting and annotated
with layout information.  Useful for debugging.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         structureDescription = ( |
             indentAmount = 3.
             level.
             r.
            | 
            r: ''.
            level: -1.
            allMorphsDoPre: [| :m |
                level: level + 1.
                r: r & ('' copySize: (indentAmount * level) FillingWith: ' ').
                r: r & m printString & ' ('.
                r: r & m layoutDescription & ')\n'.
            ] Post: [
                level: level - 1.
            ].
            r flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: drawing\x7fComment: Return true if the given submorph of the receiver is
visible. True by default. Used to optimize drawing.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         submorphVisible: m = ( |
            | 
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: menu stuff\x7fComment: Pop up a menu of the morphs at the given point, and extract
the morph selected by the user, if any.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         submorphsButton: b Event: event = ( |
             menu.
             pile.
            | 
            pile: morphsAt: b  owner invocationPoint.
            pile isEmpty ifTrue: [ ^self ].

            "pop up a menu that lists the morphs under the given point"
            menu: morphFinderMenu copy.
            pile with: (pile copy mapBy: [| :m | m morphTypeName]) 
                 Do: [| :m. :lbl |
                     menu addButtonTarget: m 
                          ScriptBlock: [target menuWhenSubmorph popUpInWorld: event sourceHand world
                                                                        From: event sourceHand.]
                          Label: lbl.
                      ].
            menu popUpInWorld: event sourceHand world 
                 From: event sourceHand 
                 InvocationPoint: b  owner invocationPoint
                 ForObject: self
                 EventTime: event timeStamp.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fComment: Return true if this morph is a suitable site
from which to incrementally fix the layout of the
submorph tree for which this morph is the root.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         suitableLayoutSite = ( |
             o.
            | 
            "Details: The incremental layout algorithm must know
             the size and minimum sizes of the layout site before
             the change that triggered the layout. The size before
             the change is known for morphs which had no morphs
             sticking out before the change. The minimum sizes
             before the change are known if the cachedMinWidth/Height
             of the layout site are not nil. Finally, if the receiver
             is the root of the submorph tree, it must be used as
             the layout site."

            o: owner.
            (o isNil || [o isWorldMorph]) ifTrue: [ ^true ].

            noStickOuts &&
            [cachedMinWidth  isNotNil &&
            [cachedMinHeight isNotNil]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Return the top-level owner for this morph. The top-level owner
is found by traversing owner links until reaching a morph whose
owner is nil. This morph is typically a worldMorph.
\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         topmostOwner = ( |
             w.
            | 
            w: self.
            [ w owner isNil ] whileFalse: [ w: w owner ].
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: joining to other morphs\x7fComment: Break the loose positional constraint
established with joinTo: . See that slot for
more info on attachment.-- Randy, 6/1/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         unjoin = ( |
            | 
            isInWorld ifTrue: [unjoinIfAbsent: nil.].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: joining to other morphs\x7fComment: See the unjoin and joinTo: comments -- Randy, 6/1/95\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         unjoinIfAbsent: blk = ( |
            | 
            isInWorld ifFalse: [ ^ error: 'Must be in a world to handle joins'].
            world unjoin: self IfAbsent: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: layout\x7fCategory: private\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMinSizeCaches = ( |
             bbnds.
             minH.
             minW.
            | 
            "Compute the minimum space required by this morph and all its
             submorphs. Layout morphs override this method to compute the
             minimum space needed for the final arrangement of their
             submorphs after layout."

            0 = morphCount ifTrue: [
                minW: baseMinWidth.
                minH: baseMinHeight.
            ] False: [
                |
                  maxX <- minSmallInt.
                  maxY <- minSmallInt.
                  minX <- maxSmallInt.
                  minY <- maxSmallInt.
                |
                morphsDo: [| :m. mBnds |
                    mBnds: m bounds.
                    minX: minX min: mBnds left.
                    maxX: maxX max: mBnds left + m minWidth.
                    minY: minY min: mBnds top.
                    maxY: maxY max: mBnds top + m minHeight.
                ].
                isShrinkWrapHorizontally ifFalse: [
                    minX: minX min: 0.
                    maxX: maxX max: baseMinWidth.
                ].
                isShrinkWrapVertically ifFalse: [
                    minY: minY min: 0.
                    maxY: maxY max: baseMinHeight.
                ].
                minH: (maxY - minY) max: baseMinHeight.
                minW: (maxX - minX) max: baseMinWidth.
            ].
            bbnds: baseBounds.
            isRigidHorizontally ifTrue: [ minW: minW max: bbnds  width ].
            isRigidVertically   ifTrue: [ minH: minH max: bbnds height ].
            cachedMinWidth:  minW.
            cachedMinHeight: minH.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: utilities for demos\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         velcroAllMorphs = ( |
            | 
            allMorphsDo: [| :m | m velcroFlag: true ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: dropping\x7fComment: Return true if the receiver accepts the given morph, which is
being dropped onto it.  If the receiver rejects the morph, the
morph will fall through onto the morph below.  By default, this
method rejects all dropping morphs unless the receiver\'s velcroFlag
is false.  (It is true for most morphs by default.)  Descendants
can override this method, perhaps to selectively accept only
certain kinds of morphs.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            velcroFlag not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedInX: evt = ( |
            | 
            dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedInY: evt = ( |
            | dropThroughMarker).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: structure\x7fComment: Return the top-level owner for this morph. The top-level owner
is found by traversing owner links until reaching a morph whose
owner is nil. This morph is typically a worldMorph.\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         world = ( |
             w.
            | 
            w: topmostOwner.
            w isWorldMorph ifFalse: [ error: 'I am not in any world; send isInWorld to me first.' ].
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: reopening the world\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         worldHasReopened = ( |
            | 
            "Most morphs do not care"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxOLDbounds = ( |
             b.
             baseB.
             pX.
             pY.
            | 
            "Return a rectangle enclosing the visible portions of all
             morphs owned by this morph. The rectangle is in the
             coordinates of the morph that owns this morph."
            "Details: The noStickOuts flag supports an important
             optimization. If this flag is true, then none of this
             morph's descendants extends beyond this morphs bounds;
             thus, we need not visit them in order to compute this
             morph's bounds."

            noStickOuts ifTrue: [ ^baseBounds ].
            0 = morphCount ifTrue: [ noStickOuts: true. ^baseBounds ].

            b: firstMorph bounds.
            1 upTo: rawMorphs size Do: [| :i |
                b: (b union: (rawMorphs at: i) bounds).
            ].

            baseB: baseBounds.
            pX: position x.
            pY: position y.
            ( (baseB   left <= (b   left + pX)) && 
             [(baseB  right >= (b  right + pX)) &&
             [(baseB    top <= (b    top + pY)) &&
             [(baseB bottom >= (b bottom + pY)) ]]]) ifTrue: [
                noStickOuts: true.
                ^baseBounds.
            ] False: [
                ^rectangle copyX: (baseB origin min: (b origin + position))
                               Y: (baseB corner max: (b corner + position)).
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: damage management\x7fModuleInfo: Module: morph InitialContents: FollowSlot\x7fVisibility: public'
        
         xxxOldChanged = ( |
             bnds.
             deltaP.
             pX <- 0.
             pY <- 0.
             w.
            | 
            "Report that the area occupied by this morph should be redrawn."
            "Details: This method is an optimized version of:
                w: world.
                w isWorldMorph ifTrue: [
                    w damaged: globalBounds.
                ].
            This optimization traverses the chain to the world only once.
            Does nothing if the morph is not in the world."

            w: owner ifNil: [ ^self ].
            [w isWorldMorph] whileFalse: [| wPos |
                wPos: w position.
                pX: pX + wPos x.
                pY: pY + wPos y.
                w: w owner ifNil: [ ^self ].
            ].
            bnds: bounds.
            deltaP: pX @ pY.
            w damaged:
                (rectangle copyX: deltaP + bnds origin
                               Y: deltaP + bnds corner + shadowOffset "xxx").
            self).
        } | ) 



 '-- Side effects'

 globals modules morph postFileIn
