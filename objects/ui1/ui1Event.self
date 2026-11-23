 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Event InitialContents: FollowSlot'
        
         ui1Event = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Event' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Event' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Event.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Event' -> () From: ( | {
         'ModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Event' -> () From: ( | {
         'ModuleInfo: Module: ui1Event InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Event' -> () From: ( | {
         'ModuleInfo: Module: ui1Event InitialContents: FollowSlot'
        
         myComment <- 'ui1 input-event source contract (shared traits ui1 eventSource).'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Event' -> () From: ( | {
         'ModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.0 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Event' -> () From: ( | {
         'ModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fCategory: Events\x7fComment: Shared event-source contract: the object ui1s eventWatcher pulls events from
(eventWatcher watch = handler event: display nextEvent). Both backends inherit
this nextEvent, which unifies the wait strategy on sleep-polling (X used to
fd-block; we poll like ui2 so synthetic events injected for the autonomous test
harness are noticed): spin on rawEventsPending/injectedEvents, drain any injected
events first, else convert the next native event into one shared uiEvent (the
abstractUI2Event family, which ui1 reads through its ui1-view aliases) and
finishEvent: it. Backends supply rawEventsPending / rawNextEvent / convert:, and
may override finishEvent:. X source: traits xlib ui1EventSource (graphics/
xlib.self). Quartz source: traits quartz ui1EventSource (graphics/quartz.self).
-- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: public'
        
         eventSource = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'eventSource' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 eventSource.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'eventSource' -> () From: ( | {
         'Comment: post-conversion fixup hook; default returns the event unchanged. A backend
may override it (e.g. to track the cursor or fill bounds). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: public'
        
         finishEvent: e = ( |
            | e).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'eventSource' -> () From: ( | {
         'Comment: synthetic events (the ui1 testDriver harness) jump the native queue so the
watcher drains them through the real handler -- no OS input, works on both
backends. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: public'
        
         inject: e = ( |
            | injectedEvents add: e. self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'eventSource' -> () From: ( | {
         'Comment: the seam eventWatcher blocks on. Sleep-poll the native queue (no fd to
block on for Quartz; X is polled too so injected events are seen and the
times-delay lets check_carbon_events pump Cocoa), then return an injected event
if any, else convert the next native event into one shared uiEvent and finish it.
-- claude & dmu 5/2026\x7fModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: public'
        
         nextEvent = ( |
            | 
            [(rawEventsPending = 0) && [injectedEvents isEmpty]] whileTrue: [ times delay: pollDelayMS ].
            injectedEvents isEmpty ifFalse: [ ^ injectedEvents removeFirst ].
            finishEvent: convert: rawNextEvent).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'eventSource' -> () From: ( | {
         'ModuleInfo: Module: ui1Event InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules ui1Event postFileIn
