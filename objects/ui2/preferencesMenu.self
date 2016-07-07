 '0.1.0'
 '
Copyright 1992-2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: FollowSlot'
        
         preferencesMenu = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules preferencesMenu.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
            resend.postFileIn.
            worldMorph addBackgroundMenuContributor: preferences.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: InitializeToExpression: (\'0.1.0\')\x7fVisibility: public'
        
         revision <- '0.1.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'preferencesMenu' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'preferences' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: preferencesMenu InitialContents: FollowSlot'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton: ( (ui2Button copy scriptBlock: [event sourceHand attach: preferences asOutliner]) 
                                                 label: 'Preferences' )
                ToGroup: 'about').
        } | ) 



 '-- Side effects'

 globals modules preferencesMenu postFileIn
