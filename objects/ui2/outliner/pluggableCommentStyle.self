 '$Revision: 30.6 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment button\x7fModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         commentButtonStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent commentButtonStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent commentButtonStyleProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         commentButtonText = ( |
            | myModel commentButtonText).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         fontColor = ( |
            | myModel commentButtonFontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         fontSpec = ( |
            | 
            myModel commentButtonFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentButtonStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: comment\x7fCategory: comment editor\x7fModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         commentStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent commentStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentStyleProto' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentStyleProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent commentStyleProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         fontColor = ( |
            | myModel commentFontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         fontSpec = ( |
            | myModel commentFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'commentStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing contents\x7fModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         contentsEditorStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'contentsEditorStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'contentsEditorStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent contentsEditorStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         pluggableCommentStyle = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableCommentStyle.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableCommentStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableCommentStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules pluggableCommentStyle postFileIn
