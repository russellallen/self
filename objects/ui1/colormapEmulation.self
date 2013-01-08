 '$Revision: 1.4 $'
 '
Copyright 1992-2012 AUTHORS.
See the LICENSE file for license information.
'


 '-- Module body'

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> () From: ( | {
         'Category: windows\x7fModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: public'
        
         virtual8BitPlatformWindow = bootstrap define: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals macToolbox platformWindow deadCopy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox virtual8BitPlatformWindow.

CopyDowns:
globals macToolbox platformWindow. deadCopy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolbox virtual8BitPlatformWindow parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyFrom: aPlatformWindow = ( |
             r.
            | 
            [todo ui1 dmu experimental].
            r: copy platformWindow: aPlatformWindow.
            r shallowPixMap: macToolbox pixMap createForSameScreenAs: aPlatformWindow Size: aPlatformWindow size Depth: 8.
            r).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macToolbox' -> 'platformWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: InitializeToExpression: (nil)'
        
         platformWindow.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolbox' -> 'virtual8BitPlatformWindow' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: InitializeToExpression: (nil)'
        
         shallowPixMap.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> () From: ( | {
         'Category: windowing\x7fModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: public'
        
         virtual8BitWindow = bootstrap define: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals macToolboxGlobals window copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals virtual8BitWindow.

CopyDowns:
globals macToolboxGlobals window. copy 
SlotsToOmit: parent.

'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         directColorBitmap <- bootstrap stub -> 'globals' -> 'windowBitmap' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals macToolboxGlobals virtual8BitWindow parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: public'
        
         copyForWindow: w = ( |
            | 
            [todo ui1 dmu experimental].
            copy initFromWindow: w).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> 'parent' -> () From: ( | {
         'Category: copying\x7fModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         initFromWindow: w = ( |
            | 
            [todo ui1 dmu experimental].
            directColorBitmap: w bitmap.
            bitmap: windowBitmap copyFor: self.
            cursor: w cursor.
            displayName: w displayName.
            handler: w handler.
            name: w name.
            position: w position.
            size: w size.
            platformWindow: w platformWindow.
            virtual8BitMacWin: macToolbox virtual8BitPlatformWindow copyFrom: w platformWindow.
            display: w display.
            watcher: w watcher.
            watcherProcess: w watcherProcess).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'macWindow' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'macToolboxGlobals' -> 'virtual8BitWindow' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: InitializeToExpression: (nil)'
        
         virtual8BitMacWin.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot'
        
         colormapEmulation = bootstrap define: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'directory' From:
             bootstrap remove: 'fileInTimeString' From:
             bootstrap remove: 'myComment' From:
             bootstrap remove: 'postFileIn' From:
             bootstrap remove: 'revision' From:
             bootstrap remove: 'subpartNames' From:
             globals modules init copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals modules colormapEmulation.

CopyDowns:
globals modules init. copy 
SlotsToOmit: directory fileInTimeString myComment postFileIn revision subpartNames.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: public'
        
         directory <- 'ui1'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: InitializeToExpression: (_CurrentTimeString)\x7fVisibility: public'
        
         fileInTimeString <- _CurrentTimeString.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot'
        
         myComment <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot'
        
         postFileIn = ( |
            | resend.postFileIn).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: public'
        
         revision <- '$Revision: 1.4 $'.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'modules' -> 'colormapEmulation' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         subpartNames <- ''.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> () From: ( | {
         'Category: userInterface\x7fModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: public'
        
         uiWorld32 = bootstrap define: bootstrap stub -> 'globals' -> 'uiWorld32' -> () ToBe: bootstrap addSlotsTo: (
             bootstrap remove: 'parent' From:
             globals uiWorld copy ) From: bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiWorld32' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiWorld32.

CopyDowns:
globals uiWorld. copy 
SlotsToOmit: parent.

\x7fIsComplete: '.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiWorld32' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: InitializeToExpression: (nil)'
        
         graphic32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiWorld32' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: InitializeToExpression: (nil)'
        
         offScreen32.
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiWorld32' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap setObjectAnnotationOf: bootstrap stub -> 'globals' -> 'uiWorld32' -> 'parent' -> () From: ( |
             {} = 'ModuleInfo: Creator: globals uiWorld32 parent.
'.
            | ) .
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiWorld32' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         parent* = bootstrap stub -> 'traits' -> 'uiWorld' -> ().
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiWorld32' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot\x7fVisibility: private'
        
         setGraphicAndOffScreen = ( |
            | 
            graphic32: bitmap copyFor: window Size: window size Depth: 32.
            offScreen32: bitmap copyFor: window Size: window size Depth: 32.
            graphic: bitmap copyFor: window Size: window size Depth: 8.
            offScreen: bitmap copyFor: window Size: window size Depth: 8).
        } | ) 

 bootstrap addSlotsTo: bootstrap stub -> 'globals' -> 'uiWorld32' -> 'parent' -> () From: ( | {
         'ModuleInfo: Module: colormapEmulation InitialContents: FollowSlot'
        
         update = ( |
            | 
            [todo ui1 dmu experimental].
            resend.update.
            graphic copy: (0@0)## graphic size To: graphic32).
        } | ) 



 '-- Side effects'

 globals modules colormapEmulation postFileIn
