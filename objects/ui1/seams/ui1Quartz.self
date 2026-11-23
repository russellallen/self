 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot'

         ui1Quartz = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Quartz' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Quartz' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Quartz.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: ui1-only slots David Ungar added to self64\'s quartz module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- 'ui1OnQuartzHacks'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         ui1EventSource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'quartz' -> 'ui1EventSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals quartz ui1EventSource.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot'
        
         injectedEvents <- bootstrap stub -> 'globals' -> 'sharedQueue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: last cursor position seen on a mouse event. ui1 is point-to-type (ui1 ui keyDown:String:At:Event: routes to world componentContaining: pos), but keyboard events carry no location -- so we stamp key events with this. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         lastCursor <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot'
        
         ui1EventSource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits quartz ui1EventSource.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: the quartz platformWindow whose Cocoa event queue we drain. -- claude & dmu 5/26\x7fModuleInfo: Module: ui1Quartz InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         platformWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ms to sleep between polls when the queue is empty (ui2 uses 10). -- claude & dmu 5/26\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         pollDelayMS <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ui1 eventSource hook: decode the next native Cocoa event into one shared
uiEvent for ui1 -- the X-masked x11Globals ui2Event, populated by ui1s proven
Quartz decode (setUI1Event:, X-style state). Cocoa key events carry no location,
so stamp them with the last cursor (point-to-type); the native window event
carries no bounds, so fill resize/expose from the platformWindow. Mouse events: the
VM delivers windowMouseLocation structure-relative (Carbon-standard, includes the
title bar), but ui1 draws content-relative (0 at the content top) and uses no
inset_top in any draw path, so we subtract platformWindow insetTop to make input
match drawing. Quartz-only (X has its own convert:); ui1-only (ui2 has its own
converters). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         convert: raw = ( |
             e.
            | 
            e: raw setUI1Event: x11Globals ui2Event copy.
            raw delete.
            e keyEvent    ifTrue: [ e cursorPoint: lastCursor ].
            e windowEvent ifTrue: [ e bounds: (0@0) ## platformWindow size ].
            (e mouseDown || [e mouseUp] || [e mouseMotion]) ifTrue: [
              e cursorPoint: e cursorPoint - (0 @ platformWindow insetTop).
              lastCursor: e cursorPoint ].
            e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         eventsPending = ( |
            | platformWindow eventsPending).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         flush = ( |
            | platformWindow flush. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         forPlatformWindow: pw = ( |
             c.
            | 
            c: copy.
            c platformWindow: pw.
            c injectedEvents: sharedQueue copy.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot'
        
         inject: e = ( |
            | injectedEvents add: e. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'eventSource' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ui1 eventSource hook: no fd to block on, so the shared nextEvent sleep-polls this. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         rawEventsPending = ( |
            | platformWindow eventsPending).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ui1 eventSource hook: fetch the next native Cocoa event (only called once the shared nextEvent has confirmed one is pending). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         rawNextEvent = ( |
            | platformWindow nextEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         syncDiscardingIf: b = ( |
            | platformWindow sync. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: display protocol macWindow forwards here. We flush by converting the indexed shadow at the platformWindow; synchronize is a no-op (the indexed model has nothing to round-trip). -- claude & dmu 5/26\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         synchronize: b = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'quartz' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ui1 occasionally pushes an event back; the Cocoa queue has no putback, so drop it for now (rare path). -- claude & dmu 5/26\x7fModuleInfo: Module: ui1Quartz InitialContents: FollowSlot\x7fVisibility: public'
        
         xPutBackEvent: e = ( |
            | self).
        } | ) 



 '-- Sub parts'

 bootstrap read: 'ui1OnQuartzHacks' From: 'ui1/seams'

 '-- Side effects'

 globals modules ui1Quartz postFileIn
