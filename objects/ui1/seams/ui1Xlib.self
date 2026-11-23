 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot'

         ui1Xlib = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Xlib' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Xlib' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Xlib.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Xlib' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Xlib' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Xlib' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: ui1-only slots David Ungar added to self64\'s xlib module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Xlib' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Xlib' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- 'xPreferencesAdjuster'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> () From: ( | {
         'Category: ui1 input\x7fModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         ui1EventSource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'xlib' -> 'ui1EventSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals xlib ui1EventSource.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot'
        
         injectedEvents <- bootstrap stub -> 'globals' -> 'sharedQueue' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'Comment: last cursor position seen on a mouse event; stamped onto key events
(point-to-type) by copyFrom:LastCursor:. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         lastCursor <- (0)@(0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot'
        
         ui1EventSource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'xlib' -> 'ui1EventSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits xlib ui1EventSource.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'xlib' -> 'ui1EventSource' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ms to sleep between polls when the queue is empty (matches ui2/Quartz). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         pollDelayMS <- 10.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'Comment: the open xlib display whose event queue this source polls. The window
keeps the same display as window.display for colour/gc/font/setup queries; only
the watcher pulls events through this source. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Xlib InitialContents: InitializeToExpression: (nil)\x7fVisibility: public'
        
         xdisplay.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ui1 eventSource hook: convert one native X event into the shared uiEvent
family (x11Globals ui2Event) by REUSING ui2s proven X converter
(copyFrom:LastCursor: -> the native events setUI2Event: -> setFromButtonPress:
etc.). ui1 reads it through the ui1-view aliases (typeName/x/y/newState/...).
copyFrom:LastCursor: stamps key events (no native location) with the last
cursor, so ui1s point-to-type works; we track that from mouse events. Frees the
native event. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         convert: raw = ( |
             e.
            | 
            e: x11Globals ui2Event copyFrom: raw LastCursor: lastCursor.
            raw delete.
            (e mouseDown || [e mouseUp] || [e mouseMotion]) ifTrue: [ lastCursor: e cursorPoint ].
            e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'Comment: build the source wrapping an open xlib display. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         forDisplay: d = ( |
             c.
            | 
            c: copy.
            c xdisplay: d.
            c injectedEvents: sharedQueue copy.
            c).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'eventSource' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ui1 eventSource hook: how many native X events are queued. XPending also
pumps the fd, so the shared nextEvent sleep-polling this sees newly-arrived
events (Option A: X no longer fd-blocks, so injected synthetic events are
noticed too). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         rawEventsPending = ( |
            | xdisplay eventsPending).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'xlib' -> 'ui1EventSource' -> () From: ( | {
         'Comment: ui1 eventSource hook: fetch the next native X event. Only called once the
shared nextEvent has confirmed one is pending, so it returns without
fd-blocking. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Xlib InitialContents: FollowSlot\x7fVisibility: public'
        
         rawNextEvent = ( |
            | xdisplay nextEvent).
        } | ) 

 '-- Sub parts'

 bootstrap read: 'xPreferencesAdjuster' From: 'ui1/seams'

 '-- Side effects'

 globals modules ui1Xlib postFileIn
