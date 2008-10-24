 '$Revision: 30.6 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: abstract leaf outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         contentsLabel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: abstract leaf outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: abstract leaf outliner state\x7fCategory: editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         inEditMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: abstract leaf outliner state\x7fCategory: expand state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         itemsCached <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: abstract leaf outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fComment: I represent anything that is a leaf
in an outliner, such as a slot,
or a dictionary entry. -- dmu 2/97\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractLeafOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractLeafOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractLeafOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: abstract leaf outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         titleEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'slotsOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals nonpluggableOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotsOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotsOutliner.

CopyDowns:
globals nonpluggableOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( |
             {} = 'Comment: I hold shared behavior for
both categories and whole objects.
Someday this could be reorged so that
the uncategorized part of an object were
a kind of category morph.\x7fModuleInfo: Creator: traits slotsOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotsOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotsOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | slotsOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addCategory: evt = ( |
             co.
            | 
            isExpanded ifFalse: [expand: evt].
            co: categoryOutliner copyFreshMirror: mirror
                                      Categories: categoryList
                                           Outer: self.
            co title editor beTypingFocusFor: evt sourceHand.
            addNewCategoryOutliner: co).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         addCategoryButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingCategory: c = ( |
            | 
            addDroppingSlots: (
              c allSlots copyMappedBy: [|:s|
                recategorizeDroppedSlot: s
            ]) From: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            [finishAddingDroppingMorph: m]. "browsing"
            (message copy receiver: self Selector: 'finishAddingDroppingMorph:' With: m)
              forkForBirthEvent: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingSlot: so = ( |
            | 
            addDroppingSlots: (
              so allSlots copyMappedBy: [|:s|
                s copyHolderForCategories: categoryList.
            ]) From: so).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addDroppingSlots: slots From: aSlotsOutliner = ( |
             s.
            | 
            s: (shouldResetModuleOfDroppingSlots: slots) 
                ifFalse: [slots]
                   True: [slots copyMappedBy: [|:s| s copyHolderForModule: '']].

            ( myObjectOutliner addSlots: s ToObjectOldName: '' SafelyDo: [])
             ifFalse: [ safelyDo: [ process this birthEvent sourceHand attach: aSlotsOutliner]].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addNewCategoryOutliner: co = ( |
             cos.
            | 
            cos: categoryOutliners.
            cos isEmpty ifTrue: [ addItemLast: co]
                         False: [ addItem: co Before: cos first].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: adding\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlot: evt = ( |
             i.
            | 
            isExpanded ifFalse: [ expand: evt].
            i: slotOutliner copyNewOuter: self Event: evt.
            addBoxedItemFirst: i.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         addSlotButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: sub outliner accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         allSlotOutliners = ( |
             l.
            | 
             l: list copyRemoveAll.
             outlinersDo: [ |:out |
                out isSlotOutliner ifTrue: [
                  l addLast: out. 
                ] False: [
                  l: l, out allSlotOutliners.
                ].
             ].
            l).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fComment: Slots in this or sub categories
-- Ungar, 2/4/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         allSlots = ( |
            | 
            unfilteredSlots asList copyFilteredBy: [|:s. |
              slotAnnotation isCategoryString: categoriesString
                                     PrefixOf: s category
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fComment: Show all slots in me and ancestors,
up till globals.
(all means in subcategories, too)
-- Ungar, 2/4/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         allSlotsInMeAndAncestors = ( |
            | 
            mirror slotsInMeAndAncestorsUpTo: reflect: ()).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: category iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         categories = ( |
             cache.
             result.
            | 
            result: set copyRemoveAll.
            cache: set copyRemoveAll.

            allSlots do: [ |:s. c |
              c: s category.
              cache if: c IsPresentDo: [] IfAbsentPut: [c] AndDo: [
                | cats |
                cats: s categories.
                cats size > categoryList size  ifTrue: [
                  result add:  cats at: categoryList size.
                ].
              ].
            ].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: unfold\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         categoryOutlinerNamed: name IfFail: failBlk = ( |
            | 
                  categoryOutliners do: [|:o | (o category = name) ifTrue: [^o] ].
            pseudoCategoryOutliners do: [|:o | (o category = name) ifTrue: [^o] ].
            ^failBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: sub outliner accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         categoryOutliners = ( |
             r.
            | 
            r: list copyRemoveAll.
            (nil != items) && isExpanded ifTrue: [
              items morphsDo: [|:o|
                o isOutliner && [o isCategoryOutliner] ifTrue:[ r addLast: o]]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: morph iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         categoryOutlinersDo: blk = ( |
            | 
            (nil != items) && isExpanded ifTrue: [
              items morphsDo: [|:o|
                o isOutliner && [o isCategoryOutliner] ifTrue:[ blk value: o]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         categoryUpdater = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotsOutliner categoryUpdater.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addOutlinerForThing: t = ( |
             o.
            | 
            o: outlinerPrototype copyMirror: outlinerToUpdate mirror
                                 Categories: ( outlinerToUpdate categoryList copyAddLast: t )
                                      Outer: outlinerToUpdate.
            outlinerToUpdate addItem: o.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         exists: t = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         oldOutliners = ( |
            | 
            outlinerToUpdate categoryOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerPrototype = ( |
            | categoryOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         outlinerToUpdate.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsUpdater = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotsOutliner slotsUpdater.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         remainingOutliners.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         remainingThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeOutliner: o = ( |
            | 
            outlinerToUpdate removeItem: o.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         thingForOutliner: o = ( |
            | 
            o category).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         things = ( |
            | 
            nil = cachedThings  ifTrue: [
              cachedThings: outlinerToUpdate categories.
            ].
            cachedThings).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         updateBlock.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            allSlotOutliners do: [|:so| 
              so expander target tailMorph collapse.
            ].
            resend.collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         copyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedButtons = ( |
             b.
            | 
            ((nil != addSlotButton) &&
             [styleMatchesProtoButton: addSlotButton]) ifTrue: [ ^self ].
            resend.createCachedButtons.

            b: buttonPrototype.
                addSlotButton: (  b copy scriptBlock: [target addSlot:     event]) label: 'Add Slot'.
            addCategoryButton: (  b copy scriptBlock: [target addCategory: event]) label: 'Add Category'.

            "asynch for the protect:"

                   copyButton: (( b copy scriptBlock: [target tearOffCopy: event]) label: 'Copy' ) isAsynchronous: true.
                   moveButton: (( b copy scriptBlock: [target tearOff:     event]) label: 'Move' ) isAsynchronous: true.
              setModuleButton: (  b copy scriptBlock: [target setModule:   event]) label: 'Set module...'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            resend.expand: evt.
            "cannot do following in buildItems"
            updateNoMatterWhatDo: []. " to actually put the slots & cats in"
            simpleOutliners && [mirror isReflecteeMethod] ifTrue: [ | editor |
              editor: (uglyTextEditorMorph copyString: 'Holy Moly Guacamole.'
                                                Style: preferences).
              editor setText: mirror sourceString.
              items addMorphLast: editor.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         fakeSlots = ( |
             r.
            | 
            r: list copyRemoveAll.
            fakeSlotsIterator mirror: mirror Do: [|:s| r addLast: s].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         finishAddingDroppingMorph: m = ( |
            | 
            protect: [
              case if: [m isSlotOutliner]     Then: [addDroppingSlot:     m ]
                   If: [m isCategoryOutliner] Then: [addDroppingCategory: m ]
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         morphTypeName = 'slotsOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         moveButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         ofDefaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         oneOfEachFakeSlot = ( |
             r.
            | 
            r: list copyRemoveAll.
            fakeSlotsIterator mirror: mirror OneOfEachDo: [|:s| r addLast: s].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: morph iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinersDo: blk = ( |
            | 
            categoryOutlinersDo: blk.
            slotOutlinersDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: category iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoCategories = ( |
             result <- bootstrap stub -> 'globals' -> 'set' -> ().
            | 
            result: result copyRemoveAll.
            oneOfEachFakeSlot do: [ |:s. c |
              c: s categories.
              (categoryList isPrefixOf: c) && [ categoryList size succ = c size ]
               ifTrue: [ result add: c first ]].
            result).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: sub outliner accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         pseudoCategoryOutliners = ( |
             r.
            | 
            r: list copyRemoveAll.
            (nil != items) && isExpanded ifTrue: [
              items morphsDo: [|:o|
                o isOutliner && [o isPseudoCategoryOutliner] ifTrue:[ r addLast: o]]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: morph iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         pseudoCategoryOutlinersDo: blk = ( |
            | 
            (nil != items) && isExpanded ifTrue: [
              items morphsDo: [|:o|
                o isOutliner && [o isPseudoCategoryOutliner] ifTrue:[ blk value: o]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         pseudoCategoryUpdater = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotsOutliner pseudoCategoryUpdater.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         oldOutliners = ( |
            | 
            outlinerToUpdate pseudoCategoryOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerPrototype = ( |
            | pseudoCategoryOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         outlinerToUpdate.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'categoryUpdater' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         remainingOutliners.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         remainingThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         things = ( |
            | 
            nil = cachedThings  ifTrue: [
              cachedThings: outlinerToUpdate pseudoCategories.
            ].
            cachedThings).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'pseudoCategoryUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         updateBlock.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fComment: sent from menu item for either
object or category outliner
-- dmu\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setModule: evt = ( |
             menu.
             mods.
             tgt.
            | 
            mods: moduleNames.
            menu: ui2Menu copy.
            menu addMorphLast: labelMorph copy label:  'Of which slots?'.
            menu addDivider.
            menu addButtonTarget: self 
                     ScriptBlock: [target setModuleOfSlotsIn: '*' Event: event]
                           Label: 'All'.
            mods size > 1 ifTrue: [
              menu addDivider.
              mods asVector copySort do: [|:m. mm|
                mm: m isEmpty ifTrue: '-' False: m.
                menu addButtonTarget: self 
                              ScriptBlock: [target setModuleOfSlotsIn: button label Event: event]
                               Label: mm.
              ].
            ].
            ofDefaultButtonHolder: menu initializeDefaultButtonHolder: ofDefaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         setModuleButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlots: slotsToChange Event: event = ( |
             menu.
             mns.
            | 

            menu: ui2Menu copy.
            menu addMorphLast: (labelMorph copy label: 'To which module?').
            menu addDivider.

            mns: mirror moduleNames asList.
            mirror creatorSlotIfPresent: [|:s. n|
              n: s module.
              (mns includes: n) ifFalse: [mns: mns copy addFirst: n].
            ] IfAbsent: [].

            mns: mns copySort.

            mns do: [|:n. |
               "async for protect:"
              menu addButtonTarget: self
                AsynchronousScript: 'target setModuleOfSlots: buttonArgs ',
                              ' To: ', n storeString, ' Event: event' 
                        ButtonArgs: slotsToChange
                             Label: n isEmpty ifTrue: '-' False: n.
            ].

            menu addDivider.
            menu addButtonTarget: self
              AsynchronousScript: 'target setModuleOfSlots: buttonArgs ',
                                  ' ToOtherEvent: event'
                      ButtonArgs: slotsToChange
                           Label: 'other'.
            toDefaultButtonHolder: menu initializeDefaultButtonHolder: toDefaultButtonHolder.
            menu colorAll: menu color.
            menu popUp: event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlots: slotsToChange To: newName Event: event = ( |
            | 
            protect: [
              slotsToChange do: [|:s| s module: newName ].
              update.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlots: slotsToChange ToOtherEvent: event = ( |
             newName <- ''.
            | 
            newName: transporter moduleDictionary
              getAModuleNameQuestion: 'Set to which module?'
                             Default: ''
                            IfCancel: [ ^ self ].

            setModuleOfSlots: slotsToChange To: newName Event: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setModuleOfSlotsIn: modName Event: event = ( |
             slotsToChange.
            | 
            "modName may be * or -"

            slotsToChange: allSlots copyFilteredBy: [|:s| 
              s isAnnotationIgnored not  && [ | n |
                n: s module.
                 case if: [modName = '*'] Then: true
                      If: [modName = '-'] Then: [ n isEmpty ]
                      Else: [ modName = n ]
              ].
            ].

            setModuleOfSlots: slotsToChange Event: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         shouldResetModuleOfDroppingSlots: slots = ( |
            | 
            case if:   [ (slots asSet copyMappedBy: [|:s| s module]) size  >  1 ]
                 Then: true
                 If:   [ myObjectOutliner moduleNames size != 1 ]
                 Then: true
                 If:   [ myObjectOutliner moduleNames first != slots first module ]
                 Then: true
                 Else: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fComment: Slots shown at top level in me,
filtering out assignment slots if so prefered.
-- Ungar, 2/4/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         shownLeaves = ( |
            | 
            shownSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fComment: Slots shown at top level in me,
filtering out assignment slots if so prefered.
-- Ungar, 2/4/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         shownSlots = ( |
            | 
            slots asList copyFilteredBy: [|:s|
              (
               mergeAssignmentSlots && [ s isAssignment ]
              ) not
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: unfold\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotOutlinerFor: slot IfFail: failBlk = ( |
            | 
            slotOutliners do: [|:o | 
              (nil != o slot) && [o slot = slot]  ifTrue: [ ^ o]
            ].
            failBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: sub outliner accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotOutliners = ( |
             r.
            | 
            r: list copyRemoveAll.
            nil = boxedItems ifFalse: [
              boxedItems  morphsDo: [|:o|
                o isOutliner && [o isSlotOutliner] ifTrue:[ r addLast: o]]].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: morph iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotOutlinersDo: blk = ( |
            | 
            nil = boxedItems ifFalse: [
              boxedItems  morphsDo: [|:o|
                o isOutliner && [o isSlotOutliner] ifTrue:[ blk value: o]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fCategory: updater objects\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotUpdater = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotsOutliner slotUpdater.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addOutlinerForThing: t = ( |
             o.
            | 
            o: slotOutliner copySlot: t
                               Outer: outlinerToUpdate.
            outlinerToUpdate addBoxedItem: o.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         exists: t = ( |
            | 
            t exists).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         oldOutliners = ( |
            | 
            outlinerToUpdate slotOutliners).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         outlinerToUpdate.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         remainingOutliners.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         remainingThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeOutliner: o = ( |
            | 
            outlinerToUpdate removeBoxedItem: o.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         thingForOutliner: o = ( |
            | 
            o slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         things = ( |
            | 
            nil = cachedThings  ifTrue: [
              cachedThings: outlinerToUpdate shownLeaves.
            ].
            cachedThings).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         updateBlock.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fComment: Slots in exactly this category.
-- Ungar, 2/4/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slots = ( |
            | 
            unfilteredSlots asList copyFilteredBy: [|:s|
              categoriesString = s category]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         orderedThings = ( |
            | 
            things asVector copySort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         outlinerToUpdate.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeOutliner: o OrUpdateWith: blk = ( |
            | 
            o isCounterfactual
              ifFalse: [  removeOutliner: o ]
                 True: [  blk value: o      ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'Category: doing the update\x7fComment: I sync things with outliners, preserving order

I use:
  oldOutliners returns a list of old outliners, 
  things returns a list of slots or categories,

  thingForOutliner: run on an outliner gives its thing,
  createOutlinerForThing: given a thing returns a new outliner on the thing,
  addOutliner: given the new outliner adds it to me,
  removeOutliner: given an outliner, removes it

-- Ungar, 2/13/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: updateBlk = ( |
            | 
            updateBlock: updateBlk.
            remainingThings:   orderedThings copy asList.
            remainingOutliners: oldOutliners copy asList.
            [     remainingOutliners isEmpty
             || [ remainingThings    isEmpty ]  ]
             whileFalse: [ |  ot. |
              ot: thingForOutliner: remainingOutliners first.
              nil = ot
               ifTrue: [ updatePlaceHolder ]
                False: [
                   remainingThings first  compare:  ot
                     IfLess:    [ updateMissingOutliner  ]
                       Equal:   [ updateMatchingOutliner ]
                       Greater: [ updateExtraOutliner ]
              ].
            ].
            "ensure that this gets removed if it ever becomes empty"
            things isEmpty ifFalse: [ outlinerToUpdate stopBeingPlaceHolder ].

            remainingOutliners do: [|:o|  removeOutliner: o OrUpdateWith: updateBlock ].
            remainingThings    do: [|:t|  addOutlinerForThing: t ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'Category: doing the update\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateExtraOutliner = ( |
             o.
             ot.
            | 
            o: remainingOutliners removeFirst.
            ot: thingForOutliner: o.
            "If outliners is merely out of place and is counterfactual,
             just remove the thing, the outliner stays"
            remainingThings 
              findFirst: [|:t| t = ot]
              IfPresent: [|:t|  o isCounterfactual ifTrue: [ ^ remainingThings remove: t ] ]
              IfAbsent:  [].
            removeOutliner: o OrUpdateWith: updateBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'Category: doing the update\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMatchingOutliner = ( |
            | 
            updateBlock value: remainingOutliners removeFirst.
            remainingThings removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'Category: doing the update\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMissingOutliner = ( |
             missingThing.
             newO.
            | 
            missingThing: remainingThings first.
            "need an outliner, unless is it present later & a place holder (not to be moved)" 
            newO: remainingOutliners 
                   findFirst: [|:o. | (thingForOutliner: o) = missingThing ]
                   IfPresent: [|:o1|  remainingOutliners remove: o1. remainingThings removeFirst.  o1]
                    IfAbsent: [addOutlinerForThing: remainingThings removeFirst].

            newO isCounterfactual ifFalse: [
              "move newO ahead of rest of them"
              remainingOutliners do: [|:o| o owner moveToBack: o].
            ].
            updateBlock value: newO.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> 'slotsUpdater' -> () From: ( | {
         'Category: doing the update\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updatePlaceHolder = ( |
             o.
            | 
            o: remainingOutliners removeFirst.
            o isCounterfactual  ifFalse: [removeOutliner: o].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Comment: Here for non-category-outliners
-- Ungar, 5/28/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         stopBeingPlaceHolder = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         synchronization* = bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         toDefaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: slot iterating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         unfilteredSlots = ( |
             kevooidal = bootstrap stub -> 'globals' -> 'false' -> ().
            | 
            kevooidal ifTrue: [allSlotsInMeAndAncestors ]
                       False: [mirror]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateCategoriesDo: blk = ( |
            | 
            (categoryUpdater copy outlinerToUpdate: self) updateDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            isInWorld && [ isExpanded] ifTrue: [
              updateNoMatterWhatDo: blk.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateNoMatterWhatDo: blk = ( |
            | 
            safelyDo: [
              updateObjectsDo:    blk.
              updateSlotsDo:      blk.
              updateCategoriesDo: blk.
              mirror isReflecteeMethod || [simpleOutliners]
                ifFalse: [ updatePseudoCategoriesDo: blk.].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fComment: Placeholder for slice outliners
where objects are shown in objects.\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateObjectsDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updatePseudoCategoriesDo: blk = ( |
            | 
            (pseudoCategoryUpdater copy outlinerToUpdate: self) updateDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSlotsDo: blk = ( |
            | 
            (slotUpdater copy outlinerToUpdate: self) updateDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotsOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            m isOutliner && [m isSlotOutliner || [m isCategoryOutliner]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractObjectOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'abstractObjectOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals slotsOutliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractObjectOutliner' -> () From: ( |
             {} = 'Comment: A normal object outliner
is a whole outliner devoted to one object.
My other child is an endoObjectOutliner,
a part of an outliner devoted to an object.

Obsoleted by pluggableOutliner and its models.
-- dmu 5/1\x7fModuleInfo: Creator: globals abstractObjectOutliner.

CopyDowns:
globals slotsOutliner. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: Abstract Object Outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (mirrors slots)\x7fVisibility: private'
        
         mirror <- bootstrap stub -> 'globals' -> 'mirrors' -> 'slots' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractObjectOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractObjectOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractObjectOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            abstractObjectOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: Abstract Object Outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)'
        
         titleEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSlotOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractLeafOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( |
             {} = 'Comment: Obsolete -- dmu 5/1\x7fModuleInfo: Creator: globals abstractSlotOutliner.

CopyDowns:
globals abstractLeafOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: abstract slot outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         cachedMethodString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: slot comment\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         commentButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: slot comment\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         commentEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: abstract slot outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (uglyMethodEditorMorph)\x7fVisibility: private'
        
         methodEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractSlotOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( |
             {} = 'Comment: I model behavior of slot-like things,
real slots, pseudo slots, activations in a processMorph.
In order to inherit from me, you must be able
to cons up a slot-oidal object.
-- dmu 12/94\x7fModuleInfo: Creator: traits abstractSlotOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | abstractSlotOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: abstract slot outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slot <- bootstrap stub -> 'globals' -> 'slots' -> 'plain' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: abstract slot outliner state\x7fComment: Used in constructItems to decide whether
or not a structureEditor should be openen
instead of an uglyEditor\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         useStructureEditor <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals slotsOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals categoryOutliner.

CopyDowns:
globals slotsOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (\'\')'
        
         categoriesString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         categoryList.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'Comment: Since these are created empty,
this flag is true for a newly-created, empty
category.
It is falsified by update when this is updated and
not empty.
When true, it keeps update from deleting me.
-- Ungar, 5/28/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isPlaceHolder <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         mirror.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         outer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         categoryOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits categoryOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'categoryOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | categoryOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'categoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         title.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         obsObjOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules obsObjOutliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            (
              abstractObjectOutliner 
            &         objectOutliner 
            &   abstractLeafOutliner 
            &   abstractSlotOutliner 
            &           slotOutliner 
            &       categoryOutliner 
            ) asVector do: [|:o| o initializePrototype].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'obsObjOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: building\x7fComment: use an editor so we can
update the object\'s title\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            titleEditor: smallEditorMorph copyString: titleString
                                               Style: preferences.
            titleEditor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         categoriesString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         categoryList = ( |
            | vector copySize: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentHolder = ( |
            | mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: copying\x7fComment: Use with caution,
copyMirror: World: w is better
-- Ungar, 1/12/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: mirr = ( |
            | 
            (copy mirror: mirr) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         hackCopy = ( |
             newM.
            | 
            mirror isReflecteeMethod ifTrue: [  
              newM: mirrors method copyBytecodes: mirror codes 
                                    Literals: mirror literals
                                    File: mirror file
                                        Line: mirror line  
                                         Source: mirror sourceString.
            ] False: [
              newM:  (reflect: mirror reflectee _Clone) 
            ].
            objectOutliner copyMirror: newM).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype beShrinkWrap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isObjectOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'abstractObjectOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         myObjectOutliner = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         recategorizeDroppedSlot: s = ( |
            | s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showSlot: slot Event: evt = ( |
            | 
            showSlot: slot Event: evt IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         titleString = ( |
            | 
            mirror isReflecteeMethod ifTrue: [
              'a method'
            ] False: [
              mirror nameSize: 40
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         unfold: slot Event: evt = ( |
            | 
            unfold: slot Event: evt IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         updateDo: blk = ( |
            | 
            updateTitle.
            resend.updateDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         updateTitle = ( |
             str <- ''.
            | 
            simpleOutliners ifFalse: [
              str: titleString.
              titleEditor contentsString = str ifFalse: [
                titleEditor string: str.
                titleEditor addLabels.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         objectOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'objectOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractObjectOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals objectOutliner.

CopyDowns:
globals abstractObjectOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: Object Outliner state\x7fCategory: Comment Button state\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: Object Outliner state\x7fCategory: Comment Button state\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: Object Outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (set copyRemoveAll)\x7fVisibility: private'
        
         evaluators <- set copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: Object Outliner state\x7fCategory: Annotation Info state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         maybeObsoleteAnnotationInfo.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: Object Outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         moduleSummary.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         objectOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits objectOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'objectOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | objectOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: Object Outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)'
        
         theSheet.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'objectOutliner' -> () From: ( | {
         'Category: Object Outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         useStructureEditorOnMethods <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonsTo: menu = ( |
            | 
            nil = myObjectOutliner ifFalse: [
              "slot for adding does not know which object to add to
               without being in object outliner"
              menu addButton: addSlotButton.
            ].
            menu addButton: addCategoryButton.
            menu addDivider.
            menu addButton: copyButton.
            menu addButton: moveButton.
            menu addDivider.
            menu addButton: setModuleButton.
            menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         adjustCategoryPrefixForCopying: mirr = ( |
            | 
            mirr do: [|:s|
                s isAssignment ifFalse: [   "Assignment slots share the annotation with
                                             their corresponding data slot, so should not
                                             adjust it twice."
                    s categories: 
                        s categories asVector copyFrom: categoryList size pred.
                ].
            ].
            mirr).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         buildTitle = ( |
            | 
            title: smallEditorMorph copyString: titleString
                                        Target: self
                                        Accept: categoryChanged
                                        Cancel: cancelCategoryChange
                                         Style: categoryOutlinerPreferences.
            title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         cancelCategoryChange = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'categoryOutliner' -> 'cancelCategoryChange' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits categoryOutliner cancelCategoryChange.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> 'cancelCategoryChange' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            source editMode: source false.
            target categoryList last isEmpty
             ifTrue: [ target delete ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         category = ( |
             d.
            | 
            d: categoryList last.
            d asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         categoryChanged = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'categoryOutliner' -> 'categoryChanged' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits categoryOutliner categoryChanged.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> 'categoryChanged' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target changeCategoryTo: source contentsString Event: evt.
            source string: source contentsString.
            source editMode: source false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         changeCategoryTo: str Event: evt = ( |
             changedToExistingCategory.
             i.
             ocat.
            | 
            i: categoryList lastKey.
            ocat: categoryList last.

            changedToExistingCategory: 
              (str != ocat)  && [ outer categories includes: str ].

            allSlots do: [|:s|
              myObjectOutliner 
                changeCategoriesOfSlotInObject: s 
                  To: 
                    str = ''  
                      ifFalse: [ s categories asVector at: i Put: str ]
                         True: [ (s categories asSequence removeKey: i) asVector ]
            ].
            categoryList at: i Put: str.
            changedToExistingCategory  ||  [ str = '' ]  ifTrue: [ outer removeItem: self].
            safelyDo: [ myObjectOutliner update ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAll: evt = ( |
            | 
            resend.collapseAll: evt.
            collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFreshMirror: mirr Categories: cat Outer: o = ( |
             new.
            | 
            new: copy mirror: mirr.
            new  categoryList: (cat asList add: '') asVector.
            new  categoriesString: slotAnnotation convertCategoryListToString: new categoryList.
            new  outer: o.
            new  initialize.
            new  title editMode: true.
            new  title editor firstRow setTyper.
            new isPlaceHolder: true.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: mirr Categories: cat Outer: o = ( |
            | 
            ((((
              copy mirror: mirr) 
              categoryList: cat)
              categoriesString: slotAnnotation convertCategoryListToString: cat)
              outer: o) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: mirr Category: cat Outer: o = ( |
            | 
            copyMirror: mirr Categories: (vector copySize: 1 FillingWith: cat) Outer: o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            borderWidth: 0.
            beFlexible.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCategoryOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
            isPlaceHolder || [resend.isCounterfactual]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
             ss.
            | 
            "Turn into object"
            w isWorldMorph ifFalse: [ ^ self].
            ss: allSlots.
            ss isEmpty ifFalse: [
               | o |
              o: w outlinerForMirror: ss first holder.
              o isInWorld ifFalse: [  w addMorph: o. ].
              w moveToFront: o.
              o globalPosition: globalPosition.
              o showSlot: ss first Event: evt.
              delete.
            ] True: [ | o |
              o: w outlinerForMirror: reflect: () _Clone.
              o isInWorld ifFalse: [  w addMorph: o. ].
              w moveToFront: o.
              o globalPosition: globalPosition.
              o addDroppingMorph: self Event: evt
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: modules\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         moduleNames = ( |
            | 
            set copyRemoveAll addAll:
              ( allSlots asList copyFilteredBy: [|:s| s isAnnotationIgnored not ] )
                copyMappedBy: [|:s| s module ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'categoryOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         myObjectOutliner = ( |
            | 
            nil = outer ifTrue: [nil] False: [ outer myObjectOutliner ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slotsOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         recategorizeDroppedSlot: s = ( |
            | 
            s copyHolderForCategories:
              (categoryList asList addAll: s categories) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: evaluation support\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | nil = outer ifTrue: nil False: [ outer receiver ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         stopBeingPlaceHolder = ( |
            | isPlaceHolder: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOff: evt = ( |
            | 
            isCounterfactual && [isPlaceHolder not] ifTrue: [ warnCounterfactualIfAbort: [^ self ] ].

            protect: [
              tearOffCopy: evt.
              myObjectOutliner mirror removeSlotsFromMeAndDescendants: allSlots.
              safelyDo: [ delete ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOffCopy: evt = ( |
             o.
            | 
            protect: [
              o: categoryOutliner
                 copyMirror: ( adjustCategoryPrefixForCopying: (reflect: ()) copyAddSlots: allSlots )
                 Categories: ( vector copyAddLast: category)
                      Outer: nil.
              o position: globalPosition.
              o beShrinkWrap.
              safelyDo: [ evt sourceHand attach: o ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         titleString = ( |
            | category).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'categoryOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            nil = outer  ifFalse: [
              categoryList: outer categoryList copyAddLast: category.
              categoriesString: slotAnnotation convertCategoryListToString: categoryList.
            ].
            resend.updateDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoCategoryOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'pseudoCategoryOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'isPlaceHolder' From:
             bootstrap remove: 'isPlaceHolder:' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals categoryOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pseudoCategoryOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pseudoCategoryOutliner.

CopyDowns:
globals categoryOutliner. copyRemoveAllMorphs 
SlotsToOmit: isPlaceHolder isPlaceHolder: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoCategoryOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pseudoCategoryOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | pseudoCategoryOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addCommentButtonTo: morphList = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildExpander = ( |
             lptm.
            | 
            lptm: outlinerLeafPointerTailMorph copyForLeafOutliner: self.
            expander: lptm headMorph firstMorph.
            lptm).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
             l.
             tle.
            | 

            header: outlinerHeader copyTarget: self 
                                        Style: preferences.
            isForEditingNew ifTrue: ["for editing new" ^ header].

            l: list copyRemoveAll.

            tle: buildTitle.
            l add: tle.

            addCommentButtonTo: l.

            l add: flexibleSpacer copy color: color.

            contentsLabel: optionalMorph copy color: color.
            l add: contentsLabel.
            l add: rigidSpacer copyH: 4 Color: color.

            l add: buildExpander.
            header addAllMorphs: l.

            " put contents string and sprout box at bottom of tall title "
            tle morphs findFirst: [|:m| m morphTypeName = 'columnMorph' ]
                       IfPresent: [ header bottomJustify]
                        IfAbsent: [ header centerJustify].
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            titleEditor:
              nameEditorMorph copyString: myKey
                                    Target: self
                                    Accept: nameChanged
                                     Style: titleStyle.
            titleEditor isAsynchronous: true.
            titleEditor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '       ' &
    '       ' &
    '0000000' &
    '       ' &
    '0000000' &
    '       ' &
    '       ' ) asVector
 Colors: (
    (paint named: 'black') &
    (paint named: 'black')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits abstractLeafOutliner buttonIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelEditing = ( |
            | 
            isForEditingNew ifTrue: [ ^ removeLeaf ].
            removeMorph: editor.
            editor: nil.
            initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: name\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         changeName: evt = ( |
            | 
            error: 'not supported'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         childResponsibilities* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractLeafOutliner childResponsibilities.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: editing\x7fCategory: name\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         changeName: evt = ( |
            | 
            error: 'not supported'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         changeTo: str Editor: editor Event: evt = ( |
            | 
            childMustImplement.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: accessing\x7fComment: child must implement either me or contentsObjects\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsMirror = ( |
            | reflect: contentsObject).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsObject = ( |
            | contentsMirror reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsString = ( |
            | '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         copyForTearingOff = ( |
            | 
            childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyLeaf: thing Outer: o = ( |
            | childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         editString = ( |
            | isForNew ifTrue: 'proto string' False: 'my string').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isForEditingNew = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         myKey = ( |
            | childMustImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         myRootOutliner = ( |
             r.
            | 
            isInWorld ifFalse: [^nil].
            r: self.
            [
              | o |
              o: r owner.
              (o != nil) && [o isOutliner] ifFalse: [^ r].
              r: o
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fComment: Remove this entry and its outliner.\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLeafFromHolder = ( |
            | 
            childMustImplement.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'childResponsibilities' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingBody: rr = ( |
            | 
            childMustImplement.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAll: evt = ( |
            | collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsLengthLimit = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         copyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOuter: o = ( |
            | 
            copy outer: o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedButtons = ( |
             b.
            | 
            nil != editButton ifTrue: [ ^self ].

            parent.createCachedButtons.

            b: buttonPrototype.

            editButton:        (  b copy  scriptBlock: [target edit:           event]) label: 'Edit'.

            "async for protect:"
            moveButton:        (( b copy  scriptBlock: [target tearOff:        event]) label: 'Move' ) isAsynchronous: true.
            copyButton:        (( b copy  scriptBlock: [target tearOffCopy:    event]) label: 'Copy' ) isAsynchronous: true.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         edit: evt = ( |
            | 
            removeAllMorphs.
            inEditMode: true.
            editor: uglyTextEditorMorph copyString: editString
                                            Target: self 
                                            Accept: editAccept
                                            Cancel: editCancel
                                             Style: preferences.
            editor panel acceptButton isAsynchronous: true.
            editor receiver: receiver.
            addMorphLast: editor.
            editor beTypingFocusFor: evt sourceHand.
            editor text selectAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editAccept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'editAccept' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractLeafOutliner editAccept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'editAccept' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target changeTo: source contentsString
                     Editor: source
                      Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         editButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         editCancel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'editCancel' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractLeafOutliner editCancel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'editCancel' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancelEditing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: name\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingName: rr = ( |
            | 
            protect: [ unprotectedFinishChangingName: rr ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            resend.initialize.
            inEditMode: false.
            borderWidth: 1.
            frameStyle: insetBezelStyle.
            beFlexible.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: counterfactualism\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
            case
              if: [ resend.isCounterfactual ]  Then: true
              If: [ inEditMode && [ editor isCounterfactual ] ]  Then: true
              If: [ ( nil !=   titleEditor ) &&  [   titleEditor isCounterfactual ] ] Then: true
              If: [ nil = myRootOutliner ] Then: true
              If: [ isForEditingNew ] Then: true
              Else: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isForNew = ( |
            | "true if I am in state for editing new slot/entry"
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isLeafOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         morphTypeName = 'abstractLeafOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         moveButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         nameChanged = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'nameChanged' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractLeafOutliner nameChanged.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'nameChanged' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target changeName: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         nameEditorMorph = ( |
            | smallEditorMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerForSprouting: evt IfNone: fb = ( |
            | 
            fb value: 'a child should have implemented me').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'nonpluggableOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole enchilada\x7fComment: Remove this entry and its outliner.\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLeaf = ( |
            | 
            isForEditingNew || [isCounterfactual]  ifFalse: [ 
              removeLeafFromHolder.
            ].
            safelyDo: [ outer removeBoxedItem: self ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: sprouting\x7fComment: reel in the arrow\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         retract = ( |
            | 
            expander target tailMorph collapse. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         shortOneLinify: aString = ( |
             elipsis = '...'.
            | 
            "elipsis for multiliners"
            (aString includes: '\n')
            || [aString includes: '\r']
              ifTrue: [^ elipsis ].
            aString copyAtMostWithTrailingEllipsis: contentsLengthLimit).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: evt = ( |
            | sproutWithoutArrow: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'sproutAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractLeafOutliner sproutAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> 'sproutAction' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target sprout: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutWithArrow: evt = ( |
            | 
            expander target pointTo: outlinerForSprouting: evt IfNone: [^self].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutWithoutArrow: evt = ( |
             o.
            | 
            o: outlinerForSprouting: evt IfNone: [ ^ self].
            expandWhenSprouted ifTrue: [ o expand: evt ].

            o isInWorld ifFalse: [
              evt sourceHand attach: o.
            ] True: [
              world moveToFront: o.
              o moveToPosition: evt sourceHand globalPosition.
            ].
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         tearOff: evt = ( |
            | 
            "sent from slot menu move button"

            isCounterfactual ifTrue: [ warnCounterfactualIfAbort: [^ self ] ].

            protect: [
              tearOffCopy: evt.
              removeLeaf.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOffCopy: evt = ( |
             o.
            | 
            protect: [
              o: copyForTearingOff.
              o position: globalPosition.
              o beShrinkWrap.
              safelyDo: [ evt sourceHand attach: o ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleStyle = ( |
            | 
            nonpluggableOutliner preferences).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateButtonIcon = ( |
             i.
            | 
            i: buttonIcon.
            i = expander firstMorph image ifFalse: [
              expander removeAllMorphs.
              expander addMorphLast: (imageMorph copyImage: i).
              expander changed.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateContentsString = ( |
            | 
            showSlotContents  ifTrue: [
              nil = contentsLabel inner ifTrue: [
                contentsLabel inner: 
                    ((labelMorph copy label: contentsString)
                                   fontSpec: mediumFontSpec copyName: 'times' Style: 'italic')
                                   colorAll: color.
                contentsLabel open.
              ] False: [| c <- ''|
                c: contentsString.
                c = contentsLabel inner label ifFalse: [
                  safelyDo: [ contentsLabel inner label: c ].
                ].
              ].
              contentsLabel color = color ifFalse: [contentsLabel colorAll: color].
            ] False: [
              nil = contentsLabel inner ifFalse: [
                contentsLabel inner delete.
                contentsLabel inner: nil.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            isForEditingNew ifTrue: [^ self].
            updateTitle.
            updateContentsString.
            updateButtonIcon).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateTitle = ( |
            | 
            nil = titleEditor  ifTrue: [^ self].
               (titleEditor style = titleStyle)
            || (titleEditor editMode) ifFalse: [
              titleEditor style: titleStyle.
              titleEditor initialize.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsTo: menu = ( |
             isA.
            | 

            nil = slot ifTrue: ["in process of adding a slot, none yet" ^ l ].

            isA: mergeAssignmentSlots && [slot exists && [slot isAssignable]].
            simpleOutliners ifFalse:  [ 
              menu addButton:              sendersButton.
              menu addButton:         implementorsButton.
              menu addButton:             findSlotButton.

              isA ifTrue: [
                menu addDivider.
                menu addButton:              sendersOfAssignmentButton.
                menu addButton:         implementorsOfAssignmentButton.
                menu addButton:             findSlotOfAssignmentButton.
              ].
              menu addDivider.

              menu addButton:      sendersInFamilyButton.
              isA ifTrue: [
                menu addButton:      sendersOfAssignmentInFamilyButton.
              ].
              menu addButton: implementorsInFamilyButton.
              isA ifTrue: [
                menu addButton: implementorsOfAssignmentInFamilyButton.
              ].
              menu addDivider.
            ].
            receiver isComplete ifTrue: [ menu addButton: sendButton ].

            menu addButton: createButtonButton.
            simpleOutliners ifFalse:  [
              hasMethod ifTrue: [
                menu addButton:  useStructureEditor 
                                   ifTrue: [ disableStructureEditorButton ] 
                                    False: [ structureEditorButton ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addCommentButtonTo: morphList = ( |
            | 
            isOKToLookAtAnnotation ifTrue: [
              "Looking at the annotation for an activation slot
               invalidates the slot"
              buildCommentButton.
              simpleOutliners ifFalse: [
                morphList add: commentButton.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         beTypingFocusFor: sourceHand = ( |
            | 
            isExpanded && [ nil != methodEditor ] ifTrue: [methodEditor beTypingFocusFor: sourceHand].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLocals = ( |
            | 
            "maybe should use a separate object to hold these:
            a slots outliner!"
            localHolder do: [|:slot|
                   slot isArgument not
                 && [ slot value isReflecteeAssignment not ]
                 ifTrue: [ addItem: slotOutliner copySlot: slot Outer: self]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            titleEditor:
              nameEditorMorph copySlot: leaf
                                    Target: self
                                    Accept: nameChanged
                                     Style: titleStyle.
            titleEditor isAsynchronous: true.
            titleEditor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonIcon = ( |
            | 
              "must test for assignable before assignment,
               otherwise fake slots break"
            case
             if: [ slot isMethod ] Then: [ methodIcon ]
             If: [simpleOutliners] Then: [
                   "imageMorph copyImage:" ui2Image copyWidth: 7 Height: 7 Color: color]
             If: [ slot isAssignable not ] Then: [ equalsIcon ]
             If: [ slot isAssignment ] Then: [ leftArrowIcon ]
             If: [ slot isAssignable && [ mergeAssignmentSlots ]]
                 Then: [ colonIcon ]
             Else: [ morph ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelEditingMethod = ( |
            | 
            methodEditor setText: methodString.
            methodEditor clearPanel.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         changeContentsEverywhereTo: nSlot Event: evt = ( |
            | 
            slot contents defineAndSave: nSlot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         changeMethodTo: str Event: evt = ( |
            | 
            str evalObjectBodyInContext: lobby asMirror
                Prefix: '(| ', slot longKey, ' = (\n'
                Postfix: ') |)' 
                ReportingTo: 
                  (((ui2ResultReporter copy
                      event: evt)
                      editor: methodEditor text)
                      reportTo: self)
                      howToReport: 'finishChangingMethod:'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         changeSlotInObjectTo: nSlotPair IfFail: fb = ( |
             nSlot.
            | 

            nSlot: slot changeSlotInObjectTo: nSlotPair IfFail: [^ fb value].

            safelyDo: [
              slot: nSlot.
              initialize update.
              myObjectOutliner update
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAll: evt = ( |
            | 
            dismissCommentEditor.
            resend.collapseAll: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: button icons\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         colonIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '   0   ' &
    '  000  ' &
    '   0   ' &
    '       ' &
    '   0   ' &
    '  000  ' &
    '   0   ' ) asVector
 Colors: (
    (paint named: 'black') &
    (paint named: 'black')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSlotOutliner colonIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            resend.colorAll: 
              preferredColor = prototype preferredColor
                ifTrue: [ newC ]
                 False: [ preferredColor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentButtonAndEditor* = bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentHolder = ( |
            | 
            slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         constructItems = ( |
            | 
            setCachedIsMethod.
            hasMethod ifTrue: [
              cachedMethodString: methodString.
              useStructureEditor ifTrue: [
                methodEditor: createStructureEditor.
              ] False: [
                buildLocals.
                methodEditor:
                  methodEditorPrototype copyString: cachedMethodString
                                            Target: self 
                                            Accept: methodAccept
                                            Cancel: methodCancel
                                             Style: preferences.
                methodEditor panel acceptButton isAsynchronous: true.
                methodEditor receiver: receiver.
              ].
              addItem: methodEditor.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsMirror = ( |
            | slot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsString = ( |
             elipsis = '...'.
            | 
            case
             if: [hasMethod] Then: [ "test first for top-level activations"
             | m. src. s |
            "hack because I don't want to trace why string starts with newline"
            src: method source.
            ('\n\r' includes: src first) ifTrue: [src: src copyWithoutFirst].
             (src includes: '\n') ifTrue: [^elipsis]. "optimize long methods"
             (src includes: '\r') ifTrue: [^elipsis]. "optimize long methods"
             m: methodTextWithoutSlots.
             (m lines size > 1) || [s: m asString. s size > contentsLengthLimit]
               ifTrue: [^elipsis].
             s
            ] If: [slot exists ] Then: [ slot value nameSize: contentsLengthLimit]
              Else: 'non-existent').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: executing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createButton: evt = ( |
             b.
            | 
            (nil = createComplexButton: evt) ifTrue: [
              b: ui2Button copy.
              b label: slot name.
              b script: 'target ', slot name.
              b target: receiver reflectee.
              "set color and force button to be in up state"
              b color: color. 
              evt sourceHand attach: b.
              self
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)'
        
         createButtonButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedButtons = ( |
             b.
            | 
            ((nil != findSlotButton) &&
             [styleMatchesProtoButton: findSlotButton]) ifTrue: [ ^self ].

            parent.createCachedButtons.
            commentButtonAndEditor.createCachedButtons.

            b: buttonPrototype.

                        findSlotButton: (b copy  scriptBlock: [target findSlot:             event]) label: 'Find slot.'.
                    implementorsButton: (b copy  scriptBlock: [target implementors:         event]) label: 'Implementors'.
            implementorsInFamilyButton: (b copy  scriptBlock: [target implementorsInFamily: event]) label: 'Implementors in family'.
                         sendersButton: (b copy  scriptBlock: [target senders:              event]) label: 'Senders'.
                 sendersInFamilyButton: (b copy  scriptBlock: [target sendersInFamily:      event]) label: 'Senders in family'.

                        findSlotOfAssignmentButton: (b copy  scriptBlock: [target             findSlotOfAssignment: event]) label: 'Find slot of :'.
                    implementorsOfAssignmentButton: (b copy  scriptBlock: [target         implementorsOfAssignment: event]) label: 'Implementors of :'.
            implementorsOfAssignmentInFamilyButton: (b copy  scriptBlock: [target implementorsOfAssignmentInFamily: event]) label: 'Implementors of : in family'.
                         sendersOfAssignmentButton: (b copy  scriptBlock: [target              sendersOfAssignment: event]) label: 'Senders of :'.
                 sendersOfAssignmentInFamilyButton: (b copy  scriptBlock: [target      sendersOfAssignmentInFamily: event]) label: 'Senders of : in family'.

            createButtonButton: (b copy  scriptBlock: [target createButton: event]) label: 'Create button'.
            sendButton:  ((b copy  scriptBlock: [target send: event]) label: 'Send') isAsynchronous: true.

            structureEditorButton: (b copy  scriptBlock: [target methodStructureEditor: event]) label: 'Structure editor'.
            disableStructureEditorButton: (b copy  scriptBlock: [target disableStructureEditor: event]) label: 'Disable structure editor'.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: executing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createComplexButton: evt = ( |
            | 
            abstractSyntax complexButtonMorph 
              copy: slot key Target: receiver reflectee Event: evt Color: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: structure editing\x7fComment: Is currently only working for outliners
as defined in traits slotOutliner.
It does NOT work for debugger frames
as defined with activationMorph.
The getMirror method may be moved to
traits activationMorph.
The structureEditor must be modified to
respond to the \'text\' message as called in
traits activationMorph setMethodSelection:
   methodEditor text scalarSelectionStart: csp x End: csp y
Perhaps more modifications will have to be made.\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         createStructureEditor = ( |
             out.
             pos.
             theAST.
            | 
            theAST: mirror makeAST.
            theAST: theAST findSlot: slot name.
            theAST checkIfCodeIsParsed: theAST method.
            pos: theAST method createStructureEditor: nil.
            pos currentColumn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: structure editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         disableStructureEditor: evt = ( |
            | 
            useStructureEditor: false.
            itemsCached: false.
            collapse: evt.
            expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         disableStructureEditorButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: button icons\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         equalsIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '       ' &
    '       ' &
    '0000000' &
    '       ' &
    '0000000' &
    '       ' &
    '       ' ) asVector
 Colors: (
    (paint named: 'black') &
    (paint named: 'black')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSlotOutliner equalsIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         findSlot: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                    findSlot: myKey
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         findSlotButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         findSlotOfAssignment: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                    findSlot: myKey, ':'
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         findSlotOfAssignmentButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole thing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingBody: rr = ( |
            | 
            protect: [ unprotectedFinishChangingBody: rr ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingMethod: rr = ( |
            | 
            "performed from changeBodyTo:Editor:Event:"
            protect: [
              changeMyMethodTo: (reflect: rr result) first
                         Event: rr event
                        IfFail: [^ self]. 
              methodEditor clearPanel.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         hasMethod = ( |
            | 
            slot exists && slot isMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         implementors: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: myKey
                  StartingFrom: receiver
                         Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         implementorsButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         implementorsInFamily: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: myKey
                    InFamilyOf: receiver
                         Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         implementorsInFamilyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         implementorsOfAssignment: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: myKey, ':'
                  StartingFrom: receiver
                         Event: evt.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         implementorsOfAssignmentButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         implementorsOfAssignmentInFamily: evt = ( |
            | 
            evt sourceHand attach: 
              enumerationMorphFactory
                implementorsOf: myKey, ':'
                    InFamilyOf: receiver
                         Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         implementorsOfAssignmentInFamilyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: counterfactualism\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
            resend.isCounterfactual
            || [   ( nil != commentEditor ) && [ commentEditor isCounterfactual ]  ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isForEditingNew = ( |
            | nil = slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isOKToLookAtAnnotation = ( |
            | "Looking at the annotation for an activation slot
               invalidates the slot"
            slot holder isReflecteeActivation not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: mapping leaves to slots\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         leaf = ( |
            | slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: button icons\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         leftArrowIcon = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> 'leftArrowIcon' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSlotOutliner leftArrowIcon.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         messages: evt = ( |
            | 
            evt sourceHand attach: (messagesMorph copySlot: slot Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         methodAccept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> 'methodAccept' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSlotOutliner methodAccept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> 'methodAccept' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target changeMethodTo: source contentsString
                            Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         methodCancel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> 'methodCancel' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSlotOutliner methodCancel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> 'methodCancel' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancelEditingMethod.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         methodEditorPrototype = bootstrap stub -> 'globals' -> 'uglyMethodEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: button icons\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         methodIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '0000000' &
    '0     0' &
    '0000000' &
    '0     0' &
    '0     0' &
    '0     0' &
    '0000000' ) asVector
 Colors: (
    (paint named: 'black') &
    (paint named: 'black')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: traits abstractSlotOutliner methodIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         methodString = ( |
            | 
            methodTextWithSlots asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         methodStringWithoutSlots = ( |
            | 
            methodTextWithoutSlots asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: structure editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         methodStructureEditor: evt = ( |
            | 
            useStructureEditor: true  .
            itemsCached: false  .
            collapse: evt.
            expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         methodTextWithSlots = ( |
             m.
            | (methodText copyForMethod: method) formatMethodBody).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         methodTextWithoutSlots = ( |
             m.
            | 
            m: methodText copyForMethod: method.
            m formatMethodBodyWithoutSlots.
            m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         mirror = ( |
            | myObjectOutliner mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         morphTypeName = 'abstractSlotOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         myKey = ( |
            | slot name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         myObjectOutliner = ( |
            | 
            nil = outer 
              ifTrue: nil
              False: [ outer myObjectOutliner]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: mapping leaves to slots\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         myRootOutliner = ( |
            | myObjectOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         nameEditorMorph = ( |
            | slotNameEditorMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerForSprouting: evt IfNone: fb = ( |
            | 
            slot exists ifFalse: [
              (message copy receiver: userQuery 
                            Selector: 'report:'
                                With: 'Sorry, but that slot does not exist (any more).'
              ) forkForBirthEvent: evt.
            ^ fb value.
            ].
            world outlinerForMirror: slot value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractLeafOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: preferences\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         preferences = ( |
            | 
            (nil != slot) && [slot exists && [slot isCopiedDown ]] ifTrue: [
              ^copyDownSlotOutlinerPreferences].
            slotOutlinerPreferences).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: mapping leaves to slots\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         rootOutliner = ( |
            | objectOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: executing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         send: evt = ( |
            | 
            slot name sendTo: slot holder reflectee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)'
        
         sendButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         senders: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                   sendersOf: myKey
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         sendersButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         sendersInFamily: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                 sendersOf: myKey
                InFamilyOf: receiver
                     Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         sendersInFamilyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         sendersOfAssignment: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                   sendersOf: myKey, ':'
                StartingFrom: receiver
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         sendersOfAssignmentButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: browsing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         sendersOfAssignmentInFamily: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory
                  sendersOf: myKey, ':'
                 InFamilyOf: receiver
                      Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         sendersOfAssignmentInFamilyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setCachedIsMethod = ( |
            | 
            cachedIsMethod: hasMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: evt = ( |
            | 
            case if: [ evt shiftIsDown not && [ hasMethod ]]  
               Then: [ toggleExpandState: evt  ]
               Else: [ resend.sprout: evt ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         structureEditorButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         synchronization* = bootstrap stub -> 'mixins' -> 'ui2' -> 'programmingSynchronization' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | slot longKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleExpandState: evt = ( |
            | 
            resend.toggleExpandState: evt.
            isExpanded
              ifTrue: [beTypingFocusFor: evt sourceHand]
               False: [evt sourceHand removeAllKeyboardSubscribers
                       world moveToFront: root].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slotOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'slotOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals abstractSlotOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotOutliner.

CopyDowns:
globals abstractSlotOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutliner' -> () From: ( | {
         'Category: slot outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         cachedIsMethod <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutliner' -> () From: ( | {
         'Category: slot outliner state\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         maybeObsoleteAnnotationInfo.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slotOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | slotOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsTo: menu = ( |
            | 
            isForEditingNew ifTrue: ["in process of adding a slot, none yet" ^ self].
            slot exists ifFalse: [ ^ self].
            menu addButton: editButton.
            simpleOutliners ifFalse: [menu addButton: copyButton.].
            menu addButton: moveButton.
            simpleOutliners ifFalse:  [ 

              menu addDivider.

              slot visibility = privateSlot    ifFalse:  [ menu addButton: privateButton ].
              slot visibility = undeclaredSlot ifFalse:  [ menu addButton: undeclaredButton ].
              slot visibility = publicSlot     ifFalse:  [ menu addButton: publicButton ].

              menu addDivider.

              addCommentButtonsTo: menu.

              slot isAnnotationIgnored ifFalse: [
                addAnnotationInfoButtonsTo: menu.
                menu addButton: setModuleButton.
              ].
              slot isWorthAskingAboutCreator ifTrue: [ menu addButton: makeCreatorButton ].
            ].
            menu addDivider.
            resend.addButtonsTo: menu).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            outer addDroppingMorph: m Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: slot iterating (for tearing off)\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         allSlots = ( |
            | slots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationInfoMixin* = bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildLocals = ( |
            | 
            "no locals on regular slots--yet.
            would need to get them to update"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         changeMyMethodTo: newSlot Event: evt IfFail: fb = ( |
            | 
            slot holder changeContentsOfSlotInMeAndDescendantsTo: newSlot.
            "set this straight for the sake of the updateMethodEditor method"
            cachedMethodString: methodEditor contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: name\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         changeName: evt = ( |
             n.
             new.
             newContents.
             newSlot.
             result.
             rr.
             stringToParse.
            | 
            "this method is used to change the slot's name, when you double click on it"

            rr: ui2ResultReporter copy.
            rr event: evt.
            rr editor: titleEditor editor.
            rr reportTo: self.
            rr howToReport: 'finishChangingName:'.

            titleEditor contentsString
              evalObjectBodyInContext: (reflect: lobby)
                                 Prefix: '| '
                                Postfix:  (case if:    [ slot value isReflecteeMethod ]
                                               Then:  ' = (self) |' 
                                               If:    [ slot isAssignable ]
                                               Then:  ' <- 0 | '
                                               Else:  ' = 0 | ')
                            ReportingTo: rr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole slot\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         changeTo: str Editor: editor Event: evt = ( |
            | 
            str evalObjectBodyInContext: lobby asMirror
                Prefix: '| '
                Postfix: ' |'
                ReportingTo: 
                  (((ui2ResultReporter copy
                      event: evt)
                      editor: editor text)
                      reportTo: self)
                      howToReport: 'finishChangingBody:'.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: expandAndCollapse\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAll: evt = ( |
            | 
            removeAnnotationInfo.
            resend.collapseAll: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         copyForTearingOff = ( |
            | 
            slotOutliner 
                copySlot: ((reflect: ()) copyAddSlots: allSlots) first
                   Outer: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyNewOuter: o Event: evt = ( |
            | 
            (copySlot: nil Outer: o) edit: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlot: s Outer: o = ( |
            | 
            (((prototypeFor: s)
               copyOuter: o) 
               slot: s) 
               initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedButtons = ( |
             b.
            | 
            ((nil != makeCreatorButton) &&
             [styleMatchesProtoButton: makeCreatorButton]) ifTrue: [ ^self ].

            parent.createCachedButtons.
            annotationInfoMixin.createCachedButtons.

            b: buttonPrototype.

            makeCreatorButton: ((b copy scriptBlock: [target makeCreator:    event]) label: 'Make creator'  ) isAsynchronous: true.
            setModuleButton:   ( b copy scriptBlock: [target setModule:      event]) label: 'Set module...'.

            "async for protect:"
            publicButton:      (( b copy scriptBlock: [target makePublic:     event]) label: 'Make public'     ) isAsynchronous: true.
            privateButton:     (( b copy scriptBlock: [target makePrivate:    event]) label: 'Make private'    ) isAsynchronous: true.
            undeclaredButton:  (( b copy scriptBlock: [target makeUndeclared: event]) label: 'Make undeclared' ) isAsynchronous: true.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         editString = ( |
            | 
            isForEditingNew ifTrue: [
              'slotName =  slotContents\n',
              '         Or             \n',
              'slotName <- slotContents\n\n',
              '------- Examples --------\n', 
              'Constants:\n',
              '          pi =  3.14159\n',
              '   greetUser = ( userQuery report: \'hi\' )  \"A method body is in parens.\"\n',
              '         + x = ( add: x )                  \"Binary selectors like +\n',
              '                                            take a single argument.\"\n',
              'add: a To: b = ( a + b )                   \"Keyworded notation allows\n',
              '                                            one or more arguments.\"\n',
              'Assignables:\n',
              '      items <- list copyRemoveAll          \"Can access this slot, or set\n',
              '                                            it (using \'items: newList\').\"\n'.
            ] False: [
              slot evalStringAssignable
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: expandAndCollapse\x7fComment: Do not expand methods in slots.\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAll: evt = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: method\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingMethod: rr = ( |
             oo.
            | 
            resend.finishChangingMethod: rr.
            oo: myObjectOutliner.
            (nil != oo) && [nil != oo theSheet] ifTrue: [oo theSheet cellChanged: slot name].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            initialize.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: counterfactualism\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
                  resend.isCounterfactual
            || [ ( nil != annotationInfo ) && [ annotationInfo isCounterfactual ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isSlotOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
            slotsBecomeObjectsWhenDropped ifFalse: [^ self ].

            "Turn into an object outliner when dropped into world"
            w isWorldMorph ifTrue: [ | o |
              o: w outlinerForMirror: slot holder.
              o isInWorld ifFalse: [  w addMorph: o. ].
              w moveToFront: o.
              o globalPosition: globalPosition.
              o showSlot: slot Event: evt.
              delete.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         localHolder = ( |
            | slot contents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: module info\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         makeCreator: evt = ( |
            | 
            protect: [
              slot contents creatorSlot: slot.
              slot initialContents: transporter moduleInfo followSlot.
              slot copyDownInfoIfPresent: [| :cd |
                slot holder copyDowns: slot holder copyDowns copyMappedBy: [|:c|
                  c = cd ifFalse: [c] True: [ cd copyForSlotsToOmit: [|:sto| sto asList addLast: slot name ] ]
                ].
              ] IfAbsent: [].
              update.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         makeCreatorButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: visibility\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         makePrivate: evt = ( |
            | 
            setVisibilityTo: privateSlot Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: visibility\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         makePublic: evt = ( |
            | 
            setVisibilityTo: publicSlot Event: evt.
            " setVis updates which results in new slot outliner "
            myObjectOutliner showSlot: slot Event: process this birthEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: visibility\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         makeUndeclared: evt = ( |
            | 
            setVisibilityTo: undeclaredSlot Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         maybeSetCreatorOfContents = ( |
             contentsAnno.
             contentsOutliner.
             d.
             mirr.
            | 
            "assumes that process this birthEvent is set"
            "If the slot value has no creator, ask the user about setting the creator slot"
             slot isWorthAskingAboutCreator && [slot contents hasCreator not]  ifFalse: [^ self].
            ( sproutWithoutArrow: process this birthEvent ) suggestCreator: 
               slot holder creatorPath extendedBy: slot name.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         method = ( |
            | slot contents "only not present for activations").
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: accessing\x7fComment: an optimization\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         mirror = ( |
            | slot holder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'slotOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newAnnotationMorph = ( |
            | 
            slotModuleMorph copySlotOutliner: self 
                                       Style: preferences).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractSlotOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         privateButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: preferences\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         privateSlotStyle = ( |
            | preferences privateSlotStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeFor: s = ( |
            | 
            (nil != s) && [ s isFake ] 
              ifTrue: [ pseudoSlotOutliner ]
               False: [ self ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         publicButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: preferences\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         publicSlotStyle = ( |
            | preferences publicSlotStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: accessing\x7fComment: Returns the mirror on receiver for buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
             r.
            | 
            (nil != outer ) && [ r: outer receiver.  nil != r]
              ifTrue: [ ^ r ].
            ( nil != slot )  ifTrue: [ ^ slot holder ].
            lobby asMirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole slot\x7fComment: Remove this slot and its outliner.\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         removeLeafFromHolder = ( |
            | 
            myObjectOutliner mirror removeSlotsFromMeAndDescendants: allSlots.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: contents\x7fComment: invoked when user cancels an addslot -- dmu 7/99\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         removeSlot = ( |
            | 
            owner removeMorph: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: contents\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         setContentsTo: newMirr = ( |
            | 
            slot changeCotentsInHolderAndDescendantsTo: newMirr.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: module info\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setModule: evt = ( |
            | 
            outer setModuleOfSlots: (vector copyAddFirst: slot) Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         setModuleButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: visibility\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         setVisibilityTo: vis Event: evt = ( |
            | 
            protect: [
              safelyDo: [
                slot exists ifTrue: [ slot visibility: vis].
                outer update. "put me in right order"
              ].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: slot iterating (for tearing off)\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         slots = ( |
             r.
            | 
            r: list copyRemoveAll.
            r addFirst: slot.
            mergeAssignmentSlots && [slot isAssignable] ifTrue: [
              r addLast: slot correspondingAssignmentSlot.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: preferences\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotsBecomeObjectsWhenDropped = ( |
            | 
            preferences slotsBecomeObjectsWhenDropped).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleStyle = ( |
            | 
            case if: [simpleOutliners]            Then: [    publicSlotStyle]
                 If: [slot visibility isPublic ]  Then: [    publicSlotStyle]
                 If: [slot visibility isPrivate]  Then: [   privateSlotStyle]
                                                  Else: [undeclaredSlotStyle]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: button cache\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         undeclaredButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: preferences\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         undeclaredSlotStyle = ( |
            | preferences undeclaredSlotStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: whole slot\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingBody: rr = ( |
             mirr.
             newSO.
             ow.
             p.
             str.
            | 
            mirr: reflect: rr result.

            "Validate the resulting object"   

            mirr size > 2  ifTrue: [
              ^ rr event sourceHand attach: 
                syntaxErrorMorph copyMessage: 'Text evaluates to several slots'.
            ].
            (mirr size = 2) && [mirr first isMethod] ifTrue: [
              ^ rr event sourceHand attach: 
                syntaxErrorMorph copyMessage: 'Cannot create an assignable method'.
            ].
            "No slot in result"
            mirr size = 0 ifTrue: [^ removeSlot ].

            str: editor contentsString.

            ow: world.

            isForEditingNew  ifFalse: [ 
              changeSlotInObjectTo: mirr  IfFail: [ ^ self ].
              newSO: self.
            ] True: [ | categorizedSlots |
              "The slotOutliner has been created for adding a slot"
              categorizedSlots: 
                mirr asVector copyMappedBy: 
                  [|:s| s copyHolderForCategories: outer categoryList].
              (myObjectOutliner addSlots: categorizedSlots 
                         ToObjectOldName: '' 
                                SafelyDo:  [|:wasAdded| 
                                   wasAdded  ifTrue: [
                                     slot: myObjectOutliner mirror at: mirr first name.
                                     initialize. 
                                     outer update]]
              ) 
                ifFalse: [ ^ self ].
              newSO: myObjectOutliner showSlot: (myObjectOutliner mirror at: mirr first name)
                                         Event: process this birthEvent.
            ].
            newSO slot maybeSetInitialContentsFromEditString: str.
            newSO safelyDo: [newSO updateAnnotationInfo].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: editing\x7fCategory: name\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingName: rr = ( |
             n.
             new.
             newContents.
             newSlot.
            | 

            newSlot: (reflect: rr result) first.
            n: newSlot name.

            newContents: slot contents copyAdoptingArgumentSlotsFrom: newSlot contents.

            "put adjusted method into new slot"
             newSlot: newSlot copyHolderForContents: newContents IfFail: [|:err|
               userQuery report: 'setting contents failed ', err.
               ^ self.
            ].

            changeSlotInObjectTo: (vector copyAddFirst: newSlot) IfFail: [^ false].

            safelyDo: [
              titleEditor slot: slot.
              titleEditor editMode: false.
              myObjectOutliner update.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         updateAnnotationInfo = ( |
            | 
            nil = annotationInfo
             ifFalse: [
              annotationInfo update.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            "slots are not invalidated if slot changes"
            isForEditingNew not  && [slot exists]  ifTrue: [
                  slot isFake
              || [slot isMethod = slot value isReflecteeMethod] ifFalse: [
                slot: slot holder at: slot name.
              ].
            ].
            resend.updateDo: blk.

            isForEditingNew  ifTrue: [^ self].

            updateComment.
            updateButtonIcon.
            updateMethodEditor.
            updateAnnotationInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMethodEditor = ( |
            | 
            isExpanded ifFalse: [^ self]. 
            nil = methodEditor ifTrue: [^ self].
            methodEditor isCounterfactual ifTrue: [^ self].
            case 
              if: [cachedIsMethod  &&  [slot isMethod]]
              Then: [
                (cachedMethodString = methodString)   ifTrue: [^ self].
            ] If: [cachedIsMethod not  && [ slot isMethod not]]
              Then: [ ^ self].

            cachedIsMethod  ifTrue: [removeItem: methodEditor].
            constructItems.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            m isOutliner && [m isSlotOutliner || [m isCategoryOutliner]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoSlotOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'pseudoSlotOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'moduleInfo' From:
             bootstrap remove: 'moduleInfo:' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals slotOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pseudoSlotOutliner' -> () From: ( |
             {} = 'Comment: Outliner for pseudo slots.\x7fModuleInfo: Creator: globals pseudoSlotOutliner.

CopyDowns:
globals slotOutliner. copyRemoveAllMorphs 
SlotsToOmit: moduleInfo moduleInfo: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Obsolete Object Outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         pseudoSlotOutliner = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pseudoSlotOutliner.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pseudoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pseudoSlotOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | pseudoSlotOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: buliding the menu\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsTo: menu = ( |
            | 
            menu addButton: addSlotButton.
            menu addButton: addCategoryButton.
            menu addButton: createSubclassButton.

            menu addDivider.

            addCommentButtonsTo: menu.
            addAnnotationInfoButtonsTo: menu.

            menu addButton: setModuleButton.

            menu addDivider.

            mirror copyDowns isEmpty ifFalse: [ menu addButton: copyDownParentButton ].
            menu addButton: copiedDownChildrenButton.
            mirror isComplete ifFalse: [ menu addButton: traitsFamilyButton ].
            menu addButton: childrenButton.
            menu addButton: referencesButton.
            menu addButton: findSlotButton.

            menu addDivider.

            menu addButton: expandAllButton.
            menu addButton: collapseAllButton.

            menu addDivider.

            "menu addButton: structureEditorButton. temporarily disabled, OLM 2/21/95"
            menu addButton: evaluatorButton.

            ((mirror isOKToSend: 'isMorph')  &&
             [(mirror reflectee isMorph)     &&
             [(mirror reflectee isWorldMorph not)]])
              ifTrue: [ menu addButton: showMorphButton ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: evaluator\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addEvaluator = ( |
             b1.
             b2.
             b3.
             ed.
             f.
             r.
             result.
            | 

            b1: newEvaluatorButtonLabel: 'Get it'
                                 Script: 'target get_it_cmd: event'
                         IsAsynchronous: true.
            b2: newEvaluatorButtonLabel: 'Do it'
                                 Script: 'target  do_it_cmd: event'
                         IsAsynchronous: true.
            b3: newEvaluatorButtonLabel: 'Close'
                                 Script: 'target delete'
                         IsAsynchronous: false.

            r: newEvaluatorButtonRow: (b1 & b2 & b3 ) asVector.

            ed: uglyTextEditorMorph copyString: '' Style: preferences.
            ed receiver: receiver.
            nil != process this hand ifTrue: [
              ed beTypingFocusFor: process this hand.
            ].
            ed frameStyle: flatStyle.
            b1 target: ed text.
            b2 target: ed text.
            ed borderWidth: 0.

            f: frameMorph copy.
            f addMorphFirst: ed.
            f addMorphLast:  r.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 2.
            f beShrinkWrapHorizontally.

            result: f.

            result colorAll: color.
            columnUnderHeader addMorphLast: result.
            b3 target: result.

            evaluators add: ed.

            ed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: evaluator\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addEvaluatorForHand: h = ( |
            | 
            addEvaluator beTypingFocusFor: h.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: changing the object\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlots: bunchOSlots ToObjectOldName: oldName SafelyDo: updateBlock = ( |
             batchAdds.
             batchRms.
             needToShowMorph <- bootstrap stub -> 'globals' -> 'false' -> ().
             slotPairs.
            | 
            mirror addOrChange: bunchOSlots FormerlyKnownAs: oldName IfAnyFail: [needToShowMorph: true].

            safelyDo: [ updateBlock value: needToShowMorph not ].

            "show new slots"
            slotPairs: bunchOSlots asList copyFilteredBy: [|:s| s isAssignment not].
            slotPairs do: [|:s. so. | 
              so: showSlot:  (mirror at: s name) 
                     Event:  process this birthEvent.

              so safelyDo: [so update].

              " of course, if called for slot editing would have been nice to set init contents first"
              " may obviate creator setting "
              [ "comment out for now, maybe better to omit for novices" so maybeSetCreatorOfContents].
            ].
            needToShowMorph not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationInfoMixin* = bootstrap stub -> 'mixins' -> 'ui2' -> 'annotationInfo' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildBody = ( |
            | 
            resend.buildBody.
            buildModuleSummary.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            header: outlinerHeader copyTarget: self 
                                        Style: preferences.
            buildExpander.
            buildTitle.
            buildCommentButton.

            simpleOutliners 
              ifTrue: [  buildSimpleHeader ]
               False: [  buildNormalHeader ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildModuleSummary = ( |
            | 
            moduleSummary:
                  labelMorph copyLabel: mirror moduleSummaryString
                              FontSpec: (mediumFontSpec copyName: 'palatino')
                                 Color: color.
            moduleSummary colorAll: color.
            simpleOutliners ifFalse: [
              items addMorphLast: moduleSummary.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildNormalHeader = ( |
             l.
            | 
            l: list copyRemoveAll.
            l add: expander.
            l add: titleEditor.
            l add: commentButton.
            header addAllMorphs: l.
            addButtonsToHeader.
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSimpleHeader = ( |
            | 
            header baseMinHeight: 0.

            (mirror isReflecteeInteger )  || 
            [mirror isReflecteeMethod]    ||
            [mirror isReflecteeFloat]     || 
            [mirror isReflecteeString]    ||
            [mirror = reflect: nil ]      ||
            [mirror = reflect: true ]     ||
            [mirror = reflect: false ] 
              ifTrue: [
                header addMorph: titleEditor
            ].
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: changing the object\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         changeCategoriesOfSlotInObject: s To: cats = ( |
            | 
            s isCopiedDown ifTrue: [
              mirror copyDowns: vector copyAddFirst:
                mirror copyDowns first copyForSlotsToOmit: [|:sto| sto copyAddLast: s name].
            ].
            s categories: cats.
            (transporter moduleDictionary copiesOfSlot: s) do:
             [|:s. | s categories: cats ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         children: evt = ( |
            | 
            evt sourceHand attach: (
              childrenMorph copyMirror: mirror Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         childrenButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAll: evt = ( |
            | 
            collapseEmptyEvaluators: evt.
            resend.collapseAll: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         collapseAllButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: evaluator\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseEmptyEvaluators: evt = ( |
            | 
            evaluators do: [
            |:e |
              (e isOwnedBy: self)
                ifFalse: [evaluators remove: e]
                True: [
                  e contentsString isEmpty  ifFalse: [
                    e resizeToMinimum.
                  ] True: [
                    e owner "the frame" delete. 
                    evaluators remove: e.
                ].
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentButtonAndEditor* = bootstrap stub -> 'mixins' -> 'ui2' -> 'commentButtonAndEditor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         copiedDownChildren: evt = ( |
            | 
            evt sourceHand attach: (
              copyDownChildrenMorph copyMirror: mirror Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         copiedDownChildrenButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         copyDownParentButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownParents: evt = ( |
            | 
            mirror copyDowns do: [|:cd. o|
              o: world outlinerForMirror: cd parentMirror.
              expandWhenSprouted ifTrue: [ o expand: evt ].
              evt sourceHand attach: o.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMirror: mirr World: w = ( |
             new.
            | 

            w reifiedObjects if: mirr IsPresentDo: [|:v| 
              "repair reified objects if outliner was dragged to another world"
              v isInWorld  && [v world = w]
                ifFalse: [ w reifiedObjects removeKey: mirr ]
                   True: [^v].
            ].
            new: (mirr isOKToSend: 'asOutliner') 
              ifFalse: [ copyMirror: mirr ] 
                 True: [mirr reflectee asOutliner].

                 new isOutliner
            && [ mirr isComplete 
            && ((mirr isReflecteeInteger) || (mirr isReflecteeFloat) || (noEvaluatorMirrs includes: mirr)) not]
              ifTrue: [
                "new expand. (no event)" "new addEvaluator"
            ].
            simpleOutliners ifTrue: [new toggleExpandState].
            w reifiedObjects at: mirr Put: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: buliding the menu\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         createCachedButtons = ( |
             b.
            | 
            ((nil != childrenButton) &&
             [styleMatchesProtoButton: childrenButton]) ifTrue: [ ^self ].

                            parent.createCachedButtons.
               annotationInfoMixin.createCachedButtons.
            commentButtonAndEditor.createCachedButtons.

            b: buttonPrototype.

                      findSlotButton:  (b copy  scriptBlock: [target findSlot:            event]) label: 'Find slot...'.
                    referencesButton:  (b copy  scriptBlock: [target references:          event]) label: 'References'.
                  traitsFamilyButton: ((b copy  scriptBlock: [target showTraitsFamily:    event]) label: 'Show Traits Family') isAsynchronous: true.
                      childrenButton:  (b copy  scriptBlock: [target children:            event]) label: 'Children'.
            copiedDownChildrenButton:  (b copy  scriptBlock: [target copiedDownChildren:  event]) label: 'Copied-Down Children'.
                copyDownParentButton:  (b copy  scriptBlock: [target copyDownParents:     event]) label: 'Copy-Down Parent(s)'.
                     showMorphButton:  (b copy  scriptBlock: [target showMorph:           event]) label: 'Show Morph'.
                     evaluatorButton:  (b copy  scriptBlock: [target addEvaluatorForHand: event sourceHand]) label: 'Evaluator'.
                   collapseAllButton:  (b copy  scriptBlock: [target collapseAll:         event]) label: 'Collapse All'.
                     expandAllButton:  (b copy  scriptBlock: [target expandAll:           event]) label: 'Expand All'.
               structureEditorButton:  (b copy  scriptBlock: [target structureEditor:     event]) label: 'Structure Editor'.
                createSubclassButton: ((b copy  scriptBlock: [target createSubclass:      event]) label: '``Subclass\'\' Me') isAsynchronous: true.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fComment: make a copy-down child of this object,
Make a new, empty parent of my parent that
inherits from my parents.
Set the creator of my parent slot.\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         createSubclass: evt = ( |
            | 
            evt sourceHand attach: 
              evt sourceHand world outlinerForMirror:  mirror createSubclass.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         createSubclassButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: buliding the menu\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: structure\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteAndCheckForChanges = ( |
            | 
            isCounterfactual ifTrue: [
              warnCounterfactualIfAbort: [^ self].
            ].
            delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         evaluatorButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         expandAllButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         findSlot: evt = ( |
             m.
            | 
            m: enumerationMorphFactory
                     findSlot: 'foo*'
                 StartingFrom: mirror
                        Event: evt.
            evt sourceHand attach: m.
            m selectAll.
            m beTypingFocusFor: evt sourceHand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         findSlotButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         headerButtonContents = ( |
            | 
            (
            ('/\\' @ 'target parents: event') &
            ('E' @ 'target addEvaluator') &
            dismissButtonContents
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            evaluators: evaluators copyRemoveAll.
            resend.initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            borderWidth: 3.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: counterfactualism\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
            (  (nil != annotationInfo)
             && [ annotationInfo isCounterfactual ]
            ) || [ isCommentCounterfactual
              || [ resend.isCounterfactual ] ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
            w isWorldMorph ifTrue: [beShrinkWrap]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: modules\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         moduleNames = ( |
            | mirror moduleNames).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'objectOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newAnnotationMorph = ( |
            | 
            objectAnnotationMorph copyObjectOutliner: self
                                               Style: annotationInfoStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: evaluator\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newEvaluatorButtonLabel: l Script: s IsAsynchronous: isA = ( |
             b.
            | 
            b: ui2Button copy.
            b script: s.
            b isAsynchronous: isA.
            b label: l  FontSpec:   smallFontSpec
                        FontColor:  fontColor.
            b beFlexibleHorizontally.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: evaluator\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newEvaluatorButtonRow: buts = ( |
             r.
            | 
            r: rowMorph    copy.
            r borderWidth: 0.
            buts reverseDo: [|:b| r addMorph: b].
            r moveToFront: buts first.
            r beShrinkWrapVertically.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (((reflect: nil) & (reflect: true) & (reflect: false)) asVector)'
        
         noEvaluatorMirrs <- ((reflect: nil) & (reflect: true) & (reflect: false)) asVector.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: accessing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outer = bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'abstractObjectOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parents: evt = ( |
            | 
            mirror do: [|:s|
              s isParent ifTrue: [
                evt sourceHand attach:  
                  evt sourceHand world  outlinerForMirror: s contents.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         preferences = bootstrap stub -> 'globals' -> 'objectOutlinerPreferences' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: support for evaluating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver = ( |
            | 
            mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         references: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory 
                referencesOf: mirror
                StartingFrom: mirror
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         referencesButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fComment: override me for high-level outliners\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showLowLevel: bool = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showMorph: evt = ( |
             m.
            | 
            m: mirror reflectee.
            m isMorph && [mirror isComplete] ifTrue: [
              evt sourceHand attach: mirror reflectee.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         showMorphButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: unfold\x7fComment: open up categories in order to show slot named name\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showSlot: slot Event: evt IfFail: failBlock = ( |
            | 
            showSlotOnce: slot Event: evt IfFail: [
              safelyDo: [ showLowLevel: true.  update]. "ensure slot is there!"
              showSlotOnce: slot Event: evt IfFail: failBlock
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: unfold\x7fComment: open up categories in order to show slot named name\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showSlotOnce: slot Event: evt IfFail: failBlock = ( |
             cats.
             current.
             mergedSlot.
            | 
            "if fails, try updating and sending again!"

            slot exists ifFalse: [ ^ failBlock value: slot name, ' does not exist'].

            mergedSlot:  outlinerPreferences mergeAssignmentSlots && [slot isAssignment]
                           ifTrue: [slot correspondingDataSlot]
                            False: [slot].
            cats: mergedSlot categories.
            expand: evt.
            current: self.
            cats do: [|:c|
              current: current categoryOutlinerNamed: c 
                                 IfFail: [ ^ failBlock value: c, ' not found'].
              current expand: evt.
            ].
            current slotOutlinerFor: mergedSlot IfFail: [failBlock value: slot name, ' not found']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showTraitsFamily: evt = ( |
            | 
            evt sourceHand attach:
                (textViewerMorph
                    copyTitle: ('Traits family for ', mirror name)
                         Text: ((traitsHierarchyStringForReflectee: mirror Indent: 0) flatString)) open.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         statePrintString = ( |
            | 
            resend.statePrintString,
            ' on ',
            titleString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: structure editing\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         structureEditor: evt = ( |
             theAST.
            | 
            '\n...>>> building AST ...' printLine.
            theAST: mirror makeAST.
            theAST createStructureEditor: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         structureEditorButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: annotation info\x7fComment: Suggest a creator path.
-- Ungar, 2/8/95\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         suggestCreator: aPath = ( |
            | 
            addAnnotationInfo.
            annotationInfo suggestCreator: aPath.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: cached buttons\x7fModuleInfo: Module: obsObjOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         traitsFamilyButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: menu operations\x7fCategory: my menu & button operations\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         traitsHierarchyStringForReflectee: mirr Indent: indent = ( |
             s.
            | 
            s: ('' & '').  "s is a string collector"
            mirr isComplete ifTrue: [ ^s ].
            indent do: [ s: s & ' ' ].
            s: (s & mirr name & '\n').
            (browse childrenOf: (mirr reflectee)) do: [| :childMirr |
                s: s & (traitsHierarchyStringForReflectee: childMirr Indent: indent + 4).
            ].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: unfold\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         unfold: slot Event: evt IfFail: failBlock = ( |
            | 
            (showSlot: slot Event: evt IfFail: [|:e| ^ failBlock value: e])
               expand: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         updateDo: blk = ( |
            | 
            simpleOutliners ifFalse: [
              updateAnnotationInfo.
              updateComment.
              updateItemsDo: blk.
              updateEvaluators.
            ].
            resend.updateDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         updateEvaluators = ( |
            | 
            "remove deleted evaluators"
            evaluators copy do: [|:e|
              (e isOwnedBy: self) ifFalse: [evaluators remove: e].
            ]. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         updateItemsDo: blk = ( |
            | 
            (nil != items) && isExpanded ifTrue: [
              updateModuleSummary.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'objectOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         updateModuleSummary = ( |
             s.
            | 
            s: mirror moduleSummaryString.
            moduleSummary label = s
             ifFalse: [
              moduleSummary label: s.
              moduleSummary colorAll: color.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonsTo: menu = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            title: labelMorph copyLabel: titleString
                               FontSpec: ( mediumFontSpec copyName: 'times' Style: 'italic' )
                                  Color: (paint named: 'blue') copyDarkerBy: 0.3.
            title).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCategoryOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isPlaceHolder = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isPlaceHolder: x = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isPseudoCategoryOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'pseudoCategoryOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'categoryOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         pseudoSlotOutlinersDo: blk = ( |
            | 
            (nil != items) && isExpanded ifTrue: [
              items morphsDo: [|:o|
                o isOutliner && [o isPseudoSlotOutliner] ifTrue:[ blk value: o]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         unfilteredSlots = ( |
            | fakeSlots).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoCategoryOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addButtonsTo: menu = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            labelMorph copyLabel: titleString
                        FontSpec: (fontSpec copyName: 'times' )
                           Color: (paint named: 'blue') copyDarkerBy: 0.3).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         edit = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            borderWidth: 0.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isPseudoSlotOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'Category: type\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot'
        
         morphTypeName = 'pseudoSlotOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'slotOutliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         prototypeFor: s = ( |
            | 
            (nil != s) && [ s isFake ] 
              ifTrue: [ self ]
               False: [ slotOutliner ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'ModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            slot key).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pseudoSlotOutliner' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: obsObjOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            resend.updateDo: blk.
            updateContentsString).
        } | ) 



 '-- Side effects'

 globals modules obsObjOutliner postFileIn
