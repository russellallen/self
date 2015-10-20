 'Sun-$Revision: 30.12 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot'
        
         ui2Button = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui2Button.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot'
        
         myComment <- '\' \'  \"A conventional look and feel (sorta) button\"'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            ui2Button initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Button = bootstrap define: bootstrap stub -> 'globals' -> 'ui2Button' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'baseMinHeight' From:
             bootstrap remove: 'baseMinWidth' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui2Button.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: baseMinHeight baseMinWidth parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinHeight <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         baseMinWidth <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultButtonActionObject <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2Button' -> 'defaultButtonActionObject' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2Button defaultButtonActionObject.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'Category: ui2Button State\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonActionObject <- bootstrap stub -> 'traits' -> 'ui2Button' -> 'defaultButtonActionObject' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'Category: ui2Button State\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (paint copyRed: 0.770283 Green: 0.770283  Blue: 0.770283)\x7fVisibility: public'
        
         depressedColor <- paint copyRed: 0.770283 Green: 0.770283  Blue: 0.770283.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'Category: ui2Button State\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isAsynchronous <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         ui2Button = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2Button.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'ui2Button' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         rawIsGrayedOut <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'Category: ui2Button State\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (\'up\')\x7fVisibility: private'
        
         rawState <- 'up'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui2Button' -> () From: ( | {
         'Category: ui2Button State\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (\'target buttonPress: button Event: event\')\x7fVisibility: private'
        
         script <- 'target buttonPress: button Event: event'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         actionThenRaiseEvent: evt = ( |
            | 
            "forked from leftMouseUp:"
            updateInstalledScript.
            buttonActionObject event: evt From: self.
            state: 'up').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "Keep submorphs from seeing leftMouseDown and middleMouseDown events."
            evt leftMouseDown not && [evt middleMouseDown not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            "Copy the button and its action object."

            new: resend.baseCopy.
            new buttonActionObject: buttonActionObject copy.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
            | 
            c fillRectangle: baseBounds Color: color.
            resend.baseDrawOn: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonArgs = ( |
            | buttonActionObject buttonArgs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonArgs: lst = ( |
            | 
            buttonActionObject buttonArgs: lst. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: special layout\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         centerJustifyVertically = ( |
             m.
            | 
            m: morphs.
            removeAllMorphs.
            addMorph:
              (rowMorph copy 
                beFlexibleVertically
                beShrinkWrapHorizontally
                borderWidth: 0)
                addAllMorphs: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         changeDepressedState = ( |
            | 
            frameStyle:
             case if: [ rawState = 'down' ] Then: [ insetBezelStyle ]
                  If: [ rawState = 'up'   ] Then: [      bezelStyle ]
                  Else: flatStyle.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         color = ( |
            | 
            case if: [ rawState = 'down' ]  Then:  [ depressedColor ]
                 If: [ rawState = 'up'   ]  Then:  [       rawColor ]
                                            Else:  [    middleColor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         color: c = ( |
            | 
            resend.color: c.
            depressedColor:  c copyBrighterBy:
              c brightness >= paint virtualGrayBrightness
                ifTrue:  0.05  
                 False: -0.05.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: c = ( |
             isG.
            | 
            isG: isGrayedOut.
            isGrayedOut: false.
            resend.colorAll: c.
            isGrayedOut: isG).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         copyColor: col Target: tar = ( |
             new.
            | 
            new: copy.
            new color: col.
            new target: tar.
            new frameStyle: bezelStyle.
            new rawIsGrayedOut: false.
            new centerJustify.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         copyColor: col Target: tar Inner: inner = ( |
             new.
            | 
            new: (copyRemoveAllMorphs color: col) target: tar.
            new addMorph: inner.
            new state: 'up'.
            new frameStyle: bezelStyle.
            new rawIsGrayedOut: false.
            new centerJustify.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'defaultButtonActionObject' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (list)\x7fVisibility: public'
        
         buttonArgs <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'defaultButtonActionObject' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             m.
            | 
            m: resend.copy.
            m buttonArgs: buttonArgs copy.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'defaultButtonActionObject' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot'
        
         event: event From: button = ( |
            | target buttonPress: button Event: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'defaultButtonActionObject' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'defaultButtonActionObject' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (paint named: \'black\')\x7fVisibility: public'
        
         defaultFontColor <- paint named: 'black'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (globals fontSpec copyName: \'verdana\' Size: 12)\x7fVisibility: public'
        
         defaultFontSpec <- globals fontSpec copyName: 'verdana' Size: 12.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         findMorphWithLabel = ( |
            | "Finds the first (top-left most) submorph that purports to be a label"
            allMorphsDo: [ | :m | 
                m morphTypeName = labelMorph morphTypeName ifTrue: [^ m ].
            ].
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         finishSettingScript: rr = ( |
             ms.
            | 
            ms: (reflect: rr result) first.
            (reflect: buttonActionObject) addSlot: ms.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fComment: Flash button for menu feedback.
Better be called in a thread sync\'ed to the UI update one.
-- Ungar, 6/19/95\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         flash = ( |
             yuk <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            yuk: host osName = 'macOS'. "delay broken on mac"
            2 do: [
              state: 'down'.
              world displayUpdateNow.
              yuk ifFalse: [times delay: 20].
              state: 'up'.
              world displayUpdateNow.
              yuk ifFalse: [times delay: 20].
            ].
            state: 'down'.
            world displayUpdateNow.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fComment: Used by menus when
they contain this button -- Randy, 1/10/95\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         flattenAndSelect: isSelected = ( |
            | 
            "Used when in a menu by the menu."
             frameStyle: flatStyle.
             rawState: isSelected ifTrue: 'down' False: 'up').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fComment: Used by menus when
they contain this button -- Randy, 1/10/95\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         indentAndSelect: isSelected = ( |
            | 
            "Used when in a menu by the menu."
             frameStyle: insetBezelStyle.
             rawState: isSelected ifTrue: 'down' False: 'up').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
             r.
            | 
            removeAllMorphs.
            color: paint named: 'lightGray'.
            filled: false.
            rawState: 'up'.
            borderWidth: 2.
            frameStyle: bezelStyle.
            beShrinkWrap.
            setWidth: 10 Height: 10.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         installedScript = ( |
            | 
            ((reflect: buttonActionObject) at: 'event:From:') contents source).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         isButton = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         isDown = ( |
            | 
            rawState = 'down').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         isGrayedOut = ( |
            | rawIsGrayedOut).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         isGrayedOut: b = ( |
            | 
            b = isGrayedOut ifTrue: [ ^self ].
            rawIsGrayedOut: b.
            morphsDo: [ | :m | 
              m color: b ifTrue: [ m color  asSubduedColorForBackground: color ]
                          False: [ m color asEnhancedColorForBackground: color ].
            ].
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         label = ( |
            | 
            findMorphWithLabel ifNil: [''] IfNotNil: [|:m| m label]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         label: str = ( |
            | 
            findMorphWithLabel ifNil: [
              label: str 
                FontSpec:  defaultFontSpec
                FontColor: defaultFontColor.
            ] IfNotNil: [|:m|
              label: str 
                FontSpec:  m fontSpec
                FontColor: m color.
             ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         label: str FontSpec: fSpec FontColor: fColor = ( |
            | 
             findMorphWithLabel ifNil: [
                 addMorph: (labelMorph copyLabel: str FontSpec: fSpec Color: fColor).
             ] IfNotNil: [|:m|
                 m label: str. 
                 m fontSpec: fSpec.
                 m color:    fColor.
             ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            (evt sourceHand capabilitySet includes: capabilities pressButton) ifFalse: [ ^ self].
            isGrayedOut ifFalse: [ state: 'down' ].  
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            evt sourceHand unsubscribeCursor: self.
            isGrayedOut ifTrue: [ ^self ].
            (globalBounds includes: evt cursorPoint) ifTrue: [
              state: 'middle'.
              isAsynchronous 
                ifFalse: [ actionThenRaiseEvent: evt ]
                 True:   [ (message copy receiver: self 
                                         Selector: 'actionThenRaiseEvent:' 
                                             With: evt
                           ) forkForBirthEvent: evt].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            "Update any intra-morph references within the button's args."

            resend.mapReferencesUsing: dict.
            dict if: target IsPresentDo: [| :n | target: n ].
            buttonActionObject buttonArgs do: [| :arg. :i |
                dict if: arg IsPresentDo: [| :n | 
                    buttonActionObject buttonArgs at: i Put: n.
                ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         middleColor = ( |
            | 
            rawColor interpolate: 0.5 From: depressedColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
             menu.
            | 
            menu: ui2Menu copy color: nonpluggableOutliner menuColor.
            menu addButtonTarget: self ScriptBlock: [target setTarget] Label: 'Set Target'.
            defaultButtonHolder: menu initializeDefaultButtonHolder: defaultButtonHolder.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'ui2Button'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | 
            isGrayedOut ifTrue: [ ^self ].
            state: (globalBounds includes: evt cursorPoint) ifTrue: 'down' False: 'up'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fComment: Used by menus when
they contain this button -- Randy, 1/10/95\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         outdentAndSelect: isSelected = ( |
            | 
            "Used when in a menu by the menu."
             frameStyle: flatStyle.
             rawState: isSelected ifTrue: 'down' False: 'up').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         propertySheets = ( |
            | 
            resend.propertySheets copyAddLast:
                (buttonPropsMorph copyTarget: self)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         resultReporter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui2Button resultReporter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'Comment: Put it up at this level
so fork can set it.
-- Ungar, 1/11/95\x7fModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         event.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         failedInProcess: p = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot'
        
         finished = ( |
            | 
            inProgressActivity cutToFinish.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         howToReport <- 'reportResult:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot'
        
         inProgressActivity.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'string' -> 'resultReporter' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (morph)\x7fVisibility: public'
        
         reportTo <- bootstrap stub -> 'globals' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         result.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         started = ( |
            | 
            inProgressActivity:
            reportTo colorThrobTo: (paint named: 'white')
                    TimePerThrob: 1
                       NumThrobs: infinity.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         succeededReturning: result = ( |
            | 
            result: result.
            howToReport sendTo: reportTo With: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> 'resultReporter' -> () From: ( | {
         'ModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         syntaxError: err = ( |
             se.
            | 
            se: syntaxErrorMorph copyMessage: err printString.
            event ifNil: [ | w |
              w: reportTo world.
              w addMorph: se.
              w moveToFront: se.
              se moveToPosition: reportTo globalPosition.
            ] IfNotNil: [
              event sourceHand safelyDo: [  
                editor selectionStart: err start
                                  End: err end.
                event sourceHand attach: se.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         scriptBlock: b = ( |
            | 
            "used to be:
              script: b asMirror valueSlot contents source."
            "add in slots for temps"
            script:( selfMethodText copyForMethod: b asMirror valueSlot contents) formatMethodBody asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         setTarget = ( |
             last.
             myBounds.
            | 
            "Set the receiver's target to the top morph below it,
             but if the morph is an object outliner, set to the referrent.."

            myBounds: globalBounds.
            world morphsReverseDo: [| :m |
                m = self ifTrue: [
                    last ifNotNil: [
                        target: last root.
                        target isPluggableOutliner && 
                        [target model isSelfObjectModel]  ifTrue: [
                          [|:exit|
                            target: target model mirror reflecteeIfFail: exit.
                          ] exit.
                        ].
                        ^self.
                    ].
                ].
                (myBounds intersects: m globalBounds) ifTrue: [ last: m ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: events\x7fComment: Used when a keystroke, etc
is supposed to simulate actually pressing the button.
-- Ungar, 2/4/95\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         simulateButtonPress: evt = ( |
            | 
            leftMouseDown: evt.
            leftMouseUp:   evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fComment: newState is up down or middle
-- Ungar, 2/9/95\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         state: newState = ( |
            | 
            isGrayedOut ifTrue: [^ self].
            newState = rawState  ifFalse: [
              rawState: newState.
              changeDepressedState.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         target = ( |
            | buttonActionObject target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         target: obj = ( |
            | buttonActionObject target: obj. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: private'
        
         updateInstalledScript = ( |
            | 
            script = installedScript ifFalse: [
              script evalObjectBodyInContext: lobby asMirror
                  Prefix: ' | event: event From: button = ( '
                  Postfix: ' ) | '
                  ReportingTo: 
                    (resultReporter copy
                      reportTo: self)
                      howToReport: 'finishSettingScript:'.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2Button' -> () From: ( | {
         'Category: button issues\x7fComment: Set font to what ui2Menu uses.-- Ungar, 6/11/95\x7fModuleInfo: Module: ui2Button InitialContents: FollowSlot\x7fVisibility: public'
        
         useDefaultMenuFont = ( |
            | 
            label: label FontSpec: ui2Menu defaultFontSpec
                        FontColor: ui2Menu defaultFontColor).
        } | ) 



 '-- Side effects'

 globals modules ui2Button postFileIn
