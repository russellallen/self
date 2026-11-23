 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface
ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         testDriver = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'testDriver' -> () From: ( |
             {} = 'Comment: Drives ui1 autonomously by injecting synthetic ui1Events into a window
event source (quartz ui1 eventSource / the future X source -- anything with
inject:). No host input, no Accessibility, no real cursor: feeds the SAME
real dispatch path (source -> watcher -> handler event: -> world) that live
clicks/keys do. forUI: a-ui1 ui -> a driver; clickAt:/moveTo:/type:/typeAt:String:
do the work; componentAt: helps write state assertions. -- claude & dmu 5/2026
ModuleInfo: Creator: globals ui1 testDriver.
IsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         lastPt <- 0 @ 0.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> ().
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: the event source we inject into (a-ui1 ui window display).
ModuleInfo: Module: ui1TestDriver InitialContents: InitializeToExpression: (nil)'

         source.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: the ui1 instance this driver drives (ui1 ui, or ui1 ui copy for a 2nd window).
ModuleInfo: Module: ui1TestDriver InitialContents: InitializeToExpression: (nil)'

         theUI.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         testDriver = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 testDriver.
'.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: make a driver for a started ui1 (call after aUI startOn:).
ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         forUI: aUI = ( |
             d.
            |
            d: copy.
            d theUI: aUI.
            d source: aUI window watcher display. "the watchers event source (the ui1 eventSource); on X window display is the raw xlib connection -- claude & dmu 5/2026"
            d).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         moveTo: pt = ( |
             e.
            |
            e: x11Globals ui2Event copy.
            e type: 'mouseMotion'.
            e cursorPoint: pt. e state: 0.
            lastPt: pt.
            source inject: e.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: X-style state: button1 mask (256) is set on press (post-transition), clear on release.
ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         pressAt: pt = ( |
             e.
            |
            e: x11Globals ui2Event copy.
            e type: 'leftMouseDown'.
            e cursorPoint: pt. e state: 256.
            lastPt: pt.
            source inject: e.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         releaseAt: pt = ( |
             e.
            |
            e: x11Globals ui2Event copy.
            e type: 'leftMouseUp'.
            e cursorPoint: pt. e state: 0.
            lastPt: pt.
            source inject: e.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: a full left click (move, press, release) at pt.
ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         clickAt: pt = ( |
            |
            moveTo: pt.
            pressAt: pt.
            releaseAt: pt.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: one keystroke (a 1-char string) at the last cursor point (ui1 is point-to-type).
ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         key: s = ( |
             e.
            |
            e: x11Globals ui2Event copy.
            e type: 'keyDown'.
            e cursorPoint: lastPt.
            e keycode: 0. e keystrokes: s.
            source inject: e.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         type: str = ( |
            |
            str do: [| :ch | key: ch asString ].
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: hover pt then type str there (point-to-type lands under the cursor).
ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         typeAt: pt String: str = ( |
            |
            moveTo: pt.
            type: str.
            self).
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'testDriver' -> () From: ( | {
         'Comment: the ui1 component under pt -- for writing state assertions.
ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         componentAt: pt = ( |
            |
            theUI world componentContaining: pt).
        } | )



 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         testDriver = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1TestDriver' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1TestDriver' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1TestDriver.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1TestDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1TestDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1TestDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot'

         myComment <- 'autonomous synthetic-input driver for testing ui1.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1TestDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1TestDriver' -> () From: ( | {
         'ModuleInfo: Module: ui1TestDriver InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )



 '-- Side effects'

 globals modules ui1TestDriver postFileIn
