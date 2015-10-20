 '$Revision: 30.18 $'
 '
Copyright 1992-2012 AUTHORS.
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
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Events\x7fComment: Supports platform independent usage of events
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
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Events\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot\x7fVisibility: public'
        
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
            | 
            xlib events xInputEvent mod3Mask).
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
            bs isEmpty ifFalse: [bs] True: [vector copyAddFirst: keySym]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: xEvents InitialContents: FollowSlot'
        
         keySymFrom: xEvt = ( |
             k.
            | 
            k: xEvt lookupKeySym.

            k =  xEvt xk_Left     ifTrue: [ ^ keyCaps arrows  left  ].
            k =  xEvt xk_Up       ifTrue: [ ^ keyCaps arrows  up    ].
            k =  xEvt xk_Right    ifTrue: [ ^ keyCaps arrows  right ].
            k =  xEvt xk_Down     ifTrue: [ ^ keyCaps arrows  down  ].

            k =  xEvt xk_KP_Left   ifTrue: [ ^ keyCaps arrows  left  ].
            k =  xEvt xk_KP_Up     ifTrue: [ ^ keyCaps arrows  up    ].
            k =  xEvt xk_KP_Right  ifTrue: [ ^ keyCaps arrows  right ].
            k =  xEvt xk_KP_Down   ifTrue: [ ^ keyCaps arrows  down  ].

            k =  xEvt xk_Shift_L    ifTrue: [ ^ keyCaps oddballs shift   ].
            k =  xEvt xk_Shift_R    ifTrue: [ ^ keyCaps oddballs shift   ].
            k =  xEvt xk_Control_L  ifTrue: [ ^ keyCaps oddballs control ].
            k =  xEvt xk_Control_R  ifTrue: [ ^ keyCaps oddballs control ].
            k =  xEvt xk_Alt_L      ifTrue: [ ^ keyCaps oddballs alt     ].
            k =  xEvt xk_Alt_R      ifTrue: [ ^ keyCaps oddballs alt     ].
            k =  xEvt xk_Super_L    ifTrue: [ ^ keyCaps oddballs command ].
            k =  xEvt xk_Super_R    ifTrue: [ ^ keyCaps oddballs command ].

            keyCaps unknown).
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
            | 
            xlib events xInputEvent mod2Mask).
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
            keySym:     keySymFrom: xEvt.
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



 '-- Side effects'

 globals modules xEvents postFileIn
