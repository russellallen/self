 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot'
        
         uiColorPalette = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'uiColorPalette' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'comment' From:
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'uiColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules uiColorPalette.

CopyDowns:
globals modules init. copy 
SlotsToOmit: comment directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.9 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'uiColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         uiColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 112) green: 134) blue: 170 )\x7fVisibility: public'
        
         arrow <-  ((colormapEntry copy red: 112) green: 134) blue: 170 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 112) green: 134) blue: 170 )\x7fVisibility: public'
        
         arrowPlusTopPlanes <-  ((colormapEntry copy red: 112) green: 134) blue: 170 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 161) green: 180) blue: 171 )\x7fVisibility: public'
        
         background <-  ((colormapEntry copy red: 161) green: 180) blue: 171 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 194) green: 191) blue: 185 )\x7fVisibility: public'
        
         body <-  ((colormapEntry copy red: 194) green: 191) blue: 185 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 126) green: 124) blue: 120 )\x7fVisibility: public'
        
         bodyDark <-  ((colormapEntry copy red: 126) green: 124) blue: 120 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 230) green: 226) blue: 219 )\x7fVisibility: public'
        
         bodyLight <-  ((colormapEntry copy red: 230) green: 226) blue: 219 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: index entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (colormapIndexEntry copy index: 255)\x7fVisibility: public'
        
         ones <- colormapIndexEntry copy index: 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         uiColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 0) green: 0) blue: 0 )\x7fVisibility: public'
        
         text <-  ((colormapEntry copy red: 0) green: 0) blue: 0 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 0) green: 0) blue: 0 )\x7fVisibility: public'
        
         transparent <-  ((colormapEntry copy red: 0) green: 0) blue: 0 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 0) green: 0) blue: 255 )\x7fVisibility: public'
        
         unused <-  ((colormapEntry copy red: 0) green: 0) blue: 255 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiColorPalette' -> () From: ( | {
         'Category: index entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (colormapIndexEntry copy index: 0)\x7fVisibility: public'
        
         zeros <- colormapIndexEntry copy index: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         uiPatternPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiPatternPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiPatternPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         blurArrow <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'lightGray' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         blurBody <- bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'gray' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         uiPatternPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'uiPatternPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits uiPatternPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiPatternPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         clean = ( |
            | 
            zeros: zeros copy.
            ones:  ones  copy.

            transparent: transparent copy.

            background: background copy.
            text:       text       copy.
            body:       body       copy.
            bodyLight:  bodyLight  copy.
            bodyDark:   bodyDark   copy.
            arrow:      arrow      copy.
            unused:     unused  copy.

            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy clean).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'Category: iterating\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         do: block = ( |
            | 
            block value: background With: 'background'.
            block value: text       With: 'text'.
            block value: body       With: 'body'.
            block value: bodyDark   With: 'bodyDark'.
            block value: bodyLight  With: 'bodyLight'.
            block value: arrow      With: 'arrow'.
            block value: unused     With: 'unused').
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         restore = ( |
             fn.
            | 
            fn: preferences uiColorFile.
            (os_file exists: fn) ifTrue: [ ^ restore: fn ].
            "did not find color file"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         restore: filename = ( |
             bv.
             f.
            | 
            bv: byteVector copySize: 21.
            f: os_file openForReading: filename.
            f readInto: bv Count: bv size.

            body red:   bv at: 0.
            body green: bv at: 1.
            body blue:  bv at: 2.
            bodyLight red:   bv at: 3.
            bodyLight green: bv at: 4.
            bodyLight blue:  bv at: 5.
            bodyDark red:   bv at: 6.
            bodyDark green: bv at: 7.
            bodyDark blue:  bv at: 8.
            text red:   bv at: 9.
            text green: bv at: 10.
            text blue:  bv at: 11.
            background red:   bv at: 12.
            background green: bv at: 13.
            background blue:  bv at: 14.
            arrow red:   bv at: 15.
            arrow green: bv at: 16.
            arrow blue:  bv at: 17.
            unused red:   bv at: 18.
            unused green: bv at: 19.
            unused blue:  bv at: 20.

            f close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         save = ( |
            | save: preferences uiColorFile).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         save: filename = ( |
             bv.
             f.
            | 
            bv: byteVector copySize: 21.
            f: os_file openForWriting: filename.

            bv at: 0 Put: body red.
            bv at: 1 Put: body green.
            bv at: 2 Put: body blue.
            bv at: 3 Put: bodyLight red.
            bv at: 4 Put: bodyLight green.
            bv at: 5 Put: bodyLight blue.
            bv at: 6 Put: bodyDark red.    
            bv at: 7 Put: bodyDark green.
            bv at: 8 Put: bodyDark blue.
            bv at: 9 Put: text red.
            bv at: 10 Put: text green.
            bv at: 11 Put: text blue.
            bv at: 12 Put: background red.
            bv at: 13 Put: background green.
            bv at: 14 Put: background blue.
            bv at: 15 Put: arrow red.
            bv at: 16 Put: arrow green.
            bv at: 17 Put: arrow blue.
            bv at: 18 Put: unused red.
            bv at: 19 Put: unused green.
            bv at: 20 Put: unused blue.

            f writeFrom: bv Count: 21.
            f close.
            ('Saved ui colors to file: ', filename, '.') printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         clean = ( |
            | 
            blurBody:  blurBody  copy.
            blurArrow: blurArrow copy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy clean).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         finalize = ( |
            | 
            blurBody  release.
            blurArrow release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeFor: win = ( |
            | 
            blurBody:  ui1GraphicsGlobals patterns      gray createFor: win.
            blurArrow: ui1GraphicsGlobals patterns lightGray createFor: win.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 



 '-- Side effects'

 globals modules uiColorPalette postFileIn
