 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Module Outliner\x7fModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         allModulesModel = bootstrap define: bootstrap stub -> 'globals' -> 'allModulesModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals changedModulesModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'allModulesModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals allModulesModel.

CopyDowns:
globals changedModulesModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'allModulesModel' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'allModulesModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals allModulesModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'allModulesModel' -> 'parent' -> () From: ( | {
         'Category: the menu\x7fModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
             r.
            | 
            r: list copyRemoveAll.
            transporter moduleDictionary orphans isEmpty 
             ifFalse: [r addLast: 'expatriates'].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'allModulesModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         headerButtonContents = ( |
            | 
            vector copyAddFirst: dismissButtonContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'allModulesModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'allModulesModel' -> 'parent' -> () From: ( | {
         'Category: submodules\x7fModuleInfo: Module: allModulesModel InitialContents: FollowSlot'
        
         submodules = ( |
            | 
            transporter moduleDictionary topLevelModules).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'allModulesModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = 'All Modules'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot'
        
         allModulesModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allModulesModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allModulesModel' -> () From: ( | {
         'ModuleInfo: Module: allModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules allModulesModel postFileIn
