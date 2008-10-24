 '$Revision: 1.2 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'liveJava' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: FollowSlot\x7fVisibility: public'
        
         miniparsers = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'liveJava' -> 'miniparsers' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals liveJava miniparsers.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: FollowSlot'
        
         liveJavaMiniparsers = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules liveJavaMiniparsers.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaMiniparsers' -> () From: ( | {
         'ModuleInfo: Module: liveJavaMiniparsers InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules liveJavaMiniparsers postFileIn
