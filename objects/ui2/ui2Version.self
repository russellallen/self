 '0.1.0'
 '
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'
["preFileIn" self] value


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> () From: ( | {
         'Category: versions\x7fModuleInfo: Module: ui2Version InitialContents: InitializeToExpression: (nil)'
        
         morphic.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'about' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: FollowSlot'
        
         contributeToBackgroundMenu: m = ( |
            | 
            m addButton: ( (ui2Button copy scriptBlock: [event sourceHand attach: event sourceHand world outlinerForMirror: reflect: about]) 
                                                 label: 'About' )
                ToGroup: 'usefulObjects').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: FollowSlot'
        
         ui2Version = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'copyright' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui2Version.

CopyDowns:
globals modules init. copy 
SlotsToOmit: copyright directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( | {
         'Category: state\x7fModuleInfo: Module: ui2Version InitialContents: InitializeToExpression: (\'
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
\')\x7fVisibility: public'
        
         copyright <- '
Copyright 2016 AUTHORS.
See the legal/LICENSE file for license information and legal/AUTHORS for authors.
'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui2'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: FollowSlot'
        
         postFileIn = ( |
            | 
             resend.postFileIn.
            about morphic: about systemVersion readFrom: 'morphic.version'.
            worldMorph addBackgroundMenuContributor: about.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: InitializeToExpression: (\'0.1.0\')\x7fVisibility: public'
        
         revision <- '0.1.0'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui2Version' -> () From: ( | {
         'ModuleInfo: Module: ui2Version InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 



 '-- Side effects'

 globals modules ui2Version postFileIn
