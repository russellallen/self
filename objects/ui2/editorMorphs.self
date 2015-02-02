 'Sun-$Revision: 30.33 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'abstractEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractEditorMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         middleButtonMenu.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( |
             {} = 'Comment: I hold behavior that any kind of 
text pane might want to share.\x7fModuleInfo: Creator: traits abstractEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         caretMorph = bootstrap define: bootstrap stub -> 'globals' -> 'caretMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'caretMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals caretMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caretMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: public'
        
         fontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caretMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (globals fontSpec copyName: \'verdana\' Size: 12 Style: \'bold\')\x7fVisibility: public'
        
         fontSpec <- globals fontSpec copyName: 'verdana' Size: 12 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         caretMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits caretMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caretMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'caretMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caretMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rawBox <- ((0)@(0)) # ((2)@(12)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'caretMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: private'
        
         rawColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         amIATypingFocus = ( |
            | 
            isInWorld ifFalse: [^ false].

            world hands anySatisfy: [|:h| amIATypingFocusFor: h ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         amIATypingFocusFor: hand = ( |
            | 
            hand isAKeyboardSubscriber: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backgroundColor = ( |
            | 
            amIATypingFocus ifTrue: [modifiedBackgroundColorForFocus: color] False: [color]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         beTypingFocusFor: sourceHand = ( |
            | 
            sourceHand subscribeKeyboardExclusive: self.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSelfMenu = ( |
             menu.
            | 
            menu: ui2Menu copy color: menuColor.

            hasSelection ifTrue: [
                menu addButtonTarget: self ScriptBlock: [target copy_cmd]                      Label: 'Copy'.
            ].
            ui2_textBuffer contents isEmpty ifFalse: [
                menu addButtonTarget: self ScriptBlock: [target paste_cmd]                     Label: 'Paste'.
            ].
            hasSelection ifTrue: [
                menu addButtonTarget: self ScriptBlock: [target cut_cmd]                       Label: 'Cut'.
            ].
            menu addDivider.
            hasSelection ifTrue: [
                menu addButtonTarget: self AsynchronousScriptBlock: [target do_it_cmd:  event] Label: 'Do Selection'.
                menu addButtonTarget: self AsynchronousScriptBlock: [target get_it_cmd: event] Label: 'Get Selection'.
                menu addDivider.
                menu addButtonTarget: self ScriptBlock: [target implementors_cmd:           event] Label: 'Implementors'.
                menu addButtonTarget: self ScriptBlock: [target find_slot_cmd:              event] Label: 'Find Slot'.
                menu addButtonTarget: self ScriptBlock: [target senders_cmd:                event] Label: 'Senders'.
                menu addButtonTarget: self ScriptBlock: [target sendersInFamily_cmd:        event] Label: 'Senders in Family'.
                menu addButtonTarget: self ScriptBlock: [target methods_containing_cmd:     event] Label: 'Methods Containing'.
                menu addButtonTarget: self ScriptBlock: [target copy_downs_containing_cmd:  event] Label: 'Copy Downs Containing'.
                menu addButtonTarget: self ScriptBlock: [target initial_contents_containing_cmd: event] Label: 'Initial Contents Containing'.
                menu addDivider.
                menu addButtonTarget: self ScriptBlock: [target createDoItButton:  event] Label: 'Selection as Do it button'.
                menu addButtonTarget: self ScriptBlock: [target createGetItButton: event] Label: 'Selection as Get it button'.
            ] False: [
                menu addButtonTarget: self AsynchronousScriptBlock: [target do_it_cmd:              event] Label: 'Do it'.
                menu addButtonTarget: self AsynchronousScriptBlock: [target get_it_cmd:             event] Label: 'Get it'.
                menu addDivider.
                menu addButtonTarget: self ScriptBlock: [target createDoItButton:  event] Label: 'Make Do it button'.
                menu addButtonTarget: self ScriptBlock: [target createGetItButton: event] Label: 'Make Get it button'.
            ].
            menu addButtonTarget: self 
                     ScriptBlock: [target doOperation: userDefinedOperation ToAllForEvent: event]
                           Label: 'Do ``userDefinedOperation\'\''.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu buttons size > 1 ifTrue: menu False: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: searching commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copy_downs_containing_cmd: evt = ( |
            | 
            evt sourceHand attach: (
              copyDownsContainingMorph copySelector: textInSelectionOrAll Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         createButtonIsGetIt: isGetIt Event: evt = ( |
             b.
            | 
            b: ui2Button copy.
            b target: receiver reflectee.
            isGetIt ifTrue: [
              b scriptBlock: [|m|
                m: reflect: buttonArgs first evalInContext: (reflect: target) FileName: '<eval>'.
                event sourceHand attach: 
                  selfObjectModel copyMirror: m
                                     InWorld: button world
              ].
            ] False: [
              b scriptBlock:[
                buttonArgs first evalInContext: (reflect: target) FileName: '<eval>'].
            ].
            ((textLines copyLines: textInSelectionForExecution) wrapLinesAtBlanksNear: 25) do: [ | :lbl |
              b addMorphLast: (labelMorph copyLabel: lbl).
            ].
            b buttonArgs addFirst: textInSelectionForExecution.
            = root ifFalse: [b color: owner color.].
            evt sourceHand attach: b.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         createDoItButton: evt = ( |
            | 
            createButtonIsGetIt: false Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         createGetItButton: evt = ( |
            | 
            createButtonIsGetIt: true Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         cursorColor = ( |
            | fontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: user-defined\x7fComment: Applies a user-defined operation to the contents of the text editor.
Put your transformative code in the block.
See traits string userDefinedOperation.\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         doOperation: aUserDefinedOperation ToAllForEvent: event = ( |
             newContents.
             oldContents.
            | 
            oldContents: contentsString.
            newContents: aUserDefinedOperation applyToString: oldContents.
            oldContents = newContents  ifTrue: [^ self].
            contentsString: newContents.
            textHasChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         do_it_cmd: evt = ( |
            | 
            textInSelectionForExecution
               evalObjectBodyInContext: receiver
                ReportingTo: 
                  (((ui2ResultReporter copy
                    event: evt)
                    editor: self)
                    reportTo: self)
                    howToReport: 'finish_do_it:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: searching commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         find_slot_cmd: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                    findSlot: textInSelectionOrAll getSelectorFromExpression
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         finish_do_it: resultReporter = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         finish_get_it: resultReporter = ( |
             h.
             result.
            | 
            result: world outlinerForMirror: reflect: resultReporter result.
            h: resultReporter event sourceHand.
            safelyDo: [
                result = root 
                  ifFalse: [h attach: result]
                     True: [ | p. hp |
                       p: result globalPosition.
                       hp: p + (10@0) "h globalPosition".
                       addActivity: 
                         (((positionAnimator copyTarget: result Seconds: 0.1) from: p) to: hp)
                         andThen:
                         (((positionAnimator copyTarget: result Seconds: 0.1) from: hp) to: p).
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: execution commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         get_it_cmd: evt = ( |
            | 
            "performed in traits ui2_textField keyDown:"
            textInSelectionForExecution
               evalObjectBodyInContext: receiver
                ReportingTo: 
                  (((ui2ResultReporter copy
                    event: evt)
                    editor: self)
                    reportTo: self)
                    howToReport: 'finish_get_it:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         ignoreUnimplementedControlCharacters* = bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: searching commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         implementors_cmd: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: textInSelectionOrAll getSelectorFromExpression
                  StartingFrom: receiver
                         Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: searching commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initial_contents_containing_cmd: evt = ( |
            | 
            evt sourceHand attach: (
              initialContentsContainingMorph copySelector: textInSelectionOrAll Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         keyboardSubscriptionLapsedFor: aHand = ( |
            | 
            stopBeingTypingFocusOf: aHand).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043)\x7fVisibility: private'
        
         menuColor = paint copyRed: 0.900293 Green: 0.855327 Blue: 0.72043.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: searching commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         methods_containing_cmd: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                methodsContaining: textInSelectionOrAll
                     StartingFrom: receiver
                            Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            (evt sourceHand capabilitySet includes: capabilities editText)
              ifFalse: [ ^ self].
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fComment: A method to make a brigher version of
text and selection paints, for use when the editor is a 
typing focus. -- Randy, 1/13/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         modifiedBackgroundColorForFocus: aPaint = ( |
            | 
            "If the editor is a typing focus, the colors
            should be modified (probably brighter.) Use this
            method to modify both the editor background and the
            selection." 

            aPaint copyBrighterBy: 0.05).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         modifiedCursorColor = ( |
            | 
            amIATypingFocus ifFalse: [ cursorColor asSubduedColorForBackground: color ] 
                               True: [ cursorColor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         modifiedSelectionColor = ( |
            | 
            modifiedSelectionColorForFocus: modifiedSelectionColorForArea: selectionColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fComment: Implements patented algorithm for salience-based
highlighting. More area = subtler highlighting. -- dmu 3/05\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         modifiedSelectionColorForArea: aPaint = ( |
             coef.
             s.
            | 
            s: (selectionArea / 100) asInteger.
            s = 0  ifTrue: [^ aPaint ].
            coef: 1.10 power: (s min: 18) pred negate.
            backgroundColor interpolate: coef From: aPaint).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fComment: A method to make a brigher version of
text and selection paints, for use when the editor is a 
typing focus. -- Randy, 1/13/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         modifiedSelectionColorForFocus: aPaint = ( |
            | 
            "If the editor is a typing focus, the colors
            should be modified (probably brighter.) Use this
            method to modify both the editor background and the
            selection." 

            amIATypingFocus ifTrue: [aPaint] False: [backgroundColor interpolate: 0.7 From: aPaint]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'abstractEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'columnMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             m.
            | 
            m: middleButtonMenu.
            m: (m ifNil: [ buildSelfMenu ] IfNotNil: [m copy retargetButtonsTo: self]).
            m isNotNil && [isInWorld] ifTrue: [
              m popUp: evt.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionArea = ( |
            | 
            "A default--not really correct"
            100).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: colors\x7fComment: used under the text when it
is selected-- Randy, 1/13/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionColor <- paint copyRed: 0.0 Green: 1.0  Blue: 0.476051.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: searching commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersInFamily_cmd: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                 sendersOf: textInSelectionOrAll getSelectorFromExpression
                InFamilyOf: receiver
                     Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: searching commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         senders_cmd: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                 sendersOf: textInSelectionOrAll getSelectorFromExpression 
              StartingFrom: receiver
                     Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         stopBeingTypingFocusOf: aHand = ( |
            | 
            aHand unsubscribeCursor:   self.
            "if I am stopping cause of a buttton click in another morph,
             need to unsubscribe. The if test prevents recursion"
            (aHand isAKeyboardSubscriber: self) 
              ifTrue: [  aHand unsubscribeKeyboard: self ].
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         textHasChanged = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: selecting\x7fComment: Make empty evaluator return something.
-- Ungar, 1/29/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         textInSelectionForExecution = ( |
             t.
            | 
            t: textInSelectionOrAll.
            t shrinkwrapped isEmpty ifTrue: [^ '\'What!?\'' ].
            t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         textInSelectionOrAll = ( |
            | hasSelection ifTrue: [textInSelection] False: [contentsString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         editorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'editorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawBox:' From:
             bootstrap remove: 'rawColor' From:
             bootstrap remove: 'rawColor:' From:
             globals abstractEditorMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'editorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals editorMorph.

CopyDowns:
globals abstractEditorMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawBox: rawColor rawColor:.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         editorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits editorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'editorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rawBox <- ((34)@(24)) # ((94)@(27)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (paint named: \'lightGray\')\x7fVisibility: private'
        
         rawColor <- paint named: 'lightGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rawEditMode <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorMorph' -> () From: ( | {
         'Comment: A mirror for \"do it\" and \"get it\" type 
commands-- Randy, 1/6/95\x7fModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (reflect: lobby)\x7fVisibility: public'
        
         receiver <- reflect: lobby.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         editorRowMorph = bootstrap define: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'rawBox' From:
             bootstrap remove: 'rawColor' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals editorRowMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype rawBox rawColor.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'Category: fontDefaults\x7fModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: public'
        
         defaultFontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'Category: fontDefaults\x7fModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (fontSpec copyName: \'verdana\' Size: 12 Style: \'\')\x7fVisibility: public'
        
         defaultFontSpec <- fontSpec copyName: 'verdana' Size: 12 Style: ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nextRow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         editorRowMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits editorRowMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'editorRowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         previousRow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rawBox <- ((0)@(0)) # ((100)@(80)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (paint named: \'lightGray\')\x7fVisibility: private'
        
         rawColor <- paint named: 'lightGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rawTyper.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         selectionRange.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         editorMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules editorMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         myComment <- 'A simple, optimizing morph-based editor.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            abstractEditorMorph initializePrototype.
                    editorMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.33 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'editorMorphs' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'autoCompletion
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         amIATypingFocus = ( |
            | 
            ( myEditorMorphIfNone: [ ^ true ] )
              amIATypingFocus).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         backgroundColor = ( |
            | 
            owner ifNil:    [ paint named: 'lightGray' ]
                  IfNotNil: [ owner color ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: layoutAndGeometry\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight = ( |
            | 
            fontSpec size).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: layoutAndGeometry\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth = ( |
            | 
            "Claim to need zero width so that I won't shift
             the position of subsequent morphs in the row."

            0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         color = ( |
            | 
            amIATypingFocus
             ifTrue: [ resend.color ]
              False: [ resend.color asSubduedColorForBackground: backgroundColor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            resend.colorAll: newC.
            fontColor: newC    textColorForBackground.
            color:     newC outlineColorForBackground.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForEditor: editor = ( |
             new.
            | 
            new: copyRemoveAllMorphs.
            new beFlexibleVertically.
            new beRigidHorizontally.
            new fontSpec:  editor defaultFontSpec.
            new fontColor: editor defaultFontColor.
            new colorAll:  editor color.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         emitCharInEditor: char = ( |
            | 
            "Emit the given character into an editor."

            owner insertChar: char From: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         emitCharInWorld: char = ( |
             m.
            | 
            "Not clear exactly what would be wanted here.  At least
            enough to create individual character labels."

            m: labelMorph copy label: char.
            m globalPosition: globalPosition + (0 @ baseBounds height).
            changed.
            globalPosition: globalPosition + (m baseBounds width @ 0).
            changed.
            world addMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         ignoreUnimplementedControlCharacters* = bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         insert_char: char = ( |
            | 
            ^ emitCharInWorld: char).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown: e = ( |
            | 
            "Handle a keyDown event. Note that keys may generate
             multi-character sequences."

            "Editor row morphs can do a lot with control characters
             that I cannot do, so I'll do simple version, and my row can do
             the fancy stuff, if I am in a row."

            e sendMessageToHandleKeyboardEventTo: 
              ownerIsEditorRowMorph ifTrue: [ owner ]
                                     False: [ self  ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'caretMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         myEditorMorphIfNone: noneBlock = ( |
             oo.
            | 
                                   owner isNotNil
            && [ oo: owner owner.  oo    isNotNil
            && [                   oo    isEditorMorph ]]
              ifTrue:  oo
               False:  noneBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         ownerIsEditorRowMorph = ( |
            | 
            owner ifNil: [ ^ false ]. 
            owner morphTypeName = editorRowMorph morphTypeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'caretMorph' -> () From: ( | {
         'Category: layoutAndGeometry\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeRect: r = ( |
            | 
            "Always be one pixel wide."

            rawBox: r topLeft ## (1 @ r height).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Don't pass any events to submorphs when in edit mode. Never
             pass keyDown events to submorphs."

            editMode not && evt keyDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         appendString: s = ( |
            | 
            firstRow appendString: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         appendString: s FontSpec: fs FontColor: fc = ( |
            | 
            setFontSpec: fs FontColor: fc.
            firstRow appendString: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backspace = ( |
            | backspaceCount: 1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backspaceCount: n = ( |
            | 
            firstRow backspaceCount: n.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: debugging\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         checkRows = ( |
             oops.
             overallOops.
             previousRowInOwner.
            | 
            "Check receiver's rows for consistency.
             Assume all morphs are editorRowMorphs."

            previousRowInOwner: nil.
            overallOops: false.
            morphsDo: [| :r |
                oops: false.
                r previousRow ifNotNil: [
                    r previousRow nextRow = r ifFalse: [
                        oops: true.
                        overallOops: true.
                    ].
                ].
                r nextRow ifNotNil:  [
                    r nextRow previousRow = r ifFalse: [
                        overallOops: true.
                        oops: true.
                    ].
                ].
                previousRowInOwner ifNotNil: [
                    ((r previousRow = previousRowInOwner) &&
                     (previousRowInOwner nextRow = r)) ifFalse: [
                        overallOops: true.
                        oops: true.
                    ].
                ].
                oops ifTrue: [
                    'Found an inconsistency: ' printLine.
                    '    ' print. r previousRow printLine.
                    '    ' print. r             printLine.
                    '    ' print. r nextRow     printLine.
                    '' printLine.
                ].
                previousRowInOwner: r.
            ].
            overallOops ifFalse: [ 'Rows are consistent' printLine ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: stringOperations\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         clear = ( |
             r.
            | 
            r: firstRow.
            removeAllMorphs.
            addMorph: r cleanCopy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: stringOperations\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         color: col = ( |
            | 
            resend.color: col.
            firstRow allRowsDo: [| :r | r color: color ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: stringOperations\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
             s.
            | 
            s: ('' & '').
            firstRow allRowsDo: [| :r | s: s & r contentsString ].
            s flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString: s = ( |
            | setString: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copy_cmd = ( |
            | 
            firstRow copy_cmd.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd = ( |
            | 
            firstRow cut_cmd).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: edit mode\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         editMode = ( |
            | rawEditMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: edit mode\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         editMode: value = ( |
            | 
            editMode = value ifTrue: [^editMode].
            value ifTrue: [
              rawEditMode: true
            ] False: [
              typer delete.
              rawEditMode: false.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: stringOperations\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         firstRow = ( |
            | 
            morphsDo: [| :m |
                m morphTypeName = editorRowMorph morphTypeName ifTrue: [
                    ^m firstRow.
                ].
            ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fComment: Does there exist a text selection across
the face of this editor? -- Randy, 1/6/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSelection = ( |
            | 
            firstRow hasSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
             r.
            | 
            removeAllMorphs.
            beFlexibleHorizontally.
            beShrinkWrapVertically.
            borderWidth: 0.
            leftJustify.
            r: editorRowMorph copy.
            r beFlexible.
            r borderWidth: 0.
            addMorph: r.
            "just some nice default"
            clear.

            setFontSpec: (globals fontSpec copyName: 'helvetica' Size: 12)
              FontColor:  paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         insertString: s = ( |
            | 
            firstRow insertString: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         insertString: s FontSpec: fs FontColor: fc = ( |
            | 
            setFontSpec: fs FontColor: fc.
            firstRow insertString: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         insert_char: c = ( |
            | 
            insertString: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isEditorMorph = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown: e = ( |
            | 
            ( amIATypingFocusFor: e sourceHand )  ifFalse: [ ^ dropThroughMarker ].
            editMode ifFalse: [^dropThroughMarker].
            typer keyDown: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fComment: To select whole word. -- Randy, 12/29/94\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick: evt = ( |
            | 
            owner ifNil: [^ self].

            ((morphsAt: evt cursorPoint - owner globalPosition)
              copyFilteredBy: [ | :m |
                m morphTypeName = editorRowMorph morphTypeName
              ]
            ) do: [ | :row |
              row selectWordAt: evt cursorPoint
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: e = ( |
            | 
            "become interested in events if relevant, and move the typer."
            (e sourceHand capabilitySet includes: capabilities editText)
                ifFalse: [^ self ].
            firstRow deselectAll.
            editMode ifFalse: [^dropThroughMarker].
            e sourceHand morphTypeName = 'handMorph' ifTrue: [
              e sourceHand subscribeCursor: self.
              beTypingFocusFor: e sourceHand. ]. 

            moveTyperEvent: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: e = ( |
            | 
            " move the typer " 
            (globalBaseBounds includes:  e cursorPoint) ifFalse: [
              mouseLeftEditor: e.
              ^ self
            ]. 
            e sourceHand unsubscribeCursor: self.
            editMode ifFalse: [^dropThroughMarker]. 
            moveTyperEvent: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'editorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mouseLeftEditor: e = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: e = ( |
            | 
            (e sourceHand capabilitySet includes: capabilities editText)
                ifTrue:  [ ^ self ].
            e leftIsDown ifTrue: [ | oldPt |
              oldPt: selectionPointOfTyper. 
              moveTyperEvent: e.
              selectToTyperFrom: oldPt. 
            ] False: [
              (globalBaseBounds includes:  e cursorPoint) ifFalse: [
                e sourceHand unsubscribeCursor: self.
                mouseLeftEditor: e.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         moveTyperEvent: e = ( |
             localY.
            | 
            "If the editor's rows are shrinkWrapped, they may
             not extend to the right side of the editor;
             this method catches and forwards events that
             'miss' their intended row."

            editMode ifFalse: [^dropThroughMarker].
            e sourceHand subscribeKeyboardExclusive: self.

            localY: (e cursorPoint - globalPosition) y.
            firstRow allRowsDo: [| :m |
                (m bounds top <= localY) && [localY <= m bounds bottom] ifTrue: [
                    m setTyperAt: e cursorPoint.
                    ^self.
                ].
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         paste_cmd = ( |
            | 
            firstRow paste_cmd.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAll = ( |
            | 
            firstRow allRowsDo: [|:r| r selectEntireRow].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         selectFrom: pt1 To: pt2 = ( |
             inSelection.
             ptBig.
             ptSmall.
            | 
             "Set the selections within the rows so that
             the selection runs from the initial x@y location pt1 to
             the final x@y location pt2."

            pt1 y < pt2 y ifTrue: [
              ptSmall: pt1. ptBig: pt2.
            ] False: [
              pt1 y = pt2 y ifTrue: [
                pt1 x < pt2 x ifTrue: [
                  ptSmall: pt1. ptBig: pt2.
                ] False: [
                  ptSmall: pt2. ptBig: pt1.
                ].
              ] False: [
                  ptSmall: pt2. ptBig: pt1.
              ].
            ].

             inSelection: false.
             firstRow allRowsDo: [ | :r |
              inSelection ifTrue: [ r selectEntireRow ] False: [r deselect].
               (r baseBounds top <= ptSmall y) && [ r baseBounds bottom > ptSmall y] ifTrue: [
                 r selectionRange: (ptSmall x & r baseBounds width ) asList.
                 inSelection: true.
               ].
               (r baseBounds top <= ptBig y) && [ r baseBounds bottom > ptBig y] ifTrue: [
                 r selectionRange: (r selectionRange first & ptBig x) asList.
                 inSelection: false.
               ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         selectToTyperFrom: oldTyperPt = ( |
             de.
             ds.
             se.
             ss.
            | 
            hasSelection ifFalse: [
              selectFrom: oldTyperPt To: selectionPointOfTyper.
              ^ self
            ].
            ss: firstRow selectionStart. 
            se: firstRow selectionEnd.
            ds: (oldTyperPt - ss dotProduct: oldTyperPt - ss).
            de: (oldTyperPt - se dotProduct: oldTyperPt - se).
            ds < de ifTrue: [
              selectFrom: selectionPointOfTyper To: se. 
            ] False: [
              selectFrom: ss To: selectionPointOfTyper. 
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fComment: Return pixels in selected area.\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionArea = ( |
            | firstRow selectionArea).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         selectionPointOfTyper = ( |
            | 
            (typer owner globalPosition - globalPosition) +
             (typer position x @ 0)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         selectionStart: pt1 End: pt2 = ( |
             i.
             indexCorrection.
             isOpti.
             r.
             xEnd.
             xStart.
             yEnd.
             yStart.
            | 
            firstRow deselectAll.
            r: firstRow.
            i: 0.
            [i >= pt1 y] whileFalse: [
               r: r nextRow.
               i: i + 1. 
               r ifNil: [ error: 'Request for selection start beyond number of rows.'].
            ].
            isOpti: r isOptimized.
            r deoptimize.
            r ownsTyper && [ (r morphs at: pt1 x IfAbsent: [r morphs last]) position x > r typer position x] ifTrue: [
              indexCorrection: 1
            ] False: [
              indexCorrection: 0
            ].
            xStart: (r morphs at: pt1 x + indexCorrection IfAbsent: [r morphs last]) position x + r position x. 
            yStart: r bounds leftCenter y.
            isOpti ifTrue: [r optimize].

            [i >= pt2 y] whileFalse: [
               r: r nextRow.
               i: i + 1. 
               r ifNil: [ error: 'Request for selection end beyond number of rows.'].
            ].
            isOpti: r isOptimized.
            r deoptimize.
                  r ownsTyper
            && [ (r morphs at: pt2 x IfAbsent: [r morphs last]) position x  >  r typer position x]
             ifTrue: [
              indexCorrection: 1
            ] False: [
              indexCorrection: 0
            ].
            xEnd: (r morphs at: pt2 x + indexCorrection IfAbsent: [r morphs last]) bounds right
                   + r position x. 
            yEnd: r bounds leftCenter y.
            isOpti ifTrue: [r optimize].

            selectFrom: xStart@yStart To: xEnd@yEnd.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setFontSpec: fs FontColor: fc = ( |
             tpr.
            | 
            tpr: typer.
            tpr fontSpec: fs.
            tpr    color: fc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setString: s = ( |
            | 
            morphs copy do: [|:m| m deleteRowIfNotFirst].
            firstRow setString: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         textInSelection = ( |
            | 
            firstRow textInSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorMorph' -> () From: ( | {
         'Category: text operations (forwardedRowOperations)\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         typer = ( |
            | firstRow typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptFrom: tpr Event: evt = ( |
             o.
            | 
            o: self.
            [
              o: o owner ifNil: [^ self].
              o isSmallEditorMorph
            ] whileFalse.
            o panel acceptButton simulateButtonPress: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptTextChanges: e = ( |
            | acceptFrom: typer Event: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorph: m = ( |
            | 
            "As in parent, but handles possible line overflow."
            "Details: First deoptimize to allow normal row addMorph:
             to find the right place to insert the morph. The row
             is left deoptimized."

            deoptimize.
            resend.addMorph: m.
            handleOverflowAfterAddingMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: stringHandling\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         addMorphForAppendString: m = ( |
            | 
            "Add the given morph without deoptimizing or
             checking for lineBreaks."

            resend.addMorph: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: rowManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         allRowsDo: b = ( |
             r.
            | 
            r: firstRow.
            [r isNil] whileFalse: [
                b value: r.
                r: r nextRow.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: stringHandling\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         appendString: s = ( |
             lblProto.
             linesToAdd.
             nextStart.
             prev.
             tpr.
            | 
            "Append the given string to the end of the editor,
             using the typer's current font attributes. Optimized
             for loading large strings (such as files)."
            "Details: Break string into lines and add the morphs for all
             the lines at once (to avoid doing multiple layout operations).
             Then propagate any overflows. Use addMorphForAppendString to
             avoid the cost of scanning the morph being added for
             lineBreaks, since we know it doesn't have any."

            s isEmpty ifTrue: [ ^self ].

            "build prototype labelMorph using font attributes from typer"
            tpr: typer.
            lblProto:
                labelMorph copyLabel: 'filledInLater'
                            FontSpec:  tpr fontSpec
                               Color:  tpr fontColor.

            linesToAdd: list copyRemoveAll.
            nextStart: 0.
            s do: [| :char. :i. str |
                (char isLineBreak || [i = s size pred]) ifTrue: [
                    str: (s copyFrom: nextStart UpTo: i succ).
                    linesToAdd add: (lblProto copyLabel: str).
                    nextStart: i succ.
                ].
            ].

            (lastRow isNewlineTerminated) ifFalse: [
                "Append the first line of s to current last line."
                lastRow addMorphForAppendString: linesToAdd first.
                linesToAdd removeFirst.
            ].

            prev: lastRow.
            linesToAdd mapBy: [| :lbl. newRow |
                newRow: cleanCopy.
                newRow addMorphForAppendString: lbl.
                newRow previousRow: prev.
                prev nextRow: newRow.
                prev: newRow.
                newRow.
            ].
            owner addAllMorphs: linesToAdd.
            doLineWrapping ifTrue: [
                propagateOverflowsFrom: firstRow.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backOneObject: tpr = ( |
             m.
            | 
            deselectAll.
            deoptimize.
            m: (tpr owner morphBefore: tpr).
            m ifNil: [ optimize. ^ self].
            tpr position:  (m position x - 1) @ tpr position y. 
            tpr owner addMorph: tpr.
            optimize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backspace = ( |
            | backspaceFrom: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: insertAndBackspace\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         backspaceAtBeginningOfRow = ( |
             tpr.
            | 
            "Move the typer to the preceeding row, if there is one,
             and do the backspace in that row."

            previousRow ifNil: [ ^self ].

            "Move the typer to the previous row and do the backspace
             operation there. The possible recursion through a sequence
             of empty rowsterminates when the typer reaches the first row."
            tpr: typer.
            previousRow insertAtEnd: tpr.
            previousRow backspaceFrom: tpr.

            "Delete this row if it is now empty."
            0 = morphCount ifTrue: [ deleteRowIfNotFirst ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: stringHandling\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backspaceCount: n = ( |
             tpr.
            | 
            tpr: typer.
            n do: [ backspaceFrom: typer ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: insertAndBackspace\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backspaceFrom: tpr = ( |
             prevMorph.
            | 
            "Delete the morph immediately preceeding the typer. This could
             be a 'virtual character morph' contained in a multiple character
             labelMorph."
            "Assume: the typer is in this row (because this message is 
                typically sent by the typer to its owner)
             Deduce:
                this row is not empty (it contains at least the typer)
                if the typer is not the first morph, then there must
                   be at least one morph before the typer"

            firstMorph = tpr ifTrue: [ ^backspaceAtBeginningOfRow ].
            prevMorph: (morphBefore: tpr).
            (isLabelMorph: prevMorph) ifTrue: [| lbl |
                lbl: prevMorph label.
                lbl size <= 1 ifTrue: [| s |
                    "zero or one chars: delete the entire labelMorph"
                    removeMorph: prevMorph. "calls handleUnderflowAfterRemoving"
                ] False: [| lineBreak |
                    "two or more chars: remove one char from the label"
                    lineBreak: lbl last isLineBreak.
                    prevMorph label: (lbl copySize: lbl size pred).
                    lineBreak ifTrue: [ handleUnderflowAfterRemoving ].
                ].
            ] False: [
                "previous morph is not a labelMorph: just delete it"
                removeMorph: prevMorph.  "calls handleUnderflowAfterRemoving"
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backward_char = ( |
            | 
            backOneObject: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         backward_word = ( |
            | throughFirstWordDo: [backward_char] MovingForward: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 

              owner isEditorMorph ifFalse: [
                resend.baseDrawOn: c.
              ] True: [
                c fillRectangle: baseBounds  Color: owner backgroundColor.
                selectionRange ifNotNil: [
                  c fillRectangle: 
                      (baseBounds origin + (selectionRange first @ 0 )) #
                      (baseBounds origin + (selectionRange last  @ baseBounds height))
                    Color:  owner modifiedSelectionColor.
                ].
              ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         beginning_of_line = ( |
            | 
            toBeginningOfLine: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         cancelFrom: tpr Event: evt = ( |
             o.
            | 
            o: self.
            [
              o: o owner ifNil: [^ self].
              o isSmallEditorMorph
            ] whileFalse.
            o panel cancelButton simulateButtonPress: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         cancelTextChanges: e = ( |
            | 
            cancelFrom: typer Event: e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         cleanCopy = ( |
             new.
            | 
            new: copyRemoveAllMorphs.
            new nextRow: nil.
            new previousRow: nil.
            new selectionRange: nil.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: copying and pasting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copy_cmd = ( |
            | 
            firstRow hasSelection ifTrue: [ ui2_textBuffer contents: firstRow textInSelection ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: utilties\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         createsLineBreak: m = ( |
            | 
            (isLabelMorph: m) ifFalse: [ ^false ].
            m label do: [| :ch. :i |
                ch isLineBreak ifTrue: [
                    "found a lineBreak; it breaks the line
                     unless it happens to be the last character
                     of the last morph of the row"
                    ^((i = m label lastKey) && [m = lastMorph]) not
                ].
            ].
            "if we get here, no lineBreak was found"
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: copying and pasting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         cut_cmd = ( |
            | 
            copy_cmd. 
            firstRow deleteSelection).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteForward = ( |
            | 
            hasSelection ifTrue: [ ^cut_cmd ].
            delete_next_char).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteNextChar: tpr = ( |
             m.
            | 
            deselectAll.
            deoptimize.
            m: (tpr owner morphAfter: tpr).
            m ifNil: [ optimize. ^ self].

            forwardOneObject: tpr.
            backspaceFrom:    tpr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: rowManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         deleteRowIfNotFirst = ( |
            | 
            "If this row is not the root then remove it from the chain
             of rows and delete it."

            = firstRow ifFalse: [
                ownsTyper ifTrue: [ firstRow insertAtBeginning: typer ].
                previousRow ifNotNil: [ previousRow nextRow:     nextRow ].
                nextRow     ifNotNil: [ nextRow previousRow: previousRow ].
                nextRow: nil.
                previousRow: nil.
                delete.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: delete selection here
and in all connceted rows
--Randy 1/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteSelection = ( |
             mphsToDelete.
             r1.
             r2.
             rows.
            | 

            rows: selectedRows.
            rows do: [ | :r |
              changed.
              r1: r selectionRange first.
              r2: r selectionRange last.
              r deoptimize.
              mphsToDelete: r morphs asList copyFilteredBy: [ | :m |
                (m = r typer) not && [ | mcx |
                  mcx: m bounds center x. 
                  (mcx >= r1) && [mcx <= r2] 
                ].
              ].
              mphsToDelete do: [ | :m | m delete].
              r deselect.
              r optimize.
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_line = ( |
            | killToEndOfLine: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_next_char = ( |
            | 
            deleteNextChar: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         delete_word_backwards = ( |
            | throughFirstWordDo: [|:m| m delete] MovingForward: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: optimizingAndDeoptimizing\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         deoptimize = ( |
             didDeoptimization <- bootstrap stub -> 'globals' -> 'false' -> ().
             newMorphs.
            | 
            "Deoptimize the representation of this row by breaking all
             composite label morphs into individual label morphs each
             containing a single character."

            0 = morphCount ifTrue: [ ^self ].
            newMorphs: list copyRemoveAll.
            morphsDo: [| :m |
                ((isLabelMorph: m) &&
                 [m label size > 1]) ifTrue: [| fs. fc. charMorphs |
                    didDeoptimization: true.
                    fs: m fontSpec.
                    fc: m color.
                    m label do: [| :char. charMorph |
                        charMorph: labelMorph copyLabel: char
                            FontSpec: fs Color: fc.
                        newMorphs add: charMorph.
                    ].
                ] False: [
                    newMorphs add: m.
                ].
            ].
            didDeoptimization ifTrue: [
                replaceMorphsWithSuperset: newMorphs.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: undo any selection, in this row only-- Randy, 1/4/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         deselect = ( |
            | selectionRange: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: undo selection in this and all connected rows.
--Randy\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         deselectAll = ( |
            | allRowsDo: [ | :r |
              r selectionRange: nil.
              r changed ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         doLineWrapping = ( |
            | 
            "Line wrapping is not yet debugged."

            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         end_of_line = ( |
            | 
            toEndOfLine: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: rowManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         firstRow = ( |
             r.
            | 
            r: self.
            [r previousRow isNil] whileFalse: [ r: r previousRow ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         forwardOneObject: tpr = ( |
             m.
            | 
            deselectAll.
            deoptimize.
            m: (tpr owner morphAfter: tpr).
            m ifNil: [ optimize. ^ self].
            tpr position:  (m position x + m baseBounds width ) @ tpr position y. 
            tpr owner addMorph: tpr.
            optimize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         forward_char = ( |
            | 
            forwardOneObject: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         forward_word = ( |
            | throughFirstWordDo: [forward_char] MovingForward: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: overAndUnderflow\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         handleOverflowAfterAddingMorph: m = ( |
            | 
            ((createsLineBreak: m) || [rowTooLong]) ifTrue: [
                pushOverflowIntoNextRow.
                propagateOverflowsFrom: self.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: overAndUnderflow\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         handleUnderflowAfterRemoving = ( |
            | 
            0 = morphCount ifTrue: [
                "optimization: it is quicker to delete an empty
                 row than to pull up the contents of the next row"
                deleteRowIfNotFirst.
            ] False: [
                isNewlineTerminated ifFalse: [ pullUpMorphs ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: Does any row have a 
selection?-- Randy, 2/6/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         hasSelection = ( |
            | 
            allRowsDo: [ | :r | r rowHasSelection ifTrue: [ ^ true]].
            ^ false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         ignoreUnimplementedControlCharacters* = bootstrap stub -> 'traits' -> 'abstractUI2Event' -> 'editorKeyCapComboHandler' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: utilties\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         insertAtBeginning: m = ( |
            | 
            "Add the given morph at the beginning of this row."

            m globalPosition: globalBounds topLeft - ((m baseBounds width + 1)@0).
            addMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: utilties\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         insertAtEnd: m = ( |
            | 
            "Add the given morph at the end of this row."

            m globalPosition: globalBounds topRight + (1@0).
            addMorph: m.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: insertAndBackspace\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         insertChar: char From: tpr = ( |
             newMorphs.
             prevMorph.
            | 
            "Insert a character immediately after the typer."
            hasSelection ifTrue: [deleteSelection].
            prevMorph: (morphBefore: tpr).
               prevMorph isNotNil &&
             [ (isLabelMorph: prevMorph) &&
             [ (0 = prevMorph morphCount ) &&
            " added next 3 lines -- dmu "
             [ (prevMorph fontSpec = tpr fontSpec ) &&
             [ (prevMorph color = tpr fontColor ) ]]]]
               ifTrue: [
                "merge the character with the labelMorph preceding it"
                prevMorph label: (prevMorph label copyAddLast: char).
            " messes up insertString: -- dmu
                tpr fontSpec:  prevMorph fontSpec.
                tpr fontColor: prevMorph color.
            "
                handleOverflowAfterAddingMorph: prevMorph.
            ] False: [| charMorph. newMorphs. r |
                "add the character as its own labelMorph"
                charMorph:
                    labelMorph copyLabel: char
                        FontSpec: tpr fontSpec
                        Color:    tpr fontColor.

                newMorphs: list copyRemoveAll.
                r: tpr owner.
                r morphsDo: [| :m |
                    m = tpr ifTrue: [
                        newMorphs add: charMorph.
                    ].
                    newMorphs add: m.
                ].
                r replaceMorphsWithSuperset: newMorphs.
                handleOverflowAfterAddingMorph: charMorph.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: rowManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         insertNewRow = ( |
             r.
            | 
            "Insert a new row after the receiver."

            r: cleanCopy.
            r previousRow: self.
            r nextRow: nextRow.
            nextRow ifNotNil: [ nextRow previousRow: r ].
            nextRow: r.
            owner ifNotNil: [
                r globalPosition: globalPosition + (0@1).
                owner addMorph: r.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: stringHandling\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         insertString: s = ( |
             tpr.
            | 
            "This is slower than apppend string since it does
             all sorts of layout after every character is inserted,
             but convenient for short strings. Inserts at the typer
             location rather than appending to the last line. Uses
             the typer's current font attributes."

            tpr: typer.
            s do: [| :ch | tpr emitCharInEditor: ch ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         insert_char: c = ( |
            | insertChar: c From: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: utilties\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         isLabelMorph: m = ( |
            | m morphTypeName = labelMorph morphTypeName).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: utilties\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         isNewlineTerminated = ( |
            | 
            0 = morphCount ifTrue: [ ^false ].
            ((isLabelMorph: lastMorph) &&
             [(lastMorph label size > 0) &&
             [lastMorph label last isLineBreak]])).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: optimizingAndDeoptimizing\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         isOptimized = ( |
            | 
            ownsTyper ifTrue: [
              morphs size <= 3
            ] False: [
              morphs size = 1]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         isWordSeparator: m = ( |
            | 
               (m morphTypeName != labelMorph morphTypeName)
            || [m label isWordSeparator]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fComment: invoked by cntrl-k-- Randy, 1/4/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         killToEndOfLine: tpr = ( |
            | 
            deoptimize.
            (morphs asList copyFilteredBy: [ | :m | 
            m position x > tpr position x]) do: [ | :m |
                ( isLabelMorph: m ) && [
                  m label isLineBreak not] ifTrue: [
                    m delete
                 ].
            ].
            optimize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: rowManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         lastRow = ( |
             r.
            | 
            r: self.
            [r nextRow isNil] whileFalse: [ r: r nextRow ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: nextRow     IsPresentDo: [| :new | nextRow:     new ].
            dict if: previousRow IsPresentDo: [| :new | previousRow: new ].
            dict if: rawTyper    IsPresentDo: [| :new | rawTyper:    new ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: optimizingAndDeoptimizing\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         merge: m Into: previousLabel = ( |
            | 
            "Attempt to merge the given label morph into the previous
             label morph. Return true if the merge was done."

            m fontSpec = previousLabel fontSpec ifFalse: [ ^false ].
            m    color = previousLabel    color ifFalse: [ ^false ].
            0 = m morphCount                    ifFalse: [ ^false ].
            previousLabel label: (previousLabel label, m label).
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: insertAndBackspace\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         morphAfter: targetM = ( |
             lastM.
            | 
            "Return the submorph immediately after the given
             target morph or nil if the target is the last submorph.
             It is an error if the target morph is not a submorph of
             the receiver."

            lastM: nil.
            morphs reverseDo: [| :m |
                m = targetM ifTrue: [ ^lastM ].
                lastM: m.
            ].
            error: 'Target morph not found in morphAfter:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: insertAndBackspace\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         morphBefore: targetM = ( |
             lastM.
            | 
            "Return the submorph immediately preceding the given
             target morph or nil if the target is the first submorph.
             It is an error if the target morph is not a submorph of
             the receiver."

            lastM: nil.
            morphsDo: [| :m |
                m = targetM ifTrue: [ ^lastM ].
                lastM: m.
            ].
            error: 'Target morph not found in morphBefore:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'editorRowMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         next_line = ( |
            | 
            toNextLine: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: optimizingAndDeoptimizing\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         optimize = ( |
             didOptimization <- bootstrap stub -> 'globals' -> 'false' -> ().
             newMorphs.
             previousLabel.
            | 
            "Optimize the representation of this row by consolidating
             into single morphs all runs of characters that share the
             same font attributes."
            0 = morphCount ifTrue: [ ^self ].
            previousLabel: nil.
            newMorphs: list copyRemoveAll.
            morphsDo: [| :m |
                ((isLabelMorph: m) && [0 = m morphCount]) ifTrue: [
                    ( previousLabel isNotNil &&
                     [merge: m Into: previousLabel]) ifTrue: [
                        "m was merged with the previous labelMorph"
                        didOptimization: true.
                    ] False: [| startMorph |
                        "could not merge m with previous morph (perhaps because
                         m is the first morph in the row, follows a non-label morph,
                         or differs from the previous run in its font attributes);
                         start a new run of characters begging with m"
                        startMorph: m copy.
                        previousLabel: startMorph.
                        newMorphs add: startMorph.
                    ].
                ] False: [
                    "non-label morph or a labelMorph with submorphs;
                     break the current run, if any"
                    previousLabel: nil.
                    newMorphs add: m.
                ].
            ].
            didOptimization ifTrue: [
                replaceMorphsWithSuperset: newMorphs.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: typerManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         ownsTyper = ( |
            | morphs includes: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: copying and pasting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         paste_cmd = ( |
            | 
            firstRow hasSelection ifTrue: [firstRow deleteSelection].
            ui2_textBuffer contents do: [|:c|
              typer emitCharInEditor: c.
            ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: converting multi-editor control char protocol to editorRowMorph messages\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         previous_line = ( |
            | 
            toPreviousLine: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: overAndUnderflow\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         propagateOverflowsFrom: startRow = ( |
             r.
            | 
            "Starting at the given row, propagate any overflows."

            r: startRow.
            [r isNil] whileFalse: [
                r rowTooLong ifTrue: [ r pushOverflowIntoNextRow ].
                r: r nextRow.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: overAndUnderflow\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         pullUpMorphs = ( |
            | 
            "Pull up as many morphs as will fit from following rows.
             Details: We initially pull up all the morphs from the
             next row, then push any overflow back down."

            [nextRow isNil] whileFalse: [
                addAllMorphs: nextRow morphs.  "this does a layout"
                rowTooLong ifTrue: [
                    "pulled up too much; put back the excess and quit"
                    pushOverflowIntoNextRow.
                    ^self.
                ] False: [
                    "delete the now-empty next row and continue
                     to pull up characters unless line now ends
                     in a newline"
                    nextRow deleteRowIfNotFirst.
                    isNewlineTerminated ifTrue: [ ^self ].
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: overAndUnderflow\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         pushOverflowIntoNextRow = ( |
             foundBreak <- bootstrap stub -> 'globals' -> 'false' -> ().
             overflow.
             rightEdge.
            | 
            "Push overflow morphs or morphs following a line
             terminator to the next line. (This method may be
             called when a line terminator is inserted in the
             middle of a row.)"
            "Details: For now, deoptimize and handle this case as
             individual characters. In the future, the deoptimization
             step could replaced by something more clever."

            doLineWrapping
                ifTrue: [ rightEdge: owner globalBounds right - globalPosition x ]
                 False: [ rightEdge: maxSmallInt ].

            deoptimize.
            overflow: list copyRemoveAll.
            morphsDo: [| :m |
                foundBreak ifTrue: [
                    overflow add: m.
                ] False: [
                    ((isLabelMorph: m) && [m label isLineBreak]) ifTrue: [
                        "break line after the lineBreak character"
                        foundBreak: true.
                    ].
                    (m bounds right > rightEdge) ifTrue: [
                        "break line before the first morph that sticks out"
                        foundBreak: true.
                        overflow add: m.
                    ].
                ].
            ].
            foundBreak ifTrue: [
                insertNewRow.
                overflow addAll: nextRow morphs.
                nextRow replaceMorphsWithSuperset: overflow.
            ].
            optimize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         removeMorph: m = ( |
            | 
            "As in parent, but removal of a morph may allow morphs to be
             pulled up from the next row or an empty row to be deleted."

            resend.removeMorph: m.
            handleUnderflowAfterRemoving.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: FollowSlot'
        
         removeTyper = ( |
            | 
            typer delete.
            optimize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         rowHasSelection = ( |
            | 
            selectionRange isNotNil && 
             [selectionRange first != selectionRange last]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: utilties\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         rowTooLong = ( |
            | 
            "Does the given morph hang off the right edge of the receiver?"
            "Details: for now, rows are broken only by explicite lineBreak
             character, not by automatic wrapping."

            doLineWrapping ifFalse: [ ^false ].

            (0 != morphCount) &&
            [lastMorph globalBounds right > owner globalBounds right]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectEntireRow = ( |
            | 
            selectionRange: (0 & baseBounds width) asList.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: enacted by double clicking-- Randy, 1/4/95\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectWordAt: pt = ( |
             afterChars = ' 	

[]()/\'\"*&^@><.,'.
             beforeChars = ' 	

[]()/\'\"*&^@><.,:'.
             inSelection.
             left.
             p.
             right.
            | 

            p: pt - globalPosition.
            left: 0.
            right: p x.
            deoptimize.
            inSelection: true.
            morphsDo: [ | :m |
              (m position x < p x) &&
                [m morphTypeName = labelMorph morphTypeName] ifTrue: [
                  (beforeChars includes: m label) ifTrue: [ 
                     left:  m position x + m baseBounds width.
                   ].
              ].
              inSelection  ifTrue: [
                (m position x >= p x) &&
                ( isLabelMorph: m ) ifTrue: [
                  m label = ':' ifTrue: [
                    right: m position x + m baseBounds width.
                    inSelection: false.
                  ] False: [ 
                    right:  m position x.
                    (afterChars includes:  m label) ifTrue: [
                      inSelection: false.
                    ] False: [
                      right: m position x + m baseBounds width
                    ].
                  ].
                ].
              ].
            ].

            left = right ifTrue: [
              selectionRange: nil.
            ] False: [
              selectionRange: (left & right) asList.
            ].
            optimize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectedRows = ( |
             lst.
            | 
            lst: list copyRemoveAll.
            allRowsDo: [ | :r |
              r rowHasSelection ifTrue: [ lst add: r].
            ].

            lst).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: Return pixels in selected area.\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionArea = ( |
             area <- 0.
            | 
            selectedRows do: [|:r|
              area: area + ((r selectionRange last - r selectionRange first)
                           * r baseBounds height)
            ].
            area).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'ModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (paint named: \'white\')\x7fVisibility: public'
        
         selectionColor <- paint named: 'white'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: see method comment -- Randy, 12/27/94\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionEnd = ( |
             r.
            | 
            "Return the x@y location of the end of the selection. Use the center
             of the row as the y coordinate.  Return nil if there is no selection."
            r: lastRow.
            [r isNil] whileFalse: [
              r selectionRange ifNotNil: [ ^ r selectionRange last  @ r baseBounds topRight y].
              r: r previousRow. 
            ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fComment: see method comment-- Randy, 12/27/94\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionStart = ( |
            | 
            "Return the x@y location of the selection start.  Use the middle of the row
             as the beginning of the selection. Return nil if there is no selection."
            allRowsDo: [ | :r |
              r selectionRange ifNotNil: [ ^ r selectionRange first @ r baseBounds topLeft y ]
            ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: stringHandling\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setFontSpec: fs FontColor: fc = ( |
             tpr.
            | 
            tpr: typer.
            tpr fontSpec:  fs.
            tpr fontColor: fc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: stringHandling\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setString: s = ( |
            | 
            removeAllMorphs.
            appendString: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: typerManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setTyper = ( |
            | deoptimize. addMorph: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: typerManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         setTyperAt: p = ( |
             oldTprRow.
             tpr.
            | 
            "Bring the typer to the current mouse point and
             reoptimize the row it left behind."
            "Details: set the typer's position from the event
             coordinates and add it. Must do a deoptimize of the
             target row before setting the typer's position because
             otherwise addMorph: triggers a deoptimize which triggers
             a layout which resets the position of typer."

            tpr: typer.

                typer isInWorld
            && [typer owner morphTypeName = editorRowMorph morphTypeName] ifTrue: [
              oldTprRow: tpr owner.
            ].
            deoptimize.  "make sure target is deoptimized"
            tpr globalPosition: p.
            addMorph: tpr.
            (oldTprRow = self) || [ oldTprRow isNil ] ifFalse: [
              "reoptimize the row vacated by the typer"
              oldTprRow optimize.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: insertAndBackspace\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         split_line = ( |
            | 
            insertChar: '\n' From: typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: selecting\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         textInSelection = ( |
             text.
            | 
            text: ''.
            selectedRows do: [ | :r . mphs |
               r deoptimize.
               mphs: 
                 (r morphs asList copyFilteredBy: [ | :m. bbcx |
                  (r isLabelMorph: m ) && [
                    bbcx: m baseBounds center x.
                    (r selectionRange first <= bbcx) && [
                      r selectionRange last >= bbcx
                     ]
                   ].
                 ]).

               mphs do: [ | :m | text: text, m label].
               r optimize.
            ].
            text).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         throughFirstWordDo: aBlock MovingForward: isForward = ( |
            | 
            [ | m |
              deoptimize.
              m: isForward ifTrue: [ typer owner morphAfter:  typer ]
                            False: [ typer owner morphBefore: typer ].
              m ifNil: [ ^ optimize ].
              aBlock value: m.
              isWordSeparator: m
            ] whileTrue.

            [ | m |
              deoptimize.
              m: isForward ifTrue: [ typer owner morphAfter:  typer ]
                            False: [ typer owner morphBefore: typer ].
              m isNil || [isWordSeparator: m] ifTrue: [^ optimize ].
              aBlock value: m.
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         toBeginningOfLine: tpr = ( |
            | 

            deoptimize.
            tpr position: -1 @ tpr position y. 
            tpr owner addMorph: tpr. 
            optimize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         toEndOfLine: tpr = ( |
            | 
            deoptimize.
            tpr position: (tpr owner baseBounds width + 1) @ tpr position y. 
            tpr owner addMorph: tpr. 
            optimize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         toNextLine: tpr = ( |
            | 
            nextRow ifNotNil: [
             deselectAll.
             deoptimize.
             nextRow deoptimize. 
             nextRow addMorph: tpr. 
             nextRow optimize.
             optimize
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         toPreviousLine: tpr = ( |
            | 
            previousRow ifNotNil: [
             deselectAll.
             deoptimize.
             previousRow deoptimize. 
             previousRow addMorph: tpr. 
             previousRow optimize.
             optimize
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: typerManipulation\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         typer = ( |
             tpr.
            | 
            tpr: firstRow rawTyper.
            tpr isNil || [tpr owner isNil] ifTrue: [
                "Make a new typer for this editor."
                tpr: caretMorph copyForEditor: self.
                firstRow rawTyper: tpr.
                firstRow safelyDo: [
                  firstRow addMorph: tpr.
                  firstRow moveToBack: tpr.
               ].
            ].
            tpr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'editorRowMorph' -> () From: ( | {
         'Category: editing and typernavigation\x7fModuleInfo: Module: editorMorphs InitialContents: InitializeToExpression: (\' 	

\')\x7fVisibility: private'
        
         whiteSpaceCharacters = ' 	

'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: editorMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         isEditorMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'autoCompletion' From: 'ui2'



 '-- Side effects'

 globals modules editorMorphs postFileIn
