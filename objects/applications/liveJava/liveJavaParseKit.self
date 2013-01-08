 '$Revision: 1.2 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: liveJavaParseKit InitialContents: FollowSlot'
        
         liveJavaParseKit = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules liveJavaParseKit.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () From: ( | {
         'ModuleInfo: Module: liveJavaParseKit InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'applications/liveJava'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () From: ( | {
         'ModuleInfo: Module: liveJavaParseKit InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () From: ( | {
         'ModuleInfo: Module: liveJavaParseKit InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () From: ( | {
         'ModuleInfo: Module: liveJavaParseKit InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () From: ( | {
         'ModuleInfo: Module: liveJavaParseKit InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.2 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'liveJavaParseKit' -> () From: ( | {
         'ModuleInfo: Module: liveJavaParseKit InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- 'liveJavaExtensions
'.
        } | ) 



 '-- Sub parts'

 bootstrap read: 'liveJavaExtensions' From: 'applications/liveJava'



 '-- Side effects'

 globals modules liveJavaParseKit postFileIn
