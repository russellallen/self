 '$Revision: 30.11 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fCategory: Self\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfCategoryModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fCategory: Self\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObjectModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fCategory: Self\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfPseudoCategoryModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fCategory: Self\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfSlotModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         selfCatOrObjModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfCatOrObjModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfCatOrObjModel' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'selfCategoryModel
selfObjectModel
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'outliner' -> () From: ( | {
         'Comment: When set to true, outliners will
use the experimental Kevo-like
mode and will show all parent slots.\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: InitializeToExpression: (false)'
        
         kevooidal <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfCatOrObjModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalCategoryModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel.

CopyDowns:
globals generalCategoryModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: module summary\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildModuleSummary = ( |
            | 
            moduleSummary:
                  labelMorph copyLabel: moduleSummaryString
                              FontSpec: moduleSummaryFontSpec
                                 Color: moduleSummaryFontColor.
            safelyDo: [
              myOutliner addItemFirst: (
                  (morph copy 
                    setHeight: 4)
                    colorAll: paint named: 'transparent').
              myOutliner addItemFirst: moduleSummary.
              myOutliner addItemFirst: (
                  (morph copy 
                    setHeight: 4)
                    colorAll: paint named: 'transparent')].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalCategoryModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent buttonDescriptions.

CopyDowns:
globals generalCategoryModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'buttonDescriptions' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent buttonDescriptions parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: Set Module...\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         setModule = ( |
            | 
            target model setModule: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         categoriesUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'categoriesUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalCategoryModel parent categoriesUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'categoriesUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent categoriesUpdater.

CopyDowns:
globals generalCategoryModel parent categoriesUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'categoriesUpdater' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent categoriesUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         modelPrototype = ( |
            | 
            selfCategoryModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'categoriesUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         categoryModelProto = ( |
            | selfCategoryModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryReferrentProto = ( |
            | selfCategoryReferrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: kevo-oidal option: fold parents in\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         kevooidal = ( |
            | preferences outliner kevooidal).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: kevo-oidal option: fold parents in\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         kevooidalAddSlot: s Category: cs Parent: p To: res = ( |
            | 
            res add: 
               ((slotWithFakedCategories _Clone theSlot: s) 
                      category: cs, 
                            (s category isEmpty || [cs isEmpty] ifTrue: '' False: [annotation annotationSeparator]),
                             s category)
                      categories: p asList copy addAll: s categories).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: kevo-oidal option: fold parents in\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         kevooidalSlotsInMirror = ( |
            | 
            kevooidalSlotsInMirror: mirror Into: set copyRemoveAll Visited: set copyRemoveAll Parents: list copyRemoveAll).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: kevo-oidal option: fold parents in\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         kevooidalSlotsInMirror: m Into: res Visited: v Parents: p = ( |
             cs <- ''.
            | 
            (v includes: m) ifTrue: [^ res].
            v add: m.
            p do: [|:n| cs: cs, annotation annotationSeparator, n].
            cs: cs copyWithoutFirst.
            m do: [|:s|
              (s isParent && (s value != reflect: lobby))
                ifTrue: [
                    "We are at top level, so include parents"
                    p isEmpty ifTrue: [kevooidalAddSlot: s Category: cs Parent: p To: res].
                    "Add to shared slots"
                    kevooidalSlotsInMirror: s contents Into: res Visited: v Parents: list copyRemoveAll addLast: '* Shared Slots']
                 False: [kevooidalAddSlot: s Category: cs Parent: p To: res].
            ].
            res).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         mirror = ( |
            | categoryReferrent mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: setting module\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         moduleNames = ( |
            | 
            set copyRemoveAll addAll:
              ( slotsInMeAndSubcategories asList copyFilteredBy: [|:s| s isAnnotationIgnored not ] )
                copyMappedBy: [|:s| s module ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: module summary\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         moduleSummaryFontColor = ( |
            | myOutliner color textColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: module summary\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         moduleSummaryFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals selfCatOrObjModel parent moduleSummaryFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: module summary\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         moduleSummaryString = ( |
             r.
            | 
            r: mirror moduleSummaryStringForSlotsFilteredBy: [|:s| categoriesString isPrefixOf: s category].
            r = mirror moduleSummaryString  ifTrue: '' False: [r]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         objectTitleString = ( |
            | 
            ["simplified this for Klein -- Ungar, 6/02"
              mirror isReflecteeMethod
                ifTrue: 'a method'
                 False: [resend.objectTitleString]
            ].
            resend.objectTitleString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         outlinerForTearOffCopy: evt = ( |
             o.
            | 
            o: selfCategoryModel newOutlinerFor: 
              categoryReferrentProto
                 copyForMirror: ( adjustCategoryPrefixForCopying: 
                                           (reflect: ()) copyAddSlots: slotsInMeAndSubcategories )
                  CategoryList: isTopCategory
                                  ifTrue: vector
                                   False: [vector copyAddLast: categoryList last].
            o colorAll: myOutliner color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: synchronization\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: blk = ( |
            | synchronization.protect: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         pseudoCategoriesUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalCategoryModel parent pseudoCategoriesUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent pseudoCategoriesUpdater.

CopyDowns:
globals generalCategoryModel parent pseudoCategoriesUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent pseudoCategoriesUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         modelPrototype = ( |
            | 
            selfPseudoCatModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'pseudoCategoriesUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: module summary\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         removeModuleSummary = ( |
            | 
            moduleSummary delete.
            moduleSummary: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: setting module\x7fComment: sent from menu item for either
object or category outliner
-- dmu\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         setModule: evt = ( |
            | 
            (selfModuleSetter copyForOutliner: myOutliner)
              chooseSlotsAndSetModule: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         showParents = ( |
            | kevooidal: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceGroupModel = ( |
            | selfSliceGroupModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceReferrent = ( |
            | selfSliceReferrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         slotModelProto = ( |
            | selfSlotModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: kevo-oidal option: fold parents in\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         slotWithFakedCategories = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotWithFakedCategories' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent slotWithFakedCategories.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotWithFakedCategories' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         categories <- ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotWithFakedCategories' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         category <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotWithFakedCategories' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         compare: s IfLess: lb Equal: eb Greater: gb = ( |
            | 
            holder = s holder ifTrue: [^ resend.compare: s IfLess: lb Equal: eb Greater: gb].
            categories size compare: s categories size
              IfLess: lb
               Equal: [category compare: s category IfLess: lb Equal: [name compare: s name IfLess: lb Equal: eb Greater: gb] Greater: gb]
             Greater: gb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotWithFakedCategories' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: InitializeToExpression: (())'
        
         theSlot* <- ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: accessing things\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMirror = ( |
            | 
            "To make kevooidal case really work,
            We want to prepend parent paths to categories.
            This will require consing up a thing like the slot that lies about the category and categories,
            or overriding the slotsInMe method."

            kevooidal ifFalse: [mirror]
              True: [kevooidalSlotsInMirror]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsUpdater = bootstrap define: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalCategoryModel parent slotsUpdater copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent slotsUpdater.

CopyDowns:
globals generalCategoryModel parent slotsUpdater. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfCatOrObjModel parent slotsUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         modelPrototype = ( |
            | 
            selfSlotModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         orderThings: t = ( |
            | 
            resend.orderThings: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalCategoryModel' -> 'parent' -> 'slotsUpdater' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         synchronization* = bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: dropping (being dropped)\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: private'
        
         turnIntoObjectForWorld: aWorldMorph Event: evt = ( |
             o.
             ss.
            | 
            ss: slotsInMeAndSubcategories.
            o: aWorldMorph outlinerForMirror: 
              ss isEmpty
               ifFalse: [ ss first holder ]
                  True: [ reflect: () _Clone ].
            o isInWorld ifFalse: [  aWorldMorph addMorph: o. ].
            aWorldMorph moveToFront: o.
            o globalPosition: myOutliner globalPosition.
            ss isEmpty  ifFalse: [
              o showSlot: ss first Event: evt.
              myOutliner delete.
            ]
            True: [
              o addDroppingMorph: self Event: evt
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         updateItemsDo: blk = ( |
            | 
            updateModuleSummary.
            resend.updateItemsDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: module summary\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot'
        
         updateModuleSummary = ( |
             s.
            | 
            s: moduleSummaryString.
            moduleSummary ifNil: [
              s isEmpty ifTrue: [^ self].
              ^ buildModuleSummary.
            ].
            s isEmpty ifTrue: [
              ^ removeModuleSummary.
            ].
            moduleSummary label = s
             ifFalse: [
              moduleSummary label: s.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfCatOrObjModel InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            m isPluggableOutliner && [
            m model willInsertMyselfWhenDropped  && [
            m model isSelfSlotModel || [m model isSelfCategoryModel]]]).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'selfCategoryModel' From: 'ui2/outliner'
 bootstrap read: 'selfObjectModel' From: 'ui2/outliner'



 '-- Side effects'

 globals modules selfCatOrObjModel postFileIn
