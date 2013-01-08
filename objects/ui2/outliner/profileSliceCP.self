 '$Revision: 30.11 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot'
        
         profileSliceCP = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules profileSliceCP.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'profileSliceCP' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fCategory: Profile Slice Outliner & helpers\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         profileSliceControlPanel = bootstrap define: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals sliceControlPanel copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( |
             {} = 'Comment: The sliceOutliner can do many kinds
of slices. I control this.
I am exposed by the \"C\" button.\x7fModuleInfo: Creator: globals profileSliceControlPanel.

CopyDowns:
globals sliceControlPanel. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         beForShallow <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (0.02)\x7fVisibility: private'
        
         cutoff <- 0.02.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: text fields\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cutoffField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: time display options\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         deepTimesButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: organizations\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         flatButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: organizations\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         fullHierarchicalButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: organizations\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         hierarchicalButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: text fields\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         modulesToKeepField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: text fields\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         modulesToPruneField.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accepting changes\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptSliceInfo = ( |
            | 
            cutoff: cutoffString asIntegerIfFail: [ |m|
              m:  syntaxErrorMorph copyTitle: 'Cutoff' 
                                     Message: 'must be an integer between 0 and 100'.
              process this birthEvent sourceHand attach: m.
              ^ false
            ].
            cutoff: cutoff asFloat / 100.0.
            beForShallow: shallowTimesButton isDown.
            resend.acceptSliceInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCutoffField = ( |
            | 
            cutoffField:
              moduleField copyLabel: 'Cutoff (%)'
                             String: '2'
                              Style: style
                             Target: self.
            contentsColumn addMorphLast: cutoffField.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         buildModulesFields = ( |
            | 
            modulesToKeepField:
              moduleField copyLabel: 'First, keep the following modules (leave blank for all):'
                             String: ''
                              Style: style
                             Target: self.
            contentsColumn addMorphLast: modulesToKeepField.
            modulesToPruneField:
              moduleField copyLabel: 'Second, prune these from what you keep:'
                             String: ''
                              Style: style
                             Target: self.
            contentsColumn addMorphLast: modulesToPruneField.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         buildStringFields = ( |
            | 
            buildCutoffField.
            buildModulesFields.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         cutoffString = ( |
            | 
            cutoffField
                ifNil: ''
             IfNotNil: [cutoffField contents]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: enumerating\x7fComment: Does the enumeration and returns outliners
to add to the sliceOutliner.\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         enumerationOutliners = ( |
            | 
            organization enumerationOutlinersFor: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: filtering\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         filterOutModuleNamed: n = ( |
            | 
            modulesToPruneField contentsString: modulesToPruneString, ' ', n.
            acceptSliceInfo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fComment: Update the slots of this morph to refer to the new versions of
those morphs given by the the mapping dictionary. Morphs that
keep references to other morphs must implemenent this method
for copying to work correctly.  This default implementation
does no remapping.\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if:               flatButton IsPresentDo: [|:n|               flatButton: n].
            dict if:   fullHierarchicalButton IsPresentDo: [|:n|   fullHierarchicalButton: n].
            dict if:       hierarchicalButton IsPresentDo: [|:n|       hierarchicalButton: n].
            dict if: prunedHierarchicalButton IsPresentDo: [|:n| prunedHierarchicalButton: n].
            dict if:              cutoffField IsPresentDo: [|:n|              cutoffField: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         modulesToKeep = ( |
            | 
            modulesToKeepString asTokensSeparatedByWhiteSpace asSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         modulesToKeepString = ( |
            | 
            modulesToKeepField
                ifNil: ''
             IfNotNil: [modulesToKeepField contents]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         modulesToPrune = ( |
            | 
            modulesToPruneString asTokensSeparatedByWhiteSpace asSet).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fCategory: string fields\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         modulesToPruneString = ( |
            | 
            modulesToPruneField
                ifNil: ''
             IfNotNil: [modulesToPruneField contents]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'profileSliceControlPanel'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         node = ( |
            | 
            mySliceOutliner model node).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: accessing\x7fCategory: options & name spaces\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         optionNameSpaces = bootstrap define: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () ToBe: bootstrap addSlotsTo: (
             globals sliceControlPanel parent optionNameSpaces _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces.

CopyDowns:
globals sliceControlPanel parent optionNameSpaces. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         organizations = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces organizations.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         flat = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces organizations flat.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationOutlinersFor: controlPanel = ( |
            | 
            (controlPanel node copyIteratively asFlatVector asList copyFilteredBy: [|:n|
              n node normalizedTime >= controlPanel cutoff
            ])
            copyMappedBy: [|:n|
              controlPanel myOutliner model flatSuboutlinerForItem: n
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'flat'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'flat' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         fullHierarchical = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces organizations fullHierarchical.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationOutlinersFor: controlPanel = ( |
             n.
            | 
            n: controlPanel node copyAndPruneCutoff: controlPanel cutoff.
            n profileSliceGroupOutlinersForChildren: n bcisAndNodes ControlPanel: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'fullHierarchical'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'fullHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         prunedHierarchical = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces organizations prunedHierarchical.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         enumerationOutlinersFor: controlPanel = ( |
             n.
            | 
            n: controlPanel node copyAndPruneForCutoff: controlPanel cutoff
                                               Modules: modulePartitioningFor: controlPanel.
            n profileSliceGroupOutlinersForChildren: n bcisAndNodes ControlPanel: controlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( | {
         'Category: module-based pruning\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         getModulesAndSubpartsFromNames: aSet = ( |
             allModules.
            | 
            allModules: list copyRemoveAll.
            aSet do: [|:mName|
              (mName sendTo: modules) preorderDo: [|:m|
                allModules add: m asString.
              ].
            ].
            allModules).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( | {
         'Category: module-based pruning\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         modulePartitioning = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> 'modulePartitioning' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces organizations prunedHierarchical modulePartitioning.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> 'modulePartitioning' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         includes: moduleName = ( |
            | 
            (modulesToInclude isEmpty || [modulesToInclude includes: moduleName])
            && [(modulesToExclude includes: moduleName) not]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> 'modulePartitioning' -> () From: ( | {
         'Comment: A set of modules to be excluded from the list of modulesToInclude.
(So, for example, you might want to include the \'mirror\' module
but exclude its submodule \'metaCollections\'.)\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         modulesToExclude <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> 'modulePartitioning' -> () From: ( | {
         'Comment: A starting list of modules to be included in the profile.
If empty, assume we want to start from all modules.\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (vector)\x7fVisibility: private'
        
         modulesToInclude <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> 'modulePartitioning' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( | {
         'Category: module-based pruning\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         modulePartitioningFor: controlPanel = ( |
            | 
            (modulePartitioning copy
                 modulesToInclude:  getModulesAndSubpartsFromNames: controlPanel modulesToKeep)
                 modulesToExclude:  getModulesAndSubpartsFromNames: controlPanel modulesToPrune).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'prunedHierarchical'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'organizations' -> 'prunedHierarchical' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         shallowOrDeep = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces shallowOrDeep.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         showDeepTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showDeepTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces shallowOrDeep showDeepTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showDeepTimes' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonName = 'deepTimesButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showDeepTimes' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         isDefault = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showDeepTimes' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'Show deep times'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showDeepTimes' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         showShallowTimes = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showShallowTimes' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals profileSliceControlPanel parent optionNameSpaces shallowOrDeep showShallowTimes.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showShallowTimes' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonName = 'shallowTimesButton'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showShallowTimes' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'Show shallow times'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> 'optionNameSpaces' -> 'shallowOrDeep' -> 'showShallowTimes' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> 'optionTraits' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'sliceControlPanel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            mySliceOutliner ifNil: [^ 'no outliner'].
            mySliceOutliner model ifNil: [^ 'no panel'].
            '[' , mySliceOutliner model blockMethodSource, ']',
            '\n\n', mySliceOutliner model times printString,
            '\n\n', mySliceOutliner model ticks printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: profileSliceCP InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            profileSliceControlPanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: organizations\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         prunedHierarchicalButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'profileSliceControlPanel' -> () From: ( | {
         'Category: Profile slice control panel state\x7fCategory: subparts\x7fCategory: buttons\x7fCategory: time display options\x7fModuleInfo: Module: profileSliceCP InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         shallowTimesButton.
        } | ) 



 '-- Side effects'

 globals modules profileSliceCP postFileIn
