 '$Revision: 30.5 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot'
        
         tristateIndicator = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules tristateIndicator.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.5 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'tristateIndicator' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         tristateIndicatorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'tristateIndicatorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals circleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'tristateIndicatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals tristateIndicatorMorph.

CopyDowns:
globals circleMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         tristateIndicatorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits tristateIndicatorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tristateIndicatorMorph' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = bootstrap stub -> 'globals' -> 'tristateIndicatorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: Tristate Indicator State\x7fModuleInfo: Module: tristateIndicator InitialContents: InitializeToExpression: (\'maybe\')\x7fVisibility: private'
        
         state <- 'maybe'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: changing state\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         advanceToNextState = ( |
            | 
            ifYes:   [setStateMaybe]
              Maybe: [setStateNo   ]
              No:    [setStateYes  ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            "We draw the circle border _after_ the circle has
             been drawn.  Otherwise our border would be drawn
             over when the circle is drawn"
            resend.baseDrawOn: c.
            c circleCenteredAt: center
                      Diameter: radius double
                         Color: paint named: 'black'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: private'
        
         color = ( |
            | 
            paint named:
              ifYes: 'green'
              Maybe: 'yellow'
                 No: 'red').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         ifYes: yBlk Maybe: mBlk No: nBlk = ( |
            | 
            case if:   [state = 'yes'  ] Then: yBlk
                 If:   [state = 'maybe'] Then: mBlk
                 If:   [state = 'no'   ] Then: nBlk
                 Else: [error: 'bad state']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            updateColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'tristateIndicatorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'ModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'circleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: changing state\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: private'
        
         setState: s = ( |
            | 
            s = state ifFalse: [
              state: s.
              changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: changing state\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         setStateMaybe = ( |
            | 
            setState: 'maybe').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: changing state\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         setStateNo = ( |
            | 
            setState: 'no').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'tristateIndicatorMorph' -> () From: ( | {
         'Category: changing state\x7fModuleInfo: Module: tristateIndicator InitialContents: FollowSlot\x7fVisibility: public'
        
         setStateYes = ( |
            | 
            setState: 'yes').
        } | ) 



 '-- Side effects'

 globals modules tristateIndicator postFileIn
