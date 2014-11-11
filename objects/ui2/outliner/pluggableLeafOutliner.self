 '$Revision: 30.9 $'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot'
        
         pluggableLeafOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableLeafOutliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            pluggableLeafOutliner initializePrototype.
             resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         pluggableLeafOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals pluggableOutliner copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableLeafOutliner.

CopyDowns:
globals pluggableOutliner. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> () From: ( | {
         'Category: Pluggable Leaf Outliner State\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: InitializeToExpression: (nil)'
        
         contentsLabel <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableLeafOutliner parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildItemsHolder = ( |
            | 
            resend.buildItemsHolder.
            "no visible expander, so want no extra height when expanded"
            items baseMinHeight: 0.
            items).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buttonIcon = ( |
            | model buttonIcon).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsLabelFontSpec = ( |
            | model contentsLabelFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         expandAll: evt = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot'
        
         expandSproutee = ( |
            | 
            model expandSproutee).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         fillInHeader = ( |
             tle.
            | 

            isPlaceHolder ifTrue: [^ self].

            tle: buildTitle.
            header addMorphLast: tle.
            addCommentButtonToHeader.
            header addMorphLast: flexibleSpacer copy color: (paint named: 'transparent').
            contentsLabel: optionalMorph copy color: (paint named: 'transparent').
            header addMorphLast: contentsLabel.
            header addMorphLast: rigidSpacer copyH: 4 Color: (paint named: 'transparent').
            header addMorphLast: buildExpander.

            " put contents string and sprout box at bottom of tall title "
            tle morphs findFirst: [|:m| m morphTypeName = 'columnMorph' ]
                       IfPresent: [ header bottomJustify]
                        IfAbsent: [ header centerJustify].
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeForModel: m = ( |
            | 
            resend.initializeForModel: m.
            color: m preferredBorderColor.
            borderWidth: 1.
            beFlexible.
            frameStyle: insetBezelStyle.
            recolor.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         modelProtoForProto = ( |
            | 
            generalLeafModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: type tests\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'pluggableLeafOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: contents label\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         oneLinerContentsString = ( |
            | 
            model oneLinerContentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot'
        
         outlinerForSprouting: evt IfNone: nb = ( |
            | model outlinerForSprouting: evt IfNone: nb).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot'
        
         recolor = ( |
            | 
            resend.recolor.
            contentsLabel inner ifNotNil: [
               contentsLabel inner color: model preferredTitleColor].
            expander color: model preferredBodyColor.
            updateButtonIcon.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fComment: reel in the arrow\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         retract = ( |
            | 
            expander target tailMorph collapse. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showSlotContents = ( |
            | model showSlotContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sprout: evt = ( |
            | 
            "Let model decide how to do it;
            will likely ask me to sproutWith- or Without- Arrow -- dmu 3/01"

            model sprout: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutWithArrow: evt = ( |
             o.
            | 
            o: outlinerForSprouting: evt IfNone: [^ self].
            expandSproutee ifTrue: [o model expand: evt].
            o isInWorld ifTrue: [world moveToFront: o].
            expander target pointTo: o InSameViewAsHand: evt sourceHand.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         sproutWithoutArrow: evt = ( |
             o.
            | 
            o: outlinerForSprouting: evt IfNone: [^ self].
            expandSproutee ifTrue: [o model expand: evt].
            evt sourceHand attach: o.
            o).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: sprouting\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateArrow = ( |
            | 
            expander target isRetracted ifTrue: [^ self].
            expander target joineeOrNil = (outlinerForSprouting: process this birthEvent IfNone: [^ self])
             ifTrue: [^ self].
            sproutWithArrow: process this birthEvent.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateButtonIcon = ( |
             e.
             i.
            | 
            i: buttonIcon copy.
            i colors size > 0 
              ifTrue: [i colors at: 0 
                               Put: model preferredTitleColor].
            e: expander.
            e morphs size < 1 ifTrue: [^ self].
            i = e firstMorph image ifFalse: [
              e firstMorph setImage: i].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: contents label\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateContentsLabelString = ( |
            | 
            showSlotContents  ifTrue: [
              contentsLabel inner ifNil: [
                contentsLabel inner: 
                    ((labelMorph copy label: oneLinerContentsString)
                                   fontSpec: contentsLabelFontSpec).
                contentsLabel open.
              ] IfNotNil: [| c <- ''|
                c: oneLinerContentsString.
                c = contentsLabel inner label ifFalse: [
                  safelyDo: [ contentsLabel inner label: c ].
                ].
              ].
            ] False: [
              contentsLabel inner ifNotNil: [
                contentsLabel inner delete.
                contentsLabel inner: nil.
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateDo: blk = ( |
            | 
            resend.updateDo: blk.
            isPlaceHolder ifTrue: [^ self].
            updateContentsLabelString.
            "updateButtonIcon."
            updateArrow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableLeafOutliner' -> () From: ( | {
         'Category: Pluggable Leaf Outliner State\x7fModuleInfo: Module: pluggableLeafOutliner InitialContents: FollowSlot'
        
         prototype = ( |
            | pluggableLeafOutliner).
        } | ) 



 '-- Side effects'

 globals modules pluggableLeafOutliner postFileIn
