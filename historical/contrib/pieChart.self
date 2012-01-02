 '$Revision: 1.1.1.1 $'
 '
Copyright 1992, 1993, 1994, 1995 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot'
        
         pieChart = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pieChart.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         comment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.1.1.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pieChart' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fComment: The prototypical pie chart\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         pieChartMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pieChartMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals circleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pieChartMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pieChartMorph.

CopyDowns:
globals circleMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pieChartMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: Make a new pie chart with the amounts
from data (a collection).\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         copyNewData: data = ( |
             new.
             wList.
            | 
            new: copyRemoveAllMorphs.
            wList:
              data copy mapBy: [| :val. w |
                w: pieWedgeMorph copyRemoveAllMorphs.
                w color: paint copyRandom.
                w amount: val.
              ].
            new addAllMorphs: wList.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         layoutInPlace = ( |
            | 
            resend.layoutInPlace.
            wedges do: [| :w |
              w center: 0@0.
              w radius: radius + 2.
            ].
            updateWedges.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         morphTypeName = 'pieChartMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'circleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( | {
         'Category: updating\x7fComment: Update the wedge angles\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         updateWedges = ( |
             wList.
             total.
             nextAngle.
            | 
            wList: wedges.

            "compute total of wedge amounts"
            total: (wList copyMappedBy: [| :w | w amount]) sum.

            "special case: the total is zero"
            total = 0 ifTrue: [
              wList do: [| :w | w percent: 0].
              ^self
            ].

            "divide pie among wedges proportionally"
            nextAngle: 0.
            wList do: [| :w |
              w startAngle: nextAngle.
              w percent: 100.0 * (w amount /= total).
              nextAngle: nextAngle + w spanAngle.
            ].
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         wantsMorph: m Event: evt = ( |
            | 
            m morphTypeName = 'pieWedgeMorph').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         wedges = ( |
             wList.
            | 
            wList: list copyRemoveAll.
            morphsDo: [| :m |
              m morphTypeName = 'pieWedgeMorph' ifTrue: [
                wList add: m
              ].
            ].
            wList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieChartMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            pieChartMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Applications\x7fComment: The prototypical pie wedge\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         pieWedgeMorph = bootstrap define: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals circleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pieWedgeMorph.

CopyDowns:
globals circleMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pieWedgeMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         amount = ( |
            | rawAmount).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         amount: a = ( |
            | rawAmount: a. layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         baseContainsPt: p = ( |
             v.
             angle.
             endAngle.
            | 
            v: (p - center) xAxisReflect. "expect y to increase vertically"
            angle: v thetaDegrees.
            v r > radius  ifTrue: [ ^false ].
            (angle >= startAngle) && [angle <= (startAngle + spanAngle)]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         baseDrawOn: canvas = ( |
             r.
            | 
            "X bug: zero span angle draws full circle!"
            percent = 0.0 ifTrue: [ ^self ].
            "X bug: fillArc sometimes goes one pixel out of bounds"
            r: baseBounds indent: 1.
            canvas
              fillArcWithin: r
                       From: startAngle 
                   Spanning: spanAngle
                      Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         leftMouseDown: evt = ( |
            | 
            evt shiftIsDown && [owner morphTypeName = 'pieChartMorph']
              ifTrue: [evt sourceHand addMorph: self]
               False: [resend.leftMouseDown: evt].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         morphTypeName = 'pieWedgeMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'circleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: private'
        
         spanAngle = ( |
            | percent * 3.6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: InitializeToExpression: (33.0)\x7fVisibility: private'
        
         percent <- 33.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: pieChart InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            pieWedgeMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: InitializeToExpression: (10)\x7fVisibility: private'
        
         rawAmount <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pieWedgeMorph' -> () From: ( | {
         'ModuleInfo: Module: pieChart InitialContents: InitializeToExpression: (0)\x7fVisibility: private'
        
         startAngle <- 0.
        } | ) 



 '-- Side effects'

 globals modules pieChart postFileIn
