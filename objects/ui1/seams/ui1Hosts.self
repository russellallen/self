 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot'

         ui1Hosts = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Hosts' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Hosts' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Hosts.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Hosts' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Hosts' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Hosts' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s hosts module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Hosts' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Hosts' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform dependencies\x7fCategory: os\x7fModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macOSGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macOSGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macOSGlobals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform dependencies\x7fCategory: graphics\x7fModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macToolboxGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'macOS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osArchitectures macOS.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macOS'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'operatingSystem' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osFamilies macOS.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         globalsForThisOS = ( |
            | 
            macOSGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         graphicsSystemGlobals = ( |
            | macToolboxGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'Comment: Place-holder.\x7fModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         model = ( |
            | 
            platforms models macs unknown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macOS'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'operatingSystem' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform dependencies\x7fCategory: graphics\x7fModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         x11Globals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: ui1Hosts InitialContents: FollowSlot\x7fVisibility: public'
        
         xlib = bootstrap stub -> 'globals' -> 'xlib' -> ().
        } | ) 



 '-- Side effects'

 globals modules ui1Hosts postFileIn
