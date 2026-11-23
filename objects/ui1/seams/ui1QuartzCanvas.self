 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1QuartzCanvas InitialContents: FollowSlot'

         ui1QuartzCanvas = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1QuartzCanvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1QuartzCanvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1QuartzCanvas.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1QuartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: ui1QuartzCanvas InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1QuartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: ui1QuartzCanvas InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1QuartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: ui1QuartzCanvas InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s quartzCanvas module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1QuartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: ui1QuartzCanvas InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1QuartzCanvas' -> () From: ( | {
         'ModuleInfo: Module: ui1QuartzCanvas InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartzWindowCanvas' -> () From: ( | {
         'Category: accessing quartz objects\x7fComment: Backend-stable name for reopening after a snapshot: a Quartz window
 always reincarnates as Quartz, regardless of which screen it was on
 or whether its window proxy survived the snapshot.  (displayName
 returns the window proxy\'s title, so it can\'t be used here.)
 -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1QuartzCanvas InitialContents: FollowSlot\x7fVisibility: public'
        
         reincarnationDisplayName = ( |
            | 
            'quartz').
        } | ) 



 '-- Side effects'

 globals modules ui1QuartzCanvas postFileIn
