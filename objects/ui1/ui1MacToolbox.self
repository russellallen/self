 'Sun-$Revision: 30.0 $'
 '
Copyright 1992-2026 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: os\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macOSGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macOSGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macOSGlobals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: graphical interface\x7fCategory: graphics\x7fCategory: compatability for ui1 on Quartz\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macToolbox = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Comment: ui1 font handling sends macToolbox fontIDAndStruct (e.g. boxSize.self); redirect to the Quartz fontIDAndStruct. -- claude & dmu 5/26\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot'
        
         fontIDAndStruct = bootstrap stub -> 'globals' -> 'quartz' -> 'fontIDAndStruct' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Comment: ui1 looks up its platform window in the macToolbox (Carbon) namespace; redirect to the live Quartz platformWindow prototype (callers send it new). -- claude & dmu 5/26\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot'
        
         platformWindow = bootstrap stub -> 'globals' -> 'quartz' -> 'platformWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Comment: ui1 pattern hack sends standard pattern names to macToolbox qdGlobals; redirect to the Quartz placeholder qdGlobals. -- claude & dmu 5/26\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot'
        
         qdGlobals = bootstrap stub -> 'globals' -> 'quartz' -> 'qdGlobals' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: platform\x7fCategory: graphical interface\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macToolboxGlobals = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: graphics (ui1)\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
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
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals pattern parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( | {
         'Category: creating\x7fComment: Direct has no 1-bit stipple pixmap; alpha comes from template density. -- grok 08/26/26\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         createForPixmap: pix = ( |
            | 
            image: nullImage.
            self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'pattern' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         patterns = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         black = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns black.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'black' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: (\'X\' asTextLines)\x7fVisibility: private'
        
         template <- 'X' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         gray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns gray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         image.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'gray' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: ( \'Xo
oX\' asTextLines )\x7fVisibility: private'
        
         template <-  'Xo
oX' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         lightGray = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns lightGray.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: (nil)\x7fVisibility: private'
        
         image.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'lightGray' -> () From: ( | {
         'Comment: Arrow blur. Was 25% (too faint on sage). 75% on X11 stipple and Direct alpha. -- grok 08/26/26\x7fModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: ( \'XX
Xo\' asTextLines )\x7fVisibility: private'
        
         template <-  'XX
Xo' asTextLines .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         null = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns null.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         createFor: win Foreground: fg Background: bg = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         isNull = bootstrap stub -> 'globals' -> 'true' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'null' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         release = ( |
            | self).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         white = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals patterns white.
\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         image <- bootstrap stub -> 'globals' -> 'nullImage' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'pattern' -> 'parent' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'patterns' -> 'white' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: (\'o\' asTextLines)\x7fVisibility: private'
        
         template <- 'o' asTextLines.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: windowing\x7fComment: ui1 only\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         window = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals window.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         bitmap <- bootstrap stub -> 'globals' -> 'windowBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         cursor <- bootstrap stub -> 'globals' -> 'cursor' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         display <- bootstrap stub -> 'globals' -> 'xlib' -> 'display' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         displayName <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: (nil \"simpleEventHandler\")\x7fVisibility: public'
        
         handler <- bootstrap stub -> 'globals' -> 'nil' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         name <- 'A Window'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: (nil)'
        
         platformWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         position <- (5)@(5).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         size <- (200)@(200).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         watcher <- bootstrap stub -> 'globals' -> 'eventWatcher' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'window' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         watcherProcess <- bootstrap stub -> 'globals' -> 'process' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot'

         ui1MacToolbox = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'ui1MacToolbox' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'ui1MacToolbox' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules ui1MacToolbox.

CopyDowns:
globals modules init. copy
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1MacToolbox' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'

         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1MacToolbox' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'

         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1MacToolbox' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot'

         myComment <- 'Objects ui1 on Quartz borrows from the classic Mac port: macToolbox, macToolboxGlobals, macOSGlobals and the macOS platform entries.'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1MacToolbox' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'

         revision <- 'Sun-$Revision: 30.0 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'ui1MacToolbox' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'

         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'macOS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osArchitectures macOS.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macOS'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osArchitectures' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'operatingSystem' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         macOS = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals platforms osFamilies macOS.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         globalsForThisOS = ( |
            | 
            macOSGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         graphicsSystemGlobals = ( |
            | macToolboxGlobals).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'Comment: Place-holder.\x7fModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         model = ( |
            | 
            platforms models macs unknown).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: public'
        
         name = 'macOS'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'platforms' -> 'osFamilies' -> 'macOS' -> () From: ( | {
         'ModuleInfo: Module: ui1MacToolbox InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'platforms' -> 'operatingSystem' -> ().
        } | ) 



 '-- Side effects'

 globals modules ui1MacToolbox postFileIn
