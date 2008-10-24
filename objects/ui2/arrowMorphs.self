 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Arrows\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowBodyMorph = bootstrap define: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals arrowBodyMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: arrowBodyMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         added <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: arrowBodyMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         endMorph1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: arrowBodyMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         endMorph2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: arrowBodyMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (0@0)\x7fVisibility: private'
        
         p1 <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: arrowBodyMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (0@0)\x7fVisibility: private'
        
         p2 <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Arrows\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowBodyMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits arrowBodyMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: arrowBodyMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (1)\x7fVisibility: public'
        
         width <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Arrows\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowEndMorph = bootstrap define: bootstrap stub -> 'globals' -> 'arrowEndMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals circleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'arrowEndMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals arrowEndMorph.

CopyDowns:
globals circleMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowEndMorph' -> () From: ( | {
         'Category: arrowEndMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (0@0)\x7fVisibility: private'
        
         edgeOffset <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowEndMorph' -> () From: ( | {
         'Category: arrowEndMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         owningArrow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Arrows\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowEndMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'arrowEndMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits arrowEndMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowEndMorph' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'arrowEndMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'arrowEndMorph' -> () From: ( | {
         'Category: arrowEndMorph State\x7fModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         shouldDraw <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot'
        
         arrowMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'arrowMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'arrowMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules arrowMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowMorphs' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowMorphs' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowMorphs' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot'
        
         myComment <- 'Support for arrows that stay stuck to other morphs.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowMorphs' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'arrowMorphs' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addHBarsCount: n ToWorld: w = ( |
             bar1.
             bar2.
            | 
            bar1: morph copy setWidth: (20 * n) Height: 20.
            bar2: morph copy setWidth: (20 * n) Height: 20.
            w addMorph: (bar1 globalPosition: (random integer: 100)@(random integer: 100)).
            w addMorph: (bar2 globalPosition: (random integer: 100)@(random integer: 100)).
            n do: [| :i |
                copyIntoWorld: w
                    FromMorph: bar1 Offset: (10 + (20 * i))@10
                      ToMorph: bar2 Offset: (10 + (20 * i))@10.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addVBarsCount: n ToWorld: w = ( |
             bar1.
             bar2.
            | 
            bar1: morph copy setWidth: 20 Height: (20 * n).
            bar2: morph copy setWidth: 20 Height: (20 * n).
            w addMorph: (bar1 globalPosition: (random integer: 100)@(random integer: 100)).
            w addMorph: (bar2 globalPosition: (random integer: 100)@(random integer: 100)).
            n do: [| :i |
                copyIntoWorld: w
                    FromMorph: bar1 Offset: 10@(10 + (20 * i))
                      ToMorph: bar2 Offset: 10@(10 + (20 * i)).
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
             b.
             l.
             r.
             t.
            | 
            (p1 x < p2 x) ifTrue: [
                l: p1 x - width.
                r: p2 x + width.
            ] False: [
                l: p2 x - width.
                r: p1 x + width.
            ].
            (p1 y < p2 y) ifTrue: [
                t: p1 y - width.
                b: p2 y + width.
            ] False: [
                t: p2 y - width.
                b: p1 y + width.
            ].
            (l@t) # (r@b)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c line: p1 To: p2 Width: width Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIntoWorld: w = ( |
             e1.
             e2.
             new.
            | 
            new: copy.
            new color: paint named: 'black'.
            e1: arrowEndMorph copyAt: (random integer: 400)@(random integer: 300) Arrow: new.
            e2: arrowEndMorph copyAt: (random integer: 400)@(random integer: 300) Arrow: new.
            e1 radius: 3.
            e2 radius: 3.
            new endMorph1: e1.
            new endMorph2: e2.
            w addMorph: (e1 globalPosition: (random integer: 400)@(random integer: 300)).
            w addMorph: (e2 globalPosition: (random integer: 400)@(random integer: 300)).
            w addMorph: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyIntoWorld: w FromMorph: m1 Offset: o1 ToMorph: m2 Offset: o2 = ( |
             e1.
             e2.
             new.
            | 
            new: copy.
            new color: paint named: 'black'.
            e1: arrowEndMorph copyAt: (m1 globalPosition + o1) Arrow: new.
            e2: arrowEndMorph copyAt: (m2 globalPosition + o2) Arrow: new.
            e1 radius: 3.
            e2 radius: 3.
            new endMorph1: e1.
            new endMorph2: e2.
            m1 addMorph: e1.
            m2 addMorph: e2.
            w  addMorph: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: tracking\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteEnds = ( |
            | endMorph1 delete.
            endMorph2 delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: tracking\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteIfAnEndIsDeleted = ( |
            | 
            ((endMorph1 isInWorld) && [endMorph2 isInWorld]) ifFalse: [
                deleteEnds.
                delete.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: tracking\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         edgePointFor: highEnd LowEnd: lowEnd IfLowEndHidden: blk = ( |
             bnds.
             otherP.
             thisP.
            | 
            bnds:  highEnd root globalBounds.
            thisP: highEnd globalPosition.
            otherP: lowEnd globalPosition.
            otherP x < bnds left ifTrue: [| x. y |
                x: bnds left.
                y: thisP y + (((x - thisP x) * (otherP y - thisP y)) / (otherP x - thisP x)).
                (bnds top <= y) && [y <= bnds bottom] ifTrue: [ ^x@y ].
            ].
            otherP x > bnds right ifTrue: [| x. y |
                x: bnds right.
                y: thisP y + (((x - thisP x) * (otherP y - thisP y)) / (otherP x - thisP x)).
                (bnds top <= y) && [y <= bnds bottom] ifTrue: [ ^x@y ].
            ].
            otherP y < bnds top ifTrue: [| x. y |
                y: bnds top.
                x: thisP x + (((y - thisP y) * (otherP x - thisP x)) / (otherP y - thisP y)).
                (bnds left <= x) && [x <= bnds right] ifTrue: [ ^x@y ].
            ].
            otherP y > bnds bottom ifTrue: [| x. y |
                y: bnds bottom.
                x: thisP x + (((y - thisP y) * (otherP x - thisP x)) / (otherP y - thisP y)).
                (bnds left <= x) && [x <= bnds right] ifTrue: [ ^x@y ].
            ].
            blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isArrowBodyMorph = ( |
            | 
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'arrowBodyMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         position = ( |
            | p1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         position: p = ( |
            | "ignore this message" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | "ignore this message" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: tracking\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         trackEndpoints = ( |
             newP1.
             newP2.
             ownerP.
            | 
            deleteIfAnEndIsDeleted.
            isInWorld ifFalse: [ ^self ].
            ownerP: owner globalPosition.
            newP1: endMorph1 globalPosition - ownerP.
            newP2: endMorph2 globalPosition - ownerP.
            (newP1 = p1) && [newP2 = p2] ifFalse: [| end1Level. end2Level. rootMorphs. w |
                changed.
                w: world.
                rootMorphs: w rawMorphs copyAddLast: w.
                end1Level: (rootMorphs keyAt: endMorph1 root IfAbsent: -1).
                end2Level: (rootMorphs keyAt: endMorph2 root IfAbsent: -1).
                end1Level < end2Level ifTrue: [
                    "end1 is painted last--is on top"
                    trackHighEnd: endMorph1 Level: end1Level LowEnd: endMorph2 Level: end2Level.
                ] False: [
                    trackHighEnd: endMorph2 Level: end2Level LowEnd: endMorph1 Level: end1Level.
                ].
                p1: newP1.
                p2: newP2.
                changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowBodyMorph' -> () From: ( | {
         'Category: tracking\x7fComment: \"High\" and \"Low\" confused me;
\"high\" is visually on top (in front), \"low\" is visually on bottom (in rear)\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         trackHighEnd: highEnd Level: highEndLevel LowEnd: lowEnd Level: lowEndLevel = ( |
             edgeP.
            | 
            highEnd shouldDraw: false.  "possibly changed to true later"
            lowEnd  shouldDraw: false.

            "find point on the arrow body just outside bounds of highEnd's root"
            edgeP: edgePointFor: highEnd LowEnd: lowEnd IfLowEndHidden: [ ^self ].

            "Look for a morph between the levels of the root morphs of this arrow's
             ends that would keep the arrow from dropping down to the level of its lower
             end (that is, a morph that contains the edge point and whose level is between
             the levels of the arrow ends). If no such morph is found, then tell the
             higher end of the arrow to draw itself out to the edge of its root morph."
            world rootMorphsAt: edgeP Do: [| :m. :mLevel |
                (mLevel < lowEndLevel) && [mLevel > highEndLevel] ifTrue: [ ^self ].
            ].
            highEnd shouldDraw: true.
            highEnd edgeOffset: (edgeP - highEnd globalPosition).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowEndMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c fillCircleCenteredAt: center Diameter: radius double Color: owningArrow color.
            shouldDraw ifTrue: [
                c line: position
                       To: position + edgeOffset
                    Width: owningArrow width
                    Color: owningArrow color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowEndMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAt: p Arrow: a = ( |
             new.
            | 
            new: copyRemoveAllMorphs.
            new owningArrow: a.
            new position: p.
            new shouldDraw: false.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowEndMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'arrowEndMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'arrowEndMorph' -> () From: ( | {
         'ModuleInfo: Module: arrowMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'circleMorph' -> ().
        } | ) 



 '-- Side effects'

 globals modules arrowMorphs postFileIn
