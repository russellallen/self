 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot'

         ui1Pattern = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Pattern' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1Pattern.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Pattern' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1/seams'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Pattern' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Pattern' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot'

         myComment <- 'ui1-refactor seam: slots David Ungar added to self64\'s pattern module for ui1 on Quartz/X11 (dmu-works-on-Self dmu/cont-ui1-on-quartz). Owned by this tree.'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Pattern' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1Pattern' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | )

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fComment: Fraction of set pixels in the stipple template. Direct maps this through 1-(1-p)^2 to CG alpha. -- grok 08/26/26\x7fModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         stippleAlpha = ( |
             n <- 0.
             on <- 0.
            | 
            template do: [ | :line |
                line do: [ | :c |
                    (setChar = c) || [clrChar = c] ifTrue: [
                        n: n + 1.
                        setChar = c ifTrue: [ on: on + 1 ].
                    ].
                ].
            ].
            n = 0 ifTrue: [ ^ 0.5 ].
            on asFloat / n asFloat).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fComment: 4x4 Bayer dither for density p in 0-1. X11 createFor builds a 1-bit pixmap from the template; Direct counts X pixels as CG alpha. -- grok 08/26/26\x7fModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         setDensity: p = ( |
             bayer.
             lines <- ''.
             thresh.
            | 
            bayer: (0 & 8 & 2 & 10 & 12 & 4 & 14 & 6
                  & 3 & 11 & 1 & 9 & 15 & 7 & 13 & 5) asVector.
            thresh: (((p asFloat max: 0.0) min: 1.0) * 16.0).
            0 to: 3 Do: [ | :y. row <- ''. |
                0 to: 3 Do: [ | :x |
                    ((bayer at: ((y * 4) + x)) asFloat < thresh)
                      ifTrue: [ row: row, 'X' ]
                       False: [ row: row, 'o' ].
                ].
                y = 0 ifTrue: [ lines: row ]
                       False: [ lines: lines, '
', row ].
            ].
            template: lines asTextLines.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = bootstrap define: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractPattern copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals pattern.

CopyDowns:
globals abstractPattern. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals pattern parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( | {
         'Category: creating\x7fComment: Direct has no 1-bit stipple pixmap; alpha comes from template density. -- grok 08/26/26\x7fModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createForPixmap: pix = ( |
            | 
            image: nullImage.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         patterns = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         black = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns black.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (\'X\' asTextLines)\x7fVisibility: private'
        
         template <- 'X' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         gray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns gray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         image.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: ( \'Xo
oX\' asTextLines )\x7fVisibility: private'
        
         template <-  'Xo
oX' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         lightGray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns lightGray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         image.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'Comment: Arrow blur. Was 25% (too faint on sage). 75% on X11 stipple and Direct alpha. -- grok 08/26/26\x7fModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: ( \'XX
Xo\' asTextLines )\x7fVisibility: private'
        
         template <-  'XX
Xo' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win Foreground: fg Background: bg = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         isNull = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         white = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns white.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (\'o\' asTextLines)\x7fVisibility: private'
        
         template <- 'o' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurArrow' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (nullImage)\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurArrow' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurArrow' -> () From: ( | {
         'Comment: Arrow blur. Was 25% (too faint on sage). 75% on X11 stipple and Direct alpha. -- grok 08/26/26\x7fModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: ( \'XX
Xo\' asTextLines )\x7fVisibility: private'
        
         template <-  'XX
Xo' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurBody' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (nullImage)\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurBody' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurBody' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: ( \'Xo
oX\' asTextLines )\x7fVisibility: private'
        
         template <-  'Xo
oX' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         black = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'black' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11Traits patterns black.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (\'X\' asTextLines)\x7fVisibility: private'
        
         template <- 'X' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         gray = bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurBody' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         lightGray = bootstrap stub -> 'globals' -> 'ui1' -> 'uiPatternPalette' -> 'blurArrow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'null' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11Traits patterns null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win Foreground: fg Background: bg = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         isNull = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         white = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'white' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits ui1 graphics x11Traits patterns white.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'ui1' -> 'graphics' -> 'x11Traits' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1Pattern InitialContents: InitializeToExpression: (\'o\' asTextLines)\x7fVisibility: private'
        
         template <- 'o' asTextLines.
        } | ) 



 '-- Side effects'

 globals modules ui1Pattern postFileIn
