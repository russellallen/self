 'Sun-$Revision: 30.9 $'
 '
Copyright 1992-2026 AUTHORS.
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

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot'
        
         uiColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'uiColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 uiColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fComment: Forward to ui so ui1 arrowBlur: works from the prompt. Implementation is on traits ui1 ui (lobby parent). -- grok 08/26/26\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowBlur = ( |
            | ui arrowBlur).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fComment: Forward to ui so ui1 arrowBlur: works from the prompt. -- grok 08/26/26\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         arrowBlur: p = ( |
            | ui arrowBlur: p).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         uiPatternPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 uiPatternPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         blurArrow <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurArrow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 uiPatternPalette blurArrow.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         blurBody <- bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurBody' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 uiPatternPalette blurBody.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         uiPatternPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'uiPatternPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 uiPatternPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'uiPatternPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         x11ColormappedColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 x11ColormappedColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 112) green: 134) blue: 170 )\x7fVisibility: public'
        
         arrow <-  ((colormapEntry copy red: 112) green: 134) blue: 170 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 112) green: 134) blue: 170 )\x7fVisibility: public'
        
         arrowPlusTopPlanes <-  ((colormapEntry copy red: 112) green: 134) blue: 170 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 161) green: 180) blue: 171 )\x7fVisibility: public'
        
         background <-  ((colormapEntry copy red: 161) green: 180) blue: 171 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 194) green: 191) blue: 185 )\x7fVisibility: public'
        
         body <-  ((colormapEntry copy red: 194) green: 191) blue: 185 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 126) green: 124) blue: 120 )\x7fVisibility: public'
        
         bodyDark <-  ((colormapEntry copy red: 126) green: 124) blue: 120 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 230) green: 226) blue: 219 )\x7fVisibility: public'
        
         bodyLight <-  ((colormapEntry copy red: 230) green: 226) blue: 219 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: index entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (colormapIndexEntry copy index: 255)\x7fVisibility: public'
        
         ones <- colormapIndexEntry copy index: 255.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         x11ColormappedColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 x11ColormappedColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'x11ColormappedColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 0) green: 0) blue: 0 )\x7fVisibility: public'
        
         text <-  ((colormapEntry copy red: 0) green: 0) blue: 0 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 0) green: 0) blue: 0 )\x7fVisibility: public'
        
         transparent <-  ((colormapEntry copy red: 0) green: 0) blue: 0 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( ((colormapEntry copy red: 0) green: 0) blue: 255 )\x7fVisibility: public'
        
         unused <-  ((colormapEntry copy red: 0) green: 0) blue: 255 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: index entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (colormapIndexEntry copy index: 0)\x7fVisibility: public'
        
         zeros <- colormapIndexEntry copy index: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         x11DirectColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals ui1 x11DirectColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.437928 Green: 0.522972 Blue: 0.663734 )\x7fVisibility: public'
        
         arrow <- paint copyRed: 0.437928 Green: 0.522972 Blue: 0.663734 .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.437928 Green: 0.522972 Blue: 0.663734)\x7fVisibility: public'
        
         arrowPlusTopPlanes <- paint copyRed: 0.437928 Green: 0.522972 Blue: 0.663734.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.628543 Green: 0.702835 Blue: 0.667644)\x7fVisibility: public'
        
         background <- paint copyRed: 0.628543 Green: 0.702835 Blue: 0.667644.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: ( paint copyRed: 0.757576 Green: 0.745846 Blue: 0.722385)\x7fVisibility: public'
        
         body <-  paint copyRed: 0.757576 Green: 0.745846 Blue: 0.722385.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.492669 Green: 0.484848 Blue: 0.469208)\x7fVisibility: public'
        
         bodyDark <- paint copyRed: 0.492669 Green: 0.484848 Blue: 0.469208.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.898338 Green: 0.882698 Blue: 0.855327)\x7fVisibility: public'
        
         bodyLight <- paint copyRed: 0.898338 Green: 0.882698 Blue: 0.855327.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: index entries\x7fComment: indexed ones is index 255 (all bits). Direct mask blit multiplies/screens 0/1 colours, so this must be white, not black like zeros.\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 1.0 Green: 1.0 Blue: 1.0)\x7fVisibility: public'
        
         ones <- paint copyRed: 1.0 Green: 1.0 Blue: 1.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         x11DirectColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 x11DirectColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'x11DirectColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.0 Green: 0.0 Blue: 0.0)\x7fVisibility: public'
        
         text <- paint copyRed: 0.0 Green: 0.0 Blue: 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fComment: alpha 0 so a BGRA body pixmap leaves dest alone (sage through the 3-D corners). RGB 0 with alpha 1 would be opaque black.\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.0 Green: 0.0 Blue: 0.0 Alpha: 0.0)\x7fVisibility: public'
        
         transparent <- paint copyRed: 0.0 Green: 0.0 Blue: 0.0 Alpha: 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: color entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.0 Green: 0.0 Blue: 0.99609)\x7fVisibility: public'
        
         unused <- paint copyRed: 0.0 Green: 0.0 Blue: 0.99609.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: index entries\x7fModuleInfo: Module: uiColorPalette InitialContents: InitializeToExpression: (paint copyRed: 0.0 Green: 0.0 Blue: 0.0)\x7fVisibility: public'
        
         zeros <- paint copyRed: 0.0 Green: 0.0 Blue: 0.0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         clean = ( |
            | 
            blurBody:  blurBody  copy.
            blurArrow: blurArrow copy.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy clean).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         finalize = ( |
            | 
            blurBody  release.
            blurArrow release.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'Comment: Arrow density from preferences arrowBlur (ui1 arrowBlur: p). -- grok 08/26/26\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         initializeFor: win Patterns: patterns = ( |
            | 
            blurBody:  patterns gray createFor: win.
            blurArrow: (patterns lightGray copy setDensity: preferences arrowBlur)
                         createFor: win.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'uiPatternPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot'
        
         x11AbstractColorPalette = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 x11AbstractColorPalette.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> () From: ( | {
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'clonable' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         restore = ( |
             fn.
            | 
            fn: preferences uiColorFile.
            (os_file exists: fn) ifTrue: [ ^ restore: fn ].
            "did not find color file"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         save = ( |
            | save: preferences uiColorFile).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         savedColors = ( |
            | 
            ('body' & 'bodyLight' & 'bodyDark' & 'text' & 'background' & 'arrow' & 'unused') asVector).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
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

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         copy = ( |
            | resend.copy clean).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         restore: filename = ( |
             bv.
             f.
            | 

            bv: byteVector copySize: 21.
            f: os_file openForReading: filename.
            f readInto: bv Count: bv size.

            savedColors do: [|:c. :i. p. r. g. b|
              p: paint copyRed: (bv at: (i * 3) + 0) asFloat / 256 Green: (bv at: (i * 3) + 1)  asFloat / 256 Blue: (bv at: (i * 3) + 2) asFloat / 256.
              message copy receiver: self Selector: c, ':' With: p.

              r: message copy receiver: self Selector: 'red'   With: (i * 3) + 0.
              g: message copy receiver: self Selector: 'green' With: (i * 3) + 1.
              b: message copy receiver: self Selector: 'blue'  With: (i * 3) + 2.

              r send. g send. b send
            ].
            halt.
            f close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11ColormappedColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         save: filename = ( |
             bv.
             f.
            | 
            bv: byteVector copySize: 21.
            f: os_file openForWriting: filename.
            savedColors do: [|:c. :i|
              bv at: 0 + (i * 3) Put: (message copy receiver: self Selector: c) send red.
              bv at: 1 + (i * 3) Put: (message copy receiver: self Selector: c) send green.
              bv at: 2 + (i * 3) Put: (message copy receiver: self Selector: c) send blue.
            ].
            halt.
            f writeFrom: bv Count: 21.
            f close.
            ('Saved ui colors to file: ', filename, '.') printLine.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'ModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'ui1' -> 'x11AbstractColorPalette' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         restore: filename = ( |
             bv.
             colors.
             f.
            | 
            bv: byteVector copySize: 21.
            f: os_file openForReading: filename.
            f readInto: bv Count: bv size.

            savedColors do: [|:c. :i. p. m|
              p: paint copyRed: (bv at: (i * 3) + 0) asFloat / 256 Green: (bv at: (i * 3) + 1)  asFloat / 256 Blue: (bv at: (i * 3) + 2) asFloat / 256.
              m: message copy receiver: self Selector: c, ':' With: p.
              m send
            ].
            halt.
            f close.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'x11DirectColorPalette' -> () From: ( | {
         'Category: filing\x7fModuleInfo: Module: uiColorPalette InitialContents: FollowSlot\x7fVisibility: public'
        
         save: filename = ( |
             bv.
             f.
            | 
            bv: byteVector copySize: 21.
            f: os_file openForWriting: filename.
            savedColors do: [|:c. :i|
              bv at: 0 + (i * 3) Put: (((message copy receiver: self Selector: c) send red   * 1024) / 256) round.
              bv at: 1 + (i * 3) Put: (((message copy receiver: self Selector: c) send green * 1024) / 256) round.
              bv at: 2 + (i * 3) Put: (((message copy receiver: self Selector: c) send blue  * 1024) / 256) round.
            ].
            halt.
            f writeFrom: bv Count: 21.
            f close.
            ('Saved ui colors to file: ', filename, '.') printLine.
            self).
        } | ) 



 '-- Side effects'

 globals modules uiColorPalette postFileIn
