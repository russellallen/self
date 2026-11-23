 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot'

         ui1UI2Event = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1UI2Event' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1UI2Event' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1UI2Event.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1UI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1UI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui1UI2Event InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1UI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s ui2Event module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1UI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1UI2Event' -> () From: ( | {
         'ModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 button number (1/2/3), folded into the ui2 type. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         button = ( |
            | 
            (leftMouseDown   || [leftMouseUp])   ifTrue: [^ 1].
            (middleMouseDown || [middleMouseUp]) ifTrue: [^ 2].
            (rightMouseDown  || [rightMouseUp])  ifTrue: [^ 3].
            1).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         buttonName = ( |
            | 
            button = 2 ifTrue: [^ 'middle'].
            button = 3 ifTrue: [^ 'right'].
            'left').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: number of remaining expose rects (ui1 expose-collapse reads event count = 0).
The setFrom\xe2\x80\xa6 converters do not set it, so it is always 0 -> ui1 treats each
expose as the last (a harmless extra redraw). A method (not a data slot) so it is
inherited by the per-platform ui2Event prototypes copied down before this slot
existed. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         count = ( |
            | 0).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 deletes events after processing; this is a plain Self object so there
is nothing to free -- the GC handles it. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         delete = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         deleteWindow = ( |
            | windowDelete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 cursor getInfo: skips window events (their fields are bounds, not
cursor state/location). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         hasInputStateInfo = ( |
            | windowEvent not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         hasLocationInfo = ( |
            | windowEvent not).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         height = ( |
            | bounds height).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 close-window predicate. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         isDeleteWindow = ( |
            | windowDelete).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 reads lookupString; ui2 stores keystrokes. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         lookupString = ( |
            | keystrokes).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: X-canonical modifier+button bitmask the ui1 cursor reads (cursor.self masks
it with hardcoded xlib constants: button1=256/2=512/3=1024, control=4, shift=1,
mod1=8). Built from the platform-correct predicates so it is right on every
backend whatever the native state encoding. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         newState = ( |
             s <- 0.
            | 
            leftIsDown                     ifTrue: [s: s || 256].
            middleIsDown                   ifTrue: [s: s || 512].
            rightIsDown                    ifTrue: [s: s || 1024].
            controlIsDown                  ifTrue: [s: s || 4].
            shiftIsDown                    ifTrue: [s: s || 1].
            (metaIsDown || [optionIsDown]) ifTrue: [s: s || 8].
            s).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 dispatches by (typeName,\':\') sendTo: handler, in X vocabulary. Map the
ui2 type to it; anything ui1 has no handler for maps to \'mapNotify\' (the handler
just deletes it -- a harmless no-op). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         typeName = ( |
            | 
            mouseDown    ifTrue: [^ 'buttonPress'].
            mouseUp      ifTrue: [^ 'buttonRelease'].
            mouseMotion  ifTrue: [^ 'motionNotify'].
            keyDown      ifTrue: [^ 'keyPress'].
            keyUp        ifTrue: [^ 'keyRelease'].
            windowResize ifTrue: [^ 'configureNotify'].
            windowExpose ifTrue: [^ 'expose'].
            windowDelete ifTrue: [^ 'clientMessage'].
            'mapNotify').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 reads width/height for configure/expose; ui2 stores bounds. -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         width = ( |
            | bounds width).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fComment: ui1 reads scalar x/y. For mouse/key thats the cursorPoint; for window
events (configure/expose) ui1 wants the rect ORIGIN, which ui2 keeps in bounds
(cursorPoint is 0 there). -- claude & dmu 5/2026\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         x = ( |
            | 
            windowEvent ifTrue: [^ bounds origin x].
            cursorPoint x).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'abstractUI2Event' -> () From: ( | {
         'Category: ui1 view\x7fModuleInfo: Module: ui1UI2Event InitialContents: FollowSlot\x7fVisibility: public'
        
         y = ( |
            | 
            windowEvent ifTrue: [^ bounds origin y].
            cursorPoint y).
        } | ) 



 '-- Side effects'

 globals modules ui1UI2Event postFileIn
