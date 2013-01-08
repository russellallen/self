 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         metaMorph = bootstrap define: bootstrap stub -> 'globals' -> 'metaMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'metaMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals metaMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         currentState <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         editMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         metaMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( |
             {} = 'Comment: A metaMorph can be in one of N different states. Associated
with each state is a set of submorphs.  When the metamorph changes from
one state to another, its current submorphs are put in storage and
are replaced with the submorphs for the new state.  The morphs for each
state and their relative placement can be controlled interactively by
setting editMode to true.  This makes the morph appear as a rectangle.
You can drop a set of morphs onto this rectangle, then go to the
next state and repeat the process to set the morphs for that state,
and so forth.  Setting the editMode flag back to false hides the base
rectangle again.\x7fModuleInfo: Creator: traits metaMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'metaMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: InitializeToExpression: (paint named: \'lightGray\')\x7fVisibility: private'
        
         rawColor <- paint named: 'lightGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: InitializeToExpression: (vector copySize:2 FillingWith: vector copy)\x7fVisibility: public'
        
         states <- vector copySize:2 FillingWith: vector copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot'
        
         metaMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'metaMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'metaMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules metaMorph.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot'
        
         myComment <- 'This module provide support for pixmaps and pixmap movies.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseBounds = ( |
            | 
            "Pretend to have virtually no baseBounds if not in edit mode."

             editMode ifTrue: [
                 resend.baseBounds.
             ] False: [| p |
                 0 = morphCount ifTrue: [
                     p: position.
                 ] False: [
                     p: position + firstMorph position.
                 ].
                 p ## (0@0).
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: geometry\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseContainsPt: p = ( |
            | 
            "Pretend to contain no points if not in edit mode."

             editMode
                 ifTrue: [ resend.baseContainsPt: p ]
                  False: [ false ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            editMode ifTrue: [ resend.baseDrawOn: c ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         copyStateCount: nStates = ( |
             new.
            | 
            new: copy.
            new states: vector copySize: nStates FillingWith: vector.
            new currentState: 0.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: creation\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         example = ( |
             light.
             m.
            | 
            "This method creates a morph that has three states, each
             containing a circleMorph of a different color. Clicking
             on it cycles to the next color."

             m: metaMorph copyStateCount: 3.
             light: circleMorph copy radius: 8.
             light _AddSlots: (|
                leftMouseDown: e = ( owner nextState ).
             |).
             m setState: 0.
             m addMorph: light copy color: (paint named: 'green').
             m setState: 1.
             m addMorph: light copy color: (paint named: 'yellow').
             m setState: 2.
             m addMorph: light copy color: (paint named: 'red').
             m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         isRectangular = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'metaMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: stateTransitions\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         nextState = ( |
            | 
            "Switch to the next state in the cycle, wrapping back
             to state 0 if currently in the final state. (In the
             common case of two states, this toggles betwee them)."

            setState: (currentState + 1) % states size.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'ModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'metaMorph' -> () From: ( | {
         'Category: stateTransitions\x7fModuleInfo: Module: metaMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         setState: s = ( |
             ms.
             ps.
            | 
            "Present the morphs for the given state."

            (0 <= s) && (s < states size) ifFalse: [
                error: 'bad state index to: ', printString.
            ].

            changed.

            ms: morphs copy.
            states at: currentState Put: ms.
            ps: ms copyMappedBy: [|:m| m position].
            removeAllMorphs.
            "remember offsets via positions"
            ms with: ps Do: [|:m. :p| m position: p].

            ms: states at: s.
            ps: ms copyMappedBy: [|:m| m position].
            addAllMorphs: states at: s.
            "restore positions"
            ms with: ps Do: [|:m. :p| m position: p].

            currentState: s.
            layoutChanged.
            self).
        } | ) 



 '-- Side effects'

 globals modules metaMorph postFileIn
