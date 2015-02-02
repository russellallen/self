 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot'
        
         syntaxErrorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'syntaxErrorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'syntaxErrorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules syntaxErrorMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         syntaxErrorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'syntaxErrorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'syntaxErrorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals syntaxErrorMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         syntaxErrorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits syntaxErrorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: InitializeToExpression: (time origin)'
        
         startTime <- time origin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         activityForDisapearance = ( |
             a.
            | 
            a: positionAnimator copyTarget: self  Seconds: durationOfAnimation.
            a  from: globalPosition.
            a  to: world winCanvases first size.
            a  useSlowInOut: true.
            a  abortOnTargetGrab: true.
            a andThenSend: 'delete' To: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMessage: msg = ( |
            | 
            copy initializeTitle: 'Syntax Error:' Message: msg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTitle: title Message: msg = ( |
            | 
            copy initializeTitle: title Message: msg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         delayBeforeAnimation = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         durationOfAnimation = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         getLabel: str = ( |
            | 
            labelMorph copyLabel: str
                        FontSpec: ( outlinerPreferences mediumFontSpec copyName: 'palatino' )
                           Color: paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeTitle: title Message: msg = ( |
             lines.
            | 
            color: paint copyRed: 0.970675 Green: 0.588465  Blue: 0.560117.
            beShrinkWrap.
            lines: (columnMorph copy color: color) leftJustify borderWidth: 0.
            lines addMorphLast: getLabel: title.
            (textLines copyLines: msg) do: [| :l |
              lines addMorphLast: getLabel: ('  ', l )
            ].
            addMorphLast: lines.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
            w isWorldMorph ifTrue: [
              startTime: time current.
              startGettingStepped]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'syntaxErrorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'ModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'syntaxErrorMorph' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: syntaxErrorMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | 
            (time current - startTime) > (delayBeforeAnimation * 1000) ifTrue: [
              stopGettingStepped.
              addActivity: activityForDisapearance ]).
        } | ) 



 '-- Side effects'

 globals modules syntaxErrorMorph postFileIn
