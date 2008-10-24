 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         slotButton = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'slotButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'slotButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules slotButton.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         slotButton = bootstrap define: bootstrap stub -> 'globals' -> 'slotButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals menuButton copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotButton.

CopyDowns:
globals menuButton. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         cluster <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         oldSlot <- bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         slotButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         annotating* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationHolder = ( |
            | slotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         assignmentSlotInfo = ( |
            | container assignmentSlotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         basicName = ( |
            | slot basicName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         createMethodFor: sel = ( |
             literals = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
             method.
            | 
            method: mirrors method
                createOuterMethod_Bytecodes: (byteVector copyAddFirst: bytecodeFormat mostRecentSelfInstructionSet bytecodeNamed: 'pushSelf')
                                   Literals: literals
                                       File: '<spontaneous>'
                                       Line: 1 
                                     Source: 'self'.
            (selector copyStr: sel) numberOfArguments do: [ | :i. n |
               n: ('arg', i printString) canonicalize.
               method:
                 (
                  ((method copyAt: n PutContents: mirrors slots) at: n)
                   copyHolderForIsArgument: true
                 ) holder.
            ].
            method).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         createOn: sn = ( |
            | 
            container: sn.
            makeItems: slotInfo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         edit = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 se.
                } 
            | 
            "Popup a slot editor"
            oldSlot: slotInfo.
            se: slotEditor copyOn: world
                            Size: (body size x@ 80)
                              Do: [ | :e | e name: 'Add slot'.
                                           e receiver: body objMirror ].
            se methodView setText: slotString.
            se successMessage: message copy receiver: self 
                                            Selector: 'successfulSlotEdit:'.
            se failMessage: message copy receiver: self 
                                         Selector: 'failedSlotEdit'.
            world addBodyOnTop: se.
            se location: body location + (0@body size y).
            se constrainFullBodyToWorld.
            se swoopDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         editString = 'edit...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         evaluate: string = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 actString.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 p.
                } 
            | 
            actString: '((reflect: (| x = ' , string.
            actString: actString , '. |)) slotAt: \'x\') contents'.
            p: process copySend:
            message copy receiver: actString
                         Selector: 'evalInContext:FileName:'
                             With: (reflect: shell)
                             With: '<text window>'.
            p causeOfBirth: actString.
            p resume.
            p waitForSuspension.
            p returnValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         failedSlotEdit = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findAssnImplementors = ( |
            | findImplementorsOf: slot assignmentName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findAssnSenders = ( |
            | findSendersOf: slot assignmentName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findImplementors = ( |
            | findImplementorsOf: slot basicName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findImplementorsOf: name = ( |
             blueprint = boxBlueprint copy showWellKnownIndexableSlots.
             enum.
             limit = 100.
             type = 'implementors'.
            | 
            enum: browseWellKnown implementorsOf: name.
            body sproutEnumeration: enum
                              Type: type
                         Blueprint: blueprint
                          SlotName: name
                           FromCpt: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findMessages = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: InitializeToExpression: (boxBlueprint copy showOtherSlots)'
                
                 blueprint = boxBlueprint copy showOtherSlots.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 enum.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 type = 'messages'.
                } 
            | 
            enum: reflect: messagesOf: slotInfo value.
            body sprout: enum Blueprint: blueprint FromCpt: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findSenders = ( |
            | findSendersOf: slot basicName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findSendersOf: name = ( |
             blueprint = boxBlueprint copy showSendersSlots.
             enum.
             limit = 100.
             type = 'senders'.
            | 
            enum: browseWellKnown sendersOf: name.
            body sproutEnumeration: enum
                              Type: type
                         Blueprint: blueprint
                          SlotName: name
                           FromCpt: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         hideSlot = ( |
            | container hide).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         hideString = 'hide'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         implementorsAssnString = ( |
            | 'implementors of ', slot assignmentName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         implementorsSimpleString = 'implementors'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         implementorsString = ( |
            | 'implementors of ', slot basicName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         isMethod = ( |
            | slotInfo isMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         isStringAMethod: s = ( |
            | s first = '(').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         joinCluster: clust = ( |
            | 
            clust add: self.
            cluster: clust.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         makeConstant = ( |
            | 
            slotInfo contents isReflecteeMethod ifTrue: [ | slotName. cont. |
                slotName: slotInfo name.
                body objMirror removeSlot: slotInfo key.
                body objMirror printLine.
                body objMirror at: slotName PutContents: reflect: nil.
            ] False: [
                body objMirror removeSlot: 
                    slotInfo correspondingAssignmentSlot key.
            ].
            body update.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         makeItems: slot = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 ann.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 doubleSlot.
                } 
            | 
            doubleSlot:  preferences mergeAssignmentSlots && [slot isAssignable].
            menuItems: menuItems copyRemoveAll.

            [ |s|
                s: showImplementorString. s isEmpty ifFalse: [menuItems add: s].
                s: showSenderString.      s isEmpty ifFalse: [menuItems add: s].
            ] value.

            container isFakeSlot ifFalse: [
                menuItems add: editString.
            ].
            menuItems add: editCommentString.
            menuItems add: editCategoryString.
            menuItems add: editModuleString.
            menuItems add: hideString.
            container isFakeSlot ifFalse: [
                doubleSlot ifTrue: [
                    menuItems add: implementorsString.
                ] False: [
                    menuItems add: implementorsSimpleString.
                ].
            ].
            doubleSlot ifTrue: [
                menuItems add: implementorsAssnString.
            ].
            container isFakeSlot ifFalse: [
                doubleSlot ifTrue: [
                    menuItems add: sendersString. 
                ] False: [
                    menuItems add: sendersSimpleString. 
                ].
            ].
            doubleSlot ifTrue: [
                menuItems add: sendersAssnString.
            ].
            slot isMethod ifTrue: [
                menuItems add: messagesString. 
            ].
            container isFakeSlot ifFalse: [
                doubleSlot ifTrue: [
                    menuItems add: removeString.
                    menuItems add: removeAssnString.
                ] False: [
                    menuItems add: removeSimpleString
                ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         makeVariable = ( |
            | 
            slotInfo contents isReflecteeMethod ifTrue: [ | slotName. |
                slotName: slotInfo name.
                body objMirror removeSlot: slotInfo key.
                body objMirror at: slotName      PutContents: reflect: nil.
            ].
            body objMirror at: slotInfo name, ':' PutContents: mirrors assignment.

            body update.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         messageObj = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotButton' -> 'messageObj' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotButton messageObj.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> 'messageObj' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fComment: return mirror of object containing 1 slot for
	   each message sent from method reflected by mirr\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         messagesOf: mirr = ( |
             obj.
            | 
            obj: reflect: messageObj copy.

            obj at: 'printString'
               PutContents: reflect: ('messages sent by ', slot basicName).

            mirr messagesDo: [ | :msg |
             "exclude primitives, and slots already added -- dmu"
                (msg first = '_') || [ obj names includes: msg ] ifFalse: [
                    obj at: msg PutContents: createMethodFor: msg ]
            ].
            obj reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         messagesString = 'messages sent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( |
            | boxSizing minSlotButtonSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menuButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         recreate = ( |
            | makeItems: slotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         removeAssignmentSlot = ( |
            | 
            programmingLog removeSlot: assignmentSlotInfo.
            container removeAssignmentSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         removeAssnString = ( |
            | 'remove ', slot assignmentName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         removeSimpleString = 'remove'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         removeSlot = ( |
            | 
            programmingLog removeSlot: slotInfo.
            container removeSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         removeString = ( |
            | 'remove ', slot basicName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         renameSlotTo: s = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: InitializeToExpression: (list copyRemoveAll)'
                
                 args <- list copyRemoveAll.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 i <- 0.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 newName <- ''.
                } 
            | 
            "complicated by need to parse args"
            args: args copy.
            [|:e. a <- ''. |
                [(s at: i IfAbsent: e) isAllWhiteSpace] whileTrue: [i: i succ].

                [(s at: i IfAbsent: e) isAllWhiteSpace] whileFalse: [
                    newName: newName, (s at: i).
                    i: i succ.
                ].
                [(s at: i IfAbsent: e) isAllWhiteSpace] whileTrue: [i: i succ].

                [(s at: i IfAbsent: ' ') isAllWhiteSpace ] whileFalse: [
                    a: a, (s at: i).
                    i: i succ.
                ].
                args addLast: a.
            ] loopExit.

            slotInfo contents arguments = args ifTrue: [
                slotInfo name: newName.
            ] False: [ | m |
                m: slotInfo contents.
                slotInfo contents arguments do: [|:a| 
                    m: (m at: a) copyHolderForRemove.
                ].
                args do: [|:a| 
                  m: ((m at: a Put: mirrors slots) copyHolderForIsArgument: true) holder.
                ].
                slotInfo name: newName Contents: m.
            ].
            myUI update: slotInfo holder.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonAccept = ( |
            | 
            drawPressed.
            hideSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
            cursor shiftKeyDown ifTrue: [ removeSlot ]
                                 False: [ 
                body raise.
                world display.
                rightButton.rightButtonDown. 
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonReject = ( |
            | drawUnpressed. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         select: sel FixGraphics: fixGraphics = ( |
            | 
            hideString = sel ifTrue: [ ^ hideSlot "(don't fixGraphics)" ].
            (implementorsString = sel) || (implementorsSimpleString = sel)
              ifTrue: [ findImplementors ].
            (sendersString = sel) || (sendersSimpleString = sel)
              ifTrue: [ findSenders ].
            (removeString       = sel) || (removeSimpleString = sel)
              ifTrue: [ ^ removeSlot "(don't fixGraphics)" ].
            messagesString     = sel ifTrue: [ findMessages ].
            editString         = sel ifTrue: [ edit ].
            editCategoryString = sel ifTrue: [ editCategory ].
            editCommentString  = sel ifTrue: [ editComment ].
            editModuleString   = sel ifTrue: [ editModule ].
            preferences mergeAssignmentSlots && [slot isAssignable] ifTrue: [
                implementorsAssnString = sel ifTrue: [ findAssnImplementors ].
                sendersAssnString      = sel ifTrue: [ findAssnSenders ].
                removeAssnString       = sel ifTrue: [ ^ removeAssignmentSlot "(don't fixGraphics)" ].
            ].
            showImplementorString = sel ifTrue: [ showImplementor].
            showSenderString      = sel ifTrue: [ showSender].
            fixGraphics value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         sendersAssnString = ( |
            | 'senders of ', slot assignmentName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         sendersSimpleString = 'senders'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         sendersString = ( |
            | 'senders of ', slot basicName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         showImplementor = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 bod.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 bp.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 hackPrefix = 'implementors of '.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 n.
                } 
            | 
            bp: boxBlueprint copy.
            bp hideOtherSlots.
            bod: body sprout: slotInfo contents Blueprint: bp FromCpt: slot.
            n: body name copyFrom: hackPrefix size.
            bod showContentsOf: n IfAbsent: [^ self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         showImplementorString = ( |
            | 
            "if not applicable, return empty string--dmu"
             ('implementors of ' isPrefixOf: body name) && [slotInfo isVectorElement]
                 ifTrue: 'show implementor' False: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         showSender = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 bod.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 bp.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 n.
                }  {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 sendingSlot.
                } 
            | 
            bp: boxBlueprint copy.
            bp hideOtherSlots.
            sendingSlot: slotInfo contents reflectee.
            bod: body sprout: sendingSlot holder Blueprint: bp FromCpt: slot.
            n: sendingSlot name.
            bod showContentsOf: n IfAbsent: [^ self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         showSenderString = ( |
            | 
            "if not applicable, return empty string--dmu"
             ('senders of ' isPrefixOf: body name) && [slotInfo isVectorElement]
                 ifTrue: 'show sender' False: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         slot = ( |
            | container slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: public'
        
         slotInfo = ( |
            | container slotInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         slotString = ( |
            | 
            (slot isAssignable  ifTrue: [
              slotInfo basicPrintStringAssignable
            ] False: [
              slotInfo basicPrintStringSize: maxSmallInt
            ]) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot'
        
         successfulSlotEdit: objMirr = ( | {
                 'ModuleInfo: Module: slotButton InitialContents: FollowSlot'
                
                 newObjMirr.
                } 
            | 
            "Called from the textEditor"
            "Remove the old slot"
            newObjMirr: slotInfo copyHolderForRemove.

            objMirr do: [|:s| 
              newObjMirr: newObjMirr copyAddSlot: 
                s copyHolderForAnnotation: slotInfo annotation.
            ].

            objMirr size = 1 ifTrue: [
               programmingLog changeSlot: objMirr first From: oldSlot
            ] False: [
               programmingLog removeSlot: oldSlot.
               objMirr do: [|:s| programmingLog addSlot: s].
            ].
            body objMirror defineAndSave: newObjMirr.
            body update.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         textEditorLocation = ( |
            | slot contents absoluteLocation).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: slotButton InitialContents: FollowSlot\x7fVisibility: private'
        
         visibility: v = ( |
            | container visibility: v).
        } | ) 



 '-- Side effects'

 globals modules slotButton postFileIn
