 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot'
        
         selfPCatModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfPCatModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfPCatModel' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfPseudoCatModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfCategoryModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfPseudoCatModel.

CopyDowns:
globals selfCategoryModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfPseudoCatModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isPseudoCategoryModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfCategoryModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfPseudoCategoryModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMirror = ( |
            | fakeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfPCatModel InitialContents: FollowSlot'
        
         slotsUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> 'slotsUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfCatOrObjModel parent slotsUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> 'slotsUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfPseudoCatModel parent slotsUpdater.

CopyDowns:
globals selfCatOrObjModel parent slotsUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfPseudoCatModel parent slotsUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot'
        
         modelPrototype = ( |
            | 
            selfPseudoSlotModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfPseudoCatModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfPCatModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> ().
        } | ) 



 '-- Side effects'

 globals modules selfPCatModel postFileIn
