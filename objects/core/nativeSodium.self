 '$Revision:$'
 '
Copyright 1992-2014 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: nativeSodium InitialContents: FollowSlot'
        
         nativeSodium = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules nativeSodium.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeSodium InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'core'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeSodium InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeSodium InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeSodium InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeSodium InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision:$'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'nativeSodium' -> () From: ( | {
         'ModuleInfo: Module: nativeSodium InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'native' -> () From: ( | {
         'Category: bindings\x7fModuleInfo: Module: nativeSodium InitialContents: FollowSlot'
        
         sodium = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'native' -> 'sodium' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals native sodium.
'.
            | ) .
        } | ) 



 '-- Side effects'

 globals modules nativeSodium postFileIn
