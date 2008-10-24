 '$Revision: 30.6 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: style objects\x7fModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         styleProto = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent styleProto.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         myModel.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent styleProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot'
        
         acceptButtonStyle = ( |
            | 
            myModel acceptButtonStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot'
        
         cancelButtonStyle = ( |
            | 
            myModel cancelButtonStyle).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> () From: ( | {
         'Comment: used while editing\x7fModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         color = ( |
            | 
            myModel myOutliner color).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         copyModel: m = ( |
            | 
            copy myModel: m).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot'
        
         pluggableStyle = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableStyle.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'pluggableAnnoStyle
pluggableContentsStyle
pluggableTitleStyle
pluggableCommentStyle
pluggableEditStyle
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'pluggableAnnoStyle' From: 'ui2/outliner'
 bootstrap read: 'pluggableContentsStyle' From: 'ui2/outliner'
 bootstrap read: 'pluggableTitleStyle' From: 'ui2/outliner'
 bootstrap read: 'pluggableCommentStyle' From: 'ui2/outliner'
 bootstrap read: 'pluggableEditStyle' From: 'ui2/outliner'



 '-- Side effects'

 globals modules pluggableStyle postFileIn
