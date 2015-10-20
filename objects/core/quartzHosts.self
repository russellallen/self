 '$Revision: 30.1 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: quartzHosts InitialContents: FollowSlot'
        
         quartzHosts = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules quartzHosts.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () From: ( | {
         'ModuleInfo: Module: quartzHosts InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () From: ( | {
         'ModuleInfo: Module: quartzHosts InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () From: ( | {
         'ModuleInfo: Module: quartzHosts InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () From: ( | {
         'ModuleInfo: Module: quartzHosts InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () From: ( | {
         'ModuleInfo: Module: quartzHosts InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 30.1 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'quartzHosts' -> () From: ( | {
         'ModuleInfo: Module: quartzHosts InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: graphical interface\x7fModuleInfo: Module: quartzHosts InitialContents: FollowSlot\x7fVisibility: public'
        
         quartzGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartzGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartzGlobals.
'.
            | ) .
        } | ) 



 '-- Side effects'

 globals modules quartzHosts postFileIn
