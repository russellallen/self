 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Canvas InitialContents: FollowSlot'

         ui1Canvas = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Canvas' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Canvas' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Canvas.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Canvas' -> () From: ( | {
         'ModuleInfo: Module: ui1Canvas InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Canvas' -> () From: ( | {
         'ModuleInfo: Module: ui1Canvas InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Canvas' -> () From: ( | {
         'ModuleInfo: Module: ui1Canvas InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s canvas module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Canvas' -> () From: ( | {
         'ModuleInfo: Module: ui1Canvas InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Canvas' -> () From: ( | {
         'ModuleInfo: Module: ui1Canvas InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractWindowCanvas' -> () From: ( | {
         'Category: portable accessing\x7fModuleInfo: Module: ui1Canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureFrontmost = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fComment: On MacOS27, aka GoldenGate, an XQuartz ui2 window does not receive keystrokes when you click on it
unless the OS is told to frontmost the XQuartz app. -- dmu 6/26\x7fModuleInfo: Module: ui1Canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureFrontmost = ( |
            | 
            platformWindow ensureFrontmost).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xWindowCanvas' -> () From: ( | {
         'Category: portable access\x7fComment: Backend-stable name for reopening after a snapshot: the X display
 name persists in a slot, so an X window reincarnates as X.
 -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Canvas InitialContents: FollowSlot\x7fVisibility: public'
        
         reincarnationDisplayName = ( |
            | 
            display originalName).
        } | ) 



 '-- Side effects'

 globals modules ui1Canvas postFileIn
