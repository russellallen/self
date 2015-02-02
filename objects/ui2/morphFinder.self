 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         morphFinder = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules morphFinder.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () From: ( | {
         'Comment: None of the code in here should be necessary (?)\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            "xxxXXX should be able to set this slot in its moduleInfo, but does not work."
              resend.postFileIn.
              morphFinderMenu finder: 
                ((morphFinder copy) color: (paint copyRed: 0.51 Green: 0.59 Blue: 0.56)).

            "xxxXXX morphFinderMenu is not filing out correctly, so I must set
            the owner of one of its submorphs."
              morphFinderMenu tearOffButton rawOwner: morphFinderMenu.

            "xxxXXX should be able to just file out this idiosyncratic color,
            but the slot is a copyDown so it does not work."
             morphFinderMenu tearOffButton owner = morphFinderMenu.
              morphFinderMenu color: (paint copyRed: 0.71 Green: 0.83 Blue: 0.81)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         morphFinder = bootstrap define: bootstrap stub -> 'globals' -> 'morphFinder' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals simpleFrameMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'morphFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals morphFinder.

CopyDowns:
globals simpleFrameMorph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morphFinder' -> () From: ( | {
         'Category: morphFinder State\x7fModuleInfo: Module: morphFinder InitialContents: InitializeToExpression: (0@0)\x7fVisibility: public'
        
         focusPoint <- 0@0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         morphFinder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'morphFinder' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits morphFinder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'morphFinder' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morphFinder' -> () From: ( | {
         'Category: morphFinder State\x7fModuleInfo: Module: morphFinder InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         selectedMorph.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         morphFinderMenu = bootstrap define: bootstrap stub -> 'globals' -> 'morphFinderMenu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals ui2Menu copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'morphFinderMenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals morphFinderMenu.

CopyDowns:
globals ui2Menu. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morphFinderMenu' -> () From: ( | {
         'Comment: should be initializeToExpression morphFinder copy
But cannot fileOut that way.
xxxXXX\x7fModuleInfo: Module: morphFinder InitialContents: InitializeToExpression: (\"morphFinder copy color: (paint copyRed: 0.51 Green: 0.59 Blue: 0.56)\" nil)\x7fVisibility: public'
        
         finder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         morphFinderMenu = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'morphFinderMenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits morphFinderMenu.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'morphFinderMenu' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morphFinderMenu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: aCanvas = ( |
             r.
            | 
             resend.baseDrawOn: aCanvas.
            r: (globalBaseBounds origin + (borderWidth @ borderWidth)) asInteger # 
               (globalBaseBounds corner - (borderWidth @ borderWidth)) asInteger. 
            ((r right > focusPoint x) && (r left < focusPoint x))  ifTrue: [
              aCanvas line: ((focusPoint x - globalPosition x) + position x) asInteger @ ((baseBounds origin y + borderWidth) ) asInteger
                        To: ((focusPoint x - globalPosition x) + position x) asInteger @ ((baseBounds corner y - borderWidth) ) asInteger
                      Color: color.
            ].
            ((r bottom > focusPoint y) && (r top < focusPoint y))  ifTrue: [
              aCanvas line:  ((baseBounds origin x + borderWidth) ) asInteger @ ((focusPoint y - globalPosition y) + position y) asInteger
                        To:  ((baseBounds corner x - borderWidth) ) asInteger @ ((focusPoint y - globalPosition y) + position y) asInteger
                       Color: color.
              self]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         findRootMorphAtGlobalPoint: pt = ( |
             mphs.
            | 
            mphs: (world morphsAt: pt).
            mphs remove: world IfAbsent: nil.
            mphs remove: self  IfAbsent: nil.
            mphs: mphs copyFilteredBy: [ |:m| (m root = m)].
            mphs isEmpty ifTrue: [ ^ nil ] False: [ ^ mphs first]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         next = ( |
             baseMorph.
             foundSelected.
             mphs.
             new.
            | 
            baseMorph: findRootMorphAtGlobalPoint: focusPoint.
            baseMorph ifNil: [ ^ self ].
            mphs: (baseMorph morphsAt: focusPoint - baseMorph owner globalPosition ). 
            foundSelected: false.
            new: baseMorph.
            mphs reverseDo: [
              | :m |  
              "Finds the first morph after the frame's currently selected morph"
              foundSelected ifTrue: [
                 new: m.
                 foundSelected: false
              ] False: [
                foundSelected: m = selectedMorph.
              ].
            ].  
            select: new.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'simpleFrameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         select: mph = ( |
             w.
            | 
            w: mph topmostOwner.
            w safelyDo: [ selectedMorph: mph ].
            owner = w ifFalse: [
               w safelyDo: [w addMorph: self]].
            w safelyDo: [ changed ].
            rawBox: mph globalBaseBounds.
            w safelyDo: [ w moveToFront: self.  changed ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinder' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: public'
        
         setFocusPoint: pt = ( |
             mph.
            | 
            focusPoint: pt.
            mph: findRootMorphAtGlobalPoint: pt.
            mph ifNil: [
              selectedMorph: nil.
              changed.
              position: pt - (bounds size / 2).
              changed.
            ] IfNotNil: [
              select: mph.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinderMenu' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         copy = ( |
             guy.
            | 
            guy: resend.copy.
            guy finder: finder copy. 
            guy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinderMenu' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         delete = ( |
            | 
            finder ifNotNil: [finder delete].
            resend.delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinderMenu' -> () From: ( | {
         'Category: interaction support\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot\x7fVisibility: private'
        
         markButton: b = ( |
            | 
            resend.markButton: b.
            markedButton = tearOffButton ifTrue: [ ^ self].
            finder select: markedButton target.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinderMenu' -> () From: ( | {
         'ModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinderMenu' -> () From: ( | {
         'Category: popUp/Donw\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         popUpInWorld: w From: h InvocationPoint: invocationPt ForObject: obj EventTime: t = ( |
            | 
            w addMorph: finder.
            finder setFocusPoint: invocationPt.
            finder select: obj.
            popUpInWorld: w From: h InvocationPoint: invocationPt EventTime: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morphFinderMenu' -> () From: ( | {
         'Category: popUp/Donw\x7fModuleInfo: Module: morphFinder InitialContents: FollowSlot'
        
         popUpInWorldPart2 = ( |
            | 
            resend.popUpInWorldPart2.
            changed.
            globalPosition: finder selectedMorph globalBaseBounds right @ globalPosition y.
            changed.
            self).
        } | ) 



 '-- Side effects'

 globals modules morphFinder postFileIn
