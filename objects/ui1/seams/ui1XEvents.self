 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1XEvents InitialContents: FollowSlot'

         ui1XEvents = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1XEvents' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1XEvents' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1XEvents.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1XEvents' -> () From: ( | {
         'ModuleInfo: Module: ui1XEvents InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1XEvents' -> () From: ( | {
         'ModuleInfo: Module: ui1XEvents InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1XEvents' -> () From: ( | {
         'ModuleInfo: Module: ui1XEvents InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s xEvents module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1XEvents' -> () From: ( | {
         'ModuleInfo: Module: ui1XEvents InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1XEvents' -> () From: ( | {
         'ModuleInfo: Module: ui1XEvents InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui1XEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         x11KeyCapPressedIfNone: nb = ( |
            | 
            host hasSolaris ifTrue: [
              "Arrow keys"
              keycode =  88  ifTrue: [ ^ keyCaps arrows  down ].
              keycode =  87  ifTrue: [ ^ keyCaps arrows  left ].
              keycode =  89  ifTrue: [ ^ keyCaps arrows  up   ].
              keycode =  86  ifTrue: [ ^ keyCaps arrows  right].

              "Arrow keys on numerical pad"
              keycode =  97  ifTrue: [ ^ keyCaps arrows  down ].
              keycode =  99  ifTrue: [ ^ keyCaps arrows  left ].
              keycode = 103  ifTrue: [ ^ keyCaps arrows  up   ].
              keycode = 101  ifTrue: [ ^ keyCaps arrows  right].

              "The combination arrow keys on the numerical pad"
              keycode = 102 ifTrue: [ ^ keyCaps arrows  upLeft    ].
              keycode = 104 ifTrue: [ ^ keyCaps arrows  upRight   ].
              keycode =  96 ifTrue: [ ^ keyCaps arrows  downLeft  ].
              keycode =  98 ifTrue: [ ^ keyCaps arrows  downRight ].

              keycode =  80 ifTrue: [ ^ keyCaps oddballs insert   ].
              keycode =  82 ifTrue: [ ^ keyCaps oddballs pageUp   ].
              keycode =  85 ifTrue: [ ^ keyCaps oddballs pageDown ].
              keycode =  81 ifTrue: [ ^ keyCaps oddballs home     ].
              keycode =  84 ifTrue: [ ^ keyCaps oddballs end      ].

              "Undo Cut Copy and Paste keys"

              "Note- Undo isn't implemented yet.  Calling it will cause"
              "the system to printLine a message saying so"
              keycode = 129 ifTrue: [ ^ keyCaps oddballs  undo_cmd     ].
              keycode = 131 ifTrue: [ ^ keyCaps oddballs  copy_cmd     ].
              keycode = 132 ifTrue: [ ^ keyCaps oddballs  paste_cmd    ].
              keycode = 130 ifTrue: [ ^ keyCaps oddballs  cut_cmd      ].

            ] False: [

              keycode = 122 ifTrue: [ ^ keyCaps oddballs insert   ].
              keycode = 124 ifTrue: [ ^ keyCaps oddballs pageUp   ].
              keycode = 129 ifTrue: [ ^ keyCaps oddballs pageDown ].
              keycode = 123 ifTrue: [ ^ keyCaps oddballs home     ].
              keycode = 127 ifTrue: [ ^ keyCaps oddballs end      ].

              keycode = 133 ifTrue: [ ^ keyCaps arrows  down  ].
              keycode = 134 ifTrue: [ ^ keyCaps arrows  up    ].
              keycode = 131 ifTrue: [ ^ keyCaps arrows  left  ].
              keycode = 132 ifTrue: [ ^ keyCaps arrows  right ].

            ].

            nb value).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui2XEvent' -> () From: ( | {
         'Category: keyboard Event Handling\x7fModuleInfo: Module: ui1XEvents InitialContents: FollowSlot\x7fVisibility: private'
        
         x11KeyCapsPressed = ( |
            | vector copyAddFirst: x11KeyCapPressedIfNone: [^ vector]).
        } | ) 



 '-- Side effects'

 globals modules ui1XEvents postFileIn
