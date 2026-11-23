 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Rectangle InitialContents: FollowSlot'

         ui1Rectangle = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Rectangle' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Rectangle' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Rectangle.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Rectangle' -> () From: ( | {
         'ModuleInfo: Module: ui1Rectangle InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Rectangle' -> () From: ( | {
         'ModuleInfo: Module: ui1Rectangle InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Rectangle' -> () From: ( | {
         'ModuleInfo: Module: ui1Rectangle InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s rectangle module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Rectangle' -> () From: ( | {
         'ModuleInfo: Module: ui1Rectangle InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Rectangle' -> () From: ( | {
         'ModuleInfo: Module: ui1Rectangle InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'rectangle' -> () From: ( | {
         'Category: stretching\x7fModuleInfo: Module: ui1Rectangle InitialContents: FollowSlot\x7fVisibility: public'
        
         squinch = ( |
            | (shrinkRight: 1) shrinkBottom: 1).
        } | ) 



 '-- Side effects'

 globals modules ui1Rectangle postFileIn
