 '30.17.0'
 '
Copyright 1992-2026 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xlib = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xlib.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         myComment <- 'Philosophy of the Xlib interface: the primitives (and their wrappers) conform
             to the standard Xlib calls as close as possible.  These Self objects put a
             very thin layer on that, mainly to make access to the Xlib functions more
             object-oriented and to simplify some Xlib functions by supplying defaults.
             Other objects in the system should be built on top of this layer to provide
             general, non Xlib specific functionality.  The idea is to keep the lowest
             layers close to Xlib so that they can be understood just by reading an Xlib
             reference manual.\"


            \"IMPORTANT: more slots are added to these objects in xlib.wrappers.self'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            traits xlib events xKeyEvent initializeKbdModifierMasks.
            xlib display initEventProtos.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (\'30.17.0\')\x7fVisibility: public'
        
         revision <- '30.17.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- bootstrap setObjectAnnotationOf: ( 'xDrawable
xlib_wrappers
' copyMutable) From: ( |
             {} = 'ModuleInfo: Creator: globals modules xlib subpartNames.

CopyDowns:
globals byteVector. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: graphical interface\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xlib = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'Category: debugging\x7fComment: Make sure X errors
happen right away.\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         areXErrorsReportedImmediately = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         atom = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'atom' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'atom' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib atom.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         atom = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'atom' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib atom.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'atom' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         colormap = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'colormap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib colormap.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         colormap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib colormap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'cursor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib cursor.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         display = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib display.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'cursor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib cursor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'cursor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         file.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( | {
         'Comment: xlib graphicsContext\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gc.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'xlib display prototype'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         originalName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         display = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( |
             {} = 'Comment: --- display --- Current design for X display object assumes all work is done on default screen.
     This probably should be changed in the future to allow use of any screen.\x7fModuleInfo: Creator: traits xlib display.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         pending <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> () From: ( | {
         'Comment: xlib screen\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         screen.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'drawable' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractDrawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'drawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib drawable.

CopyDowns:
globals abstractDrawable. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawable = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib drawable.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         events = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         events = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xAnyEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xAnyEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xAnyEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xAnyEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xAnyEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xAnyEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xAnyEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xAnyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xAnyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xButtonEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xButtonEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xButtonEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xButtonEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         button1 = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         button2 = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         button3 = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         button4 = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'Category: details\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         button5 = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonName = ( |
            | buttonName: button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonName: b = ( |
            | 
            b = button1 ifTrue: [ ^ 'left' ].
            b = button2 ifTrue: [ ^ 'middle' ].
            b = button3 ifTrue: [ ^ 'right' ].
            error: 'unknown button').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInputStateInfo = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         hasLocationInfo = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         newState = ( |
            | newStateFrom: state Changing: button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         newStateFrom: s Changing: b = ( |
            | 
            b = button1 ifTrue: [ ^ s ^^ button1Mask ].
            b = button2 ifTrue: [ ^ s ^^ button2Mask ].
            b = button3 ifTrue: [ ^ s ^^ button3Mask ].
            error: 'unknown button').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xInputEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xInputEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonPress = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonRelease = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         circulateNotify = 26.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         circulateRequest = 27.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         clientMessage = 33.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         colormapNotify = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         configureNotify = 22.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         configureRequest = 23.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createNotify = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            basicDelete. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         destroyNotify = 17.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         enterNotify = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Comment: Iterate \'blk\' over all the event types supported.
Each time \'blk\' is invoked on a pair: 
the event object and its type (an integer).\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         eventTypesDo: blk = ( |
             ee.
            | 
            ee: xlib events.
            blk value: ee xButtonPressedEvent     With: buttonPress.
            blk value: ee xButtonReleasedEvent    With: buttonRelease.
            blk value: ee xClientMessageEvent     With: clientMessage.
            blk value: ee xColormapEvent          With: colormapNotify.
            blk value: ee xConfigureEvent         With: configureNotify.
            blk value: ee xEnterWindowEvent       With: enterNotify.
            blk value: ee xExposeEvent            With: expose.
            blk value: ee xFocusInEvent           With: focusIn. 
            blk value: ee xFocusOutEvent          With: focusOut.
            blk value: ee xGraphicsExposeEvent    With: graphicsExpose.
            blk value: ee xKeyPressedEvent        With: keyPress.
            blk value: ee xKeyReleasedEvent       With: keyRelease.
            blk value: ee xLeaveWindowEvent       With: leaveNotify.
            blk value: ee xMapEvent               With: mapNotify.
            blk value: ee xMappingEvent           With: mappingNotify.
            blk value: ee xMotionEvent            With: motionNotify.
            blk value: ee xNoExposeEvent          With: noExpose.
            blk value: ee xReparentEvent          With: reparentNotify.
            blk value: ee xUnmapEvent             With: unmapNotify.
            blk value: ee xVisibilityEvent        With: visibilityNotify.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         expose = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         focusIn = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         focusOut = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         graphicsExpose = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gravityNotify = 24.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInputStateInfo = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         hasLocationInfo = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         isMotionEvent = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         keyPress = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         keyRelease = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         keymapNotify = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         leaveNotify = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mapNotify = 19.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mapRequest = 20.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mappingNotify = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         motionNotify = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         noExpose = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         propertyNotify = 28.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         reparentNotify = 21.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRequest = 25.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionClear = 29.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionNotify = 31.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionRequest = 30.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Comment: Returns the time of the event\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         time = ( |
             raw.
            | 
            raw: rawTime.
            globals time copyDay: (raw at: 0) Msec: (raw at: 1)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'generic'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         unmapNotify = 18.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Category: types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         visibilityNotify = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = ( |
            | 'xlib-xEvent-', typeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'Comment: Many events have an associated window. However, if an
event does not, we don\'t want \'evt window\' to return
the window object found in globals! So here we 
implement this method to always fail. Ole Agesen, July 1996.\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         windowIfFail: errBlk = ( |
            | errBlk value: 'I have no window').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         anyButtonMask = 7936.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button1Mask = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button2Mask = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button3Mask = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button4Mask = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button5Mask = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         controlMask = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lockMask = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mod1Mask = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mod2Mask = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mod3Mask = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mod4Mask = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         mod5Mask = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         optionMask = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftMask = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xButtonPressedEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xButtonEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xButtonPressedEvent.

CopyDowns:
globals xlib events xButtonEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xButtonPressedEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xButtonPressedEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xButtonReleasedEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xButtonEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xButtonReleasedEvent.

CopyDowns:
globals xlib events xButtonEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xButtonReleasedEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xButtonReleasedEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xClientMessageEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xClientMessageEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xClientMessageEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xClientMessageEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xColormapEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xColormapEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xColormapEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xColormapEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xColormapEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xConfigureEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xConfigureEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xConfigureEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xConfigureEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xCrossingEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xCrossingEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xCrossingEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xCrossingEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xEnterWindowEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xCrossingEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xEnterWindowEvent.

CopyDowns:
globals xlib events xCrossingEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xEnterWindowEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xEnterWindowEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xExposeEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xExposeEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xExposeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xExposeEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xExposeEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xExposeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xExposeEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xExposeEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFocusChangeEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xFocusChangeEvent.

CopyDowns:
globals xlib events xEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFocusChangeEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xFocusChangeEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFocusInEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusInEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xFocusChangeEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusInEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xFocusInEvent.

CopyDowns:
globals xlib events xFocusChangeEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFocusInEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusInEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xFocusInEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusInEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusInEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFocusOutEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusOutEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xFocusChangeEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusOutEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xFocusOutEvent.

CopyDowns:
globals xlib events xFocusChangeEvent. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFocusOutEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusOutEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xFocusOutEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xFocusOutEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusOutEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xGraphicsExposeEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xGraphicsExposeEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xGraphicsExposeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xGraphicsExposeEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xGraphicsExposeEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xGraphicsExposeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xGraphicsExposeEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xGraphicsExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xGraphicsExposeEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xKeyEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xKeyEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xKeyEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xKeyEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInputStateInfo = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeKbdModifierMasks = ( |
            | ((((((((kbdModifierMasks
            at: 106 Put: traits xlib events xInputEvent shiftMask   "shift_left")
            at: 117 Put: traits xlib events xInputEvent shiftMask   "shift_right")
            at: 126 Put: traits xlib events xInputEvent lockMask    "caps_lock")
            at: 83  Put: traits xlib events xInputEvent controlMask "control")
            at: 127 Put: traits xlib events xInputEvent mod1Mask    "meta_left")
            at: 129 Put: traits xlib events xInputEvent mod1Mask    "meta_right")
            at: 20  Put: traits xlib events xInputEvent mod2Mask    "num_lock")
            at: 105 Put: traits xlib events xInputEvent mod3Mask    "command_mask")
            at: 26  Put: traits xlib events xInputEvent mod4Mask    "alt").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Comment: this is specific to Sun Type 4 keyboards
     munged slightly for fileOuts\x7fModuleInfo: Module: xlib InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         kbdModifierMasks = dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         lookupKeySym = ( |
             v.
            | 
            v: vector copySize: 1.
            lookupStringKeySymVector: v.
            v first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupString = ( |
            | 
            lookupStringKeySymVector: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: lookup\x7fComment: Same as \'lookupString\' but in addition
evaluate \'ksBlk\' on the keysym.\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupStringKeySym: ksBlk = ( |
             res <- ''.
             v.
            | 
            v: (vector copySize: 1).
            res: (lookupStringKeySymVector: v).
            ksBlk value: (v at: 0).
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: lookup\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         lookupStringKeySymVector: ksv = ( |
             bv.
             n <- 0.
            | 
            bv: ('' copySize: 20).
            n: (xLookupStringReturn: bv KeySymReturn: ksv).
            bv copySize: n).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         newState = ( |
            | newStateFrom: state Changing: keycode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         newStateFrom: s Changing: kc = ( |
            | 
            s ^^ (kbdModifierMasks at: kc IfAbsent: 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Alt_L = 65513.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Alt_R = 65514.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_BackSpace = 65288.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Control_L = 65507.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Control_R = 65508.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Delete = 65535.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Down = 65364.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_End = 65367.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Escape = 65307.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F1 = 65470.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F10 = 65479.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F11 = 65480.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F12 = 65481.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F2 = 65471.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F27 = 65496.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F29 = 65498.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F3 = 65472.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F35 = 65504.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F4 = 65473.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F5 = 65474.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F6 = 65475.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F7 = 65476.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F8 = 65477.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_F9 = 65478.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Home = 65360.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_0 = 65456.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_1 = 65457.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_2 = 65458.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_3 = 65459.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_4 = 65460.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_5 = 65461.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_6 = 65462.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_7 = 65463.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_8 = 65464.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_9 = 65465.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_Add = 65451.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_Decimal = 65454.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_Delete = 65439.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_Divide = 65455.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_KP_Down = 65433.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_Enter = 65421.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_KP_Left = 65430.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_Multiply = 65450.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_KP_Right = 65432.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_KP_Subtract = 65453.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_KP_Up = 65431.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Left = 65361.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Linefeed = 65290.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Page_Down = 65366.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Page_Up = 65365.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_R13 = 65502.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Return = 65293.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Right = 65363.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Shift_L = 65505.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Shift_R = 65506.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Super_L = 65515.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         xk_Super_R = 65516.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Tab = 65289.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> () From: ( | {
         'Category: kb constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xk_Up = 65362.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xKeyPressedEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xKeyEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xKeyPressedEvent.

CopyDowns:
globals xlib events xKeyEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xKeyPressedEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xKeyPressedEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xKeyReleasedEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xKeyEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xKeyReleasedEvent.

CopyDowns:
globals xlib events xKeyEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xKeyReleasedEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xKeyReleasedEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xLeaveWindowEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib events xCrossingEvent deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xLeaveWindowEvent.

CopyDowns:
globals xlib events xCrossingEvent. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xLeaveWindowEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xLeaveWindowEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xMapEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMapEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMapEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xMapEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xMapEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMapEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xMapEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMapEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xMappingEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMappingEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMappingEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xMappingEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xMappingEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMappingEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xMappingEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMappingEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMappingEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xMotionEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xMotionEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xMotionEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xMotionEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xNoExposeEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xNoExposeEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xNoExposeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xNoExposeEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xNoExposeEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xNoExposeEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xNoExposeEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xNoExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xNoExposeEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xReparentEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xReparentEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xReparentEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xReparentEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xReparentEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xReparentEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xReparentEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xReparentEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xReparentEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xUnmapEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xUnmapEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xUnmapEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xUnmapEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xUnmapEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xUnmapEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xUnmapEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xUnmapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xUnmapEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xVisibilityEvent = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib events xVisibilityEvent.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xVisibilityEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib events xVisibilityEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         font = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'font' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'font' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib font.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         font = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'font' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib font.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'font' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         graphicsContext = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'graphicsContext' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'graphicsContext' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib graphicsContext.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         graphicsContext = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib graphicsContext.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xGCValues = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xGCValues' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xGCValues' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xGCValues.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         xgcv <- bootstrap stub -> 'globals' -> 'xlib' -> 'xGCValues' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustRectangle: r Width: borderWidth = ( |
            | 
            "Note: There appears to be an exception to the general rule
             for drawing rectangles when the borderWidth equals one.
             The following code was determined by trial-and-error with
             borderWidths of 1 to 10 pixels under X/NeWS on Sun OS."

            "It applies to X and Quartz, but not to QuickDraw"

            1 = borderWidth
                ifTrue: [ r                               ]   "exceptional case"
                 False: [ r translateBy: borderWidth /- 2 ].  "normal case").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         bestStippleSizeNear: sz = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 h.
                }  {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 w.
                } 
            | 
            w: display xQueryBestStippleWidth: self
                                        Width: sz x
                                       Height: sz y.
            h: display xQueryBestStippleHeight: self
                                         Width: sz x
                                        Height: sz y.
            w @ h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         bestTileSizeNear: sz = ( |
             h.
             w.
            | 
            w: display xQueryBestTileWidth: self
                                        Width: sz x
                                       Height: sz y.
            h: display xQueryBestTileHeight: self
                                         Width: sz x
                                        Height: sz y.
            w @ h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: polygonShapes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         complex = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: polygonShapes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         convex = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: coordinateModes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         coordModeOrigin = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: coordinateModes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         coordModePrevious = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyArea: rect To: dest At: pt GC: gc = ( |
            | 
            display xCopyAreaSrc: self
                            Dest: dest
                              GC: gc
                            SrcX: rect left
                            SrcY: rect top
                           Width: rect width
                          Height: rect height
                           DestX: pt x
                           DestY: pt y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawArcWithin: rect From: startAngle Spanning: spanAngle GC: gc = ( |
            | 
            display xDrawArc: self
                          GC: gc
                           X: rect left
                           Y: rect top
                       Width: rect width
                      Height: rect height
                  StartAngle: (mapUI2Angle: startAngle)
                    EndAngle: mapUI2Angle: spanAngle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLine: pt1 To: pt2 GC: gc = ( |
            | 
            display xDrawLine: self GC: gc X1: pt1 x Y1: pt1 y
                                           X2: pt2 x Y2: pt2 y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawLines: ptlist GC: gc = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 xv.
                }  {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 yv.
                } 
            | 
            xv: vector copySize: ptlist size.
            yv: vector copySize: ptlist size.
            ptlist do: [ | :p |
                xv at: i Put: p x asSmallInteger.
                yv at: i Put: p y asSmallInteger.
                i: i + 1. ].
            display xDrawLines: self
                            GC: gc
                            Xs: xv
                            Ys: yv
                          Mode: coordModeOrigin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawPoint: pt GC: gc = ( |
            | 
            display xDrawPoint: self GC: gc X: pt x Y: pt y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawRectangle: rect GC: gc = ( |
            | 
            display xDrawRectangle: self
                                GC: gc
                                 X: rect left
                                 Y: rect top
                             Width: rect width
                            Height: rect height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         drawString: str At: pt GC: gc = ( |
            | 
            display xDrawString: self GC: gc X: pt x Y: pt y String: str
              IfFail: [|:e| 
                ('nullCharError' isPrefixOf: e)  ifTrue: [
                  ^ drawString: (str asList copyFilteredBy: [|:c| c != '\0']) asString
                            At: pt
                            GC: gc
                ].
                raiseError value: 'drawString:At:GC: failed: ', e
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillArcWithin: rect From: startAngle Spanning: spanAngle GC: gc = ( |
            | 
            display xFillArc: self
                          GC: gc
                           X: rect left
                           Y: rect top
                       Width: rect width
                      Height: rect height
                  StartAngle: (mapUI2Angle: startAngle)
                    EndAngle:  mapUI2Angle: spanAngle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygon: ptlist GC: gc = ( |
             i <- 0.
             xv.
             yv.
            | 
            xv: vector copySize: ptlist size.
            yv: vector copySize: ptlist size.
            ptlist do: [ | :p |
                xv at: i Put: p x asSmallInteger.
                yv at: i Put: p y asSmallInteger.
                i: i + 1. ].
            fillPolygonIntegerXs: xv Ys: yv GC: gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fComment: a lower level polygon routine that expects integers\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillPolygonIntegerXs: xs Ys: ys GC: gc = ( |
            | 
            display xFillPolygon: self
                              GC: gc
                              Xs: xs asVector
                              Ys: ys asVector
                           Shape: complex
                            Mode: coordModeOrigin.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRectangle: rect GC: gc = ( |
            | 
            display xFillRectangle: self
                                GC: gc
                                 X: rect left
                                 Y: rect top
                             Width: rect width
                            Height: rect height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | display gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gcIfFail: fb = ( |
            | gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         mapUI2Angle: a = ( |
            | 
            "degrees ccw from right -> degrees cw from right * 64"
            a * 64).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: polygonShapes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         nonconvex = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractDrawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: querying\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         pixelValueAt: pt = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 im.
                }  {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 pix.
                } 
            | 
            im: display xGetImage: self
                              X: pt x
                              Y: pt y
                          Width: 1
                         Height: 1
                      PlaneMask: 16rffff
                         Format: zPixmap.
            pix: im xGetPixelX: 0 Y: 0.
            im delete.
            pix).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         withAntialiasing: bool Do: blk = ( |
            | blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: imageFormats\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         xyBitmap = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: imageFormats\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         xyPixmap = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> () From: ( | {
         'Category: imageFormats\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         zPixmap = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmap = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib drawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib pixmap.

CopyDowns:
globals xlib drawable. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         depth <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         pixmap = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'pixmap' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib pixmap.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'pixmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: publicReadPrivateWrite'
        
         size <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         region = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'region' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'region' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib region.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         region = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'region' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib region.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'region' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'region' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         screen = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'screen' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'screen' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib screen.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         screen = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib screen.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         rootWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         visual = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'visual' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'visual' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib visual.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         visual = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'visual' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib visual.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'visual' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'visual' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals xlib drawable deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib window.

CopyDowns:
globals xlib drawable. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> () From: ( | {
         'Comment: Set to true/false to enable/disable
automatic xflush after manipulation of
window.\x7fModuleInfo: Module: xlib InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         autoFlush <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         depth <- 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         eventMask <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib window.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (xlib atom)\x7fVisibility: public'
        
         wmDeleteWindow <- bootstrap stub -> 'globals' -> 'xlib' -> 'atom' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (xlib atom)\x7fVisibility: public'
        
         wmProtocols <- bootstrap stub -> 'globals' -> 'xlib' -> 'atom' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xCharStruct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xCharStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xCharStruct.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xCharStruct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xCharStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xCharStruct.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xCharStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xCharStruct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xColor = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xColor' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xColor.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xColor = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xColor.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xColor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFontStruct = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xFontStruct' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xFontStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xFontStruct.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xFontStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xFontStruct = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xFontStruct' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xFontStruct.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xFontStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xFontStruct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xGCValues = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xGCValues' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xGCValues.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xGCValues' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xGCValues' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xImage = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xImage' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xImage' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xImage.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xImage = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xImage' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xImage.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xImage' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xSetWindowAttributes = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xSetWindowAttributes' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xSetWindowAttributes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xSetWindowAttributes.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xSetWindowAttributes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xSetWindowAttributes' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xSetWindowAttributes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xSetWindowAttributes' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xSetWindowAttributes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xSizeHints = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xSizeHints' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xSizeHints' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xSizeHints.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xSizeHints = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xSizeHints.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xTextProperty = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xTextProperty' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xTextProperty' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xTextProperty.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xTextProperty = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xTextProperty' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xTextProperty.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xTextProperty' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xTextProperty' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xVisualInfo = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xVisualInfo' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xVisualInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xVisualInfo.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xVisualInfo = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xVisualInfo' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xVisualInfo.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xVisualInfo' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xVisualInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xWMHints = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xWMHints' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xWMHints' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xWMHints.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xWMHints = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xWMHints.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'Comment: Note: different from xSetWindowAttributes
(as is the case in X11).\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xWindowAttributes = bootstrap define: bootstrap stub -> 'globals' -> 'xlib' -> 'xWindowAttributes' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals proxy deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'xWindowAttributes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib xWindowAttributes.

CopyDowns:
globals proxy. deadCopy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xWindowAttributes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'xWindowAttributes' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib xWindowAttributes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'xWindowAttributes' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'xWindowAttributes' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: graphics\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xlib = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'atom' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-atom'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         allocColor: color = ( |
            | 
            allocColor: color IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         allocColor: color IfFail: errBlk = ( |
            | 
            window display xAllocColorInColormap: self Color: color IfFail: errBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         allocColorCellIfFail: fblock = ( |
            | 
            (allocColorCells: 1 IfFail: fblock) first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         allocColorCells: n IfFail: fblock = ( |
             pixelVec.
            | 
            pixelVec: vector copySize: n.
            window display xAllocColorCellsInColormap: self
                                               Contig: false
                                     PlaneMasksReturn: (vector copySize: 0)
                                         PixelsReturn: pixelVec
                                               IfFail: [|:e| ^ fblock value: e].
            pixelVec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win = ( |
            | 
            ( win display xCreateColormapWindow: win 
                                         Visual: win screen defaultVisual
                                       Allocate: true
            ) window: win).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win Depth: d = ( |
            | 
            [todo ui1 dmu experimental].
            win "screen?" depth = d ifFalse: [error: 'depth mismatch'].
            createFor: win).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         createFor: win WithVisual: vis AllocateColors: yesOrNo = ( |
            | 
            ( win display xCreateColormapWindow: win
                                         Visual: vis
                                       Allocate: yesOrNo
            ) window: win).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | window display xFreeColormap: self. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         freeColors: pixelVec = ( |
            | 
            window display xFreeColorCellsInColormap: self
                                              Pixels: pixelVec
                                              Planes: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         install = ( |
            | installWarn: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         installAndSync = ( |
            | 
            installWarn: false.
            window display syncDiscardingIf: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         installImmediately = ( |
            | [todo ui1 dmu experimental]. install).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         installWarn: warn = ( |
            | 
            warn &&
            [preferences fixMultiprocessorColormapBugButSlowDownRemoteUI]
              ifTrue: [ warning: 'X colormap install is being called without a sync--currently triggers colormap bug on multiprocessor machines' ].
            window display xSetWindow: window Colormap: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         query: colors = ( |
            | 
            window display xQueryColorsInColormap: self Colors: colors asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         queryOne: color = ( |
            | 
            window display xQueryColorInColormap: self Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         store: colors = ( |
            | 
            window display xStoreColorsInColormap: self Colors: colors asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         storeOne: color = ( |
            | 
            window display xStoreColorInColormap: self Color: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'colormap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-colormap'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createInvisibleForWindow: win = ( | {
                 'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (byteVector copySize: 1)'
                
                 bv = byteVector copySize: 1.
                }  {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 color.
                }  {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 curse.
                }  {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 pix.
                } 
            | 
            pix: xlib pixmap createBitmapForSameScreenAs: win
                                                FromData: bv
                                                    Size: 1@1.
            color: (((xlib xColor new) red: 0) green: 0) blue: 0.
            curse: createOnDisplay: win display
                             Shape: pix
                              Mask: pix
                                FG: color
                                BG: color 
                           Hotspot: 0@0.
            color delete.
            pix delete.
            curse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createOnDisplay: disp Shape: shape Mask: mask FG: fg BG: bg Hotspot: hotspot = ( |
            | 
            ( disp xCreatePixmapCursorSource: shape
                                        Mask: mask
                             ForegroundColor: fg 
                             BackgroundColor: bg 
                                           X: hotspot x
                                           Y: hotspot y
            ) display: disp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         delete = ( |
            | display xFreeCursor: self. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'cursor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-cursor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         basicClose = ( |
            | 
            basicCloseIfFail: [ | :e |
              ^ error: 'X display close failed: ', e ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         basicCloseIfFail: fb = ( |
            | 
            _XCloseDisplayIfFail: [ | :e |
              ('deadProxyError' isPrefixOf: e)
                ifFalse: [ ^ fb value: e ]
                   True: [ (reviveIfFail: [ | :e | fb value: e ])
                           _XCloseDisplayIfFail: fb ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         basicOpen: dispName IfFail: fb = ( |
            | 
            dispName _XOpenDisplayResultProxy: xlib display deadCopy
             IfFail: [ | :e |
               ('badTypeError' isPrefixOf: e)
                 ifFalse: [ ^ fb value: e ]
                    True: [ dispName asVMByteVector
                            _XOpenDisplayResultProxy: xlib display deadCopy
                                              IfFail: fb ].
             ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: eventHandling\x7fComment: Blocking. Should not be called, except by the non-blocking
event methods defined in this object.\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         blockingNextEventPeek: peekBool = ( |
            | xNextEventPeek: peekBool Protos: eventProtos).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fComment: Return canonical name of d (hostname:n.m).
hostname can be empty.  hostnames \'unix\' and \'local\' are mapped
to empty.
 -- Mario, 4/13/95\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         canonicalDisplayNameOf: d = ( |
             colon.
             hostname.
             nm.
             screen.
            | 
            "If we use the DISPLAY variable, assume it knows what its doing - rca 7/18"
            d isEmpty ifTrue: [|dv|
              dv: os environmentAt: 'DISPLAY' IfFail: ''.
              dv isEmpty ifFalse: [^ dv]].
            nm:         d isEmpty ifTrue: [os environmentAt: 'DISPLAY' IfFail: ''] False: d.
            colon:     nm keyOf: ':' IfAbsent: [^nm]. "this isn't a valid name in any case"
            hostname:  nm copyFrom: nm firstKey UpTo: colon.
            (hostname = 'unix') || [hostname = 'local'] || [hostname = ''] ifTrue: [
              hostname: os nodename
            ].
            screen: (nm copyFrom: colon).
            (screen includes: '.') ifFalse: [screen: screen, '.0'].
            hostname, screen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | basicClose. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultGC = ( |
            | screen defaultGCOfScreen initOnDisplay: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching visualClasses\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         directColor = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: eventHandling\x7fModuleInfo: Module: xlib InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         eventProtos <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: eventHandling\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsPending = ( |
            | xPending).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: clipboard\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         fetchFromClipboard = ( |
            | xFetchBytes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: clipboard\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         fetchFromClipboardIfFail: fb = ( |
            | 
            xFetchBytesIfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: synchronization\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         flush = ( |
            | xFlush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching visualClasses\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         grayScale = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         grayScale4Visual = ( |
            | 
            visualOfClass: grayScale AndDepth: 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: eventHandling\x7fComment: Static initialization. Call once, at file-in time.\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         initEventProtos = ( |
             ep.
             n <- 0.
            | 
            xlib events xEvent eventTypesDo: [|:e. :type|
                0 > type ifTrue: [
                    error: 'negative event type not supported: ', type printString.
                ].
                n: (n max: type).
            ].
            ep: (vector copySize: 1 + n).
            xlib events xEvent eventTypesDo: [|:e. :type|
                (ep at: type) ifNotNil: [
                    error: 'two or more events with same type: ', type printString.
                ].
                ep at: type Put: e.
            ].
            "Now set remaining entries to the generic event prototype."
            ep mapBy: [|:e| e ifNil: xlib events xEvent].
            eventProtos: ep.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize: dispName = ( |
            | 
            screen: defaultScreenOfDisplay initialize: self.
            gc: xlib graphicsContext defaultGCFor: self.
            originalName: dispName.
            name: canonicalDisplayNameOf: dispName.
            file: os_file copyBlockingFd: connectionNumber Name: name.
            xlib areXErrorsReportedImmediately ifTrue: [
              synchronize: true.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: atoms\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         internAtom: name = ( |
            | xInternAtom: name OnlyIfExists: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         isGrayScale4 = ( |
            | isVisualClass: grayScale       Depth: 4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         isMonochrome = ( |
            | isVisualClass: staticGray      Depth: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         isPseudoColor8 = ( |
            | isVisualClass: pseudoColor Depth: 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         isTrueColor = ( |
            | isVisualClass: trueColor Depth: 24).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         isVisualClass: class Depth: depth = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 vi.
                } 
            | 
            vi: matchVisualInfoToClass: class
                                 Depth: depth
                                IfFail: [ ^ false ].
            vi delete.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         loadFont: name = ( |
            | 
            loadFont: name
              IfFail: [ | :e | error: 'X font load failed: ', e ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: fonts\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         loadFont: name IfFail: fb = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 fs.
                } 
            | 
            fs: xLoadQueryFont: name IfFail: [ | :e | ^ fb value: e ].
            fs display: self.
            fs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         matchVisualInfoToClass: c Depth: d IfFail: fb = ( |
            | 
            screen ifNil: [^ fb value: 'no screen' ].

            xMatchVisualInfoScreen: screen number
                             Depth: d
                             Class: c
                            IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         monochromeVisual = ( |
            | 
            visualOfClass: staticGray AndDepth: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: eventHandling\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         nextEvent = ( |
            | 
            nonBlockingEventAction: [blockingNextEventPeek: false]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: eventHandling\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         nonBlockingEventAction: action = ( |
            | 
            [ 0 < pending  ifFalse: [ pending: eventsPending ].
              0 < pending  ifTrue:  [ pending: pending pred. ^ action value. ].
              file suspendForIO.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( |
            | open: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         open: dispName = ( |
            | 
            open: dispName IfFail: [ ^ error:
              'Could not open display \'', (xDisplayName: dispName), '\'' ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         open: dispName IfFail: fb = ( |
            | 
            (basicOpen: dispName IfFail: [ | :e | ^ fb value: e ])
             initialize: dispName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: eventHandling\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         peekEvent = ( |
            | 
            nonBlockingEventAction: [blockingNextEventPeek: true]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching visualClasses\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pseudoColor = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoColor8Visual = ( |
            | 
            visualOfClass: pseudoColor AndDepth: 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: connections\x7fComment: Return the server name of this display (ie hostname:n)
-- Mario, 4/13/95\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         serverName = ( |
             c.
            | 
            c: name keyOf: ':' IfAbsent: [^ os nodename].
            name
              copyFrom: name firstKey
                  UpTo: c + ((name copyFrom: c) keyOf: '.' IfAbsent: name size)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching visualClasses\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         staticColor = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching visualClasses\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         staticGray = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: clipboard\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         storeToClipboard: aString = ( |
            | xStoreBytes: aString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: clipboard\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         storeToClipboard: aString IfFail: fb = ( |
            | 
            xStoreBytes: aString IfFail: fb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: synchronization\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         syncDiscardingIf: discard = ( |
            | xSyncDiscardingIf: discard).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: synchronization\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         synchronize: onoff = ( |
            | xSynchronize: onoff).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: coordinates\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         translateCoordinatesResultProto = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> 'translateCoordinatesResultProto' -> () From: ( |
             {} = 'Comment: This object is the result of a call to 
xTranslateCoordinates.\x7fModuleInfo: Creator: traits xlib display translateCoordinatesResultProto.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> 'translateCoordinatesResultProto' -> () From: ( | {
         'Comment: Note: may be null window.
Compare against xlib window nullWindow to tell.\x7fModuleInfo: Module: xlib InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         childWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> 'translateCoordinatesResultProto' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         newX <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> 'translateCoordinatesResultProto' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (0)\x7fVisibility: public'
        
         newY <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> 'translateCoordinatesResultProto' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> 'translateCoordinatesResultProto' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: InitializeToExpression: (true)\x7fVisibility: public'
        
         sameScreen <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching visualClasses\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         trueColor = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         trueColorVisual = ( |
            | 
            visualOfClass: trueColor AndDepth: 24).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: visualMatching\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         visualOfClass: class AndDepth: depth = ( |
            | 
            (matchVisualInfoToClass: class
                              Depth: depth
                             IfFail: [ ^ false ].
            ) visual).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-display'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: coordinates\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xTranslateCoordinatesSrcWindow: srcW DstWindow: dstW SrcX: srcX SrcY: srcY = ( |
            | 
            xTranslateCoordinatesSrcWindow: srcW DstWindow: dstW SrcX: srcX SrcY: srcY IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'display' -> () From: ( | {
         'Category: coordinates\x7fComment: Translate coordinates from one window to another. Result is
an object with these slots:
   newX:         X coordinate in dest. window
   newY:         Y coordinate in dest. window
   sameScreen:   true iff dst and src window are on same screen
                 (if they aren\'t, dst X and dst Y are both 0)
   childWindow:  child window of dst window that contains
                 the coordinates; if no such child is mapped,
                 this entry is a null window.\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xTranslateCoordinatesSrcWindow: srcW DstWindow: dstW SrcX: srcX SrcY: srcY IfFail: errBlk = ( |
             res.
             v.
            | 
            res: translateCoordinatesResultProto copy.
            v: (vector copySize: 3).
            v at: 0 Put: srcX.
            v at: 1 Put: srcY.
            res childWindow: (xTranslateCoordinatesSrcWindow: srcW
                                                   DstWindow: dstW 
                                                 Coordinates: v
                                                      IfFail: [|:e| ^ errBlk value: e]).
            res newX:       (v at: 0).
            res newY:       (v at: 1).
            res sameScreen: (v at: 2).
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button1MotionMask = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button2MotionMask = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button3MotionMask = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button4MotionMask = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         button5MotionMask = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonMotionMask = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonPressMask = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonReleaseMask = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         colormapChangeMask = 8388608.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         enterWindowMask = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         exposureMask = 32768.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         focusChangeMask = 2097152.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         keyPressMask = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         keyReleaseMask = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         keymapStateMask = 16384.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         leaveWindowMask = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         noEventMask = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         ownerGrabButtonMask = 16777216.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         pointerMotionHintMask = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         pointerMotionMask = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         propertyChangeMask = 4194304.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: queueModes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         queuedAfterFlush = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: queueModes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         queuedAfterReading = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: queueModes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         queuedAlready = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRedirectMask = 262144.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         structureNotifyMask = 131072.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         substructureNotifyMask = 524288.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         substructureRedirectMask = 1048576.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'Category: masks\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         visibilityChangeMask = 65536.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-events'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xAnyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xAnyEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'otherEvent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonPressedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'buttonPress'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xButtonReleasedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'buttonRelease'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         isDeleteWindow = ( |
            | (message_type = xlib wmProtocols) &&
            [(atomAt: 0) = xlib wmDeleteWindow]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xClientMessageEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'clientMessage'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapInstalled = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         colormapUninstalled = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xColormapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'colormapNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xConfigureEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'configureNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEnterWindowEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'enterNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'expose'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusInEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusInEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'focusIn'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusOutEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusChangeEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xFocusOutEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'focusOut'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xGraphicsExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xGraphicsExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'graphicsexpose'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyPressedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'keyPress'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xKeyReleasedEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'keyRelease'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xCrossingEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xLeaveWindowEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'leaveNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'mapNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMappingEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMappingEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'mappingNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         hasLocationInfo = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         isMotionEvent = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         newState = ( |
            | state).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xInputEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xMotionEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'motionNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xNoExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xNoExposeEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'noexpose'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xReparentEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xReparentEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'reparentNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xUnmapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xUnmapEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'unmapNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = 'visibilityNotify'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         visibilityFullyObscured = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         visibilityPartiallyObscured = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'events' -> 'xVisibilityEvent' -> () From: ( | {
         'Category: states\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         visibilityUnobscured = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'font' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-font'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         background = ( |
            | getValues: gcBackground. xgcv background).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         background8Bit: cme = ( |
            | 
            [todo ui1 dmu experimental].
            background: cme index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         background: bg = ( |
            | display xSetGC: self Background: bg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         capButt = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         capNotLast = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         capProjecting = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         capRound = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: create and delete\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createForSameScreenAs: db = ( |
            | 
            createForSameScreenAs: db
                        ValueMask: 0
                           Values: xlib xGCValues new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: create and delete\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createForSameScreenAs: db ValueMask: mask Values: xgcValues = ( |
             gc.
            | 
            gc: db display xCreateGCDrawable: db
                                   ValueMask: mask
                                      Values: xgcValues.
            gc initOnDisplay: db display.
            gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         dashedLineWidth: w = ( |
            | 
            lineWidth: w Style: lineOnOffDash Cap: capButt Join: joinMiter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         dashes: dashByteVec Offset: os = ( |
            | 
            display xSetGC: self DashesOffset: os DashList: dashByteVec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultGCFor: disp = ( |
            | 
            disp screen defaultGCOfScreen initOnDisplay: disp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: create and delete\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | xgcv delete. display xFreeGC: self. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: fillRules\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         evenOddRule = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillOpaqueStippled = ( |
            | fillStyle: fillStyles fillOpaqueStippled).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillRule: rule = ( |
            | display xSetGC: self FillRule: rule).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillSolid = ( |
            | fillStyle: fillStyles fillSolid).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillStippled = ( |
            | fillStyle: fillStyles fillStippled).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillStyle: style = ( |
            | display xSetGC: self FillStyle: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         fillStyles = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> 'fillStyles' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib graphicsContext fillStyles.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> 'fillStyles' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillOpaqueStippled = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> 'fillStyles' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillSolid = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> 'fillStyles' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillStippled = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> 'fillStyles' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillTiled = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fillTiled = ( |
            | fillStyle: fillStyles fillTiled).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fill_rule = ( |
            | getValues: gcFillRule.   xgcv fill_rule).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         fill_style = ( |
            | getValues: gcFillStyle.  xgcv fill_style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         font = ( |
            | getValues: gcFont.           xgcv font).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         font: fid = ( |
            | display xSetGC: self Font: fid).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         foreground = ( |
            | getValues: gcForeground. xgcv foreground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         foreground8Bit: cme = ( |
            | 
            [todo ui1 dmu experimental].
            foreground: cme index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         foreground: fg = ( |
            | display xSetGC: self Foreground: fg).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         function = ( |
            | getValues: gcFunction.   xgcv function).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         function: fct = ( |
            | display xSetGC: self Function: fct).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcArcMode = 4194304.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcBackground = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcCapStyle = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcClipMask = 524288.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcClipXOrigin = 131072.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcClipYOrigin = 262144.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcDashList = 2097152.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcDashOffset = 1048576.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcFillRule = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcFillStyle = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcFont = 16384.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcForeground = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcFunction = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcGraphicsExposures = 65536.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcJoinStyle = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcLineStyle = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcLineWidth = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcPlaneMask = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcStipple = 2048.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcSubwindowMode = 32768.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcTile = 1024.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcTileStipXOrigin = 4096.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: attributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         gcTileStipYOrigin = 8192.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         getValues: mask = ( |
            | 
            display xGetGCValuesGC: self ValueMask: mask Values: xgcv).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         graphics_exposures = ( |
            | 
            getValues: gcGraphicsExposures. xgcv graphics_exposures).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         graphics_exposures: bool = ( |
            | 
            display xSetGC: self GraphicsExposures: bool).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxAnd = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxAndInverted = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxAndReverse = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxClear = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxCopy = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxCopyInverted = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxEquiv = 9.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxInvert = 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxNand = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxNoop = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxNor = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxOr = 7.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxSet = 15.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxXor = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxXorInverted = 13.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: copyFunctions\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         gxXorReverse = 11.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: create and delete\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         initOnDisplay: disp = ( |
            | 
            display: disp.
            xgcv: xlib xGCValues new.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         joinBevel = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         joinMiter = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         joinRound = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         lineDoubleDash = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         lineOnOffDash = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: lineAttributes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         lineSolid = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lineWidth = ( |
            | getValues: gcLineWidth.  xgcv line_width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lineWidth: w = ( |
            | 
            lineWidth: w Style: lineSolid Cap: capButt Join: joinMiter).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lineWidth: w Style: l Cap: c Join: j = ( |
            | 
            display xSetGC: self LineAttributesWidth: w
                                           LineStyle: l
                                            CapStyle: c
                                           JoinStyle: j).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         plane_mask = ( |
            | getValues: gcPlaneMask.  xgcv plane_mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         plane_mask: mask = ( |
            | display xSetGC: self PlaneMask: mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipMask: pixmap = ( |
            | display xSetClipMask: self Pixmap: pixmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipMask: aPixMap Origin: aPoint = ( |
            | 
            setClipMask: aPixMap.
            setClipOrigin: aPoint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Comment: Setting the clip region\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipOrigin: pt = ( |
            | display xSetClipOrigin: self X: pt x Y: pt y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         setClipRectangle: rect = ( |
            | 
            display xSetClipRectangle: self 
                                    X: rect left 
                                    Y: rect top 
                                Width: rect width 
                               Height: rect height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         setNoClipMask = ( |
            | setClipMask: xlib pixmap nullPixmap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         stipple = ( |
            | getValues: gcStipple.    xgcv stipple).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         stipple: stip = ( |
            | display xSetGC: self Stipple: stip).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         tile = ( |
            | getValues: gcTile. xgcv tile).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         tile: t = ( |
            | display xSetGC: self Tile: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-graphicsContext'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'graphicsContext' -> () From: ( | {
         'Category: fillRules\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         windingRule = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createBitmapForSameScreenAs: db FromData: bv Size: sz = ( |
             disp.
             pm.
            | 
            disp: db display.
            pm: disp xCreateBitmapDrawable: db
                                      Data: bv
                                     Width: sz x
                                    Height: sz y.
            pm display: disp.
            pm size: sz.
            pm depth: 1.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createForSameScreenAs: db Size: sz Depth: dp = ( |
             disp.
             pm.
            | 
            disp: db display.
            pm: disp xCreatePixmap: db
                             Width: sz x
                            Height: sz y
                             Depth: dp.
            pm display: disp.
            pm size: sz.
            pm depth: dp.
            pm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | display xFreePixmap: self. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'pixmap' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-pixmap'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'region' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'region' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         whichProxy = 'xlib-region'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         blackPixel = ( |
            | blackPixelOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultVisual = ( |
            | defaultVisualOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         depth = ( |
            | defaultDepthOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | heightOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         initialize: display = ( |
            | 
            rootWindow: (rootWindowOfScreen) display: display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         number = ( |
            | xScreenNumberOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         size = ( |
            | width @ height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-screen'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         whitePixel = ( |
            | whitePixelOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'screen' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | widthOfScreen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'visual' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'visual' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         whichProxy = 'xlib-visual'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         catchWMDelete = ( |
            | 
            xlib wmProtocols:    display internAtom: 'WM_PROTOCOLS'.
            xlib wmDeleteWindow: display internAtom: 'WM_DELETE_WINDOW'.
            display xSetWMProtocolOfWindow: self Protocol: xlib wmDeleteWindow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: manipulating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
            | 
            "The following call is equivalent to a call of XClearWindow.
             We used to have an 'xClearWindow:' primitive, but I took it out
             when the 'xClearArea...' was added.   Ole Agesen, July 1996."
            display xClearAreaIn: self X: 0 Y: 0 Width: 0 Height: 0 Exposures: false.
            doAutoFlush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFromParent = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createChildWindowAt: pos Size: size Depth: d Visual: vis Attributes: attrs = ( |
            | 
            createChildWindowAt: pos Size: size Depth: d 
              Visual: vis Attributes: attrs IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createChildWindowAt: pos Size: size Depth: d Visual: vis Attributes: attrs IfFail: errBlk = ( |
            | 
            (display xCreateIOWindowIn: self X: pos x Y: pos y
                     Width: size x Height: size y Depth: d 
                     Visual: vis Attributes: attrs IfFail: [|:e| ^ errBlk value: e]
            ) initDisplay: display Depth: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createOnDisplay: disp At: pos Size: sz = ( |
            | 
            (disp xCreateSimpleWindowIn: disp screen rootWindow
                                      X: pos x
                                      Y: pos y
                                  Width: sz x
                                 Height: sz y
                            BorderWidth: 0
                                 Border: disp screen blackPixel
                             Background: disp screen whitePixel
            ) initDisplay: disp Depth: disp screen depth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createOnDisplay: disp At: pos Size: sz Depth: d = ( |
            | 
            [todo ui1 dmu experimental].
                (disp xCreateSimpleWindowIn: disp screen rootWindow
                                          X: pos x
                                          Y: pos y
                                      Width: sz x
                                     Height: sz y
                                BorderWidth: 0
                                     Border: disp screen blackPixel
                                 Background: disp screen whitePixel
                ) initDisplay: disp Depth: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         createOnDisplay: disp At: pos WithSize: size Depth: d Visual: vis Attributes: attrs = ( |
            | 
            (disp xCreateIOWindowIn: disp screen rootWindow
                                  X: pos x
                                  Y: pos y
                              Width: size x
                             Height: size y
                              Depth: d
                             Visual: vis
                         Attributes: attrs) initDisplay: disp Depth: d).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         currentTime = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: cursorOps\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         defineCursor: cursor = ( |
            | 
            display xDefineCursorWindow: self Cursor: cursor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | 
            unmap.
            display xDestroyWindow: self.
            kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         displayName = ( |
            | 
            display name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: manipulating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         doAutoFlush = ( |
            | 
            autoFlush ifTrue: [display flush].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         freezeSize: size = ( |
             sizeHints.
            | 
            sizeHints: xlib xSizeHints new.
            sizeHints flags: sizeHints pMinSize || sizeHints pMaxSize.
            sizeHints min_width:  size x.
            sizeHints min_height: size y.
            sizeHints max_width:  size x.
            sizeHints max_height: size y.
            display xSetWMNormalHintsOfWindow: self To: sizeHints.
            sizeHints delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: grabModes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         grabModeAsync = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: grabModes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         grabModeSync = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: cursorOps\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         grabPointer = ( |
            | grabPointer: xlib cursor nullCursor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: cursorOps\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         grabPointer: cursor = ( |
            | 
            display xGrabPointerWindow: self
                           OwnerEvents: true
                             EventMask: eventMask
                           PointerMode: grabModeAsync
                          KeyboardMode: grabModeAsync
                             ConfineTo: self
                                Cursor: cursor
                                  Time: currentTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         iconName: name = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 tp.
                } 
            | 
            tp: xlib xTextProperty new.
            tp xStringToTextProperty: name.
            display xSetWMIconNameOfWindow: self To: tp.
            tp delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         iconified: iconified Icon: icon Input: input = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 wmHints.
                } 
            | 
            wmHints: xlib xWMHints new.
            wmHints initial_state:
              iconified ifTrue: wmHints iconicState False: wmHints normalState.
            wmHints input: input.
            wmHints flags: (wmHints stateHint || wmHints inputHint).
            icon isLive ifTrue: [
                wmHints icon_pixmap: icon.
                wmHints flags: wmHints flags || wmHints iconPixmapHint. ].
            display xSetWMHintsOfWindow: self To: wmHints.
            wmHints delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         iconified: iconified Input: input = ( |
            | 
            iconified: iconified Icon: xlib pixmap deadCopy Input: input).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fCategory: initialization\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         initDisplay: disp Depth: d = ( |
            | 
            simpleInitDisplay: disp Depth: d.
            selfConfigurationRequest.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: window classes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         inputOnly = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: window classes\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         inputOutput = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: manipulating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lower = ( |
            | 
            display xLowerWindow: self.
            doAutoFlush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: manipulating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         map = ( |
            | 
            display xMapWindow:   self.
            doAutoFlush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         maxSize: maxSize = ( |
             sizeHints.
            | 
            sizeHints: xlib xSizeHints new.
            sizeHints flags: sizeHints pMaxSize.
            sizeHints max_width:  maxSize x.
            sizeHints max_height: maxSize y.
            display xSetWMNormalHintsOfWindow: self To: sizeHints.
            sizeHints delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize: minSize = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 sizeHints.
                } 
            | 
            sizeHints: xlib xSizeHints new.
            sizeHints flags: sizeHints pMinSize.
            sizeHints min_width:  minSize x.
            sizeHints min_height: minSize y.
            display xSetWMNormalHintsOfWindow: self To: sizeHints.
            sizeHints delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         name: name = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 tp.
                } 
            | 
            tp: xlib xTextProperty new.
            tp xStringToTextProperty: name.
            display xSetWMNameOfWindow: self To: tp.
            tp delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'drawable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: manipulating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         raise = ( |
            | 
            display xRaiseWindow: self.
            doAutoFlush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: InputFocus\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         revertToNone = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: InputFocus\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         revertToParent = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: InputFocus\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         revertToPointerRoot = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         screen = ( |
            | display screen).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         selectInput = ( |
            | 
            display xSelectInputOfWindow: self EventMask: eventMask.  
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fCategory: initialization\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         selfConfigurationRequest = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 sizeHints.
                } 
            | 
            sizeHints: xlib xSizeHints new.
            sizeHints flags: sizeHints pPosition || sizeHints pSize.
            display xSetWMNormalHintsOfWindow: self To: sizeHints.
            sizeHints delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: manipulating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         setFocus: revertTo = ( |
            | 
            display xSetInputFocusWindow: self RevertTo: revertTo Time: currentTime. 
            doAutoFlush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: creating\x7fCategory: initialization\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         simpleInitDisplay: disp Depth: d = ( |
            | 
            autoFlush: true.
            display:   disp.
            depth:     d.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: cursorOps\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         undefineCursor = ( |
            | display xUndefineCursorWindow: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: cursorOps\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         ungrabPointer = ( |
            | display xUngrabPointerTime: currentTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: manipulating\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         unmap = ( |
            | 
            display xUnmapWindow: self.
            doAutoFlush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         unmappedPaintManager = ( |
            | 
            x11Globals unmappedPaintManager).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: cursorOps\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         warpPointerTo: pt = ( |
            | 
            display xWarpPointerSrcWindow: xlib window nullWindow
                               DestWindow: self
                                     SrcX: 0
                                     SrcY: 0
                                 SrcWidth: 0
                                SrcHeight: 0
                                    DestX: pt x
                                    DestY: pt y.
            display syncDiscardingIf: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-window'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_X_cursor = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_arrow = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_boat = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_bottom_left_corner = 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_bottom_right_corner = 14.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_bottom_side = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_crosshair = 34.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_fleur = 52.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_hand2 = 60.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_left_side = 70.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_right_side = 96.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_top_left_corner = 134.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_top_right_corner = 136.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_top_side = 138.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_watch = 150.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'window' -> () From: ( | {
         'Category: constants\x7fCategory: cursor types\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         xc_xterm = 152.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xCharStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xCharStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xFontStruct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> () From: ( | {
         'Comment: ensures that storing & querying will affect all three RGB values\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         allComponents = ( |
            | flags: doRed || doGreen || doBlue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> () From: ( | {
         'Category: flagComponents\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         doBlue = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> () From: ( | {
         'Category: flagComponents\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         doGreen = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> () From: ( | {
         'Category: flagComponents\x7fModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         doRed = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xColor' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xColor'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xFontStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | display xFreeFont: self. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xFontStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         maxCharHeight = ( |
            | 
            maxAscent + maxDescent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xFontStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xFontStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         textWidth: str = ( |
            | 
            xTextWidth: str IfFail: [|:e|
              ('nullCharError' isPrefixOf: e ) ifTrue: [
                ^ textWidth: (str asList copyFilteredBy: [|:c| c != '\0' ]) asString
              ].
              raiseError value: 'textWidth: failed: ', e
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xFontStruct' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xFontStruct'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xGCValues' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         background8Bit: cme = ( |
            | 
            [todo ui1 dmu experimental].
            background: cme index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xGCValues' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         foreground8Bit: cme = ( |
            | 
            [todo ui1 dmu experimental].
            foreground: cme index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xGCValues' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xGCValues' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xGCValues'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xImage' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | xDestroyImage. kill).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xImage' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xImage' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xImage'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSetWindowAttributes' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSetWindowAttributes' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         whichProxy = 'xlib-xSetWindowAttributes'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pAspect = 128.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pBaseSize = 256.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pMaxSize = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pMinSize = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pPosition = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pResizeInc = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pSize = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         pWinGravity = 512.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         usPosition = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         usSize = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xSizeHints' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xSizeHints'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xTextProperty' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( | {
                 'ModuleInfo: Module: xlib InitialContents: FollowSlot'
                
                 v.
                } 
            | 
            v: value.
            freeValue: v.
            v kill.
            basicDelete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xTextProperty' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xTextProperty' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xTextProperty'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xVisualInfo' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xVisualInfo' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         whichProxy = 'xlib-xVisualInfo'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         iconMaskHint = 32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         iconPixmapHint = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         iconPositionHint = 16.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         iconWindowHint = 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: initialStates\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         iconicState = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         inputHint = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: initialStates\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         normalState = 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         stateHint = 2.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         whichProxy = 'xlib-xWMHints'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: flagBits\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         windowGroupHint = 64.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWMHints' -> () From: ( | {
         'Category: initialStates\x7fModuleInfo: Module: xlib InitialContents: FollowSlot'
        
         withdrawnState = 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'xWindowAttributes' -> () From: ( | {
         'ModuleInfo: Module: xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'proxy' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'xDrawable' From: 'graphics'
 bootstrap read: 'xlib_wrappers' From: 'glue'



 '-- Side effects'

 globals modules xlib postFileIn
