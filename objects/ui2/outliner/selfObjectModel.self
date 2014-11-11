 '$Revision: 30.12 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: just for mirror models\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         mySelfObjectModel = ( |
            | 
            (selfObjectModel outlinerFor:  mirror InWorld: myOutliner world) model).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         selfObjectModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules selfObjectModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.12 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'selfObjectModel' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Self Object Outliner\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         selfObjectModel = bootstrap define: bootstrap stub -> 'globals' -> 'selfObjectModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals selfCatOrObjModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfObjectModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfObjectModel.

CopyDowns:
globals selfCatOrObjModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfObjectModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: evaluators\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         addEvaluator: evt = ( |
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

            ed: uglyTextEditorMorph copyString: '' Style: evaluatorStyle.
            ed receiver: receiver.
            "ed beFlexibleHorizontally. won't resize"
            ed beTypingFocusFor: evt sourceHand.

            ed frameStyle: ed flatStyle.
            b1 target: ed text.
            b2 target: ed text.
            ed borderWidth: 0.

            f: frameMorph copy.
            f addMorphFirst: ed.
            f addMorphLast:  r.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 2.
            f beFlexibleHorizontally.
            f leftJustify.

            result: f.

            result colorAll: myOutliner color.
            myOutliner addMorphToBottom: result.
            b3 target: result.

            ed).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'tearOff' From:
             bootstrap remove: 'tearOffCopy' From:
             globals selfCatOrObjModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfObjectModel parent buttonDescriptions.

