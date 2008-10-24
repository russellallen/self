 'Sun-$Revision: 30.10 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         rowMorph = bootstrap define: bootstrap stub -> 'globals' -> 'rowMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'rowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals rowMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rowMorph' -> () From: ( | {
         'Category: Row Morph State\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rowMorph' -> () From: ( | {
         'Category: Row Morph State\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth <- 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rowMorph' -> () From: ( | {
         'Category: Row Morph State\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         borderWidth <- 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rowMorph' -> () From: ( | {
         'Category: Row Morph State\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         justification <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rowMorph' -> () From: ( | {
         'Category: Row Morph State\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         nonLaidOutMorphs <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         rowMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( |
             {} = 'Comment: A rowMorph divides its space among a horizontal row of submorphs.
     Extra horizontal space is divided as evenly as possible among the
     flexible submorphs. The justification setting controls the vertical
     placement of submorphs that are shorter than the rowMorph\'s height
     (i.e. top, center, or bottom justified).\x7fModuleInfo: Creator: traits rowMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'rowMorph' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
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
                ((oldOwner isNil) || [oldOwner = self]) ifFalse: [
                    m changed.
                    oldOwner privateRemoveMorph: m IfPresentDo: [
                        ownersToNotify ifNil: [ ownersToNotify: set copyRemoveAll ].
                        ownersToNotify add: oldOwner.
                    ].
                ].
                m flushLayoutCaches.
                m rawOwner: self.  "don't maintain globalPosition, since m will be laid out"
            ].
            rawMorphs: rawMorphs, mList asVector.
            layoutChanged.
            ownersToNotify ifNotNil: [ ownersToNotify do: [| :o | o layoutChanged ]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorph: m = ( |
            | 
            "Adds the given morph to the receiver using the morph's
             position to determine its place in the submorph ordering."
            "Details: Don't need to worry about keeping m's globalPosition
             invariant because the automatic layout will change it anyway."

            replaceMorphsWithSuperset: (orderedListOfSubmorphsInserting: m).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorphFirst: m = ( |
            | 
            replaceMorphsWithSuperset: rawMorphs copyAddFirst: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorphLast: m = ( |
            | 
            replaceMorphsWithSuperset: rawMorphs copyAddLast: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addNonLaidOutMorph: m = ( |
            | 
            nonLaidOutMorphs: nonLaidOutMorphs copyAddLast: m.
            resend.addMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
            | 
            "Optimization: suppress drawing if this morph's color matches
             that of its owner."

            owner isNotNil && [owner submorphVisible: self] ifTrue: [ resend.baseDrawOn: aCanvas ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         bottomJustify = ( |
            | justification:  1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         centerJustify = ( |
            | justification:  0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: stringSupport\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
             s.
            | 
            s: ('' & '').
            morphsDo: [| :m |
                m morphTypeName = labelMorph morphTypeName ifTrue: [
                    s: s & m label.
                ].
            ].
            s flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: aCanvas = ( |
            | 
            "Optimization: avoid redrawing submorphs outside
             the damaged region."

            baseDrawOn: aCanvas.
            0 = morphCount ifFalse: [| c |
                c: (aCanvas copyOffset: position).
                aCanvas redrawBox ifNil: [
                    morphsDo: [| :m | m drawOn: c ].
                ] IfNotNil: [| :box. l. r. xOrigin |
                    xOrigin: c offset x.
                    l: box  left - xOrigin.
                    r: box right - xOrigin.
                    morphsDo: [| :m. mBnds |
                        mBnds: m bounds.
                        l < mBnds right ifTrue: [
                            r <= mBnds left ifTrue: [ ^self ].
                            m drawOn: c.
                        ].
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            beFlexible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isBottomJustified = ( |
            | 1 = justification).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isCenterJustified = ( |
            | 0 = justification).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         isHorizontal = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isLayoutMorph = ( |
            | 
            "Morphs that do layout return true; other morphs return false."
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isTopJustified = ( |
            | -1 = justification).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         justificationDescription = ( |
            | 
            isTopJustified    ifTrue: [ ^    'top' ].
            isCenterJustified ifTrue: [ ^ 'center' ].
            isBottomJustified ifTrue: [ ^ 'bottom' ].
            'unknown').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         layoutDescription = ( |
             r.
            | 
            r: resend.layoutDescription.
            r: r, ', ', justificationDescription.
            r: r, ' justified'.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         layoutInPlace = ( |
            | 
            "Layout the receiver in place. Record that layout has been done,
             and clear the noStickOuts flag (since layout could leave a
             submorph sticking out)."
            "Note: This method should be called only from within
             the layout algorithm. Clients should use the message
             layoutChanged to indicate that a morph's layout may
             have changed."

            shrinkToFit.
            0 = morphCount ifFalse: [| bbnds |
                bbnds: baseBounds.
                spaceAllocator layout: self
                    Left: borderWidth   Right: bbnds  width - borderWidth
                    Top:  borderWidth  Bottom: bbnds height - borderWidth 
                    Horizontally: isHorizontal.
            ].
            layoutOkay: true.
            noStickOuts: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'rowMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         morphsToLayoutDo: blk = ( |
            | 
            nonLaidOutMorphs isEmpty ifTrue: [ ^morphsDo: blk ].

            morphsDo: [| :m |
                (nonLaidOutMorphs includes: m) ifFalse: [ blk value: m ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         orderedListOfSubmorphsInserting: m = ( |
             insertionDone.
             mBnds.
             mCenterDoubled.
             newMorphs.
            | 
            "Make a collection containing the receiver's morphs plus m,
             where m's ordering in the new collection is determined by
             its global position. If m is already a submorphs, just
             change its position in the ordering."

            newMorphs: list copyRemoveAll.
            insertionDone: false.
            mBnds: m globalBounds.
            mCenterDoubled: (mBnds left + mBnds right) - (2 * globalPosition x).
            morphsDo: [| :oldM |
                oldM = m ifTrue: [
                    "skip m if it is already amongst my morphs"
                ] False: [
                    insertionDone ifFalse: [| oldMBnds |
                        oldMBnds: oldM bounds.
                        (oldMBnds left + oldMBnds right) >= mCenterDoubled ifTrue: [
                            newMorphs add: m. "insert m before this morph"
                            insertionDone: true.
                        ].
                    ].
                    newMorphs add: oldM.
                ].
            ].
            insertionDone ifFalse: [ newMorphs addLast: m ].
            newMorphs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         propertySheets = ( |
            | 
            resend.propertySheets copyAddLast: 
                (borderPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAllMorphs = ( |
            | 
            resend.removeAllMorphs.
            nonLaidOutMorphs: vector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         removeMorph: m = ( |
            | 
            resend.removeMorph: m.
            nonLaidOutMorphs isEmpty ifFalse: [| tmp |
                tmp: nonLaidOutMorphs asList.
                tmp remove: m IfAbsent: nil.
                nonLaidOutMorphs: tmp asVector.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         replaceMorphsWithSuperset: mList = ( |
            | 
            "Warning: This method should only be used by knowlegeable clients!
             Efficiently replace the receiver's morphs with the given
             collection of morphs. The efficiency results from:

               1. not setting the owners of the old submorphs to nil
                  (because, typically, the old morphs will be a subset
                  of the new morphs list), and

               2. doing only a single layoutChanged (rather than
                  one for a removeAllMorphs and another for addAllMorphs).

             The possible side effect of abusing this method is the
             creation of orphan morphs. An orphan morph is one whose owner
             field refers to a morph that does not have the orphan in its
             list of submorphs. Since the owner field is only considered
             a hint, this is not a fatal problem."

            "Next two lines are an optimization of removeAllMorphs"
            changed.
            rawMorphs: vector.

            addAllMorphs: mList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         submorphVisible: m = ( |
            | 
            "Return true if a submorph of the given color might be
             visible. It is not visible if the receiver has no stickouts
             and the submorph is the same color as the receiver, based on
             the assumption that the submorphs of a row or column do not
             overlap each other."

            (noStickOuts && [color = m color]) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         topJustify = ( |
            | justification: -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rowMorph' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMinSizeCaches = ( |
             h.
             minH.
             minW.
             w.
            | 
            h: baseMinHeight.
            w: 0.
            morphsDo: [| :m |
                h: h max: m minHeight.
                w: w  +   m minWidth.
            ].
            nonLaidOutMorphs do: [| :m. mBnds |
                mBnds: m bounds.
                h: h max: mBnds bottom - borderWidth.
                w: w max: mBnds right  - borderWidth. 
            ].
            w: w max: baseMinWidth.
            minW: w + borderWidth double.
            minH: h + borderWidth double.
            isRigidHorizontally ifTrue: [ minW: baseBounds  width ].
            isRigidVertically   ifTrue: [ minH: baseBounds height ].
            cachedMinWidth:  minW.
            cachedMinHeight: minH.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         columnMorph = bootstrap define: bootstrap stub -> 'globals' -> 'columnMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'columnMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals columnMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         columnMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( |
             {} = 'Comment: A columnMorph is like a rowMorph except that it divides
     its space vertically among a column of submorphs.\x7fModuleInfo: Creator: traits columnMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'columnMorph' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'columnMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot'
        
         layoutMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules layoutMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot'
        
         myComment <- 'Morphs that layout their contents in orderly rows or columns.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            rowMorph        initializePrototype.
            columnMorph     initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.10 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'layoutMorphs' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot'
        
         spaceAllocator = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( |
             {} = 'Comment: This object holds the behavior and bookkeeping information used to
     layout a row or column of morphs.\x7fModuleInfo: Creator: globals spaceAllocator.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allocationRectBottom.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allocationRectLeft.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allocationRectRight.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allocationRectTop.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allotHeight: height To: m At: offset ColW: columnWidth = ( |
             extra.
             left.
             top.
             width.
            | 
            "compute width allocation for m"
            width: m isFlexibleHorizontally
                ifTrue: [ columnWidth max: m minWidth ]
                 False: [ m minWidth ].

            "compute extra  width; negative if m is wider than the column"
            extra: columnWidth - width.
            top: allocationRectTop + offset.
            left: allocationRectLeft +
                (justification compare: 0
                     IfLess: 0              "left   justified"
                      Equal: [extra / 2]    "center justified"
                    Greater: extra).        "right  justified"
            resize: m Top: top Left: left Width: width Height: height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allotWidth: width To: m At: offset RowH: rowHeight = ( |
             extra.
             height.
             left.
             top.
            | 
            "compute height allocation for m"
            height: m isFlexibleVertically
                ifTrue: [ rowHeight max: m minHeight ]
                 False: [ m minHeight ].

            "compute extra height; negative if m is taller than the row"
            extra: rowHeight - height.
            left: allocationRectLeft + offset.
            top: allocationRectTop +
                (justification compare: 0
                     IfLess: 0              "top    justified"
                      Equal: [extra / 2]    "center justified"
                    Greater: extra).        "bottom justified"
            resize: m Top: top Left: left Width: width Height: height.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         budget.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         clientMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         doLayout = ( |
             offset.
             otherDimSz.
            | 
            "Allocate space to submorphs of my clientMorph."

            isHorizontal
                ifTrue: [ otherDimSz: allocationRectBottom - allocationRectTop  ]
                 False: [ otherDimSz: allocationRectRight  - allocationRectLeft ].

            offset: 0.
            clientMorph morphsToLayoutDo: [| :m. minSpace. spaceForM |
                minSpace: (minSizeInLayoutDimesion: m).
                (flexibleInLayoutDimesion: m) ifTrue: [| available |
                    "Try to divide any extra space evenly among the flexible
                     submorphs, respecting their minimum size requirements.
                     (This code is a bit tricky because a flexible submorph can
                     have a minimum size greater than 1/n-th of the remaining
                     extra space, and this minimum size should be respected)."

                    available: budget - reservedN - (reservedF - minSpace).
                    spaceForM: (budget - reservedN) / flexCount.
                    spaceForM > available ifTrue: [ spaceForM: available ].
                    spaceForM < minSpace  ifTrue: [ spaceForM:  minSpace ].
                    flexCount: flexCount pred.
                    reservedF: reservedF - minSpace.
                ] False: [
                    spaceForM: minSpace.
                    reservedN: reservedN - minSpace.
                ].
                isHorizontal ifTrue: [
                    allotWidth:  spaceForM To: m At: offset RowH: otherDimSz.
                ] False: [
                    allotHeight: spaceForM To: m At: offset ColW: otherDimSz.
                ].

                budget: budget - spaceForM.
                offset: offset + spaceForM.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         flexCount.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         flexibleInLayoutDimesion: m = ( |
            | 
            "Returns true iff the given morph is flexible in the layout dimension."

            isHorizontal
                ifTrue: [ m isFlexibleHorizontally ]
                 False: [ m isFlexibleVertically ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         isHorizontal.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         justification.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         layout: m Left: l Right: r Top: t Bottom: b Horizontally: layoutHorizontally = ( |
            | 
            "Divide the area of the given rectangle among the submorphs
             of the given morph, either horizontally or vertically
             according to the control parameter."

            (copy prepareToLayout: m
                Left: l Right: r Top: t Bottom: b
                Horizontally: layoutHorizontally)
                    doLayout).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         minSizeInLayoutDimesion: m = ( |
            | 
            "Return the minimum size required by the given morph in
             the layout dimension (e.g., minWidth for horizontal layouts)."

            isHorizontal
                ifTrue: [ m minWidth  ]
                 False: [ m minHeight ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         prepareToLayout: mph Left: l Right: r Top: t Bottom: b Horizontally: layoutHorizontally = ( |
            | 
            "Prepare to layout the submorphs of the given morph within
             the given rectangle."

            clientMorph: mph.
            allocationRectLeft:   l.
            allocationRectRight:  r.
            allocationRectTop:    t.
            allocationRectBottom: b.
            isHorizontal: layoutHorizontally.
            justification: clientMorph justification.
            flexCount: 0.  "number of flexible submorphs"
            reservedF: 0.  "sum of min space requirements of flexible guys"
            reservedN: 0.  "sum of min space requirements of non-flexible guys"
            clientMorph morphsToLayoutDo: [| :m. minSpaceForM |
                minSpaceForM: (minSizeInLayoutDimesion: m).
                (flexibleInLayoutDimesion: m) ifTrue: [
                    reservedF: reservedF + minSpaceForM.
                    flexCount: flexCount succ.
                ] False: [
                    reservedN: reservedN + minSpaceForM.
                ].
            ].
            layoutHorizontally
                ifTrue: [ budget: (r - l) max: (reservedF + reservedN) ]
                 False: [ budget: (b - t) max: (reservedF + reservedN) ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         reservedF.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         reservedN.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'spaceAllocator' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         resize: m Top: t Left: l Width: w Height: h = ( |
             mBnds.
            | 
            mBnds: m baseBounds.
            (m layoutOkay && m noStickOuts && [(w = mBnds width) && [h = mBnds height]]) ifTrue: [
                "optimization: if m's layout is okay and its size doesn't change
                 then just move it (unless it is already in position)"
                (l = mBnds left) && [t = mBnds top] ifFalse: [
                    m position: m position + ((l - mBnds left)@(t - mBnds top)).
                ].
            ] False: [| newH. newW |
                newW: m isRigidHorizontally ifTrue: [ mBnds width  ] False: w.
                newH: m isRigidVertically   ifTrue: [ mBnds height ] False: h.
                m resizeRect: (rectangle copyX: (l@t) Y: ((l + newW)@(t + newH))).
                m layoutInPlace.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: aCanvas = ( |
            | 
            "Optimization: avoid redrawing submorphs outside
             the damaged region."

            baseDrawOn: aCanvas.
            0 = morphCount ifFalse: [| c |
                c: (aCanvas copyOffset: position).
                aCanvas redrawBox ifNil: [
                    morphsDo: [| :m | m drawOn: c ].
                ] IfNotNil: [| :box. yOrigin. t. b |
                    yOrigin: c offset y. 
                    t: box    top - yOrigin.
                    b: box bottom - yOrigin.
                    morphsDo: [| :m. mBnds |
                        mBnds: m bounds.
                        t < mBnds bottom ifTrue: [
                            b <= mBnds top ifTrue: [ ^self ].
                            m drawOn: c.
                        ].
                    ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         isHorizontal = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isLeftJustified = ( |
            | -1 = justification).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isRightJustified = ( |
            | 1 = justification).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         justificationDescription = ( |
            | 
            isLeftJustified   ifTrue: [ ^   'left' ].
            isCenterJustified ifTrue: [ ^ 'center' ].
            isRightJustified  ifTrue: [ ^  'right' ].
            'unknown').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftJustify = ( |
            | justification: -1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'columnMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         orderedListOfSubmorphsInserting: m = ( |
             insertionDone.
             mBnds.
             mCenterDoubled.
             newMorphs.
            | 
            "Make a collection containing the receiver's morphs plus m,
             where m's ordering in the new collection is determined by
             its global position. If m is already a submorphs, just
             change its position in the ordering."

            newMorphs: list copyRemoveAll.
            insertionDone: false.
            mBnds: m globalBounds.
            mCenterDoubled: (mBnds top + mBnds bottom) - (2 * globalPosition y).
            morphsDo: [| :oldM |
                oldM = m ifTrue: [
                    "skip m if it is already amongst my morphs"
                ] False: [| oldMBnds |
                    insertionDone ifFalse: [| oldMBnds |
                        oldMBnds: oldM bounds.
                        (oldMBnds top + oldMBnds bottom) >= mCenterDoubled ifTrue: [
                            newMorphs add: m. "insert m before this morph"
                            insertionDone: true.
                        ].
                    ].
                    newMorphs add: oldM.
                ].
            ].
            insertionDone ifFalse: [ newMorphs addLast: m ].
            newMorphs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'ModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: justification\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         rightJustify = ( |
            | justification:  1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'columnMorph' -> () From: ( | {
         'Category: layoutDetails\x7fModuleInfo: Module: layoutMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMinSizeCaches = ( |
             h.
             minH.
             minW.
             w.
            | 
            h: 0.
            w: baseMinWidth.
            morphsDo: [| :m |
                h: h  +   m minHeight.
                w: w max: m minWidth.
            ].
            nonLaidOutMorphs do: [| :m. mBnds |
                mBnds: m bounds.
                h: h max: mBnds bottom - borderWidth.
                w: w max: mBnds right  - borderWidth. 
            ].
            h: h max: baseMinHeight.
            minW: w + borderWidth double.
            minH: h + borderWidth double.
            isRigidHorizontally ifTrue: [ minW: baseBounds  width ].
            isRigidVertically   ifTrue: [ minH: baseBounds height ].
            cachedMinWidth:  minW.
            cachedMinHeight: minH.
            self).
        } | ) 



 '-- Side effects'

 globals modules layoutMorphs postFileIn
