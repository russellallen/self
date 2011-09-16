 '$Revision: 30.22 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptCancelPanel = bootstrap define: bootstrap stub -> 'globals' -> 'acceptCancelPanel' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'acceptCancelPanel' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals acceptCancelPanel.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         acceptButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cancelButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         column.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptCancelPanel = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits acceptCancelPanel.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         spacer.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         antMorph = bootstrap define: bootstrap stub -> 'globals' -> 'antMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals imageMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'antMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals antMorph.

CopyDowns:
globals imageMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         from <- (10)@(10).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         antMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits antMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'antMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         to <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'buttonEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'buttonEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals buttonEditorMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonEditorMorph' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         acceptAction.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonEditorMorph' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelAction.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits buttonEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'buttonEditorMorph' -> () From: ( | {
         'Category: actions\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         commentMorph = bootstrap define: bootstrap stub -> 'globals' -> 'commentMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals editorMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'commentMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals commentMorph.

CopyDowns:
globals editorMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         acceptAction.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         commentMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits commentMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'commentMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         dialogBoxMorph = bootstrap define: bootstrap stub -> 'globals' -> 'dialogBoxMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dialogBoxMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dialogBoxMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         acceptAction.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cancelAction.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         lines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         dialogBoxMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits dialogBoxMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         dotMorph = bootstrap define: bootstrap stub -> 'globals' -> 'dotMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals imageMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'dotMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals dotMorph.

CopyDowns:
globals imageMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         dotMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'dotMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits dotMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'dotMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'dotMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expanderMorph = bootstrap define: bootstrap stub -> 'globals' -> 'expanderMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals polygonMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals expanderMorph.

CopyDowns:
globals polygonMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         action.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isExpanded <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expanderMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits expanderMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'expanderMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         methodExpanderMorph = bootstrap define: bootstrap stub -> 'globals' -> 'methodExpanderMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals morph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'methodExpanderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals methodExpanderMorph.

