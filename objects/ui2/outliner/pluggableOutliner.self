 '30.18.1'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fCategory: evalutators\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         evaluatorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals evaluatorMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> () From: ( | {
         'Category: Evaluator Morph State\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)'
        
         buttonRow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> () From: ( | {
         'Category: Evaluator Morph State\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (uglyTextEditorMorph copy)'
        
         editor <- uglyTextEditorMorph copy.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> () From: ( | {
         'Category: Evaluator Morph State\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)'
        
         outlinerModel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals evaluatorMorph parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyOnEvt: evt OutlinerModel: model = ( |
             b1.
             b2.
             b3.
             f.
             r.
             result.
            | 
              f: copy.
              f outlinerModel: model.

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

            f editor: uglyTextEditorMorph copyString: '' Style: evaluatorStyle.
            f editor receiver: f outlinerModel receiver.
            f editor beTypingFocusFor: evt sourceHand.
            f editor color: model preferredBodyColor.
            f editor fontColor: model preferredTitleColor.
            f editor frameStyle: f editor flatStyle.

            f buttonRow: r.
            f buttonRow morphsDo: [|:b|
              b color: f outlinerModel preferredBodyColor.
              b labelColor: f outlinerModel preferredTitleColor].

            b1 target: f editor text.
            b2 target: f editor text.
            f editor borderWidth: 0.

            f addMorphFirst: f editor.
            f addMorphLast:  r.
            f frameStyle: f insetBezelStyle.
            f borderWidth: 2.
            f beFlexibleHorizontally.
            f leftJustify.
            f color: model preferredBodyColor.
            result: f.

            b3 target: result.

            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         evaluatorStyle = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> 'evaluatorStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals evaluatorMorph parent evaluatorStyle.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> 'evaluatorStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         color = paint named: 'yellow'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> 'evaluatorStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         fontColor = paint named: 'transparent'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> 'evaluatorStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         fontSpec = ( |
            | evaluatorMorph preferredFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> 'evaluatorStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'oddball' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         evaluatorStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> 'evaluatorStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> 'evaluatorStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals evaluatorMorph parent evaluatorStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         morphTypeName = 'evaluatorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newEvaluatorButtonLabel: l Script: s IsAsynchronous: isA = ( |
             b.
             n.
            | 
            b: ui2Button copy.
            b script: s.
            b isAsynchronous: isA.
            n: preferredFontSpec size - 2.
            b label: l  FontSpec:      (preferredFontSpec copySize: n)
                        FontColor:      paint named: 'red'.
            b beFlexibleHorizontally.
            b).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (fontSpec copyName: \'helvetica\' Size: 12 Style: \'bold\')'
        
         preferredFontSpec <- fontSpec copyName: 'helvetica' Size: 12 Style: 'bold'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'evaluatorMorph' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         recolor = ( |
            | 
            resend.recolor. 
            morphsDo: [|:m| m color: outlinerModel preferredBodyColor].
            color: outlinerModel preferredBodyColor. 
            editor color: outlinerModel preferredBodyColor. 
            editor fontColor: outlinerModel preferredTitleColor. 
            buttonRow morphsDo: [|:b|
              b color: outlinerModel preferredBodyColor.
              b labelColor: outlinerModel preferredTitleColor].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         pluggableOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableOutliner.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.
            pluggableOutliner initializePrototype.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (\'30.18.1\')\x7fVisibility: public'
        
         revision <- '30.18.1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphical interface\x7fCategory: ui2\x7fCategory: Programming Environment\x7fCategory: Pluggable Outliner Framework\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         pluggableOutliner = bootstrap define: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'body' From:
             bootstrap remove: 'items' From:
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals outliner copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutliner.

CopyDowns:
globals outliner. copy 
SlotsToOmit: body items parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: other pieces\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         annotationInfo.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (rowMorph copy)\x7fVisibility: private'
        
         body.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: other pieces\x7fComment: accessed from model\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         bottomMorphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: editors\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         cachedContentsString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: other pieces\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         commentButton <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: editors\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         commentEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: editors\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         contentsEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: modes\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isEditingWholeThing <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: modes\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isPlaceHolder <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Outliner Morph State\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (columnMorph copy)\x7fVisibility: private'
        
         items.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (generalModel)\x7fVisibility: private'
        
         model <- bootstrap stub -> 'globals' -> 'generalModel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( |
             {} = 'Comment: Things to do:

implement module slots and objs widgets in new framework
replace all nonpluggable outliners

Dragging outliner into world needs to enter reifiedObjects

implement real categories for Java


use hold  for mac menu

-- dmu 5/1\x7fModuleInfo: Creator: globals pluggableOutliner parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptChangingNameTo: str Editor: ed Event: evt = ( |
            | 
            model acceptChangingNameTo: str Editor: ed Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         acceptComment: evt = ( |
             str.
            | 
            "forked from acceptCommentAction"
            model protect: [
              str: commentEditor contentsString.
              comment: str.
              commentEditor clearPanel.
              str isEmpty ifTrue: [ dismissCommentEditor ].
              updateComment.
              commentEditor ifNotNil: [ 
                commentEditor frameStyle: commentEditor insetBezelStyle
              ].
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         acceptCommentAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'acceptCommentAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutliner parent acceptCommentAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'acceptCommentAction' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target acceptComment: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptContents: str Editor: ed Event: evt = ( |
            | 
            model acceptContents: str Editor: ed Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptEditWholeThing: str Editor: ed Event: event = ( |
            | 
            model acceptEditWholeThing: str Editor: ed Event: event.
            "cannot send doneEditingWholeThing here because above method is async"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addAnnotationInfo: evt = ( |
            | 
            annotationInfo ifNotNil: [^ self].
            annotationInfo:  model newAnnotationMorph.
            addMorphToTop: annotationInfo.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         addBodyMorph = ( |
            | 
            columnUnderHeader removeAllMorphs.
            topMorphs    ifNotNil: [columnUnderHeader addMorphLast: topMorphs].
                                    columnUnderHeader addMorphLast: body.
            bottomMorphs ifNotNil: [columnUnderHeader addMorphLast: bottomMorphs].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addCategory: evt = ( |
             i.
            | 
            model expand: evt.
            i: model newOutlinerForAddingCategory.
            i colorAll: color.
            model addNewCategoryOutliner: i.
            i editTitle: evt.
            items layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         addCommentButtonToHeader = ( |
            | 
            model isCommentButtonWanted ifTrue: [
              buildCommentButton.
              header addMorphLast: commentButton.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addCommentEditor = ( |
            | 
            commentEditor ifNotNil: [dismissCommentEditor].
            commentEditor: model newCommentEditor.
            commentEditor panel acceptButton isAsynchronous: true.
            commentEditor frameStyle: insetBezelStyle.
            commentEditor borderWidth: 1.
            addMorphToTop: commentEditor.
            commentButton open.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addCommentEditorFor: sourceHand = ( |
            | 
            addCommentEditor.
            commentEditor beTypingFocusFor: sourceHand.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addDroppingMorph: m Event: evt = ( |
            | 
            [finishAddingDroppingMorph: m]. "browsing"
            (message copy receiver: self Selector: 'finishAddingDroppingMorph:' With: m)
              forkForBirthEvent: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: top and bottom feeders\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorphToBottom: m = ( |
            | 
            safelyDo: [
              bottomMorphs ifNil: [
                bottomMorphs: newColumn.
                columnUnderHeader addMorphLast: bottomMorphs.
              ].
             bottomMorphs addMorphLast: m.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: top and bottom feeders\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addMorphToTop: m = ( |
            | 
            safelyDo: [
              topMorphs ifNil: [
                topMorphs: newColumn.
                columnUnderHeader addMorphFirst: topMorphs.
              ].
              topMorphs addMorphLast: m.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: adding things\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlot: evt = ( |
             i.
            | 
            model expand: evt.
            i: model newOutlinerForAddingSlot.
            model addNewSlotOutliner: i.
            i editWholeThing: evt.
            items layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            model allowSubmorphsToGetEvent: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         baseCopy = ( |
             new.
            | 
            "Copy the button and its action object."

            new: resend.baseCopy.
            new model: model copy myOutliner: new.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         bePlaceHolder = ( |
            | isPlaceHolder: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         beTypingFocusFor: sourceHand = ( |
            | 
            isExpanded && [ contentsEditor isNotNil ] ifTrue: [contentsEditor beTypingFocusFor: sourceHand].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fComment: The body is the part created when you
expand the outliner.
Can be overridden and extended to
add e.g., module summary.
The body includes items (unboxed) followed by
boxedItems.\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildBody = ( |
            | 
            body: rowMorph copyTransparent.
            body  borderWidth: 0.
            body  baseMinHeight: 0.
            body  beFlexible.

            buildItemsHolder.

            indentSubParts ifTrue: [
              body addMorphLast: rigidSpacer copy
            ].
            body addMorphLast: items.
            recolor.
            body).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildCommentButton = ( |
            | 
            commentButton:  commentButtonMorph copyTarget: self
                                                   Action: commentButtonAction
                                                    Style: commentButtonStyle.
            "from exoSlotOutliner, needed for slicer"
            commentButton open layoutInPlace beRigidHorizontally close.
            comment isEmpty ifFalse: [commentButton open].
            commentButton).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildExpander = ( |
            | 
            model buildExpander).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildHeader = ( |
            | 
            header: rowMorph copyTransparent removeAllMorphs beFlexible borderWidth: 0.
            header borderWidth: 4.
            fillInHeader.
            header).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         buildSpacer = ( |
            | 
            transparentSpacerMorph copyH: 2).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fComment: use an editor so we can
update the object\'s title\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         buildTitle = ( |
            | 
            model buildTitle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         cancelChangingNameEditor: ed Event: evt = ( |
            | 
            isForEditingNew ifTrue: [^ removeFromEnclosingOutliner ].
            ed editMode: false.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         cancelComment: evt = ( |
            | 
            commentEditor clearPanel.
            updateComment.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         cancelCommentAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'cancelCommentAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutliner parent cancelCommentAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'cancelCommentAction' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancelComment: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelEditingContentsEditor: ed Event: evt = ( |
            | 
            ed contentsString: contentsString.
            ed clearPanel.
            update. "needed so that selection is restored -ma 3/02"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         cancelEditingWholeThingEditor: ed Event: event = ( |
            | 
            isPlaceHolder ifTrue: [
              enclosingOutlinerIfPresent: [^ removeFromEnclosingOutliner].
            ].
            removeMorph: wholeThingEditor.
            wholeThingEditor: nil.
            doneEditingWholeThing.
            initialize.
            update).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         changeTitleTo: newTitle Event: evt = ( |
            | 
            model changeTitleTo: newTitle Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         collapse: evt = ( |
            | 
            retractSuboutliners.
            resend.collapse: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         collapseAll: evt = ( |
            | 
            resend.collapseAll: evt.
            collapseBottomMorphs: evt.
            collapseTopMorphs: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: top and bottom feeders\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         collapseBottomMorphs: evt = ( |
            | 
            bottomMorphs ifNotNil: [
              model collapseBottomMorphs: evt
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: top and bottom feeders\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         collapseTopMorphs: evt = ( |
            | 
            topMorphs ifNotNil: [
              hideAnnotationInfo.
              hideComment.
              model collapseTopMorphs: evt
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "resend.colorAll: 
              preferredColor = prototype preferredColor
                ifTrue: [ newC ]
                 False: [ preferredColor ]"
            "REMEMBERTHIS"
             self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         comment = ( |
            | model comment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         comment: c = ( |
            | model comment: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         commentButtonAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'commentButtonAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutliner parent commentButtonAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'commentButtonAction' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target toggleComment: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         commentButtonStyle = ( |
            | model commentButtonStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         constructBoxedItems = ( |
            | 
            "no boxed items in pluggable outliners"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         constructItems = ( |
            | model constructItems).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsAccept = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'contentsAccept' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutliner parent contentsAccept.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'contentsAccept' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target
             acceptContents: source contentsString
                     Editor: source
                      Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsCancel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'contentsCancel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals pluggableOutliner parent contentsCancel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> 'contentsCancel' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            target cancelEditingContentsEditor: source Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsEditorPrototype = ( |
            | model contentsEditorPrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsEditorStyle = ( |
            | model contentsEditorStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsString = ( |
            | 
            model contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
             r.
            | 
            r: resend.copy.
            r initializeForModel: model copy.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyAsPlaceHolderForModel: m = ( |
            | 
            resend.copy bePlaceHolder initializeForModel: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForModel: m = ( |
            | 
            resend.copy initializeForModel: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         dismissCommentEditor = ( |
            | 
            isCommentCounterfactual ifTrue: [
              warnCounterfactualIfAbort: [^ self].
            ].
            hideComment).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         doneEditingWholeThing = ( |
            | 
            isEditingWholeThing: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editContents = ( |
            | 
            contentsEditor: 
                contentsEditorPrototype copyString: cachedContentsString
                                            Target: self 
                                            Accept: contentsAccept
                                            Cancel: contentsCancel
                                             Style: contentsEditorStyle.
              contentsEditor panel acceptButton isAsynchronous: true.
            addItem: contentsEditor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editTitle: evt = ( |
            | 
            bePlaceHolder.
            titleEditor beTypingFocusFor: evt sourceHand.
            titleEditor editor firstRow setTyper.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editTitle: evt WithContents: contents = ( |
            | 
            titleEditor contentsString: contents.
            editTitle: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editTitleIfChangedBy: aUserDefinedOperation Event: evt = ( |
             newContents.
             oldContents.
            | 
            oldContents: titleEditor contentsString.
            newContents: aUserDefinedOperation applyToString: oldContents.

            (oldContents = newContents) ifTrue: [^ self].
            editTitle: evt WithContents: newContents.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editWholeThing: event = ( |
            | 
            editWholeThing: event WithContents: model editWholeThingString.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editWholeThing: event WithContents: contents = ( |
            | 
            model areMorphsRemovedWhenEditingWholeThing
              ifTrue: [removeAllMorphs].
            isEditingWholeThing: true.
            wholeThingEditor: model buildWholeThingEditorMorphWithContents: contents.
            leftJustify.
            addMorphLast: wholeThingEditor.
            wholeThingEditor beTypingFocusFor: event sourceHand.
            wholeThingEditor text selectAll.
            wholeThingEditor resizeToText.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         editWholeThingIfChangedBy: aUserDefinedOperation Event: evt = ( |
             newContents.
             oldContents.
            | 
            oldContents: isEditingWholeThing
              ifFalse: [model editWholeThingString]
                 True: [wholeThingEditor contentsString].
            newContents: aUserDefinedOperation applyToString: oldContents.

            (oldContents = newContents) ifTrue: [^ self].
            isEditingWholeThing
              ifFalse: [editWholeThing: evt WithContents: newContents]
                 True: [wholeThingEditor contentsString: newContents].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: sub- and super- outliner accessing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingOutliner = ( |
            | 
            enclosingOutlinerIfPresent: [|:o|o]
               IfAbsent: [error: 'cannot do this from a view (yet)']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: sub- and super- outliner accessing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingOutlinerIfPresent: pb = ( |
            | 
            enclosingOutlinerIfPresent: pb IfAbsent: []).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: sub- and super- outliner accessing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         enclosingOutlinerIfPresent: pb IfAbsent: ab = ( |
             o.
            | 
            o: self.
            [
              o: o owner ifNil: [^ ab value].
              o isOutliner ifTrue: [^ pb value: o].
            ] loop).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fComment: Don\'t call me directly,
call my model\'s expand:.
Same for collapse:, expandAll: collapseAll: -- dmu 4/1\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         expand: evt = ( |
            | 
            resend.expand: evt.
            safelyDo: [updateDo: [|:m| m update]]. "outliners build things by updating"
            recolor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: building\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         fillInHeader = ( |
            | 
            header addMorphLast: buildSpacer.
            header addMorphLast: buildExpander.
            header addMorphLast: buildSpacer.
            header addMorphLast: buildTitle.
            header addMorphLast: buildSpacer.
            addCommentButtonToHeader.
            addButtonsToHeader.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         finishAddingDroppingMorph: m = ( |
            | 
            model finishAddingDroppingMorph: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         flush: evt = ( |
            | resend.flush: evt.
            model flushModel: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         fontColor = ( |
            | 
            model preferredTitleColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         fontSpec = ( |
            | 
            model preferredFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         headerButtonContents = ( |
            | 
            model headerButtonContents).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         headerButtonFontSpec = ( |
            | 
            model headerButtonFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         hideAnnotationInfo = ( |
            | 
            annotationInfo ifNil: [^ self].
            isAnnotationInfoCounterfactual ifTrue: [^ self].
            removeAnnotationInfoEvenIfCounterfactual).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         hideComment = ( |
            | 
            commentEditor ifNil: [^ self].
            isCommentCounterfactual ifTrue: [^ self].
            commentEditor delete.
            commentEditor: nil.
            comment isEmpty ifTrue: [ commentButton close].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeForModel: m = ( |
            | 
            body: nil.
            items: nil.
            itemsCached: false.
            titleEditor: nil.
            topMorphs: nil.
            bottomMorphs: nil.
            model: m beForOutliner: self.
            initialize.
            beShrinkWrap.
            model setAppearanceOfOutliner.
            recolor.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype initializeForModel: modelProtoForProto copy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isAnnotationInfoCounterfactual = ( |
            | 
                annotationInfo isNotNil
            && [annotationInfo isCounterfactual]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         isCommentCounterfactual = ( |
            | 
            commentEditor isNotNil && [commentEditor isCounterfactual]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
                 resend.isCounterfactual
            || [ isAnnotationInfoCounterfactual
            || [ isCommentCounterfactual
            || [ isTitleCounterfactual
            || [ isWholeThingCounterfactual ]]]]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: growing edges for world\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isEmbedded = ( |
            | owner isWorldMorph not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isForEditingNew = ( |
            | model isForEditingNew).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isPluggableOutliner = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing title\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isTitleCounterfactual = ( |
            | 
            titleEditor isNotNil && [titleEditor editMode]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         isWholeThingCounterfactual = ( |
            | 
            isEditingWholeThing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | 
            model justDroppedInto: w Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: layout\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         layoutChanged = ( |
            | recolor. resend.layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: annotationInfo  IsPresentDo: [|:n| annotationInfo: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | 
            model middleMouseDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: initializing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         modelProtoForProto = ( |
            | generalModel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: type tests (should override some)\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'pluggableOutliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: top and bottom feeders\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         newColumn = ( |
            | 
            (columnMorph copyTransparent leftJustify
            borderWidth: 0)
            baseMinHeight: 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: iterating outliners\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinersExpand: doExpand ThenDo: blk = ( |
            | 
            model outlinersExpand: doExpand ThenDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: sub- and super- outliner accessing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         outlinersFilteredBy: blk = ( |
             r.
            | 
            r: list copyRemoveAll.
            items isNotNil && isExpanded ifTrue: [
              items morphsDo: [|:o|
                o isOutliner && [blk value: o]  ifTrue: [r addLast: o].
              ].
            ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'outliner' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         preferences = ( |
            | error: 'pluggable outliners should use model').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         preferredColor = ( |
            | model preferredColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         preferredHeaderColor = ( |
            | model preferredHeaderColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         preferredTitleColor = ( |
            | model preferredTitleColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         receiveDroppingPointerToModel: m IfAccepted: aBlk = ( |
            | 
            model receiveDroppingPointerToModel: m
                                     IfAccepted: aBlk).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         recolor = ( |
            | 
            header color: model preferredHeaderColor.
            header morphsDo: [|:m|
              m isButton ifTrue: [
              m color: model preferredHeaderColor.
              m findMorphWithLabel ifNil: false IfNotNil: [|:l|
                 l color: model preferredTitleColor ]]].
            commentButton 
               colorButtonBackground: model preferredHeaderColor
                          Foreground: model preferredTitleColor.
            titleEditor ifNotNil: [ titleEditor labelColor: model preferredTitleColor].
            body ifNotNil: [body color: model preferredBodyColor].
            items ifNotNil: [items recolor].
            model recolorModuleSummary.
            "Tags only at top level"
            isRoot
               ifTrue: [
                  color: model preferredBorderColor.
                  tag color: model preferredTagColor]
                False: [
                  tag color: model preferredBodyColor.
                  color: model preferredBodyColor].
            expander color: model preferredTitleColor.
            bottomMorphs ifNotNil: [bottomMorphs morphsDo: [|:m| m recolor]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         removeAnnotationInfo = ( |
            | 
            isAnnotationInfoCounterfactual ifTrue: [
                annotationInfo warnCounterfactualIfAbort: [^ self].
            ].
            hideAnnotationInfo).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         removeAnnotationInfoEvenIfCounterfactual = ( |
            | 
            annotationInfo delete.
            annotationInfo: nil.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: sub- and super- outliner accessing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         removeFromEnclosingOutliner = ( |
            | 
            enclosingOutlinerIfPresent: [|:o|
              safelyDo: [o removeItem: self]
            ] IfAbsent: [].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         retract = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: expanding and collapsing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         retractSuboutliners = ( |
            | 
            items ifNotNil: [
              items morphsDo: [|:m|
                m isPluggableOutliner ifTrue: [m retractSuboutliners].
              ].
            ].
            retract).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showOrHideAnnotation = ( |
            | 
            annotationInfo
             ifNil: 'showAnnotation' IfNotNil: 'hideAnnotation').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         showOrHideComment = ( |
            | 
            commentEditor ifNil: 'showComment' IfNotNil: 'hideComment').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showSlot: slot Event: evt = ( |
            | 
            showSlot: slot Event: evt IfFail: raiseError).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fComment: open up categories in order to show slot named name.
Return the slot outliner.\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         showSlot: slot Event: evt IfFail: failBlock = ( |
            | 
            showSlotOnce: slot Event: evt IfFail: [
              safelyDo: [ update ]. "ensure slot is there!"
              showSlotOnce: slot Event: evt IfFail: failBlock
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fComment: open up categories in order to show slot named name

return the slot outliner\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         showSlotOnce: slot Event: evt IfFail: failBlock = ( |
             cats.
             current.
             s.
            | 
            "if fails, try updating and sending again!"

            s: model slotForShowing: slot IfFail: [|:e| ^ failBlock value: e].
            cats: s categories.
            model expand: evt.
            current: self.
            cats do: [|:c|
              current model categoryOutliners
                 findFirst: [|:o| o model categoryList last = c]
                 IfPresent: [|:o| current: o.  o model expand: evt]
                  IfAbsent: [^ failBlock value: c, ' not found']
            ].
            current slotOutlinerFor: s IfFail: [failBlock value: s name, ' not found']).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         slotOutlinerFor: slot IfFail: failBlk = ( |
            | 
            model slotOutliners do: [|:o | 
              o model slot isNotNil && [o model slot = slot]  ifTrue: [ ^ o]
            ].
            failBlk value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | 
            model printString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: animation\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
            | model step).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         stopBeingPlaceHolder = ( |
            | isPlaceHolder: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOff: evt = ( |
             savedEnclosingOutliner.
            | 
            enclosingOutlinerIfPresent: [|:o| savedEnclosingOutliner: o].
            isCounterfactual ifTrue: [
              warnCounterfactualIfAbort: [^ self].
            ].
            tearOffCopy: evt.
            model removeForTearingOff.
            "What does the following block do? -ma"
            "I think it may still be needed. -- dmu 1/02"
            owner isNil || [owner isWorldMorph]
              ifTrue: [ safelyDo: [update] ]
               False: [ safelyDo: [delete] ].
            savedEnclosingOutliner ifNotNil: [safelyDo: [savedEnclosingOutliner update]].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         tearOffCopy: evt = ( |
             o.
            | 
            o: model outlinerForTearOffCopy: evt.
            o model willInsertMyselfWhenDropped: true.
            o position: globalPosition.
            o beShrinkWrap.
            safelyDo: [ evt sourceHand attach: o ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         titleString = ( |
            | model titleString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         titleStyle = ( |
            | model titleStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         toggleComment: evt = ( |
            | 
            commentEditor
              ifNil:    [ addCommentEditorFor: evt sourceHand ]  
              IfNotNil: [ dismissCommentEditor ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: unfolding\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         unfold: slot Event: evt IfFail: failBlock = ( |
             theSlotOutliner.
            | 
            theSlotOutliner:  showSlot: slot Event: evt IfFail: [|:e| ^ failBlock value: e].
            theSlotOutliner model expand: evt.
            theSlotOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         updateAnnotationInfo = ( |
            | 
            annotationInfo ifNotNil: [
              annotationInfo update.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         updateBottomDo: blk = ( |
            | 
            bottomMorphs ifNil: [^ self].
            bottomMorphs morphCount = 0  ifTrue: [
              bottomMorphs delete.
              bottomMorphs: nil.
            ]
            False: [
              bottomMorphs morphsDo: [|:m|
                 m isOutliner ifTrue: [blk value: m]
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: comment\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: private'
        
         updateComment = ( |
            | 
            case 
                 if:   [commentButton isNil]
                 Then: []
                 If:   [commentButton isOpen not && [comment isEmpty not]]
                 Then: [commentButton open]
                 If:   [commentEditor isNil] 
                 Then: []
                 If:   [ commentEditor isCounterfactual ]
                 Then: []
                 If:   [commentEditor contentsString = comment]
                 Then: []
                 Else: [ commentEditor setText: comment.  
                         commentEditor clearPanel. 
                         commentEditor frameStyle: insetBezelStyle ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         updateContentsEditor = ( |
            | 
            isExpanded ifFalse: [^ self]. 
            contentsEditor ifNil: [^ self].
            contentsEditor isCounterfactual ifTrue: [^ self].
            model updateContentsEditor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         updateDo: blk = ( |
            | 
            updateTitle.
            updateAnnotationInfo.
            updateComment.
            updateContentsEditor.
            updateTopDo: blk.
            isExpanded ifTrue: [ updateItemsDo: blk ].
            updateBottomDo: blk.
            resend.updateDo: blk.
            model updateDo: blk.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: plug-in operations\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         updateItemsDo: blk = ( |
            | model updateItemsDo: blk. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         updateTheme = ( |
            | 
            recolor.
            layoutChanged.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         updateTitle = ( |
             str <- ''.
            | 
            titleEditor ifNil: [^ self].
            titleEditor editMode  ifTrue: [^ self].
            titleEditor style = titleStyle  ifFalse: [
              titleEditor style: titleStyle
            ].
            titleEditor string = titleString  ifFalse: [
              titleEditor string: titleString.
              titleEditor editMode: false.
            ].
            titleEditor updateLabels.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: updating\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot'
        
         updateTopDo: blk = ( |
            | 
            topMorphs ifNil: [^ self].
            topMorphs morphCount = 0  ifTrue: [
              topMorphs delete.
              topMorphs: nil.
            ]
            False: [
              topMorphs morphsDo: [|:m|
                 m isOutliner ifTrue: [blk value: m]
              ]
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: dropping\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         wantsMorph: m Event: evt = ( |
            | model wantsMorph: m Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> 'parent' -> () From: ( | {
         'Category: tearing off\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         yankOutliner: event = ( |
            | 
            delete.
            event sourceHand attach: self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: filing out\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         prototype = ( |
            | 
            pluggableOutliner).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: editors\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         titleEditor <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: other pieces\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         topMorphs.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'pluggableOutliner' -> () From: ( | {
         'Category: Pluggable Outliner State\x7fCategory: editors\x7fModuleInfo: Module: pluggableOutliner InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         wholeThingEditor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: classification\x7fModuleInfo: Module: pluggableOutliner InitialContents: FollowSlot\x7fVisibility: public'
        
         isPluggableOutliner = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 



 '-- Side effects'

 globals modules pluggableOutliner postFileIn
