 '$Revision: 30.6 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: annotation info\x7fModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         annotationInfoStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'annotationInfoStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'annotationInfoStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent annotationInfoStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'annotationInfoStyleProto' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'annotationInfoStyleProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent annotationInfoStyleProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'annotationInfoStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot'
        
         fontColor = ( |
            | 
            myModel annotationInfoFontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'annotationInfoStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot'
        
         fontSpec = ( |
            | 
            myModel annotationInfoFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'annotationInfoStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot'
        
         pluggableAnnoStyle = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableAnnoStyle.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableAnnoStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableAnnoStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules pluggableAnnoStyle postFileIn
