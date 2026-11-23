 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot'

         ui1WorldMorph = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1WorldMorph' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1WorldMorph' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1WorldMorph.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1WorldMorph' -> () From: ( | {
         'ModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1WorldMorph' -> () From: ( | {
         'ModuleInfo: Module: ui1WorldMorph InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1WorldMorph' -> () From: ( | {
         'ModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s worldMorph module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1WorldMorph' -> () From: ( | {
         'ModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1WorldMorph' -> () From: ( | {
         'ModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fComment: True if an X11 display connection can be opened. Checks the dylib first on macOS so a weak NULL XOpenDisplay is never called. Non-interactive, unlike openDisplayNamed:. -- claude & grok & dmu 5/26, 8/26\x7fModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         canOpenXDisplay: dispName = ( |
             d.
            | 
            xlib display libraryPresent ifFalse: [^ false].
            d: xlib display open: dispName IfFail: [| :e | ^ false].
            d close.
            true).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot\x7fVisibility: public'
        
         ensureFrontmostForHand: sourceHand = ( |
             wc.
            | 
            (snapshotAction commandLine includes: '-headless') ifTrue: [^ self].
            wc: winCanvasForHand: sourceHand IfAbsent: [^ self].
            wc ensureFrontmost.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fComment: The first time per session that an X open fails and we drop to Quartz, point
the user at the readme. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         noteXFallbackToReadmeOnce = ( |
            | 
            desktop xFallbackNoticeShown ifTrue: [^ self].
            desktop xFallbackNoticeShown: true.
            ('Could not open X11; using Quartz. To run the UI under X11 see ',
             '"Running the UI under X11 (XQuartz) on macOS" in readme.md. ',
             '-- claude & dmu 5/2026') printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'worldMorph' -> () From: ( | {
         'Category: window management\x7fComment: macOS backup for launchd on-demand start: print a short notice, launch XQuartz, then retry opening dispName for a few seconds. Skipped when headless.
Returns whether X became openable. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1WorldMorph InitialContents: FollowSlot\x7fVisibility: private'
        
         startXQuartzAndCanOpen: dispName = ( |
            | 
            (snapshotAction commandLine includes: '-headless') ifTrue: [^ false].
            'Starting X11 (XQuartz)...' printLine.
            os command: 'open -a XQuartz' IfFail: [|:e| ^ false].
            6 do: [
              process this sleep: 700.
              (canOpenXDisplay: dispName) ifTrue: [^ true].
            ].
            false).
        } | ) 



 '-- Side effects'

 globals modules ui1WorldMorph postFileIn
