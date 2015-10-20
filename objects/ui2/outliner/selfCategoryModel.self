 '$Revision: 30.8 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot'
        
         selfCategoryModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfCategoryModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.8 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- '
selfPCatModel'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfCategoryModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfCatOrObjModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCategoryModel.

CopyDowns:
globals selfCatOrObjModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCategoryModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals selfCatOrObjModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCategoryModel parent buttonDescriptions.

CopyDowns:
globals selfCatOrObjModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
             hasS.
             r.
            | 
            hasS: slotsInMeAndSubcategories isEmpty not.
            r: 'addSlot' & 'addCategory' & nil.
            hasS ifTrue: [
              r: r & 'tearOffCopy' & 'tearOff' & nil & 'userDefined' & nil.
            ].
            r asVector, 
            resend.buttonsToPutInMenu,
            ( hasS ifFalse: vector
                      True: [(nil & 'setModule' & nil) asVector] )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCategoryModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfCategoryModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfCategoryReferrent = bootstrap define: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals categoryReferrent copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCategoryReferrent.

CopyDowns:
globals categoryReferrent. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: InitializeToExpression: (nil asMirror)'
        
         mirror <- nil asMirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCategoryReferrent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMirror: m CategoriesString: s = ( |
            | 
            ((copy mirror: m) categoriesString: s)
              categoryList: traits cachedSlotAnnotation convertCategoryStringToList: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForMirror: m CategoryList: l = ( |
            | 
            ((copy mirror: m) categoryList: l)
              categoriesString: traits cachedSlotAnnotation convertCategoryListToString: l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCategoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCategoryModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> ().
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfPCatModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules selfCategoryModel postFileIn
