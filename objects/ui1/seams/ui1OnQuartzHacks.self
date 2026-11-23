 '$Revision:$'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform dependencies\x7fCategory: graphics\x7fCategory: compatability for ui1 on Quartz\x7fModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot\x7fVisibility: public'
        
         macToolbox = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Comment: ui1 font handling sends macToolbox fontIDAndStruct (e.g. boxSize.self); redirect to the Quartz fontIDAndStruct. -- claude & dmu 5/26\x7fModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot'
        
         fontIDAndStruct = bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Comment: ui1 looks up its platform window in the macToolbox (Carbon) namespace; redirect to the live Quartz platformWindow prototype (callers send it new). -- claude & dmu 5/26\x7fModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot'
        
         platformWindow = bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Comment: ui1 pattern hack sends standard pattern names to macToolbox qdGlobals; redirect to the Quartz placeholder qdGlobals. -- claude & dmu 5/26\x7fModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot'
        
         qdGlobals = bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot'
        
         ui1OnQuartzHacks = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1OnQuartzHacks.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1/seams'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartzHacks InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1OnQuartzHacks' -> () From: ( | {
         'ModuleInfo: Module: ui1OnQuartzHacks InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules ui1OnQuartzHacks postFileIn
