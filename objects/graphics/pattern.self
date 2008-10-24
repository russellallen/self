 'Sun-$Revision: 30.11 $'
 '
Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         abstractPattern = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'abstractPattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals abstractPattern.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractPattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> () From: ( | {
         'Category: graphics\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = bootstrap setObjectAnnotationOf: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: traits pattern.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractPattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'abstractPattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         template <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: InitializeToExpression: (colormapIndexEntry copy index: 0)\x7fVisibility: private'
        
         background = colormapIndexEntry copy index: 0.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         clrChar = 'o'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         copyTemplate: tpl = ( |
            | copy template: tpl).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win = ( |
            | 
            createForPixmap: win bitmap image).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createForPixmap: pix = ( |
            | childResponsibility).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: InitializeToExpression: (colormapIndexEntry copy index: 1)\x7fVisibility: private'
        
         foreground = colormapIndexEntry copy index: 1.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: testing\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         isNull = bootstrap stub -> 'globals' -> 'false' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'bitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         point: pt Color: c GC: gc = ( |
            | 
            gc foreground8Bit: c.
            image drawPoint: pt GC: gc.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         removeExtraChars: line = ( | {
                 'ModuleInfo: Module: pattern InitialContents: FollowSlot'
                
                 r <- ''.
                } 
            | 
            line do: [ | :c | 
                (setChar = c) || [clrChar = c] ifTrue: [ r: r, c ] ].
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         setChar = 'X'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'traits' -> 'pattern' -> () From: ( | {
         'Category: printing\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         statePrintString = ( |
            | template asString).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
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
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals pattern parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createForPixmap: pix = ( |
             macPattern.
             n <- ''.
            | 
            "hack: use reflection and qdGlobals"
            (reflect: macToolboxGlobals patterns)
               findFirst: [|:s| s contents reflectee template = template]
               IfPresent: [|:s| n: s name]
                IfAbsent:  [^error: 'mac pattern hack failed, could not find name'].
            [gray]. "browsing"
            image: n sendTo: macToolbox qdGlobals. "really a mac pattern"
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         patterns = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         black = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns black.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: (\'X\' asTextLines)\x7fVisibility: private'
        
         template <- 'X' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         gray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns gray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         image.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: ( \'Xo
oX\' asTextLines )\x7fVisibility: private'
        
         template <-  'Xo
oX' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         lightGray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns lightGray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         image.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: ( \'Xo
oo
oX
oo\' asTextLines )\x7fVisibility: private'
        
         template <-  'Xo
oo
oX
oo' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win Foreground: fg Background: bg = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         isNull = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         white = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns white.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: (\'o\' asTextLines)\x7fVisibility: private'
        
         template <- 'o' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot'
        
         pattern = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'pattern' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules pattern.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'graphics'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- 'Sun-$Revision: 30.11 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         pattern = bootstrap define: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals abstractPattern copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals pattern.

CopyDowns:
globals abstractPattern. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals pattern parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> () From: ( | {
         'Category: creating\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createForPixmap: pix = ( | {
                 'ModuleInfo: Module: pattern InitialContents: FollowSlot'
                
                 gc.
                }  {
                 'ModuleInfo: Module: pattern InitialContents: FollowSlot'
                
                 height.
                }  {
                 'ModuleInfo: Module: pattern InitialContents: FollowSlot'
                
                 pt.
                }  {
                 'ModuleInfo: Module: pattern InitialContents: FollowSlot'
                
                 width.
                } 
            | 
            height: template numberOfLines.
            width: (template lines
                    copyMappedBy: [ | :line | (removeExtraChars: line) size ])
                   max.
            initializeForPixmap: pix Size: width @ height Depth: 1.
            pt: 0@0.
            "must allocate a 1-bit GC for 1-bit pixmaps"
            gc: xlib graphicsContext createForSameScreenAs: image.
            template lines do: [ | :line |
                (removeExtraChars: line) do: [ | :c |
                    setChar = c  ifTrue: [ point: pt Color: foreground GC: gc ].
                    clrChar = c  ifTrue: [ point: pt Color: background GC: gc ].
                    pt:  pt x successor @ pt y.
                ].
                pt:  0  @  pt y successor.
            ].
            gc delete.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         patterns = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals patterns.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         black = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'black' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals patterns black.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: (\'X\' asTextLines)\x7fVisibility: private'
        
         template <- 'X' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         gray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'gray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals patterns gray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: ( \'Xo
oX\' asTextLines )\x7fVisibility: private'
        
         template <-  'Xo
oX' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         lightGray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'lightGray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals patterns lightGray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: ( \'Xo
oo
oX
oo\' asTextLines )\x7fVisibility: private'
        
         template <-  'Xo
oo
oX
oo' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals patterns null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win Foreground: fg Background: bg = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         isNull = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: public'
        
         white = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'white' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals x11Globals patterns white.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'x11Globals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'x11Globals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: pattern InitialContents: InitializeToExpression: (\'o\' asTextLines)\x7fVisibility: private'
        
         template <- 'o' asTextLines.
        } | ) 



 '-- Side effects'

 globals modules pattern postFileIn
