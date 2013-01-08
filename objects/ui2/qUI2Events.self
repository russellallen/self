 '$Revision: 30.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot'
        
         qUI2Events = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules qUI2Events.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'qUI2Events' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> () From: ( | {
         'Comment: Supports platform independent usage of events
combined with platform specific initialization:
Native MacOS events are used for initialization,
but the resulting ui2Event is used in a platform 
independent manner (as a \"Self/ui2\" event).\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Event = bootstrap define: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'ui2Event' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractUI2Event copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'ui2Event' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartzGlobals ui2Event.

CopyDowns:
globals abstractUI2Event. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Events\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2QuartzEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( |
             {} = 'Comment: A ui2MacEvent is a general input event. Variations include mouse button
     transitions, mouse movements, and keyboard key transitions.  It
     is initialized in a MacOS specific way but used in a portable way.
     Note that \"portable\" in this case means that all platforms have 
     been coerced to look like X Windows..\x7fModuleInfo: Creator: traits ui2QuartzEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartzGlobals' -> 'ui2Event' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: event location\x7fComment: (see isKeyEvent)\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         adjustForCanvas: aWindowCanvas = ( |
            | 
            "for windowResize, window was already resized by platformWindow code"
            "Just need to run it through Self to resize other things"
            "Someday, should cache the offset, update when window moves"
            "Mac closes window first"

            aWindowCanvas isOpen ifFalse: [^ self].

            cursorPoint: aWindowCanvas platformWindow globalToLocal: cursorPoint. 
            resend.adjustForCanvas: aWindowCanvas.

            type: case if: [windowExpose not] Then: [type]
                       If: [aWindowCanvas hasSizeChanged] Then: [
                           bounds: aWindowCanvas innerPosition ## aWindowCanvas size. 
                           'windowResize']
                       Else: [ "expose event without size change"
                           bounds: (0@0) ## aWindowCanvas size. 
                           type]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMaskCompatibility\x7fComment: This mask selects for a bit whose underlying 
concept is foreign to MacOS; it is mapped to
a Mac relevant mask for portability.\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         altGraphicMask = ( |
            | 
            altMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fComment: This mask selects for a bit whose underlying 
concept is foreign to MacOS; it is mapped to
a Mac relevant mask for portability.\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         anyMouseMask = ( |
            | 
            quartz event modifierMasks anyButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         capsLockMask = ( |
            | 
            quartz event modifierMasks capsLock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         commandMask = ( |
            | 
            quartz event modifierMasks command).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         controlMask = ( |
            | 
            quartz event modifierMasks control).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: conversion\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         doesPlatformReportDoubleClicks = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: time stamps\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToUseMyTimeStampForMenus = ( |
            | 
            "single machine, so event time compares to popUpTime"
            "And slow implementation, so need to use event time"
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: private'
        
         keyCapForCharacter: c = ( |
            | 
            "The arrow keys (on a Mac, anyway):"
            c asByte =  28  ifTrue: [ ^ keyCaps arrows left ].
            c asByte =  29  ifTrue: [ ^ keyCaps arrows right].
            c asByte =  30  ifTrue: [ ^ keyCaps arrows up   ].
            c asByte =  31  ifTrue: [ ^ keyCaps arrows down ].

            ^ resend.keyCapForCharacter: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseMask = ( |
            | 
            quartz event modifierMasks leftButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseMask = ( |
            | 
            quartz event modifierMasks middleButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         numLockMask = ( |
            | 
            quartz event modifierMasks numLock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         optionMask = ( |
            | 
            quartz event modifierMasks option).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'ModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractUI2Event' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fComment: This mask selects for a bit whose underlying 
concept is foreign to MacOS; it is mapped to
a Mac relevant mask for portability.\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseMask = ( |
            | 
            quartz event modifierMasks rightButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMaskCompatibility\x7fComment: This mask selects for a bit whose underlying 
concept is foreign to MacOS; it is mapped to
a Mac relevant mask for portability.\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftLockMask = ( |
            | capsLockMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftMask = ( |
            | 
            quartz event modifierMasks shift).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2QuartzEvent' -> () From: ( | {
         'Category: stateMaskCompatibility\x7fComment: These masks correspond to 
concepts which are foreign
to the Mac; the implementation
maps them to native Mac methods.\x7fModuleInfo: Module: qUI2Events InitialContents: FollowSlot'
        
         stateMaskCompatibilityComment = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 



 '-- Side effects'

 globals modules qUI2Events postFileIn
