 '$Revision: 30.6 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> () From: ( | {
         'Category: editing\x7fCategory: editing whole thing\x7fCategory: framework\x7fCategory: appearance\x7fModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         editWholeThingStyleProto = bootstrap define: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingStyleProto' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals generalModel parent styleProto copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingStyleProto' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent editWholeThingStyleProto.

CopyDowns:
globals generalModel parent styleProto. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingStyleProto' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingStyleProto' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals generalModel parent editWholeThingStyleProto parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         fontColor = ( |
            | 
            myModel editWholeThingFontColor).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         fontSpec = ( |
            | 
            myModel editWholeThingFontSpec).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'editWholeThingStyleProto' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'generalModel' -> 'parent' -> 'styleProto' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot'
        
         pluggableEditStyle = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pluggableEditStyle.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2/outliner'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.6 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pluggableEditStyle' -> () From: ( | {
         'ModuleInfo: Module: pluggableEditStyle InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules pluggableEditStyle postFileIn
