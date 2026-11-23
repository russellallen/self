 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: allUI1Seams InitialContents: FollowSlot'

         allUI1Seams = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'allUI1Seams' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'allUI1Seams' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules allUI1Seams.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI1Seams' -> () From: ( | {
         'ModuleInfo: Module: allUI1Seams InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI1Seams' -> () From: ( | {
         'ModuleInfo: Module: allUI1Seams InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI1Seams' -> () From: ( | {
         'ModuleInfo: Module: allUI1Seams InitialContents: FollowSlot'

         myComment <- 'ui1-refactor: loads every seam module (additions to self64 objects that ui1 needs).'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI1Seams' -> () From: ( | {
         'ModuleInfo: Module: allUI1Seams InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'allUI1Seams' -> () From: ( | {
         'ModuleInfo: Module: allUI1Seams InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- 'ui1Prefs ui1Hosts ui1Pattern ui1Colormap ui1Quartz ui1Xlib ui1Window ui1UI2Event ui1Canvas ui1QuartzCanvas ui1WorldMorph ui1Desktop ui1Rectangle ui1Bitmap ui1XEvents ui1Morph'.
        } | )





 '-- Sub parts'

 bootstrap read: 'ui1Prefs' From: 'ui1/seams'
 bootstrap read: 'ui1Hosts' From: 'ui1/seams'
 bootstrap read: 'ui1Pattern' From: 'ui1/seams'
 bootstrap read: 'ui1Colormap' From: 'ui1/seams'
 bootstrap read: 'ui1Quartz' From: 'ui1/seams'
 bootstrap read: 'ui1Xlib' From: 'ui1/seams'
 bootstrap read: 'ui1Window' From: 'ui1/seams'
 bootstrap read: 'ui1UI2Event' From: 'ui1/seams'
 bootstrap read: 'ui1Canvas' From: 'ui1/seams'
 bootstrap read: 'ui1QuartzCanvas' From: 'ui1/seams'
 bootstrap read: 'ui1WorldMorph' From: 'ui1/seams'
 bootstrap read: 'ui1Desktop' From: 'ui1/seams'
 bootstrap read: 'ui1Rectangle' From: 'ui1/seams'
 bootstrap read: 'ui1Bitmap' From: 'ui1/seams'
 bootstrap read: 'ui1XEvents' From: 'ui1/seams'
 bootstrap read: 'ui1Morph' From: 'ui1/seams'

 '-- Side effects'

 globals modules allUI1Seams postFileIn
