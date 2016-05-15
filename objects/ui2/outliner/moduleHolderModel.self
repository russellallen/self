 '$Revision: 30.8 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Module Outliner\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleHolderModel = bootstrap define: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleHolderModel.

CopyDowns:
globals generalModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleHolderModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: the menu\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleHolderModel parent buttonDescriptions.

CopyDowns:
globals generalModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         constructItems = ( |
            | self "done by updating").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: adapting to framework\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         hasSubmodules = ( |
            | 
            submodules isEmpty not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: public'
        
         headerButtonContents = ( |
            | 
            isRootOutliner ifTrue: [vector copyAddLast: dismissButtonContents]
              False: vector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: adapting to framework\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         itemUpdaters = ( |
            | 
            vector copyAddFirst: submodulesUpdater).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         menuColor = ( |
            | 
            preferences outliner theme moduleHolderModelMenuColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         preferredBodyColor = ( |
            | 
            preferences outliner theme moduleHolderModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredColor = ( |
            | 
            preferences outliner theme moduleHolderModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: adapting to framework\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         submodules = ( |
            | 
            childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         submodulesUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent abstractUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleHolderModel parent submodulesUpdater.

CopyDowns:
globals generalModel parent abstractUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals moduleHolderModel parent submodulesUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         modelPrototype = ( |
            | moduleModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         oldOutliners = ( |
            | 
            outlinerToUpdate items morphs asList
              copyFilteredBy: [|:o| o isPluggableOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> 'submodulesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         things = ( |
            | 
            cachedThings ifNil: [
              cachedThings: outlinerToUpdate model submodules.
            ].
            cachedThings).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'helvetica' Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals moduleHolderModel parent titleFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         updateDo: blk = ( |
            | 
            myOutliner updateExpander: hasSubmodules.
            resend.updateDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         moduleHolderModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules moduleHolderModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'moduleHolderModel' -> () From: ( | {
         'ModuleInfo: Module: moduleHolderModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- '
moduleModel
changedModulesModel'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'moduleModel' From: 'ui2/outliner'
 bootstrap read: 'changedModulesModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules moduleHolderModel postFileIn
