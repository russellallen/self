 '$Revision: 30.7 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: Smalltalk\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         listMenu = bootstrap define: bootstrap stub -> 'globals' -> 'listMenu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals ui2Menu copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'listMenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals listMenu.

CopyDowns:
globals ui2Menu. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> () From: ( | {
         'Category: list menu state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         middleButtonMenu.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'listMenu' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals listMenu parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
             m.
             wrld.
            | 
            wrld: world.
            evt sourceHand unsubscribeCursor: self.

            "check that the menu has been put into the world"
            " and has been up long enough "
            " I would have liked to use the event timestamp,
              but x event timestamps are broken -- dmu "

            "This was copied from code in ui2Menu which has since
             been changed to work better on the Mac. -- dmu 9/99"

                ( ( wrld morphsAt: evt cursorPoint) includes: self )
            && [  ( time current - popUpTime ) > 200  ] 
              ifFalse: [
                 nil = markedButton ifFalse: [ 
                   unmarkButton: markedButton.
                   markedButton: nil.
             ].
            ].

            (owner = wrld) && [nil != markedButton] ifTrue: [ markedButton flash ].

            markedButton = tearOffButton ifFalse: [
                defaultButtonHolder rememberButton: markedButton In: self.
                popDown. wrld displayUpdateNow.
            ].
            markedButton = nil ifFalse: [
                markedButton leftMouseUp: evt.
                "unmarkButton: markedButton."
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
             l.
             menu.
            | 
            middleButtonMenu = nil ifTrue: [^self].
            menu: middleButtonMenu copy.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'listMenu'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Menu' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         setSelection: s = ( |
            | 
            buttons
              findFirst: [|:b| b label = s]
              IfPresent: [|:b| b != markedButton ifTrue: [markButton: b]]
               IfAbsent: [nil = markedButton ifFalse: [unmarkButton: markedButton]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenu' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            listMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: applications\x7fCategory: Smalltalk\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         listMenuItem = bootstrap define: bootstrap stub -> 'globals' -> 'listMenuItem' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals ui2Button copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'listMenuItem' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals listMenuItem.

CopyDowns:
globals ui2Button. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenuItem' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'listMenuItem' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals listMenuItem parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenuItem' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         actionThenRaiseEvent: evt = ( |
            | 
            "forked from leftMouseUp:"
            updateInstalledScript.
            buttonActionObject event: evt From: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenuItem' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultFontName = ( |
            | scalableFont helvetica).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenuItem' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            evt sourceHand unsubscribeCursor: self.
            isGrayedOut ifTrue: [ ^self ].
            (globalBounds includes: evt cursorPoint) ifTrue: [
              "state: 'middle'."
              isAsynchronous 
                ifFalse: [ actionThenRaiseEvent: evt ]
                 True:   [ (message copy receiver: self 
                                         Selector: 'actionThenRaiseEvent:' 
                                             With: evt
                           ) forkForBirthEvent: evt].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenuItem' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'listMenuItem'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenuItem' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Button' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'listMenuItem' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | ui2Button).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         smalltalkUI = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules smalltalkUI.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/smalltalk'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            transporter moduleDictionary resetFillingSemaphore.
            snapshotAction addSchedulerInitialMessage:  
              message copy receiver: transporter moduleDictionary
                           Selector: 'resetFillingSemaphore'.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'smalltalkUI' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: The prototypical browser.\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         browser = bootstrap define: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator browser.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         categoryPaneMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         classButton <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         className <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         classObj.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         classPaneMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         editPane <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         instanceButton <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fComment: The Self version of rawSelector\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         mappedSelector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         methodObj.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fComment: A vector of the list panes.\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         panes <- bootstrap stub -> 'globals' -> 'vector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator browser parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         accept: source Event: evt = ( |
             class.
             isClass.
             sel.
            | 
            (category isEmpty) || [className isEmpty] || [protocol isEmpty] ifTrue: [
              "assume it's a class template"
              isClass: true.
              class: smalltalkEmulator evaluate: source
            ] False: [
              "it's a method"
              isClass: false.
              sel: classObj addMethodSource: source Protocol: protocol.
            ].
            editPane panel isActive: false.
            isClass ifTrue: [
              updateCategoryPane. "might be a new category"
              category: class class_category Event: evt.
              class: class self_name Event: evt.
            ] False: [
              updateSelectorPane. "might be a new method"
              selector: sel Event: evt.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'acceptAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator browser parent acceptAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'acceptAction' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target accept: source contentsString Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'acceptAction' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: protocol pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         askUserForNewProtocol: event = ( |
             proto.
            | 
            proto: userQueryMorph 
                     askString: 'New protocol?'
                 DefaultAnswer: 'accessing'
                         Event: event.
            proto isEmpty ifTrue: [^self].
            classObj addMethodSource: newMethodTemplate Protocol: proto.
            updateProtocolPane.
            protocol: proto Event: event.
            selector: newMethodSelector Event: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            new: resend.baseCopy.
            new panes: panes copy.
            new categoryPaneMenu: categoryPaneMenu copy retargetButtonsTo: new.
            new    classPaneMenu:    classPaneMenu copy retargetButtonsTo: new.
            new protocolPaneMenu: protocolPaneMenu copy retargetButtonsTo: new.
            new selectorPaneMenu: selectorPaneMenu copy retargetButtonsTo: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: instance/class buttons\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildButtons = ( |
             bRow.
            | 
            bRow:  rowMorph copy.
            bRow beShrinkWrap.
            bRow borderWidth: 0.

            instanceButton: radioButton copyTarget: self Action: instanceButtonAction.
               classButton: radioButton copyTarget: self Action:    classButtonAction.

            bRow addMorphLast:  instanceButton.
            bRow addMorphLast:  labelMorph copyLabel: ' instance  '.
            instanceButton isDown: true.
            bRow addMorphLast:  classButton.
            bRow addMorphLast:  labelMorph copyLabel: ' class '.

            bRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: category pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCategoryPaneMenu = ( |
             m.
            | 
            m: ui2Menu copy.
            m addButtonTarget: self
             Script: 'target updateCategoryPane. target category: \'\' Event: event'
             Label: 'update'.
            m colorAll: smalltalkEmulator standardColor.
            categoryPaneMenu: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: class pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildClassPaneMenu = ( |
             m.
            | 
            m: ui2Menu copy.
            m    addButtonTarget: self
              AsynchronousScript: 'target askUserForNewProtocol: event'
                           Label: 'add protocol'.
            m addButtonTarget: self 
                       Script: 'target removeClass: event'
                        Label: 'remove'.
            m colorAll: smalltalkEmulator standardColor.
            classPaneMenu: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildEditPane = ( |
            | 
            editPane:
              uglyMethodEditorMorph copyString: ''
                                        Target: self
                                        Accept: acceptAction
                                        Cancel: cancelAction
                                         Style: smalltalkEmulator preferences.
            editPane beRigid borderWidth: 3.
            editPane setWidth: 600 Height: 200.
            editPane text middleButtonMenu: smalltalkEmulator textMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildMenuItems: items Script: script Target: target Menu: mbMenu = ( |
             menu.
            | 
            menu: listMenu copyRemoveAllMorphs.
            menu color: target color.
            menu beFlexibleHorizontally.
            menu borderWidth: 0.
            menu middleButtonMenu: mbMenu.
            items sort do: [| :item. but. |
              but:  listMenuItem copy.
              but label: item.
              but leftJustify.
              but script: script.
              but target: target.
              but color: target color.
              menu addButton: but.
            ].
            menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildPaneMenus = ( |
            | 
            buildCategoryPaneMenu.
            buildClassPaneMenu.
            buildProtocolPaneMenu.
            buildSelectorPaneMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: protocol pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildProtocolPaneMenu = ( |
             m.
            | 
            m: ui2Menu copy.
            m    addButtonTarget: self
              AsynchronousScript: 'target askUserForNewProtocol: event'
                           Label: 'add'.
            m colorAll: smalltalkEmulator standardColor.
            protocolPaneMenu: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: selector pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSelectorPaneMenu = ( |
             m.
            | 
            m: ui2Menu copy.
            m addButtonTarget: self Script: 'target removeSelector: event' Label: 'remove'.
            m colorAll: smalltalkEmulator standardColor.
            selectorPaneMenu: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         cancel: src Event: evt = ( |
            | 
            updateEditPane: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'cancelAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator browser parent cancelAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'cancelAction' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancel: source contentsString Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'cancelAction' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: protocol pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         categoriesForObject: o = ( |
             cats.
            | 
            cats: set copyRemoveAll.
            (reflect: o) do: [| :slot. cat |
              cat: slot category.
              cat isEmpty ifFalse: [cats add: cat].
            ].
            cats asVector sort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | rawCategory).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         category: cat Event: e = ( |
            | 
            (cat = category) || [checkUpdate: e] ifFalse: [^self].
            rawCategory: cat.
            updateSelectionInPane: categoryPane To: cat.
            class: '' Event: e.
            updateClassPane).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: category pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         categoryPane = ( |
            | panes first).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         categoryTemplate = ( |
            | 
            'Superclass subclass: #NewClassName\n',
            '\tinstanceVariableNames: \'instVar1 instVar2\'\n',
            '\tclassVariableNames: \'ClassVar1 ClassVar2\'\n',
            '\tpoolDictionaries: \'\'\n',
            '\tcategory: \'', category, '\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: updating\x7fComment: Check to see if some state will be discarded, and confirm with the user.
Return true if OK to proceed.\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         checkUpdate: evt = ( |
             se.
            | 
            editPane isCounterfactual ifFalse: [^true].

            se: syntaxErrorMorph
               copyTitle: 'There are unsaved changes.'
                 Message: 'Please accept or cancel them by hitting the green or red button.'.
            safelyDo: [ 
              world addMorph: se.
              world moveToFront: se.
              se globalPosition: editPane globalPosition.
              se changed.
            ].
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         class: n Event: e = ( |
            | 
            (n = className) || [checkUpdate: e] ifFalse: [^self].
            className: n.
            updateSelectionInPane: classPane To: n.
            updateClassObj.
            protocol: '' Event: e.
            updateProtocolPane).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: instance/class buttons\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         classButtonAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'classButtonAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator browser parent classButtonAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'classButtonAction' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         actionFrom: b Target: t Event: e = ( |
            | 
            t mode: 'class' Event: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: class pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         classPane = ( |
            | panes at: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         classTemplate = ( |
             baseClass.
             superName.
             t.
            | 
            baseClass:  smalltalkEmulator global: className.
            superName: 
              (className = 'Object'
                ifTrue: 'nil'
                 False: [baseClass superclass self_name]).

            t:  baseClass object_type.
            case
            if: [t = 'plain'    ] Then: [t: 'subclass:']
            If: [t = 'array'    ] Then: [t: 'variableSubclass:']
            If: [t = 'byteArray'] Then: [t: 'variableByteSubclass:'].

            (superName, ' ', t, ' #', className), 
            '\n\tinstanceVariableNames: \'', baseClass instVars_string,
            '\'\n\tclassVariableNames: \'', baseClass classVars_string,
            '\'\n\tpoolDictionaries: \'\'',
            '\n\tcategory: \'', category, '\'').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         getMethodSource = ( |
            | 
            classObj method_sources
                    at: selector
              IfAbsent: [| header. slotMir. comment. source. |
                header: 
                  'Self method; edit using an outliner on:\n\t"(smalltalkEmulator global: \'',
                  className, '\') ',
                  (mode = 'class' ifTrue: 'class ' False: ''),
                  'instance_methods"'.
                slotMir:  (reflect: methodObj) at: mappedSelector.
                comment:  slotMir comment.
                source: slotMir evalStringAssignable.
                header, '\n\n', 
                  (comment isEmpty ifTrue: '' False: ['"', comment, '"\n\n']),
                  source
              ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: selector pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         getSelectors = ( |
             slotNames.
            | 
            slotNames: set copyRemoveAll.
            (reflect: methodObj) do: [| :slot. n |
                 (slot category = protocol)
              && [n: slot name.  (n includes: '_') not] ifTrue: [
                   slotNames add: (smalltalkEmulator unmapSelector: n)
                 ].
            ].
            slotNames asVector sort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
             bRow.
             catMenu.
             panes.
             proto.
             r.
            | 
            proto:  smalltalkEmulator browser.
            proto removeAllMorphs.
            proto addMorph: 
              (labelMorph copyLabel: 'Smalltalk browser')
              fontSpec: globals fontSpec copyName: 'Helvetica'
                                            Style: 'bold'
                                             Size: 14.

            r: rowMorph copy beFlexible borderWidth: 0.
            panes: list copyRemoveAll.

            bRow: proto buildButtons.

            proto buildEditPane.

            4 do: [| :i. pane. f. |
              f: frameMorph copy beFlexible borderWidth: 2.
              f frameStyle: f insetBezelStyle.
              pane: columnMorph copy.
              pane beFlexible.  pane leftJustify.
              i = 1
                ifFalse: [ f addMorph: pane ]
                   True: [| col. fr. |
                     col:  columnMorph copy.
                     col borderWidth: 0.
                     col addMorphLast: pane.
                     fr: frameMorph copy addMorph: bRow.
                     fr beShrinkWrapVertically beFlexibleHorizontally.
                     fr borderWidth: 2.
                     col addMorphLast: fr.
                     f addMorph: col.
                   ].
              panes addLast: pane.
              r addMorphLast: f.
            ].
            proto panes: panes asVector.

            proto addMorphLast: r.
            proto addMorphLast: proto editPane.

            proto beShrinkWrap borderWidth: 4.
            proto baseMinWidth: 400.
            proto baseMinHeight: 200.
            proto colorAll: smalltalkEmulator standardColor.
            proto buildPaneMenus.
            proto updateCategoryPane.
            proto updateEditPane: process this birthEvent.
            proto).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: instance/class buttons\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         instanceButtonAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'instanceButtonAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator browser parent instanceButtonAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'instanceButtonAction' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot'
        
         actionFrom: b Target: t Event: e = ( |
            | 
            t mode: 'instance' Event: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            panes do: [| :p. :i. |
              dict if: p IsPresentDo: [| :n | panes at: i Put: n ].
            ].
            dict if: instanceButton IsPresentDo: [| :n | instanceButton: n ].
            dict if:    classButton IsPresentDo: [| :n |    classButton: n ].

            dict if: editPane IsPresentDo: [| :n | editPane: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         methodTemplate = ( |
            | 
            'message pattern\n\t| temporaries |\n\tstatements.\n\t^ return value').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         mode = ( |
            | rawMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         mode: m Event: e = ( |
            | 
            (m = mode) || [checkUpdate: e] ifFalse: [^self].
            rawMode: m.
            updateClassObj.
            instanceButton isDown: m = 'instance'.
            classButton isDown: instanceButton isDown not.
            protocol: '' Event: e.
            updateProtocolPane).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: protocol pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         newMethodSelector = 'newMethod:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: protocol pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         newMethodTemplate = ( |
            | 
            newMethodSelector, ' arg\n\t"comment"\n\t| temp |\n\t"statements."\n\t"^ expression"').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         protocol = ( |
            | rawProtocol).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         protocol: p Event: e = ( |
            | 
            (p = protocol) || [checkUpdate: e] ifFalse: [^self].
            rawProtocol: p.
            updateSelectionInPane: protocolPane To: p.
            selector: '' Event: e.
            updateSelectorPane).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: protocol pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         protocolPane = ( |
            | panes at: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: class pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         removeClass: evt = ( |
            | 
            className isEmpty ifTrue: [^self].
            (smalltalkEmulator global: className) remove.
            updateCategoryPane. "in case no more in this category"
            updateClassPane.
            class: '' Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: selector pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         removeSelector: evt = ( |
            | 
            selector isEmpty ifTrue: [^self].
            classObj removeSelector: selector.
            updateProtocolPane. "in case no more in this protocol"
            updateSelectorPane.
            selector: '' Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         selector = ( |
            | rawSelector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         selector: s Event: e = ( |
            | 
            (s = selector) || [checkUpdate: e] ifFalse: [^self].
            rawSelector: s.
            mappedSelector: smalltalkEmulator mapSelector: s.
            updateSelectionInPane: selectorPane To: s.
            updateEditPane: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: selector pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorPane = ( |
            | panes last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: category pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateCategoryPane = ( |
            | 
            updatePaneMenu: categoryPane
                     Items: (smalltalkEmulator categories)
                    Script: 'target category: button label Event: event'
                    Target: self
                      Menu: categoryPaneMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: class pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateClassObj = ( |
            | 
            className isEmpty ifTrue: [^self].
            classObj:  smalltalkEmulator global: className.
            mode = 'class' ifTrue: [
              classObj:  classObj class.
            ].
            methodObj:  classObj instance_methods).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: class pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateClassPane = ( |
            | 
            category isEmpty
              ifTrue: [ classPane removeAllMorphs ]
               False: [
                 updatePaneMenu: classPane
                          Items: (smalltalkEmulator classNamesInCategory: category)
                         Script: 'target class: button label Event: event'
                         Target: self
                           Menu: classPaneMenu
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateEditPane: evt = ( |
            | 
            safelyDo: [
              editPane setText:
                ( category isEmpty   ifTrue: [ ''               ] False: [
                 className isEmpty   ifTrue: [ categoryTemplate ] False: [
                  protocol isEmpty   ifTrue: [    classTemplate ] False: [
                  selector isEmpty   ifTrue: [   methodTemplate ] False: [
                                                getMethodSource ]]]]) detabified: 4.
              editPane panel isActive: false.
            ].
            editPane isInWorld ifTrue: [editPane beTypingFocusFor: evt sourceHand]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updatePaneMenu: pane Items: items Script: script Target: target Menu: mbMenu = ( |
             menu.
            | 
            menu:  buildMenuItems: items
                           Script: script
                           Target: target
                             Menu: mbMenu.
            safelyDo: [
              pane removeAllMorphs.
              pane addMorph: menu.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: protocol pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateProtocolPane = ( |
             classObj.
            | 
            className isEmpty ifTrue: [
              protocolPane removeAllMorphs.
              ^self
            ].
            updatePaneMenu: protocolPane
                     Items: (categoriesForObject: methodObj)
                    Script: 'target protocol: button label Event: event'
                    Target: self
                      Menu: protocolPaneMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSelectionInPane: p To: s = ( |
            | 
            p morphCount > 0 ifTrue: [p morphs first setSelection: s]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> () From: ( | {
         'Category: selector pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSelectorPane = ( |
            | 
            protocol isEmpty ifTrue: [
              selectorPane removeAllMorphs.
              ^self
            ].
            updatePaneMenu: selectorPane
                     Items: getSelectors
                    Script: 'target selector: button label Event: event'
                    Target: self
                      Menu: selectorPaneMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         protocolPaneMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            globals smalltalkEmulator browser).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         rawCategory <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fComment: \'class\' or \'instance\'\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (\'instance\')\x7fVisibility: private'
        
         rawMode <- 'instance'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         rawProtocol <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         rawSelector <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> () From: ( | {
         'Category: Browser state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         selectorPaneMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton:
                ( ( ui2Button copy
                  script: 'smalltalkEmulator getControlPanel: event' )
                   label: 'Smalltalk' )
            ToGroup: 'applications'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: The prototypical control panel (actually a menu)\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         controlPanel <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Get a new control panel\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         getControlPanel: event = ( |
            | 
            controlPanel copy popUp: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Get a system browser\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         getSystemBrowser = ( |
             b.
            | 
            b: browser copy.
            b updateCategoryPane.
            process this birthEvent sourceHand attach: b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Get the transcript into the hand\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         getTranscript = ( |
            | 
            process this birthEvent sourceHand attach: transcript).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Get a new workspace\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         getWorkspace = ( |
             e.
             h.
             t.
             w.
            | 
            w: workspace copy.
            h: process this birthEvent sourceHand.
            h attach: w.
            e: w morphs last.
            e beTypingFocusFor: h).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeControlPanel = ( |
            | 
            controlPanel: ui2Menu copy.
            controlPanel
              addButtonTarget: smalltalkEmulator
                       Script: 'target getSystemBrowser'
                        Label: 'browser'.
            controlPanel
              addButtonTarget: smalltalkEmulator
                       Script: 'target getWorkspace'
                        Label: 'workspace'.
            controlPanel
              addButtonTarget: smalltalkEmulator
                       Script: 'target getTranscript'
                        Label: 'transcript'.
            controlPanel colorAll: browser color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Rebuild all the prototypes from scratch.\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototypes = ( |
            | 
            initializeTextMenu.
            browser initializePrototype.
            initializeWorkspace .
            inspector initializePrototype.
            initializeTranscript.
            initializeControlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeTextMenu = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu addButtonTarget: self Script: 'target copy_cmd'  Label: 'copy'.
            menu addButtonTarget: self Script: 'target cut_cmd'   Label: 'cut'.
            menu addButtonTarget: self Script: 'target paste_cmd' Label: 'paste'.
            menu addDivider.
            menu
                 addButtonTarget: nil "this gets reset elsewhere"
              AsynchronousScript: 'smalltalkEmulator evaluate: target textInSelection'
                           Label: 'do it'.
            menu
                 addButtonTarget: nil "this gets reset elsewhere"
              AsynchronousScript: 'smalltalkEmulator evaluateAndPrint: target textInSelection'
                           Label: 'print it'.
            menu
                 addButtonTarget: nil "this gets reset elsewhere"
              AsynchronousScript:
            'smalltalkEmulator inspect: (smalltalkEmulator evaluate: target textInSelection)'
                           Label: 'inspect it'.
            menu colorAll: standardColor.
            textMenu: menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeTranscript = ( |
            | 
            transcript: workspace copy.
            transcriptText: transcript morphs last.
            transcriptText setWidth: 300 Height: 100.
            report: 'Welcome to Smalltalk-in-Self\n\n'.
            transcript morphs first label: 'Smalltalk transcript'.
            transcript).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeWorkspace = ( |
             e.
            | 
            workspace: frameMorph copy.
            workspace borderWidth: 4.
            workspace addMorph: 
              (labelMorph copyLabel: 'Smalltalk workspace')
              fontSpec: globals fontSpec 
                copyName: 'Helvetica' Style: 'bold' Size: 14.

            e: uglyTextEditorMorph copyString: '' Style: (| color = paint |).
            e beRigid borderWidth: 3.
            e setWidth: 200 Height: 150.
            e text middleButtonMenu: smalltalkEmulator textMenu.

            workspace addMorphLast: e.
            workspace colorAll: smalltalkEmulator standardColor.

            workspace).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: Open an inspector on obj\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         inspect: obj = ( |
            | 
            process this birthEvent sourceHand attach: (inspector copy: obj)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: The prototypical inspector.\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         inspector = bootstrap define: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator inspector.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'Category: Inspector state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         editPane <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'Category: Inspector state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         label <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'Category: Inspector state\x7fComment: The object being inspected.
Use setObject: to change it.\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         obj.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator inspector parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         accept: source Event: evt = ( |
             res.
            | 
            (slotName isEmpty) || [slotName = 'self'] ifTrue: [^self].
            res:
              smalltalkEmulator
                   evaluate: editPane text contentsString 
                   InObject: obj
                PrintResult: false.
            (reflect: obj)
                      at: (smalltalkEmulator mapInstVarName: slotName)
             PutContents: (reflect: res).
            updateEditPane.
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptAction = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'acceptAction' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            new: resend.baseCopy.
            new slotListMenu: slotListMenu copy retargetButtonsTo: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: slot pane\x7fComment: same as method in browser\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildMenuItems: items Script: script Target: target Menu: mbMenu = ( |
             menu.
            | 
            menu: listMenu copyRemoveAllMorphs.
            menu color: target color.
            menu beFlexibleHorizontally.
            menu borderWidth: 0.
            menu middleButtonMenu: mbMenu.
            items do: [| :item. but. |
              but:  listMenuItem copy.
              but label: item.
              but leftJustify.
              but script: script.
              but target: target.
              but color: target color.
              menu addButton: but.
            ].
            menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: slot pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSlotListMenu = ( |
             m.
            | 
            m: ui2Menu copy.
            m addButtonTarget: self Script: 'target inspectSlot' Label: 'inspect'.
            m colorAll: smalltalkEmulator standardColor.
            slotListMenu: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         cancel: src Event: evt = ( |
            | 
            updateEditPane).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelAction = bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'browser' -> 'parent' -> 'cancelAction' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: Make a copy inspecting o.\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         copy: o = ( |
             new.
            | 
            new: copy.
            new setObject: o.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         doIt: str = ( |
            | 
            smalltalkEmulator
                 evaluate: str
                 InObject: obj
              PrintResult: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
             proto.
             row.
            | 
            proto:  smalltalkEmulator inspector.
            proto buildSlotListMenu.
            proto removeAllMorphs.

            proto label:   (labelMorph copyLabel: 'a vacant inspector')
              fontSpec: globals fontSpec copyName: 'Helvetica'
                                            Style: 'bold'
                                             Size: 14.
            proto addMorph: proto label.

            row: rowMorph copy.
            row borderWidth: 0.

            proto slotPane: frameMorph copy.
            proto slotPane frameStyle: insetBezelStyle.
            row addMorph: proto slotPane.

            proto editPane:
              uglyMethodEditorMorph copyString: ''
                                        Target: proto
                                        Accept: acceptAction
                                        Cancel: cancelAction
                                         Style: smalltalkEmulator preferences.

            proto editPane beRigid borderWidth: 0.
            proto editPane setWidth: 150 Height: 200.

            proto editPane text middleButtonMenu: middleButtonMenu.
            row addMorphLast: proto editPane.
            proto addMorphLast: row.

            proto beShrinkWrap borderWidth: 4.
            proto setWidth: 200 Height: 200.
            proto colorAll: smalltalkEmulator standardColor.

            proto).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         inspectIt: str = ( |
            | 
            smalltalkEmulator inspect:
              (smalltalkEmulator
                   evaluate: str
                   InObject: obj
                PrintResult: false)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: slot pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         inspectSlot = ( |
            | smalltalkEmulator inspect: selectedObj).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: editPane IsPresentDo: [| :n | editPane: n ].
            dict if: slotPane IsPresentDo: [| :n | slotPane: n ].
            dict if: label    IsPresentDo: [| :n | label: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         middleButtonMenu = ( |
             menu.
            | 
            menu: ui2Menu copy.
            menu addButtonTarget: self Script: 'target copy_cmd'  Label: 'copy'.
            menu addButtonTarget: self Script: 'target cut_cmd'   Label: 'cut'.
            menu addButtonTarget: self Script: 'target paste_cmd' Label: 'paste'.
            menu addDivider.
            menu
                 addButtonTarget: nil "this gets reset elsewhere"
              AsynchronousScript: 'target root doIt: target textInSelection'
                           Label: 'do it'.
            menu
                 addButtonTarget: nil "this gets reset elsewhere"
              AsynchronousScript: 'target root printIt: target textInSelection'
                           Label: 'print it'.
            menu
                 addButtonTarget: nil "this gets reset elsewhere"
              AsynchronousScript: 'target root inspectIt: target textInSelection'
                           Label: 'inspect it'.
            menu colorAll: smalltalkEmulator standardColor.
            menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         printIt: str = ( |
            | 
            smalltalkEmulator
                 evaluate: str
                 InObject: obj
              PrintResult: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Comment: The object selected (assuming there is one)\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         selectedObj = ( |
            | 
            slotName = 'self'
              ifTrue: [obj]
               False: [
                ((reflect: obj) at: (smalltalkEmulator mapInstVarName: slotName)) contents reflectee
               ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Comment: Set the object under inspection to o.\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         setObject: o = ( |
            | 
            obj: o.
            updateSlotList.
            setSlot: ''.
            label label: 'Smalltalk inspector on ', o class self_name prependAOrAn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         setSlot: n = ( |
            | 
            slotName: n.
            updateEditPane).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: edit pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateEditPane = ( |
            | 
            safelyDo: [
              editPane setText:
                (slotName isEmpty  ifTrue: ''  False: [selectedObj printString asSelfString]
                ) detabified: 4.
              editPane panel isActive: false.
            ].
            "editPane isInWorld ifTrue: [editPane beTypingFocusFor: evt sourceHand]").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: slot pane\x7fComment: same as method in browser\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updatePaneMenu: pane Items: items Script: script Target: target Menu: mbMenu = ( |
             menu.
            | 
            menu:  buildMenuItems: items
                           Script: script
                           Target: target
                             Menu: mbMenu.
            safelyDo: [
              pane removeAllMorphs.
              pane addMorph: menu.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> 'parent' -> () From: ( | {
         'Category: slot pane\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSlotList = ( |
             names.
            | 
            names: sequence copy.
            names add: 'self'.
            names addAllLast: obj class allInstVar_names.

            updatePaneMenu: slotPane
                     Items: names asVector
                    Script: 'target setSlot: button label'
                    Target: self
                      Menu: slotListMenu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            smalltalkEmulator inspector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'Category: Inspector state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         slotListMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'Category: Inspector state\x7fComment: The name of the slot being inspected (empty if none).
Use setSlot: to change it.\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (\'\')\x7fVisibility: public'
        
         slotName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'inspector' -> () From: ( | {
         'Category: Inspector state\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         slotPane <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         preferences = bootstrap define: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'preferences' -> () ToBe: bootstrap addSlotsTo: (
             globals outlinerPreferences _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> 'preferences' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smalltalkEmulator preferences.

CopyDowns:
globals outlinerPreferences. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: The `corporate color\' of the Smalltalk user interface.\x7fModuleInfo: Module: smalltalkUI InitialContents: FollowSlot\x7fVisibility: public'
        
         standardColor = ( |
            | paint copyBrightness: (207.0 / 256.0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: The text menu used by the Smalltalk user interface.\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         textMenu <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: The Smalltalk system transcript.\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         transcript <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smalltalkEmulator' -> () From: ( | {
         'Category: user interface\x7fComment: The prototypical workspace.\x7fModuleInfo: Module: smalltalkUI InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         workspace <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 



 '-- Side effects'

 globals modules smalltalkUI postFileIn
