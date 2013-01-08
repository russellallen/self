 'Sun-$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         objectButton = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'objectButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'objectButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules objectButton.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         objectButton = bootstrap define: bootstrap stub -> 'globals' -> 'objectButton' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals menuButton copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objectButton.

CopyDowns:
globals menuButton. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: InitializeToExpression: (list copyRemoveAll)\x7fVisibility: private'
        
         cluster <- list copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         objectButton = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectButton.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         accept = ( |
            | body accept).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         acceptString = 'accept'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         addSendString = 'add \"send\" item...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         addSlot = ( | {
                 'ModuleInfo: Module: objectButton InitialContents: FollowSlot'
                
                 se.
                } 
            | 
            "Popup a slot editor"
            se: slotEditor copyOn: world
                            Size: (body size x@ 80)
                              Do: [ | :e | e name: 'Add slot'.
                                           e receiver: container objMirror ].
            se successMessage: message copy receiver: self 
                                            Selector: 'successfulAddSlot:'.
            se failMessage: message copy receiver: self 
                                         Selector: 'failedAddSlot'.
            world addBodyOnTop: se.
            se location: body location + (0@body size y).
            se constrainFullBodyToWorld.
            se swoopDown.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         addSlotString = 'add slot...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         addUnaryMessage = ( |
            | 
            openTextEditorSelecting: 'unaryMessage' 
                               Name: 'Enter name of unary message'
                              Apply: 'addUnaryMessage:'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         addUnaryMessage: str = ( |
            | 
            str asSelector isUnary ifFalse: [
                uiNotifier copySyncOn: world
                              Message: 'Not a valid unary message'
                                   At: body location + body size.
                ^ false ].
            body addMessage: str.
            world alterBody: body By: [ body recreateCentered ].
            world display.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         annotating* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'annotationButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: annotating\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationHolder = ( |
            | body objMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         childrenString = 'children'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         createItems = ( |
            | 
            menuItems: list copyRemoveAll.

            body objMirror isReflecteeMethod ifFalse: [
                "eval doesn't work for methods yet"
                menuItems add: evalString.
            ].

            menuItems add: findString.

            body objMirror areReflecteesSlotsMutable ifTrue: [
                menuItems add: addSlotString.
            ].

            body objMirror isReflecteeMethod ifFalse: [
                menuItems add: addSendString.
            ].

            menuItems add: referencesString.
            menuItems add: childrenString.
            menuItems add: editCommentString.
            menuItems add: editModuleString.
            menuItems add: dropString.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         createOn: ob = ( |
            | 
            container: ob.
            createItems.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteBody = ( |
            | body delete. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         dissolveBody = ( |
            | body dissolve).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         dropBody = ( |
            | body banish).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         dropString = 'dismiss'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         editString = 'edit...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         evalString = 'evaluator...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         failedAddSlot = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findChildren = ( |
             blueprint = boxBlueprint copy showWellKnownIndexableSlots.
             enum.
             limit = 100.
             type = 'children'.
            | 
            enum: browseWellKnown childrenOfReflectee: body objMirror.
            body sproutEnumeration: enum
                              Type: type
                         Blueprint: blueprint
                          SlotName: ''
                           FromCpt: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         findReferences = ( |
             blueprint = boxBlueprint copy showWellKnownIndexableSlots.
             enum.
             limit = 100.
             type = 'references'.
            | 
            enum: browseWellKnown referencesOfReflectee: body objMirror.
            body sproutEnumeration: enum
                              Type: type
                         Blueprint: blueprint
                          SlotName: ''
                           FromCpt: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         findString = 'find slot...'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         joinCluster: clust = ( |
            | 
            clust add: self.
            cluster: clust.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'middleButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonAccept = ( |
            | 
            drawPressed.
            cursor metaKeyDown ifTrue: [ dissolveBody ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         middleButtonDown = ( | {
                 'ModuleInfo: Module: objectButton InitialContents: FollowSlot'
                
                 disabled = bootstrap stub -> 'globals' -> 'true' -> ().
                } 
            | 
            disabled ifTrue: [ ^ self ].
            body raise.
            world display.
            middleButton.middleButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonReject = ( |
            | drawUnpressed. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: sizing\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         minSize = ( |
            | boxSizing minObjectButtonSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'ModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'menuButton' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         popEvalEditor: contents = ( | {
                 'ModuleInfo: Module: objectButton InitialContents: FollowSlot'
                
                 te.
                } 
            | 
            te: world sproutTypeInFor: body Contents: contents.
            te swoopDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         promptFindSlot = ( |
            | 
            openTextEditorSelecting: '' Name: 'Slot to find' Apply: 'sproutToSlot:'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuStrings\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot'
        
         referencesString = 'references'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButton* = bootstrap stub -> 'mixins' -> 'userInterface' -> 'rightButtonCluster' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonAccept = ( |
            | drawPressed. dropBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: public'
        
         rightButtonDown = ( |
            | 
            body raise.
            world display.
            rightButton.rightButtonDown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingAccept: change = ( |
            | 
            change ifTrue: [ animatedDrawPressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonPendingReject: change = ( |
            | 
            change ifTrue: [ animatedDrawUnpressed ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: buttoning\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         rightButtonReject = ( |
            | drawUnpressed. world display).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: menuing\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         select: sel FixGraphics: fixGraphics = ( |
            | 
            dropString = sel ifTrue: [ ^ dropBody "(don't fixGraphics)" ].
            evalString       = sel ifTrue: [ popEvalEditor: '' ].
            findString       = sel ifTrue: [ promptFindSlot ].
            addSlotString    = sel ifTrue: [ addSlot ].
            addSendString    = sel ifTrue: [ addUnaryMessage ].
            referencesString = sel ifTrue: [ findReferences ].
            childrenString   = sel ifTrue: [ findChildren ].

            editCommentString = sel ifTrue: [ editComment ].
            editModuleString  = sel ifTrue: [ editModule ].    
            fixGraphics value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutToSlot: str = ( |
            | body sproutToSlot: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         successfulAddSlot: objMirr = ( | {
                 'ModuleInfo: Module: objectButton InitialContents: FollowSlot'
                
                 newObjMirr.
                } 
            | 
            "Called from the textEditor"
            newObjMirr: body objMirror.
            objMirr do: [|:s|
              newObjMirr: newObjMirr copyAddSlot: s.
              programmingLog addSlot: s.
            ].
            body objMirror defineAndSave: newObjMirr.
            body update.
            world display.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectButton' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: objectButton InitialContents: FollowSlot\x7fVisibility: private'
        
         textEditorLocation = ( |
            | body location + (0 @ body size y)).
        } | ) 



 '-- Side effects'

 globals modules objectButton postFileIn
