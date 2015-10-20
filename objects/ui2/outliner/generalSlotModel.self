 '$Revision: 30.22 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         generalSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'generalSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalLeafModel copyForSpecialization ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalSlotModel.

CopyDowns:
globals generalLeafModel. copyForSpecialization 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> () From: ( | {
         'Category: slot model state\x7fModuleInfo: Module: generalSlotModel InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         cachedIsMethod <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalSlotModel parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildSlotTitle = ( |
             titleEditor.
            | 
            titleEditor:
              slotNameEditorMorph copySlot: slot
                                    Target: self
                                    Accept: acceptNameChange
                                     Style: titleStyle
                                LabelColor: preferredSlotTitleColor.
            titleEditor isAsynchronous: true.
            myOutliner titleEditor: titleEditor.
            titleEditor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | buildSlotTitle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         buttonDescriptions = bootstrap define: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () ToBe: bootstrap addSlotsTo: (
             globals generalModel parent buttonDescriptions _Clone ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( |
             {} = 'Comment: Holds button descriptions:
category leaf is button name, 
slot name is button name in buttonCache,
method source is button script,
public slots make asynchronous buttons.

Includes some items used only for debugging,
so that language-specific activation models
can copyDown from here.\x7fModuleInfo: Creator: globals generalSlotModel parent buttonDescriptions.

CopyDowns:
globals generalModel parent buttonDescriptions. _Clone

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: corresponding assignment slot\x7fCategory: Find slot of :\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         findAssignmentSlot = ( |
            | 
            target model findSlotOfAssignment: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: the slot\x7fCategory: Find slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         findSlot = ( |
            | 
            target model findSlot: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: debugging\x7fCategory: stepping\x7fCategory: Finish\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         finish = ( |
            | 
            target model finishCommand: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: the slot\x7fCategory: Implementors\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         implementors = ( |
            | 
            target model implementors: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: the slot\x7fCategory: Implementors in family\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         implementorsInFamily = ( |
            | 
            target model implementorsInFamily: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: corresponding assignment slot\x7fCategory: Implementors of :\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         implementorsOfAssignment = ( |
            | 
            target model implementorsOfAssignment: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: corresponding assignment slot\x7fCategory: Implementors of : in family\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         implementorsOfAssignmentInFamily = ( |
            | 
            target model implementorsOfAssignmentInFamily: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: debugging\x7fCategory: browsing\x7fCategory: Method holder\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         methodHolder = ( |
            | 
            target model getMethodHolder: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: debugging\x7fCategory: stepping\x7fCategory: Next\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         next = ( |
            | 
            target model nextCommand: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: debugging\x7fCategory: stepping\x7fCategory: Retry\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         retry = ( |
            | 
            target model retryCommand: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: debugging\x7fCategory: stepping\x7fCategory: Revert\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         revert = ( |
            | 
            target model revertCommand: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: the slot\x7fCategory: Senders\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         senders = ( |
            | 
            target model senders: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: the slot\x7fCategory: Senders in family\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         sendersInFamily = ( |
            | 
            target model sendersInFamily: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: corresponding assignment slot\x7fCategory: Senders of :\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         sendersOfAssignment = ( |
            | 
            target model sendersOfAssignment: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: browsing\x7fCategory: corresponding assignment slot\x7fCategory: Senders of : in family\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         sendersOfAssignmentInFamily = ( |
            | 
            target model sendersOfAssignmentInFamily: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> 'buttonDescriptions' -> () From: ( | {
         'Category: debugging\x7fCategory: stepping\x7fCategory: Step\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         step = ( |
            | 
            target model stepCommand: event).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: button\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonIcon = ( |
            | 
            "slot could, unfortunately, be nil"
            slot isNil ifTrue: [^ ui2Image copy]. 
             "must test for assignable before assignment,
               otherwise fake slots break"
            case
             if: [ slot isMethod ]         Then: [ methodIcon ]
             If: [ slot isAssignable not ] Then: [ equalsIcon ]
             If: [ slot isAssignment ]     Then: [ leftArrowIcon ]
             If: [ slot isAssignable ]     Then: [ colonIcon ]
             Else: [ ui2Image copy ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonsToPutInMenu = ( |
             isA.
             r.
            | 
            isForEditingNew ifTrue: [^ vector].
            isA: slot exists && [slot isAssignable].
            r: 'senders' & 'sendersInFamily' & 'implementors' &
               'implementorsInFamily' & 'findSlot' & nil.
            isA ifTrue: [
              r: r & 'sendersOfAssignment' & 'sendersOfAssignmentInFamily' & 
                     'implementorsOfAssignment' & 'implementorsOfAssignmentInFamily' & 
                     'findAssignmentSlot' & nil.
            ].
            (r & 'yank' & nil) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         categoriesString = ( |
            | 
            isForEditingNew ifTrue: [referrent categoriesString]
                             False: [slot category]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         categoryList = ( |
            | 
            isForEditingNew ifTrue: [referrent categoryList]
                             False: [slot categories]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         changeSlotInObjectTo: nSlotPair IfFail: fb = ( |
             nSlot.
            | 
            nSlot: slot changeSlotInObjectTo: nSlotPair IfFail: [^ fb value].

            safelyDo: [
              slot: nSlot.
              myOutliner initialize update.
              myOutliner enclosingOutlinerIfPresent: [|:eo| eo update] IfAbsent: [].
            ].
            myOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            resend.collapse: evt.
            evt sourceHand removeAllKeyboardSubscribers.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: button\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         colonIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '   0   ' &
    '  000  ' &
    '   0   ' &
    '       ' &
    '   0   ' &
    '  000  ' &
    '   0   ' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'transparent')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: globals generalSlotModel parent colonIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         constructItems = ( |
            | 
            setCachedIsMethod.
            hasMethod ifTrue: [
              myOutliner cachedContentsString: contentsString.
              buildLocals.
              myOutliner editContents.
              myOutliner contentsEditor receiver: receiver.
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing contents (the method)\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsEditorPrototype = bootstrap stub -> 'globals' -> 'uglyMethodEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: editing contents (the method)\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
            | methodString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: power operations\x7fComment: Applies the block to the contents of the method and
leaves the wholeThingEditor open if the method was changed.\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         doOperation: aUserDefinedOperation ToAllForEvent: event = ( |
            | 
            (aUserDefinedOperation includeContentsOfSlot: slot)  ifTrue: [
              myOutliner editWholeThingIfChangedBy: aUserDefinedOperation Event: event
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: button\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         equalsIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '       ' &
    '       ' &
    '0000000' &
    '       ' &
    '0000000' &
    '       ' &
    '       ' ) asVector
 Colors: (
    (paint named: 'blue') &
    (paint named: 'green')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: globals generalSlotModel parent equalsIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: expanding & collapsing\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            resend.expand: evt.
            myOutliner beTypingFocusFor: evt sourceHand.
            myOutliner contentsEditor ifNotNil: [|:editor| 
              editor resizeToText]. "Jeff 4/03, auto-expand to show full text"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         growOuterSkin: evt = ( |
            | 
            myOutliner frameStyle: myOutliner bezelStyle.
            addInSituButtonToHeader.
            resend.growOuterSkin: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         hasMethod = ( |
            | 
            slot exists && [slot isMethod]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isCommentButtonWanted = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: type testing\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         isSlotModel = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: button\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         leftArrowIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '   0   ' &
    '  0    ' &
    ' 0     ' &
    '0000000' &
    ' 0     ' &
    '  0    ' &
    '   0   ' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'transparent')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: globals generalSlotModel parent leftArrowIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: button\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         methodIcon = bootstrap setObjectAnnotationOf: ( [ui2Image copyPixelLines: (
    '0000000' &
    '0     0' &
    '0000000' &
    '0     0' &
    '0     0' &
    '0     0' &
    '0000000' ) asVector
 Colors: (
    (paint named: 'transparent') &
    (paint named: 'transparent')) asVector] value) From: ( |
             {} = 'ModuleInfo: Creator: globals generalSlotModel parent methodIcon.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fComment: Return string for method editor\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         methodString = ( |
            | 
            childShouldImplement).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         mirror = ( |
            | isForEditingNew ifTrue: [referrent mirror] False: [slot mirror]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: menu operations\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         nameForBrowsing = ( |
            | slot name).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         newOutlinerForAddingSlotToCategory: categoryReferrent = ( |
             o.
            | 
            o: newOutlinerForPlaceHolder.
            "use slot to hold category for adding later,
             that way adding code will work on slots in views"
            o model referrent: categoryReferrent.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: contents label string\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         oneLinerContentsString = ( |
             ellipsis = '...'.
            | 
            case
             if:   [ hasMethod ]
             Then: [ "test first for top-level activations"
                     | m. src. s |
                     "hack because I don't want to trace why string starts with newline"
                     src: method sourceStringIfFail: [^ ellipsis].
                     ('\n\r' includes: src firstIfAbsent: '') ifTrue: [src: src copyWithoutFirst].
                     (src includes: '\n') ifTrue: [^ ellipsis]. "optimize long methods"
                     (src includes: '\r') ifTrue: [^ ellipsis]. "optimize long methods"
                     m: methodTextWithoutSlots.
                     (m lines size > 1) || [s: m asString. s size > contentsLengthLimit]
                       ifTrue: [^ ellipsis].
                     s
                   ]
             If:   [ slot exists ]
             Then: [ slot value nameSize: contentsLengthLimit ]
             Else: ['error: ', slot contents reflectee error ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinerForSprouting: evt IfNone: nb = ( |
            | 
            slot exists ifFalse: [|m|
              m: 'Sorry, but that slot does not exist (any more).'.
              (message copy receiver: userQuery 
                            Selector: 'report:'
                                With: m
              ) forkForBirthEvent: evt.
            ^ nb value: m.
            ].
            myOutliner isInWorld ifFalse: [|m|
              m: 'Sorry, but I am not in any world.'.
              (message copy receiver: userQuery 
                            Selector: 'report:'
                                With: m
              ) forkForBirthEvent: evt.
            ^ nb value: m.
            ].
            objectModelProto outlinerFor: slot value InWorld: myOutliner world).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalLeafModel' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         setAppearanceOfOutliner = ( |
            | 
            myOutliner borderWidth: 1.
            myOutliner beFlexibleHorizontally.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         setCachedIsMethod = ( |
            | 
            cachedIsMethod: hasMethod).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         shedOutlinerSkin: evt = ( |
            | 
            removeInSituButtonToHeader.
            resend.shedOutlinerSkin: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         shouldWrapMeWhenGrowingSkin = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         shownSlotsInMe = ( |
            | vector copyAddLast: slot).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sliceGroupOutlinerForMe: evt = ( |
            | 
            (  sliceGroupModel newOutlinerFor: 
                 sliceReferrent copyForOne: slot
            ) addSuboutliner: (shedOuterSkin: evt) myOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         slot = ( |
            | 
            isForEditingNew ifTrue: nil False: [referrent]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         slot: s = ( |
            | referrent: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMe = ( |
             r.
            | 
            r: list copyRemoveAll.
            slot ifNil: [^r].
            r addFirst: slot.
            slot isAssignable ifTrue: [
              r addLast: slot correspondingAssignmentSlot.
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: accessing the slot\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         slotsInMeAndSubcategories = ( |
            | 
            slotsInMe).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: evt = ( |
            | 
            evt isShiftDownForLeftShiftHack not && [ hasMethod ]
             ifTrue: [ toggleExpandState: evt ]
              False: [ resend.sprout: evt ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: finding the slot in situ\x7fComment: I am in a slice outliner; retrieve the
slot\'s holder and unfold to the slot.
I am sent from a button built by buildSproutInSituButton.\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         sproutInSitu: evt = ( |
             morphOfInterest.
             myTopRight.
             offsetOfMorphOfInterest.
             slotExists <- bootstrap stub -> 'globals' -> 'true' -> ().
             slotToSprout.
             spacing = 7.
             sproutedOutliner.
            | 
            "Line up the interesting part of the sproutedOutliner
             with the myOutliner top right. -- dmu"

            sproutedOutliner: world outlinerForMirror: slot holder.

            "-- jb 4/03, add morph before position calculation to allow
                unfold to layout the editor correctly"
            sproutedOutliner isInWorld ifFalse: [
              world addMorph: sproutedOutliner.
            ]. 

            slotToSprout:  slot holder  at:  slot name  IfAbsent: [slotExists: false].
            morphOfInterest:
              slotExists 
                ifFalse: [sproutedOutliner]
                  True: [
                          sproutedOutliner unfold: slotToSprout
                                            Event: evt
                                           IfFail: [sproutedOutliner]
              ].

            world moveToFront: sproutedOutliner.

            myTopRight:
                (myOutliner root globalPosition x  +  myOutliner root baseBounds size x)
              @ (myOutliner      globalPosition y).
            offsetOfMorphOfInterest:
              morphOfInterest globalPosition - sproutedOutliner globalPosition.

            sproutedOutliner moveToPosition:
              myTopRight + (spacing @ 0)
                         + (0  @  offsetOfMorphOfInterest y negate).

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: title\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | 
            slot ifNil: [^ ''].
            slot longKey).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateContentsEditor = ( |
            | 
            updateSlot.

            case 
              if: [cachedIsMethod  &&  [slot isMethod]]
              Then: [
                (myOutliner cachedContentsString  =  methodString)
                  ifTrue: [^ self].
            ] If: [cachedIsMethod not  && [ slot isMethod not]]
              Then: [ ^ self].

            cachedIsMethod  ifTrue: [ myOutliner removeItem: myOutliner contentsEditor].
            constructItems.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalSlotModel' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         updateSlot = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         generalSlotModel = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules generalSlotModel.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.22 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'generalSlotModel' -> () From: ( | {
         'ModuleInfo: Module: generalSlotModel InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules generalSlotModel postFileIn
