 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot'

         ui1Window = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Window' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Window.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: ui1-only slots David Ungar added to self64\'s window module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: windowing\x7fComment: ui1 only\x7fModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals window.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmap <- bootstrap stub -> 'globals' -> 'windowBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor <- bootstrap stub -> 'globals' -> 'cursor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: private'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'
        
         displayName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: InitializeToExpression: (nil \"simpleEventHandler\")\x7fVisibility: public'
        
         handler <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'A Window'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: InitializeToExpression: (nil)'
        
         platformWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (5)@(5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (200)@(200).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: private'
        
         watcher <- bootstrap stub -> 'globals' -> 'eventWatcher' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1Window InitialContents: FollowSlot\x7fVisibility: private'
        
         watcherProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 '-- Side effects'

 globals modules ui1Window postFileIn
