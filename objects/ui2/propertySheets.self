 '$Revision: 30.11 $'
 '
Copyright 1992-2011 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         subPropertiesSheetMorph = bootstrap define: bootstrap stub -> 'globals' -> 'subPropertiesSheetMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals columnMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'subPropertiesSheetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals subPropertiesSheetMorph.

CopyDowns:
globals columnMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         subPropertiesSheetMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits subPropertiesSheetMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         title <- 'Untitled'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptPropertyChanges = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildContents = ( |
             c.
             entriesC.
             entriesR.
             line.
             titleR.
            | 
            removeAllMorphs.
            borderWidth: 0.
            beFlexible.

            line: frameMorph copy color: color.
            line borderWidth: 1.
            line frameStyle: line insetBezelStyle.
            line setHeight: 2.
            line beFlexibleHorizontally.
            line beRigidVertically.

            titleR: rowMorph copy color: color.
            titleR borderWidth: 0.
            titleR beFlexible.
            titleR addAllMorphs: (
                (line copy beRigid setWidth: 15)          &
                (spacerMorph copyH: 5 Color: color)       &
                (labelMorph copyLabel: title
                    FontSpec: (outlinerPreferences mediumFontSpec copyName: 'verdana' Style: 'italic')
                    Color:    paint named: 'black')       &
                (spacerMorph copyH: 5 Color: color)       &
                line copy) asVector.

            entriesC: columnMorph copy beFlexible color: color.
            entriesC borderWidth: 0.
            entriesC addAllMorphs: buildPropertyEntries.

            entriesR: rowMorph copy beFlexible color: color.
            entriesR borderWidth: 0.
            entriesR addAllMorphs:
                ((spacerMorph copyH: 6 Color: color) & entriesC) asVector.

            addAllMorphs: (
                (spacerMorph copyV: 5 Color: color) &
                titleR                              &
                (spacerMorph copyV: 3 Color: color) &
                entriesR) asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: field construction\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildEnumeratedFieldNamed: n Labels: labels Values: values InitialValue: v = ( |
             f.
            | 
            defaultButtonHolder: ui2Menu initializeDefaultButtonHolder: defaultButtonHolder.
            f: enumeratedTypeLabelMorph copyItemNames: labels Values: values DefaultButtonHolder: defaultButtonHolder.
            f setSelectedIndex: (values asVector keyAt: v IfAbsent: [ values asVector keyAt: 'defaultFont']).
            f fontSpec: globals fontSpec copyName: 'verdana' Size: outlinerPreferences mediumFontSize Style: 'bold'.
            buildFieldLabel: n ContentMorph: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: field construction\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildFieldLabel: s ContentMorph: contentM = ( |
             labelM.
             r.
            | 
            labelM: labelMorph copyLabel: s
                FontSpec: ( outlinerPreferences mediumFontSpec copyName: 'verdana' )
                Color:    (paint named: 'black').
            r: rowMorph copy color: color.
            r borderWidth: 0.
            r beFlexible.
            r baseMinHeight: (outlinerPreferences mediumFontSize + 6).
            r addAllMorphs: (
                labelM &
                ((spacerMorph copy beFlexible color: color) baseMinWidth: 5) &
                contentM) asVector.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildPropertyEntries = ( |
            | vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: field construction\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTextFieldNamed: n String: s = ( |
             e.
             f.
            | 
            e: editorMorph copy.
            e setFontSpec: (outlinerPreferences mediumFontSpec copyName: 'verdana' Style: 'bold')
                FontColor: (paint named: 'black').
            e appendString: s.
            s isEmpty ifTrue: [ e appendString: '   ' ].
            e colorAll: (paint named: 'offWhite').
            e borderWidth: 1.
            f: frameMorph copy beShrinkWrap color: color.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 2.
            f addMorph: e.
            buildFieldLabel: n ContentMorph: f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: field construction\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsOfEnumeratedField: f = ( |
            | f lastMorph getSelectedValue).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: field construction\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsOfTextField: f = ( |
            | f lastMorph firstMorph contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         copyTarget: m Title: t = ( |
             new.
            | 
            new: copy color: color.
            new target: m.
            new title: t.
            new buildContents.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            color: (paint named: 'lightGray').
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: target IsPresentDo: [| :n | target: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         morphTypeName = 'subPropertiesSheetMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'columnMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         borderPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'borderPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'borderPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals borderPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'borderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         borderStyleField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'borderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         borderWidthField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         borderPropsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits borderPropsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'borderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'borderPropsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         buttonPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'buttonPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'buttonPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals buttonPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         labelField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         buttonPropsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits buttonPropsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         scriptField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         constructionPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'constructionPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'constructionPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals constructionPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constructionPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         modeField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         constructionPropsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits constructionPropsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'constructionPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         labelPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'labelPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'labelPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals labelPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         fontNameField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         fontSizeField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         fontStyleField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         labelPropsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits labelPropsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'labelPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'labelPropsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         propertySheets = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'revision:' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules propertySheets.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision revision: subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            propertiesSheetMorph     initializePrototype.
            subPropertiesSheetMorph  initializePrototype.
            resizingPropsMorph       initializePrototype.
            labelPropsMorph          initializePrototype.
            borderPropsMorph         initializePrototype.
            buttonPropsMorph         initializePrototype.
            sliderPropsMorph         initializePrototype.
            constructionPropsMorph   initializePrototype.
            enumeratedTypeLabelMorph initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'propertySheets' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         propertiesSheetMorph = bootstrap define: bootstrap stub -> 'globals' -> 'propertiesSheetMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'propertiesSheetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals propertiesSheetMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         propertiesSheetMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits propertiesSheetMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'propertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'propertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         subsheets <- bootstrap stub -> 'globals' -> 'list' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'propertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         resizingPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'resizingPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'resizingPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals resizingPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizingPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         baseMinHeightField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizingPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         baseMinWidthField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizingPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         hResizingField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         resizingPropsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits resizingPropsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizingPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'resizingPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         vResizingField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         sliderPropsMorph = bootstrap define: bootstrap stub -> 'globals' -> 'sliderPropsMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals subPropertiesSheetMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'sliderPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals sliderPropsMorph.

CopyDowns:
globals subPropertiesSheetMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         maxValueField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         minValueField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: InitializeToExpression: (nil)'
        
         orientationField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         sliderPropsMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits sliderPropsMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'sliderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         selectorField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
            | 
            "Note: This properties sheet is used for frames, rows, and
             columns, but only frames have a borderStyle."

            target changed.
            borderStyleField ifNotNil: [
                target frameStyle: (contentsOfEnumeratedField: borderStyleField).
            ].
            target borderWidth: (contentsOfTextField: borderWidthField) asInteger.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
             entries.
            | 
            "Note: This properties sheet is used for frames, rows, and
             columns, but only frames have a borderStyle."

            entries: list copyRemoveAll.
            borderStyleField: nil.
            ((reflect: target) includesKey: 'frameStyle:') ifTrue: [
                borderStyleField:
                    (buildEnumeratedFieldNamed: 'Style'
                        Labels: ('Bezel' & 'Inset Bezel' & 'Flat') asVector
                        Values: (frameMorph      bezelStyle &
                                 frameMorph insetBezelStyle &
                                 frameMorph       flatStyle ) asVector
                        InitialValue: target frameStyle).
                entries add: borderStyleField.
            ].
            borderWidthField:
                (buildTextFieldNamed: 'Width' String: target borderWidth printString).
            entries add: borderWidthField.
            entries).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | copyTarget: m Title: 'Border Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: borderStyleField IsPresentDo: [| :n | borderStyleField: n ].
            dict if: borderWidthField IsPresentDo: [| :n | borderWidthField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'borderPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'borderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
            | 
            target  label: (contentsOfTextField: labelField).
            target script: (contentsOfTextField: scriptField).
            target updateInstalledScript. "forces syntax to be checked right away"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
            | 
            labelField:  (buildTextFieldNamed:  'Label' String: target label).
            scriptField: (buildTextFieldNamed: 'Script' String: target script).
            (labelField & scriptField) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | copyTarget: m Title: 'Button Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if:  labelField IsPresentDo: [| :n |  labelField: n ].
            dict if: scriptField IsPresentDo: [| :n | scriptField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'buttonPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
            | 
            target velcroFlag: (contentsOfEnumeratedField: modeField).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
            | 
            modeField:
                (buildEnumeratedFieldNamed: 'Velcro'
                    Labels: ('On' & 'Off') asVector
                    Values: (true & false) asVector
                    InitialValue: target velcroFlag).
            vector copyAddLast: modeField).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | copyTarget: m Title: 'Construction Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: modeField IsPresentDo: [| :n | modeField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'constructionPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'constructionPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Properties\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot'
        
         enumeratedTypeLabelMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'enumeratedTypeLabelMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits enumeratedTypeLabelMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
            | 
            target changed.
            target fontSpec: fontSpec copyName:  (contentsOfEnumeratedField:  fontNameField)
                                          Size:  (contentsOfTextField: fontSizeField) asInteger
                                         Style:  (contentsOfEnumeratedField: fontStyleField).
            target label:    (contentsOfTextField: contentsField).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
             fontFamilies.
            | 
            fontFamilies: list copyRemoveAll.
            target world anyWindowCanvas scalableFont 
              fontNames do: [| :n |
                ((n matchesPattern: '*Bold*'   IgnoreCase: true) ||
                 [n matchesPattern: '*Italic*' IgnoreCase: true]) ifFalse: [
                    fontFamilies add: n.
                ].
            ].

            fontNameField:
                (buildEnumeratedFieldNamed: 'Font'
                    Labels: (fontFamilies copyMappedBy: [| :s | s capitalize ])
                    Values: fontFamilies
                    InitialValue: target fontSpec name).
            fontStyleField:
                (buildEnumeratedFieldNamed: 'Style'
                    Labels: ('Plain' & 'Bold' & 'Italic' & 'Bold Italic') asVector
                    Values: ('' & 'Bold' & 'Italic' & 'BoldItalic') asVector
                    InitialValue: target fontSpec style capitalize).
            fontSizeField: (buildTextFieldNamed:     'Size' String: target fontSpec size printString).
            contentsField: (buildTextFieldNamed: 'Contents' String: target label).
            (fontNameField & fontStyleField & fontSizeField & contentsField) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | copyTarget: m Title: 'Label Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if:  fontNameField IsPresentDo: [| :n |  fontNameField: n ].
            dict if: fontStyleField IsPresentDo: [| :n | fontStyleField: n ].
            dict if:  fontSizeField IsPresentDo: [| :n |  fontSizeField: n ].
            dict if:  contentsField IsPresentDo: [| :n |  contentsField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'labelPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'labelPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'Category: accept/revert\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptPropertyChanges = ( |
            | 
            subsheets do: [| :s | s acceptPropertyChanges ].
            target allMorphsDo: [| :m | m flushLayoutCaches ].
            target layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         buildContents = ( |
             b1.
             b2.
             b3.
             b4.
             c.
             fs.
             r.
             t.
            | 
            removeAllMorphs.
            beShrinkWrap.
            borderWidth: 3.

            subsheets: target propertySheets.
            fs: globals fontSpec copyName: 'verdana' Size: ui2Button defaultFontSpec size.

            b1: ui2Button copyColor: color Target: self.
            b1 label: ' Cancel '
                 FontSpec: fs
                FontColor: paint named: 'black'.
            b1  scriptBlock: [target delete].

            b2: ui2Button copyColor: color Target: self.
            b2 label: ' Revert '
                 FontSpec: fs
                FontColor: paint named: 'black'.
            b2  scriptBlock: [target revertPropertyChanges].

            b3: ui2Button copyColor: color Target: self.
            b3 label: ' Apply '
                 FontSpec: fs
                FontColor: paint named: 'black'.
            b3  scriptBlock: [target acceptPropertyChanges].

            b4: ui2Button copyColor: color Target: self.
            b4 label: ' Accept '
                 FontSpec: fs
                FontColor: paint named: 'black'.
            b4  scriptBlock: [target acceptPropertyChanges. target delete].

            r: rowMorph copy color: color.
            r borderWidth: 0.
            r beFlexible.
            r addAllMorphs: (
                (spacerMorph copy beFlexible color: color) &
                b1                                         &
                (spacerMorph copyH: 4 Color: color)        &
                b2                                         &
                (spacerMorph copyH: 4 Color: color)        &
                b3                                         &
                (spacerMorph copyH: 4 Color: color)        &
                b4) asVector.

            t: labelMorph copyLabel: ('Properties for ', target morphTypeName prependAOrAn)
                FontSpec: (outlinerPreferences largeFontSpec copyName: 'verdana' Style: 'bold')
                Color:    paint named: 'black'.

            c: columnMorph copy color: color.
            c borderWidth: 4.
            c addAllMorphs:
                (vector copyAddLast: t),
                (vector copyAddLast: (spacerMorph copyV: 10 Color: color)),
                subsheets,
                (vector copyAddLast: (spacerMorph copyV: 10 Color: color)),
                (vector copyAddLast: r).

            addMorph: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         copyTarget: m = ( |
             new.
            | 
            new: copy color: color.
            new target: m.
            new buildContents.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            color: (paint named: 'lightGray').
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: target IsPresentDo: [| :n | target: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         morphTypeName = 'propertiesSheetMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'propertiesSheetMorph' -> () From: ( | {
         'Category: accept/revert\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         revertPropertyChanges = ( |
            | 
            removeAllMorphs.
            buildContents.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
            | 
            "Note: This properties sheet may be used morphs that do not
              have modifiable baseMinWidth/baseMinHeight slots."

            target hResizing: (contentsOfEnumeratedField: hResizingField).
            target vResizing: (contentsOfEnumeratedField: vResizingField).
            baseMinWidthField ifNotNil: [
                target baseMinWidth:  (contentsOfTextField: baseMinWidthField ) asInteger.
            ].
            baseMinHeightField ifNotNil: [
                target baseMinHeight: (contentsOfTextField: baseMinHeightField) asInteger.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
             entries.
            | 
            "Note: This properties sheet may be used morphs that do not
              have modifiable baseMinWidth/baseMinHeight slots."

            entries: list copyRemoveAll.
            hResizingField:
                (buildEnumeratedFieldNamed: 'Horizontal Resizing'
                    Labels: ('Rigid' & 'Flexible' & 'ShrinkWrap') asVector
                    Values: (0 & 1 & 2) asVector
                    InitialValue: target hResizing).
            entries add: hResizingField.
            baseMinWidthField: nil.
            ((reflect: target) includesKey: 'baseMinWidth:') ifTrue: [
                baseMinWidthField:
                    (buildTextFieldNamed: 'Minimum Width' String: target baseMinWidth printString).
                entries add: baseMinWidthField.
            ].
            vResizingField:
                (buildEnumeratedFieldNamed: 'Vertical Resizing'
                    Labels: ('Rigid' & 'Flexible' & 'ShrinkWrap') asVector
                    Values: (0 & 1 & 2) asVector
                    InitialValue: target vResizing).
            entries add: vResizingField.
            baseMinHeightField: nil.
            ((reflect: target) includesKey: 'baseMinHeight:') ifTrue: [
                baseMinHeightField:
                    (buildTextFieldNamed: 'Minimum Height' String: target baseMinHeight printString).
                entries add: baseMinHeightField.
            ].
            entries).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | copyTarget: m Title: 'Resizing Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: baseMinHeightField IsPresentDo: [| :n | baseMinHeightField: n ].
            dict if:  baseMinWidthField IsPresentDo: [| :n |  baseMinWidthField: n ].
            dict if:     hResizingField IsPresentDo: [| :n |     hResizingField: n ].
            dict if:     vResizingField IsPresentDo: [| :n |     vResizingField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'resizingPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'resizingPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptPropertyChanges = ( |
             sel.
            | 
            target maxValue: (contentsOfTextField: maxValueField) eval. "to parse float or int"
            target minValue: (contentsOfTextField: minValueField) eval. "to parse float or int"
            target orientation: (contentsOfEnumeratedField: orientationField).
            sel: (contentsOfTextField: selectorField).
            sel: sel shrinkwrapped.
            sel isEmpty ifTrue: [ target selector: nil ]
                         False: [ target selector: sel ].
            target changed.   "redraw in case orientation changed."
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         buildPropertyEntries = ( |
             sel.
            | 
            maxValueField: (buildTextFieldNamed:  'Maximum Value' String: target maxValue printString).
            minValueField: (buildTextFieldNamed:  'Minimum Value' String: target minValue printString).
            sel: (nil = target selector ifTrue: '' False: target selector).
            selectorField: (buildTextFieldNamed:  'Selector'      String: sel).
            orientationField:     (buildEnumeratedFieldNamed: 'Orientation'
                    Labels: ('Vertical' & 'Horizontal') asVector
                    Values: (target vertical & target horizontal) asVector
                    InitialValue: target orientation).

            (minValueField & maxValueField & orientationField & selectorField) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: m = ( |
            | 
            copyTarget: m Title: 'Slider Properties').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( | {
         'Category: property specifics\x7fModuleInfo: Module: propertySheets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: maxValueField IsPresentDo: [| :n | maxValueField: n ].
            dict if: minValueField IsPresentDo: [| :n | minValueField: n ].
            dict if: selectorField IsPresentDo: [| :n | selectorField: n ].
            dict if: orientationField IsPresentDo: [| :n | orientationField: n ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'sliderPropsMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'sliderPropsMorph' -> () From: ( | {
         'ModuleInfo: Module: propertySheets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'subPropertiesSheetMorph' -> ().
        } | ) 



 '-- Side effects'

 globals modules propertySheets postFileIn
