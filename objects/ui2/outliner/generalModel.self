 '$Revision: 30.19 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         generalModel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: caching buttons & other menu state\x7fComment: not copied by copy;
share dictionary over same kind of models\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (dictionary copyRemoveAll)\x7fVisibility: private'
        
         buttonCache <- dictionary copyRemoveAll.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: caching buttons & other menu state\x7fComment: want a slot common to of same kind, so use indirection
and special copy-down method\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         defaultButtonHolderHolder = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'defaultButtonHolderHolder' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel defaultButtonHolderHolder.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'defaultButtonHolderHolder' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         copy = ( |
            | resend.copy defaultButtonHolder: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'defaultButtonHolderHolder' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)'
        
         defaultButtonHolder.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'defaultButtonHolderHolder' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: styles\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myAnnotationInfoStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: styles\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myCommentButtonStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: styles\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myCommentStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: styles\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myContentsEditorStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: styles\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myEditWholeThingStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myOutliner.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fCategory: styles\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myTitleStyle.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractUpdater = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent abstractUpdater.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)'
        
         cachedThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)'
        
         outlinerToUpdate.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent abstractUpdater parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         addOutliner: o = ( |
            | 
            outlinerToUpdate addItem: o.
            o model setAppearanceOfOutliner.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         addOutlinerForThing: t = ( |
             o.
            | 
            o: (modelPrototypeForThing: t) newOutlinerFor: t.
            o colorAll: outlinerToUpdate color.
            addOutliner: o.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         exists: t = ( |
            | true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         modelPrototype = ( |
            | 
            generalLeafModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         modelPrototypeForThing: t = ( |
            | modelPrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         orderThings: t = ( |
            | t asVector copySort).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         orderedThings = ( |
            | 
            orderThings: things).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         removeOutliner: o = ( |
            | 
            outlinerToUpdate removeItem: o.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         thingForOutliner: o = ( |
            | 
            o isForEditingNew  ifTrue: nil  False: [ o model referrent ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         things = ( |
            | 
            cachedThings ifNil: [
              cachedThings: outlinerToUpdate model shownSlotsInMe.
            ].
            cachedThings).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: doing the update\x7fComment: I sync things with outliners, preserving order

I use:
  oldOutliners returns a list of old outliners, 
  things returns a list of slots or categories,

  thingForOutliner: run on an outliner gives its thing,
  createOutlinerForThing: given a thing returns a new outliner on the thing,
  addOutliner: given the new outliner adds it to me,
  removeOutliner: given an outliner, removes it

-- Ungar, 2/13/95\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: updateBlk = ( |
            | 
            updateBlock: updateBlk.
            remainingThings:   orderedThings copy asList.
            remainingOutliners: oldOutliners copy asList.
            [      remainingOutliners isEmpty
             ||  [ remainingThings    isEmpty ]  ]
             whileFalse: [ |  o1. ot. |
              o1: remainingOutliners first.
              ot: thingForOutliner: o1.
              ot 
               ifNil:    [ updateExtraOutliner ]
               IfNotNil: [
                   remainingThings first  compare: ot
                     IfLess:   [ updateMissingOutliner ]
                      Equal:   [ updateMatchingOutliner]
                      Greater: [ updateExtraOutliner ].
              ].
            ].

            [ remainingOutliners isEmpty ]  whileFalse: [ updateExtraOutliner   ].
            [ remainingThings    isEmpty ]  whileFalse: [ updateMissingOutliner ].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: doing the update\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateExtraOutliner = ( |
             o1.
            | 
            o1: remainingOutliners removeFirst.
            o1 isCounterfactual
             ifFalse: [ removeOutliner: o1 "editing, do not remove" ]
             True: [
              updateBlock value: o1.
              "remove its thing so we don't add a 2nd outliner for it later"
              remainingThings remove: (thingForOutliner: o1)
                            IfAbsent: [].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: doing the update\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMatchingOutliner = ( |
            | 
            updateBlock value: remainingOutliners removeFirst.
            remainingThings removeFirst.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> 'parent' -> () From: ( | {
         'Category: doing the update\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateMissingOutliner = ( |
             newO.
             t.
            | 
            "Have a thing, but no outliner."

            "Maybe the outliner is later, but counterfactual,
             if so, just skip over this thing."
            t: remainingThings removeFirst.
            remainingOutliners 
                    findFirst: [|:o |  o isCounterfactual  && [ (thingForOutliner: o) = t ]]
                    IfPresent: [|:o |  ^ self].

            "Need a new outliner for this thing.
             First add it in at end, then move the remaining outliners after it."

            newO: addOutlinerForThing: t.
            updateBlock value: newO. "schedule update"

            remainingOutliners do: [|:o| removeOutliner: o ].
            remainingOutliners do: [|:o| addOutliner: o].

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)'
        
         remainingOutliners.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)'
        
         remainingThings.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'abstractUpdater' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         updateBlock.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         acceptButtonStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'acceptButtonStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent acceptButtonStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'acceptButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         color <- paint copyRed: 0.518084 Green: 0.699902  Blue: 0.518084.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'acceptButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptChangingNameTo: newName Editor: ed Event: evt = ( |
             r.
            | 
            r: newResultReporterForChangingNameInEditor: ed Event: evt.
            r howToReport: 'unprotectedFinishChangingName:'.
            [unprotectedFinishChangingName: self]. "browsing"
            r succeededReturning: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptContents: str Editor: ed Event: evt = ( |
             r.
            | 
            r: newResultReporterForEditingContentsIn: ed Event: evt.
            r succeededReturning: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptEditWholeThing: str Editor: ed Event: evt = ( |
            | 
            (newResultReporterForEditingWholeThingIn: ed Event: evt)
              succeededReturning: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptNameChange = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'acceptNameChange' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent acceptNameChange.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'acceptNameChange' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target acceptChangingNameTo: source contentsString
                                 Editor: source
                                  Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fCategory: adding buttons to header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addButtonToHeader: b = ( |
            | 
            findButtonInHeader: b
            IfPresent: []
            IfAbsent: [
              safelyDo: [
                addSpacerToKeepButtonOnRight.
                myOutliner header addMorphLast:
                  b colorAll: myOutliner color
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         addDismissButtonToHeader = ( |
            | 
            addButtonToHeader: buildDismissButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping (receiving a droppee)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingCategory: c = ( |
            | 
            addDroppingSlots: (
              c model slotsInMeAndSubcategories copyMappedBy: [|:s|
                recategorizeDroppedSlot: s
            ]) From: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping (receiving a droppee)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingSlot: so = ( |
            | 
            addDroppingSlots: (
              so model slotsInMeAndSubcategories copyMappedBy: [|:s|
                s copyHolderForCategories: categoryList
            ]) From: so).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping (receiving a droppee)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         addDroppingSlots: slots From: aSlotsOutliner = ( |
             s.
            | 
            s: (shouldResetModuleOfDroppingSlots: slots) 
                ifFalse: [slots]
                   True: [slots copyMappedBy: [|:s| s copyHolderForModule: '']].

             mirror     addOrChange: s
                    FormerlyKnownAs: ''
                          IfAnyFail: [process this birthEvent sourceHand attach: aSlotsOutliner].
            "if dropping onto slot, need to update enclosing outliner"
            safelyDo: [
             (myOutliner enclosingOutlinerIfPresent: [|:eo| eo] IfAbsent: [myOutliner]) 
                update.
              mySelfObjectModel myOutliner
                showSlot: (mirror at: slots first name IfFail: [])
                   Event: process this birthEvent
                  IfFail: [].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fCategory: adding buttons to header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         addSpacerToKeepButtonOnRight = ( |
            | 
            needSpacerToKeepButtonOnRight ifFalse: [^ self].
            myOutliner header addMorphLast:
              spacerMorph copy beFlexible color: myOutliner color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: events\x7fComment: My outliner sends me this so
I can intercept events before
they go to my outliner\'s morphs.
 -- dmu & ma 3/02\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationInfoFontColor = ( |
            | 
            myOutliner color textColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationInfoFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalModel parent annotationInfoFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         annotationInfoStyle = ( |
            | 
            myAnnotationInfoStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         areMorphsRemovedWhenEditingWholeThing = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         beForOutliner: o = ( |
            | 
            myOutliner: o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildDismissButton = ( |
            | 
            ((ui2Button copy
                  label: dismissButtonContents x
               FontSpec: headerButtonFontSpec
              FontColor: ui2Button defaultFontColor)
                 script: dismissButtonContents y)
                 target: myOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fComment: The expander is the button you press
to expand/collapse the outliner.
Usually a triangle.
Overridden to provide different appearance:
method button for slot outliner, buttons for
index outliner. 
Index outliner should probably use something else.\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildExpander = ( |
            | 
            myOutliner expander:
              expanderMorph copyTarget: self Action: expanderAction.
            myOutliner expander color:
              preferredTitleColor.
            myOutliner expander).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fComment: use an editor so we can
update the object\'s title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
             titleEditor.
            | 
            titleEditor: 
              smallEditorMorph 
                copyString: titleString
                    Target: myOutliner
                    Accept: acceptNameChange
                    Cancel: cancelNameChange
                     Style: titleStyle
                LabelColor: preferredTitleColor.
            titleEditor isAsynchronous: true.
            myOutliner titleEditor: titleEditor.
            titleEditor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         buildWholeThingEditorMorphWithContents: str = ( |
             ed.
            | 
            ed: uglyTextEditorMorph copyString: str
                                        Target: myOutliner 
                                        Accept: editWholeThingAccept
                                        Cancel: editWholeThingCancel
                                         Style: editWholeThingStyle.
            ed panel acceptButton isAsynchronous: true.
            ed receiver: receiver.
            ed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonCacheFillTime = ( |
            | 
            buttonCache
             if: fillTimeKey
             IsPresentDo: [|:t| t]
             IfAbsentPut: 0
             AndDo: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonCacheFillTime: t = ( |
            | buttonCache at: fillTimeKey Put: t. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonDescriptions = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.\x7fModuleInfo: Creator: globals generalModel parent buttonDescriptions.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: Collapse All\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         collapseAll = ( |
            | 
            target model collapseAll: event.
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: Edit\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         edit = ( |
            | 
            target editWholeThing: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: expanding and collapsing\x7fCategory: Expand All\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         expandAll = ( |
            | 
            target model expandAll: event.
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: showing and hiding\x7fCategory: Hide Annotation\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         hideAnnotation = ( |
            | 
            target removeAnnotationInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: showing and hiding\x7fCategory: Hide Comment\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         hideComment = ( |
            | 
            target toggleComment: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: showing and hiding\x7fCategory: Show Annotation\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         showAnnotation = ( |
            | 
            target addAnnotationInfo: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: showing and hiding\x7fCategory: Show Comment\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         showComment = ( |
            | 
            target toggleComment: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: tearing off\x7fCategory: Move\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOff = ( |
            | 
            target tearOff: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: tearing off\x7fCategory: Copy\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOffCopy = ( |
            | 
            target tearOffCopy: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: power operations\x7fCategory: Do ``userDefinedOperation\'\' to all\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         userDefined = ( |
            | 
            target model doOperation: userDefinedOperation ToAllForEvent: event.
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: yanking\x7fCategory: Yank out outliner\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         yank = ( |
            | target yankOutliner: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonPrototype = ( |
            | 
            ui2Button copy label: '' FontSpec: menuButtonFontSpec FontColor: paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
            | 
            ('yank' & expandOrCollapseAll) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         cancelButtonStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'cancelButtonStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent cancelButtonStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'cancelButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         color <- paint copyRed: 0.699902 Green: 0.40958  Blue: 0.518084.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'cancelButtonStyle' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelNameChange = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'cancelNameChange' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent cancelNameChange.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'cancelNameChange' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancelChangingNameEditor: source Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fCategory: title (override these)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         changeTitleTo: t Event: e = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
             myOutliner collapse: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseAll: evt = ( |
            | 
             myOutliner collapseAll: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: top & bottom feeders\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseBottomMorphs: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: top & bottom feeders\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseTopMorphs: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: override me\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         comment = 'none here'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: override me\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         comment: c = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment button\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         commentButtonFontColor = ( |
            | myOutliner color textColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment button\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         commentButtonFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 8 Style: 'bold') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalModel parent commentButtonFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment button\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         commentButtonStyle = ( |
            | myCommentButtonStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: override me\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         commentButtonText = '`...\''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment editor\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         commentFontColor = ( |
            | 
            myOutliner color textColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment editor\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         commentFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalModel parent commentFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment editor\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         commentStyle = ( |
            | myCommentStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         constructItems = ( |
            | 
            myOutliner addItem: generalLeafModel newOutliner.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsEditorStyle = ( |
            | 
            myContentsEditorStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             r.
            | 
            r: resend.copy.
            r          myTitleStyle:          titleStyleProto copyModel: r.
            r myAnnotationInfoStyle: annotationInfoStyleProto copyModel: r.
            r        myCommentStyle:        commentStyleProto copyModel: r.
            r  myCommentButtonStyle:  commentButtonStyleProto copyModel: r.
            r myEditWholeThingStyle: editWholeThingStyleProto copyModel: r.
            r myContentsEditorStyle: contentsEditorStyleProto copyModel: r.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         copyForReferrent: r = ( |
            | 
            (copy referrent: r) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForSpecialization = ( |
             m.
             r.
            | 
            r: copy.
            m: r asMirror.
            (m at: 'buttonCache') contents: buttonCache copyRemoveAll asMirror.
            (m at: 'defaultButtonHolderHolder') contents:
               defaultButtonHolderHolder copy asMirror.
            m comment: 'See copyForSpecialization to understand what has been done to this object'.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fComment: Applies block to my immediately nested outliners.
Will not cause me to expand. -- dmu 11/04\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         currentlyExpandedOutlinersDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: default button\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultButtonHolder = ( |
            | defaultButtonHolderHolder defaultButtonHolder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: default button\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultButtonHolder: dbh = ( |
            | 
            defaultButtonHolderHolder defaultButtonHolder: dbh).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         dismissButtonContents = ('X')@('target animatedDelete').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: power operations\x7fComment: Applies the specified block to the contents.
Child should supply a suitable definition.\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         doOperation: aUserDefinedOperation ToAllForEvent: event = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         editNewWholeThingString = ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         editWholeThingAccept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingAccept' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent editWholeThingAccept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingAccept' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target acceptEditWholeThing: source contentsString
                                 Editor: source
                                  Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         editWholeThingCancel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingCancel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent editWholeThingCancel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingCancel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancelEditingWholeThingEditor: source Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fCategory: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         editWholeThingFontColor = ( |
            | 
            myOutliner color textColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fCategory: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         editWholeThingFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: '6x13' Size: 11 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalModel parent editWholeThingFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         editWholeThingString = ( |
            | 
            isForEditingNew ifTrue: [ editNewWholeThingString   ]
                             False: [ slot evalStringAssignable ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fCategory: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         editWholeThingStyle = ( |
            | 
            myEditWholeThingStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         ensureButtonCacheIsFull = ( |
            | 
            isButtonCacheObsolete ifFalse: [^ self].
            buttonCache removeAll.
            fillButtonCache.
            makeButtonCacheCurrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            myOutliner isExpanded ifTrue: [^self]. "Jeff 4/03, short-circuit optimization"
            myOutliner expand: evt.
            myOutliner update. "ensure the subitems are right font, etc"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAll: evt = ( |
            | 
             myOutliner expandAll: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         expandOrCollapseAll = ( |
            | 
            myOutliner isExpanded ifTrue: 'collapseAll' False: 'expandAll').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fComment: Applies block to my immediately nested outliners.
May cause me to expand. -- dmu & jb 5/03\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         expandedAndCollapsedOutlinersDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fComment: Holds method that reacts
to expander button.
Overriden (rarely) to come between pressing 
and calling \"expand:\"\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         expanderAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'expanderAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent expanderAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'expanderAction' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
             e.
             eAll.
             o.
            | 
            e: source isExpanded.
            o: target myOutliner.
            eAll: evt leftDoubleClick.

            e  &&  [ o isInWorld ]  ifTrue: [ o world moveToFront: o ].

            eAll ifTrue: [
            ^ e  ifTrue: [ target expandAll: evt ]
                  False: [ target expand: evt. "gak! must expand to collapse"
                           target collapseAll: evt ].
            ].

            e ifTrue:[ target expand:    evt]
               False:[ target collapse:  evt].
            target).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fComment: Use reflection to have button sources accessible to senders.\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         fillButtonCache = ( |
             b.
            | 
            b: buttonPrototype.
            buttonCache removeAll.
            (reflect: buttonDescriptions) do: [|:s|
              s contents isReflecteeMethod ifTrue: [|cats|
                cats: s categories.
                buttonCache at: s name Put:
                 (( b copy
                    label: cats isEmpty ifTrue: [s name] False: [cats last] )
                    script: s contents source )
                    isAsynchronous: s visibility isPublic
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         fillInMenuAsAppropriate: aMenu = ( |
            | 
            buttonsToPutInMenu do: [|:n|
              n  ifNotNil: [ aMenu addButton: buttonCache at: n ]
                    IfNil: [ aMenu addDivider ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         fillTimeKey = 'fill time'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fCategory: adding buttons to header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         findButtonInHeader: b IfPresent: pb IfAbsent: ab = ( |
            | 
            myOutliner header morphsDo: [|:m|
              (m morphTypeName = 'ui2Button') && [m script = b script]
               ifTrue: [^ pb value: m].
            ].
            ab value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping (receiving a droppee)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         finishAddingDroppingMorph: m = ( |
             mod.
            | 
            m isPluggableOutliner ifFalse: [^ self].
            mod: m model.
            protect: [
              case if: [mod isSlotModel    ]  Then: [addDroppingSlot:     m ]
                   If: [mod isCategoryModel]  Then: [addDroppingCategory: m ]
            ].
            mod willInsertMyselfWhenDropped: false. "did insertion"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingContents: rr = ( |
            | 
            protect: [ unprotectedFinishChangingContents: rr ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingName: rr = ( |
            | 
            protect: [ unprotectedFinishChangingName: rr ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         finishChangingWholeThing: rr = ( |
            | 
            protect: [ unprotectedFinishChangingWholeThing: rr ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         flushModel: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         growOuterSkin: evt = ( |
            | 
            shouldWrapMeWhenGrowingSkin ifTrue: [
              ^ replaceWithSliceGroup: evt
            ].
            addDismissButtonToHeader.
            myOutliner beShrinkWrap borderWidth: 3.
            myOutliner safelyDo: [myOutliner layoutChanged].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         headerButtonContents = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         headerButtonFontSpec = bootstrap stub -> 'globals' -> 'outlinerPreferences' -> 'headerButtonFontSpec' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         isButtonCacheObsolete = ( |
            | 
            mirrors mirror programmingTimestamp != buttonCacheFillTime).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCategoryModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment button\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isForEditingNew = ( |
            | myOutliner isPlaceHolder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: accessing outliner properties\x7fCategory: used by mixins ui2 programmingSynchronization\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         isInWorld = ( |
            | 
            myOutliner isNotNil && [myOutliner isInWorld]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isObjectModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isPseudoCategoryModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isRootOutliner = ( |
            | myOutliner isRoot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSlotModel = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: override me\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         itemUpdaters = ((bootstrap stub -> 'globals') \/-> 'vector') -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
              "Widen the border if dropped onto the world"
            w isWorldMorph ifFalse: [^ shedOuterSkin: evt].
            willInsertMyselfWhenDropped ifTrue: [^ turnIntoObjectForWorld: w Event: evt].
            growOuterSkin: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fCategory: caching buttons\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         makeButtonCacheCurrent = ( |
            | 
            buttonCacheFillTime: mirrors mirror programmingTimestamp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         menuButtonFontSpec = ( |
            | ui2Menu defaultFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         menuColor = ( |
            | 
            preferences outliner colorScheme generalModelMenuColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | popUpMenu: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: just for mirror models\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         myObjectModelIfPresent: pb IfAbsent: ab = ( |
            | 
            myOutliner world morphs findFirst: [|:m|
              (m morphTypeName = 'pluggableOutliner')
              && [m model isObjectModel
              && [m model mirror = mirror]]]
            IfPresent: [|:o| pb value: o model]
            IfAbsent: ab).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fCategory: adding buttons to header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         needSpacerToKeepButtonOnRight = ( |
            | 
            myOutliner header morphsDo: [|:m|
              m isFlexibleHorizontally ifTrue: [^ false]
            ].
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment editor\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         newCommentEditor = ( |
             r.
            | 
            r: uglyMethodEditorMorph
                 copyString: comment
                 Target: myOutliner
                 Accept: myOutliner acceptCommentAction
                 Cancel: myOutliner cancelCommentAction
                 Style: commentStyle.
            r receiver: receiver.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutliner = ( |
            | 
            outlinerPrototype copyForModel: copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newOutlinerFor: whatever = ( |
            | 
            outlinerPrototype copyForModel: copyForReferrent: whatever).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutlinerFor: whatever InWorld: w = ( |
             o.
            | 
            (w reifiedObjects includesKey: whatever)  ifTrue: [|o|
              o: w reifiedObjects at: whatever.
             "repair reified objects if outliner was dragged to another world"
              o isInWorld && [o world = w]
                ifFalse: [ w reifiedObjects removeKey: whatever ]
                   True: [^ o ]
            ].
            o: newOutlinerFor: whatever.
            w reifiedObjects at: whatever Put: o.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutlinerForPlaceHolder = ( |
            | 
            outlinerPrototype copyAsPlaceHolderForModel: copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutlinerInWorld: w = ( |
            | 
            newOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newResultReporterForChangingNameInEditor: ed Event: evt = ( |
            | 
            [finishChangingName: newName]. "for browsing"
            (((ui2ResultReporter
              copy
              event: evt)
              editor: ed)
              reportTo: self)
              howToReport: 'finishChangingName:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newResultReporterForEditingContentsIn: ed Event: evt = ( |
            | 
            [finishChangingContents: nil]. "browsing"
            (((ui2ResultReporter copy
              event: evt)
              editor: ed text)
              reportTo: self)
              howToReport: 'finishChangingContents:').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newResultReporterForEditingWholeThingIn: ed Event: evt = ( |
            | 
            [finishChangingWholeThing: nil]. "browsing"
            (((ui2ResultReporter copy
              event: evt)
              editor: ed text)
              howToReport: 'finishChangingWholeThing:')
              reportTo: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinerFor: whatever InWorld: w = ( |
            | 
            w reifiedObjects
              if: whatever
              IsPresentDo: [|:v|
                "if not in this world, must have been dragged to another world"
                v isInWorld  && [v world = w]   ifTrue: [ ^ v ].
            ].
            newOutlinerFor: whatever InWorld: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         outlinerPrototype = ( |
            | pluggableOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fComment: Applies block to my immediately nested outliners.
May cause me to expand if doExpand is true. -- dmu 10/04\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinersExpand: doExpand ThenDo: blk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: menu\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         popUpMenu: evt = ( |
             m.
            | 
            ensureButtonCacheIsFull.
            m: ui2Menu copy.
            fillInMenuAsAppropriate: m.
            m hasInterestingButtons  ifFalse: [^ self].
            "copy menu in order to copy buttons
             to allow two simultaneous menus w/ 
             different targets"
            m: m copy retargetButtonsTo: myOutliner.
            m colorAll: menuColor.
            defaultButtonHolder: m initializeDefaultButtonHolder: defaultButtonHolder.
            m popUp: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         preferredBodyColor = ( |
            | 
            preferences outliner colorScheme generalModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         preferredBorderColor = ( |
            | 
            preferences outliner colorScheme generalModelBorder).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredColor = ( |
            | 
            "For non-pluggable outliner compatiblity"
            preferredBorderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (fontSpec copyName: \'verdana\' Size: 12 Style: \'bold\')\x7fVisibility: public'
        
         preferredFontSpec <- fontSpec copyName: 'verdana' Size: 12 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         preferredHeaderColor = ( |
            | 
            preferences outliner colorScheme headerColorFor: referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         preferredSlotTitleColor = ( |
            | 
            preferences outliner colorScheme slotTitle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         preferredTagColor = ( |
            | 
            preferences outliner colorScheme tagColorFor: referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         preferredTitleColor = ( |
            | 
            preferences outliner colorScheme titleColorFor: referrent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         protect: blk = ( |
            | 
            "should override with protection where needed"
            blk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping (receiving a droppee)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         recategorizeDroppedSlot: s = ( |
            | 
            s copyHolderForCategories:
              (categoryList asList addAll: s categories) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping (receiving a droppee)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         receiveDroppingPointerToModel: m IfAccepted: aBlk = ( |
            | 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         recolorModuleSummary = ( |
            | "See children" self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fCategory: adding buttons to header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         removeButtonFromHeader: b = ( |
            | 
            findButtonInHeader: b
            IfPresent: [|:m| m delete]
            IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fCategory: header\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         removeDismissButtonFromHeader = ( |
            | 
            removeButtonFromHeader: buildDismissButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         removeForTearingOff = ( |
            | 
            mirror removeSlotsFromMeAndDescendants: slotsInMeAndSubcategories.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         replaceWithSliceGroup: evt = ( |
             c.
             o.
             onr.
             p.
            | 
            p: myOutliner position.
            onr: myOutliner owner.
            c: myOutliner color.
            safelyDo: [
              myOutliner delete.
              o: sliceGroupOutlinerForMe: evt.
              onr ifNotNil: [
                onr addMorph: o.
              ].
              o position: p.
              o colorAll: c.
              o isInWorld ifTrue: [
                o world moveToFront: o
              ].
            ].
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         safelyDo: blk = ( |
            | myOutliner safelyDo: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: copying & creating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         setAppearanceOfOutliner = ( |
            | 
            myOutliner borderWidth: 0.
            isRootOutliner ifFalse: [myOutliner beFlexibleHorizontally].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         shedOuterSkin: evt = ( |
            | 
            removeDismissButtonFromHeader.
            myOutliner beFlexible borderWidth: 0.
            myOutliner layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping (receiving a droppee)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldResetModuleOfDroppingSlots: slots = ( |
            | 
            case if:   [ (slots asSet copyMappedBy: [|:s| s module]) size  >  1 ]
                 Then: true
                 If:   [ mirror moduleNames size != 1 ]
                 Then: true
                 If:   [ mirror moduleNames first != slots first module ]
                 Then: true
                 Else: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldWrapMeWhenGrowingSkin = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceGroupOutlinerForMe: evt = ( |
            | 
            (  sliceGroupModel newOutlinerFor: 
                 sliceReferrent copyForNone: mirror
            ) addSuboutliner: (shedOuterSkin: evt) myOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         slotForShowing: slot IfFail: fb = ( |
            | 
            slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            titleString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: testing the software\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         testOne = ( |
            | 
            testOneFor: generalModel parent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: testing the software\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         testOneFor: whatever = ( |
            | 
            process this birthEvent sourceHand attach: newOutlinerFor: whatever).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleFontColor = ( |
            | 
            myOutliner color textColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleFontSpec = bootstrap setObjectAnnotationOf: ( fontSpec copyName: 'verdana' Size: 12 Style: '') From: ( |
             {} = 'Comment: I am an abstract, portable, description of a font.
I am also immutable.\x7fModuleInfo: Creator: globals generalModel parent titleFontSpec.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fCategory: title (override these)\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleString = ( |
            | 
            'A triviality: ', time current timeString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         titleStyle = ( |
            | myTitleStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fComment: This is here so it can send collapse: and expand:
to the model; don\'t use the one in traits outliner
for pluggable outliners. -- dmu 5/1\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         toggleExpandState: evt = ( |
            | 
            myOutliner isExpanded ifTrue: [collapse: evt] False: [expand: evt].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingContents: rr = ( |
            | 
            rr event sourceHand attach: 
              syntaxErrorMorph copyMessage: 
                'child should have overriden generalModel unprotectedFinishChangingContents:'.
            myOutliner enclosingOutlinerIfPresent: [|:o| o safelyDo: [o update]]
                                         IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingName: aResultReporter = ( |
             ed.
            | 
            ed: aResultReporter editor.
            ed string: ed string.
            ed editMode: false.
            myOutliner
              enclosingOutlinerIfPresent: [|:o| o safelyDo: [o update]]
                                IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: override these\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         unprotectedFinishChangingWholeThing: rr = ( |
            | 
            rr event sourceHand attach: 
              syntaxErrorMorph copyMessage: 'unimplemented'.
            false ifTrue: [myOutliner doneEditingWholeThing "if no error"].
            myOutliner enclosingOutlinerIfPresent: [|:o| o safelyDo: [o update]]
                                         IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         updateItemsDo: blk = ( |
            | 
            withAllUpdaters: itemUpdaters Do: blk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | 
            false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         wholeThingEditor = ( |
            | 
            myOutliner wholeThingEditor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: override me\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         withAllUpdaters: us Do: blk = ( |
            | 
            us do: [|:u| withUpdater: u Do: blk].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fCategory: helpers\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         withUpdater: u Do: blk = ( |
            | 
            (u copy outlinerToUpdate: myOutliner)
              updateDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: accessing outliner properties\x7fCategory: used by mixins ui2 programmingSynchronization\x7fModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         world = ( |
            | myOutliner world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         referrent.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> () From: ( | {
         'Category: basic, trivial model state\x7fComment: When moving or copying a slot, this is 
set to true.
WHen simply yanking an outliner, it is false. -- dmu 5/1\x7fModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         willInsertMyselfWhenDropped <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         generalModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules generalModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.19 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalModel' -> () From: ( | {
         'ModuleInfo: Module: generalModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'pluggableStyle
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'pluggableStyle' From: 'ui2/outliner'



 '-- Side effects'

 globals modules generalModel postFileIn
