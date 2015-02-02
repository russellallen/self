 'Sun-$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         eventHandler = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'eventHandler' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'eventHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules eventHandler.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'eventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'eventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'eventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'eventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'eventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: windowing\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         queueingEventHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'queueingEventHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals queueingEventHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         msgQueue <- bootstrap stub -> 'globals' -> 'sharedQueue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: windowing\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         queueingEventHandler = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits queueingEventHandler.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'queueingEventHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         nullTarget = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits queueingEventHandler nullTarget.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         target <- bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         window.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonPress: event = ( |
            | 
            dispatchButtonEvent: event Action: 'Down'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonRelease: event = ( |
            | 
            dispatchButtonEvent: event Action: 'Up'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         clientMessage: event = ( |
            | 
            event isDeleteWindow
             ifTrue: [ | args |
                       args: vector copySize: 2.
                       args at: 0 Put: window.
                       args at: 1 Put: event.
                       queue: 'windowQuit:Event:' With: args. ]
              False: [ warning: 'unknown X client message received'.
                       event delete. ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventWatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         collapseMotionEvents: nonX = ( |
            | 
            [ | e. m. |
                m: msgQueue removeFirst.
                (eventMessages includes: m selector)
                    ifFalse: [ nonX add: m. ^ self ].
                e: m arguments last. "assumption: last arg is the X event"
                window cursor getInfo: e.
                e typeName = 'motionNotify' ifFalse: [ e delete. ^ self ].
                e delete.
                msgQueue isEmpty ifTrue: [ ^ self ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         configureNotify: event = ( | {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 args.
                }  {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 pos.
                }  {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 sz.
                } 
            | 
            pos: event x @ event y.
            sz: event width @ event height.
            window position: pos.
            window size: sz.
            args: vector copySize: 2.
            args at: 0 Put: pos ##! sz.
            args at: 1 Put: event.
            queue: 'windowChanged:Event:' With: args.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOn: win For: targ = ( |
            | copy initializeOn: win For: targ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         dispatchButtonEvent: event Action: type = ( | {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 args.
                } 
            | 
            args: vector copySize: 2.
            args at: 0 Put: event x @ event y.
            args at: 1 Put: event.
            queue: (event buttonName, 'Button', type, 'At:Event:')
             With: args.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         event: event = ( |
            | (event typeName, ':') sendTo: self With: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Comment: these must remain in sync with any changes to the message protocol\x7fModuleInfo: Module: eventHandler InitialContents: InitializeToExpression: (
          (\'windowChanged:Event:\' & \'windowExposed:Last:Event:\' & \'leftButtonDownAt:Event:\' & \'leftButtonUpAt:Event:\' & \'middleButtonDownAt:Event:\' & \'middleButtonUpAt:Event:\' & \'rightButtonDownAt:Event:\' & \'rightButtonUpAt:Event:\' & \'keyDown:String:At:Event:\' & \'keyUp:String:At:Event:\' & \'cursorMovedTo:Event:\' & \'windowQuit:Event:\') asList
)\x7fVisibility: private'
        
         eventMessages = 
          ('windowChanged:Event:' & 'windowExposed:Last:Event:' & 'leftButtonDownAt:Event:' & 'leftButtonUpAt:Event:' & 'middleButtonDownAt:Event:' & 'middleButtonUpAt:Event:' & 'rightButtonDownAt:Event:' & 'rightButtonUpAt:Event:' & 'keyDown:String:At:Event:' & 'keyUp:String:At:Event:' & 'cursorMovedTo:Event:' & 'windowQuit:Event:') asList
.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsToCatch = 172047.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         expose: event = ( | {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 args.
                } 
            | 
            args: vector copySize: 3.
            args at: 0
                Put: (event x @ event y) ##! (event width @ event height).
            args at: 1 Put: event count = 0.
            args at: 2 Put: event.
            queue: 'windowExposed:Last:Event:' With: args.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeOn: win For: targ = ( |
            | 
            window: win.
            target: targ.
            msgQueue: sharedQueue copy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         keyEvent: event Selector: sel = ( | {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 args.
                } 
            | 
            args: vector copySize: 4.
            args at: 0 Put: event keycode.
            args at: 1 Put: event lookupString.
            args at: 2 Put: event x @ event y.
            args at: 3 Put: event.
            queue: sel With: args.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         keyPress: event = ( |
            | 
            keyEvent: event Selector: 'keyDown:String:At:Event:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         keyRelease: event = ( |
            | 
            keyEvent: event Selector: 'keyUp:String:At:Event:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         mapNotify: event = ( |
            | 
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         mappingNotify: event = ( |
            | 
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: queueing\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesReady = ( |
            | msgQueue isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         motionNotify: event = ( | {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 args.
                } 
            | 
            args: vector copySize: 2.
            args at: 0 Put: event x @ event y.
            args at: 1 Put: event.
            queue: 'cursorMovedTo:Event:' With: args.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         next = ( |
            | msgQueue removeFirst send).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         cursorMovedTo: pos Event: event = ( |
            | updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         keyDown: keycode String: str At: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         keyUp: keycode String: str At: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         leftButtonDownAt: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         leftButtonUpAt: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         middleButtonDownAt: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         middleButtonUpAt: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         rightButtonDownAt: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         rightButtonUpAt: pos Event: event = ( |
            | 
            updateCursorAndDeleteEvent: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         updateCursorAndDeleteEvent: event = ( |
            | 
            window updateCursor: event.
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         windowChanged: rect Event: event = ( |
            | event delete. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         windowExposed: rect Last: last Event: event = ( |
            | event delete. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> 'nullTarget' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         windowQuit: win Event: event = ( |
            | event delete. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         otherEvent: event = ( |
            | 
            warning: 'unknown X event received'.
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'ModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventWatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot'
        
         processMotionEvents: doBlock While: whileBlock = ( | {
                 'ModuleInfo: Module: eventHandler InitialContents: FollowSlot'
                
                 nonX.
                } 
            | 
            nonX: list copyRemoveAll.
            whileBlock whileTrue: [
                doBlock value: window cursor location.
                msgQueue isEmpty ifTrue: [ "for motion blur"
                    doBlock value: window cursor location ].
                collapseMotionEvents: nonX.
            ].
            nonX do: [ | :nx | msgQueue add: nx ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: queueing\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         queue: sel With: args = ( |
            | 
            msgQueue add: message copy receiver: target
                                       Selector: sel
                                      Arguments: args).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: queueing\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         queueIncludes: sel = ( |
            | 
            msgQueue anySatisfy: [ | :m | m selector = sel ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: queueing\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         removeMessages: str = ( |
            | 
            msgQueue filterOut: [ | :m | m selector = str ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         reparentNotify: event = ( |
            | 
            event delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'queueingEventHandler' -> () From: ( | {
         'Category: eventDispatching\x7fModuleInfo: Module: eventHandler InitialContents: FollowSlot\x7fVisibility: public'
        
         unmapNotify: event = ( |
            | 
            event delete.
            self).
        } | ) 



 '-- Side effects'

 globals modules eventHandler postFileIn
