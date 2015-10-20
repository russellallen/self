 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot'
        
         selfSliceCP = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfSliceCP.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfSliceCP' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: SliceOutliner & helpers\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         selfSliceControlPanel = bootstrap define: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals sliceControlPanel copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( |
             {} = 'Comment: The sliceOutliner can do many kinds
of slices. I control this.
I am exposed by the \"C\" button.\x7fModuleInfo: Creator: globals selfSliceControlPanel.

CopyDowns:
globals sliceControlPanel. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         allButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         ancestorsButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: visibilities\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         anonymousButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         categoriesButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: fields\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         categoryField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         descendantsButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: fields\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         desiredTextField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         familyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: organizations\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         flatButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: organizations\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         fullHierarchicalButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: organizations\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         hierarchicalButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         implementorsButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         methodsContainingButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accepting changes\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptSliceInfo = ( |
            | 
            startingAtMirror:
              reflect: startingAtName eval.
            resend.acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accepting changes\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptSliceInfoExcludingStartingAt = ( |
            | 
            resend.acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: browse object\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         browseAllObject = ( |
            | 
            globals browse).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: browse object\x7fComment: Return browse or browseWellKnown,
the \"browse object\" for this slice.\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         browseObject = ( |
            | 
            visibility browseObjectFor: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: browse object\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         browseWellKnownObject = ( |
            | 
            globals browseWellKnown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCategoryField = ( |
            | 
            categoryField:
              moduleField copyLabel: 'Category'
                             String: ''
                              Style: style
                             Target: self.
            contentsColumn addMorphLast: categoryField.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         buildDesiredTextField = ( |
            | 
            desiredTextField:
              moduleField copyLabel: 'Desired text'
                             String: ''
                              Style: style
                             Target: self.
            contentsColumn addMorphLast: desiredTextField.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         buildStartingAtField = ( |
            | 
            startingAtField:
              moduleField copyLabel: 'Starting at'
                             String: 'lobby'
                              Style: style
                             Target: self.
            contentsColumn addMorphLast: startingAtField.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         buildStringFields = ( |
            | 
            buildDesiredTextField.
            buildCategoryField.
            buildStartingAtField.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: string fields\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
            | 
            categoryField
              ifNil: ''
              IfNotNil: [ categoryField contents ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: string fields\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         desiredText = ( |
            | 
            desiredTextField
              ifNil:    ''
              IfNotNil: [|:f| f contents ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: what to look for\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         desiredText: s = ( |
            | 
            desiredTextField contentsString: s.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: enumerating\x7fComment: Does the enumeration and returns outliners
to add to the sliceOutliner.\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationOutliners = ( |
            | 
            organization enumerationOutlinersFor: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: selected options\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         filtering = ( |
            | 
            buttonSelectionIn: optionNameSpaces filters).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: selected options\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         find = ( |
            | 
            buttonSelectionIn: optionNameSpaces finds).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         findImplementors = ( |
            | 
            optionNameSpaces finds implementors
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         findMethodsContaining = ( |
            | 
            optionNameSpaces finds methodsContaining
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         findReferences = ( |
            | 
            optionNameSpaces finds references
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         findSenders = ( |
            | 
            optionNameSpaces finds senders
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: traits\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         findTraits = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent findTraits.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'Category: result type mixins\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsAreMirrorsMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreMirrorsMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent findTraits resultsAreMirrorsMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreMirrorsMixin' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot'
        
         enumerationMirrorsFor: controlPanel = ( |
            | 
            enumerationResultsFor: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreMirrorsMixin' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot'
        
         enumerationSlotsFor: controlPanel = ( |
             sn.
            | 
            sn: controlPanel desiredText.
            (enumerationMirrorsFor: controlPanel)
              copyMappedBy: [|:mir| mir at: sn]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'Category: result type mixins\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsAreObjectsMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreObjectsMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent findTraits resultsAreObjectsMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> () From: ( | {
         'Category: result type mixins\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsAreSlotsMixin = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreSlotsMixin' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent findTraits resultsAreSlotsMixin.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreSlotsMixin' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationMirrorsFor: controlPanel = ( |
            | 
            (enumerationSlotsFor: controlPanel)
              copyMappedBy: [|:s| s holder]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreSlotsMixin' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationSlotsFor: controlPanel = ( |
            | 
            enumerationResultsFor: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         inAll = ( |
            | 
            optionNameSpaces filters all
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         inAncestors = ( |
            | 
            optionNameSpaces filters ancestors
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         inDescendants = ( |
            | 
            optionNameSpaces filters descendants
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: filters\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         inFamily = ( |
            | 
            optionNameSpaces filters family
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: visibility\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         includeAnonymous = ( |
            | 
            optionNameSpaces visibilities anonymous
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: visibility\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         includeWellKnownOnly = ( |
            | 
            optionNameSpaces visibilities wellKnown
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: Update the slots of this morph to refer to the new versions of
those morphs given by the the mapping dictionary. Morphs that
keep references to other morphs must implemenent this method
for copying to work correctly.  This default implementation
does no remapping.\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if:                allButton IsPresentDo: [|:n|                allButton: n].
            dict if:          ancestorsButton IsPresentDo: [|:n|          ancestorsButton: n].
            dict if:        descendantsButton IsPresentDo: [|:n|        descendantsButton: n].
            dict if:             familyButton IsPresentDo: [|:n|             familyButton: n].
            dict if:         categoriesButton IsPresentDo: [|:n|         categoriesButton: n].
            dict if:       implementorsButton IsPresentDo: [|:n|       implementorsButton: n].
            dict if:  methodsContainingButton IsPresentDo: [|:n|  methodsContainingButton: n].
            dict if:         referencesButton IsPresentDo: [|:n|            sendersButton: n].
            dict if:            sendersButton IsPresentDo: [|:n|             familyButton: n].
            dict if:               flatButton IsPresentDo: [|:n|               flatButton: n].
            dict if:   fullHierarchicalButton IsPresentDo: [|:n|   fullHierarchicalButton: n].
            dict if:       hierarchicalButton IsPresentDo: [|:n|       hierarchicalButton: n].
            dict if:          anonymousButton IsPresentDo: [|:n|          anonymousButton: n].
            dict if:          wellKnownButton IsPresentDo: [|:n|          wellKnownButton: n].
            dict if:            categoryField IsPresentDo: [|:n|            categoryField: n].
            dict if:         desiredTextField IsPresentDo: [|:n|         desiredTextField: n].
            dict if:          startingAtField IsPresentDo: [|:n|          startingAtField: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'selfSliceControlPanel'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         optionNameSpaces = bootstrap define: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () ToBe: bootstrap addSlotsTo: (
             globals sliceControlPanel parent optionNameSpaces _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces.

CopyDowns:
globals sliceControlPanel parent optionNameSpaces. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         filters = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces filters.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         all = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'all' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces filters all.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         buildForestFor: controlPanel = ( |
            | 
            error: 'unimplemented').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         descriptionStartingAt: ignored = ( |
            | 
            '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'all'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'all' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         ancestors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'ancestors' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces filters ancestors.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'ancestors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         buildForestFor: controlPanel = ( |
            | 
            inheritanceForestSlicer buildAncestorsOf: controlPanel startingAtMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'ancestors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'ancestors'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'ancestors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         descendants = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'descendants' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces filters descendants.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'descendants' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         buildForestFor: controlPanel = ( |
            | 
            inheritanceForestSlicer
               buildDescendantsOf: controlPanel startingAtMirror
                     BrowseObject: controlPanel browseObject
               LimitDescendantsTo: controlPanel organization descendantSupersetFor: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'descendants' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'descendants'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'descendants' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         family = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'family' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces filters family.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'family' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         buildForestFor: controlPanel = ( |
            | 
            inheritanceForestSlicer
                   buildFamilyOf: controlPanel startingAtMirror
                    BrowseObject: controlPanel browseObject
              LimitDescendantsTo: controlPanel organization descendantSupersetFor: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'family' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'family'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'filters' -> 'family' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         finds = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces finds.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         categories = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'categories' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces finds categories.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'categories' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot'
        
         enumerationSelector = 'slotsInCategory:'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'categories' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationSlotsFor: controlPanel In: m = ( |
            | 
            m asList copyFilteredBy: [|:s| s categories includes: controlPanel category]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'categories' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'categories'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'categories' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'categories' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsMixin* = bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreSlotsMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'categories' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         subjectName = 'category'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         implementors = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'implementors' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces finds implementors.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationSlotsFor: controlPanel In: m = ( |
            | 
            vector copyAddFirst:
              m at: controlPanel desiredText IfAbsent: [^ vector]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'implementors'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsMixin* = bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreMirrorsMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'implementors' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         subjectName = 'desiredText'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         methodsContaining = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'methodsContaining' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces finds methodsContaining.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'methodsContaining' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationSelector = ( |
            | 'methodsContainingString:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'methodsContaining' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationSlotsFor: controlPanel In: m = ( |
             desiredText.
            | 
            desiredText: controlPanel desiredText.
            m asList copyFilteredBy: [|:s| s contents sourceString matchesPattern: desiredText]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'methodsContaining' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'methodsContaining'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'methodsContaining' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'methodsContaining' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsMixin* = bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreSlotsMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'methodsContaining' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         subjectName = 'desiredText'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         references = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'references' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces finds references.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationResultsFor: controlPanel = ( |
            | 
            enumerationSelector
              sendTo: controlPanel browseObject
                With: controlPanel startingAtMirror reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationSlotsFor: controlPanel In: m = ( |
            | 
            m asList copyFilteredBy: [|:s| s contents = controlPanel startingAtMirror]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'references'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsMixin* = bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreSlotsMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'references' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         subjectName = 'startingAtName'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         senders = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'senders' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces finds senders.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'senders' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationSlotsFor: controlPanel In: m = ( |
             sn.
            | 
            sn: controlPanel desiredText.
            m asList copyFilteredBy: [|:s| s contents messages includes: sn]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'senders' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'senders'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'senders' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'findTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'senders' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         resultsMixin* = bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'findTraits' -> 'resultsAreSlotsMixin' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'finds' -> 'senders' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         subjectName = 'desiredText'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         organizations = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces organizations.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         flat = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces organizations flat.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationOutlinersFor: controlPanel = ( |
            | 
            controlPanel find flatEnumerationOutlinersFor: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'flat'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         fullHierarchical = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces organizations fullHierarchical.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'Category: building outliners\x7fComment: Given an outliner for a node,
add the outliners for descendants to it.
Return true if root outliner should be added.\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         addChildrenIn: tree ToOutliner: o For: controlPanel = ( |
             notEmpty <- bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            tree childrenOf: o model mirror Do: [|:c. oo|
              oo: newOutliner: c For: controlPanel.
              (addChildrenIn: tree ToOutliner: oo For: controlPanel)
               ifTrue: [
                o addSuboutliner: oo.
                notEmpty: true.
              ].
            ].
            notEmpty || [includeEmpties || [o containsSlots]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'Category: building outliners\x7fComment: Top-level routine to convert
inheritanceForest to nested outliners.\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         convertForestToOutliners: forest For: controlPanel = ( |
             outs.
            | 
            outs: list copyRemoveAll.
            forest rootsDo: [|:r. o|
              o: newOutliner: r For: controlPanel.
              (addChildrenIn: forest ToOutliner: o For: controlPanel)
               ifTrue: [
                outs add: o.
              ].
            ].
            outs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         descendantSupersetFor: controlPanel = ( |
            | 
            nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationOutlinersFor: controlPanel = ( |
             mirForest.
             outs.
            | 
            mirForest: controlPanel filtering buildForestFor: controlPanel.
            outs: convertForestToOutliners: mirForest For: controlPanel.
            outs).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'Category: building outliners\x7fCategory: override to customize\x7fComment: If true, outliners that transitively
do not contain slots will still be in tree.\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         includeEmpties = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'fullHierarchical'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'Category: building outliners\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         newOutliner: mir For: controlPanel = ( |
             slots.
            | 
            slots: controlPanel find enumerationSlotsFor: controlPanel In: mir.
            (controlPanel myOutliner model hierarchicalSuboutlinerForHolder: mir Items: slots)
              colorAll: controlPanel myOutliner color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         hierarchical = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'hierarchical' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces organizations hierarchical.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'hierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         descendantSupersetFor: controlPanel = ( |
            | controlPanel find enumerationMirrorsFor: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'hierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         includeEmpties = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'hierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'hierarchical'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'hierarchical' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         visibilities = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces visibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         anonymous = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'anonymous' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces visibilities anonymous.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'anonymous' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         browseObjectFor: aSliceControlPanel = ( |
            | 
            aSliceControlPanel browseAllObject).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'anonymous' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'anonymous'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'anonymous' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         wellKnown = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'wellKnown' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfSliceControlPanel parent optionNameSpaces visibilities wellKnown.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'wellKnown' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         browseObjectFor: controlPanel = ( |
            | 
            controlPanel browseWellKnownObject).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'wellKnown' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         descriptionFor: controlPanel = ( |
            | 'well-known').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'wellKnown' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'wellKnown' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'wellKnown'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'visibilities' -> 'wellKnown' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         showFlat = ( |
            | 
            optionNameSpaces organizations flat
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         showFullHierarchical = ( |
            | 
            optionNameSpaces organizations fullHierarchical
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: organizations\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         showHierarchical = ( |
            | 
            optionNameSpaces organizations hierarchical
              selectFor: self.
            acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: controlling me\x7fCategory: what to look for\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         startingAt: mirror = ( |
            | 
            startingAtField contentsString: mirror evalName.
            startingAtMirror: mirror.
            acceptSliceInfoExcludingStartingAt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: string fields\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         startingAtName = ( |
            | 
            startingAtField
              ifNil: ''
              IfNotNil: [ startingAtField contents ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
             f.
             ff.
            | 
            implementorsButton ifNil: [^ '' "uninitialized"].

            f: find.
            ff: filtering.
            (
              (visibility descriptionFor: self), ' ',
              (organization descriptionFor: self), ' ',
              (f descriptionFor: self), '\n ',
              (ff descriptionStartingAt: startingAtMirror safeName)
            ) shrinkwrapped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: selected options\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         visibility = ( |
            | 
            buttonSelectionIn: optionNameSpaces visibilities).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: selfSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            selfSliceControlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         referencesButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: finds\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         sendersButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: fields\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         startingAtField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (lobby asMirror)\x7fVisibility: public'
        
         startingAtMirror <- lobby asMirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfSliceControlPanel' -> () From: ( | {
         'Category: Self slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: visibilities\x7fModuleInfo: Module: selfSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         wellKnownButton.
        } | ) 



 '-- Side effects'

 globals modules selfSliceCP postFileIn