CopyDowns:
globals morph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodExpanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (false)\x7fVisibility: private'
        
         isExpanded <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         methodExpanderMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits methodExpanderMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodExpanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'methodExpanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         outlinerWidgets = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules outlinerWidgets.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         myComment <- 'widget morphs used by the outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            acceptCancelPanel   initializePrototype.
            expanderMorph       initializePrototype.
            methodExpanderMorph initializePrototype.
            dialogBoxMorph      initializePrototype.
            penMorph            initializePrototype.
            dotMorph            initializePrototype.
            antMorph            initializePrototype.
            buttonEditorMorph   initializePrototype.
            smallEditorMorph    initializePrototype.
            slotNameEditorMorph initializePrototype.
            commentMorph        initializePrototype.
            notifyingCommentMorph initializePrototype).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.22 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'outlinerWidgets' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'complexButtonMorph
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
             s.
            | 
            s: ''.
            firstRow allRowsDo: [| :r | s: s & r contentsString ].
            s flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString: s = ( |
            | 
            setString: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: str Target: tar Accept: accept Style: style = ( |
            | 
            ((copy target: tar) acceptAction: accept)
              initializeString: str Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            resend.initializePrototype.
            beShrinkWrap.
            firstRow beShrinkWrap.
            firstRow baseMinWidth: 100.
            firstRow baseMinHeight: 10.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeString: str Style: style = ( |
             t.
            | 
            color: style color.
            t: typer.
            t fontColor: style fontColor.
            t fontSpec: style fontSpec.
            appendString: str.
            firstRow removeTyper.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [|:n| target: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'commentMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseLeftEditor: evt = ( |
            | 
            firstRow removeTyper.
            acceptAction actionFrom: self Target: target Event: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'commentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'editorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         notifyingCommentMorph = bootstrap define: bootstrap stub -> 'globals' -> 'notifyingCommentMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals commentMorph copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'notifyingCommentMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals notifyingCommentMorph.

CopyDowns:
globals commentMorph. copy 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         notifyingCommentMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits notifyingCommentMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'notifyingCommentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         penMorph = bootstrap define: bootstrap stub -> 'globals' -> 'penMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals imageMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'penMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals penMorph.

CopyDowns:
globals imageMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         penMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'penMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits penMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'penMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'penMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         smallEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals rowMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smallEditorMorph.

CopyDowns:
globals rowMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         accept.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedFontColor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         cachedFontSpec.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         cachedString <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         cancelAction <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> 'cancelAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals smallEditorMorph cancelAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> 'cancelAction' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | 
            source editMode: source false.
            source editor clear.
            source editor appendString: source stringForEditing).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (false)\x7fVisibility: public'
        
         isAsynchronous <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         panel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         smallEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits smallEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'smallEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         rawEditMode <- bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         savedColor <- paint named: 'lightGray'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         string <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         style <- bootstrap stub -> 'globals' -> 'slotOutlinerPreferences' -> 'undeclaredSlotStyle' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (\'\')\x7fVisibility: private'
        
         updateLabelsCache <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         addEditor = ( |
            | 
            removeAllMorphs.
            editor: editorMorph copy color: style color.
            typer fontSpec:  style fontSpec.
            typer fontColor: style fontColor.
            editor appendString: stringForEditing.
            editor firstRow removeTyper.

            "set styles so typer will be right"
            editor firstRow defaultFontSpec:  style fontSpec.
            editor firstRow defaultFontColor: style fontColor.

            addMorphLast: editor.
            panel: acceptCancelPanel copyTarget: target
                                         Source: self
                                         Accept: accept
                                         Cancel: cancelAction
                                         Style:  style.
            panel acceptButton isAsynchronous: isAsynchronous.
            addMorphLast: panel.
            editor baseMinWidth: (150 max: editor baseBounds width)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         addLabels = ( |
             lines.
            | 
            removeAllMorphs.
            panel: nil.
            lines: textLines copyLines: string.
            lines size <= 1 ifTrue: [
              addMorphLast: labelMorph copyLabel: string
                                        FontSpec: style fontSpec
                                           Color: color textColorForBackground
            ] False: [| col |
              col: (columnMorph copy leftJustify beShrinkWrap borderWidth: 0) color: color.
              lines do: [| :l |
                col addMorphLast: labelMorph copyLabel: l
                                              FontSpec: style fontSpec
                                                 Color: color textColorForBackground
              ].
              addMorphLast: col
            ].
            cachedString: string.
            cachedFontColor: style fontColor.
            cachedFontSpec: style fontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         beTypingFocusFor: hand = ( |
            | 
            editMode: true.
            editor beTypingFocusFor: hand.  
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'Comment: override to save my (non-edit color)\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         color: c = ( |
            | 
            savedColor: c.
            resend.color: c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
             s.
            | 
            editMode ifFalse: [^string].
            s: ''.
            editor firstRow allRowsDo: [| :r | s: s & r contentsString ].
            s flatString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString: str = ( |
            | 
            str = contentsString  ifTrue: [^ self].
            editMode: true.
            editor contentsString: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: str = ( |
            | 
            copyString: str Style: ( | color = paint. fontName = 'helvetica'. fontSize = 10 | )).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: str Style: sty = ( |
            | 
            (((copy string: str) target: nil) style: sty) initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: str Target: tar Accept: accept Cancel: cancel Style: sty = ( |
            | 
            (((((copy target: tar) string: str) accept: accept) style: sty)
              cancelAction: cancel)
              initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: str Target: tar Accept: accept Style: sty = ( |
            | 
            ((((copy target: tar) string: str) accept: accept) style: sty)
              initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: evt OnBaseAt: globalPt = ( |
            | 
            "Ignore all events if receiver has no target."
            nil = target ifTrue: [ ^dropThroughMarker ].
            resend.dropEvent: evt OnBaseAt: globalPt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
            editMode not || [nil = target] ifTrue: [ ^dropThroughMarker ].
            e keyDown && [ e metaIsDown ] && [ e keystrokes = '\r' ] ifTrue: [
              accept actionFrom: self Target: target Event: e.
              ^handledBlock value].
            resend.dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         editMode = ( |
            | rawEditMode).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         editMode: value = ( |
            | 
            nil = target     ifTrue: [^self].
            editMode = value ifTrue: [^self].
            value ifTrue: [ | sc |
              sc: color.
              color: paint named: 'black'.
              savedColor: sc.
              addEditor.
            ] False: [
              color: savedColor.
              addLabels
            ].
            rawEditMode: value.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initialize = ( |
            | 
            color: style color.
            addLabels).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: paint named: 'lightGray'.
            rawEditMode: false.
            borderWidth: 1.
            beShrinkWrap).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
            panel isNotNil && [panel isActive]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isSmallEditorMorph = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick: evt = ( |
            | editMode ifFalse: [
                editMode: true.
                editor leftMouseDown: evt.
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            editMode ifTrue: [^ editor leftMouseDown: evt].
            resend.leftMouseDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [|:n| target: n].
            dict if: editor IsPresentDo: [|:n| editor: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'smallEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         selectAll = ( |
            | 
            editMode: true.
            editor selectAll.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionStart: s End: e = ( |
            | 
            editor selectionStart: s End: e.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         stringForEditing = ( |
            | string).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         typer = ( |
            | 
            editor typer).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'smallEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         updateLabels = ( |
            | 
                (cachedString = string)
            && [(cachedFontColor = style fontColor)
            && [ cachedFontSpec = style fontSpec]]
             ifTrue: [^ self].
            addLabels).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fComment: Special smallEditorMorph for
showing and editing slot names in the outliner.
-- Ungar, 6/20/95\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         slotNameEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'slotNameEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             bootstrap remove: 'string' From:
             globals smallEditorMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'slotNameEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals slotNameEditorMorph.

CopyDowns:
globals smallEditorMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype string.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fComment: Special smallEditorMorph for
showing and editing slot names in the outliner.
-- Ungar, 6/20/95\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         slotNameEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits slotNameEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         slot.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         textViewerMorph = bootstrap define: bootstrap stub -> 'globals' -> 'textViewerMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'textViewerMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals textViewerMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textViewerMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)'
        
         closeButton.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textViewerMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)'
        
         editor.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         textViewerMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( |
             {} = 'Comment: A textViewerMorph is a stand-alone text editor containing
     arbitrary text. It has a title and it can be collapsed to
     save space. It is opened by double-clicking on it. It is
     closed the the close button in the upper right corner.\x7fModuleInfo: Creator: traits textViewerMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textViewerMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'textViewerMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textViewerMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (\'\')'
        
         text <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'textViewerMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (\'Untitled\')'
        
         title <- 'Untitled'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyTextEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'uglyTextEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals frameMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uglyTextEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uglyTextEditorMorph.

CopyDowns:
globals frameMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)'
        
         accept.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)'
        
         panel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyTextEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( |
             {} = 'Comment: An optimized editor for text only\x7fModuleInfo: Creator: traits uglyTextEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)'
        
         target.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: InitializeToExpression: (nil)'
        
         text.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: slider\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         addSlider = ( |
            | 
            lastMorph addMorphLast:
               buildSliderTarget: text 
                        Selector: 'scroll:' 
                           Color: color asEnhancedColorForBackground: color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         amIATypingFocus = ( |
            | text amIATypingFocus).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: text manipulation\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         appendString: str = ( |
            | 
            text appendString: str.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: typing focus\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         beTypingFocusFor: sourceHand = ( |
            | 
            text beTypingFocusFor: sourceHand. self.
            changed. "must redraw resize box"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: slider\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         buildSliderTarget: t Selector: sel Color: c = ( |
             f.
             s.
            | 
            s: sliderMorph copy colorAll: c.
            s selector: sel.
            s maxValue: 1.0.

            "connect slider to target"
            s target: t.
            t slider: s.

            f: frameMorph copy color: c.
            f  borderWidth: 1.
            f  beShrinkWrapHorizontally.
            f  beFlexibleVertically.
            f  addMorphLast: s.
            f).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: text manipulation\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString = ( |
            | text contentsString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString: s = ( |
            | setText: s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: copying\x7fComment: Creates an evaluator wth a horizontal row acroww the top
containing a little close button and a label.
As used to make evaluators. -- Randy, 2/2/95\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyCancelOnlyString: string Target: tar Style: style Label: lbl = ( |
             button.
             lblMorph.
             new.
             panel.
             x.
            | 

            new: copy target: tar.

               "Make a little X marker morph to put in close box..."
            x: labelMorph copy.
            x label: 'X'.
            x fontSpec: globals fontSpec copyName: 'helvetica' Size: 8 Style: 'bold'.

            button: ui2Button copy.
            button scriptBlock: [target delete].
            button target: new.
            button color: style color.
            button addMorph: x.

            lblMorph: (labelMorph copyLabel: lbl).
            lblMorph fontSpec: style smallFontSpec.

            panel: rowMorph copy.
            panel borderWidth: 0.
            panel color: style color.
            panel beShrinkWrapVertically.
            panel addMorphFirst: button.
            panel addMorphLast: lblMorph.

            new initializeString: string
                          HPanel: panel
                           Style: style.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: copying\x7fComment: Creates an evaluator wth a horizontal row acroww the top
containing a little close button and a label.
As used to make evaluators. -- Randy, 2/2/95\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyLabeled: lbl String: string Target: tar Style: style = ( |
             lblMorph.
             new.
             panel.
            | 

            new: copy target: tar.

            lblMorph: (labelMorph copyLabel: lbl).
            lblMorph fontSpec: style smallFontSpec.

            panel: rowMorph copy.
            panel borderWidth: 0.
            panel color: style color.
            panel beShrinkWrapVertically.
            panel addMorphLast: lblMorph.

            new initializeString: string
                          HPanel: panel
                           Style: style.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: string Style: style = ( |
            | 
            copy initializeString: string Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: string Target: tar Accept: acc Cancel: cancel Style: style = ( |
             new.
            | 
            new: (copy target: tar) accept: acc.
            new panel:
                  acceptCancelPanel copyTarget: tar
                                        Source: new
                                        Accept: acc
                                        Cancel: cancel
                                         Style: style.
            new  initializeString: string
                            Panel: new panel
                            Style: style.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: slider\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteSlider = ( |
            | text slider owner delete. text slider: nil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         drawOn: aCanvas = ( |
            | 
            resend.drawOn: aCanvas.
            drawResizeBoxOn: aCanvas Highlight: amIATypingFocus.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         drawResizeBoxOn: aCanvas Highlight: hi = ( |
             box.
             boxColor.
             corner.
             width = 9.
            | 
            corner: baseBounds bottomRight - 2.
            boxColor: text backgroundColor textColorForBackground.
            hi ifFalse: [boxColor: boxColor asSubduedColorForBackground: text backgroundColor].
            aCanvas fillPolygon: (((corner x - width)@corner y) &
                                  (corner x@corner y) &
                                  (corner x@(corner y - width))) asVector
                          Color: boxColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: event dispatching\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock = ( |
            | 
             "Catch key down <meta><return>"
            e keyDown && [ e metaIsDown ] && [ e keystrokes = '\r' ] ifTrue: [
              accept actionFrom: self Target: target Event: e.
            ^ handledBlock value].

            "Enable resizing when mouseDown in lower right"
            e leftMouseDown && [ inResizeArea: e cursorPoint ] ifTrue: [
              resizeFromHand: e sourceHand.
            ^ handledBlock value].

            resend.dropEvent: e OnSubmorphsAt: globalPt IfHandled: handledBlock).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         inResizeArea: pt = ( |
             corner.
             res.
             width = 7.
            | 
            corner: (globalBounds bottomRight - 2) - (width@0).
            (corner y - pt y) <= (pt x - corner x)).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         initializeString: string HPanel: panel Style: style = ( |
             divider.
             row.
            | 
             color: style color.
             borderWidth: 2.
             frameStyle: insetBezelStyle.
             beRigid.

            text: ui2_textField copy color: color.
            text beFlexible.
            text setText: string.

            divider: frameMorph copy.
            divider frameStyle: divider insetBezelStyle.
            divider borderWidth: 1.
            divider baseMinHeight: 0.
            divider beShrinkWrapVertically.
            divider beFlexibleHorizontally.
            divider color: style color.

            row: rowMorph copy color: color.
            row borderWidth: 1.
            row  addMorphLast: text.
            panel ifNotNil: [ addMorphLast: panel].
            addMorphLast: divider.
            addMorphLast: row.
            resizeToText. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeString: string Panel: panel Style: style = ( |
             row.
            | 
            color: style color.
            borderWidth: 2.
            frameStyle: insetBezelStyle.
            beRigid.

            text: ui2_textField copy colorAll: color.
            text  beFlexible.
            text  setText: string.
            row: rowMorph copy color: color.
            row  borderWidth: 0.
            panel ifNotNil: [row  addMorphLast: panel].
            row  addMorphLast: text.
            addMorphLast: row.
            resizeToText. 
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeString: string Style: style = ( |
            | 
            initializeString: string Panel: nil Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: panel\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isCounterfactual = ( |
            | 
            panel isNotNil && [panel isActive]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: event dispatching\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         leftMouseDown: evt = ( |
            | 
            "dropEvent... has already subscribed,
             just keep this from lifting up the morph"
             (inResizeArea: evt cursorPoint) ifTrue: [^ self].
            resend.leftMouseDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: target IsPresentDo: [|:n| target: n].
            dict if: text   IsPresentDo: [|:n| text: n].
            dict if: panel  IsPresentDo: [|:n| panel: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: resizing\x7fComment: Don\'t make the minimum size limit any smaller than 115@30 -- John\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         minSize = (115)@(30).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'uglyTextEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         mouseMove: evt = ( |
             newSize.
            | 
            changed.
            newSize: (evt cursorPoint  - globalPosition) max: minSize.
            setWidth: newSize x Height: newSize y.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: positioning\x7fComment: p must be an absolute point (i.e. global screen position,
not relative to the editor\'s origin).\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         ptToGrid: p = ( |
            | 
            text ptToGrid: p - globalPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Comment: set recevier for do it , get it
-- Ungar, 12/26/94\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         receiver: mir = ( |
            | 
            text receiver: mir).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         resizeAfterKeystroke = ( |
            | 
            "called after every keystroke,
              in order to attempt resize"

            text inView ifFalse: [resizeToText].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeFromHand: h = ( |
            | 
            h subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeToMinimum = ( |
            | 
            setWidth: minSize x Height: minSize y).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: resizing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         resizeToText = ( |
             acceptCancelPanelWidth = 15.
             borderHeight = 4.
             borderWidth = 4.
             sizeOfText.
            | 
            sizeOfText: text sizeForResizeToText.
            setWidth: (sizeOfText x + borderWidth + acceptCancelPanelWidth)
              Height: (sizeOfText y + borderHeight).
            text scrollIntoView. 

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: panel\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         selectionHasChanged = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: text manipulation\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         setText: str = ( |
            | 
            text setText: str.
            text goto: 1000@1000.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> () From: ( | {
         'Category: panel\x7fComment: Invoked whenever the text has changed\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         textHasChanged = ( |
            | 
            resizeAfterKeystroke.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyMethodEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'uglyMethodEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals uglyTextEditorMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uglyMethodEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uglyMethodEditorMorph.

CopyDowns:
globals uglyTextEditorMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyMethodEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uglyMethodEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'Category: panel\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         activatePanel = ( |
            | 
            panel isActive ifFalse: [
              frameStyle: insetBezelStyle.
              panel isActive: true.
              changed
            ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'Category: panel\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         clearPanel = ( |
            | 
            panel isActive ifTrue: [
              frameStyle: flatStyle.
              panel isActive: false.
              changed
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeString: string Panel: panel Style: style = ( |
            | 
            resend.initializeString: string Panel: panel Style: style.
            panel isActive: false.
            frameStyle: flatStyle.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'uglyMethodEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyTextEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> () From: ( | {
         'Category: panel\x7fComment: Invoked whenever the text has changed\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         textHasChanged = ( |
            | 
            resend.textHasChanged.
            activatePanel).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyActivationEditorMorph = bootstrap define: bootstrap stub -> 'globals' -> 'uglyActivationEditorMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             bootstrap remove: 'prototype' From:
             globals uglyMethodEditorMorph copyRemoveAllMorphs ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uglyActivationEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uglyActivationEditorMorph.

CopyDowns:
globals uglyMethodEditorMorph. copyRemoveAllMorphs 
SlotsToOmit: parent prototype.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         uglyActivationEditorMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uglyActivationEditorMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uglyActivationEditorMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uglyActivationEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyActivationEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "See comment in traits morph for general idea.
             Here, do not allow the buttons in me to get color changed."

            color: newC.
            spacer colorAll: newC.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: target Accept: accept Cancel: cancel = ( |
            | 
            copyTarget: target Accept: accept Cancel: cancel Style: outlinerPreferences).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: target Source: source Accept: accept Cancel: cancel Active: active Style: style = ( |
             new.
            | 
            new: copy.
            new color: style color.
            new acceptButton: pushButton copyTarget: target 
                                             Source: source
                                             Action: accept
                                              Style: style acceptButtonStyle.
            new cancelButton: pushButton copyTarget: target
                                             Source: source
                                             Action: cancel
                                              Style: style cancelButtonStyle.
            new column:  columnMorph copy color: style color.
            new column beFlexibleVertically.
            new column beRigidHorizontally.
            new column setWidth: 9.
            new column borderWidth: 0.
            new spacer:  spacerMorph copyH: 5 Color: style color.
            new isActive: active.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: target Source: src Accept: accept Cancel: cancel Style: style = ( |
            | 
            copyTarget: target Source: src Accept: accept Cancel: cancel Active: true Style: style).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         initialize: style = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: paint named: 'black'.
            borderWidth: 0.
            beFlexibleVertically.
            beRigidHorizontally.
            setWidth: 15.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive = ( |
            | morphCount != 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isActive: bool = ( |
            | 
            bool ifTrue: [
              isActive not && [acceptButton isMorph] && [cancelButton isMorph] ifTrue: [
                column addMorphLast: acceptButton. 
                column addMorphLast: cancelButton.
                addMorphLast: column.
                addMorphLast: spacer.
                layoutFix
              ]
            ] False: [
              safelyDo: [removeAllMorphs. column removeAllMorphs].
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         layoutFix = ( |
            | 
            column morphsDo: [| :m | m firstMorph beFlexible. m beFlexible. ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            "Because these need not be visible we must force the copy if necessary"
            dict
                       if: column
              IsPresentDo: [|:n| column: n]
               IfAbsentDo: [column: column copyUsingMap: dict].
            dict
                       if: acceptButton
              IsPresentDo: [|:n| acceptButton: n]
               IfAbsentDo: [acceptButton: acceptButton copyUsingMap: dict].
            dict
                       if: cancelButton
              IsPresentDo: [|:n| cancelButton: n]
               IfAbsentDo: [cancelButton: cancelButton copyUsingMap: dict].
            dict
                       if: spacer
              IsPresentDo: [|:n| spacer: n]
               IfAbsentDo: [spacer: spacer copyUsingMap: dict].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'acceptCancelPanel'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'acceptCancelPanel' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyMove: f To: t = ( |
             new.
            | 
            new: copy.
            new from: f.
            new to:   t.
            new position: f.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            setImage: ui2Image copyPixelLines: (
                    '        1       ' &
                    '     1    1     ' &
                    '       1    1   ' &
                    '    1    1      ' &
                    '      1    1    ' &
                    '        1       ' &
                    '     1    1     ' &
                    '       1    1   ' &
                    '         1      ' &
                    '      1         ' ) asVector
                Colors: (
                    (paint named: 'red')   &
                    (paint named: 'black') &
                    (paint named: 'black') ) asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         justDroppedInto: w Event: evt = ( |
            | isInWorld ifTrue: [ startGettingStepped ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'antMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         move: pt = ( |
            | 
            changed.
            position: pt.
            changed.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'imageMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'antMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         step = ( |
             delta = 5.
             p.
            | 
            p: position.
            p = to     ifTrue: [move: from].
            p x < to x ifTrue: [move: (p x + delta) @ p y].
            p x > to x ifTrue: [move: (p x - delta) @ p y].
            p y < to y ifTrue: [move: p x @ (p y + delta)].
            p y > to y ifTrue: [move: p x @ (p y - delta)].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: str Target: tar Accept: accept Cancel: cancel = ( |
            | 
            copyString: str Target: tar Accept: accept Cancel: cancel Style: outlinerPreferences).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyString: str Target: target Accept: accept Cancel: cancel Style: style = ( |
             new.
            | 
            new: copy.
            new  panel: acceptCancelPanel copyTarget: self 
                                              Accept: accept
                                              Cancel: cancel
                                               Style: style.
            new  initializeString: str Style: style.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            borderWidth: 1.
            beFlexible.
            color: paint named: 'black').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         initializeString: str Style: style = ( |
            | 



            r addMorphLast: c.
             editMorph: editorMorph copy.

                  "Preserve the font in the editor"
                  typer: editMorph typer.
                  typer fontSpec:  fontSpec.
                  typer fontColor: fontColor.

                  editMorph appendString: string.

                  editMorph beShrinkWrap.
                  editMorph firstRow beShrinkWrap.
                  "editMorph firstRow baseMinWidth: 250."
                  r addMorphLast: editMorph).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'buttonEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'buttonEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'rowMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: ui2\x7fCategory: Programming Environment\x7fCategory: Widgets\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         clockMorph = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'clockMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits clockMorph.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyText: str = ( |
            | 
            copyText: str Target: nil Accept: defaultAction Cancel: defaultAction).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyText: str Target: t Accept: act = ( |
            | 
            copyText: str Target: t Accept: act Cancel: defaultAction).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyText: str Target: t Accept: act Cancel: can = ( |
            | 
            (((copy target: t) acceptAction: act) cancelAction: can) initializeText: str).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         defaultAction = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> 'defaultAction' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits dialogBoxMorph defaultAction.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> 'defaultAction' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         actionFrom: source Target: target Event: evt = ( |
            | source delete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         getLabel: str = ( |
             labelRow.
             labelRowLabel.
            | 
            labelRow: rowMorph copy color: color.
            labelRow beFlexible borderWidth: 1.
            labelRowLabel: labelMorph copyLabel: str.
            labelRowLabel fontSpec: globals fontSpec copyName: 'verdana' Size: outlinerPreferences fontSpec size Style: 'bold'.
            labelRow addMorphLast: labelRowLabel.
            labelRow).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            removeAllMorphs.
            color: frameMorph color copyBrightness: 1.1.
            beShrinkWrap.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeText: str = ( |
             c.
             f.
             r.
            | 
            r: rowMorph copy color: color.
            r beFlexible borderWidth: 0.
            addMorphLast: r.
            r addMorphLast: acceptCancelPanel copyTarget: target
                                              Source: self
                                              Accept: acceptAction
                                              Cancel: cancelAction
                                               Style: outlinerPreferences.
            f: frameMorph copy color: color.
            f beFlexible borderWidth: borderWidth.
            f frameStyle: f insetBezelStyle.
            c: columnMorph copy color: color.
            c beFlexible borderWidth: 0.
            f addMorphLast: c.
            lines: columnMorph copy color: color.
            (textLines copyLines: str) do: [| :l |
               lines addMorphLast: getLabel: l
            ].
            c addMorphLast: lines.
            r addMorphLast: f.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [|:n| target: n].
            dict if: lines  IsPresentDo: [|:n| lines:  n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'dialogBoxMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dialogBoxMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dotMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            setImage: ui2Image copyPixelLines: (
                    '                ' &
                    '                ' &
                    '      1111      ' &
                    '    11000011    ' &
                    '   1000000001   ' &
                    '   1001111001   ' &
                    '  100111111001  ' &
                    '  100111111001  ' &
                    '  100111111001  ' &
                    '  100111111001  ' &
                    '   1001111001   ' &
                    '   1000000001   ' &
                    '    11000011    ' &
                    '      1111      ' &
                    '                ' &
                    '                ' ) asVector
                Colors: (
                    (paint named: 'white') &
                    (paint named: 'black') &
                    (paint named: 'black') ) asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dotMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'dotMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'dotMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'imageMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         baseCopy = ( |
            | resend.baseCopy).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | 
            isExpanded: false.
            setShape: collapsedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         collapsedOffsets = ( |
            | 
            ((6@5) & (0@10)) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         collapsedSize = ( |
            | sizeForOffsets: collapsedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         colorAll: newC = ( |
            | 
            "See comment in traits morph for general idea.
             Here, for legibility do not change color."

            morphsDo: [| :m | m colorAll: newC ].
            color: normalColorFor: newC.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t Action: act = ( |
            | (copy target: t) action: act).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | 
            isExpanded: true.
            setShape: expandedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         expandedOffsets = ( |
            | 
            ((5@10) & (-5@5)) asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expandedSize = ( |
            | sizeForOffsets: expandedOffsets).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: paint named: 'black'.
            collapse: ui2Event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         isInMe: evt = ( |
            | 
            owner ifNil: [^ false].
            baseContainsPt: evt cursorPoint - owner globalPosition).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftDoubleClick: evt = ( |
            | 
            "already got a single click, just do action"
            action actionFrom: self Target: target Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | 
            color: pressedColor.
            evt sourceHand subscribeUntilAllUp: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseUp: evt = ( |
            | 
            color: normalColor.
            (isInMe: evt) ifFalse: [^ self].
            isExpanded ifTrue: [ collapse: evt ] False: [ expand: evt ].
            color: normalColor.
            changed.
            action actionFrom: self Target: target Event: evt.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            resend.mapReferencesUsing: dict.
            dict if: target IsPresentDo: [|:n| target: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         maxSize = ( |
            | collapsedSize max: expandedSize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'expanderMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mouseMove: evt = ( |
            | 
            color: (isInMe: evt) ifTrue: [pressedColor] False: [normalColor]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         normalColor = ( |
            | 
            owner ifNil: [^ paint named: 'black'].
            normalColorFor: owner color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         normalColorFor: bgColor = ( |
            | bgColor outlineColorForBackground).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'polygonMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         pressedColor = ( |
            | 
            "normalColor outlineColorForBackground"
            "above didn't show up enough"
            paint named: 'red').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         setShape: newOffsets = ( |
            | 
            changed.
            vertexOffsets: newOffsets.
            layoutChanged).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'expanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         sizeForOffsets: offs = ( |
             maxp <- (0)@(0).
             minp <- (0)@(0).
            | 
            offs do: [|:p|
              minp: p min: minp.
              maxp: p max: maxp.
            ].
            maxp - minp).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: drawing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         baseDrawOn: c = ( |
             box.
             lineColor.
            | 
            box: baseBounds.
            lineColor: paint named: 'black'.
            isExpanded ifTrue: [ c fillRectangle: box Color: color ].
            c rectangle: box Color: lineColor.
            c line: box topLeft + (0@3) To: box topRight + (0@3) Color: lineColor.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         collapse: evt = ( |
            | isExpanded: false).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTarget: t = ( |
            | copy target: t).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: expandCollapse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         expand: evt = ( |
            | isExpanded: true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            color: (paint named: 'gray') copyBrightness: 0.6.
            setWidth: 10 Height: 10.
            collapse: ui2Event.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         leftMouseDown: evt = ( |
            | target expanderLeftDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: target IsPresentDo: [|:n| target: n].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         middleMouseDown: evt = ( |
            | target expanderMiddleDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'methodExpanderMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'morph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'methodExpanderMorph' -> () From: ( | {
         'Category: mouse\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         rightMouseDown: evt = ( |
            | target expanderRightDown: evt).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'morph' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         isSmallEditorMorph = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         contentsString: s = ( |
            | 
            contentsString = s ifFalse: [
              resend.contentsString: s.
              target userEditedMe.
              self
            ]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         keyDown: e = ( |
             r.
            | 
            r: resend.keyDown: e.
            dropThroughMarker = r
             ifFalse: [target userEditedMe].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'notifyingCommentMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'commentMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> () From: ( | {
         'Category: selection commands\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         paste_cmd = ( |
            | 
            resend.paste_cmd.
            ui2_textBuffer contents isEmpty
              ifFalse: [target userEditedMe].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'notifyingCommentMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         receiver = ( |
            | target receiver).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'penMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         initializePrototype = ( |
            | 
            setImage: ui2Image copyPixelLines: (
                    '                ' &
                    '                ' &
                    '             1  ' &
                    '            111 ' &
                    '           10111' &
                    '          10001 ' &
                    '         10001  ' &
                    '        10001   ' &
                    '       10001    ' &
                    '      10001     ' &
                    ' 11  10001      ' &
                    '1  1 1101       ' &
                    '1  1 111        ' &
                    '    1           ' &
                    '                ' &
                    '                ' ) asVector
                Colors: (
                    (paint named: 'green') &
                    (paint named: 'black') &
                    (paint named: 'black') ) asVector.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'penMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'penMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'penMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         parent* = bootstrap stub -> 'traits' -> 'imageMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         addLabels = ( |
             formalCol.
             kwCol.
             sel.
             w.
            | 
            resend.addLabels.
            sel: slot name asSelector.
            sel isKeyword ifFalse: [^ self].
            "should do width test, but need a world!"
            string size <= maxLinearChars  ifTrue: [^ self].

            removeAllMorphs.
            panel: nil.

            kwCol: columnMorph copy beShrinkWrap rightJustify borderWidth: 0.
            formalCol: kwCol copy leftJustify.

            sel keywords
              with: argumentNames
                Do: [| :kw. :arg |
                  kwCol addMorphLast: labelMorph copyLabel: kw, ' '
                            FontSpec: style fontSpec
                               Color: paint named: 'black'.

                  formalCol addMorphLast: labelMorph copyLabel: arg
                                FontSpec: style fontSpec
                                   Color: paint named: 'black'.
            ].

            addMorphLast: kwCol.
            addMorphLast: formalCol.
            colorAll: color.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         argumentNames = ( |
            | 
            slot exists ifFalse: [^ vector].
            ( slot contents asList copyFilteredBy: [|:s| s isArgument] ) mapBy: [|:s| s name]).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         copySlot: slt Target: tar Accept: accept Style: sty = ( |
            | 
            ((((copy target: tar) slot: slt) accept: accept) style: sty)
              initialize).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         maxLinearChars = 40.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'slotNameEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'smallEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         string = ( |
            | 
            slot exists
              ifTrue: [slot longKey]
               False: '<nonexistent>').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         string: s = ( |
            | 
            editMode: true.
            editor contentsString: s.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'slotNameEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         stringForEditing = ( |
             indent = '  '.
             r <- ''.
             sel.
            | 
            sel: slot name asSelector.
            sel isUnary ifTrue: [^ slot longKey "adds parentPostfix"].
            sel keywords with: argumentNames Do: [|:kw. :a|
              r: r & kw & ' ' & a & '\n' & indent.
            ].
            r: r flatString.
            r copySize: 0 max:  r size - indent size succ).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         allowSubmorphsToGetEvent: evt = ( |
            | 
            "This morph preempts left mouse clicks and double-clicks when closed."

            (isOpen &&
             [(editor      globalBounds includes: evt cursorPoint) ||
              (closeButton globalBounds includes: evt cursorPoint)]) ifTrue: [ ^true ]. 
            (evt leftDoubleClick || evt leftMouseDown) not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: opening/closing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         close = ( |
             c.
            | 
            editor ifNotNil: [
                text: editor contentsString.
                editor: nil.
                closeButton: nil.
            ].
            c: columnMorph copy color: color.
            c borderWidth: 4.
            c addMorph:
                (labelMorph copyLabel: title)
                             fontSpec: globals fontSpec copyName: 'verdana' Size: outlinerPreferences mediumFontSize Style: 'italic'.
            removeAllMorphs.

            "make border be thin, black line when closed"
            borderWidth: 2.
            frameStyle: flatStyle.
            color: (paint named: 'black').
            addMorph: c.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         copyTitle: t = ( |
            | copyTitle: t Text: '').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         copyTitle: t Text: text = ( |
             new.
            | 
            new: copyRemoveAllMorphs beShrinkWrap.
            new color: ((paint named: 'gray') copyBrightness: 0.77).
            new title: t.
            new text:  text.
            new close.
            new).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: opening/closing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         isOpen = ( |
            | 
            "Return true if this postIt is open."
            "Details: If I am open, my editor will be non-nil."

            editor isNotNil).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         leftDoubleClick: evt = ( |
            | 
            isOpen ifTrue: [ close ] False: [ open ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: events\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         leftMouseDown: evt = ( |
            | 
            "Pick up this morph, extracting it from its owner."

            evt sourceHand addMorph: self.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         mapReferencesUsing: dict = ( |
            | 
            dict if: closeButton IsPresentDo: [| :new | closeButton: new ].
            dict if: editor      IsPresentDo: [| :new | editor:      new ].
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: basics\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         morphTypeName = 'textViewerMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'Category: opening/closing\x7fModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         open = ( |
             b.
             c.
             r.
             titleLabel.
            | 
            "get color from first morph (a column) since frame
             itself is black when closed"
            color: paint named: 'lightGray'.
            borderWidth: 3.
            removeAllMorphs.

            b: ui2Button copy color: color.
            b target: self.
            b scriptBlock: [target close].
            closeButton: b.

            editor: uglyTextEditorMorph
                copyString: text Style: (| color = paint |).
            editor color: color.
            editor borderWidth: 3.

            titleLabel:
                (labelMorph copyLabel: title)
                             fontSpec:  globals fontSpec copyName: 'verdana' Size: outlinerPreferences mediumFontSize Style: 'bold'.
            r: rowMorph copy color: color.
            r borderWidth: 0.
            r addAllMorphs: (
                titleLabel                                 &
                (spacerMorph copy color: color) beFlexible &
                b
            ) asVector.

            c: columnMorph copy color: color.
            c borderWidth: 4.
            c addAllMorphs: (
                r                                   &
                (spacerMorph copyV: 4 Color: color) &
                editor
            ) asVector.

            frameStyle: bezelStyle.
            addMorph: c.
            colorAll: color. "fix color of text"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'textViewerMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'frameMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyActivationEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: public'
        
         morphTypeName = 'uglyActivationEditorMorph'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyActivationEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uglyMethodEditorMorph' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uglyActivationEditorMorph' -> () From: ( | {
         'ModuleInfo: Module: outlinerWidgets InitialContents: FollowSlot'
        
         selectionHasChanged = ( |
            | 
            text hasSelection && [(target model methodSelection) = (text insertionPoint # text selectionEnd)]
             ifFalse: [^ activatePanel].
            target model contentsString = text contentsString ifTrue: [^ clearPanel].
            self).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'complexButtonMorph' From: 'ui2/outliner'



 '-- Side effects'

 globals modules outlinerWidgets postFileIn