CopyDowns:
globals selfCatOrObjModel parent buttonDescriptions. _Clone 
SlotsToOmit: tearOff tearOffCopy.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Children\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         children = ( |
            | target model children: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Copied-Down Children\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         copiedDownChildren = ( |
            | target model copiedDownChildren: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Copy-Down Parent(s)\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         copyDownParents = ( |
            | 
            target model copyDownParents: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: mutating\x7fCategory: ``Subclass\'\' Me\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         createSubclass = ( |
            | target model createSubclass: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Find Slot...\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         findSlot = ( |
            | target model findSlot: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Find Missing Slots\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         missingSlots = ( |
            | 
            target model missingSlots: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: References\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         references = ( |
            | target model references: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: showing and hiding\x7fCategory: Show Morph\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         showMorph = ( |
            | target model showMorph: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: Show Traits Family\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         showTraitsFamily = ( |
            | target model showTraitsFamily: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: tearing off\x7fCategory: Move Slots\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOff = ( |
            | 
            target tearOff: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: tearing off\x7fCategory: Copy Slots\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOffCopy = ( |
            | 
            target tearOffCopy: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
             hasS.
             r.
            | 
            hasS: slotsInMeAndSubcategories isEmpty not.
            r: 'addSlot' & 'addCategory' & 'createSubclass' & nil.
            hasS ifTrue: [
              r: r & 'tearOffCopy' & 'tearOff' & nil
                   & 'userDefined' & nil.
            ].

            r: r & myOutliner showOrHideComment 
                 & myOutliner showOrHideAnnotation & 'setModule' & nil.

            mirror copyDowns isEmpty ifFalse: [r: r & 'copyDownParents'].
            r: r & 'copiedDownChildren'.
            mirror isComplete ifFalse: [ r: r & 'showTraitsFamily' ].
            r: r & 'children' & 'references' & 'findSlot'.
            mirror hasAnyMissingSlots ifTrue: [r: r & 'missingSlots'].
            r: r & nil.

            r: r & expandOrCollapseAll.

                (mirror isOKToSend: 'isShowableAsMorph')
            && [ mirror reflectee isShowableAsMorph]
              ifTrue: [ r: r & 'showMorph' ].

            r asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         children: evt = ( |
            | 
            evt sourceHand attach: (
              childrenMorph copyMirror: mirror Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: top & bottom feeders\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         collapseBottomMorphs: evt = ( |
            | 
            collapseEmptyEvaluators: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: evaluators\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         collapseEmptyEvaluators: evt = ( |
            | 
            myOutliner bottomMorphs morphs copy do: [
            |:fr. e |
              e: fr morphs first.
              e contentsString isEmpty  ifFalse: [
                e resizeToMinimum.
              ] True: [ fr delete ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         comment = ( |
            | mirror comment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         comment: c = ( |
            | mirror comment: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         copiedDownChildren: evt = ( |
            | 
            evt sourceHand attach: (
              copyDownChildrenMorph copyMirror: mirror Event: evt).
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: object operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         copyDownParents: evt = ( |
            | 
            mirror copyDowns do: [|:cd. o|
              o: world outlinerForMirror: cd parentMirror.
              evt sourceHand attach: o.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fComment: make a copy-down child of this object,
Make a new, empty parent of my parent that
inherits from my parents.
Set the creator of my parent slot.\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         createSubclass: evt = ( |
            | 
            evt sourceHand attach: 
              evt sourceHand world outlinerForMirror:  mirror createSubclass.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: evaluators\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         evaluatorStyle = ( |
            | 
            evaluatorStyleProto copyModel: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: evaluators\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         evaluatorStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'evaluatorStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'evaluatorStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfObjectModel parent evaluatorStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'evaluatorStyleProto' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'evaluatorStyleProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals selfObjectModel parent evaluatorStyleProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> 'evaluatorStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         headerButtonContents = ( |
            | 
            [showParents: e. addEvaluator: e.].
            (
            ('/\\' @ 'target model showParents: event') &
            ('E' @ 'target model addEvaluator: event') &
            dismissButtonContents
            ) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isObjectModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSelfObjectModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         missingSlots: evt = ( |
            | 
            evt sourceHand attach:
               outlinerFor: mirror missingSlots InWorld: myOutliner world.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: module summary\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         moduleSummaryString = ( |
            | mirror moduleSummaryString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newAnnotationMorph = ( |
            | 
            pluggableObjectAnnotationMorph
               copyObjectOutliner: myOutliner
                           Style: annotationInfoStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: evaluators\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newEvaluatorButtonLabel: l Script: s IsAsynchronous: isA = ( |
             b.
             n.
            | 
            b: ui2Button copy.
            b script: s.
            b isAsynchronous: isA.
            n: preferredFontSpec size - 2.
            b label: l  FontSpec:      (preferredFontSpec copySize: n)
                        FontColor:      preferredTitleColor.
            b beFlexibleHorizontally.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: evaluators\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         newOutlinerFor: whatever = ( |
            | 
            newObjectOutlinerFor: whatever).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'selfCatOrObjModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: appearance\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         preferredColor = ( |
            | 
            preferences outliner colorScheme selfObjectModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         recategorizeDroppedSlot: s = ( |
            | s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         receiveDroppingPointerToModel: m IfAccepted: aBlk = ( |
            | 
            m isSelfSlotModel ifFalse: [^ self].
            m slot changeContentsInHolderAndDescendantsTo: mirror.
            aBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: modelling mirrors\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         receiver = ( |
            | mirror).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         references: evt = ( |
            | 
            evt sourceHand attach:
              enumerationMorphFactory 
                referencesOf: mirror
                StartingFrom: mirror
                       Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: object operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         showMorph: evt = ( |
             o.
            | 
            o: mirror reflectee.
                ( mirror isOKToSend: 'isShowableAsMorph')
             && [ o                   isShowableAsMorph ]  ifTrue: [
              evt sourceHand attach: o asMorph.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: object operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
         showParents: evt = ( |
            | 
            mirror do: [|:s|
              s isParent ifTrue: [
                evt sourceHand attach:  
                  selfObjectModel outlinerFor: s contents
                                      InWorld: evt sourceHand world
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         showTraitsFamily: evt = ( |
            | 
            evt sourceHand attach:
                (textViewerMorph
                    copyTitle: ('Traits family for ', mirror name)
                         Text: ((traitsHierarchyStringForReflectee: mirror Indent: 0) flatString)) open.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fComment: Suggest a creator path.
-- Ungar, 2/8/95\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: public'
        
         suggestCreator: aPath = ( |
            | 
            myOutliner addAnnotationInfo: process this birthEvent.
            myOutliner annotationInfo suggestCreator: aPath.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: testing outliners\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot'
        
         testOneFor: whatever = ( |
            | 
            resend.testOneFor:
              (reflect: whatever) isReflecteeMirror ifTrue: [whatever] False: [reflect: whatever]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'selfObjectModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: selfObjectModel InitialContents: FollowSlot\x7fVisibility: private'
        
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



 '-- Side effects'

 globals modules selfObjectModel postFileIn
