 '$Revision: 30.15 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryReferrent = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'categoryReferrent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals categoryReferrent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: InitializeToExpression: (\'\')'
        
         categoriesString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: InitializeToExpression: (vector copyAddLast: \'\')'
        
         categoryList <- vector copyAddLast: ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals categoryReferrent parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         < x = ( |
            | 
            categoriesString < x categoriesString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         = x = ( |
            | 
            (mirror = x mirror) && [categoriesString = x categoriesString]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         compare: x IfLess: lb Equal: eb Greater: gb = ( |
            | 
            categoriesString compare: x categoriesString IfLess: lb Equal: eb Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         hash = ( |
            | 
            mirror hash ^^ categoriesString hash).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         ordered* = bootstrap stub -> 'mixins' -> 'ordered' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryReferrent' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         generalCategoryModel = bootstrap define: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel.

CopyDowns:
globals generalModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fModuleInfo: Module: generalCategoryModel InitialContents: InitializeToExpression: (nil)'
        
         moduleSummary.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addNewCategoryOutliner: co = ( |
             cos.
            | 
            cos: categoryOutliners.
            cos isEmpty ifTrue: [myOutliner addItemLast: co]
                         False: [myOutliner addItem: co Before: cos first].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addNewSlotOutliner: so = ( |
            | 
            myOutliner addItem: so After: moduleSummary.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustCategoryPrefixForCopying: mirr = ( |
            | 
            mirr do: [|:s|
                s isAssignment ifFalse: [   "Assignment slots share the annotation with
                                             their corresponding data slot, so should not
                                             adjust it twice."
                    s categories: 
                        s categories asVector copyFrom: categoryList size pred max: 0.
                ].
            ].
            mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent buttonDescriptions.

CopyDowns:
globals generalModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: adding\x7fCategory: Add Category\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         addCategory = ( |
            | 
            target addCategory: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: adding\x7fCategory: Add Slot\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         addSlot = ( |
            | 
            target addSlot: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         categoriesString = ( |
            | 
            categoryReferrent categoriesString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         categoriesUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent abstractUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent categoriesUpdater.

CopyDowns:
globals generalModel parent abstractUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent categoriesUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         oldOutliners = ( |
            | 
            outlinerToUpdate model realCategoryOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         things = ( |
            | 
            cachedThings ifNil: [
              cachedThings:
                outlinerToUpdate model categoryReferrents,
                ((outlinerToUpdate model realCategoryOutliners
                  copyFilteredBy: [|:o| o isPlaceHolder && [o isForEditingNew not]])
                  copyMappedBy:   [|:o| o model referrent])
            ].
            cachedThings).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         categoryList = ( |
            | 
            categoryReferrent categoryList).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing suboutliners\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryOutliners = ( |
            | 
            myOutliner outlinersFilteredBy: [|:o| o model isCategoryModel]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryReferrent = ( |
            | 
            referrent "for adding cats"
             ifNil: [categoryReferrentProto]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryReferrentProto = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryReferrents = ( |
             cache.
             result.
             resultCatDepth.
            | 
            result: set copyRemoveAll.
            cache: set copyRemoveAll.
            resultCatDepth: categoryList size succ.

            slotsInMeAndSubcategories do: [ |:s. c |
              c: s category.
              c = categoriesString  ifFalse: [
                cache if: c IsPresentDo: [] IfAbsentPut: [c] AndDo: [|scv. cl|
                  scv: s categories asVector.
                  resultCatDepth <= scv size  ifFalse: [
                    error: 'slotsInMeAndSubcategories returned a slot: ',
                           s name, ' without enough nested categories'
                  ].
                  cl: scv copySize: resultCatDepth.
                  result add: categoryReferrentProto copyForMirror: mirror CategoryList: cl
                ].
              ].
            ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         constructItems = ( |
            | self "done by updating").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: power operations\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         doOperation: aUserDefinedOperation ToAllForEvent: event = ( |
            | 
            expand: event.
            myOutliner editTitleIfChangedBy: aUserDefinedOperation Event: event.
            outlinersExpand: true ThenDo: [|:o|
              o model doOperation: aUserDefinedOperation ToAllForEvent: event].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlots = ( |
            | 
            mirror fakeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isForEditingNew = ( |
            | 
            resend.isForEditingNew && [categoryList isEmpty || [categoryList last isEmpty]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isTopCategory = ( |
            | categoryList isEmpty).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         itemUpdaters = ( |
            | 
            ( slotsUpdater & categoriesUpdater & pseudoCategoriesUpdater ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newObjectOutlinerFor: whatever = ( |
            | 
            outlinerPrototype
              copyForModel:
                copyForReferrent:
                   categoryReferrentProto copyForMirror: whatever CategoriesString: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newOutlinerForAddingCategory = ( |
            | 
            categoryModelProto newOutlinerForAddingCategoryToCategory: categoryReferrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutlinerForAddingCategoryToCategory: enclosingCategoryReferrent = ( |
             o.
            | 
            o: newOutlinerForPlaceHolder.
            "use referrent to hold category for adding later,
             that way adding cats will work on slots in views"
            o model referrent: 
              categoryReferrentProto
                copyForMirror: enclosingCategoryReferrent mirror
                 CategoryList: enclosingCategoryReferrent categoryList copy asList addLast: ''.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutlinerForAddingSlot = ( |
            | 
            slotModelProto newOutlinerForAddingSlotToCategory: categoryReferrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         objectTitleFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalCategoryModel parent objectTitleFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         objectTitleString = ( |
            | 
            (( textLines copyLines: mirror name)
            wrapLinesAtBlanksNear: 40)
            asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         oneOfEachFakeSlot = ( |
            | 
            mirror oneOfEachFakeSlot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinersExpand: doExpand ThenDo: blk = ( |
            | 
            doExpand ifTrue: [expand: process this birthEvent].
            categoryOutliners do: [|:o| blk value: o].
                slotOutliners do: [|:o| blk value: o].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoCategories = ( |
             result <- bootstrap stub -> 'globals' -> 'set' -> ().
            | 
            result: result copyRemoveAll.
            oneOfEachFakeSlot do: [ |:s. c |
              c: s categories.
              (categoryList isPrefixOf: c) && [ categoryList size succ = c size ]
               ifTrue: [ result add: categoryReferrentProto copyForMirror: mirror CategoryList: c ]].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         pseudoCategoriesUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalCategoryModel parent categoriesUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent pseudoCategoriesUpdater.

CopyDowns:
globals generalCategoryModel parent categoriesUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent pseudoCategoriesUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         oldOutliners = ( |
            | 
            outlinerToUpdate model pseudoCategoryOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         things = ( |
            | 
            cachedThings ifNil: [
              cachedThings: outlinerToUpdate model pseudoCategories.
            ].
            cachedThings).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing suboutliners\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoCategoryOutliners = ( |
            | 
            myOutliner outlinersFilteredBy: [|:o| o model isPseudoCategoryModel]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing suboutliners\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         realCategoryOutliners = ( |
            | 
            myOutliner outlinersFilteredBy: [|:o| 
                o model isCategoryModel
            && [o model isPseudoCategoryModel not]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         recolorModuleSummary = ( |
            | 
            moduleSummary isNil ifFalse: [
              moduleSummary color: preferredTitleColor].
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldWrapMeWhenGrowingSkin = ( |
            | isTopCategory not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fComment: Slots shown at top level in me,
filtering out assignment slots if so prefered.
-- Ungar, 2/4/95\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         shownSlotsInMe = ( |
            | 
            "The isFake part is to ensure that indexable slots in Klein maps are shown
              -- dmu 3/04"
            slotsInMe asList copyFilteredBy: [|:s|  s isFake ||  [ s isAssignment not ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         slotForShowing: slot IfFail: fb = ( |
            | 
            slot exists ifFalse: [
              ^ fb value: slot name, ' does not exist'
            ].
            slot isAssignment
              ifFalse: [slot]
                 True: [slot correspondingDataSlot]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing suboutliners\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         slotOutliners = ( |
            | 
            myOutliner outlinersFilteredBy: [|:o| o model isSlotModel]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fComment: Slots in exactly this category.
-- Ungar, 2/4/95\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMe = ( |
            | 
            slotsInMirror asList copyFilteredBy: [|:s|
              categoriesString = s category]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fComment: Slots in this or sub categories
-- Ungar, 2/4/95\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMeAndSubcategories = ( |
            | 
            "optimization"
            categoriesString isEmpty ifTrue: [^ slotsInMirror asList].
            slotsInMirror asList copyFilteredBy: [|:s. |
              slotAnnotation isCategoryString: categoriesString
                                     PrefixOf: s category
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent abstractUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent slotsUpdater.

CopyDowns:
globals generalModel parent abstractUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalCategoryModel parent slotsUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         addOutliner: o = ( |
             cos.
            | 
            "add before cat outs"
            cos: outlinerToUpdate model categoryOutliners.
            cos isEmpty ifTrue: [outlinerToUpdate addItemLast: o]
                         False: [outlinerToUpdate addItem: o Before: cos first].
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         oldOutliners = ( |
            | 
            outlinerToUpdate model slotOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         updateDo: updateBlock = ( |
             cos.
            | 
            "remove any (slot) outliners after cats"
            cos: outlinerToUpdate model categoryOutliners.
            [|:exit|
              cos isEmpty ifTrue: exit.
              outlinerToUpdate items morphs copy reverseDo: [|:it|
                it = cos last ifTrue: exit.
                (it morphTypeName = 'pluggableLeafOutliner') &&
                [it model isSelfSlotModel &&
                [it isPlaceHolder not]]
                 ifTrue: [removeOutliner: it].
             ].
            ] exit.
            resend.updateDo: updateBlock.
            "ensure that this gets removed if it ever becomes empty, after
             once having had slots (NOT just cats) in it"
            things isEmpty ifFalse: [ outlinerToUpdate stopBeingPlaceHolder ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subcategoryTitleFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 12 Style: 'italic') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalCategoryModel parent subcategoryTitleFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subcategoryTitleString = ( |
            | categoryList last).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleFontSpec = ( |
            | 
            isTopCategory
              ifTrue: [      objectTitleFontSpec ]
               False: [ subcategoryTitleFontSpec ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleString = ( |
            | 
            isTopCategory
              ifTrue: [      objectTitleString ]
               False: [ subcategoryTitleString ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> () From: ( | {
         'Category: editing name\x7fModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingName: rr = ( |
             changedToExistingCategory.
             hadAttributes <- bootstrap stub -> 'globals' -> 'false' -> ().
             i.
             newName.
             ocat.
            | 
            newName: rr editor contentsString.

            isForEditingNew && [newName isEmpty] ifTrue: [
             ^ myOutliner cancelChangingNameEditor: rr editor Event: rr event
            ].

            categoryList isEmpty ifTrue: [
              referrent: categoryReferrentProto
                    copyForMirror: mirror
                     CategoryList: vector copy.
              resend.unprotectedFinishChangingName: rr.
              safelyDo: [ myOutliner beFlexibleHorizontally update ].
              ^ self
            ].

            i: categoryList size pred.
            ocat: categoryList last.

            changedToExistingCategory: 
              (newName != ocat)  && [ |cl|
                cl: categoryList copy asVector at: categoryList size pred Put: newName.
                mirror anySatisfy: [|:s| s categories = cl]].

            changedToExistingCategory ifTrue: [
              (userQuery askYesNo: 'The category ``', newName, '\'\' already exists.\n',
                                  'Do you want to merge these slots into a single category?')
               ifFalse: [^ self].
            ].
            slotsInMeAndSubcategories do: [|:s|
              hadAttributes: true.
              s changeCategoriesTo: 
                  newName = ''  
                    ifFalse: [ s categories asVector at: i Put: newName ]
                       True: [ (s categories asSequence removeKey: i) asVector ]
            ].
            changedToExistingCategory ifTrue: [
              myOutliner removeFromEnclosingOutliner.
            ^ self
            ].
            referrent: categoryReferrentProto
                  copyForMirror: mirror
                   CategoryList: categoryList copy asVector at: categoryList size pred Put: newName.
            resend.unprotectedFinishChangingName: rr.
            safelyDo: [ myOutliner beFlexibleHorizontally update ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         generalCategoryModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules generalCategoryModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.15 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalCategoryModel' -> () From: ( | {
         'ModuleInfo: Module: generalCategoryModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules generalCategoryModel postFileIn
