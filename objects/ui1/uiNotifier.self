 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: public'
        
         messageCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'messageCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals messageCpt.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: public'
        
         uiNotifier = bootstrap define: bootstrap stub -> 'globals' -> 'uiNotifier' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals boxBody copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiNotifier' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiNotifier.

CopyDowns:
globals boxBody. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         container <- bootstrap stub -> 'globals' -> 'uiNotifier' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         location <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         message <- 'Greetings'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: public'
        
         messageCpt = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits messageCpt.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'messageCpt' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         size <- (1)@(1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         uiNotifier = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiNotifier.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            uiNotifier msg: messageCpt.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         alarm <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiNotifier' -> 'alarm' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiNotifier alarm.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> 'alarm' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         interval <- 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> 'alarm' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         mesg <- bootstrap stub -> 'globals' -> 'message' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> 'alarm' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ping' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> 'alarm' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         pingProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> 'alarm' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         stopping <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         dismissButton <- bootstrap stub -> 'globals' -> 'button' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         dismissPresent <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: InitializeToExpression: (nil)'
        
         msg <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiNotifier InitialContents: FollowSlot\x7fVisibility: public'
        
         uiNotifier = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiNotifier.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNotifier' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         bottomMargin = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         draw = ( |
            | 
            drawBodyEtchedRectangle: bound.
            drawText.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         drawAlert = ( |
            | 
            drawBodyFilledRectangle: bound Color: uiColors bodyLight.
            drawBodyRectangle: bound squinch Color: uiColors bodyDark.
            drawText.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         drawText = ( |
            | 
            drawBodyText: message At: textLocation Font: textFont.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         leftMargin = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         marginSize = ( |
            | (leftMargin + rightMargin) @ (topMargin + bottomMargin)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uiNester' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         resizeMinWidth: mw = ( | {
                 'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: marginSize + textSize.
            size: (s x max: mw) @ s y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         rightMargin = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         textFont = ( |
            | boxSizing boxFont).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         textLocation = ( |
            | leftMargin @ topMargin).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         textSize = ( |
            | textFont sizeOfString: message).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messageCpt' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         topMargin = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         addDismiss = ( |
            | 
            dismissButton: (button copySize: dismissSize) name: 'Dismiss'.
            dismissButton command: ( |
               p* = traits clonable.
               note.
               doIt: context = (
                   note stopAlarm.
                   note banish.
                   self ).
               doIt: context Shift: shift = (doIt: context).
            | ) copy note: self.
            dismissButton container: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         bottomMargin = 6.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         byebye = ( |
            | banish).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         componentsDo: block = ( |
            | 
            block value: msg.
            dismissPresent ifTrue: [ block value: dismissButton ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         copyOn: wrld Message: msg At: pt Time: t = ( |
            | 
            (copyOn: wrld) createMessage: msg At: pt Time: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         copyPersistOn: wrld Message: msg At: pt = ( |
            | 
            ((copyOn: wrld) createPersistMessage: msg At: pt) makePersistent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         copySyncOn: wrld Message: msg At: pt = ( |
            | 
            copySyncOn: wrld Message: msg At: pt
              Time: preferences notifierWaitTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         copySyncOn: wrld Message: msg At: pt Time: t = ( |
            | 
            "sychronously add uiNotifier"
            wrld myUI send: 'copyOn:Message:At:Time:'
                        To: self
                      Args: (wrld & msg & pt & t) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         createMessage: m At: pt Time: t = ( |
            | 
            createPersistMessage: m At: pt.
            setAlarm: t.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         createPersistMessage: m At: pt = ( |
            | 
            msg: (messageCpt copy container: self ) message: m.
            msg resizeMinWidth: dismissSize x.
            msg location: messageLocation.

            resize: sizeWithMessageSize: msg size.
            dismissButton offset: dismissLocationWithMessageSize: msg size.

            draw.
            msg drawAlert.
            location: pt.
            world addBodyOnTop: self.
            constrainFullBodyToWorld.
            swoopDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         dismissLocationWithMessageSize: msz = ( |
            | 
            leftMargin @ (size y - bottomMargin - dismissSize y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         dismissSize = (65)@(16).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         leftButtonDown = ( |
            | 
            persist.
            resend.leftButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         leftMargin = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         makePersistent = ( |
            | 
            dismissPresent: true.
            addDismiss.
            draw.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         marginSize = ( |
            | 
            (leftMargin + rightMargin) @
            (topMargin + messageDismissGap + bottomMargin)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         messageDismissGap = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         messageLocation = ( |
            | boxFaceOffset + (leftMargin @ topMargin)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         middleButtonDown = ( |
            | 
            persist.
            resend.middleButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         minWidth = ( |
            | 
            leftMargin + dismissSize x + rightMargin + boxSizing baseSideFaceWidth).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'boxBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         persist = ( |
            | 
            stopAlarm.
            makePersistent.
            display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         resproutOn: wrld = ( |
            | 
            copyPersistOn: wrld Message: msg message At: location).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         rightButtonDown = ( |
            | 
            persist.
            resend.rightButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         rightMargin = 4.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         setAlarm: secs = ( |
            | 
            alarm: ping copyMessage: (message copy receiver: myUI Selector: 'send:To:' With: 'wakeup' With: self)
                     SingleInterval: secs * 1000).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         setFinalAlarm = ( | {
                 'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
                
                 msecs = 1000.
                } 
            | 
            alarm: ping copyMessage: (message copy receiver: myUI Selector: 'send:To:' With: 'byebye' With: self)
                     SingleInterval: msecs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         sizeWithMessageSize: msz = ( | {
                 'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
                
                 s.
                } 
            | 
            s: boxDepthSize + marginSize + msz.
            (s x max: minWidth) @ (s y + dismissSize y)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         stopAlarm = ( |
            | alarm stop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         topMargin = 5.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiNotifier' -> () From: ( | {
         'ModuleInfo: Module: uiNotifier InitialContents: FollowSlot'
        
         wakeup = ( |
            | 
            draw.
            raiseFadeIn.
            world display.
            setFinalAlarm.
            self).
        } | ) 



 '-- Side effects'

 globals modules uiNotifier postFileIn
