 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals cursor.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits cursor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'cursor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot'
        
         state <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot'
        
         cursor = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'cursor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules cursor.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         anyButtonDown = ( |
            | 
            (state && xlib events xButtonEvent anyButtonMask) != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: keyQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         controlKeyDown = ( |
            | 
            (state && xlib events xInputEvent controlMask) != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         getInfo: event = ( |
            | 
            event hasInputStateInfo ifTrue: [state:    event newState].
            event hasLocationInfo   ifTrue: [location: event x @ event y]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonDown = ( |
            | 
            (state && xlib events xButtonEvent button1Mask) != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         leftButtonUp = ( |
            | leftButtonDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: keyQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         metaKeyDown = ( |
            | (state && xlib events xInputEvent mod1Mask) != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDown = ( |
            | 
            (state && xlib events xButtonEvent button2Mask) != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonUp = ( |
            | middleButtonDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         moveTo: pt = ( |
            | 
            window moveCursorTo: pt.
            location: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         noButtonDown = ( |
            | anyButtonDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         queuedButtonUp = ( |
            | 
             (window handler queueIncludes: 'leftButtonUpAt:Event:') ||
            [(window handler queueIncludes: 'middleButtonUpAt:Event:') ||
             [window handler queueIncludes: 'rightButtonUpAt:Event:']]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
            (state && xlib events xButtonEvent button3Mask) != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: buttonQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonUp = ( |
            | rightButtonDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: keyQuery\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftKeyDown = ( |
            | (state && xlib events xInputEvent shiftMask) != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         until: untilBlock Do: doBlock = ( |
            | 
            while: [ untilBlock value not ] Do: doBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'cursor' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: cursor InitialContents: FollowSlot\x7fVisibility: public'
        
         while: whileBlock Do: doBlock = ( |
            | 
            window handler processMotionEvents: doBlock While: whileBlock).
        } | ) 



 '-- Side effects'

 globals modules cursor postFileIn
