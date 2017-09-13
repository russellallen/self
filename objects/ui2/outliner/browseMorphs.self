 '30.12.1'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'enumerationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals nonpluggableOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerationMorph.

CopyDowns:
globals nonpluggableOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (true)\x7fVisibility: private'
        
         done <- bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (checkBoxMorph)'
        
         filterButton <- bootstrap stub -> 'globals' -> 'checkBoxMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerationMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         result.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         title.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         action = ( |
            | list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsTo: menu = ( |
            | 
            menu addButtonTarget: self
                     ScriptBlock: [target flushAndUpdate: event]
                          Label: 'Flush'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         at: index = ( |
            | result at: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         browseAndFilter = ( |
            | 
            filterButton isDown ifTrue: [browseWellKnown] False: [browse]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildFilteringRow = ( |
             r.
            | 
            r: (rowMorph copyTransparent) borderWidth: 0.

            r addMorphLast:  transparentSpacerMorph copyH: 15.
            r addMorphLast:  (labelMorph copy  label: 'Well-known only') 
                                            fontSpec: fontSpec.
            r addMorphLast:  transparentSpacerMorph copyH: 5.
            r addMorphLast:  filterButton press.
            r addMorphLast:  transparentSpacerMorph copyH: 10.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            "line up expander, button with top of title column"
            resend.buildHeader topJustify).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            title: labelMorph copy label:
              titleString, 
              (hasResult ifTrue: [' [',result size printString,']'] False: '').
            title fontSpec: fontSpec.
            title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         collapse: evt = ( |
            | 
            expander color: paint named: 'black'.
            resend.collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         constructItems = ( |
            | 
            updateTitle.
            result size = 1 ifTrue: [| e |
              e: enumerationMorphElement copyOuter: self Index: 0.
              addItem: e.
              addActivity:
                (messageActivity copyTarget: e 
                                   Selector: 'sprout:' 
                                       Args: vector copyAddFirst: process this birthEvent).
            ] False: [
              result size do: [|:i|
                addItem: enumerationMorphElement copyOuter: self Index: i.
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | 
            uninitializedCopy initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         elementSorter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerationMorph' -> 'elementSorter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerationMorph elementSorter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> 'elementSorter' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         element: e1 Precedes: e2 = ( |
            | e1 name < e2 name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         expand: evt = ( |
            | 
            (message copy receiver: self Selector: 'finishExpanding') forkForBirthEvent: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         finishExpanding = ( |
            | 
            result ifNil: [
              done: false.
              addActivity: periodicMorphStepActivity copyTarget: self Period: 250.
              result: action asVector copySortBy: elementSorter.
            ].
            safelyDo: [resend.expand: process this birthEvent].
            done: true.
            expander colorAll: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         flushAndUpdate: evt = ( |
            | 
            result: nil.
            updateTitle.
            flush: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         hasResult = ( |
            | 
            result isNotNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            vector copyAddFirst: dismissButtonContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.
            borderWidth: 3.
            beShrinkWrap.

            addMorphLast: buildFilteringRow.
            moveToBack: columnUnderHeader.
            colorAll: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'enumerationMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nameAt: index = ( |
            | (at: index) name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         preferences = bootstrap stub -> 'globals' -> 'browseOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | resend.statePrintString, ' ', titleString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         step = ( |
             r.
             w.
            | 
            done ifTrue: [^ self].
            "show me thinking"
             r: paint named: 'red'.
             w: paint named: 'white'.
             expander color: 
               expander color = r ifTrue: [w] False: [r].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         titleString = 'Enumeration'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         uninitializedCopy = ( |
            | resend.copy filterButton: filterButton copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         updateTitle = ( |
            | 
            header replaceMorph: title With: buildTitle.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mirrorEnumerationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'mirrorEnumerationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals enumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'mirrorEnumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals mirrorEnumerationMorph.

CopyDowns:
globals enumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         mirrorEnumerationMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits mirrorEnumerationMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            vector copyAddFirst: mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: mirr = ( |
            | 
            (uninitializedCopy mirror: mirr) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: mirr Event: evt = ( |
            | 
            (copyMirror: mirr) expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         enumerationType = 'enumeration'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: aMorph At: index Event: evt = ( |
            | 
            aMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'mirrorEnumerationMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | 
            world outlinerForMirror:  result at: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            'Enumeration of ', mirror name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesMorph = bootstrap define: bootstrap stub -> 'globals' -> 'referencesMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'mirror' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals mirrorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'referencesMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals referencesMorph.

CopyDowns:
globals mirrorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: mirror parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits referencesMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'referencesMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            browseAndFilter referencesOfReflectee: mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: anObjectOutliner At: index Event: evt = ( |
            | 
            anObjectOutliner unfold: (at: index) Event: evt IfFail: [anObjectOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'referencesMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nameAt: index = ( |
            | 
            (result at: index) name, ' in ', (result at: index) holder name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | 
            world outlinerForMirror:  (at: index) holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'referencesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         titleString = ( |
            | 
            'References of ', mirror name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInModuleMorph = bootstrap define: bootstrap stub -> 'globals' -> 'slotsInModuleMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'mirror' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals referencesMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotsInModuleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotsInModuleMorph.

CopyDowns:
globals referencesMorph. copyRemoveAllMorphs 
SlotsToOmit: mirror parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (modules init)'
        
         module <- bootstrap stub -> 'globals' -> 'modules' -> 'init' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInModuleMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotsInModuleMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            module interestingSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         buildFilteringRow = ( |
            | 
            transparentSpacerMorph copyH: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyModule: mod = ( |
            | 
            (uninitializedCopy module: mod) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyModule: mod Event: evt = ( |
            | 
            (copyModule: mod) expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'slotsInModuleMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'referencesMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 'Slots in module ', module name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addedOrChangedSlotsInModuleMorph = bootstrap define: bootstrap stub -> 'globals' -> 'addedOrChangedSlotsInModuleMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals slotsInModuleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'addedOrChangedSlotsInModuleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals addedOrChangedSlotsInModuleMorph.

CopyDowns:
globals slotsInModuleMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         addedOrChangedSlotsInModuleMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'addedOrChangedSlotsInModuleMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits addedOrChangedSlotsInModuleMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'addedOrChangedSlotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'addedOrChangedSlotsInModuleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenMorph = bootstrap define: bootstrap stub -> 'globals' -> 'childrenMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'mirror' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals mirrorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'childrenMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals childrenMorph.

CopyDowns:
globals mirrorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: mirror parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'childrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         childrenMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'childrenMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits childrenMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'childrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'childrenMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenMorph = bootstrap define: bootstrap stub -> 'globals' -> 'copyDownChildrenMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'mirror' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals mirrorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'copyDownChildrenMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals copyDownChildrenMorph.

CopyDowns:
globals mirrorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: mirror parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownChildrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'mirror' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownChildrenMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'copyDownChildrenMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits copyDownChildrenMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownChildrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'copyDownChildrenMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorEnumerationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'selectorEnumerationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals enumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selectorEnumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selectorEnumerationMorph.

CopyDowns:
globals enumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectorEnumerationMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits selectorEnumerationMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         selector <- 'foo:Bar:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         selectorEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         attachToHand: h = ( |
            | 
            "used when summoning one into the world"
            h attach: self.
            selectAll.
            beTypingFocusFor: h.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         beTypingFocusFor: hand = ( |
            | 
            selectorEditor beTypingFocusFor: hand. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
             frame.
             row.
             t.
            | 
            t: labelMorph copy label: titlePrefix.
            t fontSpec: fontSpec.

            title: columnMorph copyTransparent beShrinkWrap leftJustify borderWidth: 0.
            title addMorphLast: t.

            row: rowMorph copyTransparent beShrinkWrap borderWidth: 0.
            row addMorphLast: transparentSpacerMorph copyH: 11.        
            frame: frameMorph copy beShrinkWrap color: color.
            frame frameStyle: frame insetBezelStyle.
            frame borderWidth: 2.
            selectorEditor:
              smallEditorMorph copyString: selector
                                   Target: self
                                   Accept: selectorChanged
                                    Style: preferences.
            frame addMorphLast: selectorEditor.
            row addMorphLast: frame.
            title addMorphLast: row.
            title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         changed: str Event: evt = ( |
            | 
            selector: str.
            result: nil.
            updateTitle.
            flush: evt.
            expand: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copySelector: sel = ( |
            | 
            (uninitializedCopy selector: sel) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copySelector: sel Event: evt = ( |
            | 
            "copy & expand"
            (copySelector: sel) expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'selectorEnumerationMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAll = ( |
            | 
            selectorEditor selectAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorChanged = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> 'selectorChanged' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits selectorEnumerationMorph selectorChanged.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> 'selectorChanged' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target changed: source contentsString Event: evt.
            source string: source contentsString.
            source editMode: source false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = 'Enumeration of:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            titlePrefix, selector printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownsContainingMorph = bootstrap define: bootstrap stub -> 'globals' -> 'copyDownsContainingMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals selectorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'copyDownsContainingMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals copyDownsContainingMorph.

CopyDowns:
globals selectorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyDownsContainingMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits copyDownsContainingMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'copyDownsContainingMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            copyDownsContainingMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationMorphElement = bootstrap define: bootstrap stub -> 'globals' -> 'enumerationMorphElement' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals indexOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerationMorphElement' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerationMorphElement.

CopyDowns:
globals indexOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationMorphElement = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumerationMorphElement.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationMorphFactory = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> () From: ( |
             {} = 'Comment: I implement creation messages for
enumeration morphs.
This allows experiments that override them.\x7fModuleInfo: Creator: globals enumerationMorphFactory.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         useStandardEnumerationMorphs = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals enumerationMorphFactory useStandardEnumerationMorphs.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (enumerationMorphFactory useStandardEnumerationMorphs)\x7fVisibility: private'
        
         parent* <- bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlot: slotNamePattern StartingFrom: mirror Event: evt = ( |
            | 
            findSlotEnumerationMorph
              copyReceiver: mirror
                   Pattern: slotNamePattern
                     Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: slotName InFamilyOf: mirror Event: evt = ( |
            | 
            implementorsMorph
              copyImplementor: mirror
                     Selector: slotName
                        Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsOf: slotName StartingFrom: mirror Event: evt = ( |
            | 
            implementorsMorph
              copySelector: slotName
                     Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         methodsContaining: desiredText StartingFrom: mirror Event: evt = ( |
            | 
            methodsContainingMorph
              copySelector: desiredText
                     Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         referencesOf: referentMirror StartingFrom: mirror Event: evt = ( |
            | 
            referencesMorph copyMirror: referentMirror Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: slotName InFamilyOf: mirror Event: evt = ( |
            | 
            sendersMorph
              copyReceiver: mirror
                  Selector: slotName
                     Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'enumerationMorphFactory' -> 'useStandardEnumerationMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersOf: slotName StartingFrom: mirror Event: evt = ( |
            | 
            sendersMorph
              copySelector: slotName
                     Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlotEnumerationMorph = bootstrap define: bootstrap stub -> 'globals' -> 'findSlotEnumerationMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'selector' From:
             bootstrap remove: 'selector:' From:
             globals selectorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'findSlotEnumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals findSlotEnumerationMorph.

CopyDowns:
globals selectorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype selector selector:.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlotEnumerationMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits findSlotEnumerationMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (lobby asMirror)\x7fVisibility: public'
        
         receiver <- lobby asMirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         selector <- 'foo*'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'implementorsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals selectorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'implementorsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals implementorsMorph.

CopyDowns:
globals selectorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'implementorsMorph' -> () From: ( | {
         'Comment: mirror of family member for filtering\x7fModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         familyMember.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         implementorsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits implementorsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'implementorsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         methodsContainingMorph = bootstrap define: bootstrap stub -> 'globals' -> 'methodsContainingMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'selector' From:
             globals selectorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'methodsContainingMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals methodsContainingMorph.

CopyDowns:
globals selectorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype selector.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         methodsContainingMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits methodsContainingMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         selector <- 'pattern*'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            browseAndFilter methodsContainingString: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: anObjectOutliner At: index Event: evt = ( |
            | 
            anObjectOutliner unfold: (result at: index) Event: evt IfFail: [anObjectOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'methodsContainingMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nameAt: index = ( |
            | (result at: index) name, ' in ', (result at: index) holder name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | 
            world outlinerForMirror: (at: index) holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = 'Methods containing:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContentsContainingMorph = bootstrap define: bootstrap stub -> 'globals' -> 'initialContentsContainingMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals methodsContainingMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'initialContentsContainingMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals initialContentsContainingMorph.

CopyDowns:
globals methodsContainingMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         initialContensContainingMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'initialContensContainingMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits initialContensContainingMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'initialContentsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'initialContensContainingMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'initialContentsContainingMorph' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            initialContentsContainingMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesMorph = bootstrap define: bootstrap stub -> 'globals' -> 'messagesMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals enumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'messagesMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals messagesMorph.

CopyDowns:
globals enumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         messagesMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits messagesMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'messagesMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         slot <- bootstrap stub -> 'globals' -> 'slots' -> 'method' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         browseMorphs = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'browseMorphs' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'browseMorphs' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules browseMorphs.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browseMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browseMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browseMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         myComment <- 'This module defines ui2 morphs for browsing'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browseMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (\'30.12.1\')\x7fVisibility: public'
        
         revision <- '30.12.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'browseMorphs' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         orphansMorph = bootstrap define: bootstrap stub -> 'globals' -> 'orphansMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'module' From:
             bootstrap remove: 'parent' From:
             globals slotsInModuleMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'orphansMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals orphansMorph.

CopyDowns:
globals slotsInModuleMorph. copyRemoveAllMorphs 
SlotsToOmit: module parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (modules init)'
        
         module <- bootstrap stub -> 'globals' -> 'modules' -> 'init' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         orphansMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'orphansMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits orphansMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'orphansMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersMorph = bootstrap define: bootstrap stub -> 'globals' -> 'sendersMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals selectorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sendersMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sendersMorph.

CopyDowns:
globals selectorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         sendersMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sendersMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sendersMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         receiver.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         slotHoldersMorph = bootstrap define: bootstrap stub -> 'globals' -> 'slotHoldersMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'mirror' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals mirrorEnumerationMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotHoldersMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotHoldersMorph.

CopyDowns:
globals mirrorEnumerationMorph. copyRemoveAllMorphs 
SlotsToOmit: mirror parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Enumeration\x7fModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         slotHoldersMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotHoldersMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotHoldersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'addedOrChangedSlotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            module addedOrChangedSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'addedOrChangedSlotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'addedOrChangedSlotsInModuleMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'addedOrChangedSlotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'addedOrChangedSlotsInModuleMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            'Added or changed slots in module ', module name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'childrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            browseAndFilter childrenOfReflectee: mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'childrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'childrenMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'childrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'childrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         titleString = ( |
            | 
            'Children of ', mirror name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownChildrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            browseAndFilter copyDownChildrenOfReflectee: mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownChildrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'copyDownChildrenMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownChildrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownChildrenMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         titleString = ( |
            | 
            'Copied-down children of ', mirror name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            browseAndFilter copyDownsContainingString: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: anObjectOutliner At: index Event: evt = ( |
            | 
            (anObjectOutliner addAnnotationInfo: evt) annotationInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'copyDownsContainingMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nameAt: index = ( |
            | 
            (result at: index) name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | 
            world outlinerForMirror:  result at: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'copyDownsContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = 'Copy-downs containing:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
             t.
            | 
            header: rowMorph copyTransparent.
            header borderWidth: 1.
            header beFlexible.

            t: labelMorph copy label:
              (outer nameAt: index) copyAtMostWithEllipsis: 80.
            t fontSpec: globals fontSpec copyName: 'verdana' Size: fontSpec size Style: 'italic'.
            header addMorphLast: t.
            addButtonsToHeader.
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'enumerationMorphElement'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'indexOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         preferences = bootstrap stub -> 'globals' -> 'browseOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: evt = ( |
             inner.
             innerOffset.
             o.
             pos.
            | 
            " I would like to precalculate the innerOffset,
              but I cannot get it to work before the object is in the world
              -- dmu
            "
            o:     outer objectAt: index.
            inner: outer interestingPartOfObject: o At: index Event: evt.

            pos: globalPosition + ((baseBounds size x + 7) @ 0).

            o isInWorld ifFalse: [
              world addMorph: o.
            ].
            innerOffset: inner globalPosition - o globalPosition.
            pos: pos - ( 0 @  innerOffset y). "line up inner"
            world moveToFront: o.
            o moveToPosition: pos.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutIndex: evt = ( |
            | 
            sprout: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'enumerationMorphElement' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         statePrintString = ( |
            | 
            resend.statePrintString, ' ', titleString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
             beenHere.
             r.
             searchHere.
            | 
            beenHere: set copyRemoveAll.
            searchHere: set copyRemoveAll add: receiver.
            r: set copyRemoveAll.
            [ | sh |
              searchHere isEmpty ifTrue: [^ r].
              sh: searchHere copy.
              searchHere removeAll.
              beenHere addAll: sh.
              sh do: [|:m|
                m do: [|:s|
                  (s name matchesPattern: selector IgnoreCase: true) ifTrue: [
                    r add: s isAssignment ifTrue: [s correspondingDataSlot]
                                           False: [s].
                  ].
                  s isParent  &&  [(beenHere includes: s contents) not]
                    ifTrue: [searchHere add: s contents].
                ].
              ].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         buildFilteringRow = ( |
            | 
            transparentSpacerMorph copyH: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
             frame.
             row.
             t.
            | 
            resend.buildTitle.

            row: rowMorph copyTransparent beShrinkWrap borderWidth: 0.
            row addMorphLast: transparentSpacerMorph copyH: 11.        
            t: labelMorph copy label: 'Starting lookup from:'.
            t fontSpec: fontSpec.
            row addMorphLast: t.
            title addMorphLast: row.

            row: (rowMorph copy beShrinkWrap color: color) borderWidth: 0.
            row addMorphLast: transparentSpacerMorph copyH: 22.        
            frame: frameMorph copy beShrinkWrap color: color.
            frame frameStyle: frame insetBezelStyle.
            frame borderWidth: 2.
            frame addMorphLast:
              smallEditorMorph copyString: receiver safeName
                                   Target: self
                                   Accept: receiverChanged
                                    Style: preferences.
            row addMorphLast: frame.
            title addMorphLast: row.
            title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         changed: str Event: evt = ( |
            | 
            selector: str.
            result: nil.
            updateTitle.
            flush: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: rcv = ( |
            | 
            copyReceiver: rcv Pattern: pattern).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: rcv Event: evt = ( |
            | (copyReceiver: rcv) expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: rcv Pattern: pat = ( |
            | 
            ((uninitializedCopy receiver: rcv) selector: pat) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: rcv Pattern: pat Event: evt = ( |
            | (copyReceiver: rcv Pattern: pat) expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: anObjectOutliner At: index Event: evt = ( |
            | 
            anObjectOutliner unfold: (result at: index) Event: evt IfFail: [anObjectOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'findSlotEnumerationMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nameAt: index = ( |
            | 
            (result at: index) name, ' in ', (result at: index) holder name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | 
            world outlinerForMirror: (result at: index) holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = ( |
            | selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern: pat = ( |
            | selector: pat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         receiverChanged = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> 'receiverChanged' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits findSlotEnumerationMorph receiverChanged.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> 'receiverChanged' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target receiverChanged: source contentsString Event: evt.
            source string: source contentsString.
            source editMode: source false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         receiverChanged: str Event: evt = ( |
            | 
            receiver: reflect: str eval.
            result: nil.
            updateTitle.
            flush: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'findSlotEnumerationMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = 'Slots matching:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
             r.
            | 
            r: browseAndFilter implementorsOf: selector.
            limitToFamily ifFalse: [^ r].
            (r asList copyFilteredBy: [|:m|
               (m inheritsFrom: familyMember)
            || [familyMember inheritsFrom: m]
            ]) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyImplementor: i Selector: s Event: evt = ( |
            | 
            (resend.copySelector: s Event: evt) familyMember: i).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copySelector: sel Event: evt = ( |
            | 
            copyImplementor: nil Selector: sel Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: anObjectOutliner At: index Event: evt = ( |
            | 
            anObjectOutliner unfold: (anObjectOutliner model mirror at: selector IfAbsent: [^ anObjectOutliner])
                             Event: evt
                            IfFail: [anObjectOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         limitToFamily = ( |
            | 
            familyMember isNotNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'implementorsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | 
            world outlinerForMirror:  at: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'implementorsMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = ( |
            | 
             'Implementors', (limitToFamily ifFalse: ' ' True: ' in family'),
            ' of:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'initialContensContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            browseAndFilter initialContentsContainingString: selector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'initialContensContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: anObjectOutliner At: index Event: evt = ( |
             o.
            | 
            o: resend.interestingPartOfObject: anObjectOutliner At: index Event: evt.
            o addAnnotationInfo: evt.
            o annotationInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'initialContensContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'intitialContentsContainingMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'initialContensContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'methodsContainingMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'initialContensContainingMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = 'Initial contents containing:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | slot contents messages asVector sort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         buildFilteringRow = ( |
            | 
            transparentSpacerMorph copyH: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlot: s = ( |
            | 
            (uninitializedCopy slot: s) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlot: s Event: evt = ( |
            | 
            ( copySlot: s ) expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         elementSorter = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'messagesMorph' -> 'elementSorter' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits messagesMorph elementSorter.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> 'elementSorter' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         element: e1 Precedes: e2 = ( |
            | 
            e1 < e2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: aMorph At: index Event: evt = ( |
            | 
            aMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'messagesMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nameAt: index = ( |
            | at: index).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | implementorsMorph copySelector: (result at: index)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'enumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'messagesMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            'Messages of ', slot name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            transporter moduleDictionary orphans).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsTo: menu = ( |
            | 
            resend.addButtonsTo: menu.
            menu         addButtonTarget: self
                 AsynchronousScriptBlock: [target autoAssignSlots]
                          Label: 'Assign slots to modules automatically'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         autoAssignSlots = ( |
            | 
            transporter moduleDictionary putEasyOrphansInModules.
            flushAndUpdate: process this birthEvent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'orphansMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsInModuleMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'orphansMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            action size printString,
            ' Expatriate Slot',
            (action size = 1  ifTrue: '' False: 's'),
            ' (not in any module)').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
             r.
            | 
            r: browseAndFilter sendersOf: selector.
            limitToFamily ifFalse: [^ r].
            (r asList copyFilteredBy: [|:s|
               (s holder inheritsFrom: receiver)
            || [receiver inheritsFrom: s holder]
            ]) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyReceiver: mir Selector: sel Event: evt = ( |
            | 
            (resend.copySelector: sel Event: evt) receiver: mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copySelector: sel Event: evt = ( |
            | copyReceiver: nil Selector: sel Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         interestingPartOfObject: anObjectOutliner At: index Event: evt = ( |
            | 
            anObjectOutliner unfold: (result at: index) Event: evt IfFail: [anObjectOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         limitToFamily = ( |
            | 
            receiver isNotNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'sendersMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         nameAt: index = ( |
            | 
            (result at: index) name, ' in ', (result at: index) holder name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         objectAt: index = ( |
            | 
            world outlinerForMirror: (result at: index) holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'selectorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sendersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         titlePrefix = ( |
            | 
            'Senders', (limitToFamily ifFalse: ' ' True: ' in family '), 'of:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         action = ( |
            | 
            module interestingHolders).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyModule: m = ( |
            | 
            (uninitializedCopy module: m) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: public'
        
         copyModule: m Event: evt = ( |
            | 
            (copyModule: m) expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         enumerationType = 'slotHolders'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'mirrorEnumerationMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotHoldersMorph' -> () From: ( | {
         'ModuleInfo: Module: browseMorphs InitialContents: FollowSlot'
        
         titleString = ( |
            | 
            'Holders of slots in module:', module name).
        } | ) 



 '-- Side effects'

 globals modules browseMorphs postFileIn
