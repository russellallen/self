 'Sun-$Revision: 30.14 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         simpleEventHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals simpleEventHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'bezier' -> 'demoHandler' -> () From: ( | {
         'Comment: This slot is only used for UI1,
yet UI2 uses this object.
So annotate this one slot as module window.
-- dmu 2/95\x7fModuleInfo: Module: window InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'simpleEventHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals window.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmap <- bootstrap stub -> 'globals' -> 'windowBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor <- bootstrap stub -> 'globals' -> 'cursor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         displayName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: InitializeToExpression: (nil \"simpleEventHandler\")\x7fVisibility: public'
        
         handler <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'A Window'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         macWindow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits macWindow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: InitializeToExpression: (nil)'
        
         platformWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (5)@(5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (200)@(200).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         watcher <- bootstrap stub -> 'globals' -> 'eventWatcher' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         watcherProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot'
        
         window = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules window.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot'
        
         myComment <- 'Simple window object.\"

            \"The window object knows about Xlib.
             Objects using window ideally should be isolated from Xlib.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            macToolboxGlobals window handler: simpleEventHandler.
                   x11Globals window handler: simpleEventHandler.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.14 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonPress: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonRelease: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         clientMessage: event = ( | {
                 'ModuleInfo: Module: window InitialContents: FollowSlot'
                
                 quit <- bootstrap stub -> 'globals' -> 'false' -> ().
                } 
            | 
            quit: event isDeleteWindow.
            event delete.
            quit ifTrue: [ window close ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         configureNotify: event = ( | {
                 'ModuleInfo: Module: window InitialContents: FollowSlot'
                
                 pos.
                }  {
                 'ModuleInfo: Module: window InitialContents: FollowSlot'
                
                 sz.
                } 
            | 
            pos: event x @ event y.
            sz: event width @ event height.
            window position: pos.
            window size: sz.
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         event: event = ( |
            | (event typeName, ':') sendTo: self With: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsToCatch = 172047.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         expose: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         focusIn: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         focusOut: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         keyPress: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         keyRelease: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         mapNotify: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         mappingNotify: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         motionNotify: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         otherEvent: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         reparentNotify: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         unmapNotify: event = ( |
            | event delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals window.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'simpleEventHandler' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         window <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmap <- bootstrap stub -> 'globals' -> 'windowBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor <- bootstrap stub -> 'globals' -> 'cursor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         displayName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: InitializeToExpression: (nil \"simpleEventHandler\")\x7fVisibility: public'
        
         handler <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         icon <- bootstrap stub -> 'globals' -> 'xlib' -> 'pixmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         iconFilename <- 'window.icon'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         iconName <- 'window'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'A Window'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         xWindow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xWindow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (5)@(5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (200)@(200).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         watcher <- bootstrap stub -> 'globals' -> 'eventWatcher' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         watcherProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot'
        
         xwin <- bootstrap stub -> 'globals' -> 'xlib' -> 'window' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: windowing\x7fComment: platform-independent code
for UI2 windows\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractWindow = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractWindow.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         close = ( |
            | closeSync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         closeAsync = ( |
            | stopWatchingEvents. closeDisplay. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         closeSync = ( |
            | closeDisplay. stopWatchingEvents. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             w.
            | 
            w: resend.copy.
            w handler: (handler ifNil: [simpleEventHandler]) copy window: w.
            w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         createBitmap = ( |
            | bitmap: windowBitmap copyFor: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         createCursor = ( |
            | cursor: globals cursor copy window: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: forwardToDisplay\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsPending = ( |
            | display eventsPending).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: forwardToDisplay\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         flush = ( |
            | display flush).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         init = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         interpretedDisplayName = ( |
            | 
            displayName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: forwardToDisplay\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         loadFont: f IfFail: b = ( |
            | display loadFont: f IfFail: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: manipulation\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         lower = ( |
            | xwin lower. sync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: cursorManipulation\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         moveCursorTo: pt = ( |
            | 
            platformWindow warpPointerTo: pt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: forwardToDisplay\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         nextEvent = ( |
            | display nextEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         open = ( |
            | openIfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: manipulation\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         raise = ( |
            | 
            platformWindow raise. sync).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         stopWatchingEvents = ( |
            | 
            watcherProcess == process  ifTrue: [
              ^ error: 'trying to stop scheduler'.
            ].
            watcherProcess abort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: forwardToDisplay\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         sync = ( |
            | display syncDiscardingIf: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         synchronous <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: cursorManipulation\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         updateCursor: event = ( |
            | 
            cursor location: event x @ event y.
            cursor state: event newState.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindow' -> () From: ( | {
         'Category: queueing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         useQueueingHandlerFor: target = ( |
            | 
            handler: queueingEventHandler copyOn: self For: target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         closeDisplay = ( |
            | 
            platformWindow close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         flush = ( |
            | [xxx]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         gc = ( |
            | platformWindow gc).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         iconFilename: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         iconName: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: screenType\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         isColor8 = ( |
            | platformWindow depth = 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: screenType\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         isGrey4 = ( |
            | 
            false "for now").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: screenType\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         isMono = ( |
            | platformWindow depth = 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         openIfFail: fblock = ( |
            | 
            platformWindow: macToolbox platformWindow new.
            platformWindow
               openDisplay: displayName
               BoundingBox: position ## size
                WindowName: name.

            createBitmap.
            createCursor.

            init.
            spawnEventWatcherProcess.

            synchronous ifTrue: [ display synchronize: true ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: forwardToDisplay\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         putBackEvent: e = ( |
            | 
            display xPutBackEvent: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         spawnEventWatcherProcess = ( |
            | 
            watcher: eventWatcher copyForDisplay: display Handler: handler.
            watcherProcess: process copySend: message copy receiver: watcher
                                                           Selector: 'watch'.
            "watcherProcess resume"
            warning: 'spawnEventWatcherProcess nopped for now').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'macWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         sync = ( |
            | [todo ui1 dmu experimental]. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: destroying\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         closeDisplay = ( |
            | 
            icon isLive ifTrue: [ icon delete ].
            platformWindow delete.
            display close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         createIcon: filename = ( |
            | 
            (os_file existsAndIsReadable: filename)
              ifTrue: [ (xBitmapMaker copy parseBitmapFile: filename)
                         createBitmapForSameScreenAs: platformWindow ]
               False: [ xlib pixmap deadCopy ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         interpretedDisplayName = ( |
            | xlib display xDisplayName: displayName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: screenType\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         isColor8 = ( |
            | display isPseudoColor8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: screenType\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         isGrey4 = ( |
            | display isGrayScale4).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: screenType\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         isMono = ( |
            | display isMonochrome).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         openDepth: d IfFail: fblock = ( |
            | 
             [todo ui1 dmu experimental].
            display: xlib display open: displayName
                                IfFail: [ ^ fblock value:
                                          'Could not open X display \'',
                                          interpretedDisplayName,
                                          '\'.' ].
            xwin: xlib window createOnDisplay: display At: position Size: size Depth: d.
            xwin name: name.
            xwin iconName: iconName.
            icon: createIcon: iconFilename.
            xwin iconified: false Icon: icon Input: true.
            xwin catchWMDelete.
            xwin eventMask: handler eventsToCatch.

            display gc graphics_exposures: false.
            xwin selectInput.
            xwin map.

            createBitmap.
            createCursor.

            init.
            spawnEventWatcherProcess.

            synchronous ifTrue: [ display synchronize: true ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         openIfFail: fblock = ( |
            | 
            display: xlib display open: displayName
                                IfFail: [ ^ fblock value:
                                          'Could not open X display \'',
                                          interpretedDisplayName,
                                          '\'.' ].
            xwin: xlib window createOnDisplay: display At: position Size: size.
            xwin name: name.
            xwin iconName: iconName.
            icon: createIcon: iconFilename.
            xwin iconified: false Icon: icon Input: true.
            xwin catchWMDelete.
            xwin eventMask: handler eventsToCatch.

            display gc graphics_exposures: false.
            xwin selectInput.
            xwin map.

            createBitmap.
            createCursor.

            init.
            spawnEventWatcherProcess.

            synchronous ifTrue: [ display synchronize: true ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'ModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         platformWindow = ( |
            | xwin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: forwardToDisplay\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: public'
        
         putBackEvent: e = ( |
            | 
            display xPutBackEvent: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindow' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: window InitialContents: FollowSlot\x7fVisibility: private'
        
         spawnEventWatcherProcess = ( |
            | 
            watcher: eventWatcher copyForDisplay: display Handler: handler.
            watcherProcess: process copySend: message copy receiver: watcher
                                                           Selector: 'watch'.
            watcherProcess resume).
        } | ) 



 '-- Side effects'

 globals modules window postFileIn
