 '$Revision: 1.3 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot'
        
         operandSelectors = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules operandSelectors.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn
            operandSelectorsMorph initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.3 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'operandSelectors' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         operandSelectorsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals operandSelectorsMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: Operand Selectors State\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         activationModel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: Operand Selectors State\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         operandSelectors <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: System\x7fCategory: Morphs\x7fCategory: Widgets\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         operandSelectorsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits operandSelectorsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: Operand Selectors State\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         selectorColumns <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         add: operand = ( |
             cols.
             lastColumn.
             opSel.
            | 

            opSel: operandSelector copyForTarget: self Label: operand name.

            cols: selectorColumns morphs.
            lastColumn:
                   cols isEmpty
              ||  [cols last morphCount >= maxEntriesPerColumn]
                ifTrue: [ makeNewColumn ]
                 False: [ cols last ].

            lastColumn addMorphLast: opSel.
            operandSelectors at: operand Put: opSel.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         addAll: operands = ( |
            | 
            operands do: [|:operand| add: operand ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: resizing spacers\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         alignSelectors = ( |
            | resizeSpacers).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: event dispatching\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            evt middleMouseDown not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
            | 
            resend.baseCopy operandSelectors: operandSelectors copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: constructiing\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buildRowForSelectorColumns = ( |
            | 
            selectorColumns: rowMorph copy topJustify beShrinkWrap borderWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: constructiing\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSkeleton = ( |
            | 
            buildRowForSelectorColumns.

            beShrinkWrapVertically.
            beFlexibleHorizontally.
            centerJustify.
            frameStyle: frameMorph insetBezelStyle.
            borderWidth: 1.
            addMorph: selectorColumns.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPrototype = ( |
            | 
            activationModel buttonPrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForActivationModel: am = ( |
            | 
            copy activationModel: am).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForActivationModel: am Operands: ops = ( |
            | 
            (copyForActivationModel: am) addAll: ops).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: dismissing\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         dismiss: event = ( |
            | 
            activationModel hideOperandSelectors: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: resizing spacers\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         findMaxLabelWidth = ( |
            | 
            (operandSelectors asVector copyMappedBy: [|:s| s label width]) max).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: constructiing\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            operandSelector initializePrototype. 
            safelyDo: [
              removeAllMorphs.
              buildSkeleton.
            ].
            operandSelectors: dictionary copyRemoveAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         makeNewColumn = ( |
             c.
            | 
            c: columnMorph copy beShrinkWrapVertically borderWidth: 2.
            selectorColumns addMorphLast: c.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: selectorColumns IsPresentDo: [| :new | selectorColumns: new ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (8)\x7fVisibility: private'
        
         maxEntriesPerColumn <- 8.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: resizing spacers\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         minSpaceBetweenLabelAndTristate = 3.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'operandSelectorsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: prototypes\x7fComment: The prototypical operand selector object\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         operandSelector = bootstrap define: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits operandSelectorsMorph operandSelector.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () From: ( | {
         'Category: Operand Selector State\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         label <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits operandSelectorsMorph operandSelector parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         advanceToNextState = ( |
            | 
            tristate advanceToNextState.
            target selectionChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buildButton = ( |
            | 
            addMorph: ((ui2Button copy target: self)
                                  scriptBlock: [target advanceToNextState])
                                     addMorph: buttonContentsRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buildButtonContents = ( |
            | 
            buildLabel.
            buildSpacer.
            buildTristate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLabel = ( |
            | 
            label: labelMorph copy fontSpec: labelFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSpacer = ( |
            | 
            spacer: spacerMorph copyH: 0 Color: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTristate = ( |
            | 
            tristate: tristateIndicatorMorph copy setStateMaybe radius: 6).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonContentsRow = ( |
            | 
            buildButtonContents.
            (((rowMorph copy beShrinkWrap centerJustify borderWidth: 2)
                            addMorphLast: label)
                            addMorphLast: spacer)
                            addMorphLast: tristate).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForTarget: t Label: l = ( |
            | 
            (resend.copy target: t)
              initializeForLabel: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeForLabel: l = ( |
            | 
            label label: l.

            spacer color: target color.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            removeAllMorphs.
            buildButton.
            beFlexible).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: construction\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         labelFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: traits operandSelectorsMorph operandSelector parent labelFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: label    IsPresentDo: [| :new | label:    new ].
            dict if: spacer   IsPresentDo: [| :new | spacer:   new ].
            dict if: tristate IsPresentDo: [| :new | tristate: new ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'operandSelectorsMorph operandSelector'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () From: ( | {
         'Category: Operand Selector State\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         spacer <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () From: ( | {
         'Category: Operand Selector State\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> 'operandSelector' -> () From: ( | {
         'Category: Operand Selector State\x7fModuleInfo: Module: operandSelectors InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         tristate <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'ModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             b.
             m.
            | 
            m: ui2Menu copy.
            m addButtonTarget: self ScriptBlock: [target setAllToYes    ] Label: 'Set All to Yes'.
            m addButtonTarget: self ScriptBlock: [target setAllToNo     ] Label: 'Set All to No'.
            m addButtonTarget: self ScriptBlock: [target setAllToMaybe  ] Label: 'Set All to Maybe'.
            m addButtonTarget: self ScriptBlock: [target setAllToRandom ] Label: 'Set All to Random!'.
            m addDivider.
            m addButtonTarget: self ScriptBlock: [target dismiss: event ] Label: 'Dismiss'.

            m popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: resizing spacers\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeSpacers = ( |
             tabPosition <- 0.
            | 
            "Don't bother resizing if our topmost owner isn't the world
             morph, because in that case labelMorph's width method is 
             not accurate -ma 2/02"
            isInWorld ifFalse: [^ self].

            tabPosition: findMaxLabelWidth + minSpaceBetweenLabelAndTristate.
            operandSelectors do: [|:opSel|
              opSel spacer setWidth:  tabPosition - opSel label width
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         selectOperandsGivenDefaults: operands = ( |
             newOperandSet.
            | 
            newOperandSet: operands copy asSet.
            operandSelectors do: [|:opSel. :operand|
              opSel tristate ifYes: [newOperandSet add: operand]
                             Maybe: []
                                No: [newOperandSet remove: operand IfAbsent: []]
            ].
            newOperandSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionChanged = ( |
            | 
            activationModel operandSelectorsChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: setting all my buttons\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         setAllToMaybe = ( |
            | 
            setAllTristates: [|:t| t setStateMaybe ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: setting all my buttons\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         setAllToNo = ( |
            | 
            setAllTristates: [|:t| t setStateNo ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: setting all my buttons\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         setAllToRandom = ( |
             gen.
             state.
            | 
            gen: randomLC copy.
            setAllTristates: [|:t|
              state: gen integer: 3.
              case if: [state = 0] Then: [t setStateNo]
                   If: [state = 1] Then: [t setStateMaybe]
                   If: [state = 2] Then: [t setStateYes].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: setting all my buttons\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: public'
        
         setAllToYes = ( |
            | 
            setAllTristates: [|:t| t setStateYes ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'operandSelectorsMorph' -> () From: ( | {
         'Category: setting all my buttons\x7fModuleInfo: Module: operandSelectors InitialContents: FollowSlot\x7fVisibility: private'
        
         setAllTristates: setterBlock = ( |
            | 
            operandSelectors do: [|:entry|
              setterBlock value: entry tristate
            ].
            selectionChanged).
        } | ) 



 '-- Side effects'

 globals modules operandSelectors postFileIn
