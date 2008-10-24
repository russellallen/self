 '$Revision: 30.18 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot'
        
         xEvents = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules xEvents.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.18 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'xEvents' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Events\x7fComment: Supports platform independent usage of events
combined with platform specific initialization:

Native X events are used for initialization,
but the resulting ui2Event is used in a platform 
independent manner (as a \"Self/ui2\" event).\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Event = bootstrap define: bootstrap stub -> 'globals' -> 'x11Globals' -> 'ui2Event' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractUI2Event copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'ui2Event' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals ui2Event.

CopyDowns:
globals abstractUI2Event. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Events\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2XEvent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( |
             {} = 'Comment: A ui2XEvent is a general input event. Variations include mouse button
     transitions, mouse movements, and keyboard key transitions.  It
     is initialized in an X specific way but used in a portable may.
     Note that \"portable\" in this case means that all platforms have 
     been coerced to look like X Windows..\x7fModuleInfo: Creator: traits ui2XEvent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'ui2Event' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2XEvent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         altGraphicMask = ( |
            | xlib events xInputEvent mod2Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         altMask = ( |
            | 
            xlib events xInputEvent mod1Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         anyMouseMask = ( |
            | xlib events xInputEvent anyButtonMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         commandMask = ( |
            | xlib events xInputEvent mod2Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         controlMask = ( |
            | xlib events xInputEvent controlMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: time stamps\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         isOKToUseMyTimeStampForMenus = ( |
            | 
            "Legacy from Self 4, this is what X implementation did"
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         keyCapsPressed = ( |
             bs.
            | 
            bs: resend.keyCapsPressed.
            bs isEmpty ifFalse: [bs] True: [x11KeyCapsPressed]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseMask = ( |
            | xlib events xInputEvent button1Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         metaMask = ( |
            | 
            xlib events xInputEvent mod4Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseMask = ( |
            | xlib events xInputEvent button2Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         numLockMask = ( |
            | xlib events xInputEvent mod3Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         optionMask = ( |
            | xlib events xInputEvent optionMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'ModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractUI2Event' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseMask = ( |
            | xlib events xInputEvent button3Mask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromButtonPress: xEvt = ( |
             b.
            | 
            timeStamp: xEvt time.
            state: xEvt state.
            b: xEvt button.
            case
              if: [ 1 = b ] Then: [
                type: 'leftMouseDown'.
                state: state || leftMouseMask.
              ]
              If: [ 2 = b ] Then: [
                type: 'middleMouseDown'.
                state: state || middleMouseMask.
              ]
              If: [ 3 = b ] Then: [
                type: 'rightMouseDown'.
                state: state || rightMouseMask.
              ]
              If: [ ( 4 = b )  ||  [5 = b] ]  Then: [
                type: 'ignore'.
                wheelDelta: (b = 4 ifTrue: 1 False: -1).
              ]
              Else: [
                type: 'someMouseDown'.
              ].
            cursorPoint: xEvt x @ xEvt y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromButtonRelease: xEvt = ( |
             b.
            | 
            timeStamp: xEvt time.
            state: xEvt state.
            b: xEvt button.
            case
              if: [ 1 = b ] Then: [
                type: 'leftMouseUp'.
                state: state && leftMouseMask complement.
              ]
              If: [ 2 = b ] Then: [
                type: 'middleMouseUp'.
                state: state && middleMouseMask complement.
              ]
              If: [ 3 = b ] Then: [
                type: 'rightMouseUp'.
                state: state && rightMouseMask complement.
              ]
              If: [ ( 4 = b )  ||  [5 = b] ]  Then: [
                type: 'wheelMovedInY'.
                wheelDelta: (b = 4 ifTrue: 1 False: -1) * 3.
              ]
              Else: [
                type: 'someMouseUp'.
              ].
            cursorPoint: xEvt x @ xEvt y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromClientMessage: xEvt = ( |
            | 
            xEvt isDeleteWindow ifTrue: [ ^setFromWindowDelete ].
            "otherwise, ignore"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromConfigure: xEvt = ( |
            | 
            type: 'windowResize'.
            bounds: (xEvt x @ xEvt y) ## (xEvt width @ xEvt height).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromEnter: xEvt = ( |
            | 
            type: 'windowEnter'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromExpose: xEvt = ( |
            | 
            type: 'windowExpose'.
            bounds: (xEvt x @ xEvt y) ## (xEvt width @ xEvt height).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromKeyPress: xEvt = ( |
            | 
            type: 'keyDown'.
            setFromKeyPressedOrReleased: xEvt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromKeyPressedOrReleased: xEvt = ( |
            | 
            timeStamp:  xEvt time.
            state:      xEvt state.
            keycode:    xEvt keycode.
            keystrokes: xEvt lookupString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromKeyRelease: xEvt = ( |
            | 
            type: 'keyUp'.
            setFromKeyPressedOrReleased: xEvt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromLeave: xEvt = ( |
            | 
            type: 'windowLeave'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromMotionNotify: xEvt = ( |
            | 
            timeStamp: xEvt time.
            type: 'mouseMotion'.
            state: xEvt state.
            cursorPoint: (xEvt x @ xEvt y).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: initialization\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         setFromWindowDelete = ( |
            | 
            type: 'windowDelete'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftLockMask = ( |
            | xlib events xInputEvent lockMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: stateMasks\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
         shiftMask = ( |
            | xlib events xInputEvent shiftMask).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         x11KeyCapPressedIfNone: nb = ( |
            | 
            host hasSolaris ifTrue: [
              "Arrow keys"
              keycode =  88  ifTrue: [ ^ keyCaps arrows  down ].
              keycode =  87  ifTrue: [ ^ keyCaps arrows  left ].
              keycode =  89  ifTrue: [ ^ keyCaps arrows  up   ].
              keycode =  86  ifTrue: [ ^ keyCaps arrows  right].

              "Arrow keys on numerical pad"
              keycode =  97  ifTrue: [ ^ keyCaps arrows  down ].
              keycode =  99  ifTrue: [ ^ keyCaps arrows  left ].
              keycode = 103  ifTrue: [ ^ keyCaps arrows  up   ].
              keycode = 101  ifTrue: [ ^ keyCaps arrows  right].

              "The combination arrow keys on the numerical pad"
              keycode = 102 ifTrue: [ ^ keyCaps arrows  upLeft    ].
              keycode = 104 ifTrue: [ ^ keyCaps arrows  upRight   ].
              keycode =  96 ifTrue: [ ^ keyCaps arrows  downLeft  ].
              keycode =  98 ifTrue: [ ^ keyCaps arrows  downRight ].

              keycode =  80 ifTrue: [ ^ keyCaps oddballs insert   ].
              keycode =  82 ifTrue: [ ^ keyCaps oddballs pageUp   ].
              keycode =  85 ifTrue: [ ^ keyCaps oddballs pageDown ].
              keycode =  81 ifTrue: [ ^ keyCaps oddballs home     ].
              keycode =  84 ifTrue: [ ^ keyCaps oddballs end      ].

              "Undo Cut Copy and Paste keys"

              "Note- Undo isn't implemented yet.  Calling it will cause"
              "the system to printLine a message saying so"
              keycode = 129 ifTrue: [ ^ keyCaps oddballs  undo_cmd     ].
              keycode = 131 ifTrue: [ ^ keyCaps oddballs  copy_cmd     ].
              keycode = 132 ifTrue: [ ^ keyCaps oddballs  paste_cmd    ].
              keycode = 130 ifTrue: [ ^ keyCaps oddballs  cut_cmd      ].

            ] False: [

              keycode = 122 ifTrue: [ ^ keyCaps oddballs insert   ].
              keycode = 124 ifTrue: [ ^ keyCaps oddballs pageUp   ].
              keycode = 129 ifTrue: [ ^ keyCaps oddballs pageDown ].
              keycode = 123 ifTrue: [ ^ keyCaps oddballs home     ].
              keycode = 127 ifTrue: [ ^ keyCaps oddballs end      ].

              keycode = 133 ifTrue: [ ^ keyCaps arrows  down  ].
              keycode = 134 ifTrue: [ ^ keyCaps arrows  up    ].
              keycode = 131 ifTrue: [ ^ keyCaps arrows  left  ].
              keycode = 132 ifTrue: [ ^ keyCaps arrows  right ].

            ].

            nb value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         x11KeyCapsPressed = ( |
            | vector copyAddFirst: x11KeyCapPressedIfNone: [^ vector]).
        } | ) 



 '-- Side effects'

 globals modules xEvents postFileIn
