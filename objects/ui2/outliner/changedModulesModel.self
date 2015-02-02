 '$Revision: 30.7 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Module Outliner\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         changedModulesModel = bootstrap define: bootstrap stub -> 'globals' -> 'changedModulesModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals moduleHolderModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'changedModulesModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals changedModulesModel.

CopyDowns:
globals moduleHolderModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals changedModulesModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: the menu\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals moduleHolderModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals changedModulesModel parent buttonDescriptions.

CopyDowns:
globals moduleHolderModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: All Modules\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         all = ( |
            | 
            target safelyDo: [
             event sourceHand attach: allModulesModel newOutliner
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: Expatriate Slots (not in any module)\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         expatriates = ( |
            | 
            target safelyDo: [
              event sourceHand attach: orphansMorph copy
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: No Expatriate Slots (not in any module)\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         noExpatriates = ( |
            | 
            target safelyDo: [
              event sourceHand attach: orphansMorph copy
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: the menu\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            (
              (transporter moduleDictionary orphans isEmpty 
                ifTrue: 'noExpatriates'
                 False: 'expatriates'
              )
            & 'all'
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton:
                ( ( ui2Button copy
                   scriptBlock: [event sourceHand attach: changedModulesModel newOutliner] )
                         label: 'Changed Modules' )
            ToGroup: 'builtInMorphs'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         fileOutAllModules = ( |
            | 
             submodules do: [|:m| 
              m fileOut
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         headerButtonContents = ( |
            | 
            ( ('W All' 
               @ 'A target model fileOutAllModules')
            & dismissButtonContents
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'moduleHolderModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: submodules\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot'
        
         submodules = ( |
            | 
            transporter moduleDictionary dirtyModules).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titleFontSpec = ( |
            | resend.titleFontSpec copyStyle: 'bold').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'changedModulesModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
             n.
            | 
            n: transporter moduleDictionary dirtyModules size.
            (n = 0  ifTrue: 'No' False: [n printString]), ' Changed Modules').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot'
        
         changedModulesModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules changedModulesModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            worldMorph addBackgroundMenuContributor: changedModulesModel.
            resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.7 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'changedModulesModel' -> () From: ( | {
         'ModuleInfo: Module: changedModulesModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'allModulesModel
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'allModulesModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules changedModulesModel postFileIn
