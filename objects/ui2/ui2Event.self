 'Sun-$Revision: 30.24 $'
 '
Copyright 1992-2009 AUTHORS, Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Events\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractUI2Event = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractUI2Event.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         bounds <- bootstrap stub -> 'globals' -> 'rectangle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         cursorPoint <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: InitializeToExpression: (0)'
        
         keySym <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         keycode <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'Comment: string for key, usually of length one\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         keystrokes <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Events\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractUI2Event = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( |
             {} = 'Comment: A ui2Event is a general input event. Variations include mouse button
     transitions, mouse movements, and keyboard key transitions.\x7fModuleInfo: Creator: traits abstractUI2Event.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractUI2Event' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         sourceHand.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'Comment: Mouse/modifier state just after event.
Note that the interpretation of the 
individual bits depends on the platform,
but the stateMasks make it possible to
use \'state\' in a platform independent way.\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         state <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         timeStamp.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         type <- 'null'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         wheelDelta <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot'
        
         ui2Event = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Event' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Event' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui2Event.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot'
        
         myComment <- 'UI2 events and input handling.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.24 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         = x = ( |
            | 
            (type           = x type)        &&
            [(cursorPoint   = x cursorPoint) &&
            [(keycode       = x keycode)     &&
            [(state         = x state)       &&
            [(keystrokes    = x keystrokes)]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: event location\x7fComment: (see isKeyEvent)\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         adjustForCanvas: aWindowCanvas = ( |
            | cursorPoint: cursorPoint - aWindowCanvas offset).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         altGraphIsDown = ( |
            | 0 != (state && altGraphicMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         altIsDown = ( |
            | 0 != (state && altMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: default state masks\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         altMask = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         anyMouseIsDown = ( |
            | 0 != (state && anyMouseMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         commandIsDown = ( |
            | 0 != (state && commandMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: default state masks\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         commandMask = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         controlIsDown = ( |
            | 0 != (state && controlMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: xEvt LastCursor: lastCursor = ( |
            | 
            copy setFrom: xEvt LastCursor: lastCursor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: conversion\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         doesPlatformReportDoubleClicks = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         editorKeyCapComboHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( |
             {} = 'Comment: I stub out all the messages sent back to the argument of
sendMesageToHandleKeyboardEventTo: below.
Feel free to inherit me and override the ones you can implement.
-- Ungar Aug., 2002\x7fModuleInfo: Creator: traits abstractUI2Event editorKeyCapComboHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: misc. commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptTextChanges: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: auto-completion\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         autoComplete = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         backspace = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         backward_char = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         backward_word = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         beginning_of_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: misc. commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         cancelTextChanges: evt = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         copy_cmd = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteForward = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: misc. commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteMorph_cmd = ( |
            | 
            isInWorld ifTrue: [root animatedDelete].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_next_char = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_word_backwards = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         end_of_line = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_backward_char = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_backward_word = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_beginning_of_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_end_of_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_forward_char = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_forward_word = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_next_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: extending selection\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         extend_selection_previous_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         forward_char = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         forward_word = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         handle: combo IfCannot: b = ( |
            | 
            combo beHandledBy: self IfCannot: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fCategory: arrows\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         handleMediumArrowPress: combo IfCannot: b = ( |
             k.
            | 
            k: combo nonmodifierKeyCap.
            combo shiftIsDown ifFalse: [
              keyCaps arrows left      = k ifTrue: [^ backward_word                 ].
              keyCaps arrows right     = k ifTrue: [^  forward_word                 ].
              keyCaps arrows up        = k ifTrue: [^                  previous_line].
              keyCaps arrows down      = k ifTrue: [^                      next_line].
              keyCaps arrows upLeft    = k ifTrue: [  backward_word. ^ previous_line].
              keyCaps arrows upRight   = k ifTrue: [   forward_word. ^ previous_line].
              keyCaps arrows downLeft  = k ifTrue: [  backward_word. ^     next_line].
              keyCaps arrows downRight = k ifTrue: [   forward_word. ^     next_line].
            ] True: [
              keyCaps arrows left      = k ifTrue: [^ extend_selection_backward_word                                  ].
              keyCaps arrows right     = k ifTrue: [^  extend_selection_forward_word                                  ].
              keyCaps arrows up        = k ifTrue: [^                                   extend_selection_previous_line].
              keyCaps arrows down      = k ifTrue: [^                                       extend_selection_next_line].
              keyCaps arrows upLeft    = k ifTrue: [  extend_selection_backward_word. ^ extend_selection_previous_line].
              keyCaps arrows upRight   = k ifTrue: [   extend_selection_forward_word. ^ extend_selection_previous_line].
              keyCaps arrows downLeft  = k ifTrue: [  extend_selection_backward_word. ^     extend_selection_next_line].
              keyCaps arrows downRight = k ifTrue: [   extend_selection_forward_word. ^     extend_selection_next_line].
            ].
            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         handlePressWithAltDown: combo IfCannot: b = ( |
            | 
            combo nonmodifierKeyCap isArrow ifTrue: [handleMediumArrowPress: combo IfCannot: b].

            combo nonmodifierKeyCap = keyCaps oddballs enter ifTrue: [^ acceptTextChanges: combo event].

            combo nonmodifierKeyCap isPrintable ifTrue: [^combo nonmodifierKeyCap printString do: [|:c| insert_char: c]].

            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         handlePressWithCommandDown: combo IfCannot: b = ( |
            | 
            handlePressWithMetaDown: combo IfCannot: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         handlePressWithControlDown: combo IfCannot: b = ( |
            | 
            combo nonmodifierKeyCap isArrow ifTrue: [handleMediumArrowPress: combo IfCannot: b].

            combo nonmodifierKeyCap = keyCaps oddballs enter ifTrue: [^ acceptTextChanges: combo event].
            combo nonmodifierKeyCap isPrintable ifTrue: [|c|
              c: combo nonmodifierKeyCap character.
              c = 'a'   ifTrue: [ ^ beginning_of_line        ].
              c = 'b'   ifTrue: [ ^ backward_char            ].
              c = 'c'   ifTrue: [ ^ copy_cmd                 ].
              c = 'd'   ifTrue: [ ^ delete_next_char         ].
              c = 'e'   ifTrue: [ ^ end_of_line              ].
              c = 'f'   ifTrue: [ ^ forward_char             ].
              c = 'h'   ifTrue: [ ^ backspace                ].
              c = 'k'   ifTrue: [ ^ delete_line              ].
              c = 'l'   ifTrue: [ ^ resizeToText             ].
              c = 'm'   ifTrue: [ ^ split_line               ].
              c = 'n'   ifTrue: [ ^ next_line                ].
              c = 'o'   ifTrue: [ ^ open_line                ].
              c = 'p'   ifTrue: [ ^ previous_line            ].
              c = 's'   ifTrue: [ ^ seek_cmd                 ].
              c = 't'   ifTrue: [ ^ transpose_chars          ].
              c = 'v'   ifTrue: [ ^ paste_cmd                ].
              c = 'w'   ifTrue: [ ^ delete_word_backwards    ].
              c = 'x'   ifTrue: [ ^ cut_cmd                  ].
              c = 'y'   ifTrue: [ ^ paste_cmd                ].
              c = 'z'   ifTrue: [ ^ undo_cmd                 ].
            ].

            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         handlePressWithMetaDown: combo IfCannot: b = ( |
            | 
            combo nonmodifierKeyCap = keyCaps oddballs enter ifTrue: [^ acceptTextChanges: combo event].
            combo nonmodifierKeyCap isPrintable ifTrue: [|c|
              c: combo nonmodifierKeyCap character.
              c = 'x'  ifTrue: [ ^         cut_cmd ].
              c = 'v'  ifTrue: [ ^       paste_cmd ].
              c = 'c'  ifTrue: [ ^        copy_cmd ].
              c = 'd'  ifTrue: [ ^ deleteMorph_cmd ].

              c = '.'  ifTrue: [ ^ cancelTextChanges: combo event  ].

              c = 's'  ifTrue: [ ^ shell save ].

              c = 'a'  ifTrue: [ ^ selectAll ].

              c = 'n'  ifTrue: [ ^            senders_cmd: combo event ].
              c = 'm'  ifTrue: [ ^       implementors_cmd: combo event ].
              c = 'l'  ifTrue: [ ^          find_slot_cmd: combo event ].
              c = 't'  ifTrue: [ ^ methods_containing_cmd: combo event ].
              c = 'g'  ifTrue: [ ^ ( message copy receiver: self Selector: 'get_it_cmd:' With: combo event)
                                        forkForBirthEvent: combo event].

              [c = '/'  ifTrue: [ ^ autoComplete ]]. "UI is not good enough yet to be turned on. -- Adam, 12/04"
            ].
            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         handlePressWithNoModifiers: combo IfCannot: b = ( |
            | 
            combo nonmodifierKeyCap isArrow ifTrue: [^ handleSmallArrowPress: combo IfCannot: b].

            combo nonmodifierKeyCap isPrintable ifTrue: [^combo nonmodifierKeyCap printString do: [|:c| insert_char: c]].

            combo nonmodifierKeyCap = keyCaps oddballs enter     ifTrue: [^ split_line].
            combo nonmodifierKeyCap = keyCaps oddballs backspace ifTrue: [^ backspace].
            combo nonmodifierKeyCap = keyCaps oddballs escape    ifTrue: [^ cancelTextChanges: combo event].

            combo nonmodifierKeyCap = keyCaps oddballs  copy_cmd ifTrue: [^  copy_cmd].
            combo nonmodifierKeyCap = keyCaps oddballs   cut_cmd ifTrue: [^   cut_cmd].
            combo nonmodifierKeyCap = keyCaps oddballs paste_cmd ifTrue: [^ paste_cmd].
            combo nonmodifierKeyCap = keyCaps oddballs  undo_cmd ifTrue: [^  undo_cmd].

            combo nonmodifierKeyCap = keyCaps oddballs delete ifTrue: [^  deleteForward].
            combo nonmodifierKeyCap = keyCaps oddballs home   ifTrue: [^  combo shiftIsDown ifFalse: [                 beginning_of_line]
                                                                                               True: [extend_selection_beginning_of_line]].
            combo nonmodifierKeyCap = keyCaps oddballs end    ifTrue: [^  combo shiftIsDown ifFalse: [                       end_of_line]
                                                                                               True: [      extend_selection_end_of_line]].

            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         handlePressWithOptionDown: combo IfCannot: b = ( |
            | 
            handlePressWithNoModifiers: combo IfCannot: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: modifier-specific dispatching\x7fCategory: arrows\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         handleSmallArrowPress: combo IfCannot: b = ( |
             k.
            | 
            k: combo nonmodifierKeyCap.
            combo shiftIsDown ifFalse: [
              keyCaps arrows left      = k ifTrue: [^ backward_char                 ].
              keyCaps arrows right     = k ifTrue: [^  forward_char                 ].
              keyCaps arrows up        = k ifTrue: [^                  previous_line].
              keyCaps arrows down      = k ifTrue: [^                      next_line].
              keyCaps arrows upLeft    = k ifTrue: [  backward_char. ^ previous_line].
              keyCaps arrows upRight   = k ifTrue: [   forward_char. ^ previous_line].
              keyCaps arrows downLeft  = k ifTrue: [  backward_char. ^     next_line].
              keyCaps arrows downRight = k ifTrue: [   forward_char. ^     next_line].
            ] True: [
              keyCaps arrows left      = k ifTrue: [^ extend_selection_backward_char                                  ].
              keyCaps arrows right     = k ifTrue: [^  extend_selection_forward_char                                  ].
              keyCaps arrows up        = k ifTrue: [^                                   extend_selection_previous_line].
              keyCaps arrows down      = k ifTrue: [^                                       extend_selection_next_line].
              keyCaps arrows upLeft    = k ifTrue: [  extend_selection_backward_char. ^ extend_selection_previous_line].
              keyCaps arrows upRight   = k ifTrue: [   extend_selection_forward_char. ^ extend_selection_previous_line].
              keyCaps arrows downLeft  = k ifTrue: [  extend_selection_backward_char. ^     extend_selection_next_line].
              keyCaps arrows downRight = k ifTrue: [   extend_selection_forward_char. ^     extend_selection_next_line].
            ].
            b value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: printable characters\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         insert_char: char = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         next_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         open_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         paste_cmd = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fCategory: moving\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         previous_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: auto-completion\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         resetAutoCompleter = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeToText = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         seek_cmd = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAll = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         split_line = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         tab = ( |
            | 
            insert_char: ' '.
            insert_char: ' ').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         transpose_chars = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> () From: ( | {
         'Category: override these to handle particular commands\x7fCategory: control character commands\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         undo_cmd = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         hash = ( |
            | cursorPoint hash ^^ keycode hash ^^ state hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         ignore = ( |
            | 'ignore' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: time stamps\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToUseMyTimeStampForMenus = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fComment: \"Smalltalk has a tradition of left shift hacks.
 We used to use the shift key, but for Mikey, who is
 left-handed, we need the shift key (on the right, but
 I don\'t know how to tell the difference) to bring up the middle-mouse
 menu. So use caps lock for the hacks. -- dmu 5/05\"

Changed from shiftLockIsDown to shiftIsDown -- that fix wasn\'t too good,
too hard to do selection extension.
-- dmu 9/05\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         isShiftDownForLeftShiftHack = ( |
            | 
            shiftIsDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         keyCapCombosPressed = ( |
            | 
            keyCapsPressed copyMappedBy: [|:b| 
              ((keyCapCombo copy
                nonmodifierKeyCap:  b)
                  modifierKeyCaps:  modifierKeyCapsPressed)
                            event:  self.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         keyCapForCharacter: c = ( |
            | 

            c asByte =   8 ifTrue: [^ keyCaps oddballs backspace].
            c asByte =   9 ifTrue: [^ keyCaps oddballs tab].
            c asByte =  13 ifTrue: [^ keyCaps oddballs enter].
            c asByte =  27 ifTrue: [^ keyCaps oddballs escape].

            c asByte = 127 ifTrue: [^ keyCaps oddballs delete].

            c isPrintable ifTrue: [^ keyCaps printableCharacter copy character: c].
            controlIsDown && [c isControlCharacter]
                          ifTrue: [^ keyCaps printableCharacter copy character: (c asByte + 96) asCharacter].

            c asByte =   1 ifTrue: [^ keyCaps oddballs home    ].
            c asByte =   4 ifTrue: [^ keyCaps oddballs end     ].
            c asByte =   5 ifTrue: [^ keyCaps oddballs insert  ].
            c asByte =  11 ifTrue: [^ keyCaps oddballs pageUp  ].
            c asByte =  12 ifTrue: [^ keyCaps oddballs pageDown].

            keyCaps printableCharacter copy character: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         keyCapsPressed = ( |
            | 
            keystrokes asList copyMappedBy: [|:c| keyCapForCharacter: c]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown = ( |
            | 'keyDown' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         keyEvent = ( |
            | ('keyDown' = type) || ['keyUp' = type]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         keyUp = ( |
            | 'keyUp' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick = ( |
            | 'leftDoubleClick' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         leftIsDown = ( |
            | 0 != (state && leftMouseMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown = ( |
            | 'leftMouseDown' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp = ( |
            | 'leftMouseUp' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         metaIsDown = ( |
            | 0 != (state && metaMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: default state masks\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         metaMask = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         middleDoubleClick = ( |
            | 'middleDoubleClick' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         middleIsDown = ( |
            | 0 != (state && middleMouseMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown = ( |
            | 'middleMouseDown' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseUp = ( |
            | 'middleMouseUp' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         modifierKeyCapsPressed = ( |
             modifiers <- bootstrap stub -> 'globals' -> 'set' -> ().
            | 
            modifiers: modifiers copyRemoveAll.
              shiftIsDown ifTrue: [modifiers add: keyCaps oddballs shift  ].
               metaIsDown ifTrue: [modifiers add: keyCaps oddballs meta   ].
            commandIsDown ifTrue: [modifiers add: keyCaps oddballs command].
            controlIsDown ifTrue: [modifiers add: keyCaps oddballs control].
             optionIsDown ifTrue: [modifiers add: keyCaps oddballs option ].
            modifiers).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseDown = ( |
            | 
                leftMouseDown   || [middleMouseDown   || [rightMouseDown
            || [leftDoubleClick || [middleDoubleClick || rightDoubleClick]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMotion = ( |
            | 'mouseMotion' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseUp = ( |
            | leftMouseUp || [middleMouseUp] || [rightMouseUp]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         numLockIsDown = ( |
            | 0 != (state && numLockMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         optionIsDown = ( |
            | 0 != (state && optionMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: default state masks\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         optionMask = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         rightDoubleClick = ( |
            | 'rightDoubleClick' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         rightIsDown = ( |
            | 0 != (state && rightMouseMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseDown = ( |
            | 'rightMouseDown' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseUp = ( |
            | 'rightMouseUp' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         sendMessageToHandleKeyboardEventTo: aKeystrokeHandler = ( |
            | 
            keyCapCombosPressed do: [|:combo. aChar|
              aKeystrokeHandler handle: combo IfCannot: [
                self  "You are not Eymorg, you are not Morg--what are you?"
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: private'
        
         setFrom: platformEvt LastCursor: lastCursor = ( |
            | 
            "default values"
            timeStamp:   time current.
            type:        'ignore'.
            cursorPoint: lastCursor.
            keycode:     0.
            keystrokes:  ''.
            state:       0.
            bounds:      rectangle.
            platformEvt setUI2Event: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftIsDown = ( |
            | 0 != (state && shiftMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: stateQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftLockIsDown = ( |
            | 0 != (state && shiftLockMask)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | type, ' at ', cursorPoint printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedInX = ( |
            | 'wheelMovedInX' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         wheelMovedInY = ( |
            | 'wheelMovedInY' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         windowDelete = ( |
            | 'windowDelete' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         windowEnter = ( |
            | 
            'windowEnter' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         windowEvent = ( |
            | 
            windowEnter  || [
            windowLeave  || [
            windowExpose || [
            windowResize || [
            windowDelete    ]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         windowExpose = ( |
            | 'windowExpose' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         windowLeave = ( |
            | 
            'windowLeave' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: eventTypeQueries\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         windowResize = ( |
            | 'windowResize' = type).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromButtonPress: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromButtonRelease: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromClientMessage: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromConfigure: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromEnter: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xExposeEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromExpose: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromKeyPress: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromKeyRelease: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromLeave: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( | {
         'Category: ui2 event\x7fModuleInfo: Module: ui2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         setUI2Event: ui2Evt = ( |
            | 
            ui2Evt setFromMotionNotify: self).
        } | ) 



 '-- Side effects'

 globals modules ui2Event postFileIn
